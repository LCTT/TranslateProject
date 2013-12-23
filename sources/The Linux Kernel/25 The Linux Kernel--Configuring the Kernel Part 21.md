Translating------------------geekpi


25 The Linux Kernel: Configuring the Kernel Part 21
================================================================================
![](http://www.linux.org/attachments/slide-jpg.689/)

Aloha! In this next article, we will configure network filesystem support for the Linux kernel. A network filesystem is a remote filesystem that computers access via the network.

First, the "NFS client support" driver allows the Linux system to use the NFS network filesystem. There are also three other drivers for different versions of NFS - (NFS client support for NFS version 2), (NFS client support for NFS version 3), (NFS client support for NFS version 4), and (NFS client support for NFSv4.1). If you have a network that possess NFS, either figure out what version of NFS you are using, or enable all of the NFS drivers.

Swap space is not required to be on a local storage unit. This driver allows Linux to use NFS support to use remote swap spaces (Provide swap over NFS support).

The NFS system can be sped up by using a cache system (Provide NFS client caching support). This is local cache.

Enable this driver to allow DNS to use host-names for NFS servers (Use the legacy NFS DNS resolver).

"NFS server support" gives the server providing NFS the features it needs to fulfill such a task. Some other NFS drivers include (NFS server support for NFS version 3) and (NFS server support for NFS version 4).

The "NFS server manual fault injection" driver is a debugging tool that allows developers to make the NFS server think an error occurred with NFS. Specifically, this is used to test how the server handles NFS errors.

The "Secure RPC: Kerberos V mechanism" is needed to make the RPC calls secure. NFS cannot be added to the kernel without this feature for security reasons.

There is a special debugging tool for RPC (RPC: Enable dprintk debugging).

The Linux kernel supports the Ceph filesystem (Ceph distributed file system).

CIFS is a virtual filesystem used by Samba and Windows servers (CIFS support (advanced network filesystem, SMBFS successor)). CIFS stands for Common Internet FileSystem.

There are two features that can be used to debug or monitor the CIFS driver (CIFS statistics) and (Extended statistics).


A special driver is needed to support servers with LANMAN security (Support legacy servers which use weaker LANMAN security). LANMAN or LM hash is a special password hashing function that has some weaknesses.

CIFS requires that Kerberos tickets be used before mounting to secure servers (Kerberos/SPNEGO advanced session setup). This driver offers the ability for CIFS to use userspace tools which is needed to provide the tickets.

Like other filesystems, CIFS can have extended abilities (CIFS extended attributes) and (CIFS POSIX Extensions).

This driver gets the Access Control List (ACL) from the CIFS server (Provide CIFS ACL support).

CIFS has two other debugging tools (Enable CIFS debugging routines) and (Enable additional CIFS debugging routines).

CIFS can have "DFS feature support" which allows shares to be accessed even when they are moved. DFS stands for Distributed FileSystem.

SMB2 is an improved alternative to CIFS (SMB2 network file system support). SMB2 stands for Server Message Block version 2.

Clients can store CIFS cache with this driver enabled (Provide CIFS client caching support).

Novell NetWare clients need this driver to access NetWare volumes (NCP file system support (to mount NetWare volumes)). NCP stands for NetWare Core Protocol. NCP is a protocol that allows clients to communicate with the servers hosting NetWare volumes.

NetWare servers can use NFS namespaces if this driver is enabled (Use NFS namespace if available).

NetWare servers can use the OS/2 long namespaces if this driver is enabled (Use LONG (OS/2) namespace if available).

If this driver is enabled, then filenames made by DOS or on storage units owned by a DOS system will be converted to lowercase (Lowercase DOS filenames).

Many filesystems depend on native language support (Use Native Language Support). Specifically, Native Language Support (NLS) allows the different character-sets to be used in filenames.

NCP filesystems can support the execute flag and symbolic links with this driver enabled (Enable symbolic links and execute flags).

The Linux kernel offers support for the Coda filesystem (Coda file system support (advanced network fs)). Coda is one of many network filesystems.

The Linux kernel can support the Andrew Filesystem (Andrew File System support (AFS)). However, the Linux kernel can only read such filesystems in an insecure manner. This driver is intended to allow Linux systems to access AFS. If your network only contains Linux systems, then select a different network filesystem that the kernel can fully support.

The Linux kernel has an experimental driver for accessing Plan 9 resources via the 9P2000 protocol (Plan 9 Resource Sharing Support (9P2000)). The kernel also has cache support (Enable 9P client caching support) and control lists (9P POSIX Access Control Lists) for the previously mentioned Plan 9 feature.

![](http://www.linux.org/attachments/kernel_21-png.687/)

After the network filesystems have been configured, the next part of the kernel to setup is the "Native Language Support". This whole menu contains the drivers for most or all of the character-sets and encodings. Enabling these encodings allows these character sets to be used by the system and applications. UTF-8 is the most commonly used encoding, but it is not the only one. Most applications and driver need UTF-8, so this encoding is already set to be added to the kernel.

After that menu, the "Distributed Lock Manager (DLM)" can be configured. A DLM is used to keep shared resources in sync and performing well. This driver manages the userspace and kernelspace applications that access or manipulate shared resources (like network filesystems). Clusters strongly depend on this driver.

Now that we have finally finished configuring the filesystems and related features, we can now move on to the "Kernel hacking" menu seen on the main (first) screen on the kernel configuration tool (when using the command "make menuconfig"). I am using the ncurses interface (seen in the screenshot) which is initiated with the "make menuconfig" command, so other interfaces may be a little different. Many of the features and settings in the kernel hacking menu contain various settings concerning the kernel itself. Some of these features are debugging tools and some control the kernel's behavior.

This first setting adds the pritnk time stamps to the syslog system call output (Show timing information on printks).

The next three features control various debugging features (Default message log level (1-7)), (Enable __deprecated logic), and (Enable __must_check logic).

![](http://www.linux.org/attachments/kernel_21_1-png.688/)

The next feature is a debugging feature that is active at compiling time ((1024) Warn for stack frames larger than (needs gcc 4.4)). If stack frames are larger than the specified amount, then the compiler will warn the user.

The "Magic SysRq key" driver will enable support for the Magic SysRq key. This allows users to send the kernel special commands when Alt+PrintScreen is pressed. This works in most cases regardless of the kernel's state. However, exceptions exist. It is highly recommended that the Magic SysRq Key be enabled.

During compilation, the assembler's symbolic links will be removed during a link to reduce the output of get_wchan() (Strip assembler-generated symbols during link).

This next feature is for debugging purposes (Generate readable assembler code). If enabled, some kernel optimizations will be disabled so some of the assembly code will be human-readable. This will harm the kernel's speed. Only enable this if you have a specific reason for doing so.

This setting enables/disables commonly unneeded or obsolete symbols (Enable unused/obsolete exported symbols). However, some modules may need such symbols. Enabling this will increase the kernel's size. It is very unlikely that a Linux user will need such symbols. In general, disable this unless you know for a fact the user needs a symbol for an important module.

Sanity checks will be performed on user kernel headers if this setting is enabled (Run 'make headers_check' when building vmlinux).

During compilation, this feature will check for invalid references (Enable full Section mismatch analysis).

The kernel can be configured to detect soft and hard lockups (Detect Hard and Soft Lockups). When the system is frozen for more than twenty second and other tasks cannot execute, this is called a soft-lockup. If the CPU is in a loop that lasts for more than ten seconds and interrupts fail to get execution time, then this is called a hard-lockup.

The next to features set the kernel to reboot on hard and soft lockups respectively, (Panic (Reboot) On Hard Lockups) and (Panic (Reboot) On Soft Lockups).

When the kernel experiences major problems, it can be set to start a kernel panic (Panic on Oops). It is highly recommended that this setting be enabled. This will help to prevent the kernel from causing system damage and data loss.

The kernel can be set to detect hung tasks (Detect Hung Tasks). This is when a process or application locks-up or is frozen. Specifically, the application becomes uninterruptable. The following setting allows the user to define how much time must pass before a process is deemed "hung" (Default timeout for hung task detection (in seconds)).

The kernel can be set to restart when a process hangs (Panic (Reboot) On Hung Tasks). Generally, users will not want to enabled this. Would you like your computer to restart every time an application becomes frozen?

The "Kernel memory leak detector" finds and logs memory leaks.

The kernel uses frame pointers to help report errors more efficiently and include more information (Compile the kernel with frame pointers). I will skip a lot of the debugging tools because they are self-explanatory.

As many Linux users know, when the system boots up, the boot messages appear too quickly to be read. This feature sets the delay time which will give users more time to read the messages (Delay each boot printk message by N milliseconds).

This is a special developmental feature for testing backtrace code (Self test for the backtrace code). Backtrace code is a self-test.

Block device number can be extended (Force extended block device numbers and spread them). However, this may cause booting issues, so use with caution.

We will continue to configure the kernel itself in the next article. I hope you have enjoyed this article. Mahalo! 

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-21.4988/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出