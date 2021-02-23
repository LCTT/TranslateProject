[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11333-1.html)
[#]: subject: (Getting started with HTTPie for API testing)
[#]: via: (https://opensource.com/article/19/8/getting-started-httpie)
[#]: author: (Moshe Zadka https://opensource.com/users/moshezhttps://opensource.com/users/mkalindepauleduhttps://opensource.com/users/jamesf)

使用 HTTPie 进行 API 测试
======

> 使用 HTTPie 调试 API，这是一个用 Python 写的易用的命令行工具。

![](https://img.linux.net.cn/data/attachment/album/201909/12/102919ry1ute1y9h991ftz.jpg)

[HTTPie][2] 是一个非常易用、易于升级的 HTTP 客户端。它的发音为 “aitch-tee-tee-pie” 并以 `http` 命令运行，它是一个用 Python 编写的来用于访问 Web 的命令行工具。

由于这是一篇关于 HTTP 客户端的指导文章，因此你需要一个 HTTP 服务器来试用它。在这里，访问 [httpbin.org][3]，它是一个简单的开源 HTTP 请求和响应服务。httpbin.org 网站是一种测试 Web API 的强大方式，并能仔细管理并显示请求和响应内容，不过现在让我们专注于 HTTPie 的强大功能。

### Wget 和 cURL 的替代品

你可能听说过古老的 [Wget][4] 或稍微新一些的 [cURL][5] 工具，它们允许你从命令行访问 Web。它们是为访问网站而编写的，而 HTTPie 则用于访问 Web API。

网站请求发生在计算机和正在阅读并响应它所看到的内容的最终用户之间，这并不太依赖于结构化的响应。但是，API 请求会在两台计算机之间进行*结构化*调用，人并不是该流程内的一部分，像 HTTPie 这样的命令行工具的参数可以有效地处理这个问题。

### 安装 HTTPie

有几种方法可以安装 HTTPie。你可以通过包管理器安装，无论你使用的是 `brew`、`apt`、`yum` 还是 `dnf`。但是，如果你已配置 [virtualenvwrapper][6]，那么你可以用自己的方式安装：


```
$ mkvirtualenv httpie
...
(httpie) $ pip install httpie
...
(httpie) $ deactivate
$ alias http=~/.virtualenvs/httpie/bin/http
$ http -b GET https://httpbin.org/get
{
    "args": {},
    "headers": {
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate",
        "Host": "httpbin.org",
        "User-Agent": "HTTPie/1.0.2"
    },
    "origin": "104.220.242.210, 104.220.242.210",
    "url": "https://httpbin.org/get"
}
```

通过将 `http` 别名指向为虚拟环境中的命令，即使虚拟环境在非活动状态，你也可以运行它。你可以将 `alias` 命令放在 `.bash_profile` 或 `.bashrc` 中，这样你就可以使用以下命令升级 HTTPie：


```
$ ~/.virtualenvs/httpie/bin/pip install -U pip
```

### 使用 HTTPie 查询网站

HTTPie 可以简化查询和测试 API。上面使用了一个选项，`-b`（即 `--body`）。没有它，HTTPie 将默认打印整个响应，包括响应头：

```
$ http GET https://httpbin.org/get
HTTP/1.1 200 OK
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Connection: keep-alive
Content-Encoding: gzip
Content-Length: 177
Content-Type: application/json
Date: Fri, 09 Aug 2019 20:19:47 GMT
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block

{
    "args": {},
    "headers": {
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate",
        "Host": "httpbin.org",
        "User-Agent": "HTTPie/1.0.2"
    },
    "origin": "104.220.242.210, 104.220.242.210",
    "url": "https://httpbin.org/get"
}
```

这在调试 API 服务时非常重要，因为大量信息在响应头中发送。例如，查看发送的 cookie 通常很重要。httpbin.org 提供了通过 URL 路径设置 cookie（用于测试目的）的方式。以下设置一个标题为 `opensource`， 值为 `awesome` 的 cookie：

```
$ http GET https://httpbin.org/cookies/set/opensource/awesome
HTTP/1.1 302 FOUND
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Connection: keep-alive
Content-Length: 223
Content-Type: text/html; charset=utf-8
Date: Fri, 09 Aug 2019 20:22:39 GMT
Location: /cookies
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
Set-Cookie: opensource=awesome; Path=/
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<title>Redirecting...</title>
<h1>Redirecting...</h1>
<p>You should be redirected automatically to target URL:
<a href="/cookies">/cookies</a>.  If not click the link.
```

注意 `Set-Cookie: opensource=awesome; Path=/` 的响应头。这表明你预期设置的 cookie 已正确设置，路径为 `/`。另请注意，即使你得到了 `302` 重定向，`http` 也不会遵循它。如果你想要遵循重定向，则需要明确使用 `--follow` 标志请求：

```
$ http --follow GET https://httpbin.org/cookies/set/opensource/awesome
HTTP/1.1 200 OK
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Connection: keep-alive
Content-Encoding: gzip
Content-Length: 66
Content-Type: application/json
Date: Sat, 10 Aug 2019 01:33:34 GMT
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block

{
    "cookies": {
        "opensource": "awesome"
    }
}
```

但此时你无法看到原来的 `Set-Cookie` 头。为了看到中间响应，你需要使用 `--all`：


```
$ http --headers --all --follow GET https://httpbin.org/cookies/set/opensource/awesome
HTTP/1.1 302 FOUND
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Content-Type: text/html; charset=utf-8
Date: Sat, 10 Aug 2019 01:38:40 GMT
Location: /cookies
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
Set-Cookie: opensource=awesome; Path=/
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
Content-Length: 223
Connection: keep-alive

HTTP/1.1 200 OK
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Content-Encoding: gzip
Content-Type: application/json
Date: Sat, 10 Aug 2019 01:38:41 GMT
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
Content-Length: 66
Connection: keep-alive
```

打印响应体并不有趣，因为你大多数时候只关心 cookie。如果你想看到中间请求的响应头，而不是最终请求中的响应体，你可以使用：

```
$ http --print hb --history-print h --all --follow GET https://httpbin.org/cookies/set/opensource/awesome
HTTP/1.1 302 FOUND
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Content-Type: text/html; charset=utf-8
Date: Sat, 10 Aug 2019 01:40:56 GMT
Location: /cookies
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
Set-Cookie: opensource=awesome; Path=/
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
Content-Length: 223
Connection: keep-alive

HTTP/1.1 200 OK
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Content-Encoding: gzip
Content-Type: application/json
Date: Sat, 10 Aug 2019 01:40:56 GMT
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
Content-Length: 66
Connection: keep-alive

{
  "cookies": {
    "opensource": "awesome"
  }
}
```

你可以使用 `--print` 精确控制打印的内容（`h`：响应头；`b`：响应体），并使用 `--history-print` 覆盖中间请求的打印内容设置。

### 使用 HTTPie 下载二进制文件

有时响应体并不是文本形式，它需要发送到可被不同应用打开的文件：

```
$ http GET https://httpbin.org/image/jpeg
HTTP/1.1 200 OK
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Connection: keep-alive
Content-Length: 35588
Content-Type: image/jpeg
Date: Fri, 09 Aug 2019 20:25:49 GMT
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block


+-----------------------------------------+
| NOTE: binary data not shown in terminal |
+-----------------------------------------+
```

要得到正确的图片，你需要保存到文件：

```
$ http --download GET https://httpbin.org/image/jpeg
HTTP/1.1 200 OK
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Connection: keep-alive
Content-Length: 35588
Content-Type: image/jpeg
Date: Fri, 09 Aug 2019 20:28:13 GMT
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block

Downloading 34.75 kB to "jpeg.jpe"
Done. 34.75 kB in 0.00068s (50.05 MB/s)
```

试一下！图片很可爱。

### 使用 HTTPie 发送自定义请求

你可以发送指定的请求头。这对于需要非标准头的自定义 Web API 很有用：

```
$ http GET https://httpbin.org/headers X-Open-Source-Com:Awesome
{
  "headers": {
    "Accept": "*/*",
    "Accept-Encoding": "gzip, deflate",
    "Host": "httpbin.org",
    "User-Agent": "HTTPie/1.0.2",
    "X-Open-Source-Com": "Awesome"
  }
}
```

最后，如果要发送 JSON 字段（尽管可以指定确切的内容），对于许多嵌套较少的输入，你可以使用快捷方式：


```
$ http --body PUT https://httpbin.org/anything open-source=awesome author=moshez
{
  "args": {},
  "data": "{\"open-source\": \"awesome\", \"author\": \"moshez\"}",
  "files": {},
  "form": {},
  "headers": {
    "Accept": "application/json, */*",
    "Accept-Encoding": "gzip, deflate",
    "Content-Length": "46",
    "Content-Type": "application/json",
    "Host": "httpbin.org",
    "User-Agent": "HTTPie/1.0.2"
  },
  "json": {
    "author": "moshez",
    "open-source": "awesome"
  },
  "method": "PUT",
  "origin": "73.162.254.113, 73.162.254.113",
  "url": "https://httpbin.org/anything"
}
```

下次在调试 Web API 时，无论是你自己的还是别人的，记得放下 cURL，试试 HTTPie 这个命令行工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/getting-started-httpie

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshezhttps://opensource.com/users/mkalindepauleduhttps://opensource.com/users/jamesf
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/pie-raspberry-bake-make-food.png?itok=QRV_R8Fa (Raspberry pie with slice missing)
[2]: https://httpie.org/
[3]: https://github.com/postmanlabs/httpbin
[4]: https://en.wikipedia.org/wiki/Wget
[5]: https://en.wikipedia.org/wiki/CURL
[6]: https://opensource.com/article/19/6/virtual-environments-python-macos
