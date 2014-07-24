Linux Kernel Testing and Debugging
================================================================================
### Linux PM Sub-system Testing in Simulation Mode ###

The Linux PM sub-system provides five PM test modes to test hibernation in a simulated mode. These modes allow exercising the hibernation code in various layers of the kernel without actually suspending the system. This is useful when there is a concern that suspend might not work on a specific platform and help detect errors in a simulation similar to simulating flying a plane, so to speak.

freezer - test the freezing of processes 

    echo freezer > /sys/power/pm_test
    echo platform > /sys/power/disk
    echo disk > /sys/power/state

devices - test the freezing of processes and suspending of devices

    echo devices > /sys/power/pm_test
    echo platform > /sys/power/disk
    echo disk > /sys/power/state

platform - test the freezing of processes, suspending of devices and platform global control methods(*)

    echo platform > /sys/power/pm_test
    echo platform > /sys/power/disk
    echo disk > /sys/power/state

processors - test the freezing of processes, suspending of devices, platform global control methods(*) and the disabling of non-boot CPUs

    echo processors > /sys/power/pm_test
    echo platform > /sys/power/disk
    echo disk > /sys/power/state

core - test the freezing of processes, suspending of devices, platform global control methods, the disabling of non-boot CPUs and suspending of platform/system devices. Note: this mode is tested on ACPI systems.

    echo core > /sys/power/pm_test
    echo platform > /sys/power/disk
    echo disk > /sys/power/state

### Linux PM Sub-system Trace Events ###

PM sub-system supports several tracepoints and trace events that can be enabled to trigger during run-time. I will give an overview on how to enable couple of these trace events and where to find the trace information they generate:

Enabling PM events at run-time:

    cd /sys/kernel/debug/tracing/events/power
    echo 1 > cpu_frequency/enable
    cat /sys/kernel/debug/tracing/set_event
    less /sys/kernel/debug/tracing/trace

Enabling events at boot-time kernel trace parameter with a kernel boot option:

    trace_event=cpu_frequency

For more information on Linux PM testing, please consult the Documentation/power/basic-pm-debugging.txt and other documents in the same directory. 

### git bisect ###

git bisect is an invaluable and powerful tool to isolate an offending commit. I will go over very basic git bisect steps. 

This is how the process works:

    git bisect start
    git bisect bad	 # Current version is bad
    git bisect good v3.14-rc6	# last good version

Once, one bad and one good version are specified, git bisect will start bisecting by pulling in commits between the good version and the bad. Once a set of commits are pulled in, compile the kernel, install, test, and tag the version good or bad. This process repeats until the selected commits are tested and tagged as good or bad. There can be several kernel versions to test. When the last version is tested, git bisect will flag a commit that is bad. The following useful git-bisect command can aid in using git-bisect process:

See step by step bisect progress

    git bisect log

Reset git bisect can be used in case of mistakes in tagging, save git log output and replay prior to reset

    git bisect reset

Replay a git-bisect log

    git bisect replay git_log_output

git bisect can be run on a section of kernel source tree if the problem is clearly in that area. For example, when debugging a problem in radeon driver, running git bisect on drivers/drm/radeon will limit the scope of bisect to just the commits to drivers/drm/radeon driver. 

Start git bisect on a section of a kernel tree

    git bisect start drivers/drm/radeon

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/linux-kernel-testing-and-debugging?page=0,4

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出