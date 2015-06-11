How to secure your Linux server
================================================================================
> A server is made up of so many different components that makes it hard to offer one solution for everyone's needs. This articles tries to cover some useful tips and tricks to help you keep your server and users protected.

No doubt improving server security is one of the most important things system administrators should always look for. This of course has been a topic of many different articles, blogs and forum threads.

A server is made up of so many different components that makes it hard to offer one solution for everyone’s needs. This articles tries to cover some useful tips and tricks to help you keep your server and users protected.

There are a few things that every system administrator should know and there is no way to talk about security without mentioning:

- Keep your system **up to date**
- Change passwords frequently – use numeric, alphabetical and non-alphabetical symbols
- Give users the **minimum** permissions they need to do their job.
- Install only packages that you really need

Here comes the more interesting part:

### Change default SSH port ###

The first thing that I would like to change when setting up a new server is the default SSH port. This simple change can save your server from thousands of brute force attempts.

To change the default SSH port, open your sshd_config:

    sudo vim /etc/ssh/sshd_config

Find the following line:

    #Port 22

The “#” symbol means that this line is a comment. Remove the # symbol then change the port to a number of your choice. The port number should not be larger than 65535.  Make sure not to use any port already used by your system or other services. You can see a list of commonly used ports in [Wikipedia][1]. For the purpose of this article I will use:

    Port 16543

Now save the file and close it for a moment.

Next important step is to:

### Use SSH Keys ###

It is extremely important to use SSH keys when accessing the server over SSH. This adds additional protection and ensure that only people who have the key can access the server.

To generate SSH key on your local computer run:

    ssh-keygen -t rsa

You will receive an output asking you to setup the file name where the key should be written as well as setup a password:

    Generating public/private rsa key pair.
    Enter file in which to save the key (/root/.ssh/id_rsa): my_key
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in my_key.
    Your public key has been saved in my_key.pub.
    The key fingerprint is:
    SHA256:MqD/pzzTRsCjZb6mpfjyrr5v1pJLBcgprR5tjNoI20A

When compete, you will have two files:

my_key

my_key.pub

Now copy the my_key.pub to ~/.ssh/authorized_keys

    cp my_key.pub ~/.ssh/authorized_keys

Now upload your key on the server by using:

    scp -P16543 authorized_keys user@yourserver-ip:/home/user/.ssh/

Now you can access the server from the same local machine without having to enter any password.

### Disable password authentication for SSH ###

Now that we have SSH keys, it is safe to disable the password authentication for SSH. Open again the sshd_config file and set the following changes:

    ChallengeResponseAuthentication no
    PasswordAuthentication no
    UsePAM no

### Disable Root login ###

The next  important step is to disable direct access with root user. Instead you should use sudo or su to perform administrative jobs. To do this you will need to add a new user that has root privileges. To do this you will need to edit the sudoers file located in:

    /etc/sudoers/

You may edit that file with command such as **visudo**. I would recommend you using this command as it will check the file for any syntax errors prior closing the file. This is useful if you have wrongly edited the file.

Now to give root privileges to a user. For the purpose of this tutorial I will use user **sysadmin**. Make sure you are using an existing user on your system when you edit your own file.  Now find the following line:

    root ALL=(ALL) ALL

Copy that line and paste it below. In the new line change “root” with “sysadmin”. You should now have these two lines:

    root ALL=(ALL) ALL
    sysadmin ALL=(ALL) ALL

I would like to explain what each of the options in the above line represents:

    (1) root  (2)ALL=(3)(ALL) (4)ALL

(1) User

(2) Terminal from which user can use sudo

(3) Which users User may act as

(4) Which commands he may use


You can use this settings to give access to users to some of the system tools.

At this point it is safe to save your file.

To disable direct root access over SSH open again the **sshd_config** file and find the following line:

    #PermitRootLogin yes

and change it to:

    PermitRootLogin no

Now save the file and restart the sshd daemon so the changes can take effect. Simply run the following command:

    sudo /etc/init.d/sshd restart

### Setup firewall ###

A firewall can help you block incoming and outgoing ports as well as block brute force login attempts. I like using SCF (Config Server Firewall) as it a powerful solution that uses iptables, it’s easy to manage and has a web interface for people who don’t like typing too many commands.

To install CSF access your server and navigate to:

    cd /usr/local/src/

Then execute the following commands as root:

    wget https://download.configserver.com/csf.tgz
    tar -xzf csf.tgz
    csf
    sh install.sh

You will need to wait for the installer to finish its job. We will edit CSF configuration by editing:

    /etc/csf/csf.conf

By default CSF will be started in testing mode. You will need to set it to product by changing the “TESTING” value to 0

    TESTING = "0"

Next thing you can edit are the allowed ports on your server. For that purpose find the following section of the csf.conf file and modify the ports per your needs:

    # Allow incoming TCP ports
    TCP_IN = "20,21,25,53,80,110,143,443,465,587,993,995,16543"
    # Allow outgoing TCP ports
    TCP_OUT = "20,21,22,25,53,80,110,113,443,587,993,995,16543"
    # Allow incoming UDP ports
    UDP_IN = "20,21,53"
    # Allow outgoing UDP ports
    # To allow outgoing traceroute add 33434:33523 to this list 
    UDP_OUT = "20,21,53,113,123"

Setup these per your requirements. I would recommend you using only the ports you need and avoiding allowing huge ranges of ports. Additionally you can avoid using the unsecured services unsecured ports. For example instead of allowing the default SMTP port 25 you can only allow ports 465 and 587 for outgoing emails.

**IMPORTANT**: Do not forget to allow your customized SSH port.

It is important to allow your IP address so it will never get blocked. Such IP addresses can be defined in:

    /etc/csf/csf.ignore

The blocked IP address will appear in:

    /etc/csf/csf.deny

When you have finished making changes – restart csf with:

    sudo /etc/init.d/csf restart

Just to show you how useful CSF is I will show you part of csf.deny on one of my servers:

    211.216.48.205 # lfd: (sshd) Failed SSH login from 211.216.48.205 (KR/Korea, Republic of/-): 5 in the last 3600 secs - Fri Mar 6 00:30:35 2015
    103.41.124.53 # lfd: (sshd) Failed SSH login from 103.41.124.53 (HK/Hong Kong/-): 5 in the last 3600 secs - Fri Mar 6 01:06:46 2015
    103.41.124.42 # lfd: (sshd) Failed SSH login from 103.41.124.42 (HK/Hong Kong/-): 5 in the last 3600 secs - Fri Mar 6 01:59:04 2015
    103.41.124.26 # lfd: (sshd) Failed SSH login from 103.41.124.26 (HK/Hong Kong/-): 5 in the last 3600 secs - Fri Mar 6 02:48:26 2015
    109.169.74.58 # lfd: (sshd) Failed SSH login from 109.169.74.58 (GB/United Kingdom/mail2.algeos.com): 5 in the last 3600 secs - Fri Mar 6 03:49:03 2015

The IP addresses that performed the brute force login attempt got blocked and they will not bother me again.

#### Lock accounts ####

In case an account is not going to be used for a long period of time you can lock it in order to prevent access to it. You can do this with:

    passwd -l accountName

Account can still be used by the root user.

### Know your services ###

The whole idea of a server is to provide access to different services. Limit those to only the ones you need and disable the unused ones. This will not only free some resources, but will make your server a little bit more secured. For example if you are running a headless server you will definitely not need X display or a desktop environment. If there are no Windows network shares, you can safely disable Samba.

You can use the commands below to see which services are started upon system boot:

    chkconfig --list | grep "3:on"

If your system runs with **systemd**:

    systemctl list-unit-files --type=service | grep enabled

To disable a service you can use commands such as:

    chkconfig service off
    systemctl disable service

In the above example change “service” with the name of the actual service you wish to stop. Here is an example:

    chkconfig httpd off
    systemctl disable httpd

### Conclusion ###

This article was meant to cover some of the general security steps you can take to start securing your server. You can always take additional actions to increase the server protection. Remember that it is your responsibility to keep your server secured and make the wise decision while doing it. Unfortunately there is no easy way to do this and the “perfect” setup requires lots of time and tests until you achieve the desired result.

--------------------------------------------------------------------------------

via: http://www.linuxveda.com/2015/06/03/secure-linux-server/

作者：[Marin Todorow][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxveda.com/author/marin_todorov/
[1]:http://en.wikipedia.org/wiki/Port_%28computer_networking%29#Common_port_numbers