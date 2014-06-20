ENCRYPT DNS TRAFFIC IN LINUX WITH DNSCRYPT (VIA OPENDNS)
================================================================================
**DNSCrypt, as its name suggests, encrypts DNS traffic between your computer and OpenDNS, in the same way SSL turns HTTP traffic into HTTPS encrypted traffic.**

Initially, DNSCrypt was announced as being available for Mac only for now, but according to an OpenDNS [article][1] posted yesterday, the source code for DNSCrypt was published on GitHub when they've released the Mac preview and even though there's no user interface yet, Linux users can already install DNSCrypt.

### Why use DNSCrypt? ###

**DNSCrypt encrypts all DNS traffic between your computer and the OpenDNS servers (so you'll be using OpenDNS) and can protect you from man-in-the-middle attacks, spying, resolver impersonation, can prevent Internet service providers from blocking various websites and more.**

This is the first tool that encrypts DNS traffic - for instance, TOR encrypts DNS requests, but they are decrypted at the exit node.

> It doesn’t require any changes to domain names or how they work, it simply provides a method for securely encrypting communication between our customers and our DNS servers in our data centers.

You can read more about DNSCrypt @ [OpenSND DNSCrypt][2] page and on [GitHub][3].

### How to use DNSCrypt in Linux ###

[Download DNSCrypt][4], install it and then run the following command in a terminal:

    sudo /usr/sbin/dnscrypt-proxy --daemonize

![](http://4.bp.blogspot.com/-WLefdXHIzwg/Tz45kGKAZdI/AAAAAAAAH0k/KLBnWJom6-g/s1600/edit-network.png)

Then set your DNS server to "127.0.0.1" - to do this under GNOME, go to your Network Connections and select "Edit" and enter "127.0.0.1" under "DNS servers". If you are using DHCP, just select "Automatic (DHCP) addresses only, so you can enter a DNS server. Then, restart your network connection.

You can then check if you're using OpenDNS by visiting [THIS][5] link.

To get DNSCrypt to start automatically, you must create an init script. For Ubuntu, see below.

**Arch Linux users can install DNSCrypt-proxy via [AUR][6]** (it includes an rc.d script).

### DNSCrypt in Ubuntu ###

To make DNSCrypt start automatically in Ubuntu, I've created an Upstart script which you can use if you want - [download it][7].

Update: Because in Ubuntu 12.04 there is a local DNS cache running on 127.0.0.1 (dnsmasq), I've updated the script to make DNSCrypt use 127.0.0.2, so you should add "**127.0.0.2**" as your DNS and not "127.0.0.1" if you're using this script (for any Ubuntu version). Thanks to zzecool for testing it in Ubuntu 12.04!

To install the script, use the commands below (firstly extract the downloaded archive):

    sudo cp dnscrypt.conf /etc/init/
    sudo ln -s /lib/init/upstart-job /etc/init.d/dnscrypt

And finally, start it with:

    sudo start dnscrypt

DNSCrypt should now start automatically when you boot. To stop it, you can use:

    sudo stop dnscrypt

[Download DNSCrypt][8] (.deb, .rpm and source code available)

--------------------------------------------------------------------------------

via: http://www.webupd8.org/2012/02/encrypt-dns-traffic-in-linux-with.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://blog.opendns.com/2012/02/16/tales-from-the-dnscrypt-linux-rising/
[2]:http://www.opendns.com/technology/dnscrypt/
[3]:https://github.com/opendns/dnscrypt-proxy
[4]:http://download.dnscrypt.org/dnscrypt-proxy/
[5]:http://www.opendns.com/welcome
[6]:http://aur.archlinux.org/packages.php?ID=54702
[7]:http://webupd8.googlecode.com/files/dnscrypt-0.2.tar.gz
[8]:https://github.com/opendns/dnscrypt-proxy/downloads