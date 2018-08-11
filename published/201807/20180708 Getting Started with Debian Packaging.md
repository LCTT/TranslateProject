Debian 打包入门
======

> 创建 CardBook 软件包、本地 Debian 仓库，并修复错误。

![](http://minkush.me/img/posts/12.jpg)

我在 GSoC（LCTT 译注：Google Summer Of Code，一项针对学生进行的开源项目训练营，一般在夏季进行。)的任务中有一项是为用户构建 Thunderbird <ruby>扩展<rt>add-ons</rt></ruby>。一些非常流行的扩展，比如 [Lightning][1] （日历行事历）已经拥有了 deb 包。

另外一个重要的用于管理基于 CardDav 和 vCard 标准的联系人的扩展 [Cardbook][2] ，还没有一个 deb 包。

我的导师， [Daniel][3] 鼓励我去为它制作一个包，并上传到 [mentors.debian.net][4]。因为这样就可以使用 `apt-get` 来安装，简化了安装流程。这篇博客描述了我是如何从头开始学习为 CardBook 创建一个 Debian 包的。

首先，我是第一次接触打包，我在从源码构建包的基础上进行了大量研究，并检查它的协议是是否与 [DFSG][5] 兼容。

我从多个 Debian Wiki 中的指南中进行学习，比如 [打包介绍][6]、 [构建一个包][7]，以及一些博客。

我还研究了包含在 [Lightning 扩展包][8]的 amd64 文件。

我创建的包可以在[这里][9]找到。

![Debian Package!][10]

*Debian 包*

### 创建一个空的包

我从使用 `dh_make`  来创建一个 `debian` 目录开始。

```
# Empty project folder
$ mkdir -p Debian/cardbook
```

```
# create files
$ dh_make\
> --native \
> --single \
> --packagename cardbook_1.0.0 \
> --email minkush@example.com
```

一些重要的文件，比如 `control`、`rules`、`changelog`、`copyright` 等文件被初始化其中。

所创建的文件的完整列表如下：

```
$ find /debian
debian/
debian/rules
debian/preinst.ex
debian/cardbook-docs.docs
debian/manpage.1.ex
debian/install
debian/source
debian/source/format
debian/cardbook.debhelper.lo
debian/manpage.xml.ex
debian/README.Debian
debian/postrm.ex
debian/prerm.ex
debian/copyright
debian/changelog
debian/manpage.sgml.ex
debian/cardbook.default.ex
debian/README
debian/cardbook.doc-base.EX
debian/README.source
debian/compat
debian/control
debian/debhelper-build-stamp
debian/menu.ex
debian/postinst.ex
debian/cardbook.substvars
debian/files
```

我了解了 Debian 系统中 [Dpkg][11] 包管理器及如何用它安装、删除和管理包。

我使用 `dpkg` 命令创建了一个空的包。这个命令创建一个空的包文件以及四个名为 `.changes`、`.deb`、 `.dsc`、 `.tar.gz` 的文件。

- `.dsc` 文件包含了所发生的修改和签名
- `.deb` 文件是用于安装的主要包文件。
- `.tar.gz` （tarball）包含了源代码

这个过程也在 `/usr/share` 目录下创建了 `README` 和 `changelog` 文件。它们包含了关于这个包的基本信息比如描述、作者、版本。

我安装这个包，并检查这个包安装的内容。我的新包中包含了版本、架构和描述。

```
$ dpkg -L cardbook
/usr
/usr/share
/usr/share/doc
/usr/share/doc/cardbook
/usr/share/doc/cardbook/README.Debian
/usr/share/doc/cardbook/changelog.gz
/usr/share/doc/cardbook/copyright
```

### 包含 CardBook 源代码

在成功的创建了一个空包以后，我在包中添加了实际的 CardBook 扩展文件。 CardBook 的源代码托管在 [Gitlab][12] 上。我将所有的源码文件包含在另外一个目录，并告诉打包命令哪些文件需要包含在这个包中。

我使用 `vi` 编辑器创建一个 `debian/install` 文件并列举了需要被安装的文件。在这个过程中，我花费了一些时间去学习基于 Linux 终端的文本编辑器，比如 `vi` 。这让我熟悉如何在 `vi` 中编辑、创建文件和快捷方式。

当这些完成后，我在变更日志中更新了包的版本并记录了我所做的改变。

```
$ dpkg -l | grep cardbook
ii cardbook 1.1.0 amd64 Thunderbird add-on for address book
```

![Changelog][13]

*更新完包的变更日志*

在重新构建完成后，重要的依赖和描述信息可以被加入到包中。 Debian 的 `control` 文件可以用来添加额外的必须项目和依赖。

### 本地 Debian 仓库

在不创建本地存储库的情况下，CardBook 可以使用如下的命令来安装：

```
$ sudo dpkg -i cardbook_1.1.0.deb
```

为了实际测试包的安装，我决定构建一个本地 Debian 存储库。没有它，`apt-get` 命令将无法定位包，因为它没有在 Debian 的包软件列表中。

为了配置本地 Debian 存储库，我复制我的包 （.deb）为放在 `/tmp` 目录中的  `Packages.gz` 文件。

![Packages-gz][14]

*本地 Debian 仓库*

为了使它工作，我了解了 `apt` 的配置和它查找文件的路径。

我研究了一种在 `apt-config` 中添加文件位置的方法。最后，我通过在 APT 中添加 `*.list` 文件来添加包的路径，并使用 `apt-cache` 更新APT缓存来完成我的任务。

因此，最新的 CardBook 版本可以成功的通过 `apt-get install cardbook` 来安装了。

![Package installation!][15]

*使用 apt-get 安装 CardBook*

### 修复打包错误和 Bugs

我的导师 Daniel 在这个过程中帮了我很多忙，并指导我如何进一步进行打包。他告诉我使用  [Lintian][16] 来修复打包过程中出现的常见错误和最终使用 [dput][17] 来上传 CardBook 包。

> Lintian 是一个用于发现策略问题和 Bug 的包检查器。它是 Debian 维护者们在上传包之前广泛使用的自动化检查 Debian 策略的工具。

我上传了该软件包的第二个更新版本到 Debian 目录中的 [Salsa 仓库][18] 的一个独立分支中。

我从 Debian backports 上安装 Lintian 并学习在一个包上用它来修复错误。我研究了它用在其错误信息中的缩写，和如何查看 Lintian 命令返回的详细内容。

```
$ lintian -i -I --show-overrides cardbook_1.2.0.changes
```

最初，在 `.changes` 文件上运行命令时，我惊讶地看到显示出来了大量错误、警告和注释！

![Package Error Brief!][19]

*在包上运行 Lintian 时看到的大量报错*

![Lintian error1!][20]

*详细的 Lintian 报错*

![Lintian error2!][23]

*详细的 Lintian 报错 (2) 以及更多*

我花了几天时间修复与 Debian 包策略违例相关的一些错误。为了消除一个简单的错误，我必须仔细研究每一项策略和 Debian 的规则。为此，我参考了 [Debian 策略手册][21] 以及 [Debian 开发者参考][22]。

我仍然在努力使它变得完美无暇，并希望很快可以将它上传到 mentors.debian.net！

如果 Debian 社区中使用 Thunderbird 的人可以帮助修复这些报错就太感谢了。

--------------------------------------------------------------------------------

via: http://minkush.me/cardbook-debian-package/

作者：[Minkush Jain][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[Bestony](https://github.com/bestony)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://minkush.me/cardbook-debian-package/#
[1]:https://addons.mozilla.org/en-US/thunderbird/addon/lightning/
[2]:https://addons.mozilla.org/nn-NO/thunderbird/addon/cardbook/?src=hp-dl-featured
[3]:https://danielpocock.com/
[4]:https://mentors.debian.net/
[5]:https://wiki.debian.org/DFSGLicenses
[6]:https://wiki.debian.org/Packaging/Intro
[7]:https://wiki.debian.org/BuildingAPackage
[8]:https://packages.debian.org/stretch/amd64/lightning/filelist
[9]:https://salsa.debian.org/minkush-guest/CardBook/tree/debian-package/Debian
[10]:http://minkush.me/img/posts/13.png
[11]:https://packages.debian.org/stretch/dpkg
[12]:https://gitlab.com/CardBook/CardBook
[13]:http://minkush.me/img/posts/15.png
[14]:http://minkush.me/img/posts/14.png
[15]:http://minkush.me/img/posts/11.png
[16]:https://packages.debian.org/stretch/lintian
[17]:https://packages.debian.org/stretch/dput
[18]:https://salsa.debian.org/minkush-guest/CardBook/tree/debian-package
[19]:http://minkush.me/img/posts/16.png (Running Lintian on package)
[20]:http://minkush.me/img/posts/10.png
[21]:https://www.debian.org/doc/debian-policy/
[22]:https://www.debian.org/doc/manuals/developers-reference/
[23]:http://minkush.me/img/posts/17.png