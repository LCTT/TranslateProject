Daily Ubuntu Tips–Protect Your Computers Using OpenDNS’ Secure DNS Infrastructure
================================================================================
The Internet is a jungle. Everyone – good and bad is connected to the same Internet we’re all connected to. Folks whose business is to infect your computer with nasty viruses and those who seek to protect the good guys are all connected.

With that said, the Internet is the best thing that ever happened to mankind. It contains wealth of information and resources that anyone can access, mostly free of charge. Some of the most prestigious colleges are offering free high level courses to anyone who wants to learn. It is a good thing that the Internet is available to us today.

Something to always keep in your mind when using the Internet is that your computer is always a target. A target for viruses, malwares and other programs that want to destroy it.

Because of that, it’s always recommended to use the Internet with computers that are protected with antivirus and antispyware programs. In some cases, that may still not be enough. Adding more layers of security is always good.

When looking to add additional layers of security to protect your machines, using OpenDNS’ secure DNS infrastructure may help. There are many parts that make up the Internet and protecting as many of its parts is the best way to go.

First, you’ll want to install antivirus and antispyware programs on your computers. Because browsing the Internet allows your computer to query remote DNS providers, using protected and secured DNS providers will go a long way protecting your machine.

This brief tutorials is going to show you how to configure Ubuntu machine to use OpenDNS’ infrastructure to help protect your machines.

    sudo gedit /etc/dhcp/dhclient.conf

Finally, add the line below into the file and save it.

    supersede domain-name-servers 208.67.222.222,208.67.220.220;

Restart your computer and enjoy!

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/opendns-ubuntu.png)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/11/daily-ubuntu-tipsprotect-your-computers-using-opendns-secure-dns-infrastructure/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出