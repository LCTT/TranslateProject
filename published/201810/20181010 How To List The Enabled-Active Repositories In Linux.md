如何列出在 Linux 上已启用/激活的仓库
======

有很多方法可以列出在 Linux 已启用的仓库。我们将在下面展示给你列出已激活仓库的简便方法。这有助于你知晓你的系统上都启用了哪些仓库。一旦你掌握了这些信息，你就可以添加任何之前还没有准备启用的仓库了。

举个例子，如果你想启用 epel 仓库，你需要先检查它是否已经启用了。这篇教程将会帮助你做这件事情。

### 什么是仓库？ 

存储特定程序软件包的中枢位置就是一个软件仓库。

所有的 Linux 发行版都在维护自己的仓库，而且允许用户下载并安装这些软件包到他们的机器上。

每个仓库提供者都提供了一套包管理工具，用以管理他们的仓库，比如搜索、安装、更新、升级、移除等等。

大多数 Linux 发行版都作为免费软件，除了 RHEL 和 SUSE，要访问他们的仓库你需要先购买订阅。

**建议阅读：**

- [在 Linux 上，如何通过 DNF/YUM 设置管理命令添加、启用、关闭一个仓库][1]
- [在 Linux 上如何按大小列出已安装的包][2]
- [在 Linux 上如何列出升级的包][3]
- [在 Linux 上如何查看一个特定包安装/升级/更新/移除/清除的日期][4]
- [在 Linux 上如何查看一个包的详细信息][5]
- [在你的 Linux 发行版上如何查看一个包是否可用][6]
- [在 Linux 如何列出可用的软件包组][7]
- [Newbies corner —— 一个图形化的 Linux 包管理的前端工具][8]
- [Linux 专家须知，命令行包管理 & 使用列表][9]

### 在 RHEL/CentOS 上列出已启用的库

RHEL 和 CentOS 系统使用的是 RPM 包管理，所以我们可以使用 Yum 包管理器查看这些信息。

YUM 意即 “Yellowdog Updater,Modified”，它是一个开源的包管理器的命令行前端，用于基于 RPM 的系统上，例如 RHEL 和 CentOS。

YUM 是获取、安装、删除、查询和管理来自发行版仓库和其他第三方库的 RPM 包的主要工具。

**建议阅读：** [在 RHEL/CentOS 系统上用 YUM 命令管理包][10]

基于 RHEL 的系统主要提供以下三个主要的仓库。这些仓库是默认启用的。

* **base**：它包含了所有的核心包和基础包。
* **extras**：它向 CentOS 提供了不破坏上游兼容性或更新基本组件的额外功能。这是一个上游仓库，还有额外的 CentOS 包。
* **updates**：它提供了 bug 修复包、安全包和增强包。

```
# yum repolist
或者
# yum repolist enabled
```

```
Loaded plugins: fastestmirror
Determining fastest mirrors
 * epel: ewr.edge.kernel.org
repo id                                                                      repo name                                                                                                 status
!base/7/x86_64                                                               CentOS-7 - Base                                                                                            9,911
!epel/x86_64                                                                 Extra Packages for Enterprise Linux 7 - x86_64                                                            12,687
!extras/7/x86_64                                                             CentOS-7 - Extras                                                                                            403
!updates/7/x86_64                                                            CentOS-7 - Updates                                                                                         1,348
repolist: 24,349
```

### 如何列出 Fedora 上已启用的包

DNF 意即 “Dandified yum”。我们可以说 DNF 是下一代的 yum 包管理器，使用了 hawkey/libsolv 作为后端。自从 Fedroa 18 开始，Aleš Kozumplík 就开始开发 DNF，最终在 Fedora 22 上实现/发布。

Fedora 22 及之后的系统上都使用 DNF 安装、升级、搜索和移除包。它可以自动解决依赖问题，并使包的安装过程平顺没有任何麻烦。

因为 Yum 许多长时间未解决的问题，现在 Yum 已经被 DNF 所替代。你问为什么他没有给 Yum 打补丁。Aleš Kozumplík 解释说修补在技术上太困难了，而 YUM 团队无法立即承受这些变更，还有其他的问题，YUM 是 56k 行代码，而 DNF 是 29k 行代码。因此，除了分叉之外，别无选择。

**建议阅读：** [在 Fedora 上使用 DNF 管理软件][11]

Fedora 主要提供下面两个主仓库。这些库将被默认启用。

* **fedora**：它包括所有的核心包和基础包。
* **updates**：它提供了来自稳定发行版的 bug 修复包、安全包和增强包。

```
# dnf repolist
或者
# dnf repolist enabled
```

```
Last metadata expiration check: 0:02:56 ago on Wed 10 Oct 2018 06:12:22 PM IST.
repo id                                         repo name                                                        status
docker-ce-stable                                Docker CE Stable - x86_64                                             6
*fedora                                         Fedora 26 - x86_64                                               53,912
home_mhogomchungu                               mhogomchungu's Home Project (Fedora_25)                              19
home_moritzmolch_gencfsm                        Gnome Encfs Manager (Fedora_25)                                       5
mystro256-gnome-redshift                        Copr repo for gnome-redshift owned by mystro256                       6
nodesource                                      Node.js Packages for Fedora Linux 26 - x86_64                        83
rabiny-albert                                   Copr repo for albert owned by rabiny                                  3
*rpmfusion-free                                 RPM Fusion for Fedora 26 - Free                                     536
*rpmfusion-free-updates                         RPM Fusion for Fedora 26 - Free - Updates                           278
*rpmfusion-nonfree                              RPM Fusion for Fedora 26 - Nonfree                                  202
*rpmfusion-nonfree-updates                      RPM Fusion for Fedora 26 - Nonfree - Updates                         95
*updates                                        Fedora 26 - x86_64 - Updates   
```

### 如何列出 Debian/Ubuntu 上已启用的仓库

基于 Debian 的系统使用的是 APT/APT-GET 包管理，因此我们可以使用 APT/APT-GET 包管理器去获取该信息。

APT 意即 “Advanced Packaging Tool”，它取代了 `apt-get`，就像 DNF 取代 Yum 一样。 它具有丰富的命令行工具，在一个命令（`apt`）中包含了所有功能，如 `apt-cache`、`apt-search`、`dpkg`、`apt-cdrom`、`apt-config`、`apt-key` 等，还有其他几个独特的功能。 例如，我们可以通过 APT 轻松安装 .dpkg 软件包，而我们无法通过 APT-GET 获得和包含在 APT 命令中类似的功能。 由于 APT-GET 中未能解决的问题，APT 取代了 APT-GET。

apt-get 是一个强大的命令行工具，它用以自动下载和安装新的软件包、升级已存在的软件包、更新包索引列表、还有升级整个基于 Debian 的系统。

```
# apt-cache policy
Package files:
 100 /var/lib/dpkg/status
     release a=now
 500 http://ppa.launchpad.net/peek-developers/stable/ubuntu artful/main amd64 Packages
     release v=17.10,o=LP-PPA-peek-developers-stable,a=artful,n=artful,l=Peek stable releases,c=main,b=amd64
     origin ppa.launchpad.net
 500 http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu artful/main amd64 Packages
     release v=17.10,o=LP-PPA-notepadqq-team-notepadqq,a=artful,n=artful,l=Notepadqq,c=main,b=amd64
     origin ppa.launchpad.net
 500 http://dl.google.com/linux/chrome/deb stable/main amd64 Packages
     release v=1.0,o=Google, Inc.,a=stable,n=stable,l=Google,c=main,b=amd64
     origin dl.google.com
 500 https://download.docker.com/linux/ubuntu artful/stable amd64 Packages
     release o=Docker,a=artful,l=Docker CE,c=stable,b=amd64
     origin download.docker.com
 500 http://security.ubuntu.com/ubuntu artful-security/multiverse amd64 Packages
     release v=17.10,o=Ubuntu,a=artful-security,n=artful,l=Ubuntu,c=multiverse,b=amd64
     origin security.ubuntu.com
 500 http://security.ubuntu.com/ubuntu artful-security/universe amd64 Packages
     release v=17.10,o=Ubuntu,a=artful-security,n=artful,l=Ubuntu,c=universe,b=amd64
     origin security.ubuntu.com
 500 http://security.ubuntu.com/ubuntu artful-security/restricted i386 Packages
     release v=17.10,o=Ubuntu,a=artful-security,n=artful,l=Ubuntu,c=restricted,b=i386
     origin security.ubuntu.com
.
.
     origin in.archive.ubuntu.com
 500 http://in.archive.ubuntu.com/ubuntu artful/restricted amd64 Packages
     release v=17.10,o=Ubuntu,a=artful,n=artful,l=Ubuntu,c=restricted,b=amd64
     origin in.archive.ubuntu.com
 500 http://in.archive.ubuntu.com/ubuntu artful/main i386 Packages
     release v=17.10,o=Ubuntu,a=artful,n=artful,l=Ubuntu,c=main,b=i386
     origin in.archive.ubuntu.com
 500 http://in.archive.ubuntu.com/ubuntu artful/main amd64 Packages
     release v=17.10,o=Ubuntu,a=artful,n=artful,l=Ubuntu,c=main,b=amd64
     origin in.archive.ubuntu.com
Pinned packages:

```

### 如何在 openSUSE 上列出已启用的仓库

openSUSE 使用 zypper 包管理，因此我们可以使用 zypper 包管理获得更多信息。

Zypper 是 suse 和 openSUSE 发行版的命令行包管理。它用于安装、更新、搜索、移除包和管理仓库，执行各种查询等。Zypper 以 ZYpp 系统管理库（libzypp）作为后端。

**建议阅读：** [在 openSUSE 和 suse 系统上使用 Zypper 命令管理包][12]

```
# zypper repos

# | Alias                 | Name                                                | Enabled | GPG Check | Refresh
--+-----------------------+-----------------------------------------------------+---------+-----------+--------
1 | packman-repository    | packman-repository                                  | Yes     | (r ) Yes  | Yes    
2 | google-chrome         | google-chrome                                       | Yes     | (r ) Yes  | Yes  
3 | home_lazka0_ql-stable | Stable Quod Libet / Ex Falso Builds (openSUSE_42.1) | Yes     | (r ) Yes  | No      
4 | repo-non-oss          | openSUSE-leap/42.1-Non-Oss                          | Yes     | (r ) Yes  | Yes    
5 | repo-oss              | openSUSE-leap/42.1-Oss                              | Yes     | (r ) Yes  | Yes    
6 | repo-update           | openSUSE-42.1-Update                                | Yes     | (r ) Yes  | Yes    
7 | repo-update-non-oss   | openSUSE-42.1-Update-Non-Oss                        | Yes     | (r ) Yes  | Yes
```

列出仓库及 URI。

```
# zypper lr -u

# | Alias                 | Name                                                | Enabled | GPG Check | Refresh | URI                                                                             
--+-----------------------+-----------------------------------------------------+---------+-----------+---------+---------------------------------------------------------------------------------
1 | packman-repository    | packman-repository                                  | Yes     | (r ) Yes  | Yes     | http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Leap_42.1/                   
2 | google-chrome         | google-chrome                                       | Yes     | (r ) Yes  | Yes     | http://dl.google.com/linux/chrome/rpm/stable/x86_64                             
3 | home_lazka0_ql-stable | Stable Quod Libet / Ex Falso Builds (openSUSE_42.1) | Yes     | (r ) Yes  | No      | http://download.opensuse.org/repositories/home:/lazka0:/ql-stable/openSUSE_42.1/
4 | repo-non-oss          | openSUSE-leap/42.1-Non-Oss                          | Yes     | (r ) Yes  | Yes     | http://download.opensuse.org/distribution/leap/42.1/repo/non-oss/               
5 | repo-oss              | openSUSE-leap/42.1-Oss                              | Yes     | (r ) Yes  | Yes     | http://download.opensuse.org/distribution/leap/42.1/repo/oss/                   
6 | repo-update           | openSUSE-42.1-Update                                | Yes     | (r ) Yes  | Yes     | http://download.opensuse.org/update/leap/42.1/oss/                              
7 | repo-update-non-oss   | openSUSE-42.1-Update-Non-Oss                        | Yes     | (r ) Yes  | Yes     | http://download.opensuse.org/update/leap/42.1/non-oss/
```

通过优先级列出仓库。

```
# zypper lr -p

# | Alias                 | Name                                                | Enabled | GPG Check | Refresh | Priority
--+-----------------------+-----------------------------------------------------+---------+-----------+---------+---------
1 | packman-repository    | packman-repository                                  | Yes     | (r ) Yes  | Yes     |   99    
2 | google-chrome         | google-chrome                                       | Yes     | (r ) Yes  | Yes     |   99    
3 | home_lazka0_ql-stable | Stable Quod Libet / Ex Falso Builds (openSUSE_42.1) | Yes     | (r ) Yes  | No      |   99    
4 | repo-non-oss          | openSUSE-leap/42.1-Non-Oss                          | Yes     | (r ) Yes  | Yes     |   99    
5 | repo-oss              | openSUSE-leap/42.1-Oss                              | Yes     | (r ) Yes  | Yes     |   99    
6 | repo-update           | openSUSE-42.1-Update                                | Yes     | (r ) Yes  | Yes     |   99    
7 | repo-update-non-oss   | openSUSE-42.1-Update-Non-Oss                        | Yes     | (r ) Yes  | Yes     |   99 
```

### 如何列出 Arch Linux 上已启用的仓库

基于 Arch Linux 的系统使用 pacman 包管理，因此我们可以使用 pacman 包管理获取这些信息。

pacman 意即 “package manager utility”。pacman 是一个命令行实用程序，用以安装、构建、移除和管理 Arch Linux 包。pacman 使用 libalpm （Arch Linux 包管理库）作为后端去进行这些操作。

**建议阅读：** [在基于 Arch Linux的系统上使用 Pacman命令管理包][13]

```
# pacman -Syy
:: Synchronizing package databases...
 core                                               132.6 KiB  1524K/s 00:00 [############################################] 100%
 extra                                             1859.0 KiB   750K/s 00:02 [############################################] 100%
 community                                            3.5 MiB   149K/s 00:24 [############################################] 100%
 multilib                                           182.7 KiB  1363K/s 00:00 [############################################] 100%
```

### 如何使用 INXI Utility 列出 Linux 上已启用的仓库 

inix 是 Linux 上检查硬件信息非常有用的工具，还提供很多的选项去获取 Linux 上的所有硬件信息，我从未在 Linux 上发现其他有如此效用的程序。它由 locsmif 分叉自古老而古怪的 infobash。

inix 是一个可以快速显示硬件信息、CPU、硬盘、Xorg、桌面、内核、GCC 版本、进程、内存使用和很多其他有用信息的程序，还使用于论坛技术支持和调试工具上。

这个实用程序将会显示所有发行版仓库的数据信息，例如 RHEL、CentOS、Fedora、Debain、Ubuntu、LinuxMint、ArchLinux、openSUSE、Manjaro等。

**建议阅读：** [inxi – 一个在 Linux 上检查硬件信息的好工具][14]

```
# inxi -r
Repos:     Active apt sources in file: /etc/apt/sources.list
           deb http://in.archive.ubuntu.com/ubuntu/ yakkety main restricted
           deb http://in.archive.ubuntu.com/ubuntu/ yakkety-updates main restricted
           deb http://in.archive.ubuntu.com/ubuntu/ yakkety universe
           deb http://in.archive.ubuntu.com/ubuntu/ yakkety-updates universe
           deb http://in.archive.ubuntu.com/ubuntu/ yakkety multiverse
           deb http://in.archive.ubuntu.com/ubuntu/ yakkety-updates multiverse
           deb http://in.archive.ubuntu.com/ubuntu/ yakkety-backports main restricted universe multiverse
           deb http://security.ubuntu.com/ubuntu yakkety-security main restricted
           deb http://security.ubuntu.com/ubuntu yakkety-security universe
           deb http://security.ubuntu.com/ubuntu yakkety-security multiverse
           Active apt sources in file: /etc/apt/sources.list.d/arc-theme.list
           deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /
           Active apt sources in file: /etc/apt/sources.list.d/snwh-ubuntu-pulp-yakkety.list
           deb http://ppa.launchpad.net/snwh/pulp/ubuntu yakkety main
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-list-the-enabled-active-repositories-in-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-add-enable-disable-a-repository-dnf-yum-config-manager-on-linux/
[2]: https://www.2daygeek.com/how-to-list-installed-packages-by-size-largest-on-linux/
[3]: https://www.2daygeek.com/how-to-view-list-the-available-packages-updates-in-linux/
[4]: https://www.2daygeek.com/how-to-view-a-particular-package-installed-updated-upgraded-removed-erased-date-on-linux/
[5]: https://www.2daygeek.com/how-to-view-detailed-information-about-a-package-in-linux/
[6]: https://www.2daygeek.com/how-to-search-if-a-package-is-available-on-your-linux-distribution-or-not/
[7]: https://www.2daygeek.com/how-to-list-an-available-package-groups-in-linux/
[8]: https://www.2daygeek.com/list-of-graphical-frontend-tool-for-linux-package-manager/
[9]: https://www.2daygeek.com/list-of-command-line-package-manager-for-linux/
[10]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[11]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[12]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[13]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[14]: https://www.2daygeek.com/inxi-system-hardware-information-on-linux/
