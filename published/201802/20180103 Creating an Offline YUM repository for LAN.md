创建局域网内的离线 Yum 仓库
======

在早先的教程中，我们讨论了[如何使用 ISO 镜像和在线 Yum 仓库的方式来创建自己的 Yum 仓库 ][1]。创建自己的 Yum 仓库是一个不错的想法，但若网络中只有 2-3 台 Linux 机器那就没啥必要了。不过若你的网络中有大量的 Linux 服务器，而且这些服务器还需要定时进行升级，或者你有大量服务器无法直接访问互联网，那么创建自己的 Yum 仓库就很有必要了。

当我们有大量的 Linux 服务器，而每个服务器都直接从互联网上升级系统时，数据消耗会很可观。为了节省数据量，我们可以创建个离线 Yum 源并将之分享到本地网络中。网络中的其他 Linux 机器就可以直接从本地 Yum 上获取系统更新，从而节省数据量，而且传输速度也会很好。

我们可以使用下面两种方法来分享 Yum 仓库：

*  使用 Web 服务器（Apache）
*  使用 FTP 服务器（VSFTPD）

在开始讲解这两个方法之前，我们需要先根据[之前的教程][1]创建一个 Yum 仓库。

###  使用 Web 服务器

首先在 Yum 服务器上安装 Web 服务器（Apache），我们假设服务器 IP 是 `192.168.1.100`。我们已经在这台系统上配置好了 Yum 仓库，现在我们来使用 `yum` 命令安装 Apache Web 服务器，

```
$ yum install httpd
```

下一步，拷贝所有的 rpm 包到默认的 Apache 根目录下，即 `/var/www/html`，由于我们已经将包都拷贝到了 `/YUM` 下，我们也可以创建一个软连接来从 `/var/www/html` 指向 `/YUM`。

```
$ ln -s /var/www/html/Centos /YUM
```

重启 Web 服务器应用改变：

```
$ systemctl restart httpd
```

#### 配置客户端机器

服务端的配置就完成了，现在需要配置下客户端来从我们创建的离线 Yum 中获取升级包，这里假设客户端 IP 为 `192.168.1.101`。

在 `/etc/yum.repos.d` 目录中创建 `offline-yum.repo` 文件，输入如下信息，

```
$ vi /etc/yum.repos.d/offline-yum.repo
```

```
name=Local YUM
baseurl=http://192.168.1.100/CentOS/7
gpgcheck=0
enabled=1
```

客户端也配置完了。试一下用 `yum` 来安装/升级软件包来确认仓库是正常工作的。

###  使用 FTP 服务器

在 FTP 上分享 Yum，首先需要安装所需要的软件包，即 vsftpd。

```
$ yum install vsftpd
```

vsftp 的默认根目录为 `/var/ftp/pub`，因此你可以拷贝 rpm 包到这个目录，或者为它创建一个软连接：

```
$ ln -s /var/ftp/pub /YUM
```

重启服务应用改变：

```
$ systemctl restart vsftpd
```

#### 配置客户端机器

像上面一样，在 `/etc/yum.repos.d` 中创建 `offline-yum.repo` 文件，并输入下面信息，

```
$ vi /etc/yum.repos.d/offline-yum.repo
```

```
[Offline YUM]
name=Local YUM
baseurl=ftp://192.168.1.100/pub/CentOS/7
gpgcheck=0
enabled=1
```

现在客户机可以通过 ftp 接收升级了。要配置 vsftpd 服务器为其他 Linux 系统分享文件，请[阅读这篇指南][2]。

这两种方法都很不错，你可以任意选择其中一种方法。有任何疑问或这想说的话，欢迎在下面留言框中留言。

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/offline-yum-repository-for-lan/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:https://linux.cn/article-9296-1.html
[2]:http://linuxtechlab.com/ftp-secure-installation-configuration/
