translating---geekpi

How to Boot Ubuntu 18.04 / Debian 9 Server in Rescue (Single User mode) / Emergency Mode
======
Booting a Linux Server into a single user mode or **rescue mode** is one of the important troubleshooting that a Linux admin usually follow while recovering the server from critical conditions. In Ubuntu 18.04 and Debian 9, single user mode is known as a rescue mode.

Apart from the rescue mode, Linux servers can be booted in **emergency mode** , the main difference between them is that, emergency mode loads a minimal environment with read only root file system file system, also it does not enable any network or other services. But rescue mode try to mount all the local file systems & try to start some important services including network.

In this article we will discuss how we can boot our Ubuntu 18.04 LTS / Debian 9 Server in rescue mode and emergency mode.

#### Booting Ubuntu 18.04 LTS Server in Single User / Rescue Mode:

Reboot your server and go to boot loader (Grub) screen and Select “ **Ubuntu** “, bootloader screen would look like below,

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Bootloader-Screen-Ubuntu18-04-Server.jpg)

Press “ **e** ” and then go the end of line which starts with word “ **linux** ” and append “ **systemd.unit=rescue.target** “. Remove the word “ **$vt_handoff** ” if it exists.

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/rescue-target-ubuntu18-04.jpg)

Now Press Ctrl-x or F10 to boot,

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/rescue-mode-ubuntu18-04.jpg)

Now press enter and then you will get the shell where all file systems will be mounted in read-write mode and do the troubleshooting. Once you are done with troubleshooting, you can reboot your server using “ **reboot** ” command.

#### Booting Ubuntu 18.04 LTS Server in emergency mode

Reboot the server and go the boot loader screen and select “ **Ubuntu** ” and then press “ **e** ” and go to the end of line which starts with word linux, and append “ **systemd.unit=emergency.target** ”

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Emergecny-target-ubuntu18-04-server.jpg)

Now Press Ctlr-x or F10 to boot in emergency mode, you will get a shell and do the troubleshooting from there. As we had already discussed that in emergency mode, file systems will be mounted in read-only mode and also there will be no networking in this mode,

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Emergency-prompt-debian9.jpg)

Use below command to mount the root file system in read-write mode,

```
# mount -o remount,rw /

```

Similarly, you can remount rest of file systems in read-write mode .

#### Booting Debian 9 into Rescue & Emergency Mode

Reboot your Debian 9.x server and go to grub screen and select “ **Debian GNU/Linux** ”

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Debian9-Grub-Screen.jpg)

Press “ **e** ” and go to end of line which starts with word linux and append “ **systemd.unit=rescue.target** ” to boot the system in rescue mode and to boot in emergency mode then append “ **systemd.unit=emergency.target** ”

#### Rescue mode :

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Rescue-mode-Debian9.jpg)

Now press Ctrl-x or F10 to boot in rescue mode

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Rescue-Mode-Shell-Debian9.jpg)

Press Enter to get the shell and from there you can start troubleshooting.

#### Emergency Mode:

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Emergency-target-grub-debian9.jpg)

Now press ctrl-x or F10 to boot your system in emergency mode

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Emergency-prompt-debian9.jpg)

Press enter to get the shell and use “ **mount -o remount,rw /** ” command to mount the root file system in read-write mode.

**Note:** In case root password is already set in Ubuntu 18.04 and Debian 9 Server then you must enter root password to get shell in rescue and emergency mode

That’s all from this article, please do share your feedback and comments in case you like this article.


--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/boot-ubuntu-18-04-debian-9-rescue-emergency-mode/

作者：[Pradeep Kumar][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxtechi.com/author/pradeep/
