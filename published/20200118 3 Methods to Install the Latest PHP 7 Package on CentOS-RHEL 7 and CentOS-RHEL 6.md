[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12615-1.html)
[#]: subject: (3 Methods to Install the Latest PHP 7 Package on CentOS/RHEL 7 and CentOS/RHEL 6)
[#]: via: (https://www.2daygeek.com/install-php-7-on-centos-6-centos-7-rhel-7-redhat-7/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

在 CentOS/RHEL 7/6 上安装最新 PHP 7 软件包的 3 种方法
======

![](https://img.linux.net.cn/data/attachment/album/202009/14/235431i92iqjj2we0vegyj.jpg)

PHP 是最流行的开源通用脚本语言，被广泛用于 Web 开发。它是 LAMP 栈应用程序套件的一部分，用于创建动态网站。流行的 CMS 应用程序 WordPress，Joomla 和 Drupal 都是用 PHP 语言开发的。这些应用程序的安装和配置都需要 PHP 7。PHP 7 可以更快地加载你的 Web 应用程序，并消耗更少的服务器资源。

在默认情况下，CentOS/RHEL 6 操作系统在其官方存储库中提供 PHP 5.3，而 CentOS/RHEL 7 则提供 PHP 5.4。

在本文中，我们将向你展示如何在 CentOS/RHEL 7 和 CentOS/RHEL 6 系统上安装最新版本的 PHP。

这可以通过在系统中添加必要的 [附加第三方 RPM 存储库][1] 来完成。

### 方法-1：如何使用软件集合存储库（SCL）在 CentOS 6/7 上安装 PHP 7

现在，SCL 存储库由 CentOS SIG 维护，该组织不仅重新构建了 Red Hat Software Collections，还提供了自己的一些其他软件包。

它包含各种程序的较新版本，这些程序可以与现有的旧软件包一起安装，并可以使用 `scl` 命令调用。

要想在 CentOS 上安装软件集合存储库（SCL），请运行以下 [yum 命令][2]：

```
# yum install centos-release-scl
```

运行以下命令可以验证 SCL 存储库中可用的 PHP 7 版本：

```
# yum --disablerepo="*" --enablerepo="centos-sclo-rh" list *php

Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
centos-sclo-rh: centos.mirrors.estointernet.in
Available Packages
php54-php.x86_64                    5.4.40-4.el7                 centos-sclo-rh
php55-php.x86_64                    5.5.21-5.el7                 centos-sclo-rh
rh-php70-php.x86_64                 7.0.27-2.el7                 centos-sclo-rh
rh-php71-php.x86_64                 7.1.30-2.el7                 centos-sclo-rh
rh-php72-php.x86_64                 7.2.24-1.el7                 centos-sclo-rh
```

运行以下命令可以从 SCL 中安装 PHP 7.2 到你的系统中：

```
# yum --disablerepo="*" --enablerepo="centos-sclo-rh" install rh-php72-php
```

如果需要为 PHP 7.2 安装其他模块，则可以通过运行以下命令格式来安装它们。 例如，你可以通过执行以下命令来安装 `gd` 和 `pdo` 软件包：

```
# yum --disablerepo="*" --enablerepo="centos-sclo-rh" install rh-php72-php-gd rh-php72-php-pdo
```

### 方法-1a：如何使用软件集合存储库（SCL）在 RHEL 7 上安装 PHP 7

对于 Red Hat 7，启用以下存储库以安装最新的 PHP 7 软件包：

```
# sudo subscription-manager repos --enable rhel-7-server-extras-rpms
# sudo subscription-manager repos --enable rhel-7-server-optional-rpms
# sudo subscription-manager repos --enable rhel-server-rhscl-7-rpms
```

运行以下命令从 RHSCL 库中搜索可用的 PHP 7 版本：

```
# yum search rh-php*
```

运行以下命令，你可以轻松地从 RHSCL 存储库中把 PHP7.3 安装到你的 RHEL 7 计算机上：

```
# yum install rh-php73
```

### 方法-2：如何使用 Remi 存储库在 CentOS 6/7 上安装 PHP 7

[Remi 存储库][3] 存储和维护着最新版本的 PHP 软件包，其中包含大量的库，扩展和工具。 有一些是从 Fedora 和 EPEL 反向移植的。

这是 CentOS 社区认可的存储库，它不会修改或影响任何基础软件包。

作为前提条件，如果你的系统上尚未安装 [EPEL 存储库][4]，该操作会首先安装它。

你可以轻松地从 Remi 存储库中找到可用的 PHP 7 软件包版本，因为它会为每个版本添加一个单独的存储库。 你可以使用 [ls 命令][5] 查看它们：

```
# ls -lh /etc/yum.repos.d/remi-php*

-rw-r--r--. 1 root root  456 Sep  6 01:31 /etc/yum.repos.d/remi-php54.repo
-rw-r--r--. 1 root root 1.3K Sep  6 01:31 /etc/yum.repos.d/remi-php70.repo
-rw-r--r--. 1 root root 1.3K Sep  6 01:31 /etc/yum.repos.d/remi-php71.repo
-rw-r--r--. 1 root root 1.3K Sep  6 01:31 /etc/yum.repos.d/remi-php72.repo
-rw-r--r--. 1 root root 1.3K Sep  6 01:31 /etc/yum.repos.d/remi-php73.repo
-rw-r--r--. 1 root root 1.3K Sep  6 01:31 /etc/yum.repos.d/remi-php74.repo
```

运行以下命令，你可以轻松地从 Remi 存储库中把 PHP7.4 安装到你的 CentOS 6/7 计算机上：

```
# yum --disablerepo="*" --enablerepo="remi-php74" install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo
```

### 方法-2a：如何使用 Remi 存储库在 RHEL 7 上安装 PHP 7

对于 Red Hat 7，请安装以下存储库以安装最新的 PHP 7 软件包。

在 RHEL 7 上安装 EPEL 存储库：

```
# yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
```

在 RHEL 7 上安装 Remi 存储库：

```
# yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
```

启用可选的 RPMS 存储库：

```
# subscription-manager repos --enable=rhel-7-server-optional-rpms
```

运行以下命令，可以轻松地从 remi 存储库中，把 PHP 7.4 安装在 RHEL 7 系统上：

```
# yum --disablerepo="*" --enablerepo="remi-php74" install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo
```

要验证 PHP 7 的安装版本，请运行以下命令：

```
# php -v

PHP 7.4.1 (cli) (built: Dec 17 2019 16:35:58) ( NTS )
Copyright (c) The PHP Group
Zend Engine v3.4.0, Copyright (c) Zend Technologies
```

### 方法-3：如何使用 IUS 社区存储库在 CentOS 6/7 上安装 PHP 7

IUS 社区存储库是 CentOS 社区批准的第三方 RPM 存储库，其中包含 PHP、Python、MySQL 等软件的最新上游版本，以及用于 Enterprise Linux（RHEL 和 CentOS）5、6 和 7 的软件包。

[IUS 社区存储库][6] 与 EPEL 存储库具有依赖性，因此我们必须在安装 IUS 存储库之前先安装 EPEL 存储库。 请按照以下步骤将 EPEL 和 IUS 社区存储库安装并启用到 RPM 系统，然后再安装软件包。

EPEL软件包包含在 CentOS Extras 存储库中，并默认启用，因此，我们可以通过运行以下命令来安装它：

```
# yum install epel-release
```

下载 IUS 社区存储库的 Shell 脚本如下：

```
# curl 'https://setup.ius.io/' -o setup-ius.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1914  100  1914    0     0   6563      0 --:--:-- --:--:-- --:--:--  133k
```

安装/启用 IUS 社区存储库：

```
# sh setup-ius.sh
```

运行如下命来检查 IUS 存储库中可用的 PHP 7 版本：

```
# yum --disablerepo="*" --enablerepo="ius" list *php7*

Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
Available Packages
mod_php71u.x86_64                                    7.1.33-1.el7.ius                       ius
mod_php72u.x86_64                                    7.2.26-1.el7.ius                       ius
mod_php73.x86_64                                     7.3.13-1.el7.ius                       ius
php71u-bcmath.x86_64                                 7.1.33-1.el7.ius                       ius
php71u-cli.x86_64                                    7.1.33-1.el7.ius                       ius
php71u-common.x86_64                                 7.1.33-1.el7.ius                       ius
php71u-dba.x86_64                                    7.1.33-1.el7.ius                       ius
php71u-dbg.x86_64                                    7.1.33-1.el7.ius                       ius
php71u-devel.x86_64                                  7.1.33-1.el7.ius                       ius
php71u-embedded.x86_64                               7.1.33-1.el7.ius                       ius
```

运行以下命令你可以轻松地从 IUS 存储库中安装 PHP 7.3 到你 CentOS 6/7 系统上：

```
# yum --disablerepo="*" --enablerepo="ius" install php73-common php73-cli php73-gd php73-gd php73-mysqlnd php73-ldap php73-soap php73-mbstring
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/install-php-7-on-centos-6-centos-7-rhel-7-redhat-7/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[gxlct008](https://github.com/gxlct008)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/8-additional-thirdparty-yum-repositories-centos-rhel-fedora-linux/
[2]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[3]: https://www.2daygeek.com/install-enable-remi-repository-on-centos-rhel-fedora-linux/
[4]: https://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-oracle-linux/
[5]: https://www.2daygeek.com/linux-unix-ls-command-display-directory-contents/
[6]: https://www.2daygeek.com/install-enable-ius-community-repository-on-rhel-centos/
