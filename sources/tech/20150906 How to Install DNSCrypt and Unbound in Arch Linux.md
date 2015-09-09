How to Install DNSCrypt and Unbound in Arch Linux
================================================================================
**DNSCrypt** is a protocol that encrypt and authenticate communications between a DNS client and a DNS resolver. Prevent from DNS spoofing or man in the middle-attack. DNSCrypt are available for most operating system, including Linux, Windows, MacOSX android and iOS. And in this tutorial I'm using archlinux with kernel 4.1.

Unbound is a DNS cache server used to resolve any DNS query received. If the user requests a new query, then unbound will store it as a cache, and when the user requests the same query for the second time, then unbound would take from the cache that have been saved. This will be faster than the first request query.

And now I will try to install "DNSCrypt" to secure the dns communication, and make it faster with dns cache "Unbound".

### Step 1 - Install yaourt ###

Yaourt is one of AUR(Arch User Repository) helper that make archlinux users easy to install a program from AUR. Yaourt use same syntax as pacman, so you can install the program with yaourt. and this is easy way to install yaourt :

1. Edit the arch repository configuration file with nano or vi, stored in a file "/etc/pacman.conf".

    $ nano /etc/pacman.conf

2. Add at the bottom line yaourt repository, just paste script below :

    [archlinuxfr]
    SigLevel = Never
    Server = http://repo.archlinux.fr/$arch

3. Save it with press "Ctrl + x" and then "Y".

4. Now update the repository database and install yaourt with pacman command :

    $ sudo pacman -Sy yaourt

### Step 2 - Install DNSCrypt and Unbound ###

DNSCrypt and unbound available on archlinux repository, then you can install it with pacman command :

    $ sudo pacman -S dnscrypt-proxy unbound

wait it and press "Y" for proceed with installation.

### Step 3 - Install dnscrypt-autoinstall ###

Dnscrypt-autoinstall is A script for installing and automatically configuring DNSCrypt on Linux-based systems. Dnscrypt-autoinstall available in AUR(Arch User Repository), and you must use "yaourt" command to install it :

    $ yaourt -S dnscrypt-autoinstall

Note :

-S = it is same as pacman -S to install a software/program.

### Step 4 - Run dnscrypt-autoinstall ###

run the command "dnscrypt-autoinstall" with root privileges to configure DNSCrypt automatically :

    $ sudo dnscrypt-autoinstall

Press "Enter" for the next configuration, and then type "y" and choose the DNS provider you want to use, I'm here use DNSCrypt.eu featured with no logs and DNSSEC.

![DNSCrypt autoinstall](http://blog.linoxide.com/wp-content/uploads/2015/08/DNSCrypt-autoinstall.png)

### Step 5 - Configure DNSCrypt and Unbound ###

1. Open the dnscrypt configuration file "/etc/conf.d/dnscrypt-config" and make sure the configuration of "DNSCRYPT_LOCALIP" point to **localhost IP**, and for port configuration "DNSCRYPT_LOCALPORT" it's up to you, I`m here use port **40**.

    $ nano /etc/conf.d/dnscrypt-config

    DNSCRYPT_LOCALIP=127.0.0.1
    DNSCRYPT_LOCALIP2=127.0.0.2
    DNSCRYPT_LOCALPORT=40

![DNSCrypt Configuration](http://blog.linoxide.com/wp-content/uploads/2015/08/DNSCryptConfiguration.png)

Save and exit.

2. Now you can edit unbound configuration in "/etc/unbound/". edit the file configuration with nano editor :

    $ nano /etc/unbound/unbound.conf

3. Add the following script in the end of line :

    do-not-query-localhost: no
    forward-zone:
    name: "."
    forward-addr: 127.0.0.1@40

Make sure the "**forward-addr**" port is same with "**DNSCRYPT_LOCALPORT**" configuration in DNSCrypt. You can see the I`m use port **40**.

![Unbound Configuration](http://blog.linoxide.com/wp-content/uploads/2015/08/UnboundConfiguration.png)

and then save and exit.

### Step 6 - Run DNSCrypt and Unbound, then Add to startup/Boot ###

Please run DNSCrypt and unbound with root privileges, you can run with systemctl command :

    $ sudo systemctl start dnscrypt-proxy unbound

Add the service at the boot time/startup. You can do it by running "systemctl enable" :

    $ sudo systemctl enable dnscrypt-proxy unbound

the command will create the symlink of the service to "/usr/lib/systemd/system/" directory.

### Step 7 - Configure resolv.conf and restart all services ###

Resolv.conf is a file used by linux to configure Domain Name Server(DNS) resolver. it is just plain-text created by administrator, so you must edit by root privileges and make it immutable/no one can edit it.

Edit it with nano editor :

    $ nano /etc/resolv.conf

and add the localhost IP "**127.0.0.1**". and now make it immutable with "chattr" command :

    $ chattr +i /etc/resolv.conf

Note :

If you want to edit it again, make it writable with command "chattr -i /etc/resolv.conf".

Now yo need to restart the DNSCrypt, unbound and the network :

    $ sudo systemctl restart dnscrypt-proxy unbound netctl

If you see the error, check your configuration file.

### Testing ###

1. Test DNSCrypt

You can be sure that DNSCrypt had acted correctly by visiting https://dnsleaktest.com/, then click on "Standard Test" or "Extended Test" and wait the process running.

And now you can see that DNSCrypt is working with DNSCrypt.eu as your DNS provider.

![Testing DNSCrypt](http://blog.linoxide.com/wp-content/uploads/2015/08/TestingDNSCrypt.png)

And now you can see that DNSCrypt is working with DNSCrypt.eu as your DNS provider.

2. Test Unbound

Now you should ensure that the unbound is working correctly with "dig" or "drill" command.

This is the results for dig command :

    $ dig linoxide.com

Now see in the results, the "Query time" is "533 msec" :

    ;; Query time: 533 msec
    ;; SERVER: 127.0.0.1#53(127.0.0.1)
    ;; WHEN: Sun Aug 30 14:48:19 WIB 2015
    ;; MSG SIZE rcvd: 188

and try again with the same command. And you will see the "Query time" is "0 msec".

    ;; Query time: 0 msec
    ;; SERVER: 127.0.0.1#53(127.0.0.1)
    ;; WHEN: Sun Aug 30 14:51:05 WIB 2015
    ;; MSG SIZE rcvd: 188

![Unbound Test](http://blog.linoxide.com/wp-content/uploads/2015/08/UnboundTest.png)

And in the end DNSCrypt secure communications between the DNS clients and DNS resolver is working perfectly, and then Unbound make it faster if there is the same request in another time by taking the cache that have been saved.

### Conclusion ###

DNSCrypt is a protocol that can encrypt data flow between the DNS client and DNS resolver. DNSCrypt can run on various operating systems, either mobile or desktop. Choose DNS provider also includes something important, choose which provide a DNSSEC and no logs. Unbound can be used as a DNS cache, thus speeding up the resolve process resolv, because Unbound will store a request as the cache, then when a client request same query in the next time, then unbound would take from the cache that have been saved. DNSCrypt and Unbound is a powerful combination for the safety and speed.

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-dnscrypt-unbound-archlinux/

作者：[Arul][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arulm/