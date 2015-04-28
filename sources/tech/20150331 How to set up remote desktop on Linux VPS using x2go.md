translating by createyuan

How to set up remote desktop on Linux VPS using x2go
================================================================================
As everything is moved to the cloud, virtualized remote desktop becomes increasingly popular in the industry as a way to enhance employee's productivity. Especially for those who need to roam constantly across multiple locations and devices, remote desktop allows them to stay connected seamlessly to their work environment. Remote desktop is attractive for employers as well, achieving increased agility and flexibility in work environments, lower IT cost due to hardware consolidation, desktop security hardening, and so on.

In the world of Linux, of course there is no shortage of choices for settings up remote desktop environment, with many protocols (e.g., RDP, RFB, NX) and server/client implementations (e.g., [TigerVNC][1], RealVNC, FreeNX, x2go, X11vnc, TeamViewer) available.

Standing out from the pack is [X2Go][2], an open-source (GPLv2) implementation of NX-based remote desktop server and client. In this tutorial, I am going to demonstrate **how to set up remote desktop environment for [Linux VPS][3] using X2Go**.

### What is X2Go? ###

The history of X2Go goes back to NoMachine's NX technology. The NX remote desktop protocol was designed to deal with low bandwidth and high latency network connections by leveraging aggressive compression and caching. Later, NX was turned into closed-source while NX libraries were made GPL-ed. This has led to open-source implementation of several NX-based remote desktop solutions, and one of them is X2Go.

What benefits does X2Go bring to the table, compared to other solutions such as VNC? X2Go inherits all the advanced features of NX technology, so naturally it works well over slow network connections. Besides, X2Go boasts of an excellent track record of ensuring security with its built-in SSH-based encryption. No longer need to set up an SSH tunnel [manually][4]. X2Go comes with audio support out of box, which means that music playback at the remote desktop is delivered (via PulseAudio) over network, and fed into local speakers. On usability front, an application that you run on remote desktop can be seamlessly rendered as a separate window on your local desktop, giving you an illusion that the application is actually running on the local desktop. As you can see, these are some of [its powerful features][5] lacking in VNC based solutions.

### X2GO's Desktop Environment Compatibility ###

As with other remote desktop servers, there are [known compatibility issues][6] for X2Go server. Desktop environments like KDE3/4, Xfce, MATE and LXDE are the most friendly to X2Go server. However, your mileage may vary with other desktop managers. For example, the later versions of GNOME 3, KDE5, Unity are known to be not compatible with X2Go. If the desktop manager of your remote host is compatible with X2Go, you can follow the rest of the tutorial.

### Install X2Go Server on Linux ###

X2Go consists of remote desktop server and client components. Let's start with X2Go server installation. I assume that you already have an X2Go-compatible desktop manager up and running on a remote host, where we will be installing X2Go server.

Note that X2Go server component does not have a separate service that needs to be started upon boot. You just need to make sure that SSH service is up and running.

#### Ubuntu or Linux Mint: ####

Configure X2Go PPA repository. X2Go PPA is available for Ubuntu 14.04 and higher.

    $ sudo add-apt-repository ppa:x2go/stable
    $ sudo apt-get update
    $ sudo apt-get install x2goserver x2goserver-xsession

#### Debian (Wheezy): ####

    $ sudo apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E
    $ sudo sh -c "echo deb http://packages.x2go.org/debian wheezy main > /etc/apt/sources.list.d/x2go.list"
    $ sudo sh -c "echo deb-src http://packages.x2go.org/debian wheezy main >> /etc/apt/sources.list.d/x2go.list"
    $ sudo apt-get update
    $ sudo apt-get install x2goserver x2goserver-xsession

#### Fedora: ####

    $ sudo yum install x2goserver x2goserver-xsession

#### CentOS/RHEL: ####

Enable [EPEL respository][7] first, and then run:

    $ sudo yum install x2goserver x2goserver-xsession 

### Install X2Go Client on Linux ###

On a local host where you will be connecting to remote desktop, install X2GO client as follows.

#### Ubuntu or Linux Mint: ####

Configure X2Go PPA repository. X2Go PPA is available for Ubuntu 14.04 and higher.

    $ sudo add-apt-repository ppa:x2go/stable
    $ sudo apt-get update
    $ sudo apt-get install x2goclient

Debian (Wheezy):

    $ sudo apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E
    $ sudo sh -c "echo deb http://packages.x2go.org/debian wheezy main > /etc/apt/sources.list.d/x2go.list"
    $ sudo sh -c "echo deb-src http://packages.x2go.org/debian wheezy main >> /etc/apt/sources.list.d/x2go.list"
    $ sudo apt-get update
    $ sudo apt-get install x2goclient

#### Fedora: ####

    $ sudo yum install x2goclient

CentOS/RHEL:

Enable EPEL respository first, and then run:

    $ sudo yum install x2goclient 

### Connect to Remote Desktop with X2Go Client ###

Now it's time to connect to your remote desktop. On the local host, simply run the following command or use desktop launcher to start X2Go client.

    $ x2goclient

Enter the remote host's IP address and SSH user name. Also, specify session type (i.e., desktop manager of a remote host).

![](https://farm9.staticflickr.com/8730/16365755693_75f3d544e9_b.jpg)

If you want, you can customize other things (by pressing other tabs), like connection speed, compression, screen resolution, and so on.

![](https://farm9.staticflickr.com/8699/16984498482_665b975eca_b.jpg)

![](https://farm9.staticflickr.com/8694/16985838755_1b7df1eb78_b.jpg)

When you initiate a remote desktop connection, you will be asked to log in. Type your SSH login and password.

![](https://farm9.staticflickr.com/8754/16984498432_1c8068b817_b.jpg)

Upon successful login, you will see the remote desktop screen.

![](https://farm9.staticflickr.com/8752/16798126858_1ab083ba80_c.jpg)

If you want to test X2Go's seamless window feature, choose "Single application" as session type, and specify the path to an executable on the remote host. In this example, I choose Dolphin file manager on a remote KDE host.

![](https://farm8.staticflickr.com/7584/16798393920_128c3af9c5_b.jpg)

Once you are successfully connected, you will see a remote application window open on your local desktop, not the entire remote desktop screen.

![](https://farm9.staticflickr.com/8742/16365755713_7b90cf65f0_c.jpg)

### Conclusion ###

In this tutorial, I demonstrated how to set up X2Go remote desktop on [Linux VPS][8] instance. As you can see, the whole setup process is pretty much painless (if you are using a right desktop environment). While there are some desktop-specific quirkiness, X2Go is a solid remote desktop solution which is secure, feature-rich, fast, and free.

What feature is the most appealing to you in X2Go? Please share your thought.

--------------------------------------------------------------------------------

via: http://xmodulo.com/x2go-remote-desktop-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://ask.xmodulo.com/centos-remote-desktop-vps.html
[2]:http://wiki.x2go.org/
[3]:http://xmodulo.com/go/digitalocean
[4]:http://xmodulo.com/how-to-set-up-vnc-over-ssh.html
[5]:http://wiki.x2go.org/doku.php/doc:newtox2go
[6]:http://wiki.x2go.org/doku.php/doc:de-compat
[7]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
[8]:http://xmodulo.com/go/digitalocean
