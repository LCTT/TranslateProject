How To Create Custom Ubuntu Live CD Image
======
![](https://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-720x340.png)

Today let us discuss about how to create custom Ubuntu live cd image (ISO). We already have done this using [**Pinguy Builder**][1]. But, It seems to be discontinued now. I don't see any updates lately from the Pinguy builder official site. Fortunately, I found an alternative tool to create Ubuntu live cd images. Meet **Cubic** , acronym for **C** ustom **Ub** untu **I** SO **C** reator, a GUI application to create a customized bootable Ubuntu Live CD (ISO) image.

Cubic is being actively developed and it offers many options to easily create a customized Ubuntu live cd. It has an integrated command-line chroot environment where you can do all customization, such as installing new packages, Kernels, adding more background wallpapers, adding additional files and folders. It has an intuitive GUI interface that allows effortless navigation (back and forth with a mouse click) during the live image creation process. You can create with a new custom image or modify existing projects. Since it is used to make Ubuntu live images, I believe it can be used in other Ubuntu flavours and derivatives such as Linux Mint.

### Install Cubic

Cubic developer has made a PPA to ease the installation process. To install Cubic on your Ubuntu system, run the following commands one by one in your Terminal:
```
sudo apt-add-repository ppa:cubic-wizard/release
```
```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6494C6D6997C215E
```
```
sudo apt update
```
```
sudo apt install cubic
```

### Create Custom Ubuntu Live Cd Image Using Cubic

Once installed, launch Cubic from application menu or dock. This is how Cubic looks like in my Ubuntu 16.04 LTS desktop system.

Choose a directory for your new project. It is the directory where your files will be saved.

[![][2]][3]

Please note that Cubic will not create a live cd of your system. Instead it just creates a custom live cd from an Ubuntu installation cd. So, you should have a latest ISO image in hand.

Choose the path where you have stored your Ubuntu installation ISO image. Cubic will automatically fill out all details of your custom OS. You can change the details if you want. Click Next to continue.

[![][2]][4]

Next, the compressed Linux file system from the source installation medium will be extracted to your project's directory (i.e **/home/ostechnix/custom_ubuntu** in our case).

[![][2]][5]

Once the file system extracted, you will be landed to chroot environment automatically. If you don't see Terminal prompt, press the ENTER key few times.

[![][2]][6]

From here you can install any additional packages, add background images, add software sources repositories list, add latest Linux kernel to your live cd and all other customization.

For example, I want vim installed in my live cd, so I am going to install it now.

[![][2]][7]

We don't need to "sudo", because we are already in root environment.

Similarly, install any additional Linux Kernel version if you want.
```
apt install linux-image-extra-4.10.0-24-generic
```

Also, you can update software sources list (Add or remove repositories list):

[![][2]][8]

After modifying the sources list, don't forget to run "apt update" command to update the sources list:
```
apt update
```

Also, you can add files or folders to the live cd. Copy the files/folders (right click on them and choose copy or CTRL+C) and right click in the Terminal (inside Cubic window), choose **Paste file(s)** and finally click Copy in the bottom corner of the Cubic wizard.

[![][2]][9]

**Note for Ubuntu 17.10 users: **

In Ubuntu 17.10 system, the DNS lookup may not work in chroot environment. If you are making a custom Ubuntu 17.10 live image, you need to point the correct file resolve.conf file:
```
ln -sr /run/systemd/resolve/resolv.conf /run/systemd/resolve/stub-resolv.conf

```

To verify DNS resolution works, run:
```
cat /etc/resolv.conf
ping google.com
```

Add your own wallpapers if you want. To do so, go to the **/usr/share/backgrounds/** directory,
```
cd /usr/share/backgrounds
```

and drag/drop the images into the Cubic window. Or copy the images and right click on Cubic Terminal window and choose **Paste file(s)** option. Also, make sure you have added the new wallpapers in an XML file under **/usr/share/gnome-background-properties** , so you can choose the newly added image **Change Desktop Background** dialog when you right-click on your desktop. When you made all changes, click Next in Cubic wizard.

In the next, choose Linux Kernel version to use when booting into the new live ISO. If you have installed any additional kernels, they will also listed in this section. Just choose the Kernel you'd like to use in your live cd.

[![][2]][10]

In the next section, select the packages that you want to remove from your live image. The selected packages will be automatically removed after the Ubuntu OS has been installed using the custom live image. Please be careful while choosing the packages to remove, you might have unknowingly removed a package that depends on another package.

[![][2]][11]

Now, the live image creation process will start. It will take some time depending upon your system's specifications.

[![][2]][12]

Once the image creation process completed, click Finish. Cubic will display the newly created custom image details.

If you want to modify the newly create custom live image in the future, **uncheck** the option that says **" Delete all project files, except the generated disk image and the corresponding MD5 checksum file"**. Cubic will left the custom image in the project's working directory, you can make any changes in future. You don't have start all over again.

To create a new live image for different Ubuntu versions, use a different project directory.

### Modify Custom Ubuntu Live Cd Image Using Cubic

Launch Cubic from menu, and select an existing project directory. Click the Next button, and you will see the following three options:

  1. Create a disk image from the existing project.
  2. Continue customizing the existing project.
  3. Delete the existing project.



[![][2]][13]

The first option will allow you to create a new live ISO image from your existing project using the same customization you previously made. If you lost your ISO image, you can use the first option to create a new one.

The second option allows you to make any additional changes in your existing project. If you choose this option, you will be landed into chroot environment again. You can add new files or folders, install any new softwares, remove any softwares, add other Linux kernels, add desktop backgrounds and so on.

The third option will delete the existing project, so you can start all over from the beginning. Please that this option will delete all files including the newly generated ISO.

I made a custom Ubuntu 16.04 LTS desktop live cd using Cubic. It worked just fine as described here. If you want to create an Ubuntu live cd, Cubic might be good choice.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/create-custom-ubuntu-live-cd-image/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/pinguy-builder-build-custom-ubuntu-os/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-1.png ()
[4]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-2.png ()
[5]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-3.png ()
[6]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-4.png ()
[7]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-6.png ()
[8]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-5.png ()
[9]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-7.png ()
[10]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-8.png ()
[11]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-10-1.png ()
[12]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-12-1.png ()
[13]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-13.png ()
