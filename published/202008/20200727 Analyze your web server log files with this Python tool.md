[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12512-1.html)
[#]: subject: (Analyze your web server log files with this Python tool)
[#]: via: (https://opensource.com/article/20/7/python-lars)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

使用这个 Python 工具分析你的 Web 服务器日志文件
======

> 这个 Python 模块可以以多种格式收集网站使用日志并输出良好结构化数据以进行分析。

![](https://img.linux.net.cn/data/attachment/album/202008/13/155936kpaay0ypkmyk9qd0.jpg)

是否想知道有多少访问者访问过你的网站？或哪个页面、文章或下载最受欢迎？如果你是自托管的博客或网站，那么无论你使用的是 Apache、Nginx 还是 Microsoft IIS（是的，没错），[lars][2]都可以为你提供帮助。

Lars 是 [Python][3] 写的 Web 服务器日志工具包。这意味着你可以使用 Python 通过简单的代码来回溯（或实时）解析日志，并对数据做任何你想做的事：将它存储在数据库中、另存为 CSV 文件，或者立即使用 Python 进行更多分析。

Lars 是 [Dave Jones][4] 写的另一个隐藏的宝石。我最初是在本地 Python 用户组中看到 Dave 演示 lars。几年后，我们开始在 [piwheels][5] 项目中使用它来读取 Apache 日志并将行插入到我们的 Postgres 数据库中。当树莓派用户从 [piwheels.org][6] 下载 Python 包时，我们会记录文件名、时间戳、系统架构（Arm 版本）、发行版名称/版本，Python 版本等。由于它是一个关系数据库，因此我们可以将这些结果加入其他表中以获得有关文件的更多上下文信息。

你可以使用以下方法安装lars：

```
$ pip install lars
```

在某些系统上，正确的方式是 `sudo` `pip3 install lars`。

首先，找到一个 Web 访问日志并制作一个副本。你需要将日志文件下载到计算机上进行操作。我在示例中使用的是 Apache 日志，但是经过一些小（且直观）的更改，你可以使用 Nginx 或 IIS。在典型的 Web 服务器上，你会在 `/var/log/apache2/` 中找到 Apache 日志，通常是 `access.log`、`ssl_access.log`（对于 HTTPS）或 gzip 压缩后的轮转日志文件，如 `access-20200101.gz` 或者 `ssl_access-20200101.gz` 。

首先，日志是什么样的？

```
81.174.152.222 - - [30/Jun/2020:23:38:03 +0000] "GET / HTTP/1.1" 200 6763 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:77.0) Gecko/20100101 Firefox/77.0"
```

这是一个显示了请求源 IP 地址、时间戳、请求文件路径（在本例中是主页 `/`）、HTTP 状态代码，用户代理（Ubuntu 上的 Firefox）等的请求。

你的日志文件将充满这样的条目，不仅是每个打开的页面，还包括返回的每个文件和资源：每个 CSS 样式表、JavaScript 文件和图像，每个 404 请求、每个重定向、每个爬虫。要从日志中获取有意义的数据，你需要对条目进行解析、过滤和排序。这就是 Lars 的用处。本示例将打开一个日志文件并打印每一行的内容：

```
with open('ssl_access.log') as f:
    with ApacheSource(f) as source:
        for row in source:
            print(row)
```

它会为每条日志显示如下结果：

```
Row(remote_host=IPv4Address('81.174.152.222'), ident=None, remote_user=None, time=DateTime(2020, 6, 30, 23, 38, 3), request=Request(method='GET', url=Url(scheme='', netloc='', path_str='/', params='', query_str='', fragment=''), protocol='HTTP/1.1'), status=200, size=6763)
```

它解析了日志条目，并将数据放入结构化格式中。该条目已成为具有与条目数据相关属性的<ruby>[命名元组][7]<rt>namedtuple</rt></ruby>，因此，例如，你可以使用 `row.status` 访问状态代码，并使用 `row.request.url.path_str` 访问路径：

```
with open('ssl_access.log') as f:
    with ApacheSource(f) as source:
        for row in source:
            print(f'hit {row.request.url.path_str} with status code {row.status}')
```

    
如果你只想显示 404 请求，可以执行以下操作：

```
with open('ssl_access.log') as f:
    with ApacheSource(f) as source:
        for row in source:
            if row.status == 404:
                print(row.request.url.path_str)

```

你可能要对这些数据去重，并打印独立的 404 页面数量：

```
s = set()
with open('ssl_access.log') as f:
    with ApacheSource(f) as source:
        for row in source:
            if row.status == 404:
                s.add(row.request.url.path_str)
print(len(s))
```

我和 Dave 一直在努力扩展 piwheel 的日志记录器，使其包含网页点击量、软件包搜索等内容，归功于 lars，这些并不难。它不会告诉我们有关用户的任何答案。我们仍然需要进行数据分析，但它去掉了复杂不便的文件格式，并以我们可以利用的方式将它放入我们的数据库。

查阅 lars 的文档，以了解如何读取 Apache、Nginx 和 IIS 日志，并了解你还可以使用它做什么。再次感谢 Dave 提供的出色工具！

最初发布在 Ben Nuttall 的 Tooling Blog 中，并获许重新发布。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/python-lars

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://lars.readthedocs.io/en/latest/
[3]: https://opensource.com/resources/python
[4]: https://twitter.com/waveform80/
[5]: https://opensource.com/article/18/10/piwheels-python-raspberrypi
[6]: http://piwheels.org
[7]: https://docs.python.org/3/library/collections.html#collections.namedtuple