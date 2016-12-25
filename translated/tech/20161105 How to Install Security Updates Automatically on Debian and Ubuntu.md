如何在 Debian 和 Ubuntu 系统上自动安装安全更新
============================================================

之前已经说过，一些最优秀的系统管理员看上去（注意这里使用的词是 seem（看上去））总是很“懒”的，这句话我再同意不过了。

虽然这句话听起来有点荒谬，但我敢打赌在大多数情况下它是对的－不是因为他们不去做他们原本应该做的事情，而是因为他们已经让系统自动去完成这样的事情了。

对于 Linux 系统来说，一个最关键的需求是为相应的 Linux 版本保持更新最新的安全补丁。

在这篇文章中，我们将讨论如何在 Debian 和 Ubuntu 系统上进行设置，从而实现自动安装或更新重要的安装包或补丁。

其他的 Linux 版本：[CentOS/RHEL 配置自动安装安全更新][1]

不必多说，为了执行这篇文章中所讲到的任务，你需要有超级用户特权。

### 在 Debian/Ubuntu 上配置自动安全更新

首先，安装下面这些安装包：

```
# aptitude update -y && aptitude install unattended-upgrades apt-listchanges -y
```

`apt-listchanges` 将会通知你在升级过程中发生的改变。

接下来，用你最喜欢的文本编辑器打开 `/etc/apt/apt.conf.d/50unattended-upgrades`，然后在 `Unattended-Upgrade::Origins-Pattern` 块中间加入下面这行内容：

```
Unattended-Upgrade::Mail "root";
```
最后，执行下面的命令来生成所需的配置文件（`/etc/apt/apt.conf.d/20auto-upgrades`），从而激活自动更新：

```
# dpkg-reconfigure -plow unattended-upgrades
```

当提示安装自动升级时，选择 'Yes'：

[
 ![在 Debian 上配置自动安装更新](http://www.tecmint.com/wp-content/uploads/2016/11/Configure-Unattended-Security-Updates-on-Debian.png)
][2]

*在 Debian 上配置自动安装更新*

然后检查下面这两行是否已经加入到文件 `/etc/apt/apt.conf.d/20auto-upgrades` 中了：

```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
```

增加下面这行内容使通知更加详细：

```
APT::Periodic::Verbose "2";
```

最后，检查 `/etc/apt/listchanges.conf` 来确保通知能被发送给 root 用户。

[
 ![Debian 系统上提示安全更新](http://www.tecmint.com/wp-content/uploads/2016/11/Notify-Security-Updates-on-Debian.png)
][3]

*在 Debian 系统上提示安全更新*

在这篇文章中，我们讨论了如何确保你的系统定期更新最新的安全补丁。另外，你也学习了如何设置提示，从而确保应用了新的补丁时你能够被通知到。

你有任何关于这篇文章的问题吗？你可以在下面的评论栏留下你的问题。我们期待收到你的回复。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/auto-install-security-updates-on-debian-and-ubuntu

作者：[Gabriel Cánepa][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:https://linux.cn/article-8015-1.html
[2]:http://www.tecmint.com/wp-content/uploads/2016/11/Configure-Unattended-Security-Updates-on-Debian.png
[3]:http://www.tecmint.com/wp-content/uploads/2016/11/Notify-Security-Updates-on-Debian.png
