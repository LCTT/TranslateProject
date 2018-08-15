How To Remove Or Disable Ubuntu Dock
======

![](https://1.bp.blogspot.com/-pClnjEJfPQc/W21nHNzU2DI/AAAAAAAABV0/HGXuQOYGzokyrGYQtRFeF_hT3_3BKHupQCLcBGAs/s640/ubuntu-dock.png)

**If you want to replace the Ubuntu Dock in Ubuntu 18.04 with some other dock (like Plank dock for example) or panel, and you want to remove or disable the Ubuntu Dock, here's what you can do and how.**

Ubuntu Dock - the bar on the left-hand side of the screen which can be used to pin applications and access installed applications -


### How to access the Activities Overview without Ubuntu Dock

Without Ubuntu Dock, you may have no way of accessing the Activities / installed application list (which can be accessed from Ubuntu Dock by clicking on Show Applications button at the bottom of the dock). For example if you want to use Plank dock.

Obviously, that's not the case if you install Dash to Panel extension to use it instead Ubuntu Dock, because Dash to Panel provides a button to access the Activities Overview / installed applications.

Depending on what you plan to use instead of Ubuntu Dock, if there's no way of accessing the Activities Overview, you can enable the Activities Overview Hot Corner option and simply move your mouse to the upper left corner of the screen to open the Activities. Another way of accessing the installed application list is using a keyboard shortcut: `Super + A` .

If you want to enable the Activities Overview hot corner, use this command:
```
gsettings set org.gnome.shell enable-hot-corners true

```

If later you want to undo this and disable the hot corners, you need to use this command:
```
gsettings set org.gnome.shell enable-hot-corners false

```

You can also enable or disable the Activities Overview Hot Corner option by using the Gnome Tweaks application (the option is in the `Top Bar` section of Gnome Tweaks), which can be installed by using this command:
```
sudo apt install gnome-tweaks

```

### How to remove or disable Ubuntu Dock

Below you'll find 4 ways of getting rid of Ubuntu Dock which work in Ubuntu 18.04.

**Option 1: Remove the Gnome Shell Ubuntu Dock package.**

The easiest way of getting rid of the Ubuntu Dock is to remove the package.

This completely removes the Ubuntu Dock extension from your system, but it also removes the `ubuntu-desktop` meta package. There's no immediate issue if you remove the `ubuntu-desktop` meta package because does nothing by itself. The `ubuntu-meta` package depends on a large number of packages which make up the Ubuntu Desktop. Its dependencies won't be removed and nothing will break. The issue is that if you want to upgrade to a newer Ubuntu version, any new `ubuntu-desktop` dependencies won't be installed.

As a way around this, you can simply install the `ubuntu-desktop` meta package before upgrading to a newer Ubuntu version (for example if you want to upgrade from Ubuntu 18.04 to 18.10).

If you're ok with this and want to remove the Ubuntu Dock extension package from your system, use the following command:
```
sudo apt remove gnome-shell-extension-ubuntu-dock

```

If later you want to undo the changes, simply install the extension back using this command:
```
sudo apt install gnome-shell-extension-ubuntu-dock

```

Or to install the `ubuntu-desktop` meta package back (this will install any ubuntu-desktop dependencies you may have removed, including Ubuntu Dock), you can use this command:
```
sudo apt install ubuntu-desktop

```

**Option 2: Install and use the vanilla Gnome session instead of the default Ubuntu session.**

Another way to get rid of Ubuntu Dock is to install and use the vanilla Gnome session. Installing the vanilla Gnome session will also install other packages this session depends on, like Gnome Documents, Maps, Music, Contacts, Photos, Tracker and more.

By installing the vanilla Gnome session, you'll also get the default Gnome GDM login / lock screen theme instead of the Ubuntu defaults as well as Adwaita Gtk theme and icons. You can easily change the Gtk and icon theme though, by using the Gnome Tweaks application.

Furthermore, the AppIndicators extension will be disabled by default (so applications that make use of the AppIndicators tray won't show up on the top panel), but you can enable this by using Gnome Tweaks (under Extensions, enable the Ubuntu appindicators extension).

In the same way, you can also enable or disable Ubuntu Dock from the vanilla Gnome session, which is not possible if you use the Ubuntu session (disabling Ubuntu Dock from Gnome Tweaks when using the Ubuntu session does nothing).

If you don't want to install these extra packages required by the vanilla Gnome session, this option of removing Ubuntu Dock is not for you so check out the other options.

If you are ok with this though, here's what you need to do. To install the vanilla Gnome session in Ubuntu, use this command:
```
sudo apt install vanilla-gnome-desktop

```

After the installation finishes, reboot your system and on the login screen, after you click on your username, click the gear icon next to the `Sign in` button, and select `GNOME` instead of `Ubuntu` , then proceed to login:

![](https://4.bp.blogspot.com/-mc-6H2MZ0VY/W21i_PIJ3pI/AAAAAAAABVo/96UvmRM1QJsbS2so1K8teMhsu7SdYh9zwCLcBGAs/s640/vanilla-gnome-session-ubuntu-login-screen.png)

In case you want to undo this and remove the vanilla Gnome session, you can purge the vanilla Gnome package and then remove the dependencies it installed (second command) using the following commands:
```
sudo apt purge vanilla-gnome-desktop
sudo apt autoremove

```

Then reboot and select Ubuntu in the same way, from the GDM login screen.

**Option 3: Permanently hide the Ubuntu Dock from your desktop instead of removing it.**

If you prefer to permanently hide the Ubuntu Dock from showing up on your desktop instead of uninstalling it or using the vanilla Gnome session, you can easily do this using Dconf Editor. The drawback to this is that Ubuntu Dock will still use some system resources even though you're not using in on your desktop, but you'll also be able to easily revert this without installing or removing any packages.

Ubuntu Dock is only hidden from your desktop though. When you go in overlay mode (Activities), you'll still see and be able to use Ubuntu Dock from there.

To permanently hide Ubuntu Dock, use Dconf Editor to navigate to `/org/gnome/shell/extensions/dash-to-dock` and disable (set them to false) the following options: `autohide` , `dock-fixed` and `intellihide` .

You can achieve this from the command line if you wish, buy running the commands below:
```
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false

```
In case you change your mind and you want to undo this, you can either use Dconf Editor and re-enable (set them to true) autohide, dock-fixed and intellihide from `/org/gnome/shell/extensions/dash-to-dock` , or you can use these commands:
```
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true

```

**Option 4: Use Dash to Panel extension.**

You can install Dash to Panel from

If you change your mind and you want Ubuntu Dock back, you can either disable Dash to Panel by using Gnome Tweaks app, or completely remove Dash to Panel by clicking the X button next to it from here:


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/08/how-to-remove-or-disable-ubuntu-dock.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://bugs.launchpad.net/ubuntu/+source/gnome-tweak-tool/+bug/1713020
[2]:https://www.linuxuprising.com/2018/05/gnome-shell-dash-to-panel-v14-brings.html
[3]:https://extensions.gnome.org/extension/1160/dash-to-panel/
