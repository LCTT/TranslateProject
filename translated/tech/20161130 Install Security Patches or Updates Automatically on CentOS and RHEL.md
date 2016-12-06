在 CentOS 和 RHEL 系统上安装安全补丁或自动更新
============================================================

在 Linux 系统上，一个最重要的需求就是为相应的 Linux 版本定期安装最新的安全补丁，或者更新。

在之前的文章中，我们分享了[如何在 Debian/Ubuntu 上配置自动安全更新][1]，在这篇文章中，我们将分享当需要时，如何配置 CentOS/RHEL 7/6 版本以实现对必要的安全补丁的自动更新。

相同家族的其他 Linux 版本（Fedora 或 Scientific Linux）中可以用类似的方法进行配置。

### 在 CentOS/RHEL 系统上配置自动安全更新

在 CentOS/RHEL 7/6 系统上，你需要安装下面的安装包：

```
# yum update -y && yum install yum-cron -y
```

#### 在 CentOS/RHEL 7　系统上启用自动安全更新

安装完成以后，打开 /etc/yum/yum-cron.conf，然后找到下面这些行，你必须确保它们的值和下面展示的一样：
```
update_cmd = security
update_messages = yes
download_updates = yes
apply_updates = yes
```

第一行表明自动更新命令行应该像这样：

```
# yum --security upgrade
```

而其他行启用通知和自动下载，并安装安全更新。

如果要从 root@localhost 通过邮件发送通知给其他账户（当然，你可以选择与示例不同的其他账户），需要下面这些行。

```
emit_via = email
email_from = root@localhost
email_to = root
```

#### 在 CentOS/RHEL 6 上启用自动安全更新

默认情况下， cron 被配置成立即下载和安装所有更新，但是我们可以通过在 /etc/sysconfig/yum-cron 配置文件中把下面两个参数改为 ‘yes’，从而改变这种行为。

```
# Don't install, just check (valid: yes|no)
CHECK_ONLY=yes
# Don't install, just check and download (valid: yes|no)
# Implies CHECK_ONLY=yes (gotta check first to see what to download)
DOWNLOAD_ONLY=yes
```

要启用关于安全包更新的邮件通知，将 MAILTO 参数设置为一个有效的邮件地址。

```
# by default MAILTO is unset, so crond mails the output by itself
# example:  MAILTO=root
MAILTO=admin@tecmint.com
```

最后，打开并启用 yum-cron 服务：

```
------------- On CentOS/RHEL 7 ------------- 
systemctl start yum-cron
systemctl enable yum-cron
------------- On CentOS/RHEL 6 -------------  
# service yum-cron start
# chkconfig --level 35 yum-cron on
```

恭喜你，你已经成功的在 CentOS/RHEL 7/6 系统上设置了自动升级。

##### 总结

在这篇文章中，我们讨论了如何使你的服务器定期安装最新的安全补丁和更新。另外，为了保证当新的补丁被应用时你自己能够知道，又介绍了如何配置邮件通知。

如果你对这篇文章有任何疑问，请在下面的评论区留言。我们期待收到你的反馈。





--------------------------------------------------------------------------------

via: http://www.tecmint.com/auto-install-security-patches-updates-on-centos-rhel/

作者：[Gabriel Cánepa][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/auto-install-security-updates-on-debian-and-ubuntu/
