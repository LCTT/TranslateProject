How to Install and Configure UFW – An Un-complicated FireWall in Debian/Ubuntu
================================================================================
Since computers are connected to each other, services are growing fast. **Email, Social Media, Online Shop, Chat** until **Web Conferencing** are services that used by user. But on the other side this connectivity just likes a double-side knife. It’s also possible to send bad messages to those computers like **Virus, malware, trojan-apps** are one of them.

![UFW Firewall for Ubuntu](http://www.tecmint.com/wp-content/uploads/2013/12/UFW-Firewall.jpeg)

*Install UFW Firewall*

The Internet, as the biggest computer network is not always fill with good people. In order to make sure our computers / servers are safe, we need to protect it.

One of the must have component on your computer / servers is **Firewall**. From **Wikipedia**, a definition is:

> In computing, a firewall is a software or hardware-based network security system that controls the incoming and outgoing network traffic by analysing the data packets and determining whether they should be allowed through or not, based on applied rule set.

**Iptables** is one of the firewall that widely used by servers. It is a program used to manage incoming and outgoing traffic in the server based on a set of rules. Generally, only trusted connection is allowed to enter the server. But **IPTables** is running at console mode and it’s complicated. Those who’re familiar with iptables rules and commands, they can read the following article that describes how to use iptables firewall.

- [Basic IPTables (Linux Firewall) Guide][1]

### Installation of UFW Firewall in Debian/Ubuntu ###

To reduce the complexity of how-to setting **IPTables**, there is a lot of fronted. If you’re running **Ubuntu** Linux, you will find **ufw** as a default firewall tool. Lets start to explore about **ufw** firewall.

### What is ufw ###

The **ufw (Uncomplicated Firewall)** is an frontend for most widely used **iptables firewall** and it is well comfortable for host-based firewalls. ufw gives a framework for managing **netfilter**, as well as provides a command-line interface for controlling the firewall. It provides user friendly and easy to use interface for Linux newbies who are not much familiar with firewall concepts.

While, on the other side same complicated commands helps administrators it set complicated rules using command line interface. The **ufw** is an upstream for other distributions such as **Debian, Ubuntu** and **Linux Mint**.

#### Basic Usage ufw ####

First, check if **ufw** is installed using following command.

    $ sudo dpkg --get-selection | grep ufw
    
    ufw 		install

If it’s not installed, you can install it using **apt** command as shown below.

    $ sudo apt-get install ufw

Before you use, you should check whether **ufw** is running or not. Use the following command to check it.

    $ sudo ufw status

If you found Status: **inactive**, it mean it’s not active or disable.

#### Enabling / Disabling ufw ####

To enable it, you just need to type the following command at the terminal.

    $ sudo ufw enable

    Firewall is active and enabled on system startup

To disable it, just type.

    $ sudo ufw disable

#### List the current ufw rules ####

After the firewall is activated you can add your rules into it. If you want to see what are the default rules, you can type.

    $ sudo status verbose

##### Sample Output #####

    Status: active
    Logging: on (low)
    Default: deny (incoming), allow (outgoing)
    New profiles: skip
    $

#### How to Add ufw rules ####

As you see, by default every incoming connection is denied. If you want to remote your machine then you have to allow proper port. For example you want to allow ssh connection. Here’s the command to allow it.

#### Allow Access ####

    $ sudo ufw allow ssh
    
    [sudo] password for pungki :
    Rule added
    Rule added (v6)
    $

If you check the status again, you will see an output like this.

    $ sudo ufw status
    
    To 		Action 			From
    -- 		----------- 		------
    22 		ALLOW 			Anywhere
    22 		ALLOW 			Anywhere (v6)

If you have a lot of rules, and want to put numbers on every rules on the fly, use parameter numbered.

    $ sudo ufw status numbered
    
    To 		Action 			From
    ------ 		----------- 		------
    [1] 22 		ALLOW 			Anywhere
    [2] 22 		ALLOW 			Anywhere (v6)

The first rule says that incoming connection to **port 22** from **Anywhere**, both **tcp** or **udp** packets is allowed. What if you want to allow **tcp** packet only? Then you can add the parameter **tcp** after the **port** number. Here’s an example with sample output.

    $ sudo ufw allow ssh/tcp
    
    To 		Action 			From
    ------ 		----------- 		------
    22/tcp 		ALLOW 			Anywhere
    22/tcp 		ALLOW 			Anywhere (v6)

#### Deny Access ####

The same tricks is applied to Deny rule. Let say you want to deny ftp rule. So you only have to type.

    $ sudo ufw deny ftp
    
    To 		Action 			From
    ------ 		----------- 		------
    21/tcp 		DENY 			Anywhere
    21/tcp 		DENY 			Anywhere (v6)

### Adding Specific Port ###

Sometimes we have a custom port which is not follow any standards. Let’s say we change the **ssh** port on our machine from **22**, into **2290**. Then to allow port **2290**, we can add it like this.

    $ sudo ufw allow
    
    To 		Action 			From
    -- 		----------- 		------
    2290 		ALLOW 			Anywhere
    2290 		ALLOW 			Anywhere (v6)

It also possible for you to add **port-range** into the rule. If we want to open port from **2290 – 2300** with **tcp** protocol, then the command will be like this.

    $ sudo ufw allow 2290:2300/tcp
    
    To 			Action 			From
    ------ 			----------- 		------
    2290:2300/tcp 		ALLOW 			Anywhere
    2290:2300/tcp 		ALLOW			Anywhere (v6)

while if you want to use **udp**, just use the following command.

    $ sudo ufw allow 2290:2300/udp
    
    To 			Action 			From
    ------ 			----------- 		------
    2290:2300/udp 		ALLOW 			Anywhere
    2290:2300/udp 		ALLOW			Anywhere (v6)

Please remember that you have to put ‘**tcp**’ or ‘**udp**’ explicitly otherwise you will get an error message similar to below.

    ERROR: Must specify ‘tcp’ or ‘udp’ with multiple ports

### Adding Specific IP ###

Previously we have added rules based on **service** or **port**. Ufw also allow you to add rules based on **IP Address**. Here’s the sample command.

    $ sudo ufw allow from 192.168.0.104
    
You can also use a subnet mask to wider the range.

    $ sudo ufw allow form 192.168.0.0/24
    
    To 		Action 			From
    -- 		----------- 		------
    Anywhere	ALLOW 			192.168.0.104
    Anywhere	ALLOW 			192.168.0.0/24

As you can see, from parameter will only limit the source of connection. While the destination – which is represented by **To** column – is **Anywhere**. You can also manage the destination using ‘**To**‘ parameter. Let’s see the sample to allow access to **port 22 (ssh)**.

    $ sudo ufw allow to any port 22

The above command will allow access from anywhere and from any protocol to **port 22**.

### Combining Parameters ###

For more specific rules, you can also combining IP Address, **protocol** and **port**. Let’s say we want to create rule that limit the connection only from IP 192.168.0.104, only protocol **tcp** and to port **22**. Then the command will be like below.

    $ sudo ufw allow from 192.168.0.104 proto tcp to any port 22

Syntax to create deny rule is similar with allow rule. You only need to change parameter from **allow** to **deny**.

### Deleting Rules ###

Sometime you may need to delete your existing rule. Once again with **ufw** it is easy to delete rules. From above sample, you have a rule below and you want to delete it.

    To 		Action 			From
    -- 		----------- 		------
    22/tcp		ALLOW 			192.168.0.104
    21/tcp		ALLOW 			Anywhere
    21/tcp 		ALLOW 			Anywhere (v6)

There are two methods of deleting rules.

**Method 1**

The below command will **delete** rules that match service **ftp**. So the **21/tcp** which mean **ftp** port will be deleted.

    $ sudo ufw delete allow ftp

**Method 2**

But when you tried to delete the first rule at the above example using below command.

    $ sudo ufw delete allow ssh
    
    Or 
    
    $ sudo ufw delete allow 22/tcp

You may find an error message such as.

    Could not delete non-existent rule
    Could not delete non-existent rule (v6)

Then you can do this trick. As we mentioned above, you can show the number of rule to indicate which rule that we want to delete. Let we show it to you.

    $ sudo ufw status numbered
    
    To 		Action 			From
    -- 		----------- 		------
    [1] 22/tcp		ALLOW 			192.168.0.104
    [2] 21/tcp		ALLOW 			Anywhere
    [3] 21/tcp 		ALLOW 			Anywhere (v6)

Then you can delete the first rule using. Press “**y**” will permanently delete the rule.

    $ sudo ufw delete 1
    
    Deleting :
    Allow from 192.168.0.104 to any port 22 proto tcp
    Proceed with operation (y|n)? y

From those methods you will see the difference. **Method 2** will ask **user confirmation** before deleting the rule while **method 1** is not.

### How to Reset Rules ###

In some situation, you may want to **delete / reset** all rules. You can do it by typing.

    $ sudo ufw reset
    
    Resetting all rules to installed defaults. Proceed with operation (y|n)? y

If you press “**y**”, then **ufw** will backup all existing rules before doing the reset your ufw. Resetting the rules will also disable your firewall. You need to enabled it again if you want to use it.

### Advanced Functionality ###

As I stated above, the ufw firewall can able to do whatever that iptables can do. This is accomplished by using various sets of rules files, which are nothing more than **iptables-restore** appropriate text files. Fine tuning ufw and/or placing additional iptables commands not allowed via the ufw command is a matter of editing several text files.

- /etc/default/ufw: The main configuration for default policies, IPv6 support and kernel modules.
- /etc/ufw/before[6].rules: rules in these files are calculate before any rules added via the ufw command.
- /etc/ufw/after[6].rules: rules in these files are calculate after any rules added via the ufw command.
- /etc/ufw/sysctl.conf: kernel network tunables.
- /etc/ufw/ufw.conf: sets whether or not ufw is enabled on boot and sets the LOGLEVEL.

### Conclusion ###

**UFW** as a front-end to iptables surely make an easy interface to user. User don’t need to remember complicated iptables syntax. **UFW** also use ‘**plain english**‘ as its parameter.

**Allow, deny, reset** are one of them. I believe that there are many more iptables front-end out there. But definitely ufw is one of the best alternative for users who want to setup their firewall fast, easy and of course secure. Please visit **ufw manual page** by typing **man ufw** for more detail.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/how-to-install-and-configure-ufw-firewall/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/basic-guide-on-iptables-linux-firewall-tips-commands/