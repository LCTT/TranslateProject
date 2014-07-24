[bazz2 on the way]
Linux Kernel Testing and Debugging
================================================================================
### Basic Testing ###

Once a new kernel is installed, the next step is try to boot it and see what happens. Once the new kernel is up and running, check dmesg for any regressions. Run a few usage tests:

- Is networking (wifi or wired) functional?
- Does ssh work?
- Run rsync of a large file over ssh
- Run git clone and git pull
- Start web browser
- Read email
- Download files: ftp, wget etc.
- Play audio/video files
- Connect new USB devices mouse, usb stick etc.


### Examine Kernel Logs ###

Checking for regressions in dmesg is a good way to identify problems, if any, introduced by the new code. As a general rule, there should be no new crit, alert, and emerg level messages in dmesg. There should be no new err level messages. Pay close attention to any new warn level messages as well. lease note that new warn messages aren't as bad. New code at times adds new warning messages which are just warnings.

- dmesg -t -l emerg
- dmesg -t -l crit
- dmesg -t -l alert
- dmesg -t -l err
- dmesg -t -l warn
- dmesg -t -k
- dmesg -t

The following script runs the above dmesg commands and saves the output for comparing with older release dmesg files. It then runs diff commands against the older release dmesg files. Old release is a required input parameter. If one is not supplied, it will simply generate dmesg files and exit. Regressions indicate newly introduced bugs and/or bugs that escaped patch testing and integration testing in linux git trees prior to including the patch in a release. Are there any stack traces resulting from WARN_ON in the dmesg? These are serious problems that require further investigation. 

- [**dmesg regression check script**][1]

### Stress Testing ###

Running 3 to 4 kernel compiles in parallel is a good overall stress test. Download a few Linux kernel gits, stable, linux-next etc.. Run timed compiles in parallel. Compare times with old runs of this test for regressions in performance. Longer compile times could be indicators of performance regression in one of the kernel modules. Performance problems are hard to debug. First step is to detect them. Running several compiles in parallel is a good overall stress test that could be used as a performance regression test and overall kernel regression test, as it exercises various kernel modules like memory, file-systems, dma, and drivers.

    time make all

### Kernel Testing Tools ###

There are several tests under tools/testing that are included in the Linux kernel git. There is a good mix of automated and functional tests.
ktest suite

ktest is an automated test suite that can test builds, installs, and kernel boots. It can also run cross-compile tests provided the system has cross-compilers installed. ktest depends on flex and bison tools. Please consult the ktest documentation in tools/testing/ktest for details on how to run ktest. It is left to the reader as a self-study. A few resources that go into detail on how to run ktest:

- [**ktest-eLinux.org**][2]

### tools/testing/selftests ###

Let's start with selftests. Kernel sources include a set of self-tests which test various sub-systems. As of this writing, breakpoints, cpu-hotplug, efivarfs, ipc, kcmp, memory-hotplug, mqueue, net, powerpc, ptrace, rcutorture, timers, and vm sub-systems have self-tests. In addition to these, user memory self-tests test user memory to kernel memory copies via test_user_copy module. The following is on how to run these self-tests:

Compile tests:

    make -C tools/testing/selftests 

Run all tests: (running some tests needs root access, login as root and run)

    make -C tools/testing/selftests run_tests 

Run only tests targeted for a single sub-system:

    make -C tools/testing/selftests TARGETS=vm run_tests 

### tools/testing/fault-injection ###

Another test suite under tools/testing is fault-injection. failcmd.sh script runs a command to inject slab and page allocation failures. This type of testing helps validate how well kernel can recover from faults. This test should be run as root. The following is a quick summary of currently implemented fault injection capabilities. The list keeps growing as new fault injection capabilities get added. Please refer to the Documentation/fault-injection/fault-injection.txt for the latest.

failslab (default option)

    injects slab allocation failures. kmalloc(), kmem_cache_alloc(), ... 

fail_page_alloc

    injects page allocation failures. alloc_pages(), get_free_pages(), ... 

fail_make_request

    injects disk IO errors on devices permitted by setting, /sys/block//make-it-fail or /sys/block///make-it-fail. (generic_make_request())

fail_mmc_request

    injects MMC data errors on devices permitted by setting debugfs entries under /sys/kernel/debug/mmc0/fail_mmc_request

The capabilities and behavior of fault-injection can be configured. fault-inject-debugfs kernel module provides some debugfs entries for runtime. Ability to specify the error probability rate for faults, the interval between fault injection are just a couple of examples of the configuration choices fault-injection test supports. Please refer to the Documentation/fault-injection/fault-injection.txt for details. Boot options can be used to inject faults during early boot before debugfs becomes available. The following boot options are supported:

- failslab=
- fail_page_alloc=
- fail_make_request=
- mmc_core.fail_request=[interval],[probability],[space],[times]

The fault-injection infrastructure provides interfaces to add new fault-injection capabilities. The following is a brief outline of the steps involved in adding a new capability. Please refer to the above mentioned document for details:

define the fault attributes using DECLARE_FAULT_INJECTION(name);

> Please see the definition of struct fault_attr in fault-inject.h for details.

add a boot option to configure fault attributes

> This can be done using helper function setup_fault_attr(attr, str); Adding a boot option is necessary to enable the fault injection capability during early boot time.

add debugfs entries

> Use the helper function fault_create_debugfs_attr(name, parent, attr); to add new debugfs entries for this new capability.

add module parameters

> Adding module parameters to configure the fault attributes is a good option, when the scope of the new fault capability is limited to a single kernel module.

add a hook to insert failures

> should_fail(attr, size); Upon should_fail() returning true, client code should inject a failure. 

Applications using this fault-injection infrastructure can target a specific kernel module to inject slab and page allocation failures to limit the testing scope if need be. 

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/linux-kernel-testing-and-debugging?page=0,2

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linuxdriverproject.org/mediawiki/index.php/Dmesg_regression_check_script
[2]:http://elinux.org/Ktest#Git_Bisect_type
