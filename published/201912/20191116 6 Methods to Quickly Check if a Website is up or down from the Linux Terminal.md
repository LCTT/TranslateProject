[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11661-1.html)
[#]: subject: (6 Methods to Quickly Check if a Website is up or down from the Linux Terminal)
[#]: via: (https://www.2daygeek.com/linux-command-check-website-is-up-down-alive/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

在 Linux 终端快速检测网站是否宕机的 6 个方法
======

> 本教程教你怎样在 Linux 终端快速检测一个网站是否宕机。

![](https://img.linux.net.cn/data/attachment/album/201912/10/093801u332115oocxz4531.jpg)

你可能已经了解了一些类似的命令，像 `ping`、`curl` 和 `wget`。我们在本教程中又加入了一些其他命令。同时，我们也加入了不同的选项来检测单个和多个主机的信息。

本文将帮助你检测网站是否宕机。但是如果你在维护一些网站，希望网站宕掉时得到实时的报警，我推荐你去使用实时网站监控工具。这种工具有很多，有些是免费的，大部分收费。根据你的需求，选择合适的工具。在后续的文章中我们会涉及这个主题。

### 方法 1：使用 fping 命令检测一个网站是否宕机

[fping 命令][1] 是一个类似 `ping` 的程序，使用互联网控制消息协议（ICMP）的<ruby>回应请求报文<rt>echo request</rt></ruby>来判断目标主机是否能回应。`fping` 与 `ping` 的不同之处在于它可以并行地 `ping` 任意数量的主机，也可以从一个文本文件读入主机名称。`fping` 发送一个 ICMP 回应请求后不等待目标主机响应，就以轮询模式向下一个目标主机发请求。如果一个目标主机有响应，那么它就被标记为存活的，然后从检查目标列表里去掉。如果一个目标主机在限定的时间和（或）重试次数内没有响应，则被指定为网站无法到达的。

```
# fping 2daygeek.com linuxtechnews.com magesh.co.in

2daygeek.com is alive
linuxtechnews.com is alive
magesh.co.in is alive
```

### 方法 2：使用 http 命令检测一个网站是否宕机

HTTPie（读作 aitch-tee-tee-pie）是一个命令行 HTTP 客户端。[httpie][2] 是一个可以与 web 服务通过 CLI 进行交互的现代工具。httpie 工具提供了简单的 `http` 命令，可以通过发送简单的、自然语言语法的任意 HTTP 请求得到多彩的结果输出。HTTPie 可以用来对 HTTP 服务器进行测试、调试和基本的交互。

```
# http 2daygeek.com

HTTP/1.1 301 Moved Permanently
CF-RAY: 535b66722ab6e5fc-LHR
Cache-Control: max-age=3600
Connection: keep-alive
Date: Thu, 14 Nov 2019 19:30:28 GMT
Expires: Thu, 14 Nov 2019 20:30:28 GMT
Location: https://2daygeek.com/
Server: cloudflare
Transfer-Encoding: chunked
Vary: Accept-Encoding
```

### 方法 3：使用 curl 命令检测一个网站是否宕机

[curl 命令][3] 是一个用于在服务器间通过支持的协议（DICT、FILE、FTP、FTPS、GOPHER、HTTP、HTTPS、IMAP、IMAPS、LDAP、LDAPS、POP3、POP3S、RTMP、RTSP、SCP、SFTP、SMTP、SMTPS、TELNET 和 TFTP）传输数据的工具。这个工具不支持用户交互。`curl` 也支持使用代理、用户认证、FTP 上传、HTTP POST 请求、SSL 连接、cookie、断点续传、Metalink 等等。`curl `由 libcurl 库提供所有与传输有关的能力。

```
# curl -I https://www.magesh.co.in

HTTP/2 200
date: Thu, 14 Nov 2019 19:39:47 GMT
content-type: text/html
set-cookie: __cfduid=db16c3aee6a75c46a504c15131ead3e7f1573760386; expires=Fri, 13-Nov-20 19:39:46 GMT; path=/; domain=.magesh.co.in; HttpOnly
vary: Accept-Encoding
last-modified: Sun, 14 Jun 2015 11:52:38 GMT
x-cache: HIT from Backend
cf-cache-status: DYNAMIC
expect-ct: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
server: cloudflare
cf-ray: 535b74123ca4dbf3-LHR
```

如果你只想看 HTTP 状态码而不是返回的全部信息，用下面的 `curl` 命令：

```
# curl -I "www.magesh.co.in" 2>&1 | awk '/HTTP\// {print $2}'
 200
```

如果你想看一个网站是否宕机，用下面的 bash 脚本：

```
# vi curl-url-check.sh

#!/bin/bash
if curl -I "https://www.magesh.co.in" 2>&1 | grep -w "200\|301" ; then
    echo "magesh.co.in is up"
else
    echo "magesh.co.in is down"
fi
```

当你把脚本内容添加到一个文件后，执行文件，查看结果：

```
# sh curl-url-check.sh

HTTP/2 200
magesh.co.in is up
```

如果你想看多个网站的状态，使用下面的 shell 脚本：

```
# vi curl-url-check-1.sh

#!/bin/bash
for site in www.google.com google.co.in www.xyzzz.com
do
if curl -I "$site" 2>&1 | grep -w "200\|301" ; then
    echo "$site is up"
else
    echo "$site is down"
fi
echo "----------------------------------"
done
```

当你把上面脚本内容添加到一个文件后，执行文件，查看结果：

```
# sh curl-url-check-1.sh

HTTP/1.1 200 OK
www.google.com is up
----------------------------------
HTTP/1.1 301 Moved Permanently
google.co.in is up
----------------------------------
www.xyzzz.com is down
----------------------------------
```

### 方法 4：使用 wget 命令检测一个网站是否宕机

[wget 命令][4]（前身是 Geturl）是一个自由开源的命令行下载工具，通过 HTTP、HTTPS、FTP 和其他广泛使用的互联网协议获取文件。`wget` 是非交互式的命令行工具，由 World Wide Web 和 get 得名。`wget` 相对于其他工具来说更优秀，功能包括后台运行、递归下载、多文件下载、断点续传、非交互式下载和大文件下载。

```
# wget -S --spider https://www.magesh.co.in

Spider mode enabled. Check if remote file exists.
--2019-11-15 01:22:00--  https://www.magesh.co.in/
Loaded CA certificate '/etc/ssl/certs/ca-certificates.crt'
Resolving www.magesh.co.in (www.magesh.co.in)… 104.18.35.52, 104.18.34.52, 2606:4700:30::6812:2334, …
Connecting to www.magesh.co.in (www.magesh.co.in)|104.18.35.52|:443… connected.
HTTP request sent, awaiting response…
  HTTP/1.1 200 OK
  Date: Thu, 14 Nov 2019 19:52:01 GMT
  Content-Type: text/html
  Connection: keep-alive
  Set-Cookie: __cfduid=db73306a2f1c72c1318ad4709ef49a3a01573761121; expires=Fri, 13-Nov-20 19:52:01 GMT; path=/; domain=.magesh.co.in; HttpOnly
  Vary: Accept-Encoding
  Last-Modified: Sun, 14 Jun 2015 11:52:38 GMT
  X-Cache: HIT from Backend
  CF-Cache-Status: DYNAMIC
  Expect-CT: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
  Server: cloudflare
  CF-RAY: 535b85fe381ee684-LHR
Length: unspecified [text/html]
Remote file exists and could contain further links,
but recursion is disabled -- not retrieving.
```

如果你只想看 HTTP 状态码而不是返回的全部结果，用下面的 `wget` 命令：

```
# wget --spider -S "www.magesh.co.in" 2>&1 | awk '/HTTP\// {print $2}'
 200
```

如果你想看一个网站是否宕机，用下面的 bash 脚本：

```
# vi wget-url-check.sh

#!/bin/bash
if wget --spider -S "https://www.google.com" 2>&1 | grep -w "200\|301" ; then
    echo "Google.com is up"
else
    echo "Google.com is down"
fi
```

当你把脚本内容添加到一个文件后，执行文件，查看结果：

```
# wget-url-check.sh

HTTP/1.1 200 OK
Google.com is up
```

如果你想看多个网站的状态，使用下面的 shell 脚本：

```
# vi curl-url-check-1.sh

#!/bin/bash
for site in www.google.com google.co.in www.xyzzz.com
do
if wget --spider -S "$site" 2>&1 | grep -w "200\|301" ; then
    echo "$site is up"
else
    echo "$site is down"
fi
echo "----------------------------------"
done
```

当你把上面脚本内容添加到一个文件后，执行文件，查看结果：

```
# sh wget-url-check-1.sh

HTTP/1.1 200 OK
www.google.com is up
----------------------------------
HTTP/1.1 301 Moved Permanently
google.co.in is up
----------------------------------
www.xyzzz.com is down
----------------------------------
```

### 方法 5：使用 lynx 命令检测一个网站是否宕机

[lynx][5] 是一个在<ruby>可寻址光标字符单元终端<rt>cursor-addressable character cell terminals</rt></ruby>上使用的基于文本的高度可配的 web 浏览器，它是最古老的 web 浏览器并且现在仍在活跃开发。

```
# lynx -head -dump http://www.magesh.co.in

HTTP/1.1 200 OK
Date: Fri, 15 Nov 2019 08:14:23 GMT
Content-Type: text/html
Connection: close
Set-Cookie: __cfduid=df3cb624024b81df7362f42ede71300951573805662; expires=Sat, 1
4-Nov-20 08:14:22 GMT; path=/; domain=.magesh.co.in; HttpOnly
Vary: Accept-Encoding
Last-Modified: Sun, 14 Jun 2015 11:52:38 GMT
X-Cache: HIT from Backend
CF-Cache-Status: DYNAMIC
Server: cloudflare
CF-RAY: 535fc5704a43e694-LHR
```

如果你只想看 HTTP 状态码而不是返回的全部结果，用下面的 `lynx` 命令：

```
# lynx -head -dump https://www.magesh.co.in 2>&1 | awk '/HTTP\// {print $2}'
 200
```

如果你想看一个网站是否宕机，用下面的 bash 脚本：

```
# vi lynx-url-check.sh

#!/bin/bash
if lynx -head -dump http://www.magesh.co.in 2>&1 | grep -w "200\|301" ; then
    echo "magesh.co.in is up"
else
    echo "magesh.co.in is down"
fi
```

当你把脚本内容添加到一个文件后，执行文件，查看结果：

```
# sh lynx-url-check.sh

HTTP/1.1 200 OK
magesh.co.in is up
```

如果你想看多个网站的状态，使用下面的 shell 脚本：

```
# vi lynx-url-check-1.sh

#!/bin/bash
for site in http://www.google.com https://google.co.in http://www.xyzzz.com
do
if lynx -head -dump "$site" 2>&1 | grep -w "200\|301" ; then
    echo "$site is up"
else
    echo "$site is down"
fi
echo "----------------------------------"
done
```

当你把上面脚本内容添加到一个文件后，执行文件，查看结果：

```
# sh lynx-url-check-1.sh

HTTP/1.0 200 OK
http://www.google.com is up
----------------------------------
HTTP/1.0 301 Moved Permanently
https://google.co.in is up
----------------------------------
www.xyzzz.com is down
----------------------------------
```

### 方法 6：使用 ping 命令检测一个网站是否宕机

[ping 命令][1]（Packet Internet Groper）是网络工具的代表，用于在互联网协议（IP）的网络中测试一个目标主机是否可用/可连接。通过向目标主机发送 ICMP 回应请求报文包并等待 ICMP 回应响应报文来检测主机的可用性。它基于已发送的包、接收到的包和丢失了的包来统计结果数据，通常包含最小/平均/最大响应时间。

```
# ping -c 5 2daygeek.com

PING 2daygeek.com (104.27.157.177) 56(84) bytes of data.
64 bytes from 104.27.157.177 (104.27.157.177): icmp_seq=1 ttl=58 time=228 ms
64 bytes from 104.27.157.177 (104.27.157.177): icmp_seq=2 ttl=58 time=227 ms
64 bytes from 104.27.157.177 (104.27.157.177): icmp_seq=3 ttl=58 time=250 ms
64 bytes from 104.27.157.177 (104.27.157.177): icmp_seq=4 ttl=58 time=171 ms
64 bytes from 104.27.157.177 (104.27.157.177): icmp_seq=5 ttl=58 time=193 ms

--- 2daygeek.com ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 13244ms
rtt min/avg/max/mdev = 170.668/213.824/250.295/28.320 ms
```

### 附加 1：使用 telnet 命令检测一个网站是否宕机

`telnet` 命令是一个使用 TELNET 协议用于 TCP/IP 网络中多个主机相互通信的古老的网络协议。它通过 23 端口连接其他设备如计算机和网络设备。`telnet` 是不安全的协议，现在由于用这个协议发送的数据没有经过加密可能被黑客拦截，所以不推荐使用。大家都使用经过加密且非常安全的 SSH 协议来代替 `telnet`。

```
# telnet google.com 80

Trying 216.58.194.46…
Connected to google.com.
Escape character is '^]'.
^]
telnet> quit
Connection closed.
```

### 附加 2：使用 bash 脚本检测一个网站是否宕机

简而言之，一个 [shell 脚本][6] 就是一个包含一系列命令的文件。shell 从文件读取内容按输入顺序逐行在命令行执行。为了让它更有效，我们添加一些条件。这也减轻了 Linux 管理员的负担。

如果你想想用 `wget` 命令看多个网站的状态，使用下面的 shell 脚本：

```
# vi wget-url-check-2.sh

#!/bin/bash
for site in www.google.com google.co.in www.xyzzz.com
do
if wget --spider -S "$site" 2>&1 | grep -w "200\|301" > /dev/null ; then
    echo "$site is up"
else
    echo "$site is down"
fi
done
```

当你把上面脚本内容添加到一个文件后，执行文件，查看结果：

```
# sh wget-url-check-2.sh

www.google.com is up
google.co.in is up
www.xyzzz.com is down
```

如果你想用 `wget` 命令看多个网站的状态，使用下面的 [shell 脚本][7]：

```
# vi curl-url-check-2.sh

#!/bin/bash
for site in www.google.com google.co.in www.xyzzz.com
do
if curl -I "$site" 2>&1 | grep -w "200\|301" > /dev/null ; then
    echo "$site is up"
else
    echo "$site is down"
fi
done
```

当你把上面脚本内容添加到一个文件后，执行文件，查看结果：

```
# sh curl-url-check-2.sh

www.google.com is up
google.co.in is up
www.xyzzz.com is down
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-command-check-website-is-up-down-alive/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-use-ping-fping-gping-in-linux/
[2]: https://www.2daygeek.com/httpie-curl-wget-alternative-http-client-linux/
[3]: https://www.2daygeek.com/curl-linux-command-line-download-manager/
[4]: https://www.2daygeek.com/wget-linux-command-line-download-utility-tool/
[5]: https://www.2daygeek.com/best-text-mode-based-command-line-web-browser-for-linux/
[6]: https://www.2daygeek.com/category/shell-script/
[7]: https://www.2daygeek.com/category/bash-script/
