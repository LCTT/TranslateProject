[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12772-1.html)
[#]: subject: (Use the internet from the command line with curl)
[#]: via: (https://opensource.com/article/20/5/curl-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 curl 从命令行访问互联网
======

> 下载我们整理的 curl 备忘录。要在不使用图形界面的情况下从互联网上获取所需的信息，curl 是一种快速有效的方法。

![](https://img.linux.net.cn/data/attachment/album/202010/31/000543n032ud499yy4d94v.jpg)

`curl` 通常被视作一款非交互式 Web 浏览器，这意味着它能够从互联网上获取信息，并在你的终端中显示，或将其保存到文件中。从表面看，这是 Web 浏览器，类似 Firefox 或 Chromium 所做的工作，只是它们默认情况下会*渲染*信息，而 `curl` 会下载并显示原始信息。实际上，`curl` 命令可以做更多的事情，并且能够使用多种协议与服务器进行双向传输数据，这些协议包括 HTTP、FTP、SFTP、IMAP、POP3、LDAP、SMB、SMTP 等。对于普通终端用户来说，这是一个有用的工具；而对于系统管理员，这非常便捷；对于微服务和云开发人员来说，它是一个质量保证工具。

`curl` 被设计为在没有用户交互的情况下工作，因此与 Firefox 不同，你必须从头到尾考虑与在线数据的交互。例如，如果想要在 Firefox 中查看网页，你需要启动 Firefox 窗口。打开 Firefox 后，在地址栏或搜索引擎中输入要访问的网站。然后，导航到网站，然后单击要查看的页面。

对于 `curl` 来说也是如此，不同之处在于你需要一次执行所有操作：在启动 `curl` 的同时提供需要访问的互联网地址，并告诉它是否要将数据保存在终端或文件中。当你必须与需要身份验证的网站或 API 进行交互时，会变得有点复杂，但是一旦你学习了 `curl` 命令语法，它就会变得自然而然。为了帮助你掌握它，我们在一个方便的[备忘录][2]中收集了相关的语法信息。

### 使用 curl 下载文件

你可以通过提供指向特定 URL 的链接来使用 `curl` 命令下载文件。如果你提供的 URL 默认为 `index.html`，那么将下载此页面，并将下载的文件显示在终端屏幕上。你可以将数据通过管道传递到 `less`、`tail` 或任何其它命令：

```
$ curl "http://example.com" | tail -n 4
    <h1>Example Domain</h1>
    <p>This domain is for use in illustrative examples in documents. You may use this domain in literature without prior coordination or asking for permission.</p>
    <p><a href="https://www.iana.org/domains/example">More information...</a></p>
</div></body></html>
```

由于某些 URL 包含特殊字符，shell 通常会将其解释，因此最安全的做法用引号将 URL 包起来。

某些文件无法很好的在终端中转换显示。你可以使用 `--remote-name` 选项使文件根据服务器上的命名进行保存：

```
$ curl --remote-name "https://example.com/linux-distro.iso"
$ ls
linux-distro.iso
```

或者，你可以使用 `--output` 选项来命名你想要下载的内容：

```
curl "http://example.com/foo.html" --output bar.html
```

### 使用 curl 列出带有远程目录的内容

因为 `curl` 不是交互式的，所以很难浏览页面上的可下载元素。如果你要连接的远程服务器允许，可以使用 `curl` 来列出目录的内容：

```
$ curl --list-only "https://example.com/foo/"
```

### 继续中断下载

如果你正在下载一个非常大的文件，你可能会发现有时候必须中断下载。`curl` 非常智能，可以确定下载从何处中断并继续下载。这意味着，下一次当你下载一个 4GB 的 Linux 发行版的 ISO 出现问题时，就不必重新开始了。`--continue-at` 的语法有点不寻常：如果你知道下载中断时的字节数，你可以提供给 `curl`；否则，你可以使用单独的一个破折号（`-`）指示 curl 自动检测：

```
$ curl --remote-name --continue-at - "https://example.com/linux-distro.iso"
```

### 下载文件序列

如果你需要下载多个文件而不是一个大文件，那么 `curl` 可以帮助你解决这个问题。假设你知道要下载的文件的位置和文件名模式，则可以使用 `curl` 的序列标记：中括号里是整数范围的起点和终点。对于输出文件名，使用 `#1` 表示第一个变量：

```
$ curl "https://example.com/file_[1-4].webp" --output "file_#1.webp"
```

如果你需要使用其它变量来表示另一个序列，按照每个变量在命令中出现的顺序表示它们。例如，在这个命令中，`#1` 指目录 `images_000` 到 `images_009`，而 `#2` 指目录 `file_1.webp` 至 `file_4.webp`：

```
$ curl "https://example.com/images_00[0-9]/file_[1-4].webp" --output "file_#1-#2.webp"
```

### 从站点下载所有 PNG 文件

你也可以仅使用 `curl` 和 `grep` 进行一些基本的 Web 抓取操作，以找到想要下载的内容。例如，假设你需要下载与正在归档网页关联的所有图像，首先，下载引用了图像的页面。将页面内通过管道传输到 `grep`，搜索所需的图片类型（在此示例中为 PNG）。最后，创建一个 `while` 循环来构造下载 URL，并将文件保存到你的计算机：

```
$ curl https://example.com |\
grep --only-matching 'src="[^"]*.[png]"' |\
cut -d\" -f2 |\
while read i; do \
curl https://example.com/"${i}" -o "${i##*/}"; \
done
```

这只是一个示例，但它展示了 `curl` 与 Unix 管道和一些基本而巧妙的解析结合使用时是多么的灵活。

### 获取 HTML 头

用于数据交换的协议在计算机发送通信的数据包中嵌入了大量元数据。HTTP 头是数据初始部分的组件。在连接一个网站出现问题时，查看这些报文头（尤其是响应码）会有所帮助：

```
curl --head "https://example.com"
HTTP/2 200
accept-ranges: bytes
age: 485487
cache-control: max-age=604800
content-type: text/html; charset=UTF-8
date: Sun, 26 Apr 2020 09:02:09 GMT
etag: "3147526947"
expires: Sun, 03 May 2020 09:02:09 GMT
last-modified: Thu, 17 Oct 2019 07:18:26 GMT
server: ECS (sjc/4E76)
x-cache: HIT
content-length: 1256
```

### 快速失败

响应 200 通常是 HTTP 成功指示符，这是你与服务器连接时通常期望的结果。著名的 404 响应表示找不到页面，而 500 则表示服务器在处理请求时出现了错误。

要查看协商过程中发生了什么错误，添加 `--show-error` 选项：

```
$ curl --head --show-error "http://opensource.ga"
```

除非你可以访问要连接的服务器，否则这些问题将很难解决，但是 `curl` 通常会尽力连接你指定的地址。有时在网络上进行测试时，无休止的重试似乎只会浪费时间，因此你可以使用 `--fail-early` 选项来强制 `curl` 在失败时迅速退出：

```
curl --fail-early "http://opensource.ga"
```

### 由 3xx 响应指定的重定向查询

300 这个系列的响应更加灵活。具体来说，301 响应意味着一个 URL 已被永久移动到其它位置。对于网站管理员来说，重新定位内容并留下“痕迹”是一种常见的方式，这样访问旧地址的人们仍然可以找到它。默认情况下，`curl` 不会进行 301 重定向，但你可以使用 `--localtion` 选项使其继续进入 301 响应指向的目标：

```
$ curl "https://iana.org" | grep title
<title>301 Moved Permanently</title>
$ curl --location "https://iana.org"
<title>Internet Assigned Numbers Authority</title>
```

### 展开短网址

如果你想要在访问短网址之前先查看它们，那么 `--location` 选项非常有用。短网址对于有字符限制的社交网络（当然，如果你使用[现代和开源的社交网络][4]的话，这可能不是问题），或者对于用户不能复制粘贴长地址的印刷媒体来说是有用处的。但是，它们也可能存在风险，因为其目的地址本质上是隐藏的。通过结合使用 `--head` 选项仅查看 HTTP 头，`--location` 选项可以查看一个 URL 的最终地址，你可以查看一个短网址而无需加载其完整的资源：

```
$ curl --head --location "<https://bit.ly/2yDyS4T>"
```

### 下载我们的 curl 备忘录

一旦你开始考虑了将探索 web 由一条命令来完成，那么 `curl` 就成为一种快速有效的方式，可以从互联网上获取所需的信息，而无需麻烦图形界面。为了帮助你适应到工作流中，我们创建了一个 [curl 备忘录][2]，它包含常见的 `curl` 用法和语法，包括使用它查询 API 的概述。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/curl-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP (Cheat Sheet cover image)
[2]: https://opensource.com/downloads/curl-command-cheat-sheet
[3]: https://www.iana.org/domains/example"\>More
[4]: https://opensource.com/article/17/4/guide-to-mastodon
