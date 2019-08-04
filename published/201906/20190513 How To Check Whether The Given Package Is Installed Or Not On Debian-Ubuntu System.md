[#]: collector: (lujun9972)
[#]: translator: (yizhuoyan)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11010-1.html)
[#]: subject: (How To Check Whether The Given Package Is Installed Or Not On Debian/Ubuntu System?)
[#]: via: (https://www.2daygeek.com/how-to-check-whether-the-given-package-is-installed-or-not-on-ubuntu-debian-system/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)


如何在 Debian/Ubuntu 系统中检查程序包是否安装？
======

![](https://img.linux.net.cn/data/attachment/album/201906/23/235541yl41p73z5jv78y8p.jpg)

我们近期发布了一篇关于批量程序包安装的文章。在此同时，关于如何获取系统上已安装了的程序包信息，我也做了些调查然后找到了些方法。我会把这些方法分享在我们的网站上，希望能帮助到其他人。

有很多种方法可以检查程序包是否已安装，我找到了 7 种命令，你可以从中选择你喜欢的使用。 

如下：

  * `apt-cache`：可用于查询 APT 缓存或程序包的元数据。
  * `apt`：是基于 Debian 的系统中的安装、下载、删除、搜索和管理包的强有力的工具。
  * `dpkg-query`：一个查询 dpkg 数据库的工具。
  * `dpkg`：基于 Debian 的系统的包管理工具。
  * `which`：返回在终端中输入命令时执行的可执行文件的全路径。
  * `whereis`：可用于搜索指定命令的二进制文件、源码文件和帮助文件。
  * `locate`：比 `find` 命令快，因为其使用 `updatedb` 数据库搜索，而 `find`命令在实际系统中搜索。

### 方法一、使用 apt-cache 命令

`apt-cache` 命令用于从 APT 内部数据库中查询**APT 缓存**和**包的元数据**，将会搜索和显示指定包的信息，包括是否安装、程序包版本、源码仓库信息等。

下面的示例清楚的显示 `nano` 包已经在系统中安装了以及对应安装的版本号。

```
# apt-cache policy nano
nano:
  Installed: 2.9.3-2
  Candidate: 2.9.3-2
  Version table:
 *** 2.9.3-2 500
        500 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 Packages
        100 /var/lib/dpkg/status
```

### 方法二、使用 apt 命令

`apt` 是一个功能强大的命令行工具，可用于安装、下载、删除、搜索、管理程序包以及查询关于程序包的信息，类似对于 `libapt-pkg` 库的所有功能的底层访问。其包含一些与包管理相关的但很少用到的命令行功能。

```
# apt -qq list nano
nano/bionic,now 2.9.3-2 amd64 [installed]
```

### 方法三、使用 dpkg-query 命令

`dpkg-query` 是显示 `dpkg` 数据库中程序包信息列表的一个工具。

下面示例中的输出的第一列 `ii`，表示查询的程序包已安装了。

```
# dpkg-query --list | grep -i nano
ii  nano    2.9.3-2    amd64    small, friendly text editor inspired by Pico
```

### 方法四、使用 dpkg 命令

`dpkg`（**d**ebian **p**ac**k**a**g**e）是一个安装、构建、删除和管理 Debian 包的工具，但和其他包管理系统不同的是，其不能自动下载和安装包或包依赖。

下面示例中的输出的第一列 `ii`，表示查询的包已安装了。

```
# dpkg -l | grep -i nano
ii  nano     2.9.3-2    amd64   small, friendly text editor inspired by Pico
```

### 方法五、使用 which 命令

`which` 命令返回在终端中输入命令时执行的可执行文件的全路径。这对于你想要给可执行文件创建桌面快捷方式或符号链接时非常有用。

`which` 命令仅在当前用户 `PATH` 环境变量配置的目录列表中搜索，而不是在所有用户的目录中搜索。这意思是当你登入你自己账号时，其不会在 `root` 用户文件或目录中搜索。

如果对于指定的程序包或可执行文件路径有如下输出，则表示已安装了，否则没有。

```
# which nano
/bin/nano
```

### 方法六、使用 whereis 命令

`whereis` 命令用于针对指定命令搜索对应的程序二进制文件、源码文件以及帮助文件等。

如果对于指定的程序包或可执行文件路径有如下输出，则表示已安装了，否则没有。

```
# whereis nano
nano: /bin/nano /usr/share/nano /usr/share/man/man1/nano.1.gz /usr/share/info/nano.info.gz
```

### 方法七、使用 locate 命令

`locate` 命令比 `find` 命令快，因为其在 `updatedb` 数据库中搜索，而 `find` 命令在实际系统中进行搜索。

对于获取指定文件，其使用数据库而不是在特定目录路径中搜索。

`locate` 命令不会预安装在大多数系统中，需要手动安装。

`locate` 使用的数据库会根据定时任务定期更新。当然，我们也可以手动更新。

如果对于指定的程序包或可执行文件路径有如下输出，则表示已安装了，否则没有。

```
# locate --basename '\nano'
/usr/bin/nano
/usr/share/nano
/usr/share/doc/nano
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-whether-the-given-package-is-installed-or-not-on-ubuntu-debian-system/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[yizhuoyan](https://github.com/yizhuoyan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
