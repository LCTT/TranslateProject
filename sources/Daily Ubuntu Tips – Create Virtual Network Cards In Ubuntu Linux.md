                                    翻译中 Luox
Daily Ubuntu Tips – Create Virtual Network Cards In Ubuntu Linux
================================================================================
This tutorial is for users who want to experiment a bit with Ubuntu Linux. It not for everyone, especially those with machines that are used in production.

If you know a thing or two about networking and IP networks, then you know that in most cases, each network card will only be assigned one IP address. It’s a one to one thing and that’s what we’re used to.

The thing with one network card  and one IP address is, you can only host or run in single network service/port on a machine with one nic card and IP address. For example, if you wish to run a web server, on port 80, only one web server will listen on that one IP address and that port #. That’s how it’s designed to work.

So, instead of the one-to-one relation with network cards and IP addresses, you can create virtual network cards that can be assigned individual IP addresses. So, a single physical network card can host unlimited sub-nic cards or virtual nic. Each can then be assigned their own IP addresses with assigned ports.

This brief tutorial is going to show you how to do that in Ubuntu. It’s a great way to run and test multiple network services with single port # on a single computer with one network card.

To get started, run the commands to open the network interfaces file.

    sudo gedit /etc/network/interfaces

Then add as many virtual network cards as you want by following the steps in the picture below. By default, Linux machine assigned eth0 name to the first network card. So if your machine has one network card, it will be named eth0.

To add virtual network cards, create more static cards and name them eth0:1, eth0:2, eth0:3, etc. (eth0 followed by colon and a number).

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/virtualnetworkcardubuntu.png)

Also, for each network card you create, make sure each network is in a separate subnet.. this is  networking 101.

When you’re done, save the file and reset the networking service by running the commands below.

    sudo service networking restart

That’s it!

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/virtualnetworkcardubuntu1.png)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/11/daily-ubuntu-tips-create-virtual-network-cards-in-ubuntu-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
