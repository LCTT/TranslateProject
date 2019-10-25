[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Go About Linux Boot Time Optimisation)
[#]: via: (https://opensourceforu.com/2019/10/how-to-go-about-linux-boot-time-optimisation/)
[#]: author: (B Thangaraju https://opensourceforu.com/author/b-thangaraju/)

How to Go About Linux Boot Time Optimisation
======

[![][1]][2]

_Booting an embedded device or a piece of telecommunication equipment quickly is crucial for time-critical applications and also plays a very major role in improving the user experience. This article gives some important tips on how to enhance the boot-up time of any device._

Fast booting or fast rebooting plays a crucial role in various situations. It is critical for an embedded system to boot up fast in order to maintain the high availability and better performance of all the services. Imagine a telecommunications device running a Linux operating system that does not have fast booting enabled. All the systems, services and the users dependent on that particular embedded device might be affected. It is really important that devices maintain high availability in their services, for which fast booting and rebooting play a crucial role.

A small failure or shutdown of a telecom device, even for a few seconds, can play havoc with countless users working on the Internet. Thus, it is really important for a lot of time-dependent devices and telecommunication devices to incorporate fast booting in their devices to help them get back to work quicker. Let us understand the Linux boot-up procedure from Figure 1.

![Figure 1: Boot-up procedure][3]

![Figure 2: Boot chart][4]

**Monitoring tools and the boot-up procedure**
A user should take note of a number of factors before making changes to a machine. These include the current booting speed of the machine and also the services, processes or applications that are taking up resources and increasing the boot-up time.

**Boot chart:** To monitor the boot-up speed and the various services that start while booting up, the user can install the boot chart using the following command:

```
sudo apt-get install pybootchartgui.
```

Each time you boot up, the boot chart saves a _.png_ (portable network graphics) ﬁle in the log, which enables the user to view the _png_ ﬁles to get an understanding about the system’s boot-up process and services. Use the following command for this purpose:

```
cd /var/log/bootchart
```

The user might need an application to view the _.png_ ﬁles. Feh is an X11 image viewer that targets console users. It doesn’t have a fancy GUI, unlike most other image viewers, but it simply displays pictures. Feh can be used to view the _.png_ ﬁles. You can install it using the following command:

```
sudo apt-get install feh
```

You can view the _png_ ﬁles using _feh xxxx.png_.
Figure 2 shows the boot chart when a boot chart _png_ file is viewed.
However, a boot chart is not necessary for Ubuntu versions later than 15.10. To get very brief information regarding boot up speed, use the following command:

```
systemd-analyze
```

![Figure 3: Output of systemd-analyze][5]

Figure 3 shows the output of the command _systemd-analyze_.
The command _systemd-analyze_ blame is used to print a list of all running units based on the time they took to initialise. This information is very helpful and can be used to optimise boot-up times. systemd-analyze blame doesn’t display results for services with _Type=simple_, because systemd considers such services to be started immediately; hence, no measurement of the initialisation delays can be done.

![Figure 4: Output of systemd-analyze blame][6]

Figure 4 shows the output of _systemd-analyze_ blame.
The following command prints a tree of the time-critical chain of units:

```
command systemd-analyze critical-chain
```

Figure 5 shows the output of the command _systemd-analyze critical-chain_.

![Figure 5: Output of systemd-analyze critical-chain][7]

**Steps to reduce the boot-up time**
Shown below are the various steps that can be taken to reduce boot-up time.

**BUM (Boot-Up-Manager):** BUM is a run level configuration editor that allows the configuration of _init_ services when the system boots up or reboots. It displays a list of every service that can be started at boot. The user can toggle individual services on and off. BUM has a very clean GUI and is very easy to use.

BUM can be installed in Ubuntu 14.04 using the following command:

```
sudo apt-get install bum
```

To install it in versions later than 15.10, download the packages from the link _<http://apt.ubuntu.com/p/bum> 13_.

Start with basic things and disable services related to the scanner and printer. You can also disable Bluetooth and all other unwanted devices and services if you are not using any of them. I strongly recommend that you study the basics about the services before disabling them, as it might affect the machine or operating system. Figure 6 shows the GUI of BUM.

![Figure 6: BUM][8]

**Editing the rc file:** To edit the rc ﬁle, you need to go to the rc directory. This can be done using the following command:

```
cd /etc/init.d.
```

However, root privileges are needed to access _init.d_, which basically contains start/stop scripts that are used to control (start, stop, reload, restart) the daemon while the system is running or during boot.

The _rc_ ﬁle in _init.d_ is called a run control script. During booting, init executes the _rc_ script and plays its role. To improve the booting speed, we make changes to the _rc_ ﬁle. Open the _rc_ ﬁle (once you are in the _init.d_ directory) using any ﬁle editor.

For example, by entering _vim rc_, you can change the value of _CONCURRENCY=none_ to _CONCURRENCY=shell_. The latter allows certain startup scripts to be executed simultaneously, rather than serially.

In the latest versions of the kernel, the value should be changed to _CONCURRENCY=makeﬁle_.
Figures 7 and 8 show the comparison of boot-up times before and after editing the rc ﬁle. The improvement in the boot-up speed can be noticed. The time to boot before editing the rc ﬁle was 50.98 seconds, whereas the time to boot after making the changes to the rc ﬁle is 23.85 seconds.
However, the above-mentioned changes don’t work on operating systems later than the Ubuntu version 15.10, since the operating systems with the latest kernel use the systemd ﬁle and not the _init.d_ file any more.

![Figure 7: Boot speed before making changes to the rc file][9]

![Figure 8: Boot speed after making changes to the rc file][10]

**E4rat:** E4rat stands for e4 ‘reduced access time’ (ext4 ﬁle system only). It is a project developed by Andreas Rid and Gundolf Kiefer. E4rat is an application that helps in achieving a fast boot with the help of defragmentation. It also accelerates application startups. E4rat eliminates both seek times and rotational delays using physical ﬁle reallocation. This leads to a high disk transfer rate.
E4rat is available as a .deb package and you can download it from its official website _<http://e4rat.sourceforge.net/>_.

Ubuntu’s default ureadahead package conﬂicts with e4rat. So a few packages have to be installed using the following command:

```
sudo dpkg purge ureadahead ubuntu-minimal
```

Now install the dependencies for e4rat using the following command:

```
sudo apt-get install libblkid1 e2fslibs
```

Open the downloaded _.deb_ ﬁle and install it. Boot data is now needed to be gathered properly to work with e4rat.

Follow the steps given below to get e4rat running properly and to increase the boot-up speed.

  * Access the Grub menu while booting. This can be done by holding the shift button when the system is booting.
  * Choose the option (kernel version) that is normally used to boot and press ‘e’.
  * Look for the line starting with _linux /boot/vmlinuz_ and add the following code at the end of the line (hit space after the last letter of the sentence):



```
- init=/sbin/e4rat-collect or try - quiet splash vt.handsoff =7 init=/sbin/e4rat-collect
```

  * Now press _Ctrl+x_ to continue booting. This lets e4rat collect data after booting. Work on the machine, open and close applications for the next two minutes.
  * Access the log ﬁle by going to the e4rat folder and using the following command:



```
cd /var/log/e4rat
```

  * If you do not ﬁnd any log ﬁle, repeat the above mentioned process. Once the log ﬁle is there, access the Grub menu again and press ‘e’ as your option.
  * Enter ‘single’ at the end of the same line that you have edited before. This will help you access the command line. If a different menu appears asking for anything, choose Resume normal boot. If you don’t get to the command prompt for some reason, hit Ctrl+Alt+F1.
  * Enter your details once you see the login prompt.
  * Now enter the following command:



```
sudo e4rat-realloc /var/lib/e4rat/startup.log
```

This process takes a while, depending on the machine’s disk speed.

  * Now restart your machine using the following command:



```
sudo shutdown -r now
```

  * Now, we need to conﬁgure Grub to run e4rat at every boot.
  * Access the grub ﬁle using any editor. For example, _gksu gedit /etc/default/grub._
  * Look for a line starting with _GRUB CMDLINE LINUX DEFAULT=_, and add the following line in between the quotes and before whatever options there are:



```
init=/sbin/e4rat-preload 18
```

  * It should look like this:



```
GRUB CMDLINE LINUX DEFAULT = init=/sbin/e4rat- preload quiet splash
```

  * Save and close the Grub menu and update Grub using _sudo update-grub_.
  * Reboot the system and you will ﬁnd noticeable changes in boot speed.



Figures 9 and 10 show the differences between the boot-up time before and after installing e4rat. The improvement in the boot-up speed can be noticed. The time taken to boot before using e4rat was 22.32 seconds, whereas the time taken to boot after using e4rat is 9.065 seconds

![Figure 9: Boot speed before using e4rat][11]

![Figure 10: Boot speed after using e4rat][12]

**A few simple tweaks**
A good boot-up speed can also be achieved using very small tweaks, two of which are listed below.
**SSD:** Using solid-state devices rather than normal hard disks or other storage devices will surely improve your booting speed. SSDs also help in achieving great speeds in transferring ﬁles and running applications.

**Disabling GUI:** The graphical user interface, desktop graphics and window animations take up a lot of resources. Disabling the GUI is another good way to achieve great boot-up speed.

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/10/how-to-go-about-linux-boot-time-optimisation/

作者：[B Thangaraju][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/b-thangaraju/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Screenshot-from-2019-10-07-13-16-32.png?resize=696%2C496&ssl=1 (Screenshot from 2019-10-07 13-16-32)
[2]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Screenshot-from-2019-10-07-13-16-32.png?fit=700%2C499&ssl=1
[3]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-1.png?resize=350%2C302&ssl=1
[4]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-2.png?resize=350%2C412&ssl=1
[5]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-3.png?resize=350%2C69&ssl=1
[6]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-4.png?resize=350%2C535&ssl=1
[7]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-5.png?resize=350%2C206&ssl=1
[8]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-6.png?resize=350%2C449&ssl=1
[9]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-7.png?resize=350%2C85&ssl=1
[10]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-8.png?resize=350%2C72&ssl=1
[11]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-9.png?resize=350%2C61&ssl=1
[12]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-10.png?resize=350%2C61&ssl=1
