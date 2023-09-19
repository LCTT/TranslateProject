[#]: subject: "Install VirtualBox on Windows [So that You Can Run Linux VM]"
[#]: via: "https://itsfoss.com/install-virtualbox-windows/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install VirtualBox on Windows [So that You Can Run Linux VM]
======

VirtualBox is one of the [best virtualization software][1] out there.

If you want to [install Linux on Windows in a virtual machine using VirtualBox][2], the first step is to install the VirtualBox application itself.

We have covered a tutorial to [install VirtualBox on Ubuntu][3]. Let me highlight the steps for a Windows system.

The steps will be the same for the latest Windows 10 or 11 and older. Two easy ways to get Oracle VirtualBox installed on Windows:

  1. **Download the installer for Windows and follow the on-screen instructions**
  2. **Use the winget tool**



### 1\. Using the Windows Installer

To get started, head to [VirtualBox's official download page][4]. Click on " **Windows hosts** " option to download the .exe installer.

![][5]

Once you download the installer (.exe) file, here's what is next after launching it:

![][6]

The installation instructions let you choose a location to get it installed to. You should stick with the defaults on the C: drive to ensure everything essential gets installed for VirtualBox to work as expected.

![][7]

The installation process includes setting up virtual network interfaces. So, your network might get reset at the moment. Ensure that you are not connected to anything important at the time of installing it.

![][8]

While the networking feature gets sorted, there are also dependencies to take care of.

The Python core package needs to be installed for Python bindings to work. You do not necessarily need to install it if you would rather not control your virtual machine using Python scripts.

![][9]

However, if you think you might need them in the future, you should install it along with it.

Now, the final installation process will begin as per your preferences above, and it will present you with the option to launch VirtualBox upon closing the installer.

![][10]

**Suggested Read 📖**

![][11]

### 2\. Using the winget tool

The winget command-line tool uses the Windows Package Manager to search, install, upgrade, remove, and configure applications on Windows 10 and 11.

If you prefer to use the command-line, this is the method for you.

First, you need to launch **Command Prompt** as an **administrator**.

![][12]

Next, you need to use the winget command to install VirtualBox.

Here's the command to type in:

```

    winget install Oracle.VirtualBox

```

📋

If you are using winget for the first time, it will ask you to agree to the terms. You need to accept them to continue using it while some of your data like region gets sent to the Microsoft Store.

![][13]

### Enabling virtualization is the next step

As you can notice, both the methods install the latest VirtualBox package for Windows. So, you can get started using VirtualBox to create and manage virtual machines.

But installing VirtualBox is only the first step. You should [ensure that your Windows system is virtualization ready][14] by tweaking some settings. Here are more details.

![][11]

💬 _Did you face any issues with the process? What method do you prefer? Let me know in the comments below._

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-virtualbox-windows/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/virtualization-software-linux/
[2]: https://itsfoss.com/install-linux-in-virtualbox/
[3]: https://itsfoss.com/install-virtualbox-ubuntu/
[4]: https://www.virtualbox.org/wiki/Downloads
[5]: https://itsfoss.com/content/images/2023/07/virtualbox-exe-download.jpg
[6]: https://itsfoss.com/content/images/2023/07/vbox-installer-next.jpg
[7]: https://itsfoss.com/content/images/2023/07/vmbox-location.jpg
[8]: https://itsfoss.com/content/images/2023/07/vmbox-network-interface.jpg
[9]: https://itsfoss.com/content/images/2023/07/vmbox-dependencies.jpg
[10]: https://itsfoss.com/content/images/2023/07/vmbox-install-complete.jpg
[11]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[12]: https://itsfoss.com/content/images/2023/07/cmd-administrator.jpg
[13]: https://itsfoss.com/content/images/2023/07/winget-vbox-1.jpg
[14]: https://itsfoss.com/windows-enable-virtualization/
