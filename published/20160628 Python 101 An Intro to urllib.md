Python 学习：urllib 简介
=================================

Python 3 的 urllib 模块是一堆可以处理 URL 的组件集合。如果你有 Python 2 的知识，那么你就会注意到 Python 2 中有 urllib 和 urllib2 两个版本的模块。这些现在都是 Python 3 的 urllib 包的一部分。当前版本的 urllib 包括下面几部分：

- urllib.request
- urllib.error
- urllib.parse
- urllib.rebotparser

接下来我们会分开讨论除了 urllib.error 以外的几部分。官方文档实际推荐你尝试第三方库， requests，一个高级的 HTTP 客户端接口。然而我依然认为知道如何不依赖第三方库打开 URL 并与之进行交互是很有用的，而且这也可以帮助你理解为什么 requests 包是如此的流行。


### urllib.request

urllib.request 模块期初是用来打开和获取 URL 的。让我们看看你可以用函数 urlopen 可以做的事：


```
>>> import urllib.request
>>> url = urllib.request.urlopen('https://www.google.com/')
>>> url.geturl()
'https://www.google.com/'
>>> url.info()
<http.client.HTTPMessage object at 0x7fddc2de04e0>
>>> header = url.info()
>>> header.as_string()
('Date: Fri, 24 Jun 2016 18:21:19 GMT\n'
 'Expires: -1\n'
 'Cache-Control: private, max-age=0\n'
 'Content-Type: text/html; charset=ISO-8859-1\n'
 'P3P: CP="This is not a P3P policy! See '
 'https://www.google.com/support/accounts/answer/151657?hl=en for more info."\n'
 'Server: gws\n'
 'X-XSS-Protection: 1; mode=block\n'
 'X-Frame-Options: SAMEORIGIN\n'
 'Set-Cookie: '
 'NID=80=tYjmy0JY6flsSVj7DPSSZNOuqdvqKfKHDcHsPIGu3xFv41LvH_Jg6LrUsDgkPrtM2hmZ3j9V76pS4K_cBg7pdwueMQfr0DFzw33SwpGex5qzLkXUvUVPfe9g699Qz4cx9ipcbU3HKwrRYA; '
 'expires=Sat, 24-Dec-2016 18:21:19 GMT; path=/; domain=.google.com; HttpOnly\n'
 'Alternate-Protocol: 443:quic\n'
 'Alt-Svc: quic=":443"; ma=2592000; v="34,33,32,31,30,29,28,27,26,25"\n'
 'Accept-Ranges: none\n'
 'Vary: Accept-Encoding\n'
 'Connection: close\n'
 '\n')
>>> url.getcode()
200
```

在这里我们包含了需要的模块，然后告诉它打开 Google 的 URL。现在我们就有了一个可以交互的 HTTPResponse 对象。我们要做的第一件事是调用方法 geturl ，它会返回根据 URL 获取的资源。这可以让我们发现 URL 是否进行了重定向。

接下来调用 info ，它会返回网页的元数据，比如请求头信息。因此，我们可以将结果赋给我们的 headers 变量，然后调用它的方法 as_string 。就可以打印出我们从 Google 收到的头信息。你也可以通过 getcode 得到网页的 HTTP 响应码，当前情况下就是 200，意思是正常工作。

如果你想看看网页的 HTML 代码，你可以调用变量 url 的方法 read。我不准备再现这个过程，因为输出结果太长了。

请注意 request 对象默认发起 GET 请求，除非你指定了它的 data 参数。如果你给它传递了 data 参数，这样 request 对象将会变成 POST 请求。

---

### 下载文件

urllib 一个典型的应用场景是下载文件。让我们看看几种可以完成这个任务的方法：

```
>>> import urllib.request
>>> url = 'http://www.blog.pythonlibrary.org/wp-content/uploads/2012/06/wxDbViewer.zip'
>>> response = urllib.request.urlopen(url)
>>> data = response.read()
>>> with open('/home/mike/Desktop/test.zip', 'wb') as fobj:
...     fobj.write(data)
...
```

这个例子中我们打开一个保存在我的博客上的 zip 压缩文件的 URL。然后我们读出数据并将数据写到磁盘。一个替代此操作的方案是使用 urlretrieve ：

```
>>> import urllib.request
>>> url = 'http://www.blog.pythonlibrary.org/wp-content/uploads/2012/06/wxDbViewer.zip'
>>> tmp_file, header = urllib.request.urlretrieve(url)
>>> with open('/home/mike/Desktop/test.zip', 'wb') as fobj:
...     with open(tmp_file, 'rb') as tmp:
...         fobj.write(tmp.read())
```

方法 urlretrieve 会把网络对象拷贝到本地文件。除非你在使用 urlretrieve 的第二个参数指定你要保存文件的路径，否则这个文件将被拷贝到临时文件夹的随机命名的一个文件中。这个可以为你节省一步操作，并且使代码看起来更简单：

```
>>> import urllib.request
>>> url = 'http://www.blog.pythonlibrary.org/wp-content/uploads/2012/06/wxDbViewer.zip'
>>> urllib.request.urlretrieve(url, '/home/mike/Desktop/blog.zip')
('/home/mike/Desktop/blog.zip',
 <http.client.HTTPMessage object at 0x7fddc21c2470>)
```

如你所见，它返回了文件保存的路径，以及从请求得来的头信息。

### 设置你的用户代理

当你使用浏览器访问网页时，浏览器会告诉网站它是谁。这就是所谓的 user-agent （用户代理）字段。Python 的 urllib 会表示它自己为 Python-urllib/x.y ， 其中 x 和 y 是你使用的 Python 的主、次版本号。有一些网站不认识这个用户代理字段，然后网站可能会有奇怪的表现或者根本不能正常工作。辛运的是你可以很轻松的设置你自己的 user-agent 字段。

```
>>> import urllib.request
>>> user_agent = ' Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:47.0) Gecko/20100101 Firefox/47.0'
>>> url = 'http://www.whatsmyua.com/'
>>> headers = {'User-Agent': user_agent}
>>> request = urllib.request.Request(url, headers=headers)
>>> with urllib.request.urlopen(request) as response:
...     with open('/home/mdriscoll/Desktop/user_agent.html', 'wb') as out:
...         out.write(response.read())
```

这里设置我们的用户代理为 Mozilla FireFox ，然后我们访问 <http://www.whatsmyua.com/> ， 它会告诉我们它识别出的我们的 user-agent 字段。之后我们将 url 和我们的头信息传给 urlopen 创建一个 Request 实例。最后我们保存这个结果。如果你打开这个结果，你会看到我们成功的修改了自己的 user-agent 字段。使用这段代码尽情的尝试不同的值来看看它是如何改变的。

---

### urllib.parse

urllib.parse 库是用来拆分和组合 URL 字符串的标准接口。比如，你可以使用它来转换一个相对的 URL 为绝对的 URL。让我们试试用它来转换一个包含查询的 URL ：


```
>>> from urllib.parse import urlparse
>>> result = urlparse('https://duckduckgo.com/?q=python+stubbing&t=canonical&ia=qa')
>>> result
ParseResult(scheme='https', netloc='duckduckgo.com', path='/', params='', query='q=python+stubbing&t=canonical&ia=qa', fragment='')
>>> result.netloc
'duckduckgo.com'
>>> result.geturl()
'https://duckduckgo.com/?q=python+stubbing&t=canonical&ia=qa'
>>> result.port
None
```

这里我们导入了函数 urlparse ， 并且把一个包含搜索查询字串的 duckduckgo 的 URL 作为参数传给它。我的查询字串是搜索关于 “python stubbing” 的文章。如你所见，它返回了一个 ParseResult 对象，你可以用这个对象了解更多关于 URL 的信息。举个例子，你可以获取到端口信息（本例中没有端口信息）、网络位置、路径和很多其它东西。

### 提交一个 Web 表单

这个模块还有一个方法 urlencode 可以向 URL 传输数据。 urllib.parse 的一个典型使用场景是提交 Web 表单。让我们通过搜索引擎 duckduckgo 搜索 Python 来看看这个功能是怎么工作的。

```
>>> import urllib.request
>>> import urllib.parse
>>> data = urllib.parse.urlencode({'q': 'Python'})
>>> data
'q=Python'
>>> url = 'http://duckduckgo.com/html/'
>>> full_url = url + '?' + data
>>> response = urllib.request.urlopen(full_url)
>>> with open('/home/mike/Desktop/results.html', 'wb') as f:
...     f.write(response.read())
```

这个例子很直接。基本上我们是使用 Python 而不是浏览器向 duckduckgo 提交了一个查询。要完成这个我们需要使用 urlencode 构建我们的查询字符串。然后我们把这个字符串和网址拼接成一个完整的正确 URL ，然后使用 urllib.request 提交这个表单。最后我们就获取到了结果然后保存到磁盘上。

---

### urllib.robotparser

robotparser 模块是由一个单独的类 RobotFileParser 构成的。这个类会回答诸如一个特定的用户代理是否获取已经设置了 robot.txt 的网站的 URL。 robot.txt 文件会告诉网络爬虫或者机器人当前网站的那些部分是不允许被访问的。让我们看一个简单的例子：

```
>>> import urllib.robotparser
>>> robot = urllib.robotparser.RobotFileParser()
>>> robot.set_url('http://arstechnica.com/robots.txt')
None
>>> robot.read()
None
>>> robot.can_fetch('*', 'http://arstechnica.com/')
True
>>> robot.can_fetch('*', 'http://arstechnica.com/cgi-bin/')
False
```

这里我们导入了 robot 分析器类，然后创建一个实例。然后我们给它传递一个表明网站 robots.txt 位置的 URL 。接下来我们告诉分析器来读取这个文件。完成后，我们给它了一组不同的 URL 让它找出那些我们可以爬取而那些不能爬取。我们很快就看到我们可以访问主站但是不能访问 cgi-bin 路径。

---

### 总结一下

现在你就有能力使用 Python 的 urllib 包了。在这一节里，我们学习了如何下载文件、提交 Web 表单、修改自己的用户代理以及访问 robots.txt。 urllib 还有一大堆附加功能没有在这里提及，比如网站身份认证。你可能会考虑在使用 urllib 进行身份认证之前切换到 requests 库，因为 requests 已经以更易用和易调试的方式实现了这些功能。我同时也希望提醒你 Python 已经通过 http.cookies 模块支持 Cookies 了，虽然在 request 包里也很好的封装了这个功能。你应该可能考虑同时试试两个来决定那个最适合你。

--------------------------------------------------------------------------------

via: http://www.blog.pythonlibrary.org/2016/06/28/python-101-an-intro-to-urllib/

作者：[Mike][a]
译者：[Ezio](https://github.com/oska874)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.blog.pythonlibrary.org/author/mld/
