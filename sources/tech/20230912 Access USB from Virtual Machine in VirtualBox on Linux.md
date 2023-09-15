[#]: subject: "Access USB from Virtual Machine in VirtualBox on Linux"
[#]: via: "https://itsfoss.com/virtualbox-access-usb/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Access USB from Virtual Machine in VirtualBox on Linux
======

When you plug in a USB, your host OS can easily access it and use the files on it. That's not a surprise.

If you are using virtual machines with Virtual Box on Linux, you can put some effort and access the USB plugged in to your physical machine from the VM.

Let me walk you through step-by-step how you can access a USB disk in VirtualBox VM.

### How to access a USB drive in VirtualBox VM

By default, you can not use VirtualBox to access the USB drive as you have to install the extension pack manager and additionally, a little configuration part is also there.

This is the reason why I've divided this tutorial into three easy steps. So let's start with the first one.

#### Step 1: Install the VirtualBox extension pack (on host)

This is the most important step of this tutorial as you are about to install an extension of VirtualBox which will enable you to use a USB drive in a VM.

🚧

You should install the same version extension pack as your installed version of VirtualBox.

To install the VirtualBox extension pack, simply visit the [official download page of VirtualBox][1], scroll down a bit and there you will find an option to download the extension pack:

![][2]

Once you are done downloading the extension pack follow 3 simple steps:

  * Go to `File` > `Tools` > `Extension Pack Manager`
  * Hit the `Install` button
  * Select the downloaded file from the file manager:



![Click to expand][3]

It will open a new prompt to install the extension pack where all you have to do is hit the Install button and accept the terms and conditions:

![Click to expand][4]

And we are done with the installation of the extension pack.

#### Step 2: Add the user to the vboxusers group (on host)

To use a USB drive in VirtualBox, your current user needs to be in the `vboxusers` group.

I know it sounds a little complex but [adding a user to the group][5] is one command process and to add your user to `vboxusers group can be done by following:

```

    sudo usermod -aG vboxusers $USER

```

**Once you are done with these two steps, reboot your system to take effect from the steps.**

#### **Step 3: Add USB drive to VM**

🚧

Before you add a USB for a specific VM, make sure it is powered off (not saved) or you won't be able to follow the given instructions.

To add USB for VM, you have to follow the given simple steps:

  * Select the VM on which you want to use USB and hit `Settings`
  * Go to `USB` tab
  * Check the `Enable USB Controller` box and select the USB by clicking on `+` button:



![][6]

And that's it! Now you can start your VM and the USB drive should reflect in the file manager. In my case it was Ubuntu, so it looked like this:

![][7]

### More USB and VM trick

If using USB in a VM looks cool to you, booting from it in the VM is even cooler! And here's a detailed guide on [how to boot from a USB drive in VirtualBox][8]:

![][9]

I hope you will find this guide helpful.

--------------------------------------------------------------------------------

via: https://itsfoss.com/virtualbox-access-usb/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://www.virtualbox.org/wiki/Downloads
[2]: https://itsfoss.com/content/images/2023/09/download-VirtualBox-extension-pack.png
[3]: https://itsfoss.com/content/images/2023/09/Install-VirtualBox-extension-pack-to-use-USB-in-VM.png
[4]: https://itsfoss.com/content/images/2023/09/Install-VirtualBox-extension-pack.png
[5]: https://learnubuntu.com/add-user-group/
[6]: https://itsfoss.com/content/images/2023/09/Enable-USB-drive-for-VM-in-VirtualBox.png
[7]: https://itsfoss.com/content/images/2023/09/Use-USB-drive-in-VirtualBox-VM-1.png
[8]: https://itsfoss.com/virtualbox-boot-from-usb/
[9]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
