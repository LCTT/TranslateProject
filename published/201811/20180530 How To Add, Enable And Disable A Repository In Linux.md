如何在 CentOS 中添加、启用和禁用一个仓库
======

在基于 RPM 的系统上，例如 RHEL、CentOS 等，我们中的许多人使用 yum 包管理器来管理软件的安装、删除、更新、搜索等。

Linux 发行版的大部分软件都来自发行版官方仓库。官方仓库包含大量免费和开源的应用和软件。它很容易安装和使用。

由于一些限制和专有问题，基于 RPM 的发行版在其官方仓库中没有提供某些包。另外，出于稳定性考虑，它不会提供最新版本的核心包。

为了克服这种情况，我们需要安装或启用需要的第三方仓库。对于基于 RPM 的系统，有许多第三方仓库可用，但所建议使用的仓库很少，因为这些不会替换大量的基础包。

建议阅读：

- [在 RHEL/CentOS 系统中使用 YUM 命令管理包][1]
- [在 Fedora 系统中使用 DNF (YUM 的分支) 命令来管理包][2]
- [命令行包管理器和用法列表][3]
- [Linux 包管理器的图形化工具][4]

这可以在基于 RPM 的系统上完成，比如 RHEL, CentOS, OEL, Fedora 等。

 * Fedora 系统使用 `dnf config-manager [options] [section …]`
 * 其它基于 RPM 的系统使用 `yum-config-manager [options] [section …]`

### 如何列出启用的仓库

只需运行以下命令即可检查系统上启用的仓库列表。

对于 CentOS/RHEL/OLE 系统：

```
# yum repolist
Loaded plugins: fastestmirror, security
Loading mirror speeds from cached hostfile
repo id                                                       repo name                                                                 status
base                                                          CentOS-6 - Base                                                           6,706
extras                                                        CentOS-6 - Extras                                                            53
updates                                                       CentOS-6 - Updates                                                        1,255
repolist: 8,014
```

对于 Fedora 系统：

```
# dnf repolist
```

### 如何在系统中添加一个新仓库

每个仓库通常都提供自己的 `.repo` 文件。要将此类仓库添加到系统中，使用 root 用户运行以下命令。在我们的例子中将添加 EPEL 仓库 和 IUS 社区仓库，见下文。

但是没有 `.repo` 文件可用于这些仓库。因此，我们使用以下方法进行安装。

对于 EPEL 仓库，因为它可以从 CentOS 额外仓库获得，所以运行以下命令来安装它。

```
# yum install epel-release -y
```

对于 IUS 社区仓库，运行以下 bash 脚本来安装。

```
# curl 'https://setup.ius.io/' -o setup-ius.sh
# sh setup-ius.sh
```

如果你有 `.repo` 文件，在 RHEL/CentOS/OEL 中，只需运行以下命令来添加一个仓库。

```
# yum-config-manager --add-repo http://www.example.com/example.repo

Loaded plugins: product-id, refresh-packagekit, subscription-manager
adding repo from: http://www.example.com/example.repo
grabbing file http://www.example.com/example.repo to /etc/yum.repos.d/example.repo
example.repo                                             |  413 B     00:00
repo saved to /etc/yum.repos.d/example.repo
```

对于 Fedora 系统，运行以下命令来添加一个仓库：

```
# dnf config-manager --add-repo http://www.example.com/example.repo
adding repo from: http://www.example.com/example.repo
```

如果在添加这些仓库之后运行 `yum repolist` 命令，你就可以看到新添加的仓库了。Yes，我看到了。

注意：每当运行 `yum repolist` 命令时，该命令会自动从相应的仓库获取更新，并将缓存保存在本地系统中。

```
# yum repolist

Loaded plugins: fastestmirror, security
Loading mirror speeds from cached hostfile
epel/metalink                                                                                                          | 6.1 kB     00:00
* epel: epel.mirror.constant.com
* ius: ius.mirror.constant.com
ius                                                                                                                    | 2.3 kB     00:00
repo id                                     repo name                                                                                   status
base                                        CentOS-6 - Base                                                                              6,706
epel                                        Extra Packages for Enterprise Linux 6 - x86_64                                              12,505
extras                                      CentOS-6 - Extras                                                                               53
ius                                         IUS Community Packages for Enterprise Linux 6 - x86_64                                         390
updates                                     CentOS-6 - Updates                                                                           1,255
repolist: 20,909
```

每个仓库都有多个渠道，比如测试（Testing）、开发（Dev）和存档（Archive）等。通过导航到仓库文件位置，你可以更好地理解这一点。

```
# ls -lh /etc/yum.repos.d
total 64K
-rw-r--r-- 1 root root 2.0K Apr 12 02:44 CentOS-Base.repo
-rw-r--r-- 1 root root 647 Apr 12 02:44 CentOS-Debuginfo.repo
-rw-r--r-- 1 root root 289 Apr 12 02:44 CentOS-fasttrack.repo
-rw-r--r-- 1 root root 630 Apr 12 02:44 CentOS-Media.repo
-rw-r--r-- 1 root root 916 May 18 11:07 CentOS-SCLo-scl.repo
-rw-r--r-- 1 root root 892 May 18 10:36 CentOS-SCLo-scl-rh.repo
-rw-r--r-- 1 root root 6.2K Apr 12 02:44 CentOS-Vault.repo
-rw-r--r-- 1 root root 7.9K Apr 12 02:44 CentOS-Vault.repo.rpmnew
-rw-r--r-- 1 root root 957 May 18 10:41 epel.repo
-rw-r--r-- 1 root root 1.1K Nov 4 2012 epel-testing.repo
-rw-r--r-- 1 root root 1.2K Feb 23 2017 ius-archive.repo
-rw-r--r-- 1 root root 1.2K Feb 23 2017 ius-dev.repo
-rw-r--r-- 1 root root 1.1K May 18 10:41 ius.repo
-rw-r--r-- 1 root root 1.2K Feb 23 2017 ius-testing.repo
```

### 如何在系统中启用一个仓库

当你在默认情况下添加一个新仓库时，它将启用它们的稳定仓库，这就是为什么我们在运行 `yum repolist` 命令时获取了仓库信息。在某些情况下，如果你希望启用它们的测试、开发或存档仓库，使用以下命令。另外，我们还可以使用此命令启用任何禁用的仓库。

为了验证这一点，我们将启用 `epel-testing.repo`，运行下面的命令：

```
# yum-config-manager --enable epel-testing

Loaded plugins: fastestmirror
==================================================================================== repo: epel-testing =====================================================================================
[epel-testing]
bandwidth = 0
base_persistdir = /var/lib/yum/repos/x86_64/6
baseurl =
cache = 0
cachedir = /var/cache/yum/x86_64/6/epel-testing
cost = 1000
enabled = 1
enablegroups = True
exclude =
failovermethod = priority
ftp_disable_epsv = False
gpgcadir = /var/lib/yum/repos/x86_64/6/epel-testing/gpgcadir
gpgcakey =
gpgcheck = True
gpgdir = /var/lib/yum/repos/x86_64/6/epel-testing/gpgdir
gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
hdrdir = /var/cache/yum/x86_64/6/epel-testing/headers
http_caching = all
includepkgs =
keepalive = True
mdpolicy = group:primary
mediaid =
metadata_expire = 21600
metalink =
mirrorlist = https://mirrors.fedoraproject.org/metalink?repo=testing-epel6&arch=x86_64
mirrorlist_expire = 86400
name = Extra Packages for Enterprise Linux 6 - Testing - x86_64
old_base_cache_dir =
password =
persistdir = /var/lib/yum/repos/x86_64/6/epel-testing
pkgdir = /var/cache/yum/x86_64/6/epel-testing/packages
proxy = False
proxy_dict =
proxy_password =
proxy_username =
repo_gpgcheck = False
retries = 10
skip_if_unavailable = False
ssl_check_cert_permissions = True
sslcacert =
sslclientcert =
sslclientkey =
sslverify = True
throttle = 0
timeout = 30.0
username =
```

运行 `yum repolist` 命令来检查是否启用了 “epel-testing”。它被启用了，我可以从列表中看到它。

```
# yum repolist
Loaded plugins: fastestmirror, security
Determining fastest mirrors
epel/metalink                                                                                                                                                         |  18 kB     00:00
epel-testing/metalink                                                                                                                                                 |  17 kB     00:00
 * epel: mirror.us.leaseweb.net
 * epel-testing: mirror.us.leaseweb.net
 * ius: mirror.team-cymru.com
base                                                                                                                                                                  | 3.7 kB     00:00
centos-sclo-sclo                                                                                                                                                      | 2.9 kB     00:00
epel                                                                                                                                                                  | 4.7 kB     00:00
epel/primary_db                                                                                                                                                       | 6.0 MB     00:00
epel-testing                                                                                                                                                          | 4.7 kB     00:00
epel-testing/primary_db                                                                                                                                               | 368 kB     00:00
extras                                                                                                                                                                | 3.4 kB     00:00
ius                                                                                                                                                                   | 2.3 kB     00:00
ius/primary_db                                                                                                                                                        | 216 kB     00:00
updates                                                                                                                                                               | 3.4 kB     00:00
updates/primary_db                                                                                                                                                    | 8.1 MB     00:00 ...
repo id                                                                repo name                                                                                                       status
base                                                                   CentOS-6 - Base                                                                                                  6,706
centos-sclo-sclo                                                       CentOS-6 - SCLo sclo                                                                                               495
epel                                                                   Extra Packages for Enterprise Linux 6 - x86_64                                                                  12,509
epel-testing                                                           Extra Packages for Enterprise Linux 6 - Testing - x86_64                                                           809
extras                                                                 CentOS-6 - Extras                                                                                                   53
ius                                                                    IUS Community Packages for Enterprise Linux 6 - x86_64                                                             390
updates                                                                CentOS-6 - Updates                                                                                               1,288
repolist: 22,250
```

如果你想同时启用多个仓库，使用以下格式。这个命令将启用 epel、epel-testing 和 ius 仓库：

```
# yum-config-manager --enable epel epel-testing ius
```

对于 Fedora 系统，运行下面的命令来启用仓库：

```
# dnf config-manager --set-enabled epel-testing
```

### 如何在系统中禁用一个仓库

无论何时你在默认情况下添加一个新的仓库，它都会启用它们的稳定仓库，这就是为什么我们在运行 `yum repolist` 命令时获取了仓库信息。如果你不想使用仓库，那么可以通过下面的命令来禁用它。

为了验证这点，我们将要禁用 `epel-testing.repo` 和 `ius.repo`，运行以下命令：

```
# yum-config-manager --disable epel-testing ius

Loaded plugins: fastestmirror
==================================================================================== repo: epel-testing =====================================================================================
[epel-testing]
bandwidth = 0
base_persistdir = /var/lib/yum/repos/x86_64/6
baseurl =
cache = 0
cachedir = /var/cache/yum/x86_64/6/epel-testing
cost = 1000
enabled = 0
enablegroups = True
exclude =
failovermethod = priority
ftp_disable_epsv = False
gpgcadir = /var/lib/yum/repos/x86_64/6/epel-testing/gpgcadir
gpgcakey =
gpgcheck = True
gpgdir = /var/lib/yum/repos/x86_64/6/epel-testing/gpgdir
gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
hdrdir = /var/cache/yum/x86_64/6/epel-testing/headers
http_caching = all
includepkgs =
keepalive = True
mdpolicy = group:primary
mediaid =
metadata_expire = 21600
metalink =
mirrorlist = https://mirrors.fedoraproject.org/metalink?repo=testing-epel6&arch=x86_64
mirrorlist_expire = 86400
name = Extra Packages for Enterprise Linux 6 - Testing - x86_64
old_base_cache_dir =
password =
persistdir = /var/lib/yum/repos/x86_64/6/epel-testing
pkgdir = /var/cache/yum/x86_64/6/epel-testing/packages
proxy = False
proxy_dict =
proxy_password =
proxy_username =
repo_gpgcheck = False
retries = 10
skip_if_unavailable = False
ssl_check_cert_permissions = True
sslcacert =
sslclientcert =
sslclientkey =
sslverify = True
throttle = 0
timeout = 30.0
username =

========================================================================================= repo: ius =========================================================================================
[ius]
bandwidth = 0
base_persistdir = /var/lib/yum/repos/x86_64/6
baseurl =
cache = 0
cachedir = /var/cache/yum/x86_64/6/ius
cost = 1000
enabled = 0
enablegroups = True
exclude =
failovermethod = priority
ftp_disable_epsv = False
gpgcadir = /var/lib/yum/repos/x86_64/6/ius/gpgcadir
gpgcakey =
gpgcheck = True
gpgdir = /var/lib/yum/repos/x86_64/6/ius/gpgdir
gpgkey = file:///etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY
hdrdir = /var/cache/yum/x86_64/6/ius/headers
http_caching = all
includepkgs =
keepalive = True
mdpolicy = group:primary
mediaid =
metadata_expire = 21600
metalink =
mirrorlist = https://mirrors.iuscommunity.org/mirrorlist?repo=ius-centos6&arch=x86_64&protocol=http
mirrorlist_expire = 86400
name = IUS Community Packages for Enterprise Linux 6 - x86_64
old_base_cache_dir =
password =
persistdir = /var/lib/yum/repos/x86_64/6/ius
pkgdir = /var/cache/yum/x86_64/6/ius/packages
proxy = False
proxy_dict =
proxy_password =
proxy_username =
repo_gpgcheck = False
retries = 10
skip_if_unavailable = False
ssl_check_cert_permissions = True
sslcacert =
sslclientcert =
sslclientkey =
sslverify = True
throttle = 0
timeout = 30.0
username =
```

运行 `yum repolist` 命令检查 “epel-testing” 和 “ius” 仓库是否被禁用。它被禁用了，我不能看到那些仓库，除了 “epel”。

```
# yum repolist
Loaded plugins: fastestmirror, security
Loading mirror speeds from cached hostfile
 * epel: mirror.us.leaseweb.net
repo id                                                                     repo name                                                                                                  status
base                                                                        CentOS-6 - Base                                                                                             6,706
centos-sclo-sclo                                                            CentOS-6 - SCLo sclo                                                                                          495
epel                                        Extra Packages for Enterprise Linux 6 - x86_64                                              12,505
extras                                                                      CentOS-6 - Extras                                                                                              53
updates                                                                     CentOS-6 - Updates                                                                                          1,288
repolist: 21,051
```

或者，我们可以运行以下命令查看详细信息：

```
# yum repolist all | grep "epel*\|ius*"
 * epel: mirror.steadfast.net
epel                       Extra Packages for Enterprise Linux 6 enabled: 12,509
epel-debuginfo             Extra Packages for Enterprise Linux 6 disabled
epel-source                Extra Packages for Enterprise Linux 6 disabled
epel-testing               Extra Packages for Enterprise Linux 6 disabled
epel-testing-debuginfo     Extra Packages for Enterprise Linux 6 disabled
epel-testing-source        Extra Packages for Enterprise Linux 6 disabled
ius                        IUS Community Packages for Enterprise disabled
ius-archive                IUS Community Packages for Enterprise disabled
ius-archive-debuginfo      IUS Community Packages for Enterprise disabled
ius-archive-source         IUS Community Packages for Enterprise disabled
ius-debuginfo              IUS Community Packages for Enterprise disabled
ius-dev                    IUS Community Packages for Enterprise disabled
ius-dev-debuginfo          IUS Community Packages for Enterprise disabled
ius-dev-source             IUS Community Packages for Enterprise disabled
ius-source                 IUS Community Packages for Enterprise disabled
ius-testing                IUS Community Packages for Enterprise disabled
ius-testing-debuginfo      IUS Community Packages for Enterprise disabled
ius-testing-source         IUS Community Packages for Enterprise disabled
```

对于 Fedora 系统，运行以下命令来启用一个仓库：

```
# dnf config-manager --set-disabled epel-testing
```

或者，可以通过手动编辑适当的 repo 文件来完成。为此，打开相应的 repo 文件并将值从 `enabled=0` 改为 `enabled=1`（启用仓库）或从 `enabled=1` 变为 `enabled=0`（禁用仓库）。

即从：

```
[epel]
name=Extra Packages for Enterprise Linux 6 - $basearch
#baseurl=http://download.fedoraproject.org/pub/epel/6/$basearch
mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch
failovermethod=priority
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
```
改为：

```
[epel]
name=Extra Packages for Enterprise Linux 6 - $basearch
#baseurl=http://download.fedoraproject.org/pub/epel/6/$basearch
mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch
failovermethod=priority
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-add-enable-disable-a-repository-dnf-yum-config-manager-on-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[2]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[3]:https://www.2daygeek.com/list-of-command-line-package-manager-for-linux/
[4]:https://www.2daygeek.com/list-of-graphical-frontend-tool-for-linux-package-manager/
