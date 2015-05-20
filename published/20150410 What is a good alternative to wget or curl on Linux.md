用腻了 wget 或 curl，有什么更好的替代品吗？
================================================================================

如果你经常需要通过终端以非交互模式访问网络服务器（例如，从网络上下载文件，或者是测试 RESTful 网络服务接口），可能你会选择的工具是 wget 或 curl。通过大量的命令行选项，这两种工具都可以处理很多非交互网络访问的情况（比如[这里][1]、[这里][2]，还有[这里][3]）。然而，即使像这些一样的强大的工具，你也只能发挥你所了解的那些选项的功能。除非你很精通那些繁冗的语法细节，这些工具对于你来说只不过是简单的网络下载器而已。

就像其宣传的那样，“给人用 curl 类工具”，[HTTPie][4] 设计用来增强 wget 和 curl 的可用性。它的主要目标是使通过命令行与网络服务器进行交互的过程变得尽可能的人性化。为此，HTTPie 支持具有表现力、但又很简单很直观的语法。它以彩色模式显示响应，并且还有一些不错的优点，比如对 JSON 的良好支持，和持久性会话用以作业流程化。

我知道很多人对把像 wget 和 curl 这样的无处不在的、可用的、完美的工具换成完全没听说过的软件心存疑虑。这种观点是好的，特别是如果你是一个系统管理员、要处理很多不同的硬件的话。然而，对于开发者和终端用户来说，重要的是效率。如果我发现了一个工具的用户更佳替代品，那么我认为采用易于使用的版本来节省宝贵的时间是毫无疑问的。没有必要对替换掉的工具保持信仰忠诚。毕竟，对于 Linux 来说，最好的事情就是可以选择。

在这篇文章中，让我们来了解并展示一下我所说的 HTTPie，一个用户友好的 wget 和 curl 的替代。

![](https://farm8.staticflickr.com/7633/16849137018_bcc7a616fc_b.jpg)

### 在 Linux 上安装 HTTPie ###

HTTPie 是用 Python 写的，所以你可以在几乎所有地方（Linux，MacOSX，Windows）安装它。而且，在大多数的 Linux 发行版中都有编译好的安装包。

#### Debian，Ubuntu 或者 Linux Mint： ####

    $ sudo apt-get install httpie

#### Fedora： ####

    $ sudo yum install httpie

#### CentOS/RHEL： ####

首先，启用[EPEL 仓库][5]，然后运行：

    $ sudo yum install httpie

对于任何 Linux 发行版，另一个安装方法时使用[pip][6]。

    $ sudo pip install --upgrade httpie

### HTTPie 的例子 ###

当你安装完 HTTPie 后，你可以通过输入 http 命令来调用它。在这篇文章的剩余部分，我会展示几个有用的 http 命令的例子。

#### 例1：定制头部 ####

你可以使用 &lt;header:value&gt; 的格式来定制头部。例如，我们发送一个 HTTP GET 请求到 www.test.com ，使用定制用户代理（user-agent）和来源（referer），还有定制头部（比如 MyParam）。

    $ http www.test.com User-Agent:Xmodulo/1.0 Referer:http://xmodulo.com MyParam:Foo

注意到当使用 HTTP GET 方法时，就无需明确指定 HTTP 方法。

这个 HTTP 请求看起来如下：

    GET / HTTP/1.1
    Host: www.test.com
    Accept: */*
    Referer: http://xmodulo.com
    Accept-Encoding: gzip, deflate, compress
    MyParam: Foo
    User-Agent: Xmodulo/1.0

#### 例2：下载文件 ####

你可以把 http 作为文件下载器来使用。你需要像下面一样把输出重定向到文件。

    $ http www.test.com/my_file.zip > my_file.zip

或者：

    $ http --download www.test.com/my_file.zip

#### 例3：定制 HTTP 方法 ####

除了默认的 GET 方法，你还可以使用其他方法（比如 PUT，POST，HEAD）。例如，发送一个 HTTP PUT 请求：

    $ http PUT www.test.com name='Dan Nanni' email=dan@email.com

#### 例4：提交表单 ####

使用 http 命令提交表单很容易，如下：

    $ http -f POST www.test.com name='Dan Nanni' comment='Hi there'

'-f' 选项使 http 命令序列化数据字段，并将 'Content-Type' 设置为 "application/x-www-form-urlencoded; charset=utf-8"。

这个 HTTP POST 请求看起来如下：

    POST / HTTP/1.1
    Host: www.test.com
    Content-Length: 31
    Content-Type: application/x-www-form-urlencoded; charset=utf-8
    Accept-Encoding: gzip, deflate, compress
    Accept: */*
    User-Agent: HTTPie/0.8.0
    
    name=Dan+Nanni&comment=Hi+there

####例５：JSON 支持

HTTPie 内置 JSON（一种日渐普及的数据交换格式）支持。事实上，HTTPie 默认使用的内容类型（content-type）就是 JSON。因此，当你不指定内容类型发送数据字段时，它们会自动序列化为 JSON 对象。

    $ http POST www.test.com name='Dan Nanni' comment='Hi there'

这个 HTTP POST 请求看起来如下：

    POST / HTTP/1.1
    Host: www.test.com
    Content-Length: 44
    Content-Type: application/json; charset=utf-8
    Accept-Encoding: gzip, deflate, compress
    Accept: application/json
    User-Agent: HTTPie/0.8.0
    
    {"name": "Dan Nanni", "comment": "Hi there"}

#### 例6：输出重定向 ####

HTTPie 的另外一个用户友好特性是输入重定向，你可以使用缓冲数据提供 HTTP 请求内容。例如：

    $ http POST api.test.com/db/lookup < my_info.json

或者：

    $ echo '{"name": "Dan Nanni"}' | http POST api.test.com/db/lookup

### 结束语 ###

在这篇文章中，我介绍了 HTTPie，一个 wget 和 curl 的可能替代工具。除了这里展示的几个简单的例子，你可以在其[官方网站][7]上找到 HTTPie 的很多有趣的应用。再次重复一遍，一款再强大的工具也取决于你对它的了解程度。从个人而言，我更倾向于 HTTPie，因为我在寻找一种更简洁的测试复杂网络接口的方法。

你怎么看？

--------------------------------------------------------------------------------

via: http://xmodulo.com/wget-curl-alternative-linux.html

作者：[Dan Nanni][a]
译者：[wangjiezhe](https://github.com/wangjiezhe)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/how-to-download-multiple-files-with-wget.html
[2]:http://xmodulo.com/how-to-use-custom-http-headers-with-wget.html
[3]:https://linux.cn/article-4957-1.html
[4]:https://github.com/jakubroztocil/httpie
[5]:https://linux.cn/article-2324-1.html
[6]:http://ask.xmodulo.com/install-pip-linux.html
[7]:https://github.com/jakubroztocil/httpie
