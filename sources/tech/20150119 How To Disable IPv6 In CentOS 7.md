Translating----geekpi

How To Disable IPv6 In CentOS 7
================================================================================
Recently, one of my friend asked me how to disable IPv6. After searching a bit, I found the following solution. Here is the steps that I followed to disable IPv6 in my CentOS 7 minimal server.

You can do it in two methods.

### Method 1 ###

Edit file **/etc/sysctl.conf**,

    vi /etc/sysctl.conf

Add the following lines:

    net.ipv6.conf.all.disable_ipv6 = 1
    net.ipv6.conf.default.disable_ipv6 = 1

If you want to disable IPV6 for particular network card, for example enp0s3, add the following entry.

    net.ipv6.conf.enp0s3.disable_ipv6 = 1

Save and exit the file.

Execute the following command to reflect the changes.

    sysctl -p

### Method 2: ###

To IPv6 disable in the running system, enter the following commands one by one:

    echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
    echo 1 > /proc/sys/net/ipv6/conf/default/disable_ipv6

or,

    sysctl -w net.ipv6.conf.all.disable_ipv6=1
    sysctl -w net.ipv6.conf.default.disable_ipv6=1

That’s it. Now IPv6 has been disabled.

### What If I get issues after disabling IPv6? ###

You may get problems after disabling IPv6.

#### Issue 1: ####

if you get issues with SSH after disabling IPv6, do the following.

Edit **/etc/ssh/sshd_config** file,

vi /etc/ssh/sshd_config

Find the line;

    #AddressFamily any

And. change it to:

    AddressFamily inet

or,

Remove the hash mark **(#)** in front of the line:

    #ListenAddress 0.0.0.0

Then, restart ssh to reflect the changes.

    systemctl restart sshd

#### Issue 2: ####

If you get problems with starting postfix after disabling IPv6, edit **/etc/postfix/main.cf** file;

    vi /etc/postfix/main.cf

and comment out the localhost part of the config and use ipv4 loopback.

    #inet_interfaces = localhost
    inet_interfaces = 127.0.0.1

That’s it. Cheers!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/disable-ipv6-centos-7/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/