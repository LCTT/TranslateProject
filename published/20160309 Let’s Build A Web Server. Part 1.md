搭个 Web 服务器（一）
=====================================

一天，有一个正在散步的妇人恰好路过一个建筑工地，看到三个正在工作的工人。她问第一个人：“你在做什么？”第一个人没好气地喊道：“你没看到我在砌砖吗？”妇人对这个答案不满意，于是问第二个人：“你在做什么？”第二个人回答说：“我在建一堵砖墙。”说完，他转向第一个人，跟他说：“嗨，你把墙砌过头了。去把刚刚那块砖弄下来！”然而，妇人对这个答案依然不满意，于是又问了第三个人相同的问题。第三个人仰头看着天，对她说：“我在建造世界上最大的教堂。”当他回答时，第一个人和第二个人在为刚刚砌错的砖而争吵。他转向那两个人，说：“不用管那块砖了。这堵墙在室内，它会被水泥填平，没人会看见它的。去砌下一层吧。”

这个故事告诉我们：如果你能够理解整个系统的构造，了解系统的各个部件如何相互结合（如砖、墙还有整个教堂），你就能够更快地定位及修复问题（那块砌错的砖）。

如果你想从头开始创造一个 Web 服务器，那么你需要做些什么呢？

我相信，如果你想成为一个更好的开发者，你**必须**对日常使用的软件系统的内部结构有更深的理解，包括编程语言、编译器与解释器、数据库及操作系统、Web 服务器及 Web 框架。而且，为了更好更深入地理解这些系统，你**必须**从头开始，用一砖一瓦来重新构建这个系统。

荀子曾经用这几句话来表达这种思想：

>“不闻不若闻之。（I hear and I forget.）”

![](https://ruslanspivak.com/lsbasi-part4/LSBAWS_confucius_hear.png)

>“闻之不若见之。（I see and I remember.）”

![](https://ruslanspivak.com/lsbasi-part4/LSBAWS_confucius_see.png)

>“知之不若行之。（I do and I understand.）”

![](https://ruslanspivak.com/lsbasi-part4/LSBAWS_confucius_do.png)

我希望你现在能够意识到，重新建造一个软件系统来了解它的工作方式是一个好主意。

在这个由三篇文章组成的系列中，我将会教你构建你自己的 Web 服务器。我们开始吧~

先说首要问题：Web 服务器是什么？

![](https://ruslanspivak.com/lsbaws-part1/LSBAWS_HTTP_request_response.png)

简而言之，它是一个运行在一个物理服务器上的网络服务器（啊呀，服务器套服务器），等待客户端向其发送请求。当它接收请求后，会生成一个响应，并回送至客户端。客户端和服务端之间通过 HTTP 协议来实现相互交流。客户端可以是你的浏览器，也可以是使用 HTTP 协议的其它任何软件。

最简单的 Web 服务器实现应该是什么样的呢？这里我给出我的实现。这个例子由 Python 写成，即使你没听说过 Python（它是一门超级容易上手的语言，快去试试看！），你也应该能够从代码及注释中理解其中的理念：

```
import socket

HOST, PORT = '', 8888

listen_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
listen_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
listen_socket.bind((HOST, PORT))
listen_socket.listen(1)
print 'Serving HTTP on port %s ...' % PORT
while True:
    client_connection, client_address = listen_socket.accept()
    request = client_connection.recv(1024)
    print request

    http_response = """\
HTTP/1.1 200 OK

Hello, World!
"""
    client_connection.sendall(http_response)
    client_connection.close()
```

将以上代码保存为 webserver1.py，或者直接从 [GitHub][1] 上下载这个文件。然后，在命令行中运行这个程序。像这样：

```
$ python webserver1.py
Serving HTTP on port 8888 …
```

现在，在你的网页浏览器的地址栏中输入 URL：http://localhost:8888/hello ，敲一下回车，然后来见证奇迹。你应该看到“Hello, World!”显示在你的浏览器中，就像下图那样：

![](https://ruslanspivak.com/lsbaws-part1/browser_hello_world.png)

说真的，快去试一试。你做实验的时候，我会等着你的。

完成了？不错！现在我们来讨论一下它实际上是怎么工作的。

首先我们从你刚刚输入的 Web 地址开始。它叫 [URL][2]，这是它的基本结构：

![](https://ruslanspivak.com/lsbaws-part1/LSBAWS_URL_Web_address.png)

URL 是一个 Web 服务器的地址，浏览器用这个地址来寻找并连接 Web 服务器，并将上面的内容返回给你。在你的浏览器能够发送 HTTP 请求之前，它需要与 Web 服务器建立一个 TCP 连接。然后会在 TCP 连接中发送 HTTP 请求，并等待服务器返回 HTTP 响应。当你的浏览器收到响应后，就会显示其内容，在上面的例子中，它显示了“Hello, World!”。

我们来进一步探索在发送 HTTP 请求之前，客户端与服务器建立 TCP 连接的过程。为了建立链接，它们使用了所谓“套接字（socket）”。我们现在不直接使用浏览器发送请求，而在命令行中使用 `telnet` 来人工模拟这个过程。

在你运行 Web 服务器的电脑上，在命令行中建立一个 telnet 会话，指定一个本地域名，使用端口 8888，然后按下回车：

```
$ telnet localhost 8888
Trying 127.0.0.1 …
Connected to localhost.
```

这个时候，你已经与运行在你本地主机的服务器建立了一个 TCP 连接。在下图中，你可以看到一个服务器从头开始，到能够建立 TCP 连接的基本过程。

![](https://ruslanspivak.com/lsbaws-part1/LSBAWS_socket.png)

在同一个 telnet 会话中，输入 `GET /hello HTTP/1.1`，然后输入回车：

```
$ telnet localhost 8888
Trying 127.0.0.1 …
Connected to localhost.
GET /hello HTTP/1.1

HTTP/1.1 200 OK
Hello, World!
```

你刚刚手动模拟了你的浏览器（的工作）！你发送了 HTTP 请求，并且收到了一个 HTTP 应答。下面是一个 HTTP 请求的基本结构：

![](https://ruslanspivak.com/lsbaws-part1/LSBAWS_HTTP_request_anatomy.png)

HTTP 请求的第一行由三部分组成：HTTP 方法（`GET`，因为我们想让我们的服务器返回一些内容），以及标明所需页面的路径 `/hello`，还有协议版本。

为了简单一些，我们刚刚构建的 Web 服务器完全忽略了上面的请求内容。你也可以试着输入一些无用内容而不是“GET /hello HTTP/1.1”，但你仍然会收到一个“Hello, World!”响应。

一旦你输入了请求行并敲了回车，客户端就会将请求发送至服务器；服务器读取请求行，就会返回相应的 HTTP 响应。

下面是服务器返回客户端（在上面的例子里是 telnet）的响应内容：

![](https://ruslanspivak.com/lsbaws-part1/LSBAWS_HTTP_response_anatomy.png)

我们来解析它。这个响应由三部分组成：一个状态行 `HTTP/1.1 200 OK`，后面跟着一个空行，再下面是响应正文。

HTTP 响应的状态行 HTTP/1.1 200 OK 包含了 HTTP 版本号，HTTP 状态码以及 HTTP 状态短语“OK”。当浏览器收到响应后，它会将响应正文显示出来，这也就是为什么你会在浏览器中看到“Hello, World!”。

以上就是 Web 服务器的基本工作模型。总结一下：Web 服务器创建一个处于监听状态的套接字，循环接收新的连接。客户端建立 TCP 连接成功后，会向服务器发送  HTTP 请求，然后服务器会以一个 HTTP 响应做应答，客户端会将 HTTP 的响应内容显示给用户。为了建立 TCP 连接，客户端和服务端均会使用套接字。

现在，你应该了解了 Web 服务器的基本工作方式，你可以使用浏览器或其它 HTTP 客户端进行试验。如果你尝试过、观察过，你应该也能够使用 telnet，人工编写 HTTP 请求，成为一个“人形” HTTP 客户端。

现在留一个小问题：“你要如何在不对程序做任何改动的情况下，在你刚刚搭建起来的 Web 服务器上适配 Django, Flask 或 Pyramid 应用呢？”

我会在本系列的第二部分中来详细讲解。敬请期待。

顺便，我在撰写一本名为《搭个 Web 服务器：从头开始》的书。这本书讲解了如何从头开始编写一个基本的 Web 服务器，里面包含本文中没有的更多细节。订阅邮件列表，你就可以获取到这本书的最新进展，以及发布日期。

--------------------------------------------------------------------------------

via: https://ruslanspivak.com/lsbaws-part1/

作者：[Ruslan][a]
译者：[StdioA](https://github.com/StdioA)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://linkedin.com/in/ruslanspivak/
[1]: https://github.com/rspivak/lsbaws/blob/master/part1/webserver1.py
[2]: http://en.wikipedia.org/wiki/Uniform_resource_locator
    
