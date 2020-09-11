[#]: collector: (lujun9972)
[#]: translator: (zgj1024)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10765-1.html)
[#]: subject: (HTTPie – A Modern Command Line HTTP Client For Curl And Wget Alternative)
[#]: via: (https://www.2daygeek.com/httpie-curl-wget-alternative-http-client-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

HTTPie：替代 Curl 和 Wget 的现代 HTTP 命令行客户端
======

大多数时间我们会使用 `curl` 命令或是 `wget` 命令下载文件或者做其他事。

我们以前曾写过 [最佳命令行下载管理器][1] 的文章。你可以点击相应的 URL 连接来浏览这些文章。

* [aria2 – Linux 下的多协议命令行下载工具][2]
* [Axel – Linux 下的轻量级命令行下载加速器][3]
* [Wget – Linux 下的标准命令行下载工具][4]
* [curl – Linux 下的实用的命令行下载工具][5]

今天我们将讨论同样的话题。这个实用程序名为 HTTPie。

它是现代命令行 http 客户端，也是 `curl` 和 `wget` 命令的最佳替代品。

### 什么是 HTTPie？

HTTPie (发音是 aitch-tee-tee-pie) 是一个 HTTP 命令行客户端。

HTTPie 工具是现代的 HTTP 命令行客户端，它能通过命令行界面与 Web 服务进行交互。

它提供一个简单的 `http` 命令，允许使用简单而自然的语法发送任意的 HTTP 请求，并会显示彩色的输出。

HTTPie 能用于测试、调试及与 HTTP 服务器交互。

### 主要特点

  * 具表达力的和直观语法
  * 格式化的及彩色化的终端输出
  * 内置 JSON 支持
  * 表单和文件上传
  * HTTPS、代理和认证
  * 任意请求数据
  * 自定义头部
  * 持久化会话
  * 类似 `wget` 的下载
  * 支持 Python 2.7 和 3.x

### 在 Linux 下如何安装 HTTPie

大部分 Linux 发行版都提供了系统包管理器，可以用它来安装。

Fedora 系统，使用 [DNF 命令][6] 来安装 httpie：

```
$ sudo dnf install httpie
```

Debian/Ubuntu 系统，使用 [APT-GET 命令][7] 或 [APT 命令][8] 来安装 HTTPie。

```
$ sudo apt install httpie
```

基于 Arch Linux 的系统，使用 [Pacman 命令][9] 来安装 HTTPie。

```
$ sudo pacman -S httpie
```

RHEL/CentOS 的系统，使用 [YUM 命令][10] 来安装 HTTPie。

```
$ sudo yum install httpie
```

openSUSE Leap 系统，使用 [Zypper 命令][11] 来安装 HTTPie。

```
$ sudo zypper install httpie
```

### 用法

#### 如何使用 HTTPie 请求 URL？

HTTPie 的基本用法是将网站的 URL 作为参数。

```
# http 2daygeek.com
HTTP/1.1 301 Moved Permanently
CF-RAY: 4c4a618d0c02ce6d-LHR
Cache-Control: max-age=3600
Connection: keep-alive
Date: Tue, 09 Apr 2019 06:21:28 GMT
Expires: Tue, 09 Apr 2019 07:21:28 GMT
Location: https://2daygeek.com/
Server: cloudflare
Transfer-Encoding: chunked
Vary: Accept-Encoding
```

#### 如何使用 HTTPie 下载文件

你可以使用带 `--download` 参数的 HTTPie 命令下载文件。类似于 `wget` 命令。

```
# http --download https://www.2daygeek.com/wp-content/uploads/2019/04/Anbox-Easy-Way-To-Run-Android-Apps-On-Linux.png
HTTP/1.1 200 OK
Accept-Ranges: bytes
CF-Cache-Status: HIT
CF-RAY: 4c4a65d5ca360a66-LHR
Cache-Control: public, max-age=7200
Connection: keep-alive
Content-Length: 32066
Content-Type: image/png
Date: Tue, 09 Apr 2019 06:24:23 GMT
Expect-CT: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
Expires: Tue, 09 Apr 2019 08:24:23 GMT
Last-Modified: Mon, 08 Apr 2019 04:54:25 GMT
Server: cloudflare
Set-Cookie: __cfduid=dd2034b2f95ae42047e082f59f2b964f71554791063; expires=Wed, 08-Apr-20 06:24:23 GMT; path=/; domain=.2daygeek.com; HttpOnly; Secure
Vary: Accept-Encoding

Downloading 31.31 kB to "Anbox-Easy-Way-To-Run-Android-Apps-On-Linux.png"
Done. 31.31 kB in 0.01187s (2.58 MB/s)
```

你还可以使用 `-o` 参数用不同的名称保存输出文件。

```
# http --download https://www.2daygeek.com/wp-content/uploads/2019/04/Anbox-Easy-Way-To-Run-Android-Apps-On-Linux.png -o Anbox-1.png
HTTP/1.1 200 OK
Accept-Ranges: bytes
CF-Cache-Status: HIT
CF-RAY: 4c4a68194daa0a66-LHR
Cache-Control: public, max-age=7200
Connection: keep-alive
Content-Length: 32066
Content-Type: image/png
Date: Tue, 09 Apr 2019 06:25:56 GMT
Expect-CT: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
Expires: Tue, 09 Apr 2019 08:25:56 GMT
Last-Modified: Mon, 08 Apr 2019 04:54:25 GMT
Server: cloudflare
Set-Cookie: __cfduid=d3eea753081690f9a2d36495a74407dd71554791156; expires=Wed, 08-Apr-20 06:25:56 GMT; path=/; domain=.2daygeek.com; HttpOnly; Secure
Vary: Accept-Encoding

Downloading 31.31 kB to "Anbox-1.png"
Done. 31.31 kB in 0.01551s (1.97 MB/s)
```

#### 如何使用 HTTPie 恢复部分下载？

你可以使用带 `-c` 参数的 HTTPie 继续下载。

```
# http --download --continue https://speed.hetzner.de/100MB.bin -o 100MB.bin
HTTP/1.1 206 Partial Content
Connection: keep-alive
Content-Length: 100442112
Content-Range: bytes 4415488-104857599/104857600
Content-Type: application/octet-stream
Date: Tue, 09 Apr 2019 06:32:52 GMT
ETag: "5253f0fd-6400000"
Last-Modified: Tue, 08 Oct 2013 11:48:13 GMT
Server: nginx
Strict-Transport-Security: max-age=15768000; includeSubDomains

Downloading 100.00 MB to "100MB.bin"
 |  24.14 %   24.14 MB    1.12 MB/s  0:01:07 ETA^C
```

你根据下面的输出验证是否同一个文件：

```
[email protected]:/var/log# ls -lhtr 100MB.bin
-rw-r--r-- 1 root root 25M Apr  9 01:33 100MB.bin
```

#### 如何使用 HTTPie 上传文件？

你可以通过使用带有小于号 `<` 的 HTTPie 命令上传文件

```
$ http https://transfer.sh < Anbox-1.png
```

#### 如何使用带有重定向符号 > 下载文件？

你可以使用带有重定向 `>` 符号的 HTTPie 命令下载文件。

```
# http https://www.2daygeek.com/wp-content/uploads/2019/03/How-To-Install-And-Enable-Flatpak-Support-On-Linux-1.png > Flatpak.png

# ls -ltrh Flatpak.png
-rw-r--r-- 1 root root 47K Apr  9 01:44 Flatpak.png
```

#### 发送一个 HTTP GET 请求？
 
您可以在请求中发送 HTTP GET 方法。GET 方法会使用给定的 URI，从给定服务器检索信息。


```
# http GET httpie.org
HTTP/1.1 301 Moved Permanently
CF-RAY: 4c4a83a3f90dcbe6-SIN
Cache-Control: max-age=3600
Connection: keep-alive
Date: Tue, 09 Apr 2019 06:44:44 GMT
Expires: Tue, 09 Apr 2019 07:44:44 GMT
Location: https://httpie.org/
Server: cloudflare
Transfer-Encoding: chunked
Vary: Accept-Encoding
```

#### 提交表单?

使用以下格式提交表单。POST 请求用于向服务器发送数据，例如客户信息、文件上传等。要使用 HTML 表单。

```
# http -f POST Ubuntu18.2daygeek.com hello='World'
HTTP/1.1 200 OK
Accept-Ranges: bytes
Connection: Keep-Alive
Content-Encoding: gzip
Content-Length: 3138
Content-Type: text/html
Date: Tue, 09 Apr 2019 06:48:12 GMT
ETag: "2aa6-5844bf1b047fc-gzip"
Keep-Alive: timeout=5, max=100
Last-Modified: Sun, 17 Mar 2019 15:29:55 GMT
Server: Apache/2.4.29 (Ubuntu)
Vary: Accept-Encoding
```

运行下面的指令以查看正在发送的请求。

```
# http -v Ubuntu18.2daygeek.com
GET / HTTP/1.1
Accept: */*
Accept-Encoding: gzip, deflate
Connection: keep-alive
Host: ubuntu18.2daygeek.com
User-Agent: HTTPie/0.9.8

hello=World

HTTP/1.1 200 OK
Accept-Ranges: bytes
Connection: Keep-Alive
Content-Encoding: gzip
Content-Length: 3138
Content-Type: text/html
Date: Tue, 09 Apr 2019 06:48:30 GMT
ETag: "2aa6-5844bf1b047fc-gzip"
Keep-Alive: timeout=5, max=100
Last-Modified: Sun, 17 Mar 2019 15:29:55 GMT
Server: Apache/2.4.29 (Ubuntu)
Vary: Accept-Encoding
```

#### HTTP 认证？

当前支持的身份验证认证方案是基本认证（Basic）和摘要验证（Digest）。

基本认证：

```
$ http -a username:password example.org
```

摘要验证：

```
$ http -A digest -a username:password example.org
```

提示输入密码：

```
$ http -a username example.org
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/httpie-curl-wget-alternative-http-client-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[zgj1024](https://github.com/zgj1024)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/best-4-command-line-download-managers-accelerators-for-linux/
[2]: https://www.2daygeek.com/aria2-linux-command-line-download-utility-tool/
[3]: https://www.2daygeek.com/axel-linux-command-line-download-accelerator/
[4]: https://www.2daygeek.com/wget-linux-command-line-download-utility-tool/
[5]: https://www.2daygeek.com/curl-linux-command-line-download-manager/
[6]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[7]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[8]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[9]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[10]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[11]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
