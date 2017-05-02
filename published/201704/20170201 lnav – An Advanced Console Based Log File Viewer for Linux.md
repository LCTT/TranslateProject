lnav：Linux 下一个基于控制台的高级日志文件查看器
============================================================

[LNAV][3]（Log file Navigator）是 Linux 下一个基于控制台的高级日志文件查看器。它和其它文件查看器，例如 cat、more、tail 等，完成相同的任务，但有很多普通文件查看器没有的增强功能（尤其是它自带多种颜色和易于阅读的格式）。

它能在解压多个压缩日志文件（zip、gzip、bzip）的同时把它们合并到一起进行导航。基于消息的时间戳，`lnav` 能把多个日志文件合并到一个视图（Single Log Review），从而避免打开多个窗口。左边的颜色栏帮助显示消息所属的文件。

警告和错误的数量以（黄色和红色）高亮显示，因此我们能够很轻易地看到问题出现在哪里。它会自动加载新的日志行。

它按照消息时间戳排序显示所有文件的日志消息。顶部和底部的状态栏会告诉你位于哪个日志文件。如果你想按特定的模式查找，只需要在搜索弹窗中输入就会即时显示。

内建的日志消息解析器会自动从每一行中发现和提取详细信息。

服务器日志是一个由服务器创建并经常更新、用于抓取特定服务和应用的所有活动信息的日志文件。当你的应用或者服务出现问题时这个文件就会非常有用。从日志文件中你可以获取所有关于该问题的信息，例如基于警告或者错误信息它什么时候开始表现不正常。

当你用一个普通文件查看器打开一个日志文件时，它会用纯文本格式显示所有信息（如果用更直白的话说的话：纯白——黑底白字），这样很难去发现和理解哪里有警告或错误信息。为了克服这种情况，快速找到警告和错误信息来解决问题， lnav 是一个入手可用的更好的解决方案。

大部分常见的 Linux 日志文件都放在 `/var/log/`。

**lnav 自动检测以下日志格式**

*   Common Web Access Log format（普通 web 访问日志格式）
*   CUPS page_log
*   Syslog
*   Glog
*   VMware ESXi/vCenter 日志
*   dpkg.log
*   uwsgi
*   “Generic” – 以时间戳开始的任何消息
*   Strace
*   sudo
*   gzib & bizp

**lnav 高级功能**

*	单一日志视图 - 基于消息时间戳，所有日志文件内容都会被合并到一个单一视图
*	自动日志格式检测 - `lnav` 支持大部分日志格式
*	过滤器 - 能进行基于正则表达式的过滤
*	时间线视图
*	适宜打印视图（Pretty-Print）
*	使用 SQL 查询日志
*	自动数据抽取
*	实时操作
*	语法高亮
*	Tab 补全
*	当你查看相同文件集时可以自动保存和恢复会话信息。
*	Headless 模式

### 如何在 Linux 中安装 lnav

大部分发行版（Debian、Ubuntu、Mint、Fedora、suse、openSUSE、Arch Linux、Manjaro、Mageia 等等）默认都有 `lnav` 软件包，在软件包管理器的帮助下，我们可以很轻易地从发行版官方仓库中安装它。对于 CentOS/RHEL 我们需要启用 **[EPEL 仓库][1]**。

```
[在 Debian/Ubuntu/LinuxMint 上安装 lnav]
$ sudo apt-get install lnav

[在 RHEL/CentOS 上安装 lnav]
$ sudo yum install lnav

[在 Fedora 上安装 lnav]
$ sudo dnf install lnav

[在 openSUSE 上安装 lnav]
$ sudo zypper install lnav

[在 Mageia 上安装 lnav]
$ sudo urpmi lnav

[在基于 Arch Linux 的系统上安装 lnav]
$ yaourt -S lnav
```

如果你的发行版没有 `lnav` 软件包，别担心，开发者提供了 `.rpm` 和 `.deb` 安装包，因此我们可以轻易安装。确保你从 [开发者 github 页面][4] 下载最新版本的安装包。

```
[在 Debian/Ubuntu/LinuxMint 上安装 lnav]
$ sudo wget https://github.com/tstack/lnav/releases/download/v0.8.1/lnav_0.8.1_amd64.deb
$ sudo dpkg -i lnav_0.8.1_amd64.deb

[在 RHEL/CentOS 上安装 lnav]
$ sudo yum install https://github.com/tstack/lnav/releases/download/v0.8.1/lnav-0.8.1-1.x86_64.rpm

[在 Fedora 上安装 lnav]
$ sudo dnf install https://github.com/tstack/lnav/releases/download/v0.8.1/lnav-0.8.1-1.x86_64.rpm

[在 openSUSE 上安装 lnav]
$ sudo zypper install https://github.com/tstack/lnav/releases/download/v0.8.1/lnav-0.8.1-1.x86_64.rpm

[在 Mageia 上安装 lnav]
$ sudo rpm -ivh https://github.com/tstack/lnav/releases/download/v0.8.1/lnav-0.8.1-1.x86_64.rpm
```

### 不带参数运行 lnav

默认情况下你不带参数运行 `lnav` 时它会打开 `syslog` 文件。

```
# lnav
```

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-1.png) 
][5]

### 使用 lnav 查看特定日志文件

要用 `lnav` 查看特定的日志文件，在 `lnav` 命令后面添加日志文件路径。例如我们想看 `/var/log/dpkg.log` 日志文件。

```
# lnav /var/log/dpkg.log
```

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-2.png) 
][6]

### 用 lnav 查看多个日志文件

要用 `lnav` 查看多个日志文件，在 lnav 命令后面逐个添加日志文件路径，用一个空格隔开。例如我们想查看 `/var/log/dpkg.log` 和 `/var/log/kern.log` 日志文件。

左边的颜色栏帮助显示消息所属的文件。另外顶部状态栏还会显示当前日志文件的名称。为了显示多个日志文件，大部分应用经常会打开多个窗口、或者在窗口中水平或竖直切分，但 `lnav` 使用不同的方式（它基于日期组合在同一个窗口显示多个日志文件）。

```
# lnav /var/log/dpkg.log /var/log/kern.log
```

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-3.png) 
][7]

### 使用 lnav 查看压缩的日志文件

要查看并同时解压被压缩的日志文件（zip、gzip、bzip），在 `lnav` 命令后面添加 `-r` 选项。

```
# lnav -r /var/log/Xorg.0.log.old.gz
```

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-6.png) 
][8]

### 直方图视图

首先运行 `lnav` 然后按 `i` 键切换到/出直方图视图。

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-4.png) 
][9]

### 查看日志解析器结果

首先运行 `lnav` 然后按 `p` 键打开显示日志解析器结果。

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-5.png) 
][10]

### 语法高亮

你可以搜索任何给定的字符串，它会在屏幕上高亮显示。首先运行 `lnav` 然后按 `/` 键并输入你想查找的字符串。为了测试，我搜索字符串 `Default`，看下面的截图。

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-7.png) 
][11]

### Tab 补全

命令窗口支持大部分操作的 tab 补全。例如，在进行搜索时，你可以使用 tab 补全屏幕上显示的单词，而不需要复制粘贴。为了测试，我搜索字符串 `/var/log/Xorg`，看下面的截图。

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-8.png) 
][12]


--------------------------------------------------------------------------------

via: http://www.2daygeek.com/install-and-use-advanced-log-file-viewer-navigator-lnav-in-linux/

作者：[Magesh Maruthamuthu][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:http://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-scientific-linux-oracle-linux/
[2]:http://www.2daygeek.com/author/magesh/
[3]:http://lnav.org/
[4]:https://github.com/tstack/lnav/releases
[5]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-1.png
[6]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-2.png
[7]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-3.png
[8]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-6.png
[9]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-4.png
[10]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-5.png
[11]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-7.png
[12]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-8.png
