在终端上访问网站和下载文件
================================================================================
Linux 命令行工具很牛逼，Linux 命令行以及一些第三方应用让 Linux 变得更牛逼。Linux 命令行工具可以用于下载种子和文件，可以上网冲浪。

![5 Command Line Internet Tools](http://www.tecmint.com/wp-content/uploads/2014/02/Command-Line-Internet-Tools.jpg)

本文推荐的**5个强悍的上网工具**方便实用，是居家旅行的必备物品。

### 1. rTorrent ###

rTorrent 基于文本的 Torrent 客户端，用 C++ 调制而成，我们的目标是高性能！我们可运行在标准的 Linux 发行版中，包括 FreeBSD 和 Mac OS X。

#### 安装 rTorrent ####

    # apt-get install rtorrent    (基于 APT 的系统，如 Debian，Ubuntu)

    # yum install rtorrent        (基于 YUM 的系统，如 RHEL，Fedora)

检查有没有安装成功，运行下面命令试试：

    # rtorrent

![rTorrent Command Line Tool](http://www.tecmint.com/wp-content/uploads/2014/02/rTorrent.jpeg)

#### rTorrent 的用法 ####

下面是 rTorrent 比较常用的功能：

- **CTRL+ q** – 退出 rTorrent。
- **CTRL+ s** – 开始下载。
- **CTRL+ d** – 暂停下载任务，或删除己被暂停的下载任务。
- **CTRL+ k** – 关闭一个正在下载的任务
- **CTRL+ r** – 在开始上传、下载之前，使用 Hash 检查文件，确保文件的完整性。
- **CTRL+ q** – 按再次这个组合键，rTorrent 无条件退出。
- **Left Arrow Key** – 回退到上个页面。
- **Right Arrow Key** – 前进到下个页面。

### 2. Wget ###

**Wget** 是一个 GNU 项目，它的名称参考了 World Wide Web (**WWW**)。Wget 在递归下载方面做得很好，你可以将整个网站的内容都下到本地，然后访问本地的 **HTML** 文件。它支持多种操作系统：**Windows，Mac，Linux**。它支持多种协议，可通过 **HTTP，HTTPS 和 FTP** 下载文件。它可以对整个网站做一个镜像（完全将目标网站的文件下载到本机），支持代理，支持断点传输（即下载可暂停）。

#### 安装 Wget ####

**Wget** 也是一个 GNU 项目，在标准 Linux 发行版中都有内置，就是说你不用下载安装它就可以使用了。万一，它没有被默认安装，你也可以通过 **APT** 或 **YUM** 安装。

    # apt-get install wget    (基于 APT 的系统，如 Debian，Ubuntu)

    # yum install wget        (基于 YUM 的系统，如 RHEL，Fedora)

#### Wget 的用法 ####

下载一个文件：

    # wget http://www.website-name.com/file

下载整个网站：

    # wget -r http://www.website-name.com

下载指定类型的文件（比如 PDF 和 PNG）：

    # wget -r -A png,pdf http://www.website-name.com

下面是一张 Wget 的截图，我们正在把 **Yahoo.com** 网站整个都镜像下来。

![Wget Command Line File Download](http://www.tecmint.com/wp-content/uploads/2014/02/Wget.jpeg)

关于 wget 的更多用法，参考[Wget 的10个的用法][1]。

### 3. cURL ###

**cURL** 是一个客户端工具，支持多种文件传输协议，比如 **FTP, HTTP, FTPS, TFTP, TELNET, IMAP, POP3** 等等。不像 wget 等工具，cURL 只是一个单纯的下载器，支持 **LDAP, POP3**，支持代理下载，支持断点续传。

#### 安装 cURL ####

大多数发行版都默认安装了 cURL，如果没有，可通过 **apt** 或 **yum** 下载：

    # apt-get install curl    (基于 APT 的系统，如 Debian，Ubuntu)

    # yum install curl        (基于 YUM 的系统，如 RHEL，Fedora)

#### cURL 基本用法 ####

    # curl www.tecmint.com

![Curl Data Download](http://www.tecmint.com/wp-content/uploads/2014/02/Curl.jpeg)

![Curl Download](http://www.tecmint.com/wp-content/uploads/2014/02/Curl-2.jpeg)

### 4. w3m ###

W3m 是基于文本的网页浏览器，使用 GPL 协议，支持 tables, frames, color, SSL 连接，支持内嵌图片，以快速闻名。

#### 安装 w3m ####

W3m 也是大多数发行版的默认配置，也可通过 **apt** 或 **yum** 安装。

    # apt-get install w3m    (基于 APT 的系统，如 Debian，Ubuntu)

    # yum install w3m        (基于 YUM 的系统，如 RHEL，Fedora)

#### w3m 的基本用法 ####

    # w3m www.tecmint.com

![w3m Text Based Web Browser](http://www.tecmint.com/wp-content/uploads/2014/02/w3m.jpeg)

### 5. Elinks ###

**Elinks** 是一个免费的基于本文的网页浏览器，支持 **HTTP**，支持 **HTTP Cookie**，支持 **Perl** 和 **Ruby** 写的脚本，支持网页标签，支持鼠标，可彩色显示页面，支持 **HTTP, FTP，SMB，IPv4，IPv6**。

#### 安装 Elinks ####

大多数发行版已经默认安装了 Elinks，如果没有，通过 **apt** 或 **yum** 安装。

    # apt-get install elinks    (基于 APT 的系统，如 Debian，Ubuntu)

    # yum install elinks        (基于 YUM 的系统，如 RHEL，Fedora)

#### Elinks的基本用法 ####

	elinks www.tecmint.com

![Elinks Command Line Web Browsing](http://www.tecmint.com/wp-content/uploads/2014/02/Elinks.jpeg)

--------------------------------------------------------------------------------

via: http://www.tecmint.com/command-line-tools-for-downloading-file-and-browsing-websites/

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/10-wget-command-examples-in-linux/
