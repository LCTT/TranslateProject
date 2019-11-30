[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11535-1.html)
[#]: subject: (How to Enable EPEL Repository on CentOS 8 and RHEL 8 Server)
[#]: via: (https://www.linuxtechi.com/enable-epel-repo-centos8-rhel8-server/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

如何在 CentOS 8 和 RHEL 8 服务器上启用 EPEL 仓库
======

EPEL 代表 “Extra Packages for Enterprise Linux”，它是一个自由开源的附加软件包仓库，可用于 CentOS 和 RHEL 服务器。顾名思义，EPEL 仓库提供了额外的软件包，这些软件在 [CentOS 8][1] 和  [RHEL 8][2] 的默认软件包仓库中不可用。

在本文中，我们将演示如何在 CentOS 8 和 RHEL 8 服务器上启用和使用 EPEL 存储库。

![](https://img.linux.net.cn/data/attachment/album/201911/04/113307wz4y3lnczzlxzn2j.jpg)

### EPEL 仓库的先决条件

  * 最小化安装的 CentOS 8 和 RHEL 8 服务器
  * root 或 sudo 管理员权限
  * 网络连接

### 在 RHEL 8.x 服务器上安装并启用 EPEL 仓库

登录或 SSH 到你的 RHEL 8.x 服务器，并执行以下 `dnf` 命令来安装 EPEL rpm 包，

```
[root@linuxtechi ~]# dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
```

上面命令的输出将如下所示，

![dnf-install-epel-repo-rehl8][5]

EPEL rpm 包成功安装后，它将自动启用并配置其 yum/dnf 仓库。运行以下 `dnf` 或 `yum` 命令，以验证是否启用了 EPEL 仓库，

```
[root@linuxtechi ~]# dnf repolist epel
或者
[root@linuxtechi ~]# dnf repolist epel -v
```

![epel-repolist-rhel8][6]

### 在 CentOS 8.x 服务器上安装并启用 EPEL 仓库

登录或 SSH 到你的 CentOS 8 服务器，并执行以下 `dnf` 或 `yum` 命令来安装 `epel-release` rpm 软件包。在 CentOS 8 服务器中，EPEL rpm 在其默认软件包仓库中。

```
[root@linuxtechi ~]# dnf install epel-release -y
或者
[root@linuxtechi ~]# yum install epel-release -y
```

执行以下命令来验证 CentOS 8 服务器上 EPEL 仓库的状态，

```
[root@linuxtechi ~]# dnf repolist epel
Last metadata expiration check: 0:00:03 ago on Sun 13 Oct 2019 04:18:05 AM BST.
repo id              repo name                                               status
*epel                Extra Packages for Enterprise Linux 8 - x86_64          1,977
[root@linuxtechi ~]#
[root@linuxtechi ~]# dnf repolist epel -v
……………………
Repo-id      : epel
Repo-name    : Extra Packages for Enterprise Linux 8 - x86_64
Repo-status  : enabled
Repo-revision: 1570844166
Repo-updated : Sat 12 Oct 2019 02:36:32 AM BST
Repo-pkgs    : 1,977
Repo-size    : 2.1 G
Repo-metalink: https://mirrors.fedoraproject.org/metalink?repo=epel-8&arch=x86_64&infra=stock&content=centos
  Updated    : Sun 13 Oct 2019 04:28:24 AM BST
Repo-baseurl : rsync://repos.del.extreme-ix.org/epel/8/Everything/x86_64/ (34 more)
Repo-expire  : 172,800 second(s) (last: Sun 13 Oct 2019 04:28:24 AM BST)
Repo-filename: /etc/yum.repos.d/epel.repo
Total packages: 1,977
[root@linuxtechi ~]#
```

以上命令的输出说明我们已经成功启用了 EPEL 仓库。让我们在 EPEL 仓库上执行一些基本操作。

### 列出 EPEL 仓库种所有可用包

如果要列出 EPEL 仓库中的所有的软件包，请运行以下 `dnf` 命令，

```
[root@linuxtechi ~]# dnf repository-packages epel list
……………
Last metadata expiration check: 0:38:18 ago on Sun 13 Oct 2019 04:28:24 AM BST.
Installed Packages
epel-release.noarch                   8-6.el8                @epel
Available Packages
BackupPC.x86_64                       4.3.1-2.el8            epel
BackupPC-XS.x86_64                    0.59-3.el8             epel
CGSI-gSOAP.x86_64                     1.3.11-7.el8           epel
CGSI-gSOAP-devel.x86_64               1.3.11-7.el8           epel
Field3D.x86_64                        1.7.2-16.el8           epel
Field3D-devel.x86_64                  1.7.2-16.el8           epel
GraphicsMagick.x86_64                 1.3.33-1.el8           epel
GraphicsMagick-c++.x86_64             1.3.33-1.el8           epel
…………………………
zabbix40-web-mysql.noarch             4.0.12-1.el8           epel
zabbix40-web-pgsql.noarch             4.0.12-1.el8           epel
zerofree.x86_64                       1.1.1-3.el8            epel
zimg.x86_64                           2.8-4.el8              epel
zimg-devel.x86_64                     2.8-4.el8              epel
zstd.x86_64                           1.4.2-1.el8            epel
zvbi.x86_64                           0.2.35-9.el8           epel
zvbi-devel.x86_64                     0.2.35-9.el8           epel
zvbi-fonts.noarch                     0.2.35-9.el8           epel
[root@linuxtechi ~]#
```

### 从 EPEL 仓库中搜索软件包

假设我们要搜索 EPEL 仓库中的 Zabbix 包，请执行以下 `dnf` 命令，

```
[root@linuxtechi ~]# dnf repository-packages epel list | grep -i zabbix
```

上面命令的输出类似下面这样，

![epel-repo-search-package-centos8][7]

### 从 EPEL 仓库安装软件包

假设我们要从 EPEL 仓库安装 htop 包，运行以下 `dnf` 命令，

语法：

```
# dnf –enablerepo=”epel” install <包名>
```

```
[root@linuxtechi ~]# dnf --enablerepo="epel" install htop -y
```

注意：如果我们在上面的命令中未指定 `–enablerepo=epel`，那么它将在所有可用的软件包仓库中查找 htop 包。

本文就是这些内容了，我希望上面的步骤能帮助你在 CentOS 8 和 RHEL 8 服务器上启用并配置 EPEL 仓库，请在下面的评论栏分享你的评论和反馈。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/enable-epel-repo-centos8-rhel8-server/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/centos-8-installation-guide-screenshots/
[2]: https://www.linuxtechi.com/install-configure-kvm-on-rhel-8/
[3]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/10/EPEL-Repo-CentOS8-RHEL8.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/10/dnf-install-epel-repo-rehl8.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/10/epel-repolist-rhel8.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/10/epel-repo-search-package-centos8.jpg
