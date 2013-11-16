翻译中 by Linux-pdz
How to create desktop shortcut or launcher on Linux
================================================================================
If you have a program you use regularly on Linux desktop, you may want to create a "desktop shortcut", so you can launch the program by simply clicking on the shortcut. While most GUI programs automatically create their desktop shortcut during installation, some GUI programs or terminal applications may require you to set up associated shortcuts manually.

In this tutorial, I will describe **how to create a desktop shortcut or launcher on various Linux desktops**.

A desktop shortcut is represented by a corresponding .desktop file which contains meta information of a given app (e.g., name of the app, launch command, location of icon file, etc.). Desktop shortcut files are placed in **/usr/share/applications** or **~/.local/share/applications**. The former directory stores desktop shortcuts that are available for every user, while the latter folder contains shortcuts created for a particular user only.

### Create a Desktop Shortcut From the Command Line ###

To manually create a desktop shortcut for a particular program or command, you can create a .desktop file using any text editor, and place it in either /usr/share/applications or ~/.local/share/applications. A typical .desktop file looks like the following.

    [Desktop Entry]
    Encoding=UTF-8
    Version=1.0                                     # version of an app.
    Name[en_US]=yEd                                 # name of an app.
    GenericName=GUI Port Scanner                    # longer name of an app.
    Exec=java -jar /opt/yed-3.11.1/yed.jar          # command used to launch an app.
    Terminal=false                                  # whether an app requires to be run in a terminal.
    Icon[en_US]=/opt/yed-3.11.1/icons/yicon32.png   # location of icon file.
    Type=Application                                # type.
    Categories=Application;Network;Security;        # categories in which this app should be listed.
    Comment[en_US]=yEd Graph Editor                 # comment which appears as a tooltip.

Besides manually create .desktop file, there are various desktop-specific ways to create an application shortcut, which I am going to cover in the rest of the tutorial.

### Create a Desktop Shortcut on GNOME Desktop ###

In GNOME desktop, you can use gnome-desktop-item-edit to configure a desktop shortcut easily.

    $ gnome-desktop-item-edit ~/.local/share/applications --create-new 

In this example, gnome-desktop-item-edit will automatically create a desktop launcher file in ~/.local/share/applications. To customize icon location and other info, you may have to edit the .desktop file manually afterward.

If gnome-desktop-item-edit is not available (e.g., on Ubuntu), you can install it as follows.

    $ sudo apt-get install --no-install-recommends gnome-panel 

### Create a Desktop Shortcut on KDE Desktop ###

kickoff is the default application launcher in KDE desktop. Adding a new application shortcut to kickoff is straightforward.

First right-click on kickoff icon located at the left bottom corner of your desktop, and then choose "Edit Applications" menu.

[![](http://farm3.staticflickr.com/2839/10848506344_7949638fe0.jpg)][1]

Click on an appropriate category (e.g., "Utilities") under which you want to create a shortcut, and click on "New Item" button on the top. Type in the name of the app.

[![](http://farm8.staticflickr.com/7459/10848418496_ac6de897fe_z.jpg)][2]

Finally, fill in the meta information of the app being launched by the shortcut.

[![](http://farm8.staticflickr.com/7347/10848506284_18c8d9234d_z.jpg)][3]

### Create a Desktop Shortcut on Xfce Desktop ###

If you are on Xfce desktop, right-click on the desktop background, and then select "Create Launcher" menu. Then fill out the details of the shortcut.

### Create a Desktop Shortcut on Cinnamon Desktop ###

If you are on Linux Mint Cinnamon desktop, you can create an application launcher by right-clicking on the desktop background, and selecting "Create Launcher" menu.

### Create a Desktop Shortcut on LXDE Desktop ###

On LXDE desktop, simply right click on the desktop background, and choose "Create New Shortcut".

[![](http://farm4.staticflickr.com/3725/10848922593_441ed98174.jpg)][4]

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/11/create-desktop-shortcut-launcher-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.flickr.com/photos/xmodulo/10848506344/
[2]:http://www.flickr.com/photos/xmodulo/10848418496/
[3]:http://www.flickr.com/photos/xmodulo/10848506284/
[4]:http://www.flickr.com/photos/xmodulo/10848922593/
