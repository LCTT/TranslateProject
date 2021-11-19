[#]: subject: "Create Windows, macOS, and Linux Virtual Machines Easily With QEMU-based Quickgui"
[#]: via: "https://itsfoss.com/quickgui/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Create Windows, macOS, and Linux Virtual Machines Easily With QEMU-based Quickgui
======

_**Brief:** Quickgui aims to be a simpler alternative to VirtualBox and help create virtual machines quickly. Let us take a look at it._

At present, it is fairly easy to create virtual machines thanks to programs like VirtualBox, VMware, and a few others.

You can still [install VirtualBox in your Linux system][1] to proceed. But, in this article, I put my focus on an exciting tool that’s simple to use, works fast, and quickly helps you to spin up a virtual machine, i.e., Quickgui.

### Quickgui: A GUI Front-End to Quickemu

![][2]

Quickemu is a terminal-based tool that lets you create optimized desktop virtual machines and manage them with ease. The tool focuses on getting rid of all the nuances to configure the virtual machine. Instead, it chooses the best configuration as per available system resources for the virtual machine to work.

Not just limited to the configuration, but it will also download the image for the operating system (using quickget package).

So, all you have to do is install the operating system as you would normally do and get started.

Quickemu utilizes [QEMU][3] at its core, with the aim to replace VirtualBox with Bash and QEMU.

QEMU is an open-source machine emulator and virtualizer.

Quickemu is an interesting project by [Martin Wimpress][4] (Ubuntu MATE Lead) with the help of several contributors.

And, to complement this tool, Quickgui is a front-end that uses [Flutter][5] by another set of developers to help facilitate the use of Quickemu without the terminal.

Here, we focus on the front-end Quickgui that uses Quickemu to create and manage virtual machines.

### Features of Quickgui

![Running VMs using Quickgui on Zorin OS 16][6]

As mentioned above, Quickgui as a front-end utilizes Quickemu at its core. So, you can expect the same functionality here.

Some of the things that you can do with it include:

  * Search for operating systems and download them to create virtual machines.
  * Manage your existing virtual machines.
  * Creates default configurations when you set up a virtual machine.
  * Dark mode available.
  * Supports creating Windows and macOS virtual machines out of the box.
  * Support for various Linux distributions including elementaryOS, ZorinOS, Ubuntu, and more.
  * FreeBSD and OpenBSD support.
  * EFI and Legacy BIOS.
  * Does not need elevated permissions to work.
  * Host/Guest clipboard sharing by default.
  * Select image compression method.
  * Ability to disable input.
  * Toggle available USB devices from host/guest in a virtual machine.
  * Includes the support for [SPICE connections][7].
  * Network port forwarding.
  * Samba file sharing.
  * VirGL acceleration.
  * Smartcard pass-through.



The feature set is impressive given how simple and easy it is to use. Let me give you some pointers to get started.

### Getting Started With Quickgui

The user interface is really straightforward, you get the options to “**Manage existing machines**” and “**Create new machines**“.

You need to hit create to start making a virtual machine.

![Quickgui VM Creation][8]

Select the operating system, you should get a list of it. If you can’t find the target OS, simply search for it, and it should show up.

![][9]

You get a wide variety of options. Select the desired OS, and its version, in the next selection. And, hit “**Download**“.

It should download the recovery image or the ISO, depending on the OS you’re trying. The download will depend on your internet connection, but it worked flawlessly.

If you want to download the ISO yourself, you will have to create the configuration for it and set it up. Take a look at [Quickemu’s GitHub page][10] to explore instructions for it.

![][11]

You just need to click on “**Dismiss**” once the download’s complete.

For this article, I tested spinning up a Linux virtual machine ([elementary OS 6][12]), a macOS instance, and a Windows VM.

I was successful running Linux and macOS as VMs. However, I had some issues setting up a Windows VM quickly. I could not find any information regarding that on Quickemu’s GitHub page, so I didn’t bother troubleshooting much.

If you require using Windows VMs, you might want to try it for yourself and reach out to them in their [Discord se][13][r][13][ver][13] for help.

You do not necessarily need to change the configuration of a VM to make it work. Hence, it turns out to be a time-saver.

### Installing Quickgui in Linux

To use Quickgui, you need to have Quickemu installed first.

For Ubuntu-based distros, you can install it using a PPA:

```

    sudo apt-add-repository ppa:flexiondotorg/quickemu
    sudo apt update
    sudo apt install quickemu

```

It should install everything you require (along with quickget package) to make it work.

Once done, you can proceed installing Quickgui using another PPA:

```

    sudo add-apt-repository ppa:yannick-mauray/quickgui
    sudo apt update
    sudo apt install quickgui

```

If you are using other Linux distributions, you can refer to [Quickemu’s GitHub page][10] and explore [Quickgui’s GitHub][14] for more instructions.

[Quickgui][14]

### Wrapping Up

Quickgui makes it convenient to utilize Quickemu’s abilities to quickly create and manage multiple VMs without needing to configure anything.

What’s more interesting: you do not need elevated privileges to make it work.

So, if you are looking for a VirtualBox replacement, this could be the answer. Or, you could also try [GNOME Boxes][15] as a simpler alternative.

What do you think about Quickgui? Let me know your thoughts in the comments down below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/quickgui/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-virtualbox-ubuntu/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/quickgui-emu.png?resize=800%2C547&ssl=1
[3]: https://www.qemu.org/
[4]: https://twitter.com/m_wimpress
[5]: https://itsfoss.com/install-flutter-linux/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/quickgui-vms.png?resize=800%2C450&ssl=1
[7]: https://www.spice-space.org/index.html
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/quickgui-select.png?resize=800%2C534&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/quickgui-quickemu-selection.png?resize=800%2C559&ssl=1
[10]: https://github.com/wimpysworld/quickemu
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/quickemu-gui-mac.png?resize=800%2C552&ssl=1
[12]: https://news.itsfoss.com/elementary-os-6-features/
[13]: https://discord.com/invite/sNmz3uw
[14]: https://github.com/quickgui/quickgui
[15]: https://help.gnome.org/users/gnome-boxes/stable/
