[#]: subject: (Drop telnet for OpenSSL)
[#]: via: (https://opensource.com/article/21/5/drop-telnet-openssl)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13381-1.html)

用 OpenSSL 替代 telnet
======

> Telnet 缺乏加密，这使得 OpenSSL 成为连接远程系统的更安全的选择。

![](https://img.linux.net.cn/data/attachment/album/202105/11/115934cggzmq8rm8suaqlq.png)

[telnet][2] 命令是最受欢迎的网络故障排除工具之一，从系统管理员到网络爱好者都可以使用。在网络计算的早期，`telnet` 被用来连接到一个远程系统。你可以用 `telnet` 访问一个远程系统的端口，登录并在该主机上运行命令。

由于 `telnet` 缺乏加密功能，它在很大程度上已经被 OpenSSL 取代了这项工作。然而，作为一种智能的 `ping`，`telnet` 的作用仍然存在（甚至在某些情况下至今仍然存在）。虽然 `ping` 命令是一个探测主机响应的好方法，但这是它能做的 _全部_。另一方面，`telnet` 不仅可以确认一个活动端口，而且还可以与该端口的服务进行交互。即便如此，由于大多数现代网络服务都是加密的，`telnet` 的作用可能要小得多，这取决于你想实现什么。

### OpenSSL s_client

对于大多数曾经需要 `telnet` 的任务，我现在使用 OpenSSL 的 `s_client` 命令。（我在一些任务中使用 [curl][3]，但那些情况下我可能无论如何也不会使用 `telnet`）。大多数人都知道 [OpenSSL][4] 是一个加密的库和框架，但不是所有人都意识到它也是一个命令。`openssl` 命令的 `s_client` 组件实现了一个通用的 SSL 或 TLS 客户端，帮助你使用 SSL 或 TLS 连接到远程主机。它是用来测试的，至少在内部使用与该库相同的功能。

### 安装 OpenSSL

OpenSSL 可能已经安装在你的 Linux 系统上了。如果没有，你可以用你的发行版的软件包管理器安装它：

```
$ sudo dnf install openssl
```

在 Debian 或类似的系统上：

```
$ sudo apt install openssl
```

安装后，验证它的响应是否符合预期：

```
$ openssl version
OpenSSL x.y.z FIPS
```

### 验证端口访问

最基本的 `telnet` 用法是一个看起来像这样的任务：

```
$ telnet mail.example.com 25
Trying 98.76.54.32...
Connected to example.com.
Escape character is '^]'.
```

在此示例中，这将与正在端口 25（可能是邮件服务器）监听的任意服务打开一个交互式会话。只要你获得访问权限，就可以与该服务进行通信。

如果端口 25 无法访问，连接就会被拒绝。

OpenSSL 也是类似的，尽管通常较少互动。要验证对一个端口的访问：

```
$ openssl s_client -connect example.com:80
CONNECTED(00000003)
140306897352512:error:1408F10B:SSL [...]

no peer certificate available

No client certificate CA names sent

SSL handshake has read 5 bytes and written 309 bytes
Verification: OK

New, (NONE), Cipher is (NONE)
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 0 (ok)
```

但是，这仅是目标性 `ping`。从输出中可以看出，没有交换 SSL 证书，所以连接立即终止。为了充分利用 `openssl s_client`，你必须连接加密的端口。

### 交互式 OpenSSL

Web 浏览器和 Web 服务器进行交互，可以使指向 80 端口的流量实际上被转发到 443，这是保留给加密 HTTP 流量的端口。知道了这一点，你就可以用 `openssl` 命令连接到加密的端口，并与在其上运行的任何网络服务进行交互。

首先，使用 SSL 连接到一个端口。使用 `-showcerts` 选项会使 SSL 证书打印到你的终端上，一开始的输出要比 telnet 要冗长得多：

```
$ openssl s_client -connect example.com:443 -showcerts
[...]
    0080 - 52 cd bd 95 3d 8a 1e 2d-3f 84 a0 e3 7a c0 8d 87   R...=..-?...z...
    0090 - 62 d0 ae d5 95 8d 82 11-01 bc 97 97 cd 8a 30 c1   b.............0.
    00a0 - 54 78 5c ad 62 5b 77 b9-a6 35 97 67 65 f5 9b 22   Tx\\.b[w..5.ge.."
    00b0 - 18 8a 6a 94 a4 d9 7e 2f-f5 33 e8 8a b7 82 bd 94   ..j...~/.3......

    Start Time: 1619661100
    Timeout   : 7200 (sec)
    Verify return code: 0 (ok)
    Extended master secret: no
    Max Early Data: 0
-
read R BLOCK
```

你被留在一个交互式会话中。最终，这个会话将关闭，但如果你及时行动，你可以向服务器发送 HTTP 信号：

```
[...]
GET / HTTP/1.1
HOST: example.com
```

按**回车键**两次，你会收到 `example.com/index.html` 的数据：

```
[...]
<body>
<div>
    <h1>Example Domain</h1>
    <p>This domain is for use in illustrative examples in documents. You may use this
    domain in literature without prior coordination or asking for permission.</p>
    <p><a href="https://www.iana.org/domains/example">More information...</a></p>
</div>
</body>
</html>
```

#### Email 服务器

你也可以使用 OpenSSL 的 `s_client` 来测试一个加密的 Email 服务器。要做到这点，你必须把你的测试用户的用户名和密码用 Base64 编码。

这里有一个简单的方法来做到：

```
$ perl -MMIME::Base64 -e 'print encode_base64("username");'
$ perl -MMIME::Base64 -e 'print encode_base64("password");'
```

当你记录了这些值，你就可以通过 SSL 连接到邮件服务器，它通常在 587 端口：

```
$ openssl s_client -starttls smtp \
-connect email.example.com:587
> ehlo example.com
> auth login
##paste your user base64 string here##
##paste your password base64 string here##

> mail from: noreply@example.com
> rcpt to: admin@example.com
> data
> Subject: Test 001
This is a test email.
.
> quit
```

检查你的邮件（在这个示例代码中，是 `admin@example.com`），查看来自 `noreply@example.com` 的测试邮件。

### OpenSSL 还是 Telnet？

`telnet` 仍然有用途，但它已经不是以前那种不可缺少的工具了。该命令在许多发行版上被归入 “遗留” 网络软件包，而且还没有 `telnet-ng` 之类的明显的继任者，管理员有时会对它被排除在默认安装之外感到疑惑。答案是，它不再是必不可少的，它的作用越来越小，这 _很好_。网络安全很重要，所以要适应与加密接口互动的工具，这样你就不必在排除故障时禁用你的保护措施。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/drop-telnet-openssl

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum (Lock)
[2]: https://www.redhat.com/sysadmin/telnet-netcat-troubleshooting
[3]: https://opensource.com/downloads/curl-command-cheat-sheet
[4]: https://www.openssl.org/
[5]: https://www.iana.org/domains/example"\>More
[6]: mailto:noreply@example.com
[7]: mailto:admin@example.com
