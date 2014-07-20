Linux Kernel Testing and Debugging
================================================================================
### Linux Kernel Patch Testing ###

Are you try your hands on writing a kernel patch? This section will go over how to test a new patch before sending it to the Linux mailing list. Further more, we will also talk about how to send it.
Once the code is ready, compile it. Save the make output to a file to see if the new code introduced any new warnings. Address warnings, if any. Once the code compiles cleanly, install the compiled kernel and boot test. If it boots successfully, make sure there are no new errors in the dmesg, comparing it with the previous kernel dmesg. Run a few usage and stress tests. Please refer to the testing content we discussed earlier in this paper. If the patch is for fixing a specific bug, make sure the patch indeed fixes the bug. If the patch fixes the problem, make sure, other module regression tests pass. Identify regression tests for the patched module and run them. When a patch touches other architectures, cross-compile build testing is recommended. Please check the following in the source git as a reference to identify tests.

- linux_git/Documentation
- linux_git/tools/testing
- Cross-compiling reference: [Cross-compiling Linux Kernels on x86_64: A tutorial on How to Get Started][1]

Once you are satisfied with the patch testing, it is time to commit the change and generate the patch. Make sure the commit message describes the change made very clearly. It is important that the maintainer and other developers can understand what this change is all about. Once patch is ready, run scripts/checkpatch.pl on the generated patch. Address checkpatch errors and/or warnings, if any. Regenerate and repeat until the patch passes the checkpatch test. Unless the checkpatch errors are minor whitespace type, re-test the patch. Apply the patch to another instance of the kernel git to make sure patch applies cleanly.

Now you are ready to send the patch. Please run the scripts/get_maintainer.pl to identify whom the patch should be sent to. Please remember that the patch needs to be sent as a plain text, not as an attachment. Please make sure your email client can send plain text messages. Email the patch to yourself to test your client settings. Run checkpatch and apply the received patch. If these two steps pass, then you are ready to send the patch to the Linux Kernel Mailing List. git send-email is the safest way to send patches to avoid email client complications. Please make sure your .gitconfig includes sendemail with a valid smtpserver. Please consult git manpage for details.

Please refer to the following documentation in the kernel sources for rules and guidelines on sending patches:

- linux_git/Documentation/applying-patches.txt
- linux_git/Documentation/SubmitChecklist
- linux_git/Documentation/SubmittingDrivers
- linux_git/Documentation/SubmittingPatches
- linux_git/Documentation/stable_kernel_rules.txt
- linux_git/Documentation/stable_api_nonsense.txt

The following is a list of additional testing guides and resources:

- [USB Testing on Linux][2]
- [Linux Kernel Tester's Guide Chapter2][3]
- [Linux Kernel Tester's Guide][4]
- [Testing resources at eLinux.org][5]
- [eLinux Debugging Portal][6]

### Kernel test suites and projects ###

In addition to the testing resources we discussed so far, there are projects both open source and initiated by hardware vendors that are worth a mention. Each of these projects focus on specific areas of the kernel and in some cases a specific space such as, embedded or enterprise where the kernel is used. We will look at a few in this section. 

[Linux Test Project][7] (LTP) test suite is a collection of tools to test reliability, robustness, and stability of Linux kernel and related features. This test suite can be customized by adding new tests and the LTP project welcomes contributions. runltp script tests the following sub-systems by default:

- filesystem stress tests
- disk I/O tests
- memory management stress tests
- ipc stress
- scheduler tests
- commands functional verification tests
- system call functional verification tests

[**LTP-DDT**][8] is an LTP based test application wth a reduced focus to test embedded device drivers.

[**Linux Driver Verification**][9] project's goals are to improve the quality of Linux device drivers, develop an integrated platform for device drivers verification, and adopt latest research outcome to enhance quality of verification tools. 

### Compliance Testing ###

If you ever had to port applications from one Unix variant to another, you would understand the importance of the [Linux Standard Base (LSB)][10] and LSB compliance test suite. The LSB is a Linux Foundation workgroup created to reduce the costs of supporting Linux platform, by reducing the differences between various Linux distributions and ensuring application portability between distributions. If anything, divergence in the Unix world taught us that it is vital to avoid it in the Linux world. This is exactly the reason why you can take an rpm convert it to deb and install and run it, and how sweet is that. 

### Static Analysis and Tools ###

Static analysis tools analyze the code without executing it, hence the name static analysis. There are a couple of static analysis tools that are sepcifically written for analyzing the Linux kernel code base. Sparse is a static type-checking program written specifically for the Linux kernel, by Linus Torvalds. Sparse is a semantic parser. It creates a sematic prase tree to validate C semantics. It performs lazy type evaluation. Kernel build system has support for sparse and provides a make option to compile the kernel with sparse checking enabled.

Run sparse on all kernel C files that would get re-compiled:

    make C=1 allmodconfig

Run sparse on all kernel C files even when they don't need a re-compile:

    make C=2 allmodconfig

Sparse resources: 

- [Sparse Archive][11]
- [Sparse How To][12]

Smatch analyzes source to detect programming logic errors. It can detect logic errors such as, attempts to unlock already unlocked spinlock. It is actively used to detect logic errors in the Linux kernel sources.

Run smatch on Linux kernel: 

    make CHECK="~/path/to/smatch/smatch -p=kernel" C=1 bzImage modules | tee warns.txt

Please follow instructions on how to get smatch from smatch git repo and compile. Smatch is work in progress, instructions keep changing.

- [**Smatch**][12]

So what do we do about all of these semantic and logic problems found by Sparse and Smatch? Some of these problems are isolated to a routine and/or a module which can be fixed easily. However, some of these semantic issues are global in nature due to cut and paste of code. In some cases when interfaces get obsoleted or changed slightly, a mass change to update several source files becomes necessary. This is where Coccinelle comes in to rescue. Coccinelle is a program matching and transformation engine which provides the language SmPL (Semantic Patch Language) for specifying desired matches and transformations in C code. Coccinelle was initially targeted towards performing collateral evolutions in Linux.

For example, foo(int) interfaces changes to foo(int, char \*) with an optional second input parameter which can be a null. All usages of foo() will need to be updated to the new convention, which will be a very laborious task. Using Cocinelle, this task becomes easier with a script that looks for all instances of foo(parameter1) and replacing them with foo(parameter1, NULL). Once this task is done, all instances of foo() can be examined to see if passing in NULL value for parameter2 is a good assumption. For more information on Cocinelle and how it is used in fixing problems in various projects including the Linux kernel, please refer to the project page: [**Cocinelle**][13]

### References ###

We covered a lot of ground in this paper. I leave you with a few references for further reading on the topics we discussed.

- [KernelHacking][14]
- [kernel Documentation][15]
- [Linux Device Drivers, Third Edition][16]
- [Dynamic Event Tracing in Linux Kernel][17]
- [Kernel Testing: Tool and Techniques][18]

### Acknowledgements ###

I would like to thank Khalid Aziz, Oracle for his review, proof reading, and valuable suggestions for improvement. My special thanks to Mauro Chehab, Samsung and Guy Martin, Samsung for their review and feedback at various stages of writing this paper. I would like to extend my thanks to Greg Kroah-Hartman, Linux Foundation for his review. My special thanks to Ibrahim Haddad, Samsung for his support and encouragement without which, I would probably have never set out to write this paper in the first place. 

----------

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/pictures/picture-1088573.jpg)

Author:[Shuah Khan][a]

Shuah Khan is a Senior Linux Kernel Developer at Samsung's Open Source Group.
She is a Linux Kernel Contributor who focuses on IOMMU, DMA, Linux Power
Management, and PCIe, in addition to helping with stable release kernel
maintenance testing and bug fixes. Shuah has several years of Unix kernel
development experience. She has also contributed to OpenHPI, and LLDP projects.

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/linux-kernel-testing-and-debugging?page=0,5

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://events.linuxfoundation.org/sites/events/files/slides/Shuah_Khan_cross_compile_linux.pdf
[2]:http://www.linux-usb.org/usbtest/
[3]:http://kernelnewbies.org/Linux_Kernel_Tester%27s_Guide_Chapter2
[4]:http://www.kerneltravel.net/downloads/tester_guide.pdf
[5]:http://elinux.org/Test_Systems
[6]:http://elinux.org/Debugging_Portal
[7]:http://ltp.sourceforge.net/documentation/how-to/ltp.php
[8]:http://processors.wiki.ti.com/index.php/LTP-DDT
[9]:http://linuxtesting.org/project/ldv
[10]:http://www.linuxfoundation.org/collaborate/workgroups/lsb
[11]:http://codemonkey.org.uk/projects/git-snapshots/sparse/
[12]:http://smatch.sourceforge.net/
[13]:http://coccinelle.lip6.fr/
[14]:http://kernelnewbies.org/KernelHacking
[15]:http://kernelnewbies.org/Documents
[16]:http://lwn.net/Kernel/LDD3/
[17]:http://events.linuxfoundation.org/slides/lfcs2010_hiramatsu.pdf
[18]:http://events.linuxfoundation.org/images/stories/slides/elc2013_porter.pdf
[a]:http://www.linuxjournal.com/users/shuah-khan