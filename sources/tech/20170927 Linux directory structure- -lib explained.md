Linux directory structure: /lib explained
======
[![lib folder linux][1]][1]

We already explained other important system folders like /bin, /boot, /dev, /etc etc folders in our previous posts. Please check below links for more information about other stuff which you are interested. In this post, we will see what is /lib folder all about.

[**Linux Directory Structure explained: /bin folder**][2]

[**Linux Directory Structure explained: /boot folder**][3]

[**Linux Directory Structure explained: /dev folder**][4]

[**Linux Directory Structure explained: /etc folder**][5]

[**Linux Directory Structure explained: /lost+found folder**][6]

[**Linux Directory Structure explained: /home folder**][7]

### What is /lib folder in Linux?

The lib folder is a **library files directory** which contains all helpful library files used by the system. In simple terms, these are helpful files which are used by an application or a command or a process for their proper execution. The commands in /bin or /sbin dynamic library files are located just in this directory. The kernel modules are also located here.

Taken an example of executing pwd command. It requires some library files to execute properly. Let us prove what is happening with pwd command when executing. We will use [the strace command][8] to figure out which library files are used.

Example:

If you observe, We just used open kernel call for pwd command. The pwd command to execute properly it will require two lib files.

Contents of /lib folder in Linux

As said earlier this folder contains object files and libraries, it's good to know some important subfolders with this directory.  And below content are for my system and you may see some variants in your system.

**/lib/firmware** - This is a folder which contains hardware firmware code.

### What is the difference between firmware and drivers?

Many devices software consists of two software piece to make that hardware properly. The piece of code that is loaded into actual hardware is firmware and the software which communicate between this firmware and kernel is called drivers. This way the kernel directly communicate with hardware and make sure hardware is doing the work assigned to it.

**/lib/modprobe.d** - Configuration directory for modprobe command

**/lib/modules** - All loadable kernel modules are stored in this directory. If you have more kernels you will see folders within this directory each represents a kernel.

**/lib/hdparm** - Contains SATA/IDE parameters for disks to run properly.

**/lib/udev** - Userspace /dev is a device manager for Linux Kernel. This folder contains all udev related files/folders like rules.d folder which contain udev specific rules.

### The /lib folder sister folders: /lib32 and /lib64

These folders contain their specific architecture library files. These folders are almost identical to /lib folder expects architecture level differences.

### Other library folders in Linux

**/usr/lib** - All software libraries are installed here. This does not contain system default or kernel libraries.

**/usr/local/lib** - To place extra system library files here. These library files can be used by different applications.

**/var/lib** - Holds dynamic data libraries/files like the rpm/dpkg database and game scores.

--------------------------------------------------------------------------------

via: https://www.linuxnix.com/linux-directory-structure-lib-explained/

作者：[Surendra Anne][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxnix.com/author/surendra/
[1]:https://www.linuxnix.com/wp-content/uploads/2017/09/The-lib-folder-explained.png
[2]:https://www.linuxnix.com/linux-directory-structure-explained-bin-folder/
[3]:https://www.linuxnix.com/linux-directory-structure-explained-boot-folder/
[4]:https://www.linuxnix.com/linux-directory-structure-explained-dev-folder/
[5]:https://www.linuxnix.com/linux-directory-structure-explainedetc-folder/
[6]:https://www.linuxnix.com/lostfound-directory-linuxunix/
[7]:https://www.linuxnix.com/linux-directory-structure-home-root-folders/
[8]:https://www.linuxnix.com/10-strace-command-examples-linuxunix/
