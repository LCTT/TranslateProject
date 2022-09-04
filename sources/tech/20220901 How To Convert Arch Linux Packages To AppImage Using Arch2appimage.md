[#]: subject: "How To Convert Arch Linux Packages To AppImage Using Arch2appimage"
[#]: via: "https://ostechnix.com/convert-arch-linux-packages-to-appimage/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Convert Arch Linux Packages To AppImage Using Arch2appimage
======
Arch2appimage - A Python script to convert any arch linux package to an AppImage

We already have discussed how to convert a DEB package to an Arch Linux package format with **[Debtap][1]** utility. We also have seen how to use **[Alien][2]** tool to convert Linux packages to different formats. Today, we will be discussing yet another Linux package converter tool named **Arch2appimage**. In this guide, we will see a brief introduction to Arch2appimage, and how to install Arch2appimage in Linux and how to **convert Arch Linux packages to AppImage** format with Arch2appimage application.

### What Is Arch2appimage?

**Arch2appimage** is a Python script to convert any Arch linux package (official/AUR) to an AppImage format. Arch2appimage downloads the AUR source code, compiles it and finally converts the package to an AppImage executable file.

Arch2appimage packages the given package to AppImage format including all necessary dependencies. It includes not only the dependencies, but also the dependencies to the dependencies for **better compatibility**.

Why would I convert an Arch linux package into appimage format? You might winder. AUR (Arch User Repository) is an unofficial, community-driven, and largest software repository that hosts user-created Arch Linux packages. AUR has every kind of packages in it. You may find an interesting package that is only available in AUR and want to use it on a different Linux platform, say Fedora. This is where Arch2Appimage utility comes in help.

Using Arch2Appimage script, you can easily convert an Arch Linux package file to the AppImage format without much hassle. It is quite helpful to pack one package and run in another distribution, for example Fedora, Debian, openSUSE or any Linux distribution that supports AppImage format..

As you may already, AppImage is one of the popular universal package format. Unlike the platform-specific package formats like `.pkg`, `.deb`, `.rpm` etc., an AppImage file is completely portable and AppImages can run on virtually any Linux system.

Please note that Arch2appimage needs an Arch Linux and its variants like EndeavourOS or Manjaro Linux. Because it uses **[Yay][3]** under the hood to download the packages. However, the developer says you could modify the script to use your compiler as long as dependencies are met.

Arch2appimage is written in **Python** and the source code is freely available in GitHub.

### Install Arch2appimage In Arch Linux

To be able to run Arch2appimage in your Arch Linux system, make sure you have installed **Python 3** and **[Pip][4]** package manager to install the dependencies.

Git clone the Arch2appimage repository:

```
$ git clone https://github.com/redicculus/arch2appimage.git
```

This will cone the contents of Arch2appimage repository in a local folder called **arch2appimage**. Cd into the arch2appimage directory:

```
$ cd arch2appimage
```

And then install Arch2appimage using command:

```
$ pip3 install -r requirements.txt
```

This should be enough to run Arch2appimage on your system. It is time to pack your favorite Arch Linux packages to AppImage format.

### Convert Arch Linux Packages To AppImage Format Using Arch2appimage

Launch Arch2appimage script using command:

```
$ python3 arch2appimage.py
```

You will be asked a series of questions. Read the questions carefully and answer them accordingly.

![Convert Arch Linux Packages To AppImage Format][5]

First, enter the name of the package that you want to convert into AppImage format. For demonstration purpose, I am going to package **"Gedit"** application. The source code of "Gedit" package will be downloaded from AUR.

```
Convert any Arch linux package (official/AUR) to AppImage!!
Loading Chaotic AUR package list...

Enter the name of the package (leave empty to quit)
[?] >>: gedit
Downloading gedit...
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 2.1/2.1 MB • 1.4 MB/s • 0:00:00
```

Choose an icon to be used for your application (i.e. gedit). Arch2appimage will give two or more choices. You can choose a suitable icon from the list.

```
Please select the icon file to be used
[?] >>: AppDir/usr/share/icons/hicolor/scalable/apps/org.gnome.gedit.svg
 > AppDir/usr/share/icons/hicolor/scalable/apps/org.gnome.gedit.svg
   AppDir/usr/share/icons/hicolor/symbolic/apps/org.gnome.gedit-symbolic.svg
```

Arch2appimage utility will show you the list of packages to be downloaded. If you want to add additional packages, simply enter its name, else press ENTER to continue.

```
These packages (and their dependencies) will be downloaded:
1. gtksourceview4
2. gsettings-desktop-schemas
3. libpeas
4. gspell
5. python-gobject

If you would like to add additional packages please enter them below (space seperated). Leave empty to start downloading
[?] >>: 
Downloading gtksourceview4...
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.0/1.0 MB • 841.4 kB/s • 0:00:00   
Downloading gsettings-desktop-schemas...
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 684.8/684.8 kB • 762.1 kB/s • 0:00:00   
Downloading libpeas...
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 144.0/144.0 kB • 366.0 kB/s • 0:00:00   
Downloading gspell...
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 125.9/125.9 kB • 325.7 kB/s • 0:00:00   
Downloading python-gobject...
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 260.1/260.1 kB • 420.5 kB/s • 0:00:00
```

You will be asked to download latest version of **libunionpreload.so** package. You can choose either "yes" or "No". If you choose Yes, a latest version of the above package will be downloaded or the existing old version will be used.

```
Would you like to download the latest libunionpreload.so? If you select No the existing one will be used.
[?] >>: Yes
 > Yes
   No

Downloading libunionpreload.so...
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 22.6/22.6 kB • ? • 0:00:00
```

Now the package is ready to be converted to AppImage format. The package source code and its dependencies will be downloaded and kept in **arch2appimage/AppDir** directory.

You can choose the option either "Build the AppImage" to convert the given package to AppImage or choose "Add more packages" option to add other packages. I choose **"Build the AppImage"** option.

```
AppDir is ready. Please take a look into the directory to ensure everything is OK.
Exec the AppRun (command './AppRun') to test if everything works.

What would you like to do next?
[?] >>: Build the AppImage
 > Build the AppImage
   Add more packages
```

Next, choose "Yes" to download the latest AppImageTool (Appimagetool is a tool that lets you generate AppImage files.) or "No" to use the existing one. I go with Yes.

Congratulations! The Gedit package is converted into AppImage format and saved in `arch2appimage/out` directory.

```
Would you like to download the latest AppImageTool? If you select No the existing one will be used.
[?] >>: Yes
 > Yes
   No

Downloading AppImageTool...
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 8.2/8.2 MB • 3.7 MB/s • 0:00:00   
Running AppImageTool...

appimagetool, continuous build (commit 4bcfe23), build <local dev build> built on 2022-08-17 01:03:50 UTC
Using architecture x86_64
/home/ostechnix/arch2appimage/AppDir should be packaged as out/gedit-x86_64.AppImage
Deleting pre-existing .DirIcon
Creating .DirIcon symlink based on information from desktop file
Generating squashfs...
Parallel mksquashfs: Using 2 processors
Creating 4.0 filesystem on out/gedit-x86_64.AppImage, block size 131072.
[====================================================================================================================/] 2371/2371 100%

Exportable Squashfs 4.0 filesystem, gzip compressed, data block size 131072
	compressed data, compressed metadata, compressed fragments,
	compressed xattrs, compressed ids
	duplicates are removed
Filesystem size 7284.77 Kbytes (7.11 Mbytes)
	24.68% of uncompressed filesystem size (29513.93 Kbytes)
Inode table size 26215 bytes (25.60 Kbytes)
	27.56% of uncompressed inode table size (95103 bytes)
Directory table size 22102 bytes (21.58 Kbytes)
	27.04% of uncompressed directory table size (81735 bytes)
Number of duplicate files found 49
Number of inodes 2848
Number of files 2338
Number of fragments 228
Number of symbolic links  105
Number of device nodes 0
Number of fifo nodes 0
Number of socket nodes 0
Number of directories 405
Number of ids (unique uids + gids) 1
Number of uids 1
	root (0)
Number of gids 1
	root (0)
Embedding ELF...
Marking the AppImage as executable...
Embedding MD5 digest
Success

Please consider submitting your AppImage to AppImageHub, the crowd-sourced
central directory of available AppImages, by opening a pull request
at https://github.com/AppImage/appimage.github.io
```

Next, you will be asked if you want to rebuild the package again. Choosing "Yes" to build the gedit application again and choosing "No" will exit the process. I don't want to restart the building process, so I choose No.

```
Would you like to re-build it?
[?] >>: No
   Yes
 > No
```

Finally choose "Yes" to remove the AppDir and close Archappimage utility.

```
Would you like to remove AppDir/
[?] >>: Yes
 > Yes
   No

Exiting...
```

That's it. The gedit package is converted to AppImage format and the resulting file is saved in **arch2appimage/out** directory.

```
[ostechnix@manjaro arch2appimage]$ ls out/
gedit-x86_64.AppImage
```

You can now run the AppImage file using command:

```
[ostechnix@manjaro arch2appimage]$ ./out/gedit-x86_64.AppImage
```

You can also double click the AppImage file to launch it from your graphical file manager application.

![Launch Gedit Application AppImage][6]

The AppImage file is packaged with all necessary dependencies. So you can run it on any Linux distribution without installing it or any other additional application.

If you want to integrate the Appimage files to your application launcher, refer the following link.

* [Integrate AppImages To Application Menu Using AppImageLauncher][7]

### Conclusion

Arch2appimage is very new project. So you should expect bugs. I tested Arch2appimage only for a brief time in my Manjaro Linux desktop. It works fine with Gedit application. I tested a few other applications such as pacman and yt-dlp. But they didn't work. Arch2appimage kept asking me to enter the path to the `.desktop` file. I don't know where it is. I guess all issues will be sorted out in the stable version.

**Resource:**

* [Arch2appimage GitHub Repository][8]

--------------------------------------------------------------------------------

via: https://ostechnix.com/convert-arch-linux-packages-to-appimage/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/convert-deb-packages-arch-linux-packages/
[2]: https://ostechnix.com/convert-linux-packages-alien/
[3]: https://ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[4]: https://ostechnix.com/manage-python-packages-using-pip/
[5]: https://ostechnix.com/wp-content/uploads/2022/09/Convert-Arch-Linux-Packages-To-AppImage-Format.png
[6]: https://ostechnix.com/wp-content/uploads/2022/09/Launch-Gedit-Application-AppImage.png
[7]: https://ostechnix.com/integrate-appimages-to-application-menu-using-appimagelauncher/
[8]: https://github.com/redicculus/arch2appimage
