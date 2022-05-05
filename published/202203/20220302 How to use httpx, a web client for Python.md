[#]: subject: "How to use httpx, a web client for Python"
[#]: via: "https://opensource.com/article/22/3/python-httpx"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14353-1.html"

httpx：一个 Python Web 客户端
======

> Python 的 httpx 包是一个用于 HTTP 交互的一个优秀且灵活的模块。

![](https://img.linux.net.cn/data/attachment/album/202203/13/102042hmtif0i7g3fg0ir0.jpg)

Python 的 `httpx` 包是一个复杂的 Web 客户端。当你安装它后，你就可以用它来从网站上获取数据。像往常一样，安装它的最简单方法是使用 `pip` 工具：

```
$ python -m pip install httpx --user
```

要使用它，把它导入到 Python 脚本中，然后使用 `.get` 函数从一个 web 地址获取数据：

```
import httpx
result = httpx.get("https://httpbin.org/get?hello=world")
result.json()["args"]
```

下面是这个简单脚本的输出：

```
    {'hello': 'world'}
```

### HTTP 响应

默认情况下，`httpx` 不会在非 200 状态下引发错误。

试试这个代码：

```
result = httpx.get("https://httpbin.org/status/404")
result
```

结果是：

```
    <Response [404 NOT FOUND]>
```

可以明确地返回一个响应。添加这个异常处理：

```
try:
    result.raise_for_status()
except Exception as exc:
    print("woops", exc)
```

下面是结果：

```
    woops Client error '404 NOT FOUND' for url 'https://httpbin.org/status/404'
    For more information check: https://httpstatuses.com/404
```

### 自定义客户端

除了最简单的脚本之外，使用一个自定义的客户端是有意义的。除了不错的性能改进，比如连接池，这也是一个配置客户端的好地方。

例如, 你可以设置一个自定义的基本 URL：

```
client = httpx.Client(base_url="https://httpbin.org")
result = client.get("/get?source=custom-client")
result.json()["args"]
```

输出示例：

```
    {'source': 'custom-client'}
```

这对用客户端与一个特定的服务器对话的典型场景很有用。例如，使用 `base_url` 和 `auth`，你可以为认证的客户端建立一个漂亮的抽象：

```
client = httpx.Client(
    base_url="https://httpbin.org",
    auth=("good_person", "secret_password"),
)
result = client.get("/basic-auth/good_person/secret_password")
result.json()
```

输出：

```
    {'authenticated': True, 'user': 'good_person'}
```

你可以用它来做一件更棒的事情，就是在顶层的 “主” 函数中构建客户端，然后把它传递给其他函数。这可以让其他函数使用客户端，并让它们与连接到本地 WSGI 应用的客户端进行单元测试。

```
def get_user_name(client):
    result = client.get("/basic-auth/good_person/secret_password")
    return result.json()["user"]

get_user_name(client)
    'good_person'

def application(environ, start_response):
    start_response('200 OK', [('Content-Type', 'application/json')])
    return [b'{"user": "pretty_good_person"}']
fake_client = httpx.Client(app=application, base_url="https://fake-server")
get_user_name(fake_client)
```

输出：

```
    'pretty_good_person'
```

### 尝试 httpx

请访问 [python-httpx.org][2] 了解更多信息、文档和教程。我发现它是一个与 HTTP 交互的优秀而灵活的模块。试一试，看看它能为你做什么。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/3/python-httpx

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://www.python-httpx.org/
