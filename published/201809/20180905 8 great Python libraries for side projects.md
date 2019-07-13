8 个用于业余项目的优秀 Python 库
======

> 这些库可以使你更容易构架个人项目。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd)

在 Python/Django 的世界里有这样一个谚语：为语言而来，为社区而留。对绝大多数人来说的确是这样的，但是，还有一件事情使得我们一直停留在 Python 的世界里，不愿离开，那就是我们可以很容易地利用一顿午餐或晚上几个小时的时间，把一个想法快速地实现出来。

这个月，我们来探讨一些我们喜欢用来快速完成<ruby>业余项目<rt>side projects</rt></ruby>或打发午餐时间的 Python 库。

### 在数据库中即时保存数据：Dataset

当我们想要在不知道最终数据库表长什么样的情况下，快速收集数据并保存到数据库中的时候，[Dataset][1] 库将是我们的最佳选择。Dataset 库有一个简单但功能强大的 API，因此我们可以很容易的把数据保存下来，之后再进行整理。

Dataset 建立在 SQLAlchemy 之上，所以如果需要对它进行扩展，你会感到非常熟悉。使用 Django 内建的 [inspectdb][2] 管理命令可以很容易地把底层数据库模型导入 Django 中，这使得和现有数据库一同工作不会出现任何障碍。

### 从网页抓取数据：Beautiful Soup

[Beautiful Soup][3]（一般写作 BS4）库使得从 HTML 网页中提取信息变得非常简单。当我们需要把非结构化或弱结构化的 HTML 转换为结构化数据的时候，就需要使用 Beautiful Soup 。用它来处理 XML 数据也是一个很好的选择，否则 XML 的可读性或许会很差。

### 和 HTTP 内容打交道：Requests

当需要和 HTTP 内容打交道的时候，[Requests][4] 毫无疑问是最好的标准库。当我们想要抓取 HTML 网页或连接 API 的时候，都离不开 Requests 库。同时，它也有很好的文档。

### 编写命令行工具：Click

当需要写一个简单的 Python 脚本作为命令行工具的时候，[Click][5] 是我最喜欢用的库。它的 API 非常直观，并且在实现时经过了深思熟虑，我们只需要记住很少的几个模式。它的文档也很优秀，这使得学习其高级特性更加容易。

### 对事物命名：Python Slugify

众所周知，命名是一件困难的事情。[Python Slugify][6] 是一个非常有用的库，它可以把一个标题或描述转成一个带有特性的唯一标识符。如果你正在做一个 Web 项目，并且你想要使用对<ruby>搜索引擎优化友好<rt>SEO-friendly</rt></ruby>的链接，那么，使用 Python Slugify 可以让这件事变得很容易。

### 和插件打交道：Pluggy

[Pluggy][7] 库相对较新，但是如果你想添加一个插件系统到现有应用中，那么使用 Pluggy 是最好也是最简单的方式。如果你使用过 pytest，那么实际上相当于已经使用过 Pluggy 了，虽然你还不知道它。

### 把 CSV 文件转换到 API 中：DataSette

[DataSette][8] 是一个神奇的工具，它可以很容易地把 CSV 文件转换为全特性的只读 REST JSON API，同时，不要把它和 Dataset 库混淆。Datasette 有许多特性，包括创建图表和 geo（用于创建交互式地图），并且很容易通过容器或第三方网络主机进行部署。

### 处理环境变量等：Envparse

如果你不想在源代码中保存 API 密钥、数据库凭证或其他敏感信息，那么你便需要解析环境变量，这时候 [envparse][9] 是最好的选择。Envparse 能够处理环境变量、ENV 文件、变量类型，甚至还可以进行预处理和后处理（例如，你想要确保变量名总是大写或小写的）。

有什么你最喜欢的用于业余项目的 Python 库不在这个列表中吗？请在评论中和我们分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/python-libraries-side-projects

作者：[Jeff Triplett][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/laceynwilliams
[1]: https://dataset.readthedocs.io/en/latest/
[2]: https://docs.djangoproject.com/en/2.1/ref/django-admin/#django-admin-inspectdb
[3]: https://www.crummy.com/software/BeautifulSoup/
[4]: http://docs.python-requests.org/
[5]: http://click.pocoo.org/5/
[6]: https://github.com/un33k/python-slugify
[7]: https://pluggy.readthedocs.io/en/latest/
[8]: https://github.com/simonw/datasette
[9]: https://github.com/rconradharris/envparse
