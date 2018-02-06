translating by wenwensnow
Getting Started with the openbox windows manager in Fedora
======

![](https://fedoramagazine.org/wp-content/uploads/2017/10/openbox.png-945x400.jpg)

Openbox is [a lightweight, next generation window manager][1] for users who want a minimal enviroment for their [Fedora][2]desktop. It’s well known for its minimalistic appearance, low resource usage and the ability to run applications the way they were designed to work. Openbox is highly configurable. It allows you to change almost every aspect of how you interact with your desktop. This article covers a basic setup of Openbox on Fedora.

### Installing Openbox in Fedora

This tutorial assumes you’re already working in a traditional desktop environment like [GNOME][3] or [Plasma][4]over the [Wayland][5] compositor. First, open a terminal and run the following command [using sudo][6].
```
sudo dnf install openbox xbacklight feh conky xorg-x11-drv-libinput tint2 volumeicon xorg-x11-server-utils network-manager-applet

```

Curious about the packages this command installs? Here is the package-by-package breakdown.

  * **openbox** is the main window manager package
  * **xbacklight** is a utility to set laptop screen brightness
  * **feh** is a utility to set a wallpaper for the desktop
  * **conky** is a utility to display system information
  * **tint2** is a system panel/taskbar
  * **xorg-x11-drv-libinput** is a driver that lets the system activate clicks on tap in a laptop touchpad
  * **volumeicon** is a volume control for the system tray
  * **xorg-x11-server-utils** provides the xinput tool
  * **network-manager-applet** provides the nm-applet tool for the system tray



Once you install these packages, restart your computer. After the system restarts, choose your user name to login. Before you enter your password, click the gear icon to select the Openbox session. Then enter your password to start Openbox.

If you ever want to switch back, simply use this gear icon to return to the selection for your desired desktop session.

### Using Openbox

The first time you login to your Openbox session, a mouse pointer appears over a black desktop. Don’t worry, this is the default look and feel of the desktop. First, right click your mouse to access a handy menu to launch your apps. You can use the shortcut **Ctrl + Alt + LeftArrow / RightArrow** to switch between four virtual screens.

![][7]

If your laptop has a touchpad, you may want to configure tap to click for an improved experience. Fedora features libinput to handle input from the touchpad. First, get a list of input devices in your computer:
```
$ xinput list
 ⎡ Virtual core pointer id=2 [master pointer (3)]
 ⎜ ↳ Virtual core XTEST pointer id=4 [slave pointer (2)]
 ⎜ ↳ ETPS/2 Elantech Touchpad id=11 [slave pointer (2)]
 ⎣ Virtual core keyboard id=3 [master keyboard (2)]
 ↳ Virtual core XTEST keyboard id=5 [slave keyboard (3)]
 ↳ Power Button id=6 [slave keyboard (3)]
 ↳ Video Bus id=7 [slave keyboard (3)]
 ↳ Power Button id=8 [slave keyboard (3)]
 ↳ WebCam SC-13HDL11939N: WebCam S id=9 [slave keyboard (3)]
 ↳ AT Translated Set 2 keyboard id=10 [slave keyboard (3)]

```

In the example laptop, the touchpad is the device with ID 11. With this info you can list your trackpad properties:
```
$ xinput list-props 11
Device 'ETPS/2 Elantech Touchpad':
Device Enabled (141): 1
Coordinate Transformation Matrix (143): 1.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 1.000000
libinput Tapping Enabled (278): 0
libinput Tapping Enabled Default (279): 0
droped

```

In this example, the touchpad has the Tapping Enabled property set to false (0).

Now you know your trackpad device ID (11) and the property to configure (278). This means you can enable tapping with the command:
```
xinput set-prop <device> <property> <value>

```

For the example above:
```
xinput set-prop 11 278 1

```

You should now be able to successfully click in your touchpad with a tap. Now configure this option at the Openbox session start. First, create the config file with an editor:
```
vi ~/.config/openbox/autostart

```

This example uses the vi text editor, but you can use any editor you want, like gedit or kwrite. In this file add the following lines:
```
# Set tapping on touchpad on:
xinput set-prop 11 278 1 &

```

Save the file, logout of the current session, and login again to verify your touchpad works.

### Configuring the session

Here are some examples of how you can configure your Openbox session to your preferences. To use feh to set the desktop wallpaper at startup, just add these lines to your ~/.config/openbox/autostart file:
```
# Set desktop wallpaper:
feh --bg-scale ~/path/to/wallpaper.png &

```

To use tint2 to show a task bar in the desktop, add these lines to the autostart file:
```
# Show system tray
tint2 &

```

Add these lines to the autostart file to start conky when you login:
```
# Show system info
conky &

```

Now you can add your own services to your Openbox session. Just add entries to your autostart file. For instance, add the NetworkManager applet and volume control with these lines:
```
#NetworkManager
nm-applet &

#Volume control in system tray
volumeicon &

```

The configuration file used in this post for conky is available [here][8] you can copy and paste the configuration in a file called .conkyrc in your home directory .

The conky utility is a highly configurable way to show system information. You can set up a preferred profile of settings in a ~/.conkyrc file. Here’s [an example conkyrc file][9]. You can find many more on the web.

You are now able to customize your Openbox installation in exciting ways. Here’s a screenshot of the author’s Openbox desktop:

![][10]

### Configuring tint2

You can also configure the look and feel of the panel with tint2. The configuration file is available in ~/.config/tint2/tint2rc. Use your favorite editor to open this file:
```
vi ~/.config/tint2/tint2rc

```

Look for these lines first:
```
#-------------------------------------
#Panel
panel_items = LTSCB

```

These are the elements than will be included in the bar where:

  * **L** = Launchers
  * **T** = Task bar
  * **S** = Systray
  * **C** = Clock
  * **B** = Battery



Then look for those lines to configure the launchers in the task bar:
```
#-------------------------------------
#Launcher
launcher_padding = 2 4 2
launcher_background_id = 0
launcher_icon_background_id = 0
launcher_icon_size = 24
launcher_icon_asb = 100 0 0
launcher_icon_theme_override = 0
startup_notifications = 1
launcher_tooltip = 1
launcher_item_app = /usr/share/applications/tint2conf.desktop
launcher_item_app = /usr/local/share/applications/tint2conf.desktop
launcher_item_app = /usr/share/applications/firefox.desktop
launcher_item_app = /usr/share/applications/iceweasel.desktop
launcher_item_app = /usr/share/applications/chromium-browser.desktop
launcher_item_app = /usr/share/applications/google-chrome.desktop

```

Here you can add shortcuts to your favorite launcher_item_app elements. This item accepts .desktop files and not executables. You can get a list of your system-wide desktop files with this command:
```
ls /usr/share/applications/

```

As an exercise for the reader, see if you can find and install a theme for either the Openbox [window manager][11] or [tint2][12]. Enjoy getting started with Openbox as a Fedora desktop.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/openbox-fedora/

作者：[William Moreno][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://williamjmorenor.id.fedoraproject.org/
[1]:http://openbox.org/wiki/Main_Page
[2]:https://getfedora.org/
[3]:https://getfedora.org/es/workstation/
[4]:https://spins.fedoraproject.org/kde/
[5]:https://wayland.freedesktop.org/
[6]:https://fedoramagazine.org/howto-use-sudo/
[7]:https://fedoramagazine.org/wp-content/uploads/2017/10/openbox-01-300x169.png
[8]:https://gist.github.com/williamjmorenor/96399defad35e24a8f1843e2c256b4a4
[9]:https://github.com/zenzire/conkyrc/blob/master/conkyrc
[10]:https://fedoramagazine.org/wp-content/uploads/2017/10/openbox-02-300x169.png
[11]:https://www.deviantart.com/customization/skins/linuxutil/winmanagers/openbox/whats-hot/?order=9&offset=0
[12]:https://github.com/addy-dclxvi/Tint2-Theme-Collections
