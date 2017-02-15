4 个 Linux 下最好的命令行下载管理器/加速器
============================================================

我们经常由于不同需求使用下载管理器从互联网下载文件，它给我和其他人提供了很多帮助。我们都想要一个超级快速的下载管理器来完成下载尽可能多的任务，以便我们可以节省时间来进一步地工作。有很多可以加速下载的下载管理器和加速器可用（图形化界面和命令行界面）。

所有的下载工具做着同样的任务，但它们的处理方式和功能是不同的，比如，单线程和多线程、交互和非交互。 在这里，我们将列出 4 个最好的我们日常工作使用的命令行下载加速器。

#### #1 Aria2

[Aria2][1] 是一个用于 Linux、Windows 和 Mac OSX 的轻量级、多协议和多源的命令行下载管理器/实用程序。它支持 HTTP/HTTPS、FTP、SFTP、BitTorrent 和 Metalink。aria2 可以通过内置的 JSON-RPC 和 XML-RPC 接口操作。

它支持多线程，可以使用多个源或协议下载文件，确实可以加速并尽可能多的完成下载。

它非常轻量级，不需要太多的内存和 CPU。我们可以使用它作为 BitTorrent 客户端，因为它有所有你想要的 BitTorrent 客户端的功能。

#### Aria2 功能

* 支持 HTTP/HTTPS GET 方式
* 支持 HTTP 代理
* 支持 HTTP BASIC 认证
* 支持 HTTP 代理认证
* 支持 FTP （主动、被动模式）
* 通过 HTTP 代理的 FTP（GET 命令或隧道）
* 分段下载
* 支持 Cookie
* 它可以作为守护进程运行。
* 支持 BitTorrent 协议和 fast 扩展。
* 在含有多个文件的 torrent 中的选择性下载
* 支持 Metalink 版本 3.0 （HTTP/FTP/BitTorrent）。
* 限制下载/上传速度

有关 Aria2 的进一步用法，请参阅以下文章：[如何在 Linux 中安装和使用 Aria2][2]。

#### #2 Axel

[Axel][3] 是一个轻量级下载程序，它如其他加速器那样做着同样的事情。它可以为一个文件打开多个连接，每个连接下载单独的文件片段以更快地完成下载。

Axel 支持 HTTP、HTTPS、FTP 和 FTPS 协议。它也可以使用多个镜像站点来下载单个文件。 所以，Axel 可以为下载加速高达 40％（大约，我个人认为）。 它非常轻量级，因为没有依赖，而且使用非常少的 CPU 和内存。

Axel 使用一个单线程将所有数据直接下载到目标文件。

注意：没有可以在单条命令中下载两个文件的选项。

有关 Axel 的更多使用，请参阅以下文章：[如何在 Linux 中安装和使用 Axel][4]。

#### #3 Wget

[wget][5]（以前称为 Geturl）是一个免费的、开源的命令行下载程序，它使用 HTTP、HTTPS 和 FTP 这些最广泛使用的 Internet 协议来获取文件。它是一个非交互式命令行工具，其名字是意思是从万维网中获取文件。

相比其它工具，wget 将下载处理得相当好，即使它不支持多线程以及包括后台工作、递归下载、多个文件下载、恢复下载、非交互式下载和大文件下载在内的功能。

默认情况下，所有的 Linux 发行版都包含 wget，所以我们可以从官方仓库轻松安装，也可以安装到 windows 和 Mac 操作系统。

wget 可在慢速或不稳定的网络连接下保持健壮性，如果由于网络问题下载失败，它将继续重试，直到整个文件下载完成。如果服务器支持重新获取，它将指示服务器从中断的地方继续下载。

#### wget 功能

* 可以使用 REST 和 RANGE 恢复中止的下载
* 可以使用文件名通配符和递归来对目录进行镜像同步
* 基于 NLS 消息文件，提供许多不同语言支持
* 可选将下载的文档中的绝对链接转换为相对链接，以便下载的文档可以在本地链接到彼此
* 可在大多数类 UNIX 操作系统以及 Microsoft Windows 上运行
* 支持 HTTP 代理
* 支持 HTTP cookie
* 支持持久 HTTP 连接
* 无人值守/后台操作
* 使用本地文件时间戳来确定是否需要在镜像时重新下载文档

有关 wget 的进一步用法，请参阅以下文章：[如何在 Linux 中安装和使用 wget][6]。

#### #4 Curl

[curl][7] 类似于 wget，但是不支持多线程，但令人惊讶的是，与 wget 相比，它的下载速度更快。

curl 是一个向服务器上传或下载的数据传输工具，支持的协议有 DICT、FILE、FTP、FTPS、GOPHER、HTTP、HTTPS、IMAP、IMAPS、LDAP、LDAPS、POP3、POP3S、RTMP、RTSP、SCP、SFTP、SMTP、SMTPS、TELNET 和 TFT 等。

该命令无需用户交互即可工作。此外，curl 支持代理、用户身份验证、FTP 上传、HTTP POST、SSL 连接、Cookie、恢复文件传输、Metalink 等。curl 由 libcurl 为所有相关传输功能提供支持。

如果指定的 URL 没有 `protocol://` 前缀，curl 将尝试猜测你可能需要什么协议。例如，以 “ftp.” 开头的主机名 curl 将假定你要使用 FTP。如果没有找到特定的协议，那么默认为 HTTP。

参考下面的文章来进一步使用 curl：[如何在 Linux 中安装和使用 curl] [8]。

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/best-4-command-line-download-managers-accelerators-for-linux/

作者：[Magesh Maruthamuthu][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:https://aria2.github.io/
[2]:https://linux.cn/article-7982-1.html
[3]:https://axel.alioth.debian.org/
[4]:http://www.2daygeek.com/axel-command-line-downloader-accelerator-for-linux/
[5]:https://www.gnu.org/software/wget/
[6]:https://linux.cn/article-4129-1.html
[7]:https://curl.haxx.se/
[8]:http://www.2daygeek.com/curl-command-line-download-manager/
