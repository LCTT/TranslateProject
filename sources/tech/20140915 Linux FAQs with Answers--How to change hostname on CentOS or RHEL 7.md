Linux FAQs with Answers--How to change hostname on CentOS or RHEL 7
================================================================================
> Question: What is a proper way to change hostname on CentOS / RHEL 7 (permanently or temporarily)? 

In CentOS or RHEL, there are three kinds of hostnames defined: (1) static, (2) transient, and (3) pretty. The "static" hostname is also known as kernel hostname, which is initialized from /etc/hostname automatically at boot time. The "transient" hostname is a temporary hostname assigned at run time, for example, by a DHCP or mDNS server. Both static and transient hostnames follow the same character restriction rules as Internet domain names. On the other hand, the "pretty" hostname is allowed to have a free-form (including special/whitespace characters) hostname, presented to end users (e.g., Dan's Computer).

In CentOS/RHEL 7, there is a command line utility called hostnamectl, which allows you to view or modify hostname related configurations.

To view hostname related settings:

    $ hostnamectl status 

![](https://farm4.staticflickr.com/3844/15113861225_e0e19783a7.jpg)

To view static, transient or pretty hostname only, use "--static", "--transient" or "--pretty" option, respectively.

     $ hostnamectl status [--static|--transient|--pretty] 

To change all three hostnames: static, transient, and pretty, simultaneously:

    $ sudo hostnamectl set-hostname <host-name> 

![](https://farm4.staticflickr.com/3855/15113489172_4e25ac87fa_z.jpg)

As shown above, in case of static/transient hostnames, any special or whitespace character will be removed, and any uppercase letter will automatically be converted to lowercase in the supplied <host-name> argument. Once the static hostname is changed, /etc/hostname will automatically be updated accordingly. However, /etc/hosts will not be updated to reflect the change, so you need to update /etc/hosts manually.

If you want to change a particular hostname only (static, transient or pretty), you can use "--static", "--transient" or "--pretty" option.

For example, to change hostname permanently, you can change the static hostname:

     $ sudo hostnamectl --static set-hostname <host-name> 

Note that you do not have to reboot the machine to activate permanent hostname change. The above command will change kernel hostname immediately. Log out, and log back in to see the new static hostname in the command-line prompt.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/change-hostname-centos-rhel-7.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出