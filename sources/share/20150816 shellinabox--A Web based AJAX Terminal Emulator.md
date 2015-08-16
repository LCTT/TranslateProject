translating by xiaoyu33

shellinabox – A Web based AJAX Terminal Emulator
================================================================================
### About shellinabox ###

Greetings Unixmen readers!

We, usually, access any remote servers using well known communication tools like OpenSSH, and Putty etc. But, one important thing is we can’t access the remote systems using those tools behind a Firewall or the firewalls that allow only HTTPS traffic. No worries! We, still, have some options to access your remote systems even if you’re behind a firewall. And also, you don’t need to install any communications tools like OpenSSH or Putty. All you need is only a modern JavaScript and CSS enabled browser. And you don’t need to install any plugins or third party softwares either. 

Meet **Shell In A Box**, pronounced as **shellinabox**, a free, open source, web based AJAX Terminal emulator developed by **Markus Gutschke**. It uses AJAX technology to provide the look and feel of a native shell via a web browser. The **shellinaboxd** daemon implements a webserver that listens on the specified port. The web server publishes one or more services that will be displayed in a VT100 emulator implemented as an AJAX web application. By default, the port is 4200. You can change the default port to any random port number of your choice. After installing shellinabox on all your remote servers that you want to access them from your local system, open up the web browser and navigate to: **http://IP-Address:4200/**. Enter your user name and password and start using your remote system’s shell. Seems interesting, isn’t it? Indeed!

**Disclaimer**:

Shellinabox is not a ssh client or any sort of security software. It is just a application that emulates a remote system’s shell via a web browser. Also, It has nothing to do with SSH in anyway. It’s not a bullet proof security way to remote your systems. It is just one of the easiest methods so far. You should not run it on any public network for any reason.

### Install shellinabox ###

#### In Debian/Ubuntu based systems: ####

shellinabox is available in the default repositories. So, you can install it using command:

    $ sudo apt-get install shellinabox

#### In RHEL/CentOS systems: ####

First, install EPEL repository using command:

    # yum install epel-release

Then, install shellinabox using command:

    # yum install shellinabox

Done!

### Configure shellinabox ###

As I mentioned before, shellinabox listens on port **4200** by default. You can change this port to any random number of your choice to make it difficult to guess by anyone.

The shellinabox config file is located in **/etc/default/shellinabox** file by default in Debian/Ubuntu systems. In RHEL/CentOS/Fedora, the default location of config file is **/etc/sysconfig/shellinaboxd**.

If you want to change the default port,

In Debian/Ubuntu:

    $ sudo vi /etc/default/shellinabox

In RHEL/CentOS/Fedora:

    # vi /etc/sysconfig/shellinaboxd

Change your port to any random number. Since I am testing it on my local network, I use the default values.

    # Shell in a box daemon configuration
    # For details see shellinaboxd man page
    
    # Basic options
    USER=shellinabox
    GROUP=shellinabox
    CERTDIR=/var/lib/shellinabox
    PORT=4200
    OPTS="--disable-ssl-menu -s /:LOGIN"
    
    # Additional examples with custom options:
    
    # Fancy configuration with right-click menu choice for black-on-white:
    # OPTS="--user-css Normal:+black-on-white.css,Reverse:-white-on-black.css --disable-ssl-menu -s /:LOGIN"
    
    # Simple configuration for running it as an SSH console with SSL disabled:
    # OPTS="-t -s /:SSH:host.example.com"

Restart shelinabox service.

**In Debian/Ubuntu:**

    $ sudo systemctl restart shellinabox

Or

    $ sudo service shellinabox restart

In RHEL/CentOS systems run the following command to start shellinaboxd service automatically on every reboot.

    # systemctl enable shellinaboxd

Or

    # chkconfig shellinaboxd on

Remember to open up port **4200** or any port that you assign if you are running a firewall.

For example, in RHEL/CentOS systems, you can allow the port as shown below.

    # firewall-cmd --permanent --add-port=4200/tcp

----------

    # firewall-cmd --reload

### Usage ###

Now, go to your client systems, open up the web browser and navigate to: **https://ip-address-of-remote-servers:4200**.

**Note**: Mention the correct port if you have changed it.

You’ll get a warning message of certificate issue. Accept the certificate and go on.

![Privacy error - Google Chrome_001](http://www.unixmen.com/wp-content/uploads/2015/08/Privacy-error-Google-Chrome_001.jpg)

Enter your remote system’s username and password. Now, you’ll be able to access the remote system’s shell right from the browser itself.

![Shell In A Box - Google Chrome_003](http://www.unixmen.com/wp-content/uploads/2015/08/sk@server1-Shell-In-A-Box-Google-Chrome_003.jpg)

You can get some additional menu options which might be useful by right clicking on the empty space of your browser.

![Shell In A Box - Google Chrome_004](http://www.unixmen.com/wp-content/uploads/2015/08/sk@server1-Shell-In-A-Box-Google-Chrome_004.jpg)

From now on, you can do whatever you want to do in your remote server from the local system’s web browser.

Once you done, type **exit** in the shell.

To connect again to the remote system, click the **Connect** button and then type the user name and password of your remote server.

![Shell In A Box - Google Chrome_005](http://www.unixmen.com/wp-content/uploads/2015/08/sk@server1-Shell-In-A-Box-Google-Chrome_005.jpg)

For more details about shellinabox, type the following command in your Terminal:

    # man shellinabox

Or

    # shellinaboxd -help

Also, refer the [shellinabox wiki page][1] for comprehensive usage details.

### Conclusion ###

Like I mentioned before, web-based SSH tools are very useful if you’re running servers behind a Firewall. There are many web-based ssh tools, but Shellinabox is pretty simple and useful tool to emulate a remote system’s shell from anywhere in your network. Since, it is browser based, you can access your remote server from any device as long as you have a JavaScript and CSS enabled browser.

That’s all for now. Have a good day!

#### Reference link: ####

- [shellinabox website][2]

--------------------------------------------------------------------------------

via: http://www.unixmen.com/shellinabox-a-web-based-ajax-terminal-emulator/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:https://code.google.com/p/shellinabox/wiki/shellinaboxd_man
[2]:https://code.google.com/p/shellinabox/
