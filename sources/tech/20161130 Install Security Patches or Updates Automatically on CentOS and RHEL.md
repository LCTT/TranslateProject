Install Security Patches or Updates Automatically on CentOS and RHEL
在 CentOS 和 RHEL 上安装或自动更新安全补丁
============================================================

One of the serious needs of a Linux system is to be kept up to date regularly with the latest security patches or updates available for the corresponding distribution.
在 Linux 系统上，其中一个最重要的需求就是保持定期更新最新的安全补丁，或者为相应的 Linux 版本更新可用的安全补丁。
In a previous article, we’ve explained how to [configure automatic security update in Debian/Ubuntu][1], in this article we will explain how to set up your CentOS/RHEL 7/6 distribution to auto update essential security packages when needed.
在之前的文章中，我们分享了[如何在 Debian/Ubuntu 上配置和自动更新安全补丁][1]，在这篇文章中，我们将分享如何在 CentOS/RHEL 7/6 版本中设置自动更新重要的安全补丁，当你需要这样做的时候。
Other Linux distributions in the same families (Fedora or Scientific Linux) can be configured similarly.
在相同家族的其他 Linux 版本（Fedora 或 Scientific Linux）中可以用类似的方法进行配置。
### Configure Automatic Security Updates on CentOS/RHEL Systems
### 在 CentOS/RHEL 系统上配置自动更新安全补丁
On CentOS/RHEL 7/6, you will need to install the following package:
在 CentOS/RHEL 7/6 系统上，你需要安装下面的安装包：
```
# yum update -y && yum install yum-cron -y
```

#### Enable Automatic Security Updates on CentOS/RHEL 7

#### 在 CentOS/RHEL 7　系统上启用自动更新安全补丁
Once the installation is complete, open /etc/yum/yum-cron.conf and locate these lines – you will have to make sure that the values matches those listed here:
安装完成以后，打开 /etc/yum/yum-cron.conf，然后找到下面这些行内容，你必须确保它们的值和下面展示的一样

```
update_cmd = security
update_messages = yes
download_updates = yes
apply_updates = yes
```

The first line indicates that the unattended update command will be:
第一行表明自动更新命令行应该是这样：

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
