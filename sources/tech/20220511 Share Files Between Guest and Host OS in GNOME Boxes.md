[#]: subject: "Share Files Between Guest and Host OS in GNOME Boxes"
[#]: via: "https://itsfoss.com/share-files-gnome-boxes/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Share Files Between Guest and Host OS in GNOME Boxes
======
Using GNOME Boxes tool for virtual machines but cannot figure out how to share files between the host OS and the OS in VM? This tutorial will help you with that.

[GNOME Boxes][1] is a VirtualBox and VM Ware like virtualization tool focusing on desktop Linux. It provides a simple GUI to create and manage virtual operating systems.

Virtual machines are a good way to test another operating system or distribution (in Linux context).

One of the pain points you’ll experience with VMs is the trouble in copying-pasting and file sharing between the guest and host systems.

Imagine you saved a file in the virtual machines but now you need it in your actual host system outside the VM. The ability to share the files between the two systems makes the VM experience quite smooth.

Let me show you how to do file sharing with GNOME Boxes. It consists of three steps:

* Installing the required package on the guest OS (VM) to enable file sharing
* Knowing how to transfer files from the host OS to the guest OS (drag and drop)
* Knowing how to transfer files from the guest OS to the host OS (through a shared folder)

**Note: Guest OS is the operating system inside the VM. Host OS is the main operating system where you are running the GNOME Boxes.**

### Install the required package on guest OS

Your guest OS (Linux distribution in the VM) needs a SPICE package in order to share files with the host OS (the main operating system).

On Debian, Ubuntu and Fedora based distributions, this package is named **spice-webdavd**. You can use your distribution’s package manager to install it inside the guest OS (running in the virtual machine).

For Ubuntu and Debian based systems, use this command:

```
sudo apt install spice-webdavd
```

For [Fedora based distributions][2], use this command:

```
sudo dnf install spice-webdavd
```

Restart the guest OS.

Remember that you need this package on all the guest operating systems. So every time you create a new VM, you have to take care of this package.

### Transfer files from the host OS to the guest OS

This is the simpler of the two. You just have to drag the desired file to the guest OS running in the VM.

You’ll see that when you are dragging the file to the VM, it starts showing a ‘Ready to Recieve File’ option.

![Drag and drop files to the guest OS from host OS][3]

The transferred files are saved in the Downloads directory.

**Alternatively**, you can also send files from the GNOME Boxes menu. Just hit the hamburger menu and click on Send File option.

![Sending files in GNOME Boxes][4]

### Transfer files from the guest OS to the host OS

This one is not as straightforward as dragging and dropping.

Here, you use the [SPICE protocol][5] to mount a folder of the host OS. You drop the files here and it is transferred to that folder on the host.

The package you installed earlier was required for this kind of operation.

Click on the hamburger menu and select the Preferences option.

![Select GNOME Boxes Preferences][6]

Here, go to the **Devices & Shares** tab. Look under the **Shared Folder** section. You should see a **+ button. Click on it,** and it will give the default location of the Public folder on your host operating system. You can change it to any folder of your liking.

![Sharing host OS’s folder in GNOME Boxes][7]

With that set, open the **File Explorer in the guest OS**. Here, click on the **Other Locations** option (in GNOME’s Nautilus file explorer).

![Mount Spice client folder][8]

This will mount the Spice client folder.

![mounting spice client folder GNOME Boxes][9]

Enter this mounted folder and you should see the folder you had added via the Preference menu here. In the screenshot below, I have two shared folder (because I added another one later on).

![mounted spice client folders][10]

In the shared folders, you can create new folders or copy-paste the files. They will be immediately available in the host OS.

I shared two screenshots taken in the guest OS and put them in the mounted Spice client folder.

![Sharing files from the guest OS to the host OS][11]

It immediately appeared in the public folder of the host OS.

![Shared files appear in the host OS][12]

Of course, it’s a two-way sharing. If you put something in the shared folder on the host OS, it will be accessible in the mounted folder in the guest OS.

Note that you have added the host OS’s folder on GNOME Boxes level. This means that if you have multiple VMs, all of them should be able to mount that folder.

To keep things organized, you may add multiple shared folders and name them in a way that you can recognize which VM uses them.

### Did it work for you?

GNOME Boxes is a pretty good tool for trying various Linux distributions as virtual machines. You can **also share the clipboard between the guest and host systems** with the method described here. This means that if you copied some text in the host OS, you could paste it into the guest OS and vice versa.

This is pretty much what you need to know and do about sharing files between guest and host OS with GNOME Boxes.

Do let me know if you managed to make it work or if you still face issues. The comment section is all yours.

--------------------------------------------------------------------------------

via: https://itsfoss.com/share-files-gnome-boxes/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://help.gnome.org/users/gnome-boxes/stable/
[2]: https://itsfoss.com/best-fedora-linux-distributions/
[3]: https://itsfoss.com/wp-content/uploads/2022/05/drag-drop-guest-host-gnome-boxes.webp
[4]: https://itsfoss.com/wp-content/uploads/2022/05/sending-files-in-gnome-boxes.png
[5]: https://www.spice-space.org/spice-user-manual.html
[6]: https://itsfoss.com/wp-content/uploads/2022/05/gnome-boxes-preferences.png
[7]: https://itsfoss.com/wp-content/uploads/2022/05/share-folder-GNOME-Boxes.png
[8]: https://itsfoss.com/wp-content/uploads/2022/05/mount-spice-folder-gnome-boxes-800x511.png
[9]: https://itsfoss.com/wp-content/uploads/2022/05/mounting-spice-client-folder-gnome-boxes-800x511.png
[10]: https://itsfoss.com/wp-content/uploads/2022/05/mounted-spice-client-folders-800x517.png
[11]: https://itsfoss.com/wp-content/uploads/2022/05/sharing-files-from-guest-to-host-os-gnome-boxes-800x511.png
[12]: https://itsfoss.com/wp-content/uploads/2022/05/shared-files-between-host-guest-800x463.png
