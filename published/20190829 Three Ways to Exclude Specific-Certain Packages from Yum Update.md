[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11315-1.html)
[#]: subject: (Three Ways to Exclude Specific/Certain Packages from Yum Update)
[#]: via: (https://www.2daygeek.com/redhat-centos-yum-update-exclude-specific-packages/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

从 Yum 更新中排除特定/某些包的三种方法
======

![](https://img.linux.net.cn/data/attachment/album/201909/07/145817rj7khqkbqwqx7sb9.jpg)

作为系统更新的一部分，你也许需要在基于 Red Hat 系统中由于应用依赖排除一些软件包。

如果是，如何排除？可以采取多少种方式？有三种方式可以做到，我们会在本篇中教你这三种方法。

包管理器是一组工具，它允许用户在 Linux 系统中轻松管理包。它能让用户在 Linux 系统中安装、更新/升级、删除、查询、重新安装和搜索软件包。

对于基于 Red Hat 的系统，我们使用 [yum 包管理器][1] 和 [rpm 包管理器][2] 进行包管理。

### 什么是 yum？

yum 代表 “Yellowdog Updater, Modified”。Yum 是用于 rpm 系统的自动更新程序和包安装/卸载器。

它在安装包时自动解决依赖关系。

### 什么是 rpm？

rpm 代表 “Red Hat Package Manager”，它是一款用于 Red Hat 系统的功能强大的包管理工具。

RPM 指的是 `.rpm` 文件格式，它包含已编译的软件和必要的库。

你可能有兴趣阅读以下与本主题相关的文章。如果是的话，请进入相应的链接。

  * [如何检查 Red Hat（RHEL）和 CentOS 系统上的可用安全更新][3]
  * [在 Red Hat（RHEL）和 CentOS 系统上安装安全更新的四种方法][4]
  * [在 Redhat（RHEL）和 CentOS 系统上检查或列出已安装的安全更新的两种方法][5]

### 方法 1：手动或临时用 yum 命令排除包

我们可以在 yum 中使用 `--exclude` 或 `-x` 开关来阻止 yum 命令获取特定包的更新。

我可以说，这是一种临时方法或按需方法。如果你只想将特定包排除一次，那么我们可以使用此方法。

以下命令将更新除 kernel 之外的所有软件包。

要排除单个包：

```
# yum update --exclude=kernel
或者
# yum update -x 'kernel'
```

要排除多个包。以下命令将更新除 kernel 和 php 之外的所有软件包。

```
# yum update --exclude=kernel* --exclude=php*
或者
# yum update --exclude httpd,php
```

### 方法 2：在 yum 命令中永久排除软件包

这是永久性方法，如果你经常执行修补程序更新，那么可以使用此方法。

为此，请在 `/etc/yum.conf` 中添加相应的软件包以永久禁用软件包更新。

添加后，每次运行 `yum update` 命令时都不需要指定这些包。此外，这可以防止任何意外更新这些包。

```
# vi /etc/yum.conf

[main]
cachedir=/var/cache/yum/$basearch/$releasever
keepcache=0
debuglevel=2
logfile=/var/log/yum.log
exactarch=1
obsoletes=1
gpgcheck=1
plugins=1
installonly_limit=3
exclude=kernel* php*
```

### 方法 3：使用 Yum versionlock 插件排除包

这也是与上面类似的永久方法。Yum versionlock 插件允许用户通过 `yum` 命令锁定指定包的更新。

为此，请运行以下命令。以下命令将从 `yum update` 中排除 freetype 包。

或者，你可以直接在 `/etc/yum/pluginconf.d/versionlock.list` 中添加条目。

```
# yum versionlock add freetype

Loaded plugins: changelog, package_upload, product-id, search-disabled-repos, subscription-manager, verify, versionlock
Adding versionlock on: 0:freetype-2.8-12.el7
versionlock added: 1
```

运行以下命令来检查被 versionlock 插件锁定的软件包列表。

```
# yum versionlock list

Loaded plugins: changelog, package_upload, product-id, search-disabled-repos, subscription-manager, verify, versionlock
0:freetype-2.8-12.el7.*
versionlock list done
```

运行以下命令清空该列表。

```
# yum versionlock clear
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/redhat-centos-yum-update-exclude-specific-packages/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[2]: https://www.2daygeek.com/rpm-command-examples/
[3]: https://www.2daygeek.com/check-list-view-find-available-security-updates-on-redhat-rhel-centos-system/
[4]: https://www.2daygeek.com/install-security-updates-on-redhat-rhel-centos-system/
[5]: https://www.2daygeek.com/check-installed-security-updates-on-redhat-rhel-and-centos-system/
