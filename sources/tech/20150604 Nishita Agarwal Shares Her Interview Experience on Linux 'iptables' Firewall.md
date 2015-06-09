translating by wwy-hust

Nishita Agarwal Shares Her Interview Experience on Linux ‘iptables’ Firewall
================================================================================
Nishita Agarwal, a frequent Tecmint Visitor shared her experience (Question and Answer) with us regarding the job interview she had just given in a privately owned hosting company in Pune, India. She was asked a lot of questions on a variety of topics however she is an expert in iptables and she wanted to share those questions and their answer (she gave) related to iptables to others who may be going to give interview in near future.

![Linux Firewall Iptables Interview Questions](http://www.tecmint.com/wp-content/uploads/2015/05/Linux-iptables-Interview-Questions.jpg)

All the questions and their Answer are rewritten based upon the memory of Nishita Agarwal.

> “Hello Friends! My name is **Nishita Agarwal**. I have Pursued Bachelor Degree in Technology. My area of Specialization is UNIX and Variants of UNIX (BSD, Linux) fascinates me since the time I heard it. I have 1+ years of experience in storage. I was looking for a job change which ended with a hosting company in Pune, India.”

Here is the collection of what I was asked during the Interview. I’ve documented only those questions and their answer that were related to iptables based upon my memory. Hope this will help you in cracking your Interview.

### 1. Have you heard of iptables and firewall in Linux? Any idea of what they are and for what it is used? ###

> **Answer** : I’ve been using iptables for quite long time and I am aware of both iptables and firewall. Iptables is an application program mostly written in C Programming Language and is released under GNU General Public License. Written for System administration point of view, the latest stable release if iptables 1.4.21.iptables may be considered as firewall for UNIX like operating system which can be called as iptables/netfilter, more accurately. The Administrator interact with iptables via console/GUI front end tools to add and define firewall rules into predefined tables. Netfilter is a module built inside of kernel that do the job of filtering.
> 
> Firewalld is the latest implementation of filtering rules in RHEL/CentOS 7 (may be implemented in other distributions which I may not be aware of). It has replaced iptables interface and connects to netfilter.

### 2. Have you used some kind of GUI based front end tool for iptables or the Linux Command Line? ###

> **Answer** : Though I have used both the GUI based front end tools for iptables like Shorewall in conjugation of [Webmin][1] in GUI and Direct access to iptables via console.And I must admit that direct access to iptables via Linux console gives a user immense power in the form of higher degree of flexibility and better understanding of what is going on in the background, if not anything other. GUI is for novice administrator while console is for experienced.

### 3. What are the basic differences between between iptables and firewalld? ###

> **Answer** : iptables and firewalld serves the same purpose (Packet Filtering) but with different approach. iptables flush the entire rules set each time a change is made unlike firewalld. Typically the location of iptables configuration lies at ‘/etc/sysconfig/iptables‘ whereas firewalld configuration lies at ‘/etc/firewalld/‘, which is a set of XML files.Configuring a XML based firewalld is easier as compared to configuration of iptables, however same task can be achieved using both the packet filtering application ie., iptables and firewalld. Firewalld runs iptables under its hood along with it’s own command line interface and configuration file that is XML based and said above.

### 4. Would you replace iptables with firewalld on all your servers, if given a chance? ###

> **Answer** : I am familiar with iptables and it’s working and if there is nothing that requires dynamic aspect of firewalld, there seems no reason to migrate all my configuration from iptables to firewalld.In most of the cases, so far I have never seen iptables creating an issue. Also the general rule of Information technology says “why fix if it is not broken”. However this is my personal thought and I would never mind implementing firewalld if the Organization is going to replace iptables with firewalld.

### 5. You seems confident with iptables and the plus point is even we are using iptables on our server. ###

What are the tables used in iptables? Give a brief description of the tables used in iptables and the chains they support.

> **Answer** : Thanks for the recognition. Moving to question part, There are four tables used in iptables, namely they are:
> 
>     Nat Table
>     Mangle Table
>     Filter Table
>     Raw Table
> 
> Nat Table : Nat table is primarily used for Network Address Translation. Masqueraded packets get their IP address altered as per the rules in the table. Packets in the stream traverse Nat Table only once. ie., If a packet from a jet of Packets is masqueraded they rest of the packages in the stream will not traverse through this table again. It is recommended not to filter in this table. Chains Supported by NAT Table are PREROUTING Chain, POSTROUTING Chain and OUTPUT Chain.
> 
> Mangle Table : As the name suggests, this table serves for mangling the packets. It is used for Special package alteration. It can be used to alter the content of different packets and their headers. Mangle table can’t be used for Masquerading. Supported chains are PREROUTING Chain, OUTPUT Chain, Forward Chain, INPUT Chain, POSTROUTING Chain.
> 
> Filter Table : Filter Table is the default table used in iptables. It is used for filtering Packets. If no rules are defined, Filter Table is taken as default table and filtering is done on the basis of this table. Supported Chains are INPUT Chain, OUTPUT Chain, FORWARD Chain.
> 
> Raw Table : Raw table comes into action when we want to configure packages that were exempted earlier. It supports PREROUTING Chain and OUTPUT Chain.

### 6. What are the target values (that can be specified in target) in iptables and what they do, be brief! ###

> **Answer** : Following are the target values that we can specify in target in iptables:
> 
>         ACCEPT : Accept Packets
>         QUEUE : Paas Package to user space (place where application and drivers reside)
>         DROP : Drop Packets
>         RETURN : Return Control to calling chain and stop executing next set of rules for the current Packets in the chain.

 
### 7. Lets move to the technical aspects of iptables, by technical I means practical. ###

How will you Check iptables rpm that is required to install iptables in CentOS?.

> **Answer** : iptables rpm are included in standard CentOS installation and we do not need to install it separately. We can check the rpm as:
> 
>     # rpm -qa iptables
> 
> iptables-1.4.21-13.el7.x86_64
> 
> If you need to install it, you may do yum to get it.
> 
>     # yum install iptables-services

### 8. How to Check and ensure if iptables service is running? ###

> **Answer** : To check the status of iptables, you may run the following command on the terminal.
> 
>     # service status iptables			[On CentOS 6/5]
>     # systemctl status iptables			[On CentOS 7]
> 
> If it is not running, the below command may be executed.
> 
>     ---------------- On CentOS 6/5 ---------------- 
>     # chkconfig --level 35 iptables on
>     # service iptables start
> 
>     ---------------- On CentOS 7 ---------------- 
>     # systemctl enable iptables 
>     # systemctl start iptables 
> 
> We may also check if the iptables module is loaded or not, as:
> 
>     # lsmod | grep ip_tables

### 9. How will you review the current Rules defined in iptables? ###

> **Answer** : The current rules in iptables can be review as simple as:
> 
>     # iptables -L
> 
> Sample Output
> 
>     Chain INPUT (policy ACCEPT)
>     target     prot opt source               destination         
>     ACCEPT     all  --  anywhere             anywhere             state RELATED,ESTABLISHED
>     ACCEPT     icmp --  anywhere             anywhere            
>     ACCEPT     all  --  anywhere             anywhere            
>     ACCEPT     tcp  --  anywhere             anywhere             state NEW tcp dpt:ssh
>     REJECT     all  --  anywhere             anywhere             reject-with icmp-host-prohibited
>     
>     Chain FORWARD (policy ACCEPT)
>     target     prot opt source               destination         
>     REJECT     all  --  anywhere             anywhere             reject-with icmp-host-prohibited
>     
>     Chain OUTPUT (policy ACCEPT)
>     target     prot opt source               destination

### 10. How will you flush all iptables rules or a particular chain? ###

> **Answer** : To flush a particular iptables chain, you may use following commands.
> 
>  
>     # iptables --flush OUTPUT
> 
> To Flush all the iptables rules.
> 
>     # iptables --flush

### 11. Add a rule in iptables to accept packets from a trusted IP Address (say 192.168.0.7) ###

> **Answer** : The above scenario can be achieved simply by running the below command.
> 
>     # iptables -A INPUT -s 192.168.0.7 -j ACCEPT 
> 
> We may include standard slash or subnet mask in the source as:
> 
>     # iptables -A INPUT -s 192.168.0.7/24 -j ACCEPT 
>     # iptables -A INPUT -s 192.168.0.7/255.255.255.0 -j ACCEPT

### 12. How to add rules to ACCEPT, REJECT, DENY and DROP ssh service in iptables. ###

> **Answer** : Hoping ssh is running on port 22, which is also the default port for ssh, we can add rule to iptables as:To ACCEPT tcp packets for ssh service (port 22).
> 
>     # iptables -A INPUT -s -p tcp - -dport  -j ACCEPT 
> 
> To REJECT tcp packets for ssh service (port 22).
> 
>     # iptables -A INPUT -s -p tcp - -dport  -j REJECT
> 
> To DENY tcp packets for ssh service (port 22).
> 
>  
>     # iptables -A INPUT -s -p tcp - -dport  -j DENY
> 
> To DROP tcp packets for ssh service (port 22).
> 
>  
>     # iptables -A INPUT -s -p tcp - -dport  -j DROP

### 13. Let me give you a scenario. Say there is a machine the local ip address of which is 192.168.0.6. You need to block connections on port 21, 22, 23, and 80 to your machine. What will you do? ###

> **Answer** : Well all I need to use is the ‘multiport‘ option with iptables followed by port numbers to be blocked and the above scenario can be achieved in a single go as.
> 
>     # iptables -A INPUT -s 192.168.0.6 -p tcp -m multiport --dport 22,23,80,8080 -j DROP
> 
> The written rules can be checked using the below command.
> 
>     # iptables -L
>     
>     Chain INPUT (policy ACCEPT)
>     target     prot opt source               destination         
>     ACCEPT     all  --  anywhere             anywhere             state RELATED,ESTABLISHED
>     ACCEPT     icmp --  anywhere             anywhere            
>     ACCEPT     all  --  anywhere             anywhere            
>     ACCEPT     tcp  --  anywhere             anywhere             state NEW tcp dpt:ssh
>     REJECT     all  --  anywhere             anywhere             reject-with icmp-host-prohibited
>     DROP       tcp  --  192.168.0.6          anywhere             multiport dports ssh,telnet,http,webcache
>     
>     Chain FORWARD (policy ACCEPT)
>     target     prot opt source               destination         
>     REJECT     all  --  anywhere             anywhere             reject-with icmp-host-prohibited
>     
>     Chain OUTPUT (policy ACCEPT)
>     target     prot opt source               destination

**Interviewer** : That’s all I wanted to ask. You are a valuable employee we won’t like to miss. I will recommend your name to the HR. If you have any question you may ask me.

As a candidate I don’t wanted to kill the conversation hence keep asking about the projects I would be handling if selected and what are the other openings in the company. Not to mention HR round was not difficult to crack and I got the opportunity.

Also I would like to thank Avishek and Ravi (whom I am a friend since long) for taking the time to document my interview.

Friends! If you had given any such interview and you would like to share your interview experience to millions of Tecmint readers around the globe? then send your questions and answers to admin@tecmint.com.

Thank you! Keep Connected. Also let me know if I could have answered a question more correctly than what I did.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-firewall-iptables-interview-questions-and-answers/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/install-webmin-web-based-system-administration-tool-for-rhel-centos-fedora/
