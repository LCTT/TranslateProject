translating by martin.

Nmap—Not Just for Evil!
================================================================================
If SSH is the Swiss Army knife of the system administration world, Nmap is a box of dynamite. It's really easy to misuse dynamite and blow your foot off, but it's also a very powerful tool that can do jobs that are impossible without it. 

When most people think of Nmap, they think of scanning servers, looking for open ports to attack. Through the years, however, that same ability is incredibly useful when you're in charge of the server or computer in question. Whether you're trying to figure out what kind of server is using a specific IP address in your network or trying to lock down a new NAS device, scanning networks is incredibly useful. 

Figure 1 shows a network scan of my QNAP NAS. The only thing I use the unit for is NFS and SMB file sharing, but as you can tell, it has a ton of ports wide open. Without Nmap, it would be difficult to figure out what the machine was running. 

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1002061/11825nmapf1.jpg)

### Figure 1. Network Scan  ###

Another incredibly useful way to use Nmap is to scan a network. You don't even have to have root access for that, and it's as simple as specifying the network block you want to scan. For example, typing: 

    nmap 192.168.1.0/24

will scan the entire range of 254 possible IP addresses on my local network and let me know which are pingable, along with which ports are open. If you've just plugged in a new piece of hardware, but don't know what IP address it grabbed via DHCP, Nmap is priceless. For example, the above command revealed this on my network: 

    Nmap scan report for TIVO-8480001903CCDDB.brainofshawn.com (192.168.1.220)
    Host is up (0.0083s latency).
    Not shown: 995 filtered ports
    PORT     STATE  SERVICE
    80/tcp   open   http
    443/tcp  open   https
    2190/tcp open   tivoconnect
    2191/tcp open   tvbus
    9080/tcp closed glrpc

This not only tells me the address of my new Tivo unit, but it also shows me what ports it has open. Thanks to its reliability, usability and borderline black hat abilities, Nmap gets this month's Editors' Choice award. It's not a new program, but if you're a Linux user, you should be using it! 

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/nmap%E2%80%94not-just-evil

作者：[Shawn Powers][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/users/shawn-powers
