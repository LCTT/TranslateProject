[#]: subject: "7 handy tricks for using the Linux wget command"
[#]: via: "https://opensource.com/article/21/10/linux-wget-command"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "zengyi1001"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14007-1.html"

七个使用 wget 命令的技巧
======

> 用你的 Linux 终端中从互联网上下载文件。

![](https://img.linux.net.cn/data/attachment/album/202111/22/102927pjuji5juxzuikkg6.jpg)

`wget` 是一个下载网页文件的免费工具。它将互联网上的数据保存到一个文件或展示在终端上。实际上这也是像 Firefox 或 Chromium 这样的网页浏览器的工作原理。有一个区别是，网页浏览器默认将网页 <ruby>渲染<rt>render</rt></ruby>在图形窗口中，并且通常需要用户主动来操作它们。而 `wget` 工具是无交互的使用方式，也就是说你可以使用脚本或定期使用 `wget` 来下载文件，不论你人是否在电脑面前。

### 使用 wget 下载文件

你可以通过提供一个特定 URL 的链接，用 `wget` 下载一个文件。如果你提供一个默认为 `index.html` 的 URL，那么就会下载该索引页。默认情况下，文件会被下载到你当前的工作目录，并保持原来的名字。

```
$ wget http://example.com
--2021-09-20 17:23:47-- http://example.com/
Resolving example.com... 93.184.216.34, 2606:2800:220:1:248:1893:25c8:1946
Connecting to example.com|93.184.216.34|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1256 (1.2K) [text/html]
Saving to: 'index.html'
```

通过使用 `--output-document` 和 `-` 符号，你可以指示 `wget` 将数据发送到 <ruby>标准输出<rt>stdout</rt></ruby>：

```
$ wget http://example.com --output-document - | head -n4
<!doctype html>
<html>
<head>
   <title>Example Domain</title>
```

你可以使用 `--output-document` 选项（简写为 `-O`）将下载文件命名为任何你想要的名称：

```
$ wget http://example.com --output-document foo.html
```

### 断点续传

如果你正在下载一个超大文件，你可能会遇到中断下载的情况。使用 `--continue`（简写为 `-c`），`wget` 可以确定从文件的哪个位置开始继续下载。也就是说，下次你在下载一个 4 GB 的 Linux 发行版 ISO 时，如果出现了错误导致中断，你不必重新从头开始。

```
$ wget --continue https://example.com/linux-distro.iso
```

### 下载一系列的文件

如果你要下载的不是单个大文件，而是一系列的文件，`wget` 也能提供很好的帮助。假如你知道要下载文件的路径以及文件名的通用范式，你可以使用 Bash 语法指示一个数字范围的起始和终点来表示这一系列文件名:

```
$ wget http://example.com/file_{1..4}.webp
```

### 镜像整个站点

使用 `--mirror` 选项你可以下载整个站点，包括它的目录结构。这与使用选项 `--recursive --level inf --timestamping --no-remove-listing` 的效果是一样的，该选项表明可以进行无限制的递归，得到你指定域下的所有内容。但你也可能会得到比预期多得多的内容，这取决于站点本身的老旧程度。

如果你正在使用 `wget` 来打包整个站点，选项 `--no-cookies --page-requisites --convert-links` 非常有用，它可以确保打包的站点是全新且完整的，站点副本或多或少是<ruby>自包含的<rt>self-contained</rt></ruby>。

### 修改 HTML 标头

在计算机发送的通信报文里含有大量用于数据交换的<ruby>元数据<rt>metadata</rt></ruby>。HTTP 标头是初始数据的组成部分。当你浏览某个站点时，你的浏览器会发送 HTTP 请求标头。使用 `--debug` 选项可以查看 `wget` 为每个请求发送了什么样的标头信息:

```
$ wget --debug example.com
---request begin---
GET / HTTP/1.1
User-Agent: Wget/1.19.5 (linux-gnu)
Accept: */*
Accept-Encoding: identity
Host: example.com
Connection: Keep-Alive

---request end---
```

你可以使用 `--header` 选项修改请求标头。实际上经常使用这种方式来模仿某特定浏览器，来测试或兼容某些编码糟糕、只能与特定代理通信的站点。  

让请求被识别为来自 Windows 系统的 Microsoft Edge：

```
$ wget --debug --header="User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36 Edg/91.0.864.59" http://example.com
```

你也可以假装为某个移动设备：

```
$ wget --debug --header="User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 13_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Mobile/15E148 Safari/604.1" http://example.com
```

### 查看响应标头

与浏览器发送请求标头的方式一样，响应也包含有标头信息。你可以使用 `--debug` 选项来查看响应中的标头信息：

```
$ wget --debug example.com
[...]
---response begin---
HTTP/1.1 200 OK
Accept-Ranges: bytes
Age: 188102
Cache-Control: max-age=604800
Content-Type: text/html; charset=UTF-8
Etag: "3147526947"
Server: ECS (sab/574F)
Vary: Accept-Encoding
X-Cache: HIT
Content-Length: 1256

---response end---
200 OK
Registered socket 3 for persistent reuse.
URI content encoding = 'UTF-8'
Length: 1256 (1.2K) [text/html]
Saving to: 'index.html'
```

### 处理 301 响应

200 响应码意味着一切都在预料之中。而 301 响应则表示 URL 已经被永久迁移到了另外一个地方。这是站点管理员的一种常用手段，内容迁移后，为访问旧地址的用户留下寻找新地址的“线索”。`wget` 会默认跟随<ruby>重定向<rt>redirect</rt></ruby>，这也是大部分情况下用户所希望的。

当然，你可以使用 `--max-redirect` 选项，用于控制 `wget` 默认处理 301 响应重定向的次数。设置为 `0` 意味着不会自动重定向到新的地址:

```
$ wget --max-redirect 0 http://iana.org
--2021-09-21 11:01:35-- http://iana.org/
Resolving iana.org... 192.0.43.8, 2001:500:88:200::8
Connecting to iana.org|192.0.43.8|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://www.iana.org/ [following]
0 redirections exceeded.
```

同时，你也可以设置为其他的数值来控制 `wget` 能重定向多少次。

### 展开 URL 缩写

使用`--max-redirect` 选项用于在实际访问之前查看 <ruby>URL 缩写<rt>shortened URL</rt></ruby>非常有用。缩写 URL 可用于用户无法完整拷贝和粘贴一个长 URL 时的<ruby>印刷媒体<rt>print media</rt></ruby>，或是具有字数限制的社交网络（在类似 [Mastondon][2] 这种现代开源的社交网络上这并不是一个问题）。这种缩写具有一定的风险，因为本质上这些目的地是隐藏的。组合使用 `--head` 选项和 `--location` 选项来来查看 HTTP 头部并解开最终的目的地，你可以在不加载整个资源的情况下查看到缩写 URL 的完整内容：

```
$ wget --max-redirect 0 "https://bit.ly/2yDyS4T"
--2021-09-21 11:32:04-- https://bit.ly/2yDyS4T
Resolving bit.ly... 67.199.248.10, 67.199.248.11
Connecting to bit.ly|67.199.248.10|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://example.com/ [following]
0 redirections exceeded.
```

从 `Location` 开始的倒数第二行输出，展示了实际的目的地。

### 使用 wget

若你开始考虑使用单个命令来实现整个网站访问的过程，`wget` 可以快速高效的帮你获取互联网上的信息，而不用在图形界面上耗费精力。为了帮你将它构造在你平常的工作流中，我们创建了一个 `wget` 常用使用方式和语法清单，包括使用它来查询 API 的概述。[在这里下载 Linux wget 速查表][3]。

--------------------------------------------------------------------------------

来源: https://opensource.com/article/21/10/linux-wget-command

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[zengyi1001](https://github.com/zengyi1001)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://opensource.com/article/17/4/guide-to-mastodon
[3]: https://opensource.com/downloads/linux-wget-cheat-sheet
