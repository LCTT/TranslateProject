Linux Kernel Testing and Debugging
================================================================================
### Auto Testing Tools ###

There are several automated testing tools and test infrastructures that you can chose from based on your specific testing needs. This section is intended to be a brief overview and not a detailed guide on how to use each of these. 

#### [AuToTest][1] ####

> Autotest is a framework for fully automated testing. It is designed primarily to test the Linux kernel, though it is useful for many other functions such as qualifying new hardware. It is an open source project under the GPL. Autotest works in server-client mode. Autotest server can be configured to initiate, run, and monitor tests on several target systems running the autotest client. Autotest client can be run manually on a target system or via the server. Using this framework, new test cases can be added. Please [Autotest White Paper][2] for more information.

#### Linaro Automated Validation Architecture ####

> LAVA-Test Automated Testing Framework is a framework to help with automated installation and executions of tests. For example, running LTP in LAVA framework can be accomplished with a few commands. Running lava-test tool to install LTP will automatically install any dependencies, download the source for the recent release of LTP, compile it, and install the binaries in a self-contained area so that they can be removed easily when user runs uninstall. At this point running lava-test run with ltp test option will execute LTP tests and save results with an unique id that includes the test name, time/date stamp of the test execution. These results are saved for future reference. This is a good feature to find regressions, if any, between test runs. Summary of commands to run as an example: 

Show a list of tests supported by lava-test:

    lava-test list-tests 

Install a new test:

    lava-test install ltp 

Run the test:

    lava-test run ltp 

Check results:

    lava-test results show ltp-timestamp.0 

Remove tests:

    lava-test uninstall ltp 

### Kernel Debug Features ###

Linux kernel includes several debugging features such as kmemcheck and kmemleak.

#### kmemcheck ####

> kmemcheck is a dynamic checking tool that detects and warns about some uses of uninitialized memory. It serves the same function as Valgrind's memcheck which is a userspace memory checker, where as kmemcheck checks kernel memory. CONFIG_KMEMCHECK kernel configuration option enables the kmemcheck debugging feature. Please read the Documentation/kmemcheck.txt for information on how to configure and use this feature, and how to interpret the reported results.

#### kmemleak ####

> kmemleak can be used to detect possible kernel memory leaks in a way similar to a tracing garbage collector. The difference between the tracing garbage collector and kmemleak is that the latter doesn't free orphan objects, instead it reports them in /sys/kernel/debug/kmemleak. A similar method of reporting and not freeing is used by the Valgrind's memcheck --leak-check to detect memory leaks in user-space applications. CONFIG_DEBUG_KMEMLEAK kernel configuration option enables the kmemleak debugging feature. Please read the Documentation/kmemleak.txt for information on how to configure and use this feature, and how to interpret the reported results. 

### Kernel Debug Interfaces ###

Linux kernel has support for static and dynamic debugging via configuration options, debug APIs, interfaces, and frameworks. Let's learn more about each of these starting with the static options.

### Debug Configuration Options - Static ###

Linux kernel core and several Linux kernel modules, if not all, include kernel configuration options to debug. Several of these static debug options can be enabled at compile time. Debug messages are logged in dmesg buffer.

### Debug APIs ###

An example of Debug APIs is DMA-debug which is desiged for debugging driver dma api usage errors. When enabled, it keeps track of dma mappings per device, detects unmap attempts on addresses that aren't mapped, and missing mapping error checks in driver code after dma map attempts. CONFIG_HAVE_DMA_API_DEBUG and CONFIG_DMA_API_DEBUG kernel configuration options enable this feature on architectures that provide the support. With the CONFIG_DMA_API_DEBUG option enabled, the Debug-dma interfaces are called from DMA API. For example, when a driver calls dma_map_page() to map a dma buffer, dma_map_page() will call debug_dma_map_page() to start tracking the buffer until it gets released via dma_unmap_page() at a later time. For further reading on [Detecting silent data corruptions and memory leaks using DMA Debug API ][3]

### Dynamic Debug ###

Dynamic debug feature allows dynamically enabling/disabling pr_debug(), dev_dbg(), print_hex_dump_debug(), print_hex_dump_bytes() per-callsite. What this means is, a specific debug message can be enabled at run-time to learn more about a problem that is observed. This is great because, there is no need to re-compile the kernel with debug options enabled, then install the new kernel, only to find that the problem is no longer reproduciable. Once CONFIG_DYNAMIC_DEBUG is enabled in the kernel, dynamic debug feature enables a fine grain enable/disable of debug messages. /sys/kernel/debug/dynamic_debug/control is used to specify which pr_* messages are enabled. A quick summary of how to enable dynamic debug per call level, per module level is as follows:

Enable pr_debug() in kernel/power/suspend.c at line 340: 

    echo 'file suspend.c line 340 +p' > /sys/kernel/debug/dynamic_debug/control

Enable dynamic debug feature in a module at module load time

> Pass in dyndbg="plmft" to modprobe at the time module is being loaded. 

Enable dynamic debug feature in a module to persist across reboots

> create or change modname.conf file in /etc/modprobe.d/ to add dyndbg="plmft" option. However for drivers that get loaded from initramfs, changing modname.conf is insufficient for the dynamic debug feature to persist across reboot. For such drivers, change grub to pass in module.dyndbg="+plmft" as a module option as a kernel boot parameter.

dynamic_debug.verbose=1 kernel boot option increases the verbosity of dynamic debug messages. Please consult the Documentation/dynamic-debug-howto.txt for more information on this feature. 

### Tracepoints ###

So far we talked about various static and dynamic debug features. Both static debug options and debug hooks such as the DMA Debug API are either enabled or disabled at compile time. Both of these options require a new kernel to be compiled and installed. The dynamic debug feature eliminates the need for a recompile, however the debug code is compiled in with a conditional variable that controls whether or not the debug message gets printed. It helps that the messages can be enabled at run-time, however, the conditional code is executed at run-time to determine if the message needs to be printed. Tracepoint code on the otherhand can be triggered to be included at run-time only when the tracepoint is enabled. In other words, tracepoint code is different in that, it is inactive unless it is enabled. When it is enabled, code is modified to include the tracepoint code. It doesn't add any conditional logic overhead to determine whether or not to generate a trace message.

Please read [Tips on how to implement good tracepoint code][4] for more insight into how tracing works. 

### Tracepoint mechanism ###

The tracepoints use jump-labels which is a code modification of a branch.

When it is disabled, the code path looks like: 

    [ code ]
    nop
    back:
    [ code ]
    return;
    tracepoint:
    [ tracepoint code ]
    jmp back;

When it is enabled, the code path looks like: (notice how the tracepoint code appears in the code path below) 

    [ code ]
    jmp tracepoint
    back:
    [ code ]
    return;
    tracepoint:
    [ tracepoint code ]
    jmp back;

### Linux PM Sub-system Testing ###

Using debug, dynamic debug, and tracing, let's run a few suspend to disk PM tests. When system is suspended, kernel creates hibernation image on disk, suspends and uses the image to restore the systerm state at resume time.

Enable logging time it takes to suspend and resume each device

    echo 1 > /sys/power/pm_print_times

Run suspend to disk test in reboot mode

    echo reboot > /sys/power/disk
    echo disk > /sys/power/state

Run suspend to disk test in shutdown mode - same as reboot, except requires powering on to resume

    echo shutdown > /sys/power/disk
    echo disk > /sys/power/state

Run suspend to disk test in platform mode - more extensive and tests BIOS suspend and resume paths e.g: ACPI methods will be invoked. This is the recommended mode for hibernation so BIOS is informed and aware of suspend/resume action.

    echo platform > /sys/power/disk
    echo disk > /sys/power/state

--------------------------------------------------------------------------------

via:http://www.linuxjournal.com/content/linux-kernel-testing-and-debugging?page=0,3 

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://autotest.github.io/
[2]:https://github.com/autotest/autotest/wiki/WhitePaper
[3]:http://events.linuxfoundation.org/sites/events/files/slides/Shuah_Khan_dma_map_error.pdf
[4]:http://www.linuxjournal.com/content/july-2013-linux-kernel-news