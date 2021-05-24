[#]: subject: (How to Install and Use XRDP on Ubuntu for Remote Desktop Connection)
[#]: via: (https://itsfoss.com/xrdp-ubuntu/)
[#]: author: (Hunter Wittenborn https://itsfoss.com/author/hunter/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Install and Use XRDP on Ubuntu for Remote Desktop Connection
======

_**Brief: This is a beginner’s guide that shows the steps you need to follow for setting up XRDP on Ubuntu-based Linux distributions. With that, you can access your Ubuntu system from a different computer and use it graphically.**_

[Microsoft Remote Desktop Protocol][1](RDP) is a protocol that allows for graphical remote desktop connections from one computer to another. RDP works by having a main machine run software that allows several other computers to connect to it.

[XRDP][2] is an open-source implementation of RDP, removing the need to run any proprietary programs. XRDP not only tries to follow in the direction of RDP, but is also compatible with regular RDP clients such as [Remmina][3] and [GNOME Boxes][4].

Here’s what the XRDP connection screen looks like.

![][5]

### Things to keep in mind about using XRDP

While XRDP works great for getting remote access to machine, it’s important to know what XRDP _**isn’t**_ good at.

#### Do _n**ot**_ use XRDP if you need a secure connection

Connections made over XRDP can be viewed and modified by attackers, and should thus be avoided for any sensitive information. This can be alleviated through the use of an SSH connection or certificates, but both require a more complex setup and won’t be covered here.

#### XRDP doesn’t work well with theming by default

In my testing, XRDP didn’t ever seem to apply the theming [Ubuntu][6] comes with by default. Instructions for fixing this are available at the end of the article.

#### You need a desktop environment installed on the remote computer

You’ll need a graphical environment installed on the machine everything will connect to for any of this to work. If you are using a desktop Linux to be accessed remotely, it’s all good.

But if you are using a server operating system, it won’t work. Of course, [you can install GUI on your Ubuntu server][7] but you’ll be a lot better using SSH to use the remote system via command line.

### Using XRDP to connect to a Ubuntu Linux system remotely

Here’s the setup you need for this remote connection setup to work properly.

  * A Linux system with XRDP server installed on it. This is the system which will be accessed remotely.
  * The remote system should either be on the same network as yours or it should have a public IP address.
  * You need to know the username and password of the remote Linux system, obviously.
  * Another system (be it Linux, macOS or Windows) with an RDP client installed on it.



![][8]

The process is really simple. Let’s see it in steps.

#### Step 1: Install XRDP on the ‘remote computer’

I am calling it remote computer for reference only. Of course, you need to have access to it in the first place for installing the XRDP package.

XRDP is included in the repositories of most distributions. On Ubuntu, you can find it in the universe repository and install it using this command:

```
sudo apt install xrdp
```

#### Step 2: Get the IP address of the ‘remote computer’

You’ll need the IP address of the remote system in order to connect to it. You can [get the IP address in Linux][9] using the ip command:

```
ip address
```

As you can see, the system in the example has IP address 192.168.0.107. This is on the subnet, of course.

```
[email protected]:~$ ip address
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: wlp0s20f3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether dc:46:b9:fb:7a:c5 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.107/24 brd 192.168.0.255 scope global dynamic noprefixroute wlp0s20f3
       valid_lft 6183sec preferred_lft 6183sec
```

#### Step 3: Connecting to a XRDP machine from ‘local computer’

The good news is that XRDP works right out of the box!

To connect to the machine you installed XRDP on, you’ll first need to install an RDP client on your local system (from where you are trying to connect to the remote system).

I’ll be using GNOME Boxes in this tutorial, which can be installed with the following:

```
sudo apt install gnome-boxes
```

GNOME Boxes is primarily used for virtual machines but it is also a good XRDP client. You may use other tools like Remmina.

Start the GNOME Boxes application. Click on the + sign and select “**Connect to a Remote Computer…**“.

![][10]

Next, enter the IP address of the machine you’re connecting to, prefixed with `rdp://`, and then connect as shown below:

![][11]

In the above example, I deployed an Ubuntu server on Linode cloud server. I also installed GNOME desktop on it. This server has a public IP address that can be accessed from anywhere. I have used the public IP address.

You should then be presented with a login screen. Keep “Session” set to “Xorg”, and just enter your username and password, then click “OK”:

![][5]

After, you should be presented with your desktop:

![][12]

And now you’re good to go! Everything will (mostly – more on that below) behave just the same as if the machine was right in front of you.

### Troubleshooting: Fixing theming issues with XRDP connection

In my testing on Ubuntu 20.04, the default Yaru theme didn’t seem to apply by default when connecting over. This can be fixed with some effort.

First, run this command on the **remote computer**:

```
sudo apt install gnome-tweaks gnome-shell-extensions dconf-editor -y
```

Next, open the Extensions app, and turn on the toggles shown below:

![][13]

Next, close your remote desktop session and log back in. Now, open up Tweaks and configure everything per the screenshot below:

![][14]

Lastly, open up dconf Editor, and navigate to `/org/gnome/shell/extensions/dash-to-dock/`. Set the values that are shown below:

  * `custom-theme-shrink`: On
  * `dock-fixed`: On
  * `transparency-mode`: FIXED



And there you go, everything is good to go!

### Wrapping up

This should help you get started with XRDP on Ubuntu and other Linux systems. This is a convenient tool for connecting to remote systems, specially on the same network.

If something didn’t work quite right, or you just have any questions or comments, feel free to leave them below. I’ll try to help you out.

--------------------------------------------------------------------------------

via: https://itsfoss.com/xrdp-ubuntu/

作者：[Hunter Wittenborn][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/hunter/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Remote_Desktop_Protocol
[2]: https://en.wikipedia.org/wiki/Xrdp
[3]: https://remmina.org/
[4]: https://wiki.gnome.org/Apps/Boxes
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/xrdp_connected_login.png?resize=716%2C582&ssl=1
[6]: https://ubuntu.com/
[7]: https://itsfoss.com/install-gui-ubuntu-server/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/xrdp-ubuntu.png?resize=800%2C450&ssl=1
[9]: https://itsfoss.com/check-ip-address-ubuntu/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/xrdp_gnome-boxes_connect-begin.png?resize=744%2C580&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/xrdp_gnome-boxes_rdp-connect.png?resize=757%2C514&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/xrdp_connected_homescreen.png?resize=711%2C595&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/xrdp_extensions.png?resize=800%2C557&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/xrdp_tweaks.png?resize=800%2C550&ssl=1
