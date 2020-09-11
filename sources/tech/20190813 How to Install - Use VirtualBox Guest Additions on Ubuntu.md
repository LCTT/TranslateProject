[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install & Use VirtualBox Guest Additions on Ubuntu)
[#]: via: (https://itsfoss.com/virtualbox-guest-additions-ubuntu/)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

How to Install & Use VirtualBox Guest Additions on Ubuntu
======

_**Brief: Install VirtualBox Guest Additions in Ubuntu and with this you’ll be able to copy-paste, drag and drop between the host and guest system. It makes using Ubuntu in virtual machine a lot easier.**_

The VirtualBox Guest Additions consist of device drivers and system applications that optimize the operating system for better performance and usability. These drivers provide a tighter integration between the guest and host systems.

No matter how you are using your Virtual Machine, Guest Additions can be very helpful for you. For example, I test many installations and applications inside a VM and take a lot of screenshots. It comes in very handy to be able to move those screenshots freely between the Host OS and the Guest OS.

Guest? Host? What’s that?

If you are not aware already, you should know the terminology first.
Host system is your actual operating system installed on your physical system.
Guest system is the virtual machine you have installed inside your host operating system.

Before you see the steps to install VirtualBox Guest Additions in Ubuntu, let’s first talk about its features.

### Why should you use VirtualBox Guest Additions?

![][1]

With VirtualBox Guest Additions enabled, using the virtual machine becomes a lot more comfortable. Don’t believe me? Here are the important features that the Guest Additions offer:

  * **Mouse pointer integration**: You no longer need to press any key to “free” the cursor from the Guest OS.
  * **Shared clipboard**: With the Guest Additions installed, you can copy-paste between the guest and the host operating systems.
  * **Drag and drop**: You can also drag and drop files between the host and the guest OS.
  * **Shared folders**: My favorite feature; this feature allows you to exchange files between the host and the guest. You can tell VirtualBox to treat a certain host directory as a shared folder, and the program will make it available to the guest operating system as a network share, irrespective of whether guest actually has a network.
  * **Better video support**: The custom video drivers that are installed with the Guest Additions provide you with extra high and non-standard video modes, as well as accelerated video performance. It also allows you to resize the virtual machine’s window. The video resolution in the guest will be automatically adjusted, as if you had manually entered an arbitrary resolution in the guest’s Display settings.
  * **Seamless windows**: The individual windows that are displayed on the desktop of the virtual machine can be mapped on the host’s desktop, as if the underlying application was actually running on the host.
  * **Generic host/guest communication channels**: The Guest Additions enable you to control and monitor guest execution. The “guest properties” provide a generic string-based mechanism to exchange data bits between a guest and a host, some of which have special meanings for controlling and monitoring the guest. Applications can be started in the Guest machine from the Host.
  * **Time synchronization**: The Guest Additions will resynchronize the time with that of the Host machine regularly. The parameters of the time synchronization mechanism can be configured.
  * **Automated logins**: Basically credentials passing, it can be a useful feature.



[][2]

Suggested read  How To Extract Audio From Video In Ubuntu Linux

Impressed by the features it provides? Let’s see how you can install VirtualBox Guest Additions on Ubuntu Linux.

### Installing VirtualBox Guest Additions on Ubuntu

The scenario here is that you have [Ubuntu Linux installed inside VirtualBox][3]. The host system could be any operating system.

I’ll demonstrate the installation process on a minimal install of a Ubuntu virtual machine. First run your virtual machine:

![VirtualBox Ubuntu Virtual Machine][4]

To get started, select **Device &gt; Insert Guest Additions CD image…**:

![Insert Guest Additions CD Image][5]

This will provide you with the required installer inside the guest system (i.e. the virtual operating system). It will try auto-running, so just click **Run**:

![AutoRun Guest Additions Installation][6]

This should open up the installation in a terminal window. Follow the on-screen instructions and you’ll have the Guest Additions installed in a few minutes at most.

**Troubleshooting tips:**

If you get an error like this one, it means you are missing some kernel modules (happens in some cases, such as minimal installs):

![Error while installing Guest Additions in Ubuntu][7]

You need to install a few more packages here. Just to clarify, you need to run these commands in the virtual Ubuntu system:

```
sudo apt install build-essential dkms linux-headers-$(uname -r)
```

Now run the Guest Addition setup again:

```
sudo rcvboxadd setup
```

### Using VirtualBox Guest Addition features

Here are some screenshots for enabling/using helpful features of VirtualBox Guest Additions in use:

#### Change the Virtual Screen Resolution

![Change Virtual Screen Resolution][8]

#### Configure Drag And Drop (any files)

You can enable drag and drop from the top menu -&gt; Devices -&gt;Drag and Drop -&gt; Bidirectional.

With Bidirectional, you can drag and drop from guest to host and from host to guest, both.

![Drag and Drop][9]

##### Configure Shared Clipboard (for copy-pasting)

Similarly, you can enable shared clipboard from the top menu -&gt; Devices -&gt; Shared Clipboard -&gt; Bidirectional.

![Shared Clipboard][10]

### Uninstalling VirtualBox Guest Additions

Navigate to the CD image and open it in terminal (**Right Click** inside directory &gt; **Open in Terminal**):

![Open in Terminal][11]

Now enter:

```
sh ./VBoxLinuxAdditions.run uninstall
```

However, in some cases you might have to do some more cleanup. Use the command:

```
/opt/VBoxGuestAdditions-version/uninstall.sh
```

**Note:** _Replace **VBoxGuestAdditions-version** with the right version (you can hit **tab** to autocomplete; in my case it is **VBoxGuestAdditions-6.0.4**)._

### Wrapping Up

Hopefully by now you have learned how to install and use the VirtualBox Guest Additions in Ubuntu. Let us know if you use these Additions, and what feature you find to be the most helpful!

[][12]

Suggested read  Fix Grub Not Showing For Windows 10 Linux Dual Boot

--------------------------------------------------------------------------------

via: https://itsfoss.com/virtualbox-guest-additions-ubuntu/

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/virtual-box-guest-additions-ubuntu.png?resize=800%2C450&ssl=1
[2]: https://itsfoss.com/extract-audio-video-ubuntu/
[3]: https://itsfoss.com/install-linux-in-virtualbox/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/07/virtualbox_ubuntu_virtual_machine.png?fit=800%2C450&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/install_guest_additions.png?fit=800%2C504&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/autorun_guest_additions_installation.png?fit=800%2C602&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/07/guest_additions_terminal_output.png?fit=800%2C475&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/change_virtual_screen_resolution.png?fit=744%2C800&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/drag_and_drop.png?fit=800%2C352&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/shared_clipboard.png?fit=800%2C331&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/open_in_terminal.png?fit=800%2C537&ssl=1
[12]: https://itsfoss.com/no-grub-windows-linux/
