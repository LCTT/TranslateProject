Translating---------------geekpi

02 The Linux Kernel: The Source Code
================================================================================
After the kernel source code is downloaded and uncompressed, users will see many folders and files. It may be a challenge trying to find a particular file. Thankfully, the source code is sorted in a specific way. This enables developers to find any given file or part of the kernel.

The root of the kernel source code contains the folders listed below.

    arch
    block
    crypto
    Documentation
    drivers
    firmware
    fs
    include
    init
    ipc
    kernel
    lib
    mm
    net
    samples
    scripts
    security
    sound
    tools
    usr
    virt

There are also some files that are located in the root of the source code. They are listed in the table below.

**COPYING** - Information about licensing and rights. The Linux kernel is licensed under the GPLv2 license. This license grants anyone the right to use, modify, distribute, and share the source code and compiled code for free. However, no one can sell the source code.

**CREDITS** - List of contributors

**Kbuild** - This is a script that sets up some settings for making the kernel. For example, this script sets up a ARCH variable where ARCH is the processor type that a developer wants the kernel to support.

**Kconfig** - This script is used when developer configure the kernel which will be discussed in a later article.

**MAINTAINERS** - This is a list of the current maintainers, their email addresses, website, and the specific file or part of the kernel that they specialize in developing and fixing. This is useful for when a developer finds a bug in the kernel and they wish to report the bug to the maintainer that can handle the issue.

**Makefile** - This script is the main file that is used to compile the kernel. This file passes parameters to the compiler as well as the list of files to compile and any other necessary information.

**README** - This text file provides information to developers that want to know how to compile the kernel.

**REPORTING-BUGS** - This text document provides information on reporting bugs.

The coding for the kernel will be in files with the extension ".c", or ".h". The “.c” extension indicates that the kernel is written in C, one of many programming languages. The “.h” files are Header files, and they are also written in C. The header files contain code that many of the “.c” files use. This saves programmers' time because they can use the contained code instead of writing new code. Otherwise, a group of code that performs the same action would be in many or all of the “.c” files. That would also consume and waste hard drive space.

All of the files in the above listed folders are well organized. The folder names help developers to at least have a good guess on the contents of the folders. A directory tree and descriptions are provided below.

**arch** - This folder contains a Kconfig which sets up some settings for compiling the source code that belongs in this folder. Each supported processor architecture is in the corresponding folder. So, the source code for Alpha processors belong in the alpha folder. Keep in mind that as time goes on, some new processors will be supported, or some may be dropped. For Linux Kernel v3.9.4, these are the folders under arch:

    alpha
    arc
    arm
    arm64
    avr32
    blackfin
    c6x
    cris
    frv
    h8300
    hexagon
    ia64
    m32r
    m68k
    metag
    microblaze
    mips
    mn10300
    openrisc
    parisc
    powerpc
    s390
    score
    sh
    sparc
    tile
    um
    unicore32
    x86
    xtensa

**block** – This folder holds code for block-device drivers. Block devices are devices that accept and send data in blocks. Data blocks are chunks of data instead of a continual stream.

**crypto** - This folder contains the source code for many encryption algorithms. For example, “sha1_generic.c” is the file that contains the code for the sha1 encryption algorithm.

**Documentation** - This folder contains plain-text documents that provide information on the kernel and many of the files. If a developer needs information, they may be able to find the needed information in here.

**drivers** - This directory contains the code for the drivers. A driver is software that controls a piece of hardware. For example, for a computer to understand the keyboard and make it usable, a keyboard driver is needed. Many folders exist in this folder. Each folder is named after each piece or type of hardware. For example, the bluetooth folder holds the code for bluetooth drivers. Other obvious drivers are scsi, usb, and firewire. Some drivers may be more difficult to find. For instance, joystick drivers are not in a joystick folder. Instead, they are under ./drivers/input/joystick. Keyboard and mouse drivers are also located in the input folder. The Macintosh folder contains code for hardware made by Apple. The xen folder contains code for the Xen hypervisor. A hypervisor is software or hardware that allows users to run multiple operating systems on a single computer. This means that the xen code would allow users to have two or more Linux system running on one computer at the same time. Users could also run Windows, Solaris, FreeBSD, or some other operating system on the Linux system. There are many other folders under drivers, but they are too numerous to mention in this article, but they will in a later article.

**firmware** - The firmware folder contains code that allows the computer to read and understand signals from devices. For illustration, a webcam manages its own hardware, but the computer must understand the signals that the webcam is sending the computer. The Linux system will then use the vicam firmware to understand the webcam. Otherwise, without firmware, the Linux system does not know how to process the information that the webcam is sending. Also, the firmware helps the Linux system to send messages to the device. The Linux system could then tell the webcam to refocus or turnoff.

**fs** - This is the FileSystem folder. All of the code needed to understand and use filesystems is here. Inside this folder, each filesystem's code is in its own folder. For instance, the ext4 filesystem's code is in the ext4 folder. Within the fs folder, developers will see some files not in folders. These files handle filesystems overall. For example, mount.h would contain code for mounting filesystems. A filesystem is a structured way to store and manage files and directories on a storage device. Each filesystem has its own advantages and disadvantages. These are due to the programming of the filesystem. For illustration, the NTFS filesystem supports transparent compression (when enabled, files are automatically compressed without the user noticing). Most filesystems lack this feature, but they could only possess this ability if it is programmed into the files in the fs folder.

**include** - The include folder contains miscellaneous header files that the kernel uses. The name for the folder comes from the C command "include" that is used to import a header into C code upon compilation.

**init** - The init folder has code that deals with the startup of the kernel (INITiation). The main.c file is the core of the kernel. This is the main source code file the connects all of the other files.

**ipc** - IPC stands for Inter-Process Communication. This folder has the code that handles the communication layer between the kernel and processes. The kernel controls the hardware and programs can only ask the kernel to perform a task. Assume a user has a program that opens the DVD tray. The program does not open the tray directly. Instead, the program informs the kernel that the tray should be opened. Then, the kernel opens the tray by sending a signal to the hardware. This code also manages the kill signals. For illustration, when a system administrator opens a process manager to close a program that has locked-up, the signal to close the program is called a kill signal. The kernel receives the signal and then the kernel (depending on which type of kill signal) will ask the program to stop or the kernel will simply take the process out of the memory and CPU. Pipes used in the command-line are also used by the IPC. The pipes tell the kernel to place the output data on a physical page on in memory. The program or command receiving the data is given a pointer to the page on memory.

**kernel** - The code in this folder controls the kernel itself. For instance, if a debugger needed to trace an issue, the kernel would use code that originated from source files in this folder to inform the debugger of all of the actions that the kernel performs. There is also code here for keeping track of time. In the kernel folder is a directory titled "power". Some code in this folder provide the abilities for the computer to restart, power-off, and suspend.

**lib** - the library folder has the code for the kernel's library which is a set of files that that the kernel will need to reference.

**mm** - The Memory Management folder contains the code for managing the memory. Memory is not randomly placed on the RAM. Instead, the kernel places the data on the RAM carefully. The kernel does not overwrite any memory that is being used or that holds important data.

**net** - The network folder contains the code for network protocols. This includes code for IPv6 and Appletalk as well as protocols for Ethernet, wifi, bluetooth, etc. Also, the code for handling network bridges and DNS name resolution is in the net directory.

**samples** - This folder contains programming examples and modules that are being started. Assume a new module with a helpful feature is wanted, but no programmer has announced that they would work on the project. Well, these modules go here. This gives new kernel programmers a chance to help by going through this folder and picking a module they would like to help develop.

**scripts** - This folder has the scripts needed for compiling the kernel. It is best to not change anything in this folder. Otherwise, you may not be able to configure or make a kernel.

**security** - This folder has the code for the security of the kernel. It is important to protect the kernel from computer viruses and hackers. Otherwise, the Linux system can be damaged. Kernel security will be discussed in a later article.

**sound** - This directory has sound driver code for sound/audio cards.

**tools** - This directory contains tools that interact with the kernel.

**usr** - Remember the vmlinuz file and similar files mentioned in the previous article? The code in this folder creates those files after the kernel is compiled.

**virt** - This folder contains code for virtualization which allows users to run multiple operating systems at once. This is different from Xen (mentioned previously). With virtualization, the guest operating system is acting like any other application within the Linux operating system (host system). With a hypervisor like Xen, the two operating systems are managing the hardware together and the same time. In virtualization, the guest OS runs on top of the Linux kernel while in a hypervisor, there is no guest OS and all of the operating systems do not depend on each other.

Tip: Never move a file in the kernel source unless you know what you are doing. Otherwise, the compilation with fail due to a "missing" file.

The Linux kernel folder structure has remained relatively constant. The kernel developers have made some modifications, but overall, this setup is the same throughout all kernel versions. The driver folder's layout also remains about the same.

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-the-source-code.4204/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
