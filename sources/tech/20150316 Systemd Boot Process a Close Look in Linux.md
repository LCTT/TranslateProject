Systemd Boot Process a Close Look in Linux
================================================================================
The way Linux system boots up is quite complex and there have always been need to optimize the way it works. The traditional boot up process of Linux system is mainly handled by the well know init process (also known as SysV init boot system), while there have been identified inefficiencies in the init based boot system, systemd on the other hand is another boot up manager for Linux based systems which claims to overcome the shortcomings of [traditional Linux SysV init][2] based system. We will be focusing our discussion on the features and controversies of systemd , but in order to understand it, let’s see how Linux boot process is handled by traditional SysV init based system. Kindly note that Systemd is still in testing phase and future releases of Linux operating systems are preparing to replace their current boot process with Systemd Boot manager.

### Understanding Linux Boot Process ###

Init is the very first process that starts when we power on our Linux system. Init process is assigned the PID of 1. It is parent process for all other processes on the system. When a Linux computer is started, the processor searches for the BIOS on the system memory, BIOS then tests system resources and find the first boot device, usually set as hard disk, it looks for Master Boot Record (MBR) on the hard disk, loads its contents to memory and passes control to it, the further boot process is controlled by MBR.

Master Boot Record initiates the Boot loader (Linux has two well know boot loaders, GRUB and LILO, 80% of Linux systems are using GRUB loaders), this is the time when GRUB or LILO loads the kernel module. Kernel module immediately looks for the “init” in /sbin partition and executes it. That’s from where init becomes the parent process of Linux system. The very first file read by init is /etc/inittab , from here init decides the run level of our Linux operating system. It finds partition table information from /etc/fstab file and mounts partitions accordingly. Init then launches all the services/scripts specified in the /etc/init.d directory of the default run level. This is the step where all services are initialized by init one by one.  In this process, one service at a time is started by init , all services/daemons run in the background and init keeps managing them.

The shutdown process works in pretty much the reverse function, first of all init stops all services and then filesystem is un-mounted at the last stage.

The above mentioned process has some shortcomings. The need to replace traditional init with something better have been felt from long time now. Some replacements have been developed and implemented as well. The well know replacements for this init based system as Upstart , Epoch , Mudar  and Systemd. Systemd is the one which got most attention and is considered to be better of all available alternatives.

### Understanding Systemd ###

Reducing the boot time and computational overhead is the main objective of developing the Systemd. Systemd (System Manager Daemon) , originally developed under GNU General Public License, is now  under GNU Lesser General Public License, it is most frequently discussed boot and services manager these days. If your Linux system is configured to use Systemd boot manager, then instead of traditional SysV init, startup  process will be handled by systemd.  One of the core feature of Systemd is that it supports post boot scripts of SysV Init  as well .

Systemd introduces the parallelization boot concept, it creates a sockets  for each daemon that needs to be started, these sockets are abstracted from the processes that use them so they allow daemons to interact with each other. Systemd creates news processes and assigns every process  a control group. The processes in different control groups use kernel to communicate with each others. The way [systemd handles the start up process][2] is quite neat, and much optimized as compared to the traditional init based system. Let’s review some of the core features of Systemd.

- The boot process is much simpler as compared to the init
- Systemd provides concurrent and parallel process of system boot so it ensures better boot speed
- Processes are tracked using control groups, not by PIDs
- Improved ways to handle boot and services dependencies.
- Capability of system snapshots and restore
- Monitoring of started services ; also capabale of restarting any crashed services
- Includes systemd-login module to control user logins.
- Ability to add and remove components
- Low memory foot prints and ability for job scheduling
- Journald module for event logging and syslogd module for system log.

Systemd handles system shutdown process in well organized way as well. It has three script located inside /usr/lib/systemd/ directory, named systemd-halt.service , systemd-poweroff.service , systemd-reboot.service . These scripts are executed when user choose to shutdown, reboot or halt Linux system. In the event of shutdown, systemd first  un-mount all file systems and disabled all swap devices, detaches the storage devices and kills remaining processes.

![](http://images.linoxide.com/systemd-boot-process.jpg)

### Structural Overview of Systemd ###

Let’s review Linux system boot process with some structural details when it is using systemd as boot and services manager. For the sake of simplicity, we are listing the process in steps below:

**1.**  The very first steps when you power on your system is the  BIOS initialization. BIOS reads the boot device settings, locates and hands over control to MBR (assuming hard disk is set as first boot device).

**2.**  MBR reads information from Grub or LILO boot loader and initializes the kernel.  Grub or LILO will specify how to handle further system boot up. If you have specified systemd as boot manager in grub configuration file, then the further boot process will be handled by systemd. Systemd handles boot and services management process using “targets”. The ”target" files in systemd are used for grouping different boot units and start up synchronization processes.

**3.**  The very first target executed by systemd is **default.target**. But default.target is actually a symlink to **graphical.target**.  Symlink in linux works just like shortcuts in Windows. Graphical.target file is located at /usr/lib/systemd/system/graphical.target path. We have shown the contents of graphical.target file in the following screenshot.

![](http://blog.linoxide.com/wp-content/uploads/2015/03/graphical1.png)

**4.** At this stage, **multi-user.target** has been invoked and  this target keeps its further sub-units inside  “/etc/systemd/system/multi-user.target.wants” directory. This target sets the environment for multi user support. None root users are enabled at this stage of boot up process. Firewall related services are started on this stage of boot as well.

![](http://blog.linoxide.com/wp-content/uploads/2015/03/multi-user-target1.png)

"multi-user.target" passes control to another layer “**basic.target**”.

![](http://blog.linoxide.com/wp-content/uploads/2015/03/Basic-Target.png)

**5.** "basic.target" unit is the one that starts usual services specially graphical manager service. It uses /etc/systemd/system/basic.target.wants directory to decide which services need to be started, basic.target passes on control to **sysinit.target**.

![](http://blog.linoxide.com/wp-content/uploads/2015/03/Sysint-Target.png)

**6.** "sysinit.target" starts important system services like file System mounting, swap spaces and devices, kernel additional options etc. sysinit.target passes on startup process to **local-fs.target**. The contents of this target unit are shown in the following screenshot.

![](http://blog.linoxide.com/wp-content/uploads/2015/03/local-FS-Target.png)

**7.** local-fs.target , no user related services are started by this target unit, it handles core low level services only. This target is the one performing actions on the basis of /etc/fstab and /etc/inittab files.

### Analyzing System Boot Performancev ###

Systemd offers tool to identify and troubleshoot boot related issues or performance concerns. **Systemd-analyze** is a built-in command which lets you examine boot process. You can find out the units which are facing errors during boot up and can further trace and correct boot component issues. Some useful systemd-analyze commands are listed below.

**systemd-analyze time** shows the time spent in kernel,  and normal user space.

    $ systemd-analyze time

    Startup finished in 1440ms (kernel) + 3444ms (userspace)

**systemd-analyze blame** prints a list of all running units, sorted  by the time taken by then to initialize, in this way you can have idea of which services are taking long time to start during boot up.

    $ systemd-analyze blame
    
    2001ms mysqld.service
    234ms httpd.service
    191ms vmms.service

**systemd-analyze verify** shows if there are any syntax errors in the system units. **Systemd-analyze plot** can be used to write down whole startup process to a SVG formate file. Whole boot process is very lengthy to read, so using this command we can dump the output of whole boot processing into a file and then can read and analyze it further. The following command will take care of this.

    systemd-analyze plot > boot.svg

### Systemd Controversies ###

Systemd has not been lucky to receive love from everyone, some professionals and administrators have different opinions on its working and developments.  Per critics of Systemd, it’s “not Unix-like” because it tried to replace some system services.  Some professionals don’t like the idea of using binary configuration files as well. It is said that editing systemd configuration is not an easy tasks and there are no graphical tools available for this purpose.

### Test Systemd on Ubuntu 14.04 and  12.04 ###

Originally, Ubuntu decided to replace their current boot process with Systemd in Ubuntu 16.04 LTS. Ubuntu 16.04 is supposed to be released in  April 2016, but considering the popularity and demand for Systemd, the upcoming **Ubuntu 15.04** will have it as its default boot manager. Good news is that the user of Ubuntu 14.04 Trusty Tahr And Ubuntu 12.04 Precise Pangolin can still test Systemd on their machines. The test process is not very complex, all you need to do is to include the related PPA to the system, update repository and perform system upgrade.

**Disclaimer** : Please note that its still in testing and development stages for Ubuntu. Testing packages might have any unknown issues and in worst case scenario,  they might break your system configurations. Make sure you backup your important data before trying this upgrade.

Run following command on the terminal to add ppa to the your ubuntu system:

    sudo add-apt-repository ppa:pitti/systemd

You will be seeing warning message here because we are trying to use temporary/testing PPA which is not recommended for production machines.

![](http://blog.linoxide.com/wp-content/uploads/2015/03/PPA-Systemd1.png)

Now update the APT Package Manager repositories by running the following command.

    sudo apt-get update

![](http://blog.linoxide.com/wp-content/uploads/2015/03/Update-APT1.png)

Perform system upgrade by running the following command.

    sudo apt-get dist-upgrade

![](http://blog.linoxide.com/wp-content/uploads/2015/03/System-Upgrade.png)

That’s all, you should be able to see configuration files of systemd on your ubuntu system now, just browse to the /lib/systemd/ directory and see the files there.

Alright, it’s time we edit grub configuration file and specify systemd as default Boot Manager. Edit grub file using Gedit text editor.

    sudo gedit /etc/default/grub

![](http://blog.linoxide.com/wp-content/uploads/2015/03/Edit-Grub.png)

Here edit  GRUB_CMDLINE_LINUX_DEFAULT parameter in this file and specify the value of this parameter as: "**init=/lib/systemd/systemd**"

![](http://blog.linoxide.com/wp-content/uploads/2015/03/Grub-Systemd.png)

That’s all, your ubuntu system is no longer using  its traditional boot manager, its using Systemd Manager now. Reboot your system and see the systemd boot up process. 

![](http://blog.linoxide.com/wp-content/uploads/2015/03/Sytemd-Boot.png)

### Conclusion ###

Systemd is no doubt a step forward towards improving Linux Boot process; it’s an awesome suite of libraries and daemons that together improve the system boot and shutdown process. Many linux distributions are preparing to support it as their official boot manager. In future releases of Linux distros, we can hope to see systemd startup. But on the other hand, in order to succeed and to be adopted on the wide scale, systemd should address the concerns of critics as well.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/systemd-boot-process/

作者：[Aun Raza][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/
[1]:http://linoxide.com/booting/boot-process-of-linux-in-detail/
[2]:http://0pointer.de/blog/projects/self-documented-boot.html