Surf anonymously: Learn to install TOR network on Linux
======
Tor Network is an anonymous network to secure your internet & privacy. Tor network is a group of volunteer operated servers. Tor protects internet communication by bouncing it around a distributed network of relay system run by volunteers. This prevents us from people snooping the internet, they can't learn what site we visit or where is the user physically & it also allows us to use blocked websites.

In this tutorial, we will learn to install Tor network on various Linux operating systems & how we can use it configure our applications to secure the communications.

 **(Recommended Read:[How to install Tor Browser on Linux (Ubuntu, Mint, RHEL, Fedora, CentOS)][1])**

### CentOS/RHEL/Fedora

Tor packages are part of EPEL repositories, so we can simply install Tor using yum if we have EPEL repositories installed. If you need to install EPEL repos on your system, use the suitable command (based on OS & Architecture) from the following ,

 **RHEL/CentOS 7**

 **$ sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-11.noarch.rpm**

 **RHEL/CentOS 6 (64 Bit)**

 **$ sudo rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm**

 **RHEL/CentOS 6 (32 Bit)**

 **$ sudo rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm**

Once installed, we can than install Tor browser with the following command,

 **$ sudo yum install tor**

### Ubuntu

For installing Tor network on Ubuntu machines, we need to add Official Tor repositories. We need to add the repo information to '/etc/apt/sources.list'

 **$ sudo nano /etc/apt/sources.list**

Now add the repo information mentioned below based on your OS,

 **Ubuntu 16.04**

 **deb http://deb.torproject.org/torproject.org xenial main**
**deb-src http://deb.torproject.org/torproject.org xenial main**

 **Ubuntu 14.04**

 **deb http://deb.torproject.org/torproject.org trusty main**
**deb-src http://deb.torproject.org/torproject.org trusty main**

Next open the terminal & execute the following two commands to add the gpg keys used to sign the packages,

 **$ gpg -keyserver keys.gnupg.net -recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89**
**$ gpg -export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -**

Now run update & install the Tor network,

 **$ sudo apt-get update**
**$ sudo apt-get install tor deb.torproject.org-keyring**

### Debian

We can install Tor network on Debian without having to add any repositories. Just open the terminal & execute the following command as root,

 **$ apt install tor**

###

### Tor Configuration

If your end game is only to secure the internet browsing & not anything else, than its better you use Tor Browser but if you need to secure your apps like Instant Messaging, IRC, Jabber etc than we need to configure those apps for secure communication. But Before we do that, let's check out some [**warning mentioned on Tor Website**][2]

- No torrents over Tor
- Don't use any browser plugins with Tor
- Use only HTTPS version of the websites
- Don't open any document downloaded through Tor while online.
- Use Tor bridges when you can

Now to configure any app to use Tor, for example jabber; firstly select the 'SOCKS proxy' rather than using the HTTP proxy & use port number 9050 or you can also use port 9150 (used by Tor browser).

![install tor network][4]

You can also configure Firefox browser to be used on Tor network. Open Firefox browser & goto 'Network Proxy ' settings in 'Preferences' under 'General' tab & make the proxy entry as follows,

![install tor network][6]

We can now access Firefox on Tor network with complete anonymity.

This was our tutorial on how we can install Tor network & use ti to surf the internet anonymously. Do mention you queries & suggestions in the comment box below.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/learn-install-tor-network-linux/

作者：[Shusain][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/install-tor-browser-linux-ubuntu-centos/
[2]:https://www.torproject.org/download/download.html.en#warning
[4]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/12/tor-1-compressor.png?resize=333%2C240
[6]:https://i1.wp.com/linuxtechlab.com/wp-content/uploads/2017/12/tor-2-compressor.png?resize=730%2C640
