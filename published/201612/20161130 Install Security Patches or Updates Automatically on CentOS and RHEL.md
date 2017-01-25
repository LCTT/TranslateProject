在 CentOS 和 RHEL 系统上安装安全补丁或自动更新
============================================================

在 Linux 系统上，一个最重要的需求就是为相应的 Linux 版本定期安装最新的安全补丁，或者更新。

在之前的文章中，我们分享了[如何在 Debian/Ubuntu 上配置自动安全更新][1]，在这篇文章中，我们将分享如何在 CentOS/RHEL 7/6 版本中设置在需要时自动更新重要的安全补丁。

和它同一家族的其它 Linux 版本（Fedora 或 Scientific Linux）中可以用类似的方法进行配置。

### 在 CentOS/RHEL 系统上配置自动安全更新

在 CentOS/RHEL 7/6 系统上，你需要安装下面的安装包：

```
# yum update -y && yum install yum-cron -y
```

### 在 CentOS/RHEL 7　系统上启用自动安全更新

安装完成以后，打开 `/etc/yum/yum-cron.conf`，然后找到下面这些行内容，你必须确保它们的值和下面展示的一样
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

而其它的行保证了能够通知并自动下载、安装安全升级。

为了使来自 root@localhost 的通知能够通过邮件发送给同一账户（再次说明，你可以选择其他账户，如果你想这样的话），下面这些行也是必须的。

```
emit_via = email
email_from = root@localhost
email_to = root
```

### 在 CentOS/RHEL 6 上启用自动安全更新

默认情况下， cron 任务被配置成了立即下载并安装所有更新，但是我们可以通过在 `/etc/sysconfig/yum-cron` 配置文件中把下面两个参数改为 `yes`，从而改变这种行为。

```
# 不要安装，只做检查（有效值： yes|no）
CHECK_ONLY=yes
# 不要安装，只做检查和下载（有效值： yes|no）
# 要求 CHECK_ONLY=yes（先要检查后才可以知道要下载什么）
DOWNLOAD_ONLY=yes
```

为了启用关于安装包更新的邮件通知，你需要把 `MAILTO` 参数设置为一个有效的邮件地址。

```
# 默认情况下 MAILTO 是没有设置的，crond 会将输出发送邮件给自己（LCTT 译注：执行 cron 的用户，这里是 root）
# 例子： MAILTO=root
MAILTO=admin@tecmint.com
```

最后，打开并启用 `yum-cron` 服务：

```
------------- On CentOS/RHEL 7 ------------- 
systemctl start yum-cron
systemctl enable yum-cron
------------- On CentOS/RHEL 6 -------------  
# service yum-cron start
# chkconfig --level 35 yum-cron on
```

恭喜你，你已经成功的在 CentOS/RHEL 7/6 系统上设置了自动升级。

### 总结

在这篇文章中，我们讨论了如何保持你的服务器定期更新或升级最新的安全补丁。另外，为了保证当新的补丁被应用时你自己能够知道，你也学习了如何配置邮件通知。

如果你有任何关于这篇文章的疑问，请在下面的评论区留下你的问题。我们期待收到你的回复。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/auto-install-security-patches-updates-on-centos-rhel/

作者：[Gabriel Cánepa][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/auto-install-security-updates-on-debian-and-ubuntu/
