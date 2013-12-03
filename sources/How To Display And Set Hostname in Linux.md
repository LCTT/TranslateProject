How To Display And Set Hostname in Linux
================================================================================
![](http://linoxide.com/wp-content/uploads/2013/11/hostname-command-linux.jpg)

With more and more computer connected to the network, computer need to have an attribute to make it different to each other. Same as human in the real world, computer also hava an attribute which named hostname.

### What is hostname ###

From its manual page, hostname is used to display the system’s DNS name and to display or set its hostname or NIS domain name. So hostname is related to DNS (Domain Name System) or NIS (Network Information System).

### How to display hostname ###

Hostname is a pre-installed command in every Linux distribution. You can display your machine hostname by typing hostname in your console. Here’s a sample command and the output :

    $ hostname
    ubuntu

The above command will tell you that the computer name is **ubuntu**.

### How to set a hostname ###

Hostname is set when you install you Linux at the first time. There is a step in your installation procedure that your Linux will ask you to fill hostname information. However, **you can do it later** if you want.
To set it your hostname, you can use this command :

    # hostname dev-machine
    
    $ hostname
    dev-machine

You **need to be root** user or equal to set / change your hostname machine. The # sign is indicated that you are a root user. The above command is telling your computer to set its hostname into **dev-machine**. If you don’t receive any error message then your hostname is changed. Again, you check it using hostname command to see the result.

Setting hostname using hostname command **is not permanent**. When you reboot your computer, your setting will gone. **To make it permanent**, you must manually edit hostname configuration files.

**On Debian / Ubuntu based Linux**

You will find it in these folders, **/etc/hostname** and **/etc/hosts**.

Here’s the content of each files.

**/etc/hostname**

    # vi /etc/hostname
    dev-machine

**/etc/hosts**

    # vi /etc/hosts
    127.0.0.1 localhost
    127.0.0.1 dev-machine

You will found it **active immediately without restarting** your Linux.

**On RedHat / CentOS based Linux**

You will find it in these folders, **/etc/hosts** and and **/etc/sysconfig/networks**

Here’s the content of each files.

**/etc/hosts**

    127.0.0.1 localhost.localdomain localhost dev-machine
    ::localhost 127.0.0.1

/etc/sysconfig/network

    NETWORKING=yes
    NETWORKING_IPV6=no
    HOSTNAME=dev-machine

### How to display dnsdomainname ###

From hostname definition above, hostname can also display a dnsname for your Linux. If hostname command will display your hostname, then dnsndomainname command will show your domain name. Let’s see the sample.

    $ dnsdomainname
    bris.co.id

On this article, the result of dnsdomainname command is **bris.co.id**.

If you see the result is (**none**), then your machine **is not configured in FQDN** (Fully Qualified Domain Name). Dnsdomainname command will grab information from **/etc/hosts** file. You should configure it in FQDN format. Here’s the sample :

**/etc/hosts**

    127.0.0.1 localhost.localdomain localhost dev-machine
    ::localhost 127.0.0.1
    192.168.0.104 dev-machine.bris.co.id dev-machine

To display it more detail, you can use parameter **-v**

    $ dnsdomainname -v
    gethostname()=’dev-machine.bris.co.id’
    Resolving ‘dev-machine.bris.co.id’ …
    Result: h_name=’dev-machine.bris.co.id’
    Result: h_aliases=’dev-machine’
    Result: h_addr_list=’192.168.0.104’

### How to display hostname with more detail information ###

Hostname command comes with some parameters and some aliases such as dnsdomainname command. Here’s some parameter that may useful on day-to-day operation. The results of the commands below is based on **/etc/hosts** configuration above

**Display the IP Address**

    $ hostname -i
    192.168.0.104

**Display the domain**

    $ hostname -d
    bris.co.id

**Display the the short name**

    $ hostname -s
    dev-machine

*This command will produce the same result with only typing hostname*

**Display with FQDN format**

    $ hostname -f
    dev-machine.bris.co.id

**Display with detail information**

All the parameters mentioned above can be ‘**summarized**’ by the parameter **-v and -d**. Let’s take a look the sample

    $ hostname -v -d
    gethostname()=’dev-machine.bris.co.id’
    Resolving ‘dev-machine.bris.co.id’ …
    Result: h_name=’dev-machine.bris.co.id’
    Result: h_aliases=’dev-machine’
    Result: h_addr_list=’192.168.0.104’
    bris.co.id

Feel familiar? Yes, this result is the same with **dnsdomainname -v** command that also mentioned above.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/display-set-hostname-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出