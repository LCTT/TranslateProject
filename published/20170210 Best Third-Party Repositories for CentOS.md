CentOS 上最佳的第三方仓库
============================================================

![CentOS](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/centos.png?itok=YRMQVk7U "CentOS") 

> 从 Software Collections、EPEL 和 Remi 获得可靠的 CentOS 新版软件。

在 Red Hat 企业 Linux（RHEL） 上，提供那些早已老掉牙的软件已经是企业级软件厂商的传统了。这倒不是因为他们懒，而确实是用户需要。很多公司像看待家具一样看待软件：我买一张桌子，能用一辈子，软件不应该也这样吗？

CentOS 作为 RHEL 的复制品有着同样的遭遇。虽然 Red Hat 还在为这些被厂商抛弃的过时软件提供支持、修补安全漏洞等，但如果你的应用依赖新版软件，你就得想办法了。 我在这个问题上不止一次碰壁。 LAMP 组合里任一个组件都需要其它所有组件能与其兼容，这有时就显得很麻烦。 比如说去年我就被 RHEL/CentOS 折腾得够呛。REHL/CentOS 第 6 版最高支持 PHP 5.3 ，第 7 版支持到 PHP 5.4 。而 PHP 5.3 早在 2014 年 8 月就到达 EOL（End Of Life) ，不再被厂商支持了， PHP 5.4 的 EOL 在 2015 年 9 月， 5.5 则是 2016 年 7 月。 有太多古老的软件版本，包括 MySQL、Python 等，它们应该像木乃伊一样被展示在博物馆里，但它们却活在你的系统上。

那么，可怜的管理员们该怎么办呢？如果你跑着 RHEL/CentOS ，那应该先试试 [Software Collections][3]，因为这是 Red Hat 唯一支持的新软件包源。 [Software Collections][3] 为 CentOS 设立了专门的仓库，安装和管理都和其它第三方仓库一样。但如果你用的是 RHEL 的，情况就有点不同了，具体请参考 [RHEL 的解决方法][4]。[Software Collections][3] 同样支持 Fedora 和 Scientific Linux 。

### 安装 Software Collections

在 CentOS 6/7 上安装 Software Collections 的命令如下： 

```
$ sudo yum install centos-release-scl
```

`centos-release-scl-rh` 可能作为依赖包被同时安装。

然后就可以像平常一样搜索、安装软件包了：

```
$ yum search php7
 [...]
 rh-php70.x86_64 : Package that installs PHP 7.0
 [...]
$ sudo yum install rh-php70 
```

最后一件事就是启用你的新软件包：

```
$ scl enable rh-php70 bash
$ php -v
PHP 7.0.10
```

此命令会开启一个新的 bash 并配置好环境变量以便运行新软件包。 如果需要的话，你还得安装对应的扩展包，比如对于  Python 、PHP、MySQL 等软件包，有些配置文件也需要修改以指向新版软件（比如 Apache ）。

这些 SCL 软件包在重启后不会激活。SCL 的设计初衷就是在不影响原有配置的前提下，让新旧软件能一起运行。不过你可以通过 `~/.bashrc` 加载 SCL 提供的 `enable` 脚本来实现自动启用。 SCL 的所有软件包都安装在 `/opt` 下， 以我们的 PHP 7 为例，在 `~/.bashrc` 里加入一行：

```
source /opt/rh/rh-php70/enable
```

以后相应的软件包就能在重启后自动启用了。有新软件保驾护航，你终于可以专注于自己的业务了。

### 列出可用软件包

那么，到底 Software Collections 里都是些什么呢？ centos-release-scl 里有一些由社区维护的额外的软件包。除了在 [CentOS Wiki][5] 查看软件包列表外，你还可以使用 Yum 。我们先来看看安装了哪些仓库：

```
$ yum repolist
[...]
repo id                  repo name
base/7/x86_64            CentOS-7 - Base
centos-sclo-rh/x86_64    CentOS-7 - SCLo rh
centos-sclo-sclo/x86_64  CentOS-7 - SCLo sclo
extras/7/x86_64          CentOS-7 - Extras
updates/7/x86_64         CentOS-7 - Updates
```

Yum 没有专门用来打印某一个仓库中所有软件包的命令，所以你得这样来： （LCTT 译注：实际上有，`yum repo-pkgs REPO list`，需要 root 权限，dnf 同）

```
$ yum --disablerepo "*" --enablerepo centos-sclo-rh \
 list available | less
```

`--disablerepo` 与 `--enablerepo` 选项的用法没有详细的文档，这里简单说下。 实际上在这个命令里你并没有禁用或启用什么东西，而只是将你的搜索范围限制在某一个仓库内。 此命令会打印出一个很长的列表，所以我们用管道传递给 `less` 输出。

### EPEL

强大的 Fedora 社区为 Feora 及所有 RHEL 系的发行版维护着 [EPEL：Extra Packages for Enterprise Linux][6] 。 里面包含一些最新软件包以及一些未被发行版收纳的软件包。安装 EPEL 里的软件就不用麻烦 `enable` 脚本了，直接像平常一样用。你还可以用 `--disablerepo` 和 `--enablerepo` 选项指定从 EPEL 里安装软件包：

```
$ sudo yum --disablerepo "*" --enablerepo epel install [package]
```

### Remi Collet

Remi Collet 在 [Remi 的 RPM 仓库][7] 里维护着大量更新的和额外的软件包。需要先安装 EPEL ，因为 Remi 仓库依赖它。

CentOS wiki 上有较完整的仓库列表：[更多的第三方仓库][8] ，用哪些，不用哪些，里面都有建议。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/2/best-third-party-repositories-centos

作者：[CARLA SCHRODER][a]
译者：[Dotcra](https://github.com/Dotcra)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/creative-commons-attribution
[2]:https://www.linux.com/files/images/centospng
[3]:https://www.softwarecollections.org/en/
[4]:https://access.redhat.com/solutions/472793
[5]:https://wiki.centos.org/SpecialInterestGroup/SCLo/CollectionsList
[6]:https://fedoraproject.org/wiki/EPEL
[7]:http://rpms.remirepo.net/
[8]:https://wiki.centos.org/AdditionalResources/Repositories
