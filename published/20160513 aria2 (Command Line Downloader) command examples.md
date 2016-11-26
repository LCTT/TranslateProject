aria2 （命令行下载器）实例
============

[aria2][4] 是一个自由、开源、轻量级多协议和多源的命令行下载工具。它支持 HTTP/HTTPS、FTP、SFTP、 BitTorrent 和 Metalink 协议。aria2 可以通过内建的 JSON-RPC 和 XML-RPC 接口来操纵。aria2 下载文件的时候，自动验证数据块。它可以通过多个来源或者多个协议下载一个文件，并且会尝试利用你的最大下载带宽。默认情况下，所有的 Linux 发行版都包括 aria2，所以我们可以从官方库中很容易的安装。一些 GUI 下载管理器例如 [uget][3] 使用 aria2 作为插件来提高下载速度。

### Aria2 特性

*   支持 HTTP/HTTPS GET
*   支持 HTTP 代理
*   支持 HTTP BASIC 认证
*   支持 HTTP 代理认证
*   支持 FTP （主动、被动模式）
*   通过 HTTP 代理的 FTP（GET 命令行或者隧道）
*   分段下载
*   支持 Cookie
*   可以作为守护进程运行。
*   支持使用 fast 扩展的 BitTorrent 协议
*   支持在多文件 torrent 中选择文件
*   支持 Metalink 3.0 版本（HTTP/FTP/BitTorrent）
*   限制下载、上传速度

### 1) Linux 下安装 aria2

我们可以很容易的在所有的 Linux 发行版上安装 aria2 命令行下载器，例如 Debian、 Ubuntu、 Mint、 RHEL、 CentOS、 Fedora、 suse、 openSUSE、 Arch Linux、 Manjaro、 Mageia 等等……只需要输入下面的命令安装即可。对于 CentOS、 RHEL 系统，我们需要开启 [uget][2] 或者 [RPMForge][1] 库的支持。

```
[对于 Debian、 Ubuntu 和 Mint]
$ sudo apt-get install aria2

[对于 CentOS、 RHEL、 Fedora 21 和更早些的操作系统]
# yum install aria2

[Fedora 22 和 之后的系统]
# dnf install aria2

[对于 suse 和 openSUSE]
# zypper install wget

[Mageia]
# urpmi aria2

[对于 Debian、 Ubuntu 和 Mint]
$ sudo pacman -S aria2

```

### 2) 下载单个文件

下面的命令将会从指定的 URL 中下载一个文件，并且保存在当前目录，在下载文件的过程中，我们可以看到文件的（日期、时间、下载速度和下载进度）。

```
# aria2c https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
[#986c80 19MiB/21MiB(90%) CN:1 DL:3.0MiB]
03/22 09:49:13 [NOTICE] Download complete: /opt/owncloud-9.0.0.tar.bz2

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
986c80|OK  |   3.0MiB/s|/opt/owncloud-9.0.0.tar.bz2

Status Legend:
(OK):download completed.

```

### 3) 使用不同的名字保存文件

在初始化下载的时候，我们可以使用 `-o`（小写）选项在保存文件的时候使用不同的名字。这儿我们将要使用 owncloud.zip 文件名来保存文件。

```
# aria2c -o owncloud.zip https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
[#d31304 16MiB/21MiB(74%) CN:1 DL:6.2MiB]
03/22 09:51:02 [NOTICE] Download complete: /opt/owncloud.zip

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
d31304|OK  |   7.3MiB/s|/opt/owncloud.zip

Status Legend:
(OK):download completed.

```

### 4) 下载速度限制

默认情况下，aria2 会利用全部带宽来下载文件，在文件下载完成之前，我们在服务器就什么也做不了（这将会影响其他服务访问带宽）。所以在下载大文件时最好使用 `–max-download-limit` 选项来避免进一步的问题。

```
# aria2c --max-download-limit=500k https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
[#7f9fbf 21MiB/21MiB(99%) CN:1 DL:466KiB]
03/22 09:54:51 [NOTICE] Download complete: /opt/owncloud-9.0.0.tar.bz2

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
7f9fbf|OK  |   462KiB/s|/opt/owncloud-9.0.0.tar.bz2

Status Legend:
(OK):download completed.

```

### 5) 下载多个文件

下面的命令将会从指定位置下载超过一个的文件并保存到当前目录，在下载文件的过程中，我们可以看到文件的（日期、时间、下载速度和下载进度）。

```
# aria2c -Z https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2 ftp://ftp.gnu.org/gnu/wget/wget-1.17.tar.gz
[DL:1.7MiB][#53533c 272KiB/21MiB(1%)][#b52bb1 768KiB/3.6MiB(20%)]
03/22 10:25:54 [NOTICE] Download complete: /opt/wget-1.17.tar.gz
[#53533c 18MiB/21MiB(86%) CN:1 DL:3.2MiB]
03/22 10:25:59 [NOTICE] Download complete: /opt/owncloud-9.0.0.tar.bz2

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
b52bb1|OK  |   2.8MiB/s|/opt/wget-1.17.tar.gz
53533c|OK  |   3.4MiB/s|/opt/owncloud-9.0.0.tar.bz2

Status Legend:
(OK):download completed.

```

### 6) 续传未完成的下载

当你遇到一些网络连接问题或者系统问题的时候，并将要下载一个大文件（例如： ISO 镜像文件），我建议你使用 `-c` 选项，它可以帮助我们从该状态续传未完成的下载，并且像往常一样完成。不然的话，当你再次下载，它将会初始化新的下载，并保存成一个不同的文件名（自动的在文件名后面添加 .1 ）。注意：如果出现了任何中断，aria2 使用 .aria2 后缀保存（未完成的）文件。

```
# aria2c -c https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
[#db0b08 8.2MiB/21MiB(38%) CN:1 DL:3.1MiB ETA:4s]^C
03/22 10:09:26 [NOTICE] Shutdown sequence commencing... Press Ctrl-C again for emergency shutdown.

03/22 10:09:26 [NOTICE] Download GID#db0b08bf55d5908d not complete: /opt/owncloud-9.0.0.tar.bz2

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
db0b08|INPR|   3.3MiB/s|/opt/owncloud-9.0.0.tar.bz2

Status Legend:
(INPR):download in-progress.

如果重新启动传输，aria2 将会恢复下载。

# aria2c -c https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
[#873d08 21MiB/21MiB(98%) CN:1 DL:2.7MiB]
03/22 10:09:57 [NOTICE] Download complete: /opt/owncloud-9.0.0.tar.bz2

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
873d08|OK  |   1.9MiB/s|/opt/owncloud-9.0.0.tar.bz2

Status Legend:
(OK):download completed.

```

### 7) 从文件获取输入

就像 wget 可以从一个文件获取输入的 URL 列表来下载一样。我们需要创建一个文件，将每一个 URL 存储在单独的行中。ara2 命令行可以添加 `-i` 选项来执行此操作。

```
# aria2c -i test-aria2.txt
[DL:3.9MiB][#b97984 192KiB/21MiB(0%)][#673c8e 2.5MiB/3.6MiB(69%)]
03/22 10:14:22 [NOTICE] Download complete: /opt/wget-1.17.tar.gz
[#b97984 19MiB/21MiB(90%) CN:1 DL:2.5MiB]
03/22 10:14:30 [NOTICE] Download complete: /opt/owncloud-9.0.0.tar.bz2

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
673c8e|OK  |   4.3MiB/s|/opt/wget-1.17.tar.gz
b97984|OK  |   2.5MiB/s|/opt/owncloud-9.0.0.tar.bz2

Status Legend:
(OK):download completed.

```

### 8) 每个主机使用两个连接来下载

默认情况，每次下载连接到一台服务器的最大数目，对于一条主机只能建立一条。我们可以通过 aria2 命令行添加 `-x2`（2 表示两个连接）来创建到每台主机的多个连接，以加快下载速度。

```
# aria2c -x2 https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
[#ddd4cd 18MiB/21MiB(83%) CN:1 DL:5.0MiB]
03/22 10:16:27 [NOTICE] Download complete: /opt/owncloud-9.0.0.tar.bz2

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
ddd4cd|OK  |   5.5MiB/s|/opt/owncloud-9.0.0.tar.bz2

Status Legend:
(OK):download completed.

```

### 9) 下载 BitTorrent 种子文件

我们可以使用 aria2 命令行直接下载一个 BitTorrent 种子文件：

```
# aria2c https://torcache.net/torrent/C86F4E743253E0EBF3090CCFFCC9B56FA38451A3.torrent?title=[kat.cr]irudhi.suttru.2015.official.teaser.full.hd.1080p.pathi.team.sr
[#388321 0B/0B CN:1 DL:0B]                                                                                                                    
03/22 20:06:14 [NOTICE] Download complete: /opt/[kat.cr]irudhi.suttru.2015.official.teaser.full.hd.1080p.pathi.team.sr.torrent

03/22 20:06:14 [ERROR] Exception caught
Exception: [BtPostDownloadHandler.cc:98] errorCode=25 Could not parse BitTorrent metainfo

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
388321|OK  |    11MiB/s|/opt/[kat.cr]irudhi.suttru.2015.official.teaser.full.hd.1080p.pathi.team.sr.torrent

Status Legend:
(OK):download completed.

```

### 10) 下载 BitTorrent 磁力链接

使用 aria2 我们也可以通过 BitTorrent 磁力链接直接下载一个种子文件：

```
# aria2c 'magnet:?xt=urn:btih:248D0A1CD08284299DE78D5C1ED359BB46717D8C'

```

### 11) 下载 BitTorrent Metalink 种子

我们也可以通过 aria2 命令行直接下载一个  Metalink 文件。

```
# aria2c https://curl.haxx.se/metalink.cgi?curl=tar.bz2

```

### 12) 从密码保护的网站下载一个文件

或者，我们也可以从一个密码保护网站下载一个文件。下面的命令行将会从一个密码保护网站中下载文件。

```
# aria2c --http-user=xxx --http-password=xxx https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2

# aria2c --ftp-user=xxx --ftp-password=xxx ftp://ftp.gnu.org/gnu/wget/wget-1.17.tar.gz

```

### 13) 阅读更多关于 aria2

如果你希望了解了解更多选项 —— 它们同时适用于 wget，可以输入下面的命令行在你自己的终端获取详细信息：

```
# man aria2c
or
# aria2c --help

```

谢谢欣赏 …）

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/aria2-command-line-download-utility-tool/

作者：[MAGESH MARUTHAMUTHU][a]
译者：[yangmingming](https://github.com/yangmingming)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:http://www.2daygeek.com/aria2-command-line-download-utility-tool/
[2]:http://www.2daygeek.com/aria2-command-line-download-utility-tool/
[3]:http://www.2daygeek.com/install-uget-download-manager-on-ubuntu-centos-debian-fedora-mint-rhel-opensuse/
[4]:https://aria2.github.io/
