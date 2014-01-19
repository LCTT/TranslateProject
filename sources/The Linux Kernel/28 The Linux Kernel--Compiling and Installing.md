liuaiping翻译中
28 The The Linux Kernel--Compiling and Installing
================================================================================
![](http://www.linux.org/attachments/slide-jpg.762/)

Aloha! After you have spent a lot of time configuring your kernel to make the kernel you need, you can now compile it. The source code is C code in the form of plain text. This is readable to humans but not computers. Compiling the code converts the code to a form computers understand called binary (ones [on] and zeros [off]). Compilation will also make all of those kernel files one file called the kernel.

To compile the kernel, type "make" in a terminal that is in the same directory as the kernel's source code folders. This will take some time. Once done, the modules must be compiled by typing "make modules". To make the compiling process easier from the beginning, type "make; make modules". This will make the kernel and then the modules instead of the user coming back later to type "make modules".

![](http://www.linux.org/attachments/compiling_01-png.763/)

WARNING: Before you install a kernel, backup all of the important data. Be sure to make a copy of /boot/ onto a FAT32 memory card. This helps to repair the system if the installation fails. FAT32 does not store permissions, so it will be easier to use a live disk to copy the files back. Remember to set the original file permissions and executable bits.

Once the compilation has finished successfully, we can then install the kernel to the local system (I will explain how to install the kernel on other systems in a moment [cross-compiling]). In the same terminal, after compilation, type "make install". This will place some files in the /boot/ directory. The "vmlinuz" (or some similar name) is the kernel itself. "initrd" is the temporary RAM-based filesystem that is placed in memory and used during boot-up. The "System-map" contains a list of kernel symbols. These are global variables and functions used in the kernel's code. "config" is the configuration file for the kernel. grub.cfg will automatically be updated. However, some other bootloaders may need to be manually configured. The kernel installer can configure the Grub, LILO, and SysLinux bootloader automatically. Bootloaders like BURG may need to be manually configured. The modules must also be installed by typing "make modules_install".

![](http://www.linux.org/attachments/compiling_04-png.764/)

NOTE: Both the kernel and modules can be installed using one line - “make install && make modules_install”

![](http://www.linux.org/attachments/compiling_05-png.765/)

Once that process is complete, the user can ensure the kernel was installed by restarting the system and typing "uname -r" in a terminal when the system is back on. If the system fails to boot or uname reports a different version number than expected, the issue may be due to one of many issues. Either the bootloader was improperly setup, feature/configuration conflict, compilation error, improperly installed, or some other reason. The best way to start finding the source of the issue is to look at the systems logs (if the system boots up enough to produce logs). "dmesg" is a command that prints the kernels logs to the screen. Look for any errors, warnings, or unexpected results. If the system does not boot or does not boot-up enough to produce logs, use a live Linux disc to perform diagnostics and repairs. If all else fails, compile the kernel again and make sure you installed the kernel as Root or used "sudo".

NOTE: The best way to repair such a system is to use a live Linux distro to remove the new/broken kernel and then manually fix (or paste a backup) Grub's files.

Some Linux users like to have the documentation installed as well, but this is not required. For those that like to have the documentation installed, type this line where version is the kernel version - "install -d /usr/share/doc/linux-VERSION && cp -r Documentation/* /usr/share/doc/linux-VERSION" (VERSION is the kernel's version number). Obviously, Root privileges are required.

To compile a newer kernel with the same features as your current kernel, then type this command "zcat /proc/config.gz > .config". This file may not exist, if so, you may be able to ask the developers of your distro/kernel for the file. The "zcat" command uncompresses the data and places it in the file ".config". Remember to type where you want ".config". This file is to be placed in the Linux kernel directory and allow it to replace the current file. Then, compile and install the kernel as you normally would.

Cross-compiling is slightly different. Configure the kernel for the intended system. Make sure that when the kernel was configured, that it was configured with cross-piling in mind. When cross-compiling, their are two terms to be familiar with. "Host" is the system performing the compilation. The "Target" is the system that will receive the new kernel. Make sure that the host system has the proper compilers. For example, to cross-compile for ARM systems, users will need gcc-arm-linux-gnueabi on the host system. Generally, the developer can do a search in their package manager or Google for the proper/best cross-compiler for their needs. The specific command used to cross-compile for ARM systems is "make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi-". The "ARCH=arm" refers to the target's processor type and "CROSS_COMPILE" declares the cross-compiler. Notice that the cross-compiler is missing the "gcc-" at the beginning and ends in a dash. That is the format users must use when using the cross-compiler as a parameter. The modules can be cross-compiled by typing "make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- modules". To install the kernel on the target system, copy the Linux kernel folder to the target system. Once the files are on the target system and a terminal is open in that directory, type "make install && make modules_install". Of course, you must be Root or use "sudo".

INFO: Kernel.org hosts a list of supported cross-compilers ([https://www.kernel.org/pub/tools/crosstool/][1]).

### Compilation and Installation Summary: ###

#### Standard: ####

    make && make modules && make install && make modules_install

#### Make a newer version or remix of your kernel: ####

    zcat /proc/config.gz > .config &&  make && make modules && make install && make modules_install

#### Cross-compile: ####

    make ARCH={TARGET-ARCHITERCTURE} CROSS_COMPILE={COMPILER}; make ARCH={TARGET-ARCHITERCTURE} CROSS_COMPILE={COMPILER} modules && make install && make modules_install

In the next article, we will discuss adding and activating modules. Mahalo!

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-compiling-and-installing.5208/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://www.kernel.org/pub/tools/crosstool/
