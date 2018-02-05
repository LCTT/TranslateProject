动态端口转发：安装带有 SSH 的 SOCKS 服务器
=================

在上一篇文章（[通过 SSH 实现 TCP / IP 隧道（端口转发）：使用 OpenSSH 可能的 8 种场景][17]）中，我们看到了处理端口转发的所有可能情况，不过那只是静态端口转发。也就是说，我们只介绍了通过 SSH 连接来访问另一个系统的端口的情况。

在那篇文章中，我们未涉及动态端口转发，此外一些读者没看过该文章，本篇文章中将尝试补充完整。

当我们谈论使用 SSH 进行动态端口转发时，我们说的是将 SSH 服务器转换为 [SOCKS][2] 服务器。那么什么是 SOCKS 服务器？

你知道 [Web 代理][3]是用来做什么的吗？答案可能是肯定的，因为很多公司都在使用它。它是一个直接连接到互联网的系统，允许没有互联网访问的[内部网][4]客户端让其浏览器通过代理来（尽管也有[透明代理][5]）浏览网页。Web 代理除了允许输出到 Internet 之外，还可以缓存页面、图像等。已经由某客户端下载的资源，另一个客户端不必再下载它们。此外，它还可以过滤内容并监视用户的活动。当然了，它的基本功能是转发 HTTP 和 HTTPS 流量。

一个 SOCKS 服务器提供的服务类似于公司内部网络提供的代理服务器服务，但不限于 HTTP/HTTPS，它还允许转发任何 TCP/IP 流量（SOCKS 5 也支持 UDP）。

例如，假设我们希望在一个没有直接连接到互联网的内部网上通过 Thunderbird 使用 POP3 、 ICMP 和 SMTP 的邮件服务。如果我们只有一个 web 代理可以用，我们可以使用的唯一的简单方式是使用某个 webmail（也可以使用 [Thunderbird 的 Webmail 扩展][6]）。我们还可以通过 [HTTP 隧道][7]来起到代理的用途。但最简单的方式是在网络中设置一个 SOCKS 服务器，它可以让我们使用 POP3、ICMP 和 SMTP，而不会造成任何的不便。

虽然有很多软件可以配置非常专业的 SOCKS 服务器，但用 OpenSSH 设置一个只需要简单的一条命令：

```
Clientessh $ ssh -D 1080 user@servidorssh
```

或者我们可以改进一下：

```
Clientessh $ ssh -fN -D 0.0.0.0:1080 user@servidorssh
```

其中：

*   选项 `-D` 类似于选项为 `-L` 和 `-R` 的静态端口转发。像那些一样，我们可以让客户端只监听本地请求或从其他节点到达的请求，具体取决于我们将请求关联到哪个地址：
    ```
    -D [bind_address:] port
    ```
    
    在静态端口转发中可以看到，我们使用选项 `-R` 进行反向端口转发，而动态转发是不可能的。我们只能在 SSH 客户端创建 SOCKS 服务器，而不能在 SSH 服务器端创建。
*   1080 是 SOCKS 服务器的典型端口，正如 8080 是 Web 代理服务器的典型端口一样。
*   选项 `-N` 防止实际启动远程 shell 交互式会话。当我们只用 `ssh` 来建立隧道时很有用。
*   选项 `-f` 会使 `ssh` 停留在后台并将其与当前 shell 分离，以便使该进程成为守护进程。如果没有选项 `-N`（或不指定命令），则不起作用，否则交互式 shell 将与后台进程不兼容。

使用 [PuTTY][8] 也可以非常简单地进行端口重定向。与 `ssh -D 0.0.0.0:1080` 相当的配置如下：

![PuTTY SOCKS](https://wesharethis.com/wp-content/uploads/2017/07/putty_socks.png)

对于通过 SOCKS 服务器访问另一个网络的应用程序，如果应用程序提供了对 SOCKS 服务器的特别支持，就会非常方便（虽然不是必需的），就像浏览器支持使用代理服务器一样。作为一个例子，如 Firefox 或 Internet Explorer 这样的浏览器使用 SOCKS 服务器访问另一个网络的应用程序：

![Firefox SOCKS](https://wesharethis.com/wp-content/uploads/2017/07/firefox_socks.png)

![Internet Explorer SOCKS](https://wesharethis.com/wp-content/uploads/2017/07/internetexplorer_socks.png)

注意：上述截图来自 [IE for Linux][1] ：如果您需要在 Linux 上使用 Internet Explorer，强烈推荐！

然而，最常见的浏览器并不要求 SOCKS 服务器，因为它们通常与代理服务器配合得更好。

不过，Thunderbird 也支持 SOCKS，而且很有用：

![Thunderbird SOCKS](https://wesharethis.com/wp-content/uploads/2017/07/thunderbird_socks.png)

另一个例子：[Spotify][9] 客户端同样支持 SOCKS：

![Spotify SOCKS](https://wesharethis.com/wp-content/uploads/2017/07/spotify_socks.png)

需要关注一下名称解析。有时我们会发现，在目前的网络中，我们无法解析 SOCKS 服务器另一端所要访问的系统的名称。SOCKS 5 还允许我们通过隧道传播 DNS 请求（ 因为 SOCKS 5 允许我们使用 UDP）并将它们发送到另一端：可以指定是本地还是远程解析（或者也可以两者都试试）。支持此功能的应用程序也必须考虑到这一点。例如，Firefox 具有参数 `network.proxy.socks_remote_dns`（在 `about:config` 中），允许我们指定远程解析。而默认情况下，它在本地解析。

Thunderbird 也支持参数 `network.proxy.socks_remote_dns`，但由于没有地址栏来放置 `about:config`，我们需要改变它，就像在 [MozillaZine:about:config][10] 中读到的，依次点击 工具 → 选项 → 高级 → 常规 → 配置编辑器（按钮）。

没有对 SOCKS 特别支持的应用程序可以被 <ruby>sock 化<rt>socksified</rt></ruby>。这对于使用 TCP/IP 的许多应用程序都没有问题，但并不是全部。“sock 化” 需要加载一个额外的库，它可以检测对 TCP/IP 堆栈的请求，并修改请求，以通过 SOCKS 服务器重定向，从而不需要特别编程来支持 SOCKS 便可以正常通信。

在 Windows 和 [Linux][18] 上都有 “Sock 化工具”。

对于 Windows，我们举个例子，SocksCap 是一种闭源，但对非商业使用免费的产品，我使用了很长时间都十分满意。SocksCap 由一家名为 Permeo 的公司开发，该公司是创建 SOCKS 参考技术的公司。Permeo 被 [Blue Coat][11] 买下后，它[停止了 SocksCap 项目][12]。现在你仍然可以在互联网上找到 `sc32r240.exe` 文件。[FreeCap][13] 也是面向 Windows 的免费代码项目，外观和使用都非常类似于 SocksCap。然而，它工作起来更加糟糕，多年来一直没有缺失维护。看起来，它的作者倾向于推出需要付款的新产品 [WideCap][14]。

这是 SocksCap 的一个界面，可以看到我们 “sock 化” 了的几个应用程序。当我们从这里启动它们时，这些应用程序将通过 SOCKS 服务器访问网络：

![SocksCap](https://wesharethis.com/wp-content/uploads/2017/07/sockscap.png)

在配置对话框中可以看到，如果选择了协议 SOCKS 5，我们可以选择在本地或远程解析名称：

![SocksCap settings](https://wesharethis.com/wp-content/uploads/2017/07/sockscap_settings.png)

在 Linux 上，如同往常一样，对某个远程命令我们都有许多替代方案。在 Debian/Ubuntu 中，命令行：

```
$ Apt-cache search socks
```

的输出会告诉我们很多。

最著名的是 [tsocks][15] 和 [proxychains][16]。它们的工作方式大致相同：只需用它们启动我们想要 “sock 化” 的应用程序就行。使用 `proxychains` 的 `wget` 的例子：

```
$ Proxychains wget http://www.google.com
ProxyChains-3.1 (http://proxychains.sf.net)
--19: 13: 20-- http://www.google.com/
Resolving www.google.com ...
DNS-request | Www.google.com
| S-chain | - <- - 10.23.37.3:1080-<><>-4.2.2.2:53-<><>-OK
| DNS-response | Www.google.com is 72.14.221.147
72.14.221.147
Connecting to www.google.com | 72.14.221.147 |: 80 ...
| S-chain | - <- - 10.23.37.3:1080-<><>-72.14.221.147:80-<><>-OK
Connected.
HTTP request sent, awaiting response ... 200 OK
Length: unspecified [text / html]
Saving to: `index.html '

    [<=>] 6,016 24.0K / s in 0.2s

19:13:21 (24.0 KB / s) - `index.html 'saved [6016]
```

要让它可以工作，我们必须在 `/etc/proxychains.conf` 中指定要使用的代理服务器：

```
[ProxyList]
Socks5 clientessh 1080
```

我们也设置远程进行 DNS 请求：

```
# Proxy DNS requests - no leak for DNS data
Proxy_dns
```

另外，在前面的输出中，我们已经看到了同一个 `proxychains` 的几条信息性的消息， 非 `wget` 的行是标有字符串 `|DNS-request|`、`|S-chain|` 或 `|DNS-response|` 的。如果我们不想看到它们，也可以在配置中进行调整：

```
# Quiet mode (no output from library)
Quiet_mode
```

--------------------------------------------------------------------------------

via: https://wesharethis.com/2017/07/15/dynamic-port-forwarding-mount-socks-server-ssh/

作者：[Ahmad][a]
译者：[firmianay](https://github.com/firmianay)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://wesharethis.com/author/ahmad/
[1]:https://wesharethis.com/goto/http://www.tatanka.com.br/ies4linux/page/Main_Page
[2]:https://wesharethis.com/goto/http://en.wikipedia.org/wiki/SOCKS
[3]:https://wesharethis.com/goto/http://en.wikipedia.org/wiki/Proxy_server
[4]:https://wesharethis.com/goto/http://en.wikipedia.org/wiki/Intranet
[5]:https://wesharethis.com/goto/http://en.wikipedia.org/wiki/Proxy_server#Transparent_and_non-transparent_proxy_server
[6]:https://wesharethis.com/goto/http://webmail.mozdev.org/
[7]:https://wesharethis.com/goto/http://en.wikipedia.org/wiki/HTTP_tunnel_(software)
[8]:https://wesharethis.com/goto/http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
[9]:https://wesharethis.com/goto/https://www.spotify.com/int/download/linux/
[10]:https://wesharethis.com/goto/http://kb.mozillazine.org/About:config
[11]:https://wesharethis.com/goto/http://www.bluecoat.com/
[12]:https://wesharethis.com/goto/http://www.bluecoat.com/products/sockscap
[13]:https://wesharethis.com/goto/http://www.freecap.ru/eng/
[14]:https://wesharethis.com/goto/http://widecap.ru/en/support/
[15]:https://wesharethis.com/goto/http://tsocks.sourceforge.net/
[16]:https://wesharethis.com/goto/http://proxychains.sourceforge.net/
[17]:https://linux.cn/article-8945-1.html
[18]:https://wesharethis.com/2017/07/10/linux-swap-partition/
