26 The Linux Kernel: Configuring the Kernel Part 22
================================================================================
![](http://www.linux.org/attachments/slide-jpg.703/)

Aloha! In this article, we will continue to configure the kernel hacks and then we will configure the whole security system.

The next feature to configure is needed by Alpha and s390 processor (Force weak per-cpu definitions). This feature offers a fix for an addressing issue commonly seen in such processors. Other processors do not need this feature enabled.

Kernel dumps can be tested with this special debugging tool (Linux Kernel Dump Test Tool Module). This software will allow a kernel developer to trigger a fake error that will cause a kernel dump. The kernel developers can then ensure that the dumps complete successfully.

The kernel offers some different error injection modules that allow kernel developers to test the notifiers (CPU notifier error injection module), (PM notifier error injection module), and (Memory hotplug notifier error injection module). A notifier informs the system that the hardware is present, which is important for hotplugging. These error injection modules trigger an error in this notification system so developers can test the notification system's error handling abilities.

The "Fault-injection framework" driver offers various tools for testing fault-handling.

The "Latency measuring infrastructure" driver provides the LatencyTOP tool used to find the userspace object that is blocking/interfering with a kernel execution/task.

Next, we have a sub-menu titled "Tracers" that contains a list of various tracers. A tracer is a piece of code that watches various kernel functions. Every time a particular function starts, a tracer will be called to watch the function.

This next module tests the performance of the Red-Black tree library (Red-Black tree test). The Red-Black tree library is a sorting and searching algorithm.

The next feature is the same except that it tests the interval tree library (Interval tree test).

The kernel can also debug FireWire on other systems while that particular remote system is booting (Remote debugging over FireWire early on boot) and (Remote debugging over FireWire with firewire-ohci).

The printk() function can be made to print various debugging messages if this feature is enabled (Enable dynamic printk() support). “printk()” is a commonly discussed system call, so remember that it prints debugging messages about the kernel.

Here is a Direct Memory Access (DMA) debugging driver (Enable debugging of DMA-API usage).

The Atomic64 self-tests checks if the system supports atomic operations (Perform an atomic64_t self-test at boot). This is where a 32-bit system performs a 64-bit operation.

This driver provides a self-test for all of the possible RAID6 recovery systems (Self test for hardware accelerated raid6 recovery).

NOTE: Self-tests are low-level tests and detection software that executes before most of the system's hardware and software turns on and executes. Self-tests search for hardware, failing devices, etc. A self-test may also be code an application uses to test itself.

In the Kernel Hacking menu (if you are using a menu-like interface such as ncurses), there is a sub-menu titled "Sample kernel code". If you make your own personal modules, this is where you can enable them. In a later article, we will discuss how to implement custom/home-made kernel modules. Just remember this is where you enable your module.

![](http://www.linux.org/attachments/kernel_22-png.704/)

The Kernel GNU DeBugger (KGDB) has many features that can be enabled or disabled (KGDB: kernel debugger). This debugger only works with two Linux systems plugged into each other via serial connection.

This feature provides extra boot-up messages for the decompression of the bzimage (Enable verbose x86 bootup info messages). You set the kernel encryption near the beginning of the configuration process.

Printk() prints various information to the boot-screen of dmesg, but after the serial and console drivers load. Enable this driver to make printk start printing messages sooner (Early printk).

This next driver is the same as above, but uses the EHCI port (Early printk via EHCI debug port).

The kernel can be set to watch for stack overflows so the kernel can manage the error better (Check for stack overflows). The kernel will execute more slowly, but overflows will not cause as much damage.

The page-table for the kernel can be seen on debugfs with this enabled (Export kernel pagetable layout to userspace via debugfs). However, this will slow down the kernel. This is needed for debugging purposes.

The kernel's written mistakes can be caught with this feature (Write protect kernel read-only data structures). This option turns the kernel's read-only data to write-protected mode. This debugging tool harms the kernel's speed. That debugging tool has a tool to debug itself (Testcase for the DEBUG_RODATA feature).

To prevent the execution of modules with modified code (due to an error), then enable this protective feature (Set loadable kernel module data as NX and text as RO). The debugging tool for that feature is provided by this driver (Testcase for the NX non-executable stack feature).

The kernel can be set to flush one of the TLB entries at a time or the whole table using this option (Set upper limit of TLB entries to flush one-by-one).

The next feature is an IOMMU debugging feature (Enable IOMMU debugging). There is another debugging test that disables some IOMMU features to test for extra stability (Enable IOMMU stress-test mode). The IOMMU stands for input/output memory management unit.

Enabling this option will make the kernel perform selt-tests on the change_page_attr() system call on thirty second intervals (CPA self-test code). This system call changes page attributes.

Any kernel code marked as "inline" can not be manipulated as much as it would by GCC than if it were not marked (Allow gcc to uninline functions marked). The GCC compiler adds code that it feels will make the code better (GCC is good at doing so). However, some code is not meant to be manipulated by GCC.

This next driver offers sanity checks for the "copy_from_user()" system call (Strict copy size checks). copy_from_user() copies a block of userspace data to kernelspace.

Here is another self-test; this one is for NMI (NMI Selftest).

Now, we can move on to the "Security Options" which is seen as a sub-menu in the main menu if you are using a menu-based interface, like ncurses. The first option allows access keys and authentication tokens to be stored in the kernel (Enable access key retention support). This is used for many reasons like accessing encrypted filesystems.

The following option is for creating and sealing/unsealing keys (TRUSTED KEYS). Encrypted keys are encrypted/decrypted using this driver (ENCRYPTED KEYS).

Keys can be viewed in proc with this feature enabled (Enable the /proc/keys file by which keys may be viewed).

Extra restrictions can be applied to syslog with this security feature (Restrict unprivileged access to the kernel syslog).

If this option is enabled, then the user can select different security models (Enable different security models). Otherwise, the defaults will be used. Disable this if you do not fully understand security or if you are fine with your kernel using the defaults.

The securityfs filesystem is offered by this driver (Enable the securityfs filesystem).

Hooks are added to networking and socket security when this feature is enabled (Socket and Networking Security Hooks). These hooks are access controls.

IPSec networking hooks (also called XFRM networking hooks) are implemented when this option is enabled (XFRM (IPSec) Networking Security Hooks). Security hooks are also available for files (Security hooks for pathname based access control).

The next driver provides support for Intel's Trusted Execution Technology (Enable Intel(R) Trusted Execution Technology (Intel(R) TXT)).

The user can set the range of memory addresses that cannot be reserved for userspace (Low address space for LSM to protect from user allocation). The starting point is 0. The user types the end point for this option. For most platforms, 65536 is a recommended choice.

SELinux (mentioned in the Kernel Security article) is one of the popular Linux-Security-Modules (NSA SELinux Support). Many options and features exist for SELinux. The boot parameter determines whether SELinux is started {1} or not started {0} when the kernel executes (NSA SELinux boot parameter). SELinux can be configured with the ability to be temporarily disabled at times when the Root user needs to do so (NSA SELinux runtime disable). Users can develop and test new policies with this feature enabled (NSA SELinux Development Support). AVC statistics are collected and stored by this feature (NSA SELinux AVC Statistics). A default can be set for the checkreqprot flag; a "1" means SELinux will check the application's requested protection and zero will default to the kernel's protection for mmap and mprotect system calls (NSA SELinux checkreqprot default value). Many SELinux policies exist; the user can set the latest version that they wish SELinux not to excede (NSA SELinux maximum supported policy format version).

One of the other Linux-Security-Modules (LSM), SMACK, is supported by the kernel (Simplified Mandatory Access Control Kernel Support).

TOMOYO is another supported LSM (TOMOYO Linux Support). The maximum number of entries permitted to be added during learning-mode is set in the following feature (Default maximal count for learning mode). The amount of log entires can also be set (Default maximal count for audit log). Next, this option allows/disallows TOMOYO to be activated without a policy loader (Activate without calling userspace policy loader). The location of the policy loader is configured here ((/sbin/tomoyo-init) Location of userspace policy loader) and the executable that triggers the execution is set here ((/sbin/init) Trigger for calling userspace policy loader).

Again, the kernel supports another LSM - AppArmor (AppArmor support). Like with SELinux, the default boot parameter can be set for AppArmor (AppArmor boot parameter default value).

Yama is another LSM (Yama support). Yama can be used with another LSM if this feature is enabled (Yama stacked with other LSMs).

This driver gives the kernel the ability to use multiple keyrings for verification processes (Digital signature verification using multiple keyrings).

Asymmetric keys are supported with this feature (Enable asymmetric keys support).

The kernel can keep and maintain a list of hashes and important system files (Integrity Measurement Architecture(IMA)). Then, if malware changes an important file, the kernel will know because the hashes are checked before the file or executable are used. It is highly recommended that this feature be enabled.

Extra security attributes are added to files if this feature is enabled (EVM support). The version can be set using this next option (EVM HMAC version). The two choices are version 1 and 2.

Remember all of the different Linux Security Modules (LSMs)? Well, the default can be set here (Default security module (AppArmor)).

In the next article, we can configure the "Cryptographic API". There may be two additional configuration articles left than what I estimated. After that, there are other kernel topics to discuss.

SNEAK PEAK: After this article, there is one more about the configuration process. Then, we can finally compile and install the kernel.

MESSAGE TO MY FANS: Feel free to post and/or email suggestions for kernel topics you would like me to cover in the following kernel articles. I still have a list of the suggestions some readers have sent me over the course of this series. Please feel free to send more. 

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-22.5017/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出