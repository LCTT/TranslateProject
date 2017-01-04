

beyondworld 翻译中
# Suspend to Idle

### Introduction

The Linux kernel supports a variety of sleep states.  These states provide power savings by placing the various parts of the system into low power modes.  The four sleep states are suspend to idle, power-on standby (standby), suspend to ram, and suspend to disk.  These are also referred to sometimes by their ACPI state: S0, S1, S3, and S4, respectively.  Suspend to idle is purely software driven and involves keeping the CPUs in their deepest idle state as much as possible.  Power-on standby involves placing devices in low power states and powering off all non-boot CPUs.  Suspend to ram takes this further by powering off all CPUs and putting the memory into self-refresh.  Lastly, suspend to disk gets the greatest power savings through powering off as much of the system as possible, including the memory.  The contents of memory are written to disk, and on resume this is read back into memory.

This blog post focuses on the implementation of suspend to idle.  As described above, suspend to idle is a software implemented sleep state.  The system goes through a normal platform suspend where it freezes the user space and puts peripherals into low-power states.  However, instead of powering off and hotplugging out CPUs, the system is quiesced and forced into an idle cpu state.  With peripherals in low power mode, no IRQs should occur, aside from wake related irqs.  These wake irqs could be timers set to wake the system (RTC, generic timers, etc), or other sources like power buttons, USB, and other peripherals.

During freeze, a special cpuidle function is called as processors enter idle.  This enter_freeze() function can be as simple as calling the cpuidle enter() function, or can be much more complex.  The complexity of the function is dependent on the SoCs requirements and methods for placing the SoC into lower power modes.

### Prerequisites

### Platform suspend_ops

Typically, to support S2I, a system must implement a platform_suspend_ops and provide at least minimal suspend support.  This meant filling in at least the valid() function in the platform_suspend_ops.  If suspend-to-idle and suspend-to-ram was to be supported, the suspend_valid_only_mem would be used for the valid function.

Recently, however, automatic support for S2I was added to the kernel.  Sudeep Holla proposed a change that would provide S2I support on systems without requiring the implementation of platform_suspend_ops.  This patch set was accepted and will be part of the 4.9 release.  The patch can be found at:  [https://lkml.org/lkml/2016/8/19/474][1]

With suspend_ops defined, the system will report the valid platform suspend states when the /sys/power/state is read.

```
# cat /sys/power/state
```

freeze mem_

This example shows that both S0 (suspend to idle) and S3 (suspend to ram) are supported on this platform.  With Sudeep’s change, only freeze will show up for platforms which do not implement platform_suspend_ops.

### Wake IRQ support

Once the system is placed into a sleep state, the system must receive wake events which will resume the system.  These wake events are generated from devices on the system.  It is important to make sure that device drivers utilize wake irqs and configure themselves to generate wake events upon receiving wake irqs.  If wake devices are not identified properly, the system will take the interrupt and then go back to sleep and will not resume.

Once devices implement proper wake API usage, they can be used to generate wake events.  Make sure DT files also specify wake sources properly.  An example of configuring a wakeup-source is the following (arch/arm/boot/dst/am335x-evm.dts):

```
    gpio_keys: volume_keys@0 {__
               compatible = “gpio-keys”;
               #address-cells = <1>;
               #size-cells = <0>;
               autorepeat;

               switch@9 {
                       label = “volume-up”;
                       linux,code = <115>;
                       gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
                       wakeup-source;
               };

               switch@10 {
                       label = “volume-down”;
                       linux,code = <114>;
                       gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
                       wakeup-source;
               };
       };
```

As you can see, two gpio keys are defined to be wakeup-sources.  Either of these keys, when pressed, would generate a wake event during suspend.

An alternative to DT configuration is if the device driver itself configures wake support in the code using the typical wakeup facilities.

### Implementation

### Freeze function

Systems should define a enter_freeze() function in their cpuidle driver if they want to take full advantage of suspend to idle.  The enter_freeze() function uses a slightly different function prototype than the enter() function.  As such, you can’t just specify the enter() for both enter and enter_freeze.  At a minimum, it will directly call the enter() function.  If no enter_freeze() is specified, the suspend will occur, but the extra things that would have occurred if enter_freeze() was present, like tick_freeze() and stop_critical_timings(), will not occur.  This results in timer IRQs waking up the system.  This will not result in a resume, as the system will go back into suspend after handling the IRQ.

During suspend, minimal interrupts should occur (ideally none).

The picture below shows a plot of power usage vs time.  The two spikes on the graph are the suspend and the resume.  The small periodic spikes before and after the suspend are the system exiting idle to do bookkeeping operations, scheduling tasks, and handling timers.  It takes a certain period of time for the system to go back into the deeper idle state due to latency.

 ![blog-picture-one](http://www.linaro.org/wp-content/uploads/2016/10/blog-picture-one-1024x767.png) 
Power Usage Time Progression

The ftrace capture shown below displays the activity on the 4 CPUs before, during, and after the suspend/resume operation.  As you can see, during the suspend, no IPIs or IRQs are handled.  

 ![blog-picture-2](http://www.linaro.org/wp-content/uploads/2016/10/blog-picture-2-1024x577.png) 

Ftrace capture of Suspend/Resume

### Idle State Support

You must determine which idle states support freeze.  During freeze, the power code will determine the deepest idle state that supports freeze.  This is done by iterating through the idle states and looking for which states have defined enter_freeze().  The cpuidle driver or SoC specific suspend code must determine which idle states should implement freeze and it must configure them by specifying the freeze function for all applicable idle states for each cpu.

As an example, the Qualcomm platform will set the enter_freeze function during the suspend init function in the platform suspend code.  This is done after the cpuidle driver is initialized so that all structures are defined and in place.

### Driver support for Suspend/Resume

You may encounter buggy drivers during your first successful suspend operation.  Many drivers have not had robust testing of suspend/resume paths.  You may even find that suspend may not have much to do because pm_runtime has already done everything you would have done in the suspend.  Because the user space is frozen, the devices should already be idled and pm_runtime disabled.

### Testing

Testing for suspend to idle can be done either manually, or through using something that does an auto suspend (script/process/etc), auto sleep or through something like Android where if a wakelock is not held the system continuously tried to suspend.  If done manually, the following will place the system in freeze:

```
/ # echo freeze > /sys/power/state
[  142.580832] PM: Syncing filesystems … done.
[  142.583977] Freezing user space processes … (elapsed 0.001 seconds) done.
[  142.591164] Double checking all user space processes after OOM killer disable… (elapsed 0.000 seconds)
[  142.600444] Freezing remaining freezable tasks … (elapsed 0.001 seconds) done._
_[  142.608073] Suspending console(s) (use no_console_suspend to debug)
[  142.708787] mmc1: Reset 0x1 never completed.
[  142.710608] msm_otg 78d9000.phy: USB in low power mode
[  142.711379] PM: suspend of devices complete after 102.883 msecs
[  142.712162] PM: late suspend of devices complete after 0.773 msecs
[  142.712607] PM: noirq suspend of devices complete after 0.438 msecs
< system suspended >
….
< wake irq triggered >
[  147.700522] PM: noirq resume of devices complete after 0.216 msecs
[  147.701004] PM: early resume of devices complete after 0.353 msecs
[  147.701636] msm_otg 78d9000.phy: USB exited from low power mode
[  147.704492] PM: resume of devices complete after 3.479 msecs
[  147.835599] Restarting tasks … done.
/ #
```

In the above example, it should be noted that the MMC driver was responsible for 100ms of that 102.883ms.  Some device drivers will still have work to do when suspending.  This may be flushing of data out to disk or other tasks which take some time.

If the system has freeze defined, it will try to suspend the system.  If it does not have freeze capabilities, you will see the following:

```
/ # echo freeze > /sys/power/state 
sh: write error: Invalid argument
/ #
```

### Future Developments

There are two areas where work is currently being done on Suspend to Idle on ARM platforms.  The first area was mentioned earlier in the platform_suspend_ops prerequisite section.  The work to always allow for the freeze state was accepted and will be part of the 4.9 kernel.  The other area that is being worked on is the freeze_function support.

The freeze_function implementation is currently required if you want the best response/performance.  However, since most SoCs will use the ARM cpuidle driver, it makes sense for the ARM cpuidle driver to implement its own generic freeze_function.  And in fact, ARM is working to add this generic support.  A SoC vendor should only have to implement specialized freeze_functions if they implement their own cpuidle driver or require additional provisioning before entering their deepest freezable idle state.

--------------------------------------------------------------------------------

via: http://www.linaro.org/blog/suspend-to-idle/

作者：[Andy Gross][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linaro.org/author/andygross/
[1]:https://lkml.org/lkml/2016/8/19/474
