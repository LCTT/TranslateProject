Translating--------------geelpi

04 The Linux Kernel: Security
================================================================================
![](http://www.linux.org/attachments/slide-jpg.278/)

The Linux kernel is the core of all Linux systems. If any malicious code controls or damages any part of the kernel, then the system can get severely damaged, files can be deleted or corrupted, private information can be stolen, etc. Clearly, it is in the user's best interest to keep the kernel secure. Thankfully, Linux is a very secure system because of the kernel and its security. There are less Linux viruses than Windows viruses even in proportion to the number of users, and Linux users get less viruses than Windows users. (This is one reason why many companies use Linux to manage their servers.) However, this is no excuse to neglect the kernel's security. Linux has may security features and programs, but only the Linux Security Modules (LSM) and other kernel security will be discussed in this article.

AppArmor (Application Armor) is a security module originally made by Immunix. Since 2009, Canonical maintains the code (Novell handled the code after Immunix and before Canonical). This security module has been in the mainstream Linux kernel since version 2.6.36. AppArmor restricts the abilities of programs. AppArmor uses file paths to keep track of program restrictions. Many Linux administrators claim that AppArmor is the easiest security module to configure. However, many Linux users feel that this module provides the worst security compared to alternatives.

Security-Enhanced Linux (SELinux) is an alternative to AppArmor originally made by the United States National Security Agency (NSA). SELinux has been in the mainstream kernel since version 2.6. SELinux makes modifications to the kernel and user-space tools. SELinux gives executables (mainly daemons and server applications) the minimum privileges required to complete their tasks. SELinux could also be used to control user privileges. SELinux does not use file paths like AppArmor, instead SELinux uses the filesystem to mark executables when keeping track of permissions. Because SELinux uses the filesystem itself for managing executables, SELinux cannot offer protection on all filesystems while AppArmor can provide protection.

NOTE: A daemon (pronounced DAY-mon) is a program that runs in the background.

NOTE: Although AppArmor, SELinux, and others are in the kernel, only one security module can be active.

Smack is another choice for a security module. Smack has been in the mainstream Linux kernel since version 2.6.25. Smack is supposed to offer more security than AppArmor and easier configuration than SELinux.

TOMOYO, another security module, has been in the Linux kernel since version 2.6.30. TOMOYO offers security, but its main use is analyzing the system for security flaws.

AppArmor, SELinux, Smack, and TOMOYO make up the four standard LSM modules. All for work by using mandatory access control (MAC) which is a type of access control that restricts a program or user from executing some task. The LSMs have some form of a list of entities and what they are permitted and not permitted to do.

Yama is a new security module that comes with the Linux kernel. Yama is not yet considered a standard LSM module, but in the future, it may be the fifth standard LSM module. Yama uses the same principals as the other security modules.

"grsecurity" is a collection of security patches for enhancing the Linux kernel's security. The majority of the patches apply to remote network connections and buffer overflows (discussed a little later). One interesting component of grsecurity is PaX. PaX patches allow code on memory to use the least amount of needed privileges. For example, memory containing programs is marked as non-writable. Think about it, why would an executed program need to be written while in memory? Now, malicious code cannot change currently executed applications. A buffer overrun is the event where a program (bug or malicious code) write data on memory and goes past its space boundary into the memory pages for other applications. When PaX is active, it helps to prevent these buffer overruns because the program will not have permission to write on other memory pages.

The Linux Intrusion Detection System (LIDS) is a kernel security patch that adds Mandatory Access Control (MAC) features. This patch acts like a LSM module.

Systrace is a utility that reduces and controls application's access to system files and use of system calls. System calls are service requests to the kernel. For instance, when a text editor writes a file to the hard-drive, the applications makes a system call requesting that the kernel write the file to the hard-drive.

These are very important components in the Linux security system. These security modules and patches keep malicious code from attacking the kernel. Without these features, Linux systems would be unsecure computer operating systems.

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-security.4223/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
