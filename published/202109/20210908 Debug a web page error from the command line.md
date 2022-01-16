[#]: subject: "Debug a web page error from the command line"
[#]: via: "https://opensource.com/article/21/9/wget-debug-web-server"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13795-1.html"

从命令行使用 wget 调试网页错误
======

> 调试 Web 服务器的一种方法是使用 wget 命令行程序。

![](https://img.linux.net.cn/data/attachment/album/202109/17/225018elcip4pii4qcknir.jpg)

有时在管理一个网站时，事情会被搞得一团糟。你可能会删除一些陈旧的内容，用重定向到其他页面来代替。后来，在做了其他改动后，你发现一些网页变得完全无法访问了。你可能会在浏览器中看到一个错误：“该页面没有正确重定向”，并建议你检查你的 cookie。

![Redirect loop example in Firefox][2]

调试这种情况的一个方法是使用 `wget` 命令行程序，使用 `-S` 选项来显示所有的服务器响应。当使用 `wget` 进行调试时，我也喜欢使用 `-O` 选项将输出保存到一些临时文件中，以备以后需要查看其内容。

```
$ wget -O /tmp/test.html -S http://10.0.0.11/announce/
--2021-08-24 17:09:49--  http://10.0.0.11/announce/
Connecting to 10.0.0.11:80... connected.

HTTP request sent, awaiting response... 

HTTP/1.1 302 Found
Date: Tue, 24 Aug 2021 22:09:49 GMT
Server: Apache/2.4.48 (Fedora)
X-Powered-By: PHP/7.4.21
Location: http://10.0.0.11/assets/
Content-Length: 0
Keep-Alive: timeout=5, max=100
Connection: Keep-Alive
Content-Type: text/html; charset=UTF-8
Location: http://10.0.0.11/assets/ [following]
--2021-08-24 17:09:49--  http://10.0.0.11/assets/
Reusing existing connection to 10.0.0.11:80.

HTTP request sent, awaiting response... 
 
HTTP/1.1 302 Found
Date: Tue, 24 Aug 2021 22:09:49 GMT
Server: Apache/2.4.48 (Fedora)
X-Powered-By: PHP/7.4.21
Location: http://10.0.0.11/announce/
Content-Length: 0
Keep-Alive: timeout=5, max=99
Connection: Keep-Alive
Content-Type: text/html; charset=UTF-8
Location: http://10.0.0.11/announce/ [following]
--2021-08-24 17:09:49--  http://10.0.0.11/announce/
Reusing existing connection to 10.0.0.11:80.
.
.
.
20 redirections exceeded.
```

我在这个输出中省略了很多重复的内容。通过阅读服务器的响应，你可以看到 `http://10.0.0.11/announce/` 立即重定向到 `http://10.0.0.11/assets/`，然后又重定向到 `http://10.0.0.11/announce/`。以此类推。这是一个无休止的循环，`wget` 将在 20 次重定向后退出。但有了这些调试信息，你可以修复重定向，避免循环。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/wget-debug-web-server

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://opensource.com/sites/default/files/uploads/firefox-redirect-loop.png (Redirect loop example in Firefox)
[3]: https://creativecommons.org/licenses/by-sa/4.0/