如何在 Ubuntu 16.04 强制 APT 包管理器使用 IPv4
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/ipv4-720x340.png)

**APT**, 是 **A** dvanced **P** ackage **T** ool 的缩写，是基于 Debian 的系统的默认包管理器。我们可以使用 APT 安装、更新、升级和删除应用程序。最近，我一直遇到一个奇怪的错误。每当我尝试更新我的 Ubuntu 16.04 时，我都会收到此错误 - **“0% [Connecting to in.archive.ubuntu.com (2001:67c:1560:8001::14)]”** ，同时更新流程会卡住很长时间。我的网络连接没问题，我可以 ping 通所有网站，包括 Ubuntu 官方网站。在搜索了一番谷歌后，我意识到 Ubuntu 镜像站点有时无法通过 IPv6 访问。在我强制将 APT 包管理器在更新系统时使用 IPv4 代替 IPv6 访问 Ubuntu 镜像站点后，此问题得以解决。如果你遇到过此错误，可以按照以下说明解决。

### 强制 APT 包管理器在 Ubuntu 16.04 中使用 IPv4

要在更新和升级 Ubuntu 16.04 LTS 系统时强制 APT 使用 IPv4 代替 IPv6，只需使用以下命令：

```
$ sudo apt-get -o Acquire::ForceIPv4=true update
$ sudo apt-get -o Acquire::ForceIPv4=true upgrade
```

瞧！这次更新很快就完成了。

你还可以使用以下命令在 `/etc/apt/apt.conf.d/99force-ipv4` 中添加以下行，以便将来对所有 `apt-get` 事务保持持久性：

```
$ echo 'Acquire::ForceIPv4 "true";' | sudo tee /etc/apt/apt.conf.d/99force-ipv4
```

**免责声明：**

我不知道最近是否有人遇到这个问题，但我今天在我的 Ubuntu 16.04 LTS 虚拟机中遇到了至少四、五次这样的错误，我按照上面的说法解决了这个问题。我不确定这是推荐的解决方案。请浏览 Ubuntu 论坛来确保此方法合法。由于我只是一个 VM，我只将它用于测试和学习目的，我不介意这种方法的真实性。请自行承担使用风险。

希望这有帮助。还有更多的好东西。敬请关注！

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-force-apt-package-manager-to-use-ipv4-in-ubuntu-16-04/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
