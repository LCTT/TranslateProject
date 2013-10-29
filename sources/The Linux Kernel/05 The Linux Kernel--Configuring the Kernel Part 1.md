Translating------------------geekpi

05 The Linux Kernel: Configuring the Kernel Part 1
================================================================================
![](http://www.linux.org/attachments/slide-jpg.299/)

Now that we understand the Linux kernel, we can move on to the main event - configuring and compiling the code. Configuring code for the kernel does take a lot of time. The configuration tool asks many questions and allows developers to configure every aspect of the kernel. If unsure about any question or feature, it is best to pick the default value provided by the configuration tool. This tutorial series will walk readers through the whole process of configuring the kernel.

To configure the code, open a terminal in the main source code folder. Once a terminal is up, there are a few ways to configure the code based on the preferred configuration interface.

make config - Plain text interface (most commonly used choice)
make menuconfig - Text-based with colored menus and radiolists. This options allows developers to save their progress. - ncurses (ncurses-devel) must be installed
make nconfig - Text-based colored menus - curses (libcdk5-dev) must be installed
make xconfig - QT/X-windows interface – QT is required
make gconfig - Gtk/X-windows interface – GTK is required
make oldconfig - Plain text interface that defaults questions based on the local config file
make silentoldconfig - This is the same as oldconfig except the questions answered by the config file will not be shown
make olddefconfig - This is like silentoldconfig except some questions are answered by their defaults
make defconfig - This option creates a config file that uses default settings based on the current system's architecture.
make ${PLATFORM}_defconfig - Creates a config file using values from arch/$ARCH/configs/${PLATFORM}_defconfig.
make allyesconfig - This option creates a config file that will answer yes to as many questions as possible.
make allmodconfig - This option creates a config file that will make as many parts of the kernel a module as possible

NOTE: Code in the Linux kernel can be put in the kernel itself or made as a module. For instance, users can add Bluetooth drivers as a module (separate from the kernel), add to the kernel itself, or not add at all. When code is added to the kernel itself, the kernel requires more RAM space and boot-up time may take longer. However, the kernel will perform better. If code is added as modules, the code will remain on the hard-drive until the code is needed. Then, the module is loaded to RAM. This will reduce the kernel's RAM usage and decrease boot time. However, the kernel's performance may suffer because the kernel and the modules will be spread throughout the RAM. The other choice is to not add some code. For illustration, a kernel developer may know that a system will never use Bluetooth devices. As a result, the drivers are not added to the kernel. This improves the kernel's performance. However, if users later need Bluetooth devices, they will need to install Bluetooth modules or update the whole kernel.

make allnoconfig - This option creates a config file that will only add essential code to the kernel; this answers no to as many questions as possible. This can sometimes make a kernel that does not work on the hardware it was compiled on.
make randconfig - This option makes random choices for the kernel
make localmodconfig - This option creates a config file based on the current list of loaded modules and system configuration.
make localyesconfig - This will set all module options to yes - most (or all) of the kernel will not be in modules

TIP: It is best to use “make menuconfig” because users can save their progress. “make config” does not offer this luxury. Because the configuration process takes a lot of time,

### Configuration: ###

Most developers choose "make menuconfig" or one of the other graphical menus. After typing the desired command, the first question asks whether the kernel to be built is going to be a 64-bit kernel or not. The choices are "Y", "n", and "?". The question mark explains the question, "n" answers no to the question, and "Y" answers yes to the question. For this tutorial, I will choose yes. To do this I type "Y" (this is case-insensitive) and hit enter.


NOTE: If the kernel is compiled on a 32-bit system, then the configuration tool would ask if the kernel should be 32-bit. The first question is different on other processors.

The next line shows "Cross-compiler tool prefix (CROSS_COMPILE) []". If you are not cross-compiling, hit enter. If you are cross-compiling, type something like "arm-unknown-linux-gnu-" for ARM systems or "x86_64-pc-linux-gnu-" for 64-bit PC systems. There are many other possible commands for other processor types, but the list can be quite large. Once a developer knows what processor they want to support, it is easy to research the command needed for that processor.

NOTE: Cross-compiling is compiling code to be used on other processors. For illustration, an Intel system that is cross-compiling code is making applications for processors other than Intel. So, this system may be compiling code for ARM or AMD processors.

NOTE: Each choice will change which questions come up and when they are displayed. I will include my choices so readers can follow the configuration process on their own system.

Next, users will see "Local version - append to kernel release (LOCALVERSION) []". This is where developers can give a special version number or name to their customized kernel. I will type "LinuxDotOrg". The kernel version is now “3.9.4-LinuxDotOrg”. Next, the configuration tool asks "Automatically append version information to the version string (LOCALVERSION_AUTO) [N/y/?]". If a git tree is found, the revision number will be appended. This example is not using git, so I will answer no. Other wise the git revision number will be appended to the version. Remember vmlinuz and similar files? Well, the next question asks which compression format should be used. The developer can choose one through five. The choices are

1. Gzip (KERNEL_GZIP)
2. Bzip2 (KERNEL_BZIP2)
3. LZMA (KERNEL_LZMA)
4. XZ (KERNEL_XZ)
5. LZO (KERNEL_LZO)

Gzip is the default, so I will press “1” and hit enter. Each compression format has greater or less compression ratios compared to the other formats. A better compression ratio means a smaller file, but more time is needed to uncompress the file while the opposite applies to lower compression ratios.

Now, this line is displayed - “Default hostname (DEFAULT_HOSTNAME) [(none)]”. The default hostname can be configured. Usually, developers leave this blank (I left it blank) so that Linux users can set up their own hostname.

Next, developers can enable or disable the use of swap space. Linux uses a separate partition called “swap space” to use as virtual memory. This is equivalent to Windows' paging file. Typically, developers answer yes for the line “Support for paging of anonymous memory (swap) (SWAP) [Y/n/?]”.

The next line (System V IPC (SYSVIPC) [Y/n/?]) asks if the kernel should support IPC. Inter Process Communication allows processes to communicate and sync. It is best to enable IPC, otherwise, many applications will not work. Answering yes to this question will cause the configuration tool to ask “POSIX Message Queues (POSIX_MQUEUE) [Y/n/?]”. This question will only be seen if IPC is enabled. POSIX message queues is a messaging queue (a form of interprocess communication) where each message is given a priority. The default choice is yes. Hit enter to choose the default choice (indicated by the capitalized choice).

The next question (open by fhandle syscalls (FHANDLE) [Y/n/?]) is asking if programs will be permitted to use file handles instead of filenames when performing filesystem operations if needed. By default, the answer is yes.

Sometimes, when a developer has made certain choices, some questions will automatically be answered. For instance, the next question (Auditing support (AUDIT) [Y/?]) is answered yes without prompting because previous choices require this feature. Auditing-support logs the accesses and modifications of all files. The next question relates to auditing (Enable system-call auditing support (AUDITSYSCALL) [Y/n/?]). If enabled, all system calls are logged. If the developer wants performance, then as much auditing features as possible should be disabled and not added to the kernel. Some developers may enable auditing for security monitoring. I will select “no” for this question. The next audit question (Make audit loginuid immutable (AUDIT_LOGINUID_IMMUTABLE) [N/y/?]) is asking if processes can change their loginuid (LOGIN User ID). If enabled, processes in userspace will not be able to change their own loginuids. For better performance, we will disable this feature.

NOTE: When configuring via “make config”, the questions that are answered by the configuration tool are displayed, but the user does not have a way to change the answer. When configuring via “make menuconfig”, the user cannot change the option no matter what button is pressed. Developers should not want to change options like that anyway because a previous choice requires another question to be answered a certain way.

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-1.4274/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出