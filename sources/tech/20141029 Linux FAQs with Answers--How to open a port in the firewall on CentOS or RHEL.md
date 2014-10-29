Linux FAQs with Answers--How to open a port in the firewall on CentOS or RHEL
================================================================================
> **Question**: I am running a web/file server on my CentOS box, and to access the server remotely, I need to modify a firewall to allow access to a TCP port on the box. What is a proper way to open a TCP/UDP port in the firewall of CentOS/RHEL? 

Out of the box, enterprise Linux distributions such as CentOS or RHEL come with a powerful firewall built-in, and their default firewall rules are pretty restrictive. Thus if you install any custom services (e.g., web server, NFS, Samba), chances are their traffic will be blocked by the firewall rules. You need to open up necessary ports on the firewall to allow their traffic.

On CentOS/RHEL 6 or earlier, the iptables service allows users to interact with netfilter kernel modules to configure firewall rules in the user space. Starting with CentOS/RHEL 7, however, a new userland interface called firewalld has been introduced to replace iptables service.

To check the current firewall rules, use this command:

    $ sudo iptables -L 

![](https://farm6.staticflickr.com/5601/15604533686_a8c0ae7b89_z.jpg)

Now let's see how we can update the firewall to open a port on CentOS/RHEL.

### Open a Port on CentOS/RHEL 7 ###

Starting with CentOS and RHEL 7, firewall rule settings are managed by firewalld service daemon. A command-line client called firewall-cmd can talk to this deamon to update firewall rules permanently.

To open up a new port (e.g., TCP/80) permanently, use these commands.

    $ sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
    $ sudo firewall-cmd --reload 

Without "--permanent" flag, the firewall rule would not persist across reboots.

### Open a Port on CentOS/RHEL 6 ###

On CentOS/RHEL 6 or earlier, a iptables service is responsible for maintaining firewall rules.

Use iptables command to open up a new TCP/UDP port in the firewall. To save the updated rule permanently, you need the second command.

    $ sudo iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
    $ sudo service iptables save 

Another way to open up a port on CentOS/RHEL 6 is to use a terminal-user interface (TUI) firewall client, named system-config-firewall-tui.

    $ sudo system-config-firewall-tui

Choose "Customize" button in the middle and press ENTER.

![](https://farm6.staticflickr.com/5602/15628237745_4409cff52f_z.jpg)

If you are trying to update the firewall for any well-known service (e.g., web server), you can easily enable the firewall for the service here, and close the tool. If you are trying to open up any arbitrary TCP/UDP port, choose "Forward" button and go to a next window.

![](https://farm4.staticflickr.com/3941/15604533696_12857827ea_z.jpg)

Add a new rule by choosing "Add" button.

![](https://farm4.staticflickr.com/3941/15008065383_4b92cbd843_z.jpg)

Specify a port (e.g., 80) or port range (e.g., 3000-3030), and protocol (e.g., tcp or udp).

![](https://farm4.staticflickr.com/3946/15007474154_bef75d8c72_z.jpg)

Finally, save the updated configuration, and close the tool. At this point, the firewall will be saved permanently.

![](https://farm4.staticflickr.com/3942/15628237765_0299a638ab_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/open-port-firewall-centos-rhel.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出