从 ISO 和在线仓库创建一个 Yum 仓库
======

Yum 是 Centos/RHEL/Fedora 中最重要的工具之一。尽管在 Fedora 的最新版本中，它已经被 DNF 所取代，但这并不意味着它自生自灭了。它仍然被广泛用于安装 rpm 包，我们已经在前面的教程（[**在这里阅读**] [1]）中用示例讨论了 Yum。

在本教程中，我们将学习创建一个本地 Yum 仓库，首先使用系统的 ISO 镜像，然后创建一个在线 Yum 仓库的镜像。

###  用 DVD ISO 创建 Yum

我们在本教程中使用 Centos 7 dvd，同样的过程也应该可以用在 RHEL 7 上。

首先在根文件夹中创建一个名为 Yum 的目录

```
$ mkdir /YUM
```

然后挂载 Centos 7 ISO：

```
$ mount -t iso9660 -o loop /home/dan/Centos-7-x86_x64-DVD.iso /mnt/iso/
```

接下来，从挂载的 ISO 中复制软件包到 `/YUM` 中。当所有的软件包都被复制到系统中后，我们将安装创建 Yum 所需的软件包。打开 `/YUM` 并安装以下 RPM 包：

```
$ rpm -ivh deltarpm
$ rpm -ivh python-deltarpm
$ rpm -ivh createrepo
```

安装完成后，我们将在 `/etc/yum.repos.d` 中创建一个名 为 `local.repo` 的文件，其中包含所有的 Yum 信息。

```
$ vi /etc/yum.repos.d/local.repo
```

```
LOCAL REPO]
Name=Local YUM
baseurl=file:///YUM
gpgcheck=0
enabled=1
```

保存并退出文件。接下来，我们将通过运行以下命令来创建仓库数据。

```
$ createrepo -v /YUM
```

创建仓库数据需要一些时间。一切完成后，请运行：

```
$ yum clean all
```

清理缓存，然后运行：

```
$ yum repolist
```

检查所有仓库列表。你应该在列表中看到 `local.repo`。


###  使用在线仓库创建镜像 Yum 仓库

创建在线 Yum 的过程与使用  ISO 镜像创建 Yum 类似，只是我们将从在线仓库而不是 ISO 中获取 rpm 软件包。

首先，我们需要找到一个在线仓库来获取最新的软件包。建议你找一个离你位置最近的在线 Yum 仓库，以优化下载速度。我们将使用下面的镜像，你可以从 [CENTOS 镜像列表][2]中选择一个离你最近的镜像。

选择镜像之后，我们将使用 `rsync` 将该镜像与我们的系统同步，但在此之前，请确保你服务器上有足够的空间。

```
$ rsync -avz rsync://mirror.fibergrid.in/centos/7.2/os/x86_64/Packages/s/ /YUM
```

同步将需要相当长一段时间（也许一个小时），这取决于你互联网的速度。同步完成后，我们将更新我们的仓库数据。

```
$ createrepo - v /YUM
```

我们的 Yum 已经可以使用了。我们可以创建一个 cron 任务来根据你的需求每天或每周定时地自动更新仓库数据。

要创建一个用于同步仓库的 cron 任务，请运行：

```
$ crontab -e
```

并添加以下行

```
30 12 * * * rsync -avz http://mirror.centos.org/centos/7/os/x86_64/Packages/ /YUM
```

这会在每晚 12:30 同步 Yum。还请记住在 `/etc/yum.repos.d` 中创建仓库配置文件，就像我们上面所做的一样。

就是这样，你现在使用你自己的 Yum 仓库了。如果你喜欢它，请分享这篇文章，并在下面的评论栏留下你的意见/疑问。


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/creating-yum-repository-iso-online-repo/

作者：[Shusain][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/using-yum-command-examples/
[2]:http://mirror.centos.org/centos/
