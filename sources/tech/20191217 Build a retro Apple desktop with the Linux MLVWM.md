[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Build a retro Apple desktop with the Linux MLVWM)
[#]: via: (https://opensource.com/article/19/12/linux-mlvwm-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Build a retro Apple desktop with the Linux MLVWM
======
This article is part of a special series of 24 days of Linux desktops.
What if old-school Apple computers were built around open source POSIX?
You can find out by building the Macintosh-like Virtual Window Manager.
![Person typing on a 1980's computer][1]

Imagine traveling into an alternate history where the Apple II GS and MacOS 7 were built upon open source [POSIX][2], using all the same conventions as modern Linux, like plain-text configuration files and modular system design. What would such an OS have enabled for its users? You can answer these questions (and more!) with the [Macintosh-like Virtual Window Manager (MLVWM)][3].

![MLVWM running on Slackware 14.2][4]

### Installing MLVWM

MLVWM is not an easy installation, and it's probably not in your distribution's software repository. If you have the time to decipher a poorly translated README file, edit some configuration files, gather and resize some old **.xpm** images, and edit an Xorg preference or two, then you can experience MLVWM. Otherwise, this is a novelty window manager with its latest release back in 2000.

To compile MLVWM, you must have **imake** installed, which provides the **xmkmf** command. You can install imake from your distribution's software repository, or get it directly from [Freedesktop.org][5]. Assuming you have the **xmkmf** command, change into the directory containing the MLVWM source code, and run these commands to build it:


```
$ xmkmf -a
$ make
```

After building, the compiled **mlvwm** binary is located in the **mlvwm** directory. Move it to any location [in your path][6] to install it:


```
`$ mv mlvwm/mlvwm /usr/local/bin/`
```

#### Editing the config files

MLVWM is now installed, but it won't launch correctly without adjusting several configuration files and carefully arranging required image files. Sample config files are located in the **sample_rc** directory of the source code you downloaded. Copy the files **Mlvwm-Netscape** and **Mlvwm-Xterm** to your home directory:


```
`$ cp sample_rc/Mlvwm-{Netscape,Xterm} $HOME`
```

Move the **Mlvwmrc** file to **$HOME/.mlvwmrc** (yes, you must use a lower-case "m" even though the sample file deceptively begins with a capital letter):


```
`$ cp sample_rc/Mlvwmrc $HOME/.mlvwmrc`
```

Open **.mlwmrc** and find lines 54–55, which define the path (the "IconPath") for the pixmap images that MLVWM uses in its menus and UI:


```
# Set icon search path. It needs before "Style".
IconPath /usr/local/include/X11/pixmaps:/home2/tak/bin/pixmap
```

Adjust the path to match a directory you will fill with your own images (I suggest using **$HOME/.local/share/pixmaps**). MLVWM doesn't provide pixmaps, so it's up to you to provide pixmap icons for the desktop you're building.

Do this even if you have pixmaps located elsewhere on your system (such as **/usr/share/pixmaps**), because you're going to have to adjust the size of the pixmaps, and you probably don't want to do that on a system-wide level.


```
# Set icon search path. It needs before "Style".
IconPath /home/seth/.local/share/pixmaps
```

#### Choosing the pixmaps

You've defined the **.local/share/pixmaps** directory as the source of pixmaps, but neither the directory nor the images exist yet. Create the directory:


```
`$ mkdir -p $HOME/.local/share/pixmaps`
```

Right now, the config file assigns images to menu entries and UI elements, but none of those images exist on your system. To fix this, read through the configuration file and locate every **.xpm** image. For each image listed in the config, add an image with the same file name (or change the file name in the config file) to your IconPath directory.

The **.mlvwmrc** file is well commented, so you can get a general idea of what you're editing. This is just a first pass, anyway. You can always come back and change the look of your desktop later.

Here are some examples.

This code block sets the icon in the upper-left corner of the screen:


```
# Register the menu
Menu Apple, Icon label1.xpm, Stick
```

The **label1.xpm** image is actually provided in the source code download's **pixmap** directory, but I prefer to use **Penguin.xpm** from **/usr/share/pixmaps** (on Slackware). Whatever you use, you must place your custom pixmap in **~/.local/share/pixmaps** and either change the pixmap's name in the configuration or rename the pixmap file to match what's currently in the config file.

This code block defines the applications listed in the left menu:


```
"About this Workstation..." NonSelect, Gray, Action About
"" NonSelect
"Terminal"      Icon mini-display.xpm, Action Exec "kterm" exec kterm -ls
"Editor"  Action Exec "mule" exec mule, Icon mini-edit.xpm
"calculator" Action Exec "xcal" exec xcalc, Icon mini-calc.xpm
END
```

By following the same syntax as what you see in the configuration file, you can customize the pixmaps and add your own applications to the menu (for instance, I changed **mule** to **emacs**). This is your gateway to your applications in the MLVWM GUI, so list everything you want quick access to. You may also wish to include a shortcut to your **/usr/share/applications** folder.


```
`"Applications" Icon Penguin.xpm, Action Exec "thunar /usr/share/applications" exec thunar /usr/share/applications`
```

Once you're finished editing the configuration file and adding your own images to your IconPath directory, your pixmaps must all be resized to roughly 16x16 pixels. (MLVWM isn't consistent in its defaults, so there's room for variation.) You can do this as a bulk action using ImageMagick:


```
`$ for i in ~/.local/share/mlvwm-pixmaps/*xpm ; do convert -resize '16x16^' $i; done`
```

### Starting MLVWM

The easiest way to get up and running with MLVWM is to let Xorg do the bulk of the work. First, you must create a **$HOME/.xinitrc** file. I borrowed this one from Slackware, which borrowed it from Xorg:


```
#!/bin/sh
# $XConsortium: xinitrc.cpp,v 1.4 91/08/22 11:41:34 rws Exp $

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi

# Start the window manager:
if [ -z "$DESKTOP_SESSION" -a -x /usr/bin/ck-launch-session ]; then
  exec ck-launch-session /usr/local/bin/mlvwm
else
  exec /usr/local/bin/mlvwm
fi
```

According to this file, the default action for the **startx** command is to launch MLVWM. However, your distribution may have other ideas about what happens when your graphic server launches (or is killed to be restarted), so this file may do you little good. On many distributions, you can add a **.desktop** file to **/usr/share/xsessions** to have it listed in the GDM or KDM menu, so create a file called **mlvwm.desktop** and enter this text:


```
[Desktop Entry]
Name=Mlvwm
Comment=Macintosh-like virtual window manager
Exec=/usr/local/bin/mlvwm
TryExec=ck-launch-session /usr/local/bin/mlvwm
Type=Application
```

Log out from your desktop session and log back into MLVWM. By default, your session manager (KDM, GDM, or LightDM, depending on your setup) will continue to log you into your previous desktop, so you must override that before logging in.

With GDM:

![][7]

With SDDM:

![][8]

#### Launching with brute force

If MLVWM fails to start, try installing XDM, a lightweight session manager that doesn't look at **/usr/share/xsessions** and instead just does whatever the authenticated user's **.xinitrc** proscribes.

![MLVWM][9]

### Build your own retro Apple

The MLVWM desktop is unpolished, imperfect, accurate, and loads of fun. Many of the menu options you see are unimplemented, but you can make them active and meaningful.

This is your chance to step back in time, change history, and make the old-school Apple line of computers a bastion of open source. Be a revisionist, design your own retro Apple desktop, and, most importantly, have fun.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/linux-mlvwm-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: http://www2u.biglobe.ne.jp/~y-miyata/mlvwm.html
[4]: https://opensource.com/sites/default/files/uploads/advent-mlvwm-file.jpg (MLVWM running on Slackware 14.2)
[5]: http://cgit.freedesktop.org/xorg/util/imake
[6]: https://opensource.com/article/17/6/set-path-linux
[7]: https://opensource.com/sites/default/files/advent-gdm_2.jpg
[8]: https://opensource.com/sites/default/files/advent-kdm_1.jpg
[9]: https://opensource.com/sites/default/files/uploads/advent-mlvwm-chess.jpg (MLVWM)
