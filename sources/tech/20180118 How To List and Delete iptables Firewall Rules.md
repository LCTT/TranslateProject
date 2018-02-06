How To List and Delete iptables Firewall Rules
======
![How To List and Delete iptables Firewall Rules][1]

We'll show you, how to list and delete iptables firewall rules. Iptables is a command line utility that allows system administrators to configure the packet filtering rule set on Linux. iptables requires elevated privileges to operate and must be executed by user root, otherwise it fails to function.

### How to List iptables Firewall Rules

Iptables allows you to list all the rules which are already added to the packet filtering rule set. In order to be able to check this you need to have SSH access to the server. [Connect to your Linux VPS via SSH][2] and run the following command:
```
sudo iptables -nvL
```

To run the command above your user need to have `sudo` privileges. Otherwise, you need to [add sudo user on your Linux VPS][3] or use the root user.

If there are no rules added to the packet filtering ruleset the output should be similar to the one below:
```
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target prot opt in out source destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target prot opt in out source destination

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target prot opt in out source destination

```

Since NAT (Network Address Translation) can also be configured via iptables, you can use iptables to list the NAT rules:
```
sudo iptables -t nat -n -L -v
```

The output will be similar to the one below if there are no rules added:
```
Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target prot opt in out source destination

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target prot opt in out source destination

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target prot opt in out source destination

```

If this is the case we recommend you to check our tutorial on How to [Set Up a Firewall with iptables on Ubuntu and CentOS][4] to make your server more secure.

### How to Delete iptables Firewall Rules

At some point, you may need to remove a specific iptables firewall rule on your server. For that purpose you need to use the following syntax:
```
iptables [-t table] -D chain rulenum
```

For example, if you have a firewall rule to block all connections from 111.111.111.111 to your server on port 22 and you want to remove that rule, you can use the following command:
```
sudo iptables -D INPUT -s 111.111.111.111 -p tcp --dport 22 -j DROP
```

Now that you removed the iptables firewall rule you need to save the changes to make them persistent.

In case you are using [Ubuntu VPS][5] you need to install additional package for that purpose. To install the required package use the following command:
```
sudo apt-get install iptables-persistent
```

On **Ubutnu 14.04** you can save and reload the firewall rules using the commands below:
```
sudo /etc/init.d/iptables-persistent save
sudo /etc/init.d/iptables-persistent reload
```

On **Ubuntu 16.04** use the following commands instead:
```
sudo netfilter-persistent save
sudo netfilter-persistent reload
```

If you are using [CentOS VPS][6] you can save the changes using the command below:
```
service iptables save
```

Of course, you don't have to list and delete iptables firewall rules if you use one of our [Managed VPS Hosting][7] services, in which case you can simply ask our expert Linux admins to help you list and delete iptables firewall rules on your server. They are available 24×7 and will take care of your request immediately.

**PS**. If you liked this post, on how to list and delete iptables firewall rules, please share it with your friends on the social networks using the buttons on the left or simply leave a reply below. Thanks.

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/how-to-list-and-delete-iptables-firewall-rules/

作者：[RoseHosting][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com
[1]:https://www.rosehosting.com/blog/wp-content/uploads/2018/01/How-To-List-and-Delete-iptables-Firewall-Rules.jpg
[2]:https://www.rosehosting.com/blog/connect-to-your-linux-vps-via-ssh/
[3]:https://www.rosehosting.com/blog/how-to-create-a-sudo-user-on-ubuntu/
[4]:https://www.rosehosting.com/blog/how-to-set-up-a-firewall-with-iptables-on-ubuntu-and-centos/
[5]:https://www.rosehosting.com/ubuntu-vps.html
[6]:https://www.rosehosting.com/centos-vps.html
[7]:https://www.rosehosting.com/managed-vps-hosting.html
