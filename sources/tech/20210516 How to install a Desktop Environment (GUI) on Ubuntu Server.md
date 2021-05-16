[#]: subject: (How to install a Desktop Environment (GUI) on Ubuntu Server)
[#]: via: (https://itsfoss.com/install-gui-ubuntu-server/)
[#]: author: (Chris Patrick Carias Stas https://itsfoss.com/author/chris/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to install a Desktop Environment (GUI) on Ubuntu Server
======

Do you want to install GUI on your Ubuntu server? You can totally do that in most scenarios and I am going to discuss the steps in details in this tutorial.

But before you see that, let me tell you why the server edition does not come with GUI and in which cases you could install the GUI on your server.

### Why does Ubuntu server not have a GUI?

If you compare Ubuntu desktop with server, the main difference will be the absence of GUI, i.e. [the desktop environment][1] in the server edition. Ubuntu Server is basically a striped down version of Ubuntu desktop without the graphical modules.

This is intentional. A Linux server intends to use the system resources on running services. The graphical desktop environment consumes a lot of system resources and for this reason, the server operating systems do not include a desktop environment by default.

You may use an Ubuntu server on 512 MB of RAM but an Ubuntu desktop will need at least 2 GB of RAM to function decently. That’s considered a waste of resources in the server world.

As a server user (or sysadmin), you are expected to use and manage your system through command line. You should have decent knowledge of the Linux commands for this purpose.

![Typically, you have to manage a server from the command line][2]

### Do you really need to install GUI on your server?

Some people do not feel comfortable with the idea of doing everything using commands in the terminal. Most people are conditioned to use a computer graphically after all.

You may choose to install a desktop environment on your server and use it graphically. That’s not how most people do it but it’s an option.

But this works only if you have direct access to the server. If you are running it on a physical machine like a server, a desktop/laptop or devices like Raspberry Pi. You may also install it on a server running in a virtual machine if you have direct access to the host system.

If you have a server deployed using a [cloud server provider like Linode, DigitalOcean or AWS][3], installing GUI won’t be a good idea. If you have a remote server that you want to manage graphically, you may use tools like Webmin or [Cockpit][4]. These tools allow you to use and manage your servers graphically in a web browser. It consumes a lot less system resources than a full-fledged desktop environment.

![Tools like Cockpit allow managing Linux servers graphically][5]

### How to install GUI on Ubuntu server?

Once the basics are clear, let’s see the steps for installing a desktop environment on an Ubuntu server.

You’ll need the following things:

  * Ubuntu Server configured and running with at least 2 GB of RAM
  * Administrative privileges (you need to run sudo commands)
  * Internet connection (you are going to download and install new packages)



In my case, the Ubuntu server is installed in a virtual machine and I have direct access to the host machine. I have used the same method on an [Ubuntu server installed on a Raspberry Pi][6].

Attention!

These things are fine for experimental purpose when you are learning and exploring. Please do not add GUI on a production server. Removing GUI afterwards could cause dependency issues and leave a broken system in some cases.

#### Preparing your system

First, since you are going to make some system-wide modifications, let’s update &amp; upgrade everything to make sure that our system is running the latest packages:

```
sudo apt update && sudo apt upgrade
```

#### Installing the desktop environment

With the updates out of the way, you can continue with the installation of a desktop environment.

There are two ways to do this:

  * Using [apt][7] to install the packages
  * Using a Debian tool called [tasksel][8] which helps with the installation of multiple packages in one coordinated process (tasks)



Either one will let you install the full desktop environment you choose as a full package, just like if you were installing the desktop version from scratch. By this, I mean that you will get all the default applications and tools you get with the desktop version.

If you want to use `tasksel` you must first install it using the following command:

```
sudo apt install tasksel
```

Once this task is finished, you can use `tasksel` to install the desktop environment (also referred as DE).

Now, you probably know that there are [several desktop environments available][9]. You may choose the one you like. Some desktop environments need more system resources (like GNOME) while some use fewer system resources (like Xfce, MATE etc).

It is up to you to decide which DE you would like to use. I am going with the [GNOME Desktop][10] since it is the default desktop for Ubuntu. Later on, I’ll share some tips for installing different desktops too.

If you are using `tasksel` run this command:

```
sudo tasksel install ubuntu-desktop
```

if you want to use only apt, then run this command:

```
sudo apt install ubuntu-desktop
```

Depending on your connection speed and hardware this process will take from a couple of minutes to an hour.

I want to point that both actions will result in the full installation of the GNOME Desktop Environment. I ran both commands for the sake of this tutorial and ended up having the exact same results.

#### Installing and setting up the display manager

After this process is completed, you will need a component called a [Display Manager][11], also known as a “login manager”. This tool is going to be responsible for starting the [display server][12] and loading the desktop while managing user sessions and authentication.

By default, GNOME Desktop uses GDM3 as its display manager, but it is a bit heavy on the resources side. You can use something lighter and more resource-friendly. In this case, let’s go with [lightdm][13], a platform independent display manager. Install it with apt:

```
sudo apt install lightdm
```

When installing lightdm the system is going to ask for a default display manager because only one can run at a time, although you can have several installed.

![Use the arrow key to select an option and then use the tab key to select <OK> and press enter][14]

Just choose **lightdm** from the list and hit **&lt;Ok&gt;**. This shouldn’t take more than a couple of minutes. After this task is done, you can then start the display manager and load the GUI with the following command:

```
sudo service lightdm start
```

If you want to check what display manager is configured in your system you can run:

```
cat /etc/X11/default-display-manager
```

and you will get a prompt similar to this:

![Checking the default Display Manager][15]

If everything went according to the plan, you will have a greeting screen loaded.

![Greetings screen of GNOME Desktop with LightDM on an Ubuntu server][16]

Enter your credentials and you will have your desktop running.

![GNOME Desktop fully loaded on Ubutnu server][17]

If you want to shutdown the GUI open a terminal window and type:

```
sudo service lightdm stop
```

#### Installing other desktop environments (optional)

Earlier on I said that we could choose different desktops, so let’s take a look at some alternatives.

##### MATE

[MATE][18] is a lightweight desktop based on GNOME2 base code, it’s fully open source and a very nice option.

To install MATE, you would run:

```
sudo tasksel install ubuntu-mate-core
```

or

```
sudo apt install ubuntu-mate-core
```

##### Lubuntu / LXDE/LXQT

[Lubuntu][19] is another lightweight option which I recommend if your system is low on resources or if you are giving new life to an older computer. Install it using this command:

```
sudo tasksel install lubuntu-core
```

or

```
sudo apt install lubuntu-core
```

##### Xubuntu / Xfce

[Xubuntu][20] is an Ubuntu derivative based on the [Xfce][21] desktop environment that is light, simple, stable, but it’s also highly customizable. If you want to try it, use the following command:

```
sudo tasksel install xubuntu-core
```

or

```
sudo apt install xubuntu-core
```

I’m leaving some other desktops out, like [KDE][22], [Cinnamon][23], and [Budgie][24], not for anything wrong, they are all excellent desktops too and you are free to install them as you want.

### How to remove the GUI from Ubuntu server?

If you realize that the desktop environment is taking too much computing resources, you may remove the packages you installed previously.

Please keep in mind that it may cause dependency issues in some cases so please make a backup of your important data or create a system snapshot.

You know [how to remove packages from Ubuntu][25]:

```
sudo apt remove ubuntu-desktop
sudo apt remove lightdm
sudo apt autoremove
sudo service lightdm stop
```

Reboot your system now. You should be back to the normal command line login.

### Wrapping up

Installing a GUI for a desktop is possible but not needed in most scenarios. If you are not too comfortable with the command line, use a server distribution like [YunoHost][26] that is built on top of Debian to give you a server that can be managed via GUI.

That said, if you are installing a system from scratch, then I’d recommend that you go with a desktop version and avoid the extra steps afterwards.

With this information, I leave the comment section to you. Do you use GUI on a server? Did you face any issues in following this tutorial?

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-gui-ubuntu-server/

作者：[Chris Patrick Carias Stas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/chris/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-desktop-environment/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/system-restart-required.png?resize=800%2C469&ssl=1
[3]: https://linuxhandbook.com/free-linux-cloud-servers/
[4]: https://linuxhandbook.com/cockpit/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/cockpit-2-2.png?resize=800%2C450&ssl=1
[6]: https://itsfoss.com/install-ubuntu-server-raspberry-pi/
[7]: https://itsfoss.com/apt-command-guide/
[8]: https://manpages.ubuntu.com/manpages/bionic/man8/tasksel.8.html
[9]: https://itsfoss.com/best-linux-desktop-environments/
[10]: https://www.gnome.org/
[11]: https://itsfoss.com/display-manager/
[12]: https://itsfoss.com/display-server/
[13]: https://wiki.debian.org/LightDM
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/installing-gui-ubuntu-server-select-dm.png?resize=799%2C354&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/installing-gui-ubuntu-server-default.png?resize=800%2C68&ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/installing-gui-ubuntu-server-gnome-desktop-greet.png?resize=798%2C600&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/installing-gui-ubuntu-server-gnome-desktop.png?resize=792%2C597&ssl=1
[18]: https://mate-desktop.org/
[19]: https://lubuntu.net/
[20]: https://xubuntu.org/
[21]: https://www.xfce.org/
[22]: https://itsfoss.com/install-kde-on-ubuntu/
[23]: https://itsfoss.com/install-cinnamon-on-ubuntu/
[24]: https://itsfoss.com/install-budgie-ubuntu/
[25]: https://itsfoss.com/uninstall-programs-ubuntu/
[26]: https://yunohost.org/
