How IP forwarding Helps Connecting Private interface to Internet in Linux
================================================================================
Hi everyone, today we'll learn about IP forwarding or Packet forwarding from one network interface to another in Linux using iptables. IP forwarding is a concept to make Linux machine to send data from one network to another as a router. So, it can be used as a **router** or a proxy server that can share internet or network connection from one connection to multiple client machines.

Here are some easy steps to enable IP Forwarding or Network packets forwarding method.

### 1. Enabling IPv4 Forwarding ###

First of all, we'll gonna enable IPv4 forwarding in our Linux Operating System. To do that, we'll need to execute the following command in a shell or a terminal under sudo mode.

    $ sudo -s

    # echo 1 > /proc/sys/net/ipv4/ip_forward

![Temporary IP Forwarding](http://blog.linoxide.com/wp-content/uploads/2015/03/ip-forward-temporary.png)

**Note: the above command is enables ip forwarding instantly and temporarily until the next reboot. To enable it permanently, we'll need to open /etc/sysctl.conf using our favorite text editor.**

    # nano /etc/sysctl.conf

Then, add **net.ipv4.ip_forward = 1** into that file or uncomment that line then, we'll need to save and exit that file.

    net.ipv4.ip_forward = 1

![Editing Sysctl](http://blog.linoxide.com/wp-content/uploads/2015/03/sysctl-edit.png)

To enable the changes made run the following command.

    # sysctl -p /etc/sysctl.conf

![Enabling Sysctl Changes](http://blog.linoxide.com/wp-content/uploads/2015/03/enabling-changes-sysctl.png)

### 2. Configuring Iptables firewall ###

We'll need to allow specific (or all of the) packets to traverse our router. Before that, we'll need to know the interface name of the network devices connected with our Linux box. To get the interface name, we can simply run the following command in a terminal or a shell.

    # ifconfig -a

![Ifconfig](http://blog.linoxide.com/wp-content/uploads/2015/03/ifconfig.png)

Here, in our box we have eth2 as network interface which is connected to the internet or a network and wlan2 is the interface where we need to forward the network packets from eth2 using iptables. So, to do so, we'll need to run the following command.

    # iptables -A FORWARD -i wlan2 -o eth2 -j ACCEPT

Note: Please replace wlan2 and eth2 with the device name available in your Linux box.

Now, we'll need iptables to allow traffic for already established connections as netfilter is a stateless firewall. To do so, we'll need to run the following command.

    # iptables -A FORWARD -i eth2 -o wlan2 -m state --state ESTABLISHED,RELATED  -j ACCEPT

![Forwarding with iptables](http://blog.linoxide.com/wp-content/uploads/2015/03/forwarding-iptables.png)

### 3. Configuring NAT ###

Then, at last we'll need to change the source address as eth2 on packets going out to the internet by executing the command below.

    # iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE

![configuring nat](http://blog.linoxide.com/wp-content/uploads/2015/03/configuring-nat.png)

### Conclusion ###

Finally, we've successfully configured Packet forwarding from one interface to another interface on our Linux machine having iptables installed as firewall solution. This article enables to connect your private interface to the internet, you don't need bridging the interfaces, you need to route packets coming in on one interface to the other one, thats all. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-) 

--------------------------------------------------------------------------------

via: http://linoxide.com/firewall/ip-forwarding-connecting-private-interface-internet/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/