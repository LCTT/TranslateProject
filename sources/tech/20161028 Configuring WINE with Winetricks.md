### Configuring WINE with Winetricks

Contents

*   *   [1. Introduction][1]
    *   [2. Installing][2]
    *   [3. Fonts][3]
    *   [4. .dlls and Components][4]
    *   [5. Registry][5]
    *   [6. Closing][6]
    *   [7. Table of Contents][7]

### Introduction

If `winecfg` is a screwdriver, `winetricks` is a power drill. They both have their place, but `winetricks` is just a much more powerful tool. Actually, it even has the ability to launch `winecfg`. 

While `winecfg` gives you the ability to change the settings of WINE itself, `winetricks` gives you the ability to modify the actual Windows layer. It allows you to install important components like `.dlls` and system fonts as well as giving you the capability to edit the Windows registry. It also has a task manager, an uninstall utility, and file browser. 

Even though `winetricks` can do all of this, the majority of the time, you're going to be using it to manage `dlls` and Windows components.

### Installing

Unlike `winecfg`, `winetricks` doesn't come with WINE. That's fine, though, since it's actually just a script, so it's very easy to download and use on any distribution. Now, many distributions do package `winetricks`. You can definitely use the packaged version if you'd like. Sometimes, those packages fall out-of-date, so this guide is going to use the script, since it's both current and universal. By default, the graphical window is fairly ugly, so if you'd prefer a stylized window, install `zenity` through your distribution's package manager. 

Assuming that you want `winetricks` in your `/home` directory, `cd` there and `wget` the script.
```
$ cd ~
$ wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
```
Then, make the script executable.
```
$ chmod+x winetricks
```
`winetricks` can be run in the command line, specifying what needs to be installed at the end of the command, but in most cases, you won't know the exact names of the `.dlls` or fonts that you're trying to install. For that reason, the graphical utility is best. Launching it really isn't any different. Just don't specify anything on the end.
```
$ ~/winetricks
```

 ![The winetricks main menu](https://linuxconfig.org/images/winetricks-main.png) 


When the window first opens, it will display a menu with options including "View help" and "Install an application." By default, "Select the default wineprefix" will be selected. That's the primary option that you will use. The others may work, but aren't really recommended. To proceed, click "OK," and you will be brought to the menu for that WINE prefix.Everything that you will need to do through `winetricks` can be done through this prefix menu. 

 ![The winetricks prefix menu](https://linuxconfig.org/images/winetricks-prefix.png) 


### Fonts

 ![The winetricks font menu](https://linuxconfig.org/images/winetricks-font.png) 


Fonts are surprisingly important. Some applications won't load or won't load properly without them.`winetricks` makes installing many common Windows fonts very easy. From the prefix menu, select the "Install a font" radio button and press "OK." 

You will be presented with a new list of fonts and corresponding checkboxes. It's hard to say exactly which fonts you will need, so most of this should be decided on a per-application basis, but it's usually a good idea to install `corefonts`. It contains the major Windows system fonts that many applications would be expecting to be present on a Windows machine. Installing them can't really hurt anything, so just having them is usually best. 

To install `corefonts`, check the corresponding checkbox and press "OK." You will be given roughly the same install prompts as you would on Windows, and the fonts will be installed. When it's done, you will be taken back to the prefix menu. Follow that same process for each additional font that you need.

### .dlls and Components

 ![The winetricks dll menu](https://linuxconfig.org/images/winetricks-dll.png) 


`winetricks` tries to make installing Windows `.dll` files and other components as simple as possible. If you need to install them, select "Install a Windows DLL or component" on the prefix menu and click "OK." 

The window will switch over to a menu of available `dlls` and other Windows components. Using the corresponding checkboxes, check off any that you need, and click "OK." The script will download each selected component and begin installing them via the usual Windows install process. Follow the prompts like you would on a Windows machine. Expect error messages. Many times, the Windows installers will present errors, but you will then receive windows from `winetricks` stating that it is following a workaround. That is perfectly normal. Depending on the component, you may or may not receive a success message. Just ensure that the box is still checked in the menu when the install is complete.

### Registry

 ![WINE regedit](https://linuxconfig.org/images/winetricks-regedit.png) 


It's not all that often that you have to edit registry values in WINE, but with some programs, you may. Technically, `winetricks` doesn't provide the registry editor, but it makes accessing it easier. Select "Run regedit" from the prefix menu and press "OK." A basic Windows registry editor will open up. Actually creating registry values is a bit out of the scope of this guide, but adding entries isn't too hard if you already know what you're entering. The registry acts sort of like a spreadsheet, so you can just plug in the right values into the right cells. That's somewhat of an oversimplification, but it works. You can usually find exactly what needs to be added or edited on the WINE Appdb `https://appdb.winehq.org`.

### Closing

There's obviously much more that can be done with `winetricks`, but the purpose of this guide is to give you the basic knowledge that you'll need to use this powerful tool to get your programs up and running through WINE. The WINE Appdb is a wealth of knowledge on a per-program basis, and will be an invaluable resource going forward.

--------------------------------------------------------------------------------

via: https://linuxconfig.org/configuring-wine-with-winetricks

作者：[Nick Congleton][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/configuring-wine-with-winetricks
[1]:https://linuxconfig.org/configuring-wine-with-winetricks#h1-introduction
[2]:https://linuxconfig.org/configuring-wine-with-winetricks#h2-installing
[3]:https://linuxconfig.org/configuring-wine-with-winetricks#h3-fonts
[4]:https://linuxconfig.org/configuring-wine-with-winetricks#h4-dlls-and-components
[5]:https://linuxconfig.org/configuring-wine-with-winetricks#h5-registry
[6]:https://linuxconfig.org/configuring-wine-with-winetricks#h6-closing
[7]:https://linuxconfig.org/configuring-wine-with-winetricks#h7-table-of-contents
