09 The Linux Kernel: Configuring the Kernel Part 5
================================================================================
![](http://www.linux.org/attachments/slide-jpeg.428/)

The Linux kernel is large with numerous features that can be configured. There are still many more features that can be configured.

The next kernel feature that can be configured is a x86 random number generator (x86 architectural random number generator (ARCH_RANDOM)). Remember, we are configuring the kernel source code for an AMD64 system. This number generator uses the x86 RDRAND instructions for Intel processors. It is not necessary for general use, so I will disable this for a more lightweight kernel.

Next, we can enable or disable "Supervisor Mode Access Prevention (X86_SMAP)". This is a security feature used by some Intel processors. SMAP will only allow the kernel to access user-space in some instances. This helps to protect user-space. There is a performance and size cost if enabled, but the cost is small. Since I am configuring for an AMD system, I will disable this feature.


Developers can enable "EFI runtime service support (EFI)". Only enable this on systems with EFI firmware. With this feature, the kernel can use available EFI services. EFI is a specification of how the operating system interacts with the hardware, so EFI firmware is hardware code that uses this specification. I disabled the support since I do not have a system with EFI firmware.

This is a useful security method that should be enabled (Enable seccomp to safely compute untrusted bytecode (SECCOMP)). This security feature is used with number crunching applications (software that performs extensive calculations) that use untrusted bytecode. Bytecode (p-code/portable code) is code that is made to be read efficiently by an interpreter. Bytecode is not source code, but it is not assembly or binary code either. Untrusted code is code that may cause system/data damage. The untrusted bytecode that may ruin the system or harm data are isolated in a separate address space via seccomp. This is done by using file descriptors as methods of transport. In general, it is best to enable security features even at the cost of performance unless you are making a kernel that absolutely needs incredible performance abilities.

Here is another security feature (Enable -fstack-protector buffer overflow detection (CC_STACKPROTECTOR)). A buffer overflow (buffer overrun) is where data is written past its memory boundary and into adjacent memory. This can be a security threat. Some malware uses buffer overruns to exploit systems. Enabling this will use the "-fstack-protector" GCC parameter. GCC is a Linux compiler; this compiler will compile the kernel when you are done configuring the options. This compiler parameter will add a canary value (special security code) on the stack just before the return address. The value is validated before the return. When a buffer overflow occurs, the canary value will get overwritten. When this happens, a kernel panic is initiated. As many know, a kernel panic means the system will crash, but that is better than the system or data being permanently ruined. With a kernel panic, the system can be rebooted, but if a buffer overrun gains a chance to damage the system, a simple reboot will not fix the destruction. You must compile the kernel with GCC version 4.2 or higher to support the parameter.

NOTE: To figure out what version you have, type “gcc --version” in the command-line.

After that, we can configure the timer frequency. The configuration tool recommends 250Hz, so we will use that value.

Timer frequency
1. 100 HZ (HZ_100)
> 2. 250 HZ (HZ_250)
3. 300 HZ (HZ_300)
4. 1000 HZ (HZ_1000)
choice[1-4?]: 2

Using 1000HZ is generally considered too fast for many systems. The timer frequency determines how often the timer interrupt is used. This helps the system operate on a timeline. Applications do not just execute a command randomly. Rather, they wait until a timer interrupt has gone off. This keeps process organized and structured. The time between interrupts on a timer frequency of 100HZ is 10ms, 250HZ is 4ms, and 1000HZ is 1ms. Now, many developers will instantly think that 1000HZ is the best. Well, it depends what effects you will be fine with. A large timer frequency means more power consumption and with more energy being utilized, more heat will be produced. More heat means the hardware may wear down faster.

NOTE: If a particular feature does not matter to you specifically or you are not sure what to choose, use the default value chosen by the configuration tool. For example, for the kernel that I am making, it does not matter to me which timer value to use. In summary, if you do not have a specific reason to select any of the choices, the default is fine.

This interesting system call may be useful to some users (kexec system call (KEXEC)). The kexec call shuts down the current kernel to start another or restart the current. The hardware is not powered-off and this call works without help from the firmware. The bootloader is not executed. (The bootloader is the software that starts the operating system) This restart takes place at the level of the operating system not the hardware. Using this system call is faster than performing a standard power-off or restart. This keeps the hardware on. This system call will not work on all systems. For maximum performance, enable hotplugging.

To use kexec, use the command below replacing “<kernel-image>” with the kernel that will be used after reboot. Also, replace “<command-line-options>” with some of those kernel parameters we had discussed previously. (I will go into greater depth in a later article.)

    kexec -l <kernel-image> --append="<command-line-options>”

Specifically, I would type “kexec -l /boot/vmlinuz-3.8.0-27-generic –append="root=/dev/sda1””

NOTE: The hardware does need to be reset sometimes, so do not depend on kexec entirely.

Next, we have a debugging feature that works with kexec (kernel crash dumps (CRASH_DUMP)). When kexec is called, a crash dump is generated. Unless you need to debug kexec, this is not needed. I disabled this feature.

Again, we have another kexec feature (kexec jump (KEXEC_JUMP)). kexec jump allows users to switch between the original kernel and the one started by kexec.

It is best to use the default value for the address the kernel starts (Physical address where the kernel is loaded (PHYSICAL_START) [0x1000000]).

This next kernel option (Build a relocatable kernel (RELOCATABLE)) allows the kernel to be placed somewhere else in the memory. The kernel file will be 10% larger, but this excess is removed from memory on execution. Many may wonder why this is important. Before kernel 2.6.20, rescue kernel had to be configured and compiled differently to be able to run on a different memory address. After this feature was invented, developers no longer needed to make two kernels. A rescue kernel will not load where the first kernel is/was loaded because that portion of memory is occupied or corrupted. (If you are using a rescue kernel then obviously the first kernel had errors)

This feature should be enabled on systems where CPUs can be added unless there is a specific reason for not doing so (Support for hot-pluggable CPUs (HOTPLUG_CPU)). The configuration tool may auto-enable this ability. With this feature, you can active/deactivate a CPU on a system that has many processors. This does not mean adding a new CPU to a system. All CPUs must already be in the system.

The next option will allow us to set whether the above ability is enabled by default (Set default setting of cpu0_hotpluggable (BOOTPARAM_HOTPLUG_CPU0)). It is better to have this feature inactive for performance purposes until it is needed.

This debugging feature allows developers to debug the CPU hotplug abilities (Debug CPU0 hotplug (DEBUG_HOTPLUG_CPU0)). I disabled this feature.

To support older versions of glibc (<2.3.3), enable this feature (Compat VDSO support (COMPAT_VDSO)). This will apply the old-style address via map on the 32-bit VDSO. Glibc is Gnu C LIBrary; this is the GNU Project's implementation of the C standard library.

If the system the kernel is intended for lacks a fully functional boot-loader, then enable this feature (Built-in kernel command line (CMDLINE_BOOL)). This will allow users to use a command-line on the kernel itself so administrators can fix kernel issues. If the bootloader has a command-line (like Grub), then this feature is not needed.

Now, we can configure ACPI and power. First, we are given the choice to allow the system to suspend to RAM (Suspend to RAM and standby (SUSPEND)). Advanced Configuration and Power Interface (ACPI) is an open standard for device configuration and power management. Suspending a system places data on RAM and the hardware goes into a low-power state. The system is not shutdown entirely. This is useful if a user needs to put the computer in a low-power state but wants to retain the currently open applications. Shutting-down a system completely powers off a system and clears the memory.

Next, we can enable hibernation (Hibernation (aka 'suspend to disk') (HIBERNATION)). Hibernation is like suspend mode, but all data in the memory is saved to the hard-drive and the device is completely powered-off. This allows the user to continue using their open applications when the system is powered back on.

Here, we can set the default resume partition (Default resume partition (PM_STD_PARTITION)). Very few developers and administrators will need this feature. When a system returns from hibernation, it will load off of the default resume partition.

After that, we can enable "Opportunistic sleep (PM_AUTOSLEEP)". This lets the kernel to initiate suspend or sleep mode when no active wakeup calls are called. This means that an idling system will initiate suspend mode to save energy. I enabled this feature.
Next, we are asked about "User space wakeup sources interface (PM_WAKELOCKS)". Enabling this will allow wakeup source objects to be activated, deactivated, and created by the user space via a sysfs-based interface. Wakeup source objects track the source of wakeup events.

Sysfs is a virtual filesystem located /sys/. This virtual filesystem contains information about devices. When going to /sys/, it appears to be part of the hard-drive, but this is really a mount point. The files are actually found in the memory. This is the same concept for /proc/.

NOTE: “/sysfs/” is a folder while “/sysfs” would be a file on the root named “sysfs”. Many Linux users mix up the two naming conventions.

If the above option is enabled, then you can set the "Maximum number of user space wakeup sources (0 = no limit) (PM_WAKELOCKS_LIMIT)". It may be best to select the default. Then, you can enable the garbage collector (Garbage collector for user space wakeup sources (PM_WAKELOCKS_GC)). Garbage collection is a memory management method.

NOTE: On systems that need more memory, it is usually best in most cases to enable as many garbage collectors as possible. Otherwise, the memory will fill up faster and be disorganized.

The next power option concerns IO devices (Run-time PM core functionality (PM_RUNTIME)). This option will permit IO hardware to go into low power states on run time. The hardware must allow this feature; not all hardware will do this.

As with many other components of the kernel, the power-management code also has debugging support, if enabled (Power Management Debug Support). I will disable this option.

NOTE: Notice that the options/questions from the configuration tool that I quote/display are no longer showing the option code (the letters in all caps between the parenthesis). This is because I am no using the ncurses-based configuration tool (make menuconfig) instead of the default tool to get the options/settings/questions. Remember, “make config” lacks the ability to save the current progress.

After that, the configuration tool will enable "ACPI (Advanced Configuration and Power Interface) Support". It is best to allow this power management specification. Usually, the configuration file will enable this feature.

To allow backwards compatibility, enable "Deprecated /proc/acpi files". The new implementation uses the newer functions in /sys/. I disabled this option. A similar question asks about "Deprecated power /proc/acpi directories". Usually, if you disable the files, you will not need the folders, so I disabled them. Some older applications may use these files and folders. If you are compiling a new kernel for an old Linux system, it may be best to enable this option.

Next, we have another file interface that can be enabled/disabled (EC read/write access through). This will create an embedded controller interface in /sys/kernel/debug/ec/. Embedded controllers usually are found in laptops to read the sensors. The Linux kernel accesses the embedded controllers through ACPI code given by the BIOS tables of the system.

Here is another old feature that can be enabled for backwards compatibility (Deprecated /proc/acpi/event support). The acpid daemon may read /proc/acpi/event to manage ACPI-generated events. Instead of this interface, the daemon uses netlink events or input layer to get these events to the user-space. The acpid daemon manages ACPI events.

The next option allows developers to enable a feature that will inform the kernel whether it is using AC or battery (AC adapter). The next option provides battery information from /proc/acpi/battery/ (Battery).

To allow the kernel to behave differently when the power/sleep button is pressed or when the lid is closed, enable this option (Button). These events are controlled in /proc/acpi/event/. For instance, this will make the system suspend when the laptop lid is closed if in the user account power options such a behavior is enabled. On many Linux distros, users can go to the system settings to make the laptop stop suspending when the lid is closed.

The next ACPI extension to be enable/disabled is for video adapters (Video).

ACPI fans can be enabled/disabled (Fan). It is best to enable ACPI fans management. This will help to conserve energy.

We are getting further in configuring the kernel, but there is still more to do in the next articles.

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-5.4424/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出