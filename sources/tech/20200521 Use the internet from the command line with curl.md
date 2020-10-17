[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use the internet from the command line with curl)
[#]: via: (https://opensource.com/article/20/5/curl-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Use the internet from the command line with curl
从命令行通过 curl 访问互联网
======
Download our new curl cheat sheet. Curl is a fast and efficient way to
pull the information you need from the internet without using a
graphical interface.
对于从互联网上获取里所需的信息，在不使用图形界面的情况下，curl 是一种快速有效的方法。

![Cheat Sheet cover image][1]

Curl is commonly considered a non-interactive web browser. That means it's able to pull information from the internet and display it in your terminal or save it to a file. This is literally what web browsers, such as Firefox or Chromium, do except they _render_ the information by default, while curl downloads and displays raw information. In reality, the curl command does much more and has the ability to transfer data to or from a server using one of many supported protocols, including HTTP, FTP, SFTP, IMAP, POP3, LDAP, SMB, SMTP, and many more. It's a useful tool for the average terminal user, a vital convenience for the sysadmin, and a quality assurance tool for microservices and cloud developers.
Curl 通常被认为是非交互式 Web 浏览器。这意味着它能够从互联网上获取信息并在你的终端中显示或将其保存到文件中。从字面上看，这是 Web 浏览器（例如 Firefox 或 Chromium）所做的工作，除了默认情况下会渲染信息，而 curl 下载并显示原始信息。实际上，curl 命令可以做更多的事情，并且具有使用多种受支持的协议之一向服务器传输数据或从服务器传输数据的能力，这些协议包括 HTTP、FTP、SFTP、IMAP、POP3、LDAP、SMB、SMTP 等。对于普通终端用户来说，这是一个有用的工具，对于系统管理员，这是至关重要的便利，对于微服务和云开发人员，它是质量保证工具。

Curl is designed to work without user interaction, so unlike Firefox, you must think about your interaction with online data from start to finish. For instance, if you want to view a web page in Firefox, you launch a Firefox window. After Firefox is open, you type the website you want to visit into the URL field or a search engine. Then you navigate to the site and click on the page you want to see.
Curl 被设计为在没有用户交互的情况下工作，因此与 Firefox 不同，你必须从头到尾考虑与在线数据的交互。例如，如果想要在 Firefox 中查看网页，你需要启动 Firefox 窗口。打开 Firefox 后，在地址栏或搜索引擎中输入要访问的网站。然后，导航该站点，然后单击要查看的页面。

The same concepts apply to curl, except you do it all at once: you launch curl at the same time you feed it the internet location you want and tell it whether you want to the data to be saved in your terminal or to a file. The complexity increases when you have to interact with a site that requires authentication or with an API, but once you learn the **curl** command syntax, it becomes second nature. To help you get the hang of it, we collected the pertinent syntax information in a handy [cheat sheet][2].
对于 curl 来说也是如此，不同之处在于你需要一次执行所有操作：在启动 curl 的同时提供需要访问的 Internet 位置，并告诉它是否要将数据保存在终端或文件中。当你必须与需要身份验证的网站或 API 进行交互时，复杂性会增加，但是一旦你学习了 **curl** 命令语法，它便成为了第二本性。为了帮助你掌握它，我们在方便的[备忘单][2]中收集了相关的语法信息。

### 使用 curl 下载文件

You can download a file with the **curl** command by providing a link to a specific URL. If you provide a URL that defaults to **index.html**, then the index page is downloaded, and the file you downloaded is displayed on your terminal screen. You can pipe the output to less or tail or any other command:
你可以通过提供指向特定 URL 的链接来使用 **curl** 命令下载文件。如果你提供的 URL 默认为 **index.html**，那么将下载此页面，并且下载的文件将显示在终端屏幕上。你可以将数据通过管道传递到 less、tail 或任何其它命令：
```
$ curl "<http://example.com>" | tail -n 4
    &lt;h1&gt;Example Domain&lt;/h1&gt;
    &lt;p&gt;This domain is for use in illustrative examples in documents. You may use this domain in literature without prior coordination or asking for permission.&lt;/p&gt;
    &lt;p&gt;&lt;a href="[https://www.iana.org/domains/example"\&gt;More][3] information...&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;&lt;/body&gt;&lt;/html&gt;
```

Because some URLs contain special characters that your shell normally interprets, it's safest to surround your URL in quotation marks.
由于某些 URL 包含特殊字符，shell 通常会将其解释，因此用引号将 URL 包起来是最安全的。

Some files don't translate well to being displayed in a terminal. You can use the **\--remote-name** option to cause the file to be saved according to what it's called on the server:
某些文件在终端中无法很好的转换显示。你可以使用 **\--remote-name** 选项使文件根据服务器上的调用进行保存：
```
$ curl --remote-name "<https://example.com/linux-distro.iso>"
$ ls
linux-distro.iso
```

Alternatively, you can use the **\--output** option to name your download whatever you want:
另外，你可以使用 **\--output** 选项来命名你想要下载的内容：

```
curl "http://example.com/foo.html" --output bar.html
```

### List contents of a remote directory with curl
### 使用 curl 列出带有远程目录的内容

Because curl is non-interactive, it's difficult to browse a page for downloadable elements. Provided that the remote server you're connecting to allows it, you can use **curl** to list the contents of a directory:
因为 curl 是非交互式的，所以很难浏览页面上的可下载元素。如果你要连接的远程服务器允许，可以使用 **curl** 来列出目录的内容：

```
$ curl --list-only "https://example.com/foo/"
```

### Continue a partial download
### 继续部分下载

If you're downloading a very large file, you might find that you have to interrupt the download. Curl is intelligent enough to determine where you left off and continue the download. That means the next time you're downloading a 4GB Linux distribution ISO and something goes wrong, you never have to go back to the start. The syntax for **\--continue-at** is a little unusual: if you know the byte count where your download was interrupted, you can provide it; otherwise, you can use a lone dash (**-**) to tell curl to detect it automatically:
如果要下载很大的文件，可能会发现必须中断下载。Curl 足够智能，可以确定你从何处中断并继续下载。这意味着下一次你下载 4GB 的 Linux 发行版 ISO 出现问题时，你无需重新开始。**\--continue-at** 的语法有点不寻常：如果你知道下载中断的字节数，则可以提供。否则，你可以使用单破折号（**-**）指示 curl 自动检测：

```
$ curl --remote-name --continue-at - "https://example.com/linux-distro.iso"
```

### Download a sequence of files
### 下载文件序列

If you need to download several files—rather than just one big file—curl can help with that. Assuming you know the location and file-name pattern of the files you want to download, you can use curl's sequencing notation: the start and end point between a range of integers, in brackets. For the output filename, use **#1** to indicate the first variable:
如果你需要下载多个文件而不是一个大文件，curl 可以帮助你解决这个问题。假设你知道要下载的文件的位置和文件名模式，则可以使用 curl 的排序符合：括号中整数范围内的起点和终点。对于输出文件名，使用 **#1** 表示第一个变量：

```
$ curl "https://example.com/file_[1-4].webp" --output "file_#1.webp"
```

If you need to use another variable to represent another sequence, denote each variable in the order it appears in the command. For example, in this command, **#1** refers to the directories **images_000** through **images_009**, while **#2** refers to the files **file_1.webp** through **file_4.webp**:
如果你需要使用另一个变量来表示另一个序列，按照每个变量在命令中出现的顺序表示每个变量。例如，在此命令中，**#1** 指目录 **images_000** 到 **images_009**，而 **#2** 指目录 **file_1.webp** 至 **file_4.webp**。

```
$ curl "<https://example.com/images\_00\[0-9\]/file\_\[1-4\].webp>" \
\--output "file_#1-#2.webp"
```

### Download all PNG files from a site
### 从站点下载所有 PNG 文件

You can do some rudimentary web scraping to find what you want to download, too, using only **curl** and **grep**. For instance, say you need to download all images associated with a web page you're archiving. First, download the page referencing the images. Pipe the page to grep with a search for the image type you're targeting (PNG in this example). Finally, create a **while** loop to construct a download URL and to save the files to your computer:
你也可以仅使用 **curl** 和 **grep** 进行一些基本的 Web 抓取操作，找到想要下载的呢内容。例如，假设你需要下载与要归档的网页关联的所有图像。首先，下载引用图像的页面。搜索所需的图片类型（在此示例中为 PNG），将页面通过管道传递到 grep。最后，创建 **while** 循环以构造下载 URL 并将文件保存到你的计算机：
```
$ curl <https://example.com> |\
grep --only-matching 'src="[^"]*.[png]"' |\
cut -d\" -f2 |\
while read i; do \
curl <https://example.com/"${i}>" -o "${i##*/}"; \
done
```

This is just an example, but it demonstrates how flexible curl can be when combined with a Unix pipe and some clever, but basic, parsing.
这只是一个例子，但它展示了与 Unix 管道和一些聪明但基本的解析结合使用时，curl 的灵活性。
### Fetch HTML headers
### 获取 HTML 标头

Protocols used for data exchange have a lot of metadata embedded in the packets that computers send to communicate. HTTP headers are components of the initial portion of data. It can be helpful to view these headers (especially the response code) when troubleshooting your connection to a site:
用于数据交换的协议在计算机发送进行通信的数据包中嵌入了许多元数据。HTTP 标头是数据初始部分的组成部分。在对站点连接进行故障排除时，查看以下标头（尤其是响应代码）可能会有所帮助：

```
curl --head "<https://example.com>"
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

### Fail quickly
### 快速失败

A 200 response is the usual HTTP indicator of success, so it's what you usually expect when you contact a server. The famous 404 response indicates that a page can't be found, and 500 means there was a server error.
响应 200 通常是 HTTP 成功的指示，因此这是你与服务器联系时通常期望的结果。著名的 404 响应表明找不到页面，而 500 则表明存在服务器错误。

To see what errors are happening during negotiation, add the **\--show-error** flag:
要查看协商过程中发生了什么错误，添加 **\--shou-error** 标志：
```
`$ curl --head --show-error "http://opensource.ga"`
```

These can be difficult for you to fix unless you have access to the server you're contacting, but curl generally tries its best to resolve the location you point it to. Sometimes when testing things over a network, seemingly endless retries just waste time, so you can force curl to exit upon failure quickly with the **\--fail-early** option:
除非你可以访问要连接的服务器，否则这些问题将很难修复，但是 curl 通常会尽力解决你指向的服务器的位置。有时，当通过网络进行测试时，似乎无休止的重试只会浪费时间，因此你可以使用 **\--fail-early** 选项强制 curl 在出现故障时迅速退出：
```
curl --fail-early "http://opensource.ga"
```

### Redirect query as specified by a 3xx response
### 由 3xx 响应指定的重定向查询

The 300 series of responses, however, are more flexible. Specifically, the 301 response means that a URL has been moved permanently to a different location. It's a common way for a website admin to relocate content while leaving a "trail" so people visiting the old location can still find it. Curl doesn't follow a 301 redirect by default, but you can make it continue on to a 301 destination by using the **\--location** option:
300 这个系列的响应更加灵活。具体而言，301 响应表示该 URL 已被永久移动到其它位置。。这是网站管理员在离开“足迹”的同时重新定位内容的一种常见方法，因此访问旧位置的人们仍然可以找到它。默认情况下，Curl 不遵循 301 重定向，当你可以使用 **\--localtion** 选项使其继续进入 301 指向的目标：
```
$ curl "<https://iana.org>" | grep title
&lt;title&gt;301 Moved Permanently&lt;/title&gt;
$ curl --location "<https://iana.org>"
&lt;title&gt;Internet Assigned Numbers Authority&lt;/title&gt;
```

### Expand a shortened URL
### 扩展缩短的 URL

The **\--location** option is useful when you want to look at shortened URLs before visiting them. Shortened URLs can be useful for social networks with character limits (of course, this may not be an issue if you use a [modern and open source social network][4]) or for print media in which users can't just copy and paste a long URL. However, they can also be a little dangerous because their destination is, by nature, concealed. By combining the **\--head** option to view just the HTTP headers and the **\--location** option to unravel the final destination of a URL, you can peek into a shortened URL without loading the full resource:
如果要在访问缩短的 URL 之前先查看它们，则 **\--location** 相信很有用。缩短的 URL 对于有字符限制的社交网络很有用（当然，如果使用[现代和开放源代码的社交网络][4]，这可能不是问题），或者对于用户不能仅复制和粘贴长地址。但是，它们也可能有点危险，因为其目的地本质上是隐藏的。通过结合使用 **\--head** 选项仅查看 HTTP 标头和 **\--location** 选项以解开 URL 的最终目的地，你可以窥视缩短的 URL 而无需加载完整的资源：
```
$ curl --head --location \
"<https://bit.ly/2yDyS4T>"
```

### [Download our curl cheat sheet][2]

Once you practice thinking about the process of exploring the web as a single command, curl becomes a fast and efficient way to pull the information you need from the internet without bothering with a graphical interface. To help you build it into your usual workflow, we've created a [curl cheat sheet][2] with common curl uses and syntax, including an overview of using it to query an API.
一旦你考虑了一个目录就可以浏览网络的过程，curl 就成为一种快速有效的方式，可以从 Internet 上获取所需的信息，而无需理会图形界面。为了帮助你将其构建到常规工作流程中，我们创建了一个 [curl 备忘单][2]，其中包含常见的 curl 使用和语法，包括使用它查询 API 的概述。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/curl-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP (Cheat Sheet cover image)
[2]: https://opensource.com/downloads/curl-command-cheat-sheet
[3]: https://www.iana.org/domains/example"\>More
[4]: https://opensource.com/article/17/4/guide-to-mastodon
