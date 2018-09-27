包管理器的进化
======

> 包管理器在 Linux 软件管理中扮演了重要角色。这里对一些主要的包管理器进行了对比。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/suitcase_container_bag.png?itok=q40lKCBY)

今天，每个可计算设备都会使用某种软件来完成预定的任务。在软件开发的上古时期，为了找出软件中的“虫”和其它缺陷，软件会被严格的测试。在近十年间，软件被通过互联网来频繁分发，以试图通过持续不断的安装新版本的软件来解决软件的缺陷问题。在很多情况下，每个独立的应用软件都有其自带的更新器。而其它一些软件则让用户自己去搞明白如何获取和升级软件。

Linux 较早采用了维护一个中心化的软件仓库来发布软件更新这种做法，用户可以在这个软件仓库里查找并安装软件。在这篇文章里， 笔者将回顾在 Linux 上的如何进行软件安装的历史，以及现代操作系统如何保持更新以应对[软件安全漏洞（CVE）][1]不断的曝光。

### 那么在包管理器出现之前在 Linux 上是如何安装软件的呢？

曾几何时，软件都是通过 FTP 或邮件列表（LCTT 译注：即通过邮件列表发布源代码的补丁包）来分发的（最终这些发布方式在互联网的迅猛发展下都演化成为一个个现今常见的软件发布网站）。（一般在一个 tar 文件中）只有一个非常小的文件包含了创建二进制的说明。你需要做的是先解压这个包，然后仔细阅读当中的 `README` 文件， 如果你的系统上恰好有 GCC（LCTT 译注：GNU C Compiler）或者其它厂商的 C 编译器的话，你得首先运行 `./configure` 脚本，并在脚本后添加相应的参数，如库函数的路径、创建可执行文件的路径等等。除此之外，这个配置过程也会检查你操作系统上的软件依赖是否满足安装要求。如果缺失了任何主要的依赖，该配置脚本会退出不再继续安装，直到你满足了该依赖。如果该配置脚本正常执行完毕，将会创建一个 `Makefile` 文件。

当有了一个 `Makefile` 文件时， 你就可以接下去执行 `make` 命令（该命令由你所使用的编译器提供）。`make` 命令也有很多参数，被称为 `make` <ruby>标识<rt>flag</rt></ruby>，这些标识能为你的系统优化最终生成出来的二进制可执行文件。在计算机世界的早期，这些优化是非常重要的，因为彼时的计算机硬件正在为了跟上软件迅速的发展而疲于奔命。今日今时，编译标识变得更加通用而不是为了优化哪些具体的硬件型号，这得益于现代硬件和现代软件相比已经变得成本低廉，唾手可得。

最后，在 `make` 完成之后， 你需要运行 `make install` （或 `sudo make install`）（LCTT 译注：依赖于你的用户权限） 来“真正”将这个软件安装到你的系统上。可以想象，为你系统上的每一个软件都执行上述的流程将是多么无聊费时，更不用说如果更新一个已经安装的软件将会多复杂，多么需要精力投入。（LCTT 译注：上述流程也称 CMMI 安装， 即Configure、Make、Make Install）

### 那么软件包是什么？

<ruby>软件包<rt>package</rt></ruby>（LCTT 译注：下文简称“包”）这个概念是用来解决在软件安装、升级过程中的复杂性的。包将软件安装升级中需要的多个数据文件合并成一个单独的文件，这将便于传输和（通过压缩文件来）减小存储空间（LCTT 译注：减少存储空间这一点在现在已经不再重要），包中的二进制可执行文件已根据开发者所选择的编译标识预编译。包本身包括了所有需要的元数据，如软件的名字、软件的说明、版本号，以及要运行这个软件所需要的依赖包等等。

不同流派的 Linux 发行版都创造了它们自己的包格式，其中最常用的包格式有：

* .deb：这种包格式由 Debian、Ubuntu、Linux Mint 以及其它的变种使用。这是最早被发明的包类型。
* .rpm：这种包格式最初被称作<ruby>红帽包管理器<rt>Red Hat Package Manager</rt></ruby>（LCTT 译注： 取自英文的首字母）。使用这种包的 Linux 发行版有 Red Hat、Fedora、SUSE 以及其它一些较小的发行版。
* .tar.xz：这种包格式只是一个软件压缩包而已，这是 Arch Linux 所使用的格式。（LCTT 译注：这种格式无需特别的包管理器，解压即可）

尽管上述的包格式自身并不能直接管理软件的依赖问题，但是它们的出现将 Linux 软件包管理向前推进了一大步。

### 软件仓库到底是什么？

多年以前（当智能电话还没有像现在这样流行时），非 Linux 世界的用户是很难理解软件仓库的概念的。甚至今时今日，大多数完全工作在 Windows 下的用户还是习惯于打开浏览器，搜索要安装的软件（或升级包），下载然后安装。但是，智能电话传播了软件“商店”（LCTT 译注： 对应 Linux 里的软件仓库）这样一个概念。智能电话用户获取软件的方式和包管理器的工作方式已经非常相近了。些许不同的是，尽管大多数软件商店还在费力美化它的图形界面来吸引用户，大多数 Linux 用户还是愿意使用命令行来安装软件。总而言之，软件仓库是一个中心化的可安装软件列表，上面列举了在当前系统中预先配置好的软件仓库里所有可以安装的软件。下面我们举一些例子来说在各个不同的 Linux 发行版下如何在对应的软件仓库里搜寻某个特定的软件（输出有截断）。

在 Arch Linux 下使用 `aurman`：

```
user@arch ~ $  aurman -Ss kate

extra/kate 18.04.2-2 (kde-applications kdebase)
    Advanced Text Editor
aur/kate-root 18.04.0-1 (11, 1.139399)
    Advanced Text Editor, patched to be able to run as root
aur/kate-git r15288.15d26a7-1 (1, 1e-06)
    An advanced editor component which is used in numerous KDE applications requiring a text editing component
```

在 CentOS 7 下使用 `yum`：

```
[user@centos ~]$ yum search kate

kate-devel.x86_64 : Development files for kate
kate-libs.x86_64 : Runtime files for kate
kate-part.x86_64 : Kate kpart plugin
```


在 Ubuntu 下使用 `apt`：

```
user@ubuntu ~ $ apt search kate
Sorting... Done
Full Text Search... Done

kate/xenial 4:15.12.3-0ubuntu2 amd64
  powerful text editor

kate-data/xenial,xenial 4:4.14.3-0ubuntu4 all
  shared data files for Kate text editor

kate-dbg/xenial 4:15.12.3-0ubuntu2 amd64
  debugging symbols for Kate

kate5-data/xenial,xenial 4:15.12.3-0ubuntu2 all
  shared data files for Kate text editor
```

### 最好用的包管理器有哪些？

如上示例的输出，包管理器用来和相应的软件仓库交互，获取软件的相应信息。下面对它们做一个简短介绍。

#### 基于 PRM 包格式的包管理器

更新基于 RPM 的系统，特别是那些基于 Red Hat 技术的系统，有着非常有趣而又详实的历史。实际上，现在的 [YUM][2] 版本（用于	企业级发行版）和 [DNF][3]（用于社区版）就融合了好几个开源项目来提供它们现在的功能。

Red Hat 最初使用的包管理器，被称为 [RPM][4]（<ruby>红帽包管理器<rt>Red Hat Package Manager</rt></ruby>），时至今日还在使用着。不过，它的主要作用是安装本地的 RPM 包，而不是去在软件仓库搜索软件。后来开发了一个叫 `up2date` 的包管理器，它被用来通知用户包的最新更新，还能让用户在远程仓库里搜索软件并便捷的安装软件的依赖。尽管这个包管理器尽职尽责，但一些社区成员还是感觉 `up2date` 有着明显的不足。

现在的 YUM 来自于好几个不同社区的努力。1999-2001 年一群在 Terra Soft Solution 的伙计们开发了<ruby>黄狗更新器<rt>Yellowdog Updater</rt></ruby>（YUP），将其作为 [Yellow Dog Linux][5] 图形安装器的后端。<ruby>杜克大学<rt>Duke University</rt></ruby>喜欢这个主意就决定去增强它的功能，它们开发了<ruby>[黄狗更新器--修改版][16]<rt>Yellowdog Updater, Modified</rt></ruby>（YUM），这最终被用来帮助管理杜克大学的 Red Hat 系统。Yum 壮大的很快，到 2005 年，它已经被超过一半的 Linux 市场所采用。今日，几乎所有的使用 RPM 的的 Linux 都会使用 YUM 来进行包管理（当然也有一些例外）。

##### 使用 YUM

为了能让 YUM 正常工作，比如从一个软件仓库里下载和安装包，仓库说明文件必须放在 `/etc/yum.repos.d/` 目录下且必须以 `.repo` 作为扩展名。如下是一个示例文件的内容：
 
```
[local_base]
name=Base CentOS  (local)
baseurl=http://7-repo.apps.home.local/yum-repo/7/
enabled=1
gpgcheck=0
```

这是笔者本地仓库之一，这也是为什么 gpgcheck 值为 0 的原因。如果这个值为 1 的话，每个包都需要被密钥签名，相应的密钥（的公钥）也要导入到安装软件的系统上。因为这个软件仓库是笔者本人维护的且笔者信任这个仓库里的包，所以就不去对它们一一签名了。

当一个仓库文件准备好时，你就能开始从远程软件仓库开始安装文件了。最基本的命令是 `yum update`，这将会更新所有已安装的包。你也不需要用特殊的命令来更新仓库本身，所有这一切都已自动完成了。运行命令示例如下：

```
[user@centos ~]$ sudo yum update
Loaded plugins: fastestmirror, product-id, search-disabled-repos, subscription-manager
local_base                             | 3.6 kB  00:00:00    
local_epel                             | 2.9 kB  00:00:00    
local_rpm_forge                        | 1.9 kB  00:00:00    
local_updates                          | 3.4 kB  00:00:00    
spideroak-one-stable                   | 2.9 kB  00:00:00    
zfs                                    | 2.9 kB  00:00:00    
(1/6): local_base/group_gz             | 166 kB  00:00:00    
(2/6): local_updates/primary_db        | 2.7 MB  00:00:00    
(3/6): local_base/primary_db           | 5.9 MB  00:00:00    
(4/6): spideroak-one-stable/primary_db |  12 kB  00:00:00    
(5/6): local_epel/primary_db           | 6.3 MB  00:00:00    
(6/6): zfs/x86_64/primary_db           |  78 kB  00:00:00    
local_rpm_forge/primary_db             | 125 kB  00:00:00    
Determining fastest mirrors
Resolving Dependencies
--> Running transaction check
```

如果你确定想让 YUM 在执行任何命令时不要停下来等待用户输入，你可以命令里放 `-y` 标志，如 `yum update -y`。

安装一个新包很简单。首先，用 `yum search` 搜索包的名字。

```
[user@centos ~]$ yum search kate

artwiz-aleczapka-kates-fonts.noarch : Kates font in Artwiz family
ghc-highlighting-kate-devel.x86_64 : Haskell highlighting-kate library development files
kate-devel.i686 : Development files for kate
kate-devel.x86_64 : Development files for kate
kate-libs.i686 : Runtime files for kate
kate-libs.x86_64 : Runtime files for kate
kate-part.i686 : Kate kpart plugin
```

当你找到你要安装的包后，你可以用 `sudo yum install kate-devel -y` 来安装。如果你安装了你不需要的软件，可以用 `sudo yum remove kdate-devel -y` 来从系统上删除它，默认情况下，YUM 会删除软件包以及它的依赖。

有些时候你甚至都不清楚要安装的包的名称，你只知道某个实用程序的名字。（LCTT 译注：可以理解实用程序是安装包的子集）。例如，你想找实用程序 `updatedb`（它是用来创建/更新由 `locate` 命令所使用的数据库的），直接试图安装 `updatedb` 会返回下面的结果：

```
[user@centos ~]$ sudo yum install updatedb
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
No package updatedb available.
Error: Nothing to do
```

你可以搜索实用程序来自哪个包：

```
[user@centos ~]$ yum whatprovides *updatedb
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile

bacula-director-5.2.13-23.1.el7.x86_64 : Bacula Director files
Repo        : local_base
Matched from:
Filename    : /usr/share/doc/bacula-director-5.2.13/updatedb

mlocate-0.26-8.el7.x86_64 : An utility for finding files by name
Repo        : local_base
Matched from:
Filename    : /usr/bin/updatedb
```

笔者在前面使用星号的原因是 `yum whatprovides` 使用路径去匹配文件。笔者不确定文件在哪里，所以使用星号去指代任意路径。

当然 YUM 还有很多其它的可选项。这里笔者希望你能够自己查看 YUM 的手册来找到其它额外的可选项。

<ruby>[时髦的 Yum][7]<rt>Dandified Yum</rt></ruby>（DNF）是 YUM 的下一代接班人。从 Fedora 18 开始被作为包管理器引入系统，不过它并没有被企业版所采用，所以它只在 Fedora（以及变种）上占据了主导地位。DNF 的用法和 YUM 几乎一模一样，它主要是用来解决性能问题、晦涩无说明的API、缓慢/不可靠的依赖解析，以及偶尔的高内存占用。DNF 是作为 YUM 的直接替代品来开发的，因此这里笔者就不重复它的用法了，你只用简单的将 `yum` 替换为 `dnf` 就行了。

##### 使用 Zypper

[Zypper][8] 是用来管理 RPM 包的另外一个包管理器。这个包管理器主要用于 [SUSE][9]（和 [openSUSE][10]），在[MeeGo][11]、[Sailfish OS][12]、[Tizen][13] 上也有使用。它最初开发于 2006 年，已经经过了多次迭代。除了作为系统管理工具 [YaST][14] 的后端和有些用户认为它比 YUM 要快之外也没有什么好多说的。

Zypper 使用与 YUM 非常相像。它被用来搜索、更新、安装和删除包，简单的使用命令如下：

```
zypper search kate
zypper update
zypper install kate
zypper remove kate
```

主要的不同来自于使用 Zypper 的系统在添加软件仓库的做法上，Zypper 使用包管理器本身来添加软件仓库。最通用的方法是通过一个 URL，但是 Zypper 也支持从仓库文件里导入。

```
suse:~ # zypper addrepo http://download.videolan.org/pub/vlc/SuSE/15.0 vlc
Adding repository 'vlc' [done]
Repository 'vlc' successfully added

Enabled     : Yes
Autorefresh : No
GPG Check   : Yes
URI         : http://download.videolan.org/pub/vlc/SuSE/15.0
Priority    : 99
```

你也能用相似的手段来删除软件仓库：

```
suse:~ # zypper removerepo vlc
Removing repository 'vlc' ...................................[done]
Repository 'vlc' has been removed.
```

使用 `zypper repos` 命令来查看当前系统上的软件仓库的状态：

```
suse:~ # zypper repos
Repository priorities are without effect. All enabled repositories share the same priority.

#  | Alias                     | Name                                    | Enabled | GPG Check | Refresh
---|---------------------------|-----------------------------------------|---------|-----------|--------
 1 | repo-debug                | openSUSE-Leap-15.0-Debug                | No      | ----      | ----  
 2 | repo-debug-non-oss        | openSUSE-Leap-15.0-Debug-Non-Oss        | No      | ----      | ----  
 3 | repo-debug-update         | openSUSE-Leap-15.0-Update-Debug         | No      | ----      | ----  
 4 | repo-debug-update-non-oss | openSUSE-Leap-15.0-Update-Debug-Non-Oss | No      | ----      | ----  
 5 | repo-non-oss              | openSUSE-Leap-15.0-Non-Oss              | Yes     | ( p) Yes  | Yes    
 6 | repo-oss                  | openSUSE-Leap-15.0-Oss                  | Yes     | ( p) Yes  | Yes    
```

`zypper` 甚至还有和 YUM 相同的功能：搜索包含文件或二进制的包。和 YUM 有所不同的是，它在命令行里使用破折号（但是这个搜索方法现在被废除了……）

```
localhost:~ # zypper what-provides kate
Command 'what-provides' is replaced by 'search --provides --match-exact'.
See 'help search' for all available options.
Loading repository data...
Reading installed packages...

S  | Name | Summary              | Type      
---|------|----------------------|------------
i+ | Kate | Advanced Text Editor | application
i  | kate | Advanced Text Editor | package  
```

YUM、DNF 和 Zypper 三剑客拥有的功能比在这篇小文里讨论的要多得多，请查看官方文档来得到更深入的信息。

#### 基于 Debian 的包管理器

作为一个现今仍在被积极维护的最古老的 Linux 发行版之一，Debian 的包管理系统和基于 RPM 的系统的包管理系统非常类似。它使用扩展名为 “.deb” 的包，这种文件能被一个叫做 `dpkg` 的工具所管理。`dpgk` 同 `rpm` 非常相似，它被设计成用来管理在存在于本地（硬盘）的包。它不会去做包依赖关系解析（它会做依赖关系检查，不过仅此而已），而且在同远程软件仓库交互上也并无可靠的途径。为了提高用户体验并便于使用，Debian 项目开始了一个软件项目：Deity，最终这个代号被丢弃并改成了现在的 <ruby>[高级打包工具][15]<rt>Advanced Package Tool</rt></ruby>（APT）。

在 1998 年，APT 测试版本发布（甚至早于 1999 年的 Debian 2.1 发布），许多用户认为 APT 是基于 Debian 系统标配功能之一。APT 使用了和 RPM 一样的风格来管理仓库，不过和 YUM 使用单独的 .repo 文件不同，APT 曾经使用 `/etc/apt/sources.list` 文件来管理软件仓库，后来的变成也可以使用 `/etc/apt/sources.d` 目录来管理。如同基于 RPM 的系统一样，你也有很多很多选项配置来完成同样的事情。你可以编辑和创建前述的文件，或者使用图形界面来完成上述工作（如 Ubuntu 的“Software & Updates”），为了给所有的 Linux 发行版统一的待遇，笔者将会只介绍命令行的选项。
要想不直接编辑文件内容而直接增加软件仓库的话，可以用如下命令：

```
user@ubuntu:~$ sudo apt-add-repository "deb http://APT.spideroak.com/ubuntu-spideroak-hardy/ release restricted"
```

这个命令将会在 `/etc/apt/sources.list.d` 目录里创建一个 `spideroakone.list` 文件。显而易见，文件里的内容依赖于所添加的软件仓库，如果你想加一个<ruby>个人软件包存档<rt>Personal Package Archive</rt></ruby>（PPA）的话，你可以用如下的办法：

```
user@ubuntu:~$ sudo apt-add-repository ppa:gnome-desktop
```

注意： Debian 原生并不支持本地 PPA 。

在添加了一个软件仓库后，需要通知基于 Debian 的系统有一个新的仓库可以用来搜索包，可以运行 `apt-get update` 来完成：

```
user@ubuntu:~$ sudo apt-get update
Get:1 http://security.ubuntu.com/ubuntu xenial-security InRelease [107 kB]
Hit:2 http://APT.spideroak.com/ubuntu-spideroak-hardy release InRelease
Hit:3 http://ca.archive.ubuntu.com/ubuntu xenial InRelease
Get:4 http://ca.archive.ubuntu.com/ubuntu xenial-updates InRelease [109 kB]              
Get:5 http://security.ubuntu.com/ubuntu xenial-security/main amd64 Packages [517 kB]
Get:6 http://security.ubuntu.com/ubuntu xenial-security/main i386 Packages [455 kB]      
Get:7 http://security.ubuntu.com/ubuntu xenial-security/main Translation-en [221 kB]    
...

Fetched 6,399 kB in 3s (2,017 kB/s)                                          
Reading package lists... Done
```

现在新的软件仓库已经在你的系统里安装并更新好了，你可以用 `apt-cache` 来搜索你想要的包了。

```
user@ubuntu:~$ apt-cache search kate
aterm-ml - Afterstep XVT - a VT102 emulator for the X window system
frescobaldi - Qt4 LilyPond sheet music editor
gitit - Wiki engine backed by a git or darcs filestore
jedit - Plugin-based editor for programmers
kate - powerful text editor
kate-data - shared data files for Kate text editor
kate-dbg - debugging symbols for Kate
katepart - embeddable text editor component
```

要安装 kate，简单的运行下面的命令：

```
user@ubuntu:~$ sudo apt-get install kate
```

要是删除一个包，使用 `apt-get remove`：

```
user@ubuntu:~$ sudo apt-get remove kate
```

要探索一个包的话，APT 并没有提供一个类似于 `yum whatprovides` 的功能，如果你想深入包内部去确定一个特定的文件的话，也有一些别的方法能帮你完成这个目标，

如： 用 `dpkg`

```
user@ubuntu:~$ dpkg -S /bin/ls
coreutils: /bin/ls
```

或者： `apt-file`

```
user@ubuntu:~$ sudo apt-get install apt-file -y
user@ubuntu:~$ sudo apt-file update
user@ubuntu:~$ apt-file search kate
```

与 `yum whatprovides` 不同的是，`apt-file search` 的问题是因为自动添加了通配符搜索而输出过于详细（除非你知道确切的路径），最终在结果里包括了所有包含有 “kate” 的结果。

```
kate: /usr/bin/kate
kate: /usr/lib/x86_64-linux-gnu/qt5/plugins/ktexteditor/katebacktracebrowserplugin.so
kate: /usr/lib/x86_64-linux-gnu/qt5/plugins/ktexteditor/katebuildplugin.so
kate: /usr/lib/x86_64-linux-gnu/qt5/plugins/ktexteditor/katecloseexceptplugin.so
kate: /usr/lib/x86_64-linux-gnu/qt5/plugins/ktexteditor/katectagsplugin.so
```

上面这些例子大部分都使用了 `apt-get`。请注意现今大多数的 Ubuntu 教程里都径直使用了 `apt`。 单独一个 `apt` 设计用来实现那些最常用的 APT 命令的。`apt` 命令看上去是用来整合那些被分散在 `apt-get`、`apt-cache` 以及其它一些命令的的功能的。它还加上了一些额外的改进，如色彩、进度条以及其它一些小功能。上述的常用命令都能被 `apt` 替代，但是并不是所有的基于 Debian 的系统都能使用 `apt` 接受安全包补丁的，你有可能要安装额外的包的实现上述功能。

#### 基于 Arch 的包管理器

[Arch Linux][16] 使用称为 [packman][17] 的包管理器。和 .deb 以及 .rpm 不同，它使用更为传统的 LZMA2 压缩包形式 .tar.xz 。这可以使 Arch Linux 包能够比其它形式的压缩包（如 gzip）有更小的尺寸。自从 2002 年首次发布以来， `pacman` 一直在稳定发布和改善。使用它最大的好处之一是它支持 [Arch Build System][18]，这是一个从源代码级别构建包的构建系统。该构建系统借助一个叫 `PKGBUILD` 的文件，这个文件包含了如版本号、发布号、依赖等等的元数据，以及一个为编译遵守 Arch Linux 需求的包所需要的带有必要的编译选项的脚本。而编译的结果就是前文所提的被 `pacman` 所使用的 .tar.xz 的文件。

上述的这套系统技术上导致了 <ruby>[Arch 用户仓库][19]<rt>Arch User Respository</rt></ruby>（AUR）的产生，这是一个社区驱动的软件仓库，仓库里包括有 `PKGBUILD` 文件以及支持补丁或脚本。这给 Arch Linux 带了无穷无尽的软件资源。最为明显的好处是如果一个用户（或开发者）希望他开发的软件能被广大公众所使用，他不必通过官方途径去在主流软件仓库获得许可。而不利之处则是它必须将依赖社区的流程，类似于 [Docker Hub][20]、
Canonical 的 Snap Packages（LCTT  译注： Canonical 是 Ubuntu 的发行公司），或者其它类似的机制。有很多特定于 AUR 的包管理器能被用来从 AUR 里的 `PGKBUILD` 文件下载、编译、安装，下面我们来仔细看看怎么做。

##### 使用 pacman 和官方软件仓库

Arch 的主要包管理器：`pacman`，使用标识位而不是像 `yum` 或 `apt` 一样使用命令词。例如，要搜索一个包，你要用 `pacman -Ss` 。和 Linux 上别的命令一样，你可以找到 pacman 的手册页和在线帮助。`pacman` 大多数的命令都使用了同步（`-S`）这个标识位。例如：

```
user@arch ~ $ pacman -Ss kate

extra/kate 18.04.2-2 (kde-applications kdebase)
    Advanced Text Editor
extra/libkate 0.4.1-6 [installed]
    A karaoke and text codec for embedding in ogg
extra/libtiger 0.3.4-5 [installed]
    A rendering library for Kate streams using Pango and Cairo
extra/ttf-cheapskate 2.0-12
    TTFonts collection from dustimo.com
community/haskell-cheapskate 0.1.1-100
    Experimental markdown processor.
```

Arch 也使用和别的包管理器类似的软件仓库。在上面的输出中，搜索结果前面有标明它是从哪个仓库里搜索到的（这里是 `extra/` 和 `community/`）。同 Red Hat 和 Debian 系统一样，Arch 依靠用户将软件仓库的信息加入到一个特定的文件里：`/etc/pacman.conf`。下面的例子非常接近一个仓库系统。笔者还打开了 `[multilib]` 仓库来支持 Steam：

```
[options]
Architecture = auto

Color
CheckSpace

SigLevel    = Required DatabaseOptional
LocalFileSigLevel = Optional

[core]
Include = /etc/pacman.d/mirrorlist

[extra]
Include = /etc/pacman.d/mirrorlist

[community]
Include = /etc/pacman.d/mirrorlist

[multilib]
Include = /etc/pacman.d/mirrorlist
```

你也可以在 `pacman.conf` 里指定具体的 URL。这个功能可以用来确保在某一时刻所有的包来自一个确定的地方，比如，如果一个安装包存在严重的功能缺陷并且很不幸它恰好还有几个包依赖，你能及时回滚到一个安全点，如果你已经在 `pacman.conf` 里加入了具体的 URL 的话，你就用用这个命令降级你的系统。

```
[core]
Server=https://archive.archlinux.org/repos/2017/12/22/$repo/os/$arch
```

和 Debian 系统一样，Arch 并不会自动更新它的本地仓库。你可以用下面的命令来刷新包管理器的数据库：

```
user@arch ~ $ sudo pacman -Sy

:: Synchronizing package databases...
 core                                                                     130.2 KiB   851K/s 00:00 [##########################################################] 100%
 extra                                                                   1645.3 KiB  2.69M/s 00:01 [##########################################################] 100%
 community                                                                  4.5 MiB  2.27M/s 00:02 [##########################################################] 100%
 multilib is up to date
```

你可以看到在上述的输出中，`pacman` 认为 multilib 包数据库是更新到最新状态的。如果你认为这个结果不正确的话，你可以强制运行刷新：`pacman -Syy`。如果你想升级你的整个系统的话（不包括从 AUR 安装的包），你可以运行 `pacman -Syu`：

```
user@arch ~ $ sudo pacman -Syu

:: Synchronizing package databases...
 core is up to date
 extra is up to date
 community is up to date
 multilib is up to date
:: Starting full system upgrade...
resolving dependencies...
looking for conflicting packages...

Packages (45) ceph-13.2.0-2  ceph-libs-13.2.0-2  debootstrap-1.0.105-1  guile-2.2.4-1  harfbuzz-1.8.2-1  harfbuzz-icu-1.8.2-1  haskell-aeson-1.3.1.1-20
              haskell-attoparsec-0.13.2.2-24  haskell-tagged-0.8.6-1  imagemagick-7.0.8.4-1  lib32-harfbuzz-1.8.2-1  lib32-libgusb-0.3.0-1  lib32-systemd-239.0-1
              libgit2-1:0.27.2-1  libinput-1.11.2-1  libmagick-7.0.8.4-1  libmagick6-6.9.10.4-1  libopenshot-0.2.0-1  libopenshot-audio-0.1.6-1  libosinfo-1.2.0-1
              libxfce4util-4.13.2-1  minetest-0.4.17.1-1  minetest-common-0.4.17.1-1  mlt-6.10.0-1  mlt-python-bindings-6.10.0-1  ndctl-61.1-1  netctl-1.17-1
              nodejs-10.6.0-1  

Total Download Size:      2.66 MiB
Total Installed Size:   879.15 MiB
Net Upgrade Size:      -365.27 MiB

:: Proceed with installation? [Y/n]
```

在前面提到的降级系统的情景中，你可以运行 `pacman -Syyuu` 来强行降级系统。你必须重视这一点：虽然在大多数情况下这不会引起问题，但是这种可能性还是存在，即降级一个包或几个包将会引起级联传播的失败并会将你的系统处于不一致的状态（LCTT 译注：即系统进入无法正常使用的状态），请务必小心！

运行 `pacman -S kate` 来安装一个包。

```
user@arch ~ $ sudo pacman -S kate

resolving dependencies...
looking for conflicting packages...

Packages (7) editorconfig-core-c-0.12.2-1  kactivities-5.47.0-1  kparts-5.47.0-1  ktexteditor-5.47.0-2  syntax-highlighting-5.47.0-1  threadweaver-5.47.0-1
             kate-18.04.2-2

Total Download Size:   10.94 MiB
Total Installed Size:  38.91 MiB

:: Proceed with installation? [Y/n]
```

你可以运行 `pacman -R kate` 来删除一个包。这将会只删除这个包自身而不会去删除它的依赖包。

```
user@arch ~ $ sudo pacman -S kate

checking dependencies...

Packages (1) kate-18.04.2-2

Total Removed Size:  20.30 MiB

:: Do you want to remove these packages? [Y/n]
```

如果你想删除没有被其它包依赖的包，你可以运行 `pacman -Rs`：

```
user@arch ~ $ sudo pacman -Rs kate

checking dependencies...

Packages (7) editorconfig-core-c-0.12.2-1  kactivities-5.47.0-1  kparts-5.47.0-1  ktexteditor-5.47.0-2  syntax-highlighting-5.47.0-1  threadweaver-5.47.0-1
             kate-18.04.2-2

Total Removed Size:  38.91 MiB

:: Do you want to remove these packages? [Y/n]
```

在笔者看来，Pacman 是搜索一个指定实用程序中的包名的最齐全的工具。如上所示，YUM 和 APT 都依赖于“路径”去搜索到有用的结果，而 Pacman 则做了一些智能的猜测，它会去猜测你最有可能想搜索的包。

```
user@arch ~ $ sudo pacman -Fs updatedb
core/mlocate 0.26.git.20170220-1
    usr/bin/updatedb

user@arch ~ $ sudo pacman -Fs kate
extra/kate 18.04.2-2
    usr/bin/kate
```

##### 使用 AUR

有很多流行的 AUR 包管理器助手。其中 `yaourt` 和 `pacaur` 颇为流行。不过，这两个项目已经被 [Arch Wiki][21] 列为“不继续开发以及有已知的问题未解决”。因为这个原因，这里直接讨论 `aurman`，除了会搜索 AUR 以及包含几个有帮助的（其实很危险）的选项之外，它的工作机制和 `pacman` 极其类似。从 AUR 安装一个包将会初始化包维护者的构建脚本。你将会被要求输入几次授权以便让程序继续进行下去（为了简短起见，笔者截断了输出）。

```
aurman -S telegram-desktop-bin
~~ initializing aurman...
~~ the following packages are neither in known repos nor in the aur
...
~~ calculating solutions...

:: The following 1 package(s) are getting updated:
   aur/telegram-desktop-bin  1.3.0-1  ->  1.3.9-1

?? Do you want to continue? Y/n: Y

~~ looking for new pkgbuilds and fetching them...
Cloning into 'telegram-desktop-bin'...

remote: Counting objects: 301, done.
remote: Compressing objects: 100% (152/152), done.
remote: Total 301 (delta 161), reused 286 (delta 147)
Receiving objects: 100% (301/301), 76.17 KiB | 639.00 KiB/s, done.
Resolving deltas: 100% (161/161), done.
?? Do you want to see the changes of telegram-desktop-bin? N/y: N

[sudo] password for user:

...
==> Leaving fakeroot environment.
==> Finished making: telegram-desktop-bin 1.3.9-1 (Thu 05 Jul 2018 11:22:02 AM EDT)
==> Cleaning up...
loading packages...
resolving dependencies...
looking for conflicting packages...

Packages (1) telegram-desktop-bin-1.3.9-1

Total Installed Size:  88.81 MiB
Net Upgrade Size:       5.33 MiB

:: Proceed with installation? [Y/n]
```

依照你所安装的包的复杂性程度的高低，有时你将会被要求给出进一步的输入，为了避免这些反复的输入，`aurman` 允许你使用 `--noconfirm` 和 `--noedit` 选项。这相当于说“接受所有的预定设置，并相信包管理器不会干坏事”。**使用这两个选项时请务必小心！！**，虽然这些选项本身不太会破坏你的系统，你也不能盲目的接受他人的脚本程序。

### 总结

这篇文章当然只能触及包管理器的皮毛。还有很多别的包管理器笔者没有在这篇文章里谈及。有些 Linux 发布版，如 Ubuntu 或 Elementary OS，已经在图形版的包管理器的开发上有了长远的进展。

如果你对包管理器的更高级功能有进一步的兴趣，请在评论区留言，笔者很乐意进一步的写一写相关的文章。

### 附录

```
# search for packages
yum search <package>
dnf search <package>
zypper search <package>
apt-cache search <package>
apt search <package>
pacman -Ss <package>

# install packages
yum install <package>
dnf install <package>
zypper install <package>
apt-get install <package>
apt install <package>
pacman -Ss <package>

# update package database, not required by yum, dnf and zypper
apt-get update
apt update
pacman -Sy

# update all system packages
yum update
dnf update
zypper update
apt-get upgrade
apt upgrade
pacman -Su

# remove an installed package
yum remove <package>
dnf remove <package>
apt-get remove <package>
apt remove <package>
pacman -R <package>
pacman -Rs <package>

# search for the package name containing specific file or folder
yum whatprovides *<binary>
dnf whatprovides *<binary>
zypper what-provides <binary>
zypper search --provides <binary>
apt-file search <binary>
pacman -Sf <binary>
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/evolution-package-managers

作者：[Steve Ovens][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[DavidChenLiang](https://github.com/davidchenliang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/stratusss
[1]:https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures
[2]:https://en.wikipedia.org/wiki/Yum_(software)
[3]:https://fedoraproject.org/wiki/DNF
[4]:https://en.wikipedia.org/wiki/Rpm_(software)
[5]:https://en.wikipedia.org/wiki/Yellow_Dog_Linux
[6]:https://searchdatacenter.techtarget.com/definition/Yellowdog-Updater-Modified-YUM
[7]:https://en.wikipedia.org/wiki/DNF_(software)
[8]:https://en.opensuse.org/Portal:Zypper
[9]:https://www.suse.com/
[10]:https://www.opensuse.org/
[11]:https://en.wikipedia.org/wiki/MeeGo
[12]:https://sailfishos.org/
[13]:https://www.tizen.org/
[14]:https://en.wikipedia.org/wiki/YaST
[15]:https://en.wikipedia.org/wiki/APT_(Debian)
[16]:https://www.archlinux.org/
[17]:https://wiki.archlinux.org/index.php/pacman
[18]:https://wiki.archlinux.org/index.php/Arch_Build_System
[19]:https://aur.archlinux.org/
[20]:https://hub.docker.com/
[21]:https://wiki.archlinux.org/index.php/AUR_helpers#Discontinued_or_problematic
