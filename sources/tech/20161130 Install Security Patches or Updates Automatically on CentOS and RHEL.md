ucasFL translating
Install Security Patches or Updates Automatically on CentOS and RHEL
============================================================

One of the serious needs of a Linux system is to be kept up to date regularly with the latest security patches or updates available for the corresponding distribution.

In a previous article, we’ve explained how to [configure automatic security update in Debian/Ubuntu][1], in this article we will explain how to set up your CentOS/RHEL 7/6 distribution to auto update essential security packages when needed.

Other Linux distributions in the same families (Fedora or Scientific Linux) can be configured similarly.

### Configure Automatic Security Updates on CentOS/RHEL Systems

On CentOS/RHEL 7/6, you will need to install the following package:

```
# yum update -y && yum install yum-cron -y
```

#### Enable Automatic Security Updates on CentOS/RHEL 7

Once the installation is complete, open /etc/yum/yum-cron.conf and locate these lines – you will have to make sure that the values matches those listed here:

```
update_cmd = security
update_messages = yes
download_updates = yes
apply_updates = yes
```

The first line indicates that the unattended update command will be:

```
# yum --security upgrade
```

whereas the other lines enable notifications and automatic download and installation of security upgrades.

The following lines are also required to indicate that notifications will be sent via email from root@localhost to the same account (again, you may choose another one if you want).

```
emit_via = email
email_from = root@localhost
email_to = root
```

#### Enable Automatic Security Updates on CentOS/RHEL 6

By default, the cron is configured to download and install all updates immediately, but we can change this behavior in /etc/sysconfig/yum-cron configuration file by modifying these two parameters to `yes`.

```
# Don't install, just check (valid: yes|no)
CHECK_ONLY=yes
# Don't install, just check and download (valid: yes|no)
# Implies CHECK_ONLY=yes (gotta check first to see what to download)
DOWNLOAD_ONLY=yes
```

To enable email notification that about the security package updates, set the MAILTO parameter to a valid mail address.

```
# by default MAILTO is unset, so crond mails the output by itself
# example:  MAILTO=root
MAILTO=admin@tecmint.com
```

Finally, start and enable the yum-cron service:

```
------------- On CentOS/RHEL 7 ------------- 
systemctl start yum-cron
systemctl enable yum-cron
------------- On CentOS/RHEL 6 -------------  
# service yum-cron start
# chkconfig --level 35 yum-cron on
```

Congrats! You have successfully set up unattended upgrades on CentOS/RHEL 7/6.

##### Summary

In this article we have discussed how to keep your server updated regularly with the latest security patches or updates. Additionally, you learned how to configure email notifications in order to keep yourself updated when new patches are applied.

If you have any concerns about this article? Feel free to drop us a note using the comment form below. We look forward to hearing from you.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/auto-install-security-patches-updates-on-centos-rhel/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/auto-install-security-updates-on-debian-and-ubuntu/
