PlayOnLinux For Easier Use Of Wine
======

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux-for-easier-use-of-wine_orig.jpg)

[PlayOnLinux][1] is a free program that helps to install, run, and manage Windows software on Linux. It can also manage virtual C: drives (known as Wine prefixes), and download and install certain Windows libraries for getting some software to run on Wine properly. Creating different drives using different Wine versions is also possible. It is very handy because what runs well in one version may not run as well (if at all) on a newer version. There is [PlayOnMac][2] for macOS and PlayOnBSD for FreeBSD.

[Wine][3] is the compatibility layer that allows many programs developed for Windows to run under operating systems such as Linux, FreeBSD, macOS and other UNIX systems. The app database ([AppDB][4]) gives users an overview of a multitude of programs that will function on Wine, however successfully.

Both programs can be obtained using your distribution’s software center or package manager for convenience.

### Installing Programs Using PlayOnLinux

Installing software is easy. PlayOnLinux has hundreds of scripts to aid in installing different software with which to run the setup. In the sidebar, select “Install Software”. You will find several categories to choose from.

​

Hundreds of games can be installed this way.

 [![install games playonlinux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_orig.png)][5] 

​Office software can be installed as well, including Microsoft Office as shown here.

 [![microsoft office in linux playonlinux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_1_orig.png)][6] 

​Let’s install Notepad++ using the script. You can select the script to read the compatibility rating according to PlayOnLinux, and an overview of the program. To get a better idea of compatibility, refer to the WineHQ App Database and find “Browse Apps” to find a program like Notepad++.

 [![install notepad++ in linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_2_orig.png)][7] 

​Once you press “Install”, if you are using PlayOnLinux for the first time, you will encounter two popups: one to give you tips when installing programs with a script, and the other to not submit bug reports to WineHQ because PlayOnLinux has nothing to do with them.

​

​During the installation, I was given the choice to either download the setup executable, or select one on the computer. I downloaded the file but received a File Mismatch error; however, I continued and it was successful. It’s not perfect, but it is functional. (It is possible to submit bug reports to PlayOnLinux if the option is given.) 

[![bug report on playonlinux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_3_orig.png)][8] 

Nevertheless, I was able to install Notepad++ successfully, run it, and update it to the latest version (at the time of writing 7.5.3) from version 7.4.2.

​

Also during installation, it created a virtual C: drive specifically for Notepad++. As there are no other Wine versions available for PlayOnLinux to use, it defaults to using the version installed on the system. In this case, it is more than adequate for Notepad++ to run smoothly.

### Installing Non-Listed Programs

You can also install a program that is not on the list by pressing “Install Non-Listed Program” on the bottom-left corner of the install menu. Bear in mind that there is no script to install certain libraries to make things work properly. You will need to do this yourself. Look at the Wine AppDB for information for your program. Also, if the app isn’t listed, it doesn’t mean that it won’t work with Wine. It just means no one has given any information about it.

​

I’ve installed Graphmatica, a graph plotting program, using this method. First I selected the option to install it on a new virtual drive.

 [![install non listed programs on linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_4_orig.png)][9] 

​Then I selected the option to install additional libraries after creating the drive and select a Wine version to use in doing so.

 [![playonlinux setup wizard](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_5_orig.png)][10] 

​I then proceeded to select Gecko (which encountered an error for some reason), and Mono 2.10 to install.

 [![playonlinux wizard POL_install](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_6_orig.png)][11] 

​Finally, I installed Graphmatica. It’s as simple as that.

 [![software installation done playonlinux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_7_orig.png)][12] 

A launcher can be created after installation. A list of executables found in the drive will appear. Search for the app executable (may not always be obvious) which may have its icon, select it and give it a display name. The icon will appear on the desktop.

 [![install graphmatica in linux playonlinux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_8_orig.png)][13]  
 [![playonlinux install windows software](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_9_orig.png)][14] 

### Multiple “C:” Drives

Now that we have easily installed a program, let’s have a look at the drive configuration. In the main window, press “Configure” in the toolbar and this window will show.

 [![multiple c: drives in linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/editor/playonlinux_10.png?1516170517)][15] 

On the left are the drives that are found within PlayOnLinux. To the right, the “General” tab allows you to create shortcuts of programs installed on that virtual drive.

​

The “Wine” tab has 8 buttons, including those to launch the Wine configuration program (winecfg), control panel, registry editor, command prompt, etc.

 [![playonlinux configuration wine](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_11_orig.png)][16] 

​“Install Components” allows you to select different Windows libraries like DirectX 9, .NET Framework versions 2 – 4.5, Visual C++ runtime, etc., like [winetricks][17].

 [![install playonlinux components](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_12_orig.png)][18] 

“Display” allows the user to control advanced graphics settings like GLSL support, video memory size, and more. And “Miscellaneous” is for other actions like running an executable found anywhere on the computer to be run under the selected virtual drive.

### Creating Virtual Drives Without Installing Programs

To create a drive without installing software, simply press “New” below the list of drives to launch the virtual drive creator. Drives are created using the same method used in installing programs not found in the install menu. Follow the prompts, select either a 32-bit or 64-bit installation (in this case we only have 32-bit versions so select 32-bit), choose the Wine version, and give the drive a name. Once completed, it will appear in the drive list.

 [![playonlinux sandbox](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_13_orig.png)][19] 

### Managing Wine Versions

Entire Wine versions can be downloaded using the manager. To access this through the menu bar, press “Tools” and select “Manage Wine versions”. Sometimes different software can behave differently between Wine versions. A Wine update can break something that made your application work in the previous version; thus rendering the application broken or completely unusable. Therefore, this feature is one of the highlights of PlayOnLinux.

​

If you’re still on the configuration window, in the “General” tab, you can also access the version manager by pressing the “+” button next to the Wine version field.

 [![playonlinux select wine version](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_14_orig.png)][20] 

To install a version of Wine (32-bit or 64-bit), simply select the version, and press the “>” button to download and install it. After installation, if setup executables for Mono, and/or the Gecko HTML engine have not yet been downloaded by PlayOnLinux, they will be downloaded.

​

I went ahead and installed the 2.21-staging version of Wine afterward.

 [![select wine version playonlinux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_15_orig.png)][21] 

​To remove a version, press the “<” button.

### Conclusion

​This article demonstrated how to use PlayOnLinux to easily install Windows software into separate virtual C: drives, create and manage virtual drives, and manage several Wine versions. The software isn’t perfect, but it is still functional and useful. Managing different drives with different Wine versions is one of the key features of PlayOnLinux. It is a lot easier to use a front-end for Wine such as PlayOnLinux than pure Wine.


--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/playonlinux-for-easier-use-of-wine

作者：[LinuxAndUbuntu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:https://www.playonlinux.com/en/
[2]:https://www.playonmac.com
[3]:https://www.winehq.org/
[4]:http://appdb.winehq.org/
[5]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_orig.png
[6]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_1_orig.png
[7]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_2_orig.png
[8]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_3_orig.png
[9]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_4_orig.png
[10]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_5_orig.png
[11]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_6_orig.png
[12]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_7_orig.png
[13]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_8_orig.png
[14]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_9_orig.png
[15]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_10_orig.png
[16]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_11_orig.png
[17]:https://github.com/Winetricks/winetricks
[18]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_12_orig.png
[19]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_13_orig.png
[20]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_14_orig.png
[21]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/playonlinux_15_orig.png
