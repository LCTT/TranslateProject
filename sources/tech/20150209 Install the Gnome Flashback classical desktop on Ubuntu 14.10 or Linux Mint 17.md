Translating by martin.

Install the Gnome Flashback classical desktop on Ubuntu 14.10/Linux Mint 17
================================================================================
The [Gnome Flashback][1] desktop environment is a simple and great way to get back the old style classical desktop if you do not like Unity desktop, like many.

Gnome Flashback is based on GTK 3 and provides a desktop interface visually similar to the old gnome desktop.

Another alternative to gnome flashback is the MATE desktop from linux mint and XFCE desktop, but both of them are based on gtk 2.

### Install Gnome Flashback ###

Install the following package on your Ubuntu system and you are done.

    $ sudo apt-get install gnome-session-flashback

Now logout and at the login screen press the settings button on the box that asks for password. There would be 2 options, Gnome Flashback (Metacity) and Gnome Flashback (Compiz).

Metacity is lighter and faster, whereas Compiz gets you the more fancy desktop effects. Here is a screenshot of my gnome flashback desktop.

It uses a wallpaper from elementary OS and also Plank dock with no bottom panel. This tutorial explains every bit of it.

![ubuntu gnome flashback](http://www.binarytides.com/blog/wp-content/uploads/2015/02/ubuntu-gnome-flashback.png)

After installing Gnome Flashback desktop you need to do a couple of more things to finetune it.

### 1. Install Gnome Tweak Tool ###

The Gnome Tweak Tool allows you to customize things like fonts, themes etc, that are otherwise difficult or impossible with the "unity-control-center" tool of Unity desktop.

    $ sudo apt-get install gnome-tweak-tool

Find it in Applications > System Tools > Preferences > Tweak Tool

### 2. Add applets to panel ###

By default right clicking on the panels would not have any effect. Press the Alt+Super (windows) key on your keyboard while you right click on the panels and you would get the relevant options to customize the panel.

You can modify the panel, remove it and also add applets to it. In this example we shall remove the bottom panel and replace it with Plank dock.

Add a datetime applet on the top panel at the middle. Configure it to display the date time and weather conditions.

Also add a workspace switcher applet to the top panel and create as many workspaces as you need.

### 3. Take window title bar buttons to the right ###

On Ubuntu the minimise, maximise and close buttons on the window title bar are on the left by default. It needs a small hack to get them to the right.

To take the window buttons to the right use the following command, which I found at askubuntu.

    $ gsettings set org.gnome.desktop.wm.preferences button-layout 'menu:minimize,maximize,close'

### 4. Install Plank dock ###

The plank dock sits at the bottom and holds launchers for applications and window launchers for running applications. It hides itself when not necessary and shows up again when needed. Its the same dock as used by elementary OS.

Run the following commands

    $ sudo add-apt-repository ppa:ricotz/docky -y 
    $ sudo apt-get update 
    $ sudo apt-get install plank -y

Find it in Applications > Accessories > Plank. To configure it to start automatically with the system, go to System Tools > Preferences > Startup Applications and add the "plank" command to the list.

### 5. Install Conky system monitor ###

Conky is a nice way to decorate your desktop with system statistics like cpu and memory usage. It is lightweight and works most of the time without any hassles.

Run the following commands -

    $ sudo apt-add-repository -y ppa:teejee2008/ppa
    $ sudo apt-get update
    $ sudo apt-get install conky-manager

Now launch Applications > Accessories > Conky Manager and select the widget you want to display on your desktop. Conky Manager also allows you to configure it to launch at system startup.

### 6. Install CompizConfig Settings Manager ###

If you wish to use Gnome Flashback (Compiz) session then it would be useful to use the compiz settings manager to configure desktop effects. Install it with the following command

    $ sudo apt-get install compizconfig-settings-manager

Now launch it from System Tools > Preferences > CompizConfig Settings Manager.

> It so happened inside Virtualbox that, in the compiz session window decorations went missing. To fix it, launch Compiz settings and enable the "Copy to texture" plugin and then logout and login back. It should be fixed.

However the Compiz session is slower than the Metacity session.

--------------------------------------------------------------------------------

via: http://www.binarytides.com/install-gnome-flashback-ubuntu/

作者：[Silver Moon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117145272367995638274/posts
[1]:https://wiki.gnome.org/action/show/Projects/GnomeFlashback?action=show&redirect=GnomeFlashback
