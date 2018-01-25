在 CentOS/RHEL 上查找 yum 安裝的软件的位置
======

**我已经在 CentOS/RHEL 上[安装了 htop][1] 。现在想知道软件被安装在哪个位置。有没有简单的方法能找到 yum 软件包安装的目录呢？**

[yum 命令][2] 是可交互的、基于 rpm 的 CentOS/RHEL 的开源软件包管理工具。它会帮助你自动地完成以下操作：

1. 核心系统文件更新
2. 软件包更新
3. 安装新的软件包
4. 删除旧的软件包
5. 查找已安装和可用的软件包

和 `yum` 相似的软件包管理工具有： [apt-get 命令][3] 和 [apt 命令][4]。

### yum 安装软件包的位置

处于演示的目的，我们以下列命令安装 `htop`：

```
# yum install htop
```

要列出名为 htop 的 yum 软件包安装的文件，运行下列 `rpm` 命令： 

```
# rpm -q {packageNameHere}
# rpm -ql htop
```

示例输出：

```
/usr/bin/htop
/usr/share/doc/htop-2.0.2
/usr/share/doc/htop-2.0.2/AUTHORS
/usr/share/doc/htop-2.0.2/COPYING
/usr/share/doc/htop-2.0.2/ChangeLog
/usr/share/doc/htop-2.0.2/README
/usr/share/man/man1/htop.1.gz
/usr/share/pixmaps/htop.png
```

### 如何使用 repoquery 命令查看由 yum 软件包安装的文件位置

首先使用 [yum 命令][2] 安装 yum-utils 软件包：

```
# yum install yum-utils
```

示例输出：

```
Resolving Dependencies
--> Running transaction check
---> Package yum-utils.noarch 0:1.1.31-42.el7 will be installed
--> Processing Dependency: python-kitchen for package: yum-utils-1.1.31-42.el7.noarch
--> Processing Dependency: libxml2-python for package: yum-utils-1.1.31-42.el7.noarch
--> Running transaction check
---> Package libxml2-python.x86_64 0:2.9.1-6.el7_2.3 will be installed
---> Package python-kitchen.noarch 0:1.1.1-5.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

=======================================================================================
 Package           Arch      Version             Repository                       Size
=======================================================================================
Installing:
 yum-utils         noarch    1.1.31-42.el7       rhui-rhel-7-server-rhui-rpms    117 k
Installing for dependencies:
 libxml2-python    x86_64    2.9.1-6.el7_2.3     rhui-rhel-7-server-rhui-rpms    247 k
 python-kitchen    noarch    1.1.1-5.el7         rhui-rhel-7-server-rhui-rpms    266 k

Transaction Summary
=======================================================================================
Install  1 Package (+2 Dependent packages)

Total download size: 630 k
Installed size: 3.1 M
Is this ok [y/d/N]: y
Downloading packages:
(1/3): python-kitchen-1.1.1-5.el7.noarch.rpm                    | 266 kB  00:00:00
(2/3): libxml2-python-2.9.1-6.el7_2.3.x86_64.rpm                | 247 kB  00:00:00
(3/3): yum-utils-1.1.31-42.el7.noarch.rpm                       | 117 kB  00:00:00
---------------------------------------------------------------------------------------
Total                                                     1.0 MB/s | 630 kB  00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : python-kitchen-1.1.1-5.el7.noarch                                   1/3
  Installing : libxml2-python-2.9.1-6.el7_2.3.x86_64                               2/3
  Installing : yum-utils-1.1.31-42.el7.noarch                                      3/3
  Verifying  : libxml2-python-2.9.1-6.el7_2.3.x86_64                               1/3
  Verifying  : yum-utils-1.1.31-42.el7.noarch                                      2/3
  Verifying  : python-kitchen-1.1.1-5.el7.noarch                                   3/3

Installed:
  yum-utils.noarch 0:1.1.31-42.el7

Dependency Installed:
  libxml2-python.x86_64 0:2.9.1-6.el7_2.3      python-kitchen.noarch 0:1.1.1-5.el7

Complete!
```

### 如何列出通过 yum 安装的命令？

现在可以使用 `repoquery` 命令：

```
# repoquery --list htop
```

或者：

```
# repoquery -l htop
```

示例输出：

[![yum where is package installed][5]][5]

*使用 repoquery 命令确定 yum 包安装的路径*

你也可以使用 `type` 命令或者 `command` 命令查找指定二进制文件的位置，例如 `httpd` 或者 `htop` ：

```
$ type -a httpd
$ type -a htop
$ command -V htop
```

### 关于作者

作者是 nixCraft 的创始人，是经验丰富的系统管理员并且是 Linux 命令行脚本编程的教练。他拥有全球多行业合作的经验，客户包括 IT，教育，安防和空间研究。他的联系方式：[Twitter][6]、 [Facebook][7]、 [Google+][8]。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/yum-determining-finding-path-that-yum-package-installed-to/

作者：[cyberciti][a]
译者：[cyleung](https://github.com/cyleung)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux 中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/centos-redhat-linux-install-htop-command-using-yum/
[2]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[3]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[4]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[5]:https://www.cyberciti.biz/media/new/faq/2018/01/yum-where-is-package-installed.jpg
[6]:https://twitter.com/nixcraft
[7]:https://facebook.com/nixcraft
[8]:https://plus.google.com/+CybercitiBiz


