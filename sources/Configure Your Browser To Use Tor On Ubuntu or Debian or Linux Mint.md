(翻译中 by runningwater)
Configure Your Browser To Use Tor On Ubuntu/Debian/Linux Mint
================================================================================
**Tor**, **T**he **O**nion **R**outer, is a network of Virtual Tunnels that allows users to communicate securely and as well as anonymously over Internet. Tor allows organizations and individuals to share information over public networks without compromising their privacy. We can use Tor to keep websites from tracking us and also our family members, or to connect to news sites, instant messaging services, or the websites which are blocked by the Internet providers and Network Administrators.

Tor was originally designed, implemented, and deployed as a third-generation [onion routing project of the U.S. Naval Research Laboratory][1]. It was originally developed with the U.S. Navy in mind, for the primary purpose of protecting government communications. Today, it is used every day for a wide variety of purposes by normal people, the military, journalists, law enforcement officers, activists, and many others.

In this quick how-to let us learn how to use Tor with our browsers. The steps provided here were tested on Ubuntu 13.04 Desktop, but it should work on all Debian/Ubuntu and its derivatives.

### Install Tor & Vidalia On Ubuntu / Debian / Linux Mint ###

Tor is available in the default repositories of Debian/Ubuntu, but they might be bit outdated. So add Tor repository to your distribution source lists.

Edit file **/etc/apt/sources.list**,

    $ sudo nano /etc/apt/sources.list

Add the following lines depending upon your distribution version. As i am testing this on my Ubuntu 13.04 desktop, i added the following lines.

    [...]
    deb     http://deb.torproject.org/torproject.org raring main

Save and close the file. If you’re using Ubuntu 13.10, then the lines should be,

    deb     http://deb.torproject.org/torproject.org saucy main

For Debian 7 Wheezy,

    deb     http://deb.torproject.org/torproject.org wheezy main

Add the gpg key using following commands:

    $ gpg --keyserver keys.gnupg.net --recv 886DDD89 
    $ gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -

Update the repository list and install vidalia using commands:

    $ sudo apt-get update
    $ sudo apt-get install tor vidalia deb.torproject.org-keyring

During installation, you’ll be asked which user should be able to control Tor service. Select the user and click Ok.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/12/sk@sk-_013.jpg)

Now Vidalia is installed and running.

### Configure Firefox Browser ###

Open your browser. Go to **Edit -> Preferences -> Advanced -> Network ->Settings**. Select manual Proxy Configuration. In the SOCKS Host column, enter **localhost** or **127.0.0.1** and in the port column enter **9050** as shown in the below screenshot.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/12/Firefox-Preferences_015.jpg)

Now point your browser with URL **https://check.torproject.org/**. You will see a green message that indicates: “**Congratulations. This browser is configured to use Tor**”. Red message indicate that Tor is not setup. Refer the following screenshot.

![Are you using Tor? - Mozilla Firefox_014](http://180016988.r.cdn77.net/wp-content/uploads/2013/12/Are-you-using-Tor-Mozilla-Firefox_014.jpg)

The same settings are applicable for all browsers, just open the Browser settings/preferences window, find the Network settings, Enter **127.0.0.1** in proxy server column and **9050** in port box. To disable Tor, Select **Use System Proxy settings** on browser settings.

**Note**: If you want to use Tor for anonymous web browsing, please read our article about [Tor Browser Bundle][2]. It comes with readily configured Tor and a browser patched for better anonymity. To use SOCKS directly (for instant messaging, Jabber, IRC, etc), you can point your application directly at Tor (localhost port 9050), but see [this FAQ entry][3] for why this may be dangerous.

That’s it. Good Luck! Stay Safe!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/configure-browser-use-tor-ubuntu-debian-linux-mint/

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.onion-router.net/
[2]:http://www.unixmen.com/protect-your-online-privacy-with-tor-browser/
[3]:https://trac.torproject.org/projects/tor/wiki/doc/TorFAQ#SOCKSAndDNS