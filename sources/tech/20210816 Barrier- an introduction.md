[#]: subject: "Barrier: an introduction"
[#]: via: "https://fedoramagazine.org/barrier-an-introduction/"
[#]: author: "Matthew Darnell https://fedoramagazine.org/author/zexcon/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Barrier: an introduction
======

![][1]

Background for cover image excerpted from photo by [Peter Hulce][2] on [Unsplash][3]

### What is barrier?

To reduce the number of keyboards and mice you can get a physical KVM switch but the down side to the physical KVM switch is it requires you to select a device each time you want to swap. _barrier_ is a virtual KVM switch that allows one keyboard and mouse to control anything from 2-15 computers and you can even have a mix of linux, Windows or Mac.

Don’t confuse Keyboard, Video and Mouse (KVM) with Kernel Virtual Machine (KVM) they are very different and this article will be covering the former. If the Kernel Virtual Machine topic is of interest to you read through this Red Hat article <https://www.redhat.com/en/topics/virtualization/what-is-KVM> that provides an overview of the latter type of KVM.

### Installing barrier on Fedora Linux (KDE Plasma)

Enter **Alt+Ctrl+T** to display the terminal screen and you will enter the following to download _barrier_ from the Fedora system repository.

```
$ sudo dnf install barrier
```

### Installing barrier on Windows and Mac

If you are looking to install on alternate operating systems you can find the Windows and Mac downloads here: <https://github.com/debauchee/barrier/releases>.

### Nuances of version 2.3.3

  * **barrier does not support Wayland**, the default display protocol used in both Gnome and KDE, so you will need to switch your desktop to use the X11 protocol to use barrier.
  * If you are unable to move your mouse from the host to a client computer, make sure you do not have scroll lock enabled. If scroll lock is enabled it will prevent the pointer from moving to a client.
  * When using more then one Linux machine, verify you are using the same version of _barrier_ on each one (thanks to @ilikelinux for pointing this requirement out). If you need to check your version enter the following at the terminal.



```
$ dnf list barrier
```

![][4]

### To use X11 in KDE:

  1. Select the Fedora icon in the bottom left
  2. Select _Leave_ on the bottom right of the menu
  3. Select _Log Out_
  4. Select _OK_
  5. Select _Desktop Session_ on the bottom left side of the screen and select _X11_
  6. Log back in



### Set up your barrier host

At the command line type _barrier_ and the main screen will display.

```
$ barrier
```

  1. Select the check box next to _Server (share this computer’s mouse and keyboard)_
  2. Click the _Configure Server…_ button



![Barrier][5]

You should now be on the _Screens and links_ tab. Here you will see a recycle icon on the top left and a blue monitor icon on the top right.

To add a client, drag the blue monitor icon to the location you want your monitor to be when you move the mouse from your host to client device. Think of this as how you would want a multi-monitor setup to appear.

If you want to remove one drag the blue monitor to the recycle bin.

![Barrier Server Configuration][6]

After you have setup a client in the location grid, double click the same icon to open the _Screen Settings_ dialog box.

![Barrier Screen Settings][7]

  1. Fill in the _Screen name_ field with whatever name you would like.
  2. Under _Aliases_ type a different name and select _Add_.



At this point, your host is ready to go and you can click the _Start_ button on the bottom right of the screen.

![Barrier][8]

**Note:** Depending on your current [firewall configuration][9], you might need to add an exception for the _synergy_ service so that network connections to that port (24800/tcp) can get through to your barrier server. You probably want to restrict this access to only a select few source IP addresses (barrier clients).

### Set up your barrier client

The _barrier_ client side setup is very simple.

  1. Start _barrier_ on the client machine.
  2. Select the check box next to _Client (use another computer’s mouse and keyboard)_
  3. From the host computer you can look at the _IP addresses_ field and copy its value to the _Server IP_ field on the client.
  4. Click _Start_ on the bottom right.



![Client on Microsoft Windows 10][10]

### Conclusion

From this point on, you can move your mouse between each computer you added and even copy and paste text back and forth just like they are on the same computer. _barrier_ has numerous options you can use to tweak the program under the _Hotkeys_ and _Advanced server settings_ tabs on the host. Now that you are up and running, go ahead and spend time messing around with different options to see what suites you best.

**Note:** barrier requires that the remote host has a physical display (or perhaps a HDMI dummy plug). Some quick searching suggests that there might be ways to create a “virtual” display such that the remote host can run “headless”. But doing so is an extremely technical process that is beyond the scope of this article. See [here][11] for an example.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/barrier-an-introduction/

作者：[Matthew Darnell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zexcon/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/07/barrier-816x345.jpg
[2]: https://unsplash.com/@phd?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/brick-wall?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/wp-content/uploads/2021/07/BarrierInstall-1.png
[5]: https://fedoramagazine.org/wp-content/uploads/2021/07/BarrierHostMain.png
[6]: https://fedoramagazine.org/wp-content/uploads/2021/07/BarrierHostConfig.png
[7]: https://fedoramagazine.org/wp-content/uploads/2021/07/BarrierHostScreenSettings.png
[8]: https://fedoramagazine.org/wp-content/uploads/2021/07/BarrierHostMain-1.png
[9]: https://opensource.com/article/18/9/linux-iptables-firewalld
[10]: https://fedoramagazine.org/wp-content/uploads/2021/07/BarrierClient-1.png
[11]: https://joonas.fi/2020/12/attach-a-keyboard-to-a-docker-container/
