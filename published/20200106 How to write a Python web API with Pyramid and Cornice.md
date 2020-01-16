[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11788-1.html)
[#]: subject: (How to write a Python web API with Pyramid and Cornice)
[#]: via: (https://opensource.com/article/20/1/python-web-api-pyramid-cornice)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

如何使用 Pyramid 和 Cornice 编写 Python Web API
======

> 使用 Pyramid 和 Cornice 构建和描述可扩展的 RESTful Web 服务。

![](https://img.linux.net.cn/data/attachment/album/202001/16/120352fcgeeccvfgt8sfvc.jpg)

[Python][2] 是一种高级的、面向对象的编程语言，它以其简单的语法而闻名。它一直是构建 RESTful API 的顶级编程语言之一。

[Pyramid][3] 是一个 Python Web 框架，旨在随着应用的扩展而扩展：这可以让简单的应用很简单，也可以增长为大型、复杂的应用。此外，Pyramid 为 PyPI （Python 软件包索引）提供了强大的支持。[Cornice][4] 为使用 Pyramid 构建和描述 RESTful Web 服务提供了助力。

本文将使用 Web 服务的例子来获取名人名言，来展示如何使用这些工具。

### 建立 Pyramid 应用

首先为你的应用创建一个虚拟环境，并创建一个文件来保存代码：

```
$ mkdir tutorial
$ cd tutorial
$ touch main.py
$ python3 -m venv env
$ source env/bin/activate
(env) $ pip3 install cornice twisted
```

### 导入 Cornice 和 Pyramid 模块

使用以下命令导入这些模块：

```
from pyramid.config import Configurator
from cornice import Service
```

### 定义服务

将引用服务定义为 `Service` 对象：

```
QUOTES = Service(name='quotes',
                 path='/',
                 description='Get quotes')
```

### 编写引用逻辑

到目前为止，这仅支持获取名言。用 `QUOTES.get` 装饰函数。这是将逻辑绑定到 REST 服务的方法：

```
@QUOTES.get()
def get_quote(request):
    return {
        'William Shakespeare': {
            'quote': ['Love all, trust a few, do wrong to none',
            'Some are born great, some achieve greatness, and some have greatness thrust upon them.']
    },
    'Linus': {
        'quote': ['Talk is cheap. Show me the code.']
        }
    }
```

请注意，与其他框架不同，装饰器*不会*更改 `get_quote` 函数。如果导入此模块，你仍然可以定期调用该函数并检查结果。

在为 Pyramid RESTful 服务编写单元测试时，这很有用。

### 定义应用对象

最后，使用 `scan` 查找所有修饰的函数并将其添加到配置中：

```
with Configurator() as config:
    config.include("cornice")
    config.scan()
    application = config.make_wsgi_app()
```

默认扫描当前模块。如果要扫描软件包中的所有模块，你也可以提供软件包的名称。

### 运行服务

我使用 Twisted 的 WSGI 服务器运行该应用，但是如果需要，你可以使用任何其他 [WSGI][5] 服务器，例如 Gunicorn 或 uWSGI。

```
(env)$ python -m twisted web --wsgi=main.application
```

默认情况下，Twisted 的 WSGI 服务器运行在端口 8080 上。你可以使用 [HTTPie][6] 测试该服务：

```
(env) $ pip install httpie
...
(env) $ http GET <http://localhost:8080/>
HTTP/1.1 200 OK
Content-Length: 220
Content-Type: application/json
Date: Mon, 02 Dec 2019 16:49:27 GMT
Server: TwistedWeb/19.10.0
X-Content-Type-Options: nosniff

{
    "Linus": {
        "quote": [
            "Talk is cheap. Show me the code."
        ]
    },
    "William Shakespeare": {
        "quote": [
            "Love all,trust a few,do wrong to none",
            "Some are born great, some achieve greatness, and some greatness thrust upon them."
        ]
    }
}
```

### 为什么要使用 Pyramid？

Pyramid 并不是最受欢迎的框架，但它已在 [PyPI][7] 等一些引人注目的项目中使用。我喜欢 Pyramid，因为它是认真对待单元测试的框架之一：因为装饰器不会修改函数并且没有线程局部变量，所以可以直接从单元测试中调用函数。例如，需要访问数据库的函数将从通过 `request.config` 传递的 `request.config` 对象中获取它。这允许单元测试人员将模拟（或真实）数据库对象放入请求中，而不用仔细设置全局变量、线程局部变量或其他特定于框架的东西。

如果你正在寻找一个经过测试的库来构建你接下来的 API，请尝试使用 Pyramid。你不会失望的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/python-web-api-pyramid-cornice

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_python_programming.png?itok=ynSL8XRV (Searching for code)
[2]: https://opensource.com/resources/python
[3]: https://opensource.com/article/18/5/pyramid-framework
[4]: https://cornice.readthedocs.io/en/latest/
[5]: https://en.wikipedia.org/wiki/Web_Server_Gateway_Interface
[6]: https://opensource.com/article/19/8/getting-started-httpie
[7]: https://pypi.org/
