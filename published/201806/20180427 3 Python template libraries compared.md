3 个 Python 模板库比较
=====

> 你的下一个 Python 项目需要一个模板引擎来自动生成 HTML 吗？这有几种选择。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/library-libraries-search.png?itok=xH8xSU_G)

在我的日常工作中，我花费大量的时间将各种来源的数据转化为可读的信息。虽然很多时候这只是电子表格或某种类型的图表或其他数据可视化的形式，但也有其他时候，将数据以书面形式呈现是有意义的。

但我的头疼地方就是复制和粘贴。如果你要将数据从源头移动到标准化模板，则不应该复制和粘贴。这很容易出错，说实话，这会浪费你的时间。

因此，对于我定期发送的任何遵循一个共同的模式的信息，我倾向于找到某种方法来自动化至少一部分信息。也许这涉及到在电子表格中创建一些公式，一个快速 shell 脚本或其他解决方案，以便使用从外部源提取的信息自动填充模板。

但最近，我一直在探索 Python 模板来完成从其他数据集创建报告和图表的大部分工作。

Python 模板引擎非常强大。我的简化报告创建的使用案例仅仅触及了它的皮毛。许多开发人员正在利用这些工具来构建完整的 web 应用程序和内容管理系统。但是，你并不需要有一个复杂的 web 应用程序才能使用 Python 模板工具。

### 为什么选择模板？

每个模板工具都不甚相同，你应该阅读文档以了解其确切的用法。但让我们创建一个假设的例子。假设我想创建一个简短的页面，列出我最近编写的所有 Python 主题。就像这样：

```
<html>
  <head>
    <title>My Python articles</title>
  </head>
  <body>

    <p>These are some of the things I have written about Python:</p>
    <ul>
      <li>Python GUIs</li>
      <li>Python IDEs</li>
      <li>Python web scrapers</li>
    </ul>

  </body>
</html>
```

当它仅仅是这三个项目时，维护它是很简单的。但是当我想添加第四个、第五个或第六十七个时会发生什么？我可以从包含我所有页面列表的 CSV 文件或其他数据文件生成它，而不是手动编码此页面吗？我可以轻松地为我写的每个主题创建重复内容吗？我可以以编程方式更改每个页面上的文本标题吗？这就是模板引擎可以发挥作用的地方。

有许多不同的选择，今天我将与你其中分享三个，顺序不分先后：[Mako][6]、 [Jinja2][7] 和 [Genshi][8]。

### Mako

[Mako][6] 是以 MIT 许可证发布的 Python 模板工具，专为快速展现而设计的（与 Jinja2 不同）。Reddit 已经使用 Mako 来展现他们的网页，它同时也是 Pyramid 和 Pylons 等 web 框架的默认模板语言。它相当简单且易于使用。你可以使用几行代码来设计模板；支持 Python 2.x 和 3.x，它是一个功能强大且功能丰富的工具，具有[良好的文档][9]，这一点我认为是必须的。其功能包括过滤器、继承、可调用块和内置缓存系统，这些系统可以被大型或复杂的 web 项目导入。

### Jinja2

Jinja2 是另一个快速且功能全面的选项，可用于 Python 2.x 和 3.x，遵循 BSD 许可证。Jinja2 从功能角度与 Mako 有很多重叠，因此对于新手来说，你在两者之间的选择可能会归结为你喜欢的格式化风格。Jinja2 还将模板编译为字节码，并具有 HTML 转义、沙盒、模板继承和模板沙盒部分的功能。其用户包括 Mozilla、 SourceForge、 NPR、 Instagram 等，并且还具有[强大的文档][10]。与 Mako 在模板内部使用 Python 逻辑不同的是，Jinja2 使用自己的语法。

### Genshi

[Genshi][8] 是我会提到的第三个选择。它是一个 XML 工具，具有强大的模板组件，所以如果你使用的数据已经是 XML 格式，或者你需要使用网页以外的格式，Genshi 可能成为你的一个很好的解决方案。HTML 基本上是一种 XML（好吧，不是精确的，但这超出了本文的范围，有点卖弄学问了），因此格式化它们非常相似。由于我通常使用的很多数据都是 XML 或其他类型的数据，因此我非常喜欢使用我可以用于多种事物的工具。

发行版目前仅支持 Python 2.x，尽管 Python 3 支持存在于主干中，但我提醒你，它看起来并没有得到有效的开发。Genshi 遵循 BSD 许可证提供。

### 示例

因此，在上面的假设示例中，我不会每次写新主题时都更新 HTML 文件，而是通过编程方式对其进行更新。我可以创建一个模板，如下所示：

```
<html>
  <head>
    <title>My Python articles</title>
  </head>
  <body>

    <p>These are some of the things I have written about Python:</p>
    <ul>
      %for topic in topics:
      <li>${topic}</li>
      %endfor
    </ul>

  </body>
</html>
```

然后我可以使用我的模板库来迭代每个主题，比如使用 Mako，像这样：

```
from mako.template import Template

mytemplate = Template(filename='template.txt')
print(mytemplate.render(topics=("Python GUIs","Python IDEs","Python web scrapers")))
```

当然，在现实世界的用法中，我不会将这些内容手动地列在变量中，而是将它们从外部数据源（如数据库或 API）中提取出来。

这些不是仅有的 Python 模板引擎。如果你正在开始创建一个将大量使用模板的新项目，那么你考虑的可能不仅仅是这三种选择。在 [Python 维基][11]上查看更全面的列表，以获得更多值得考虑的项目。


--------------------------------------------------------------------------------

via: https://opensource.com/resources/python/template-libraries

作者：[Jason Baker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:https://opensource.com/resources/python?intcmp=7016000000127cYAAQ
[2]:https://opensource.com/resources/python/ides?intcmp=7016000000127cYAAQ
[3]:https://opensource.com/resources/python/gui-frameworks?intcmp=7016000000127cYAAQ
[4]:https://opensource.com/tags/python?intcmp=7016000000127cYAAQ
[5]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ
[6]:http://www.makotemplates.org/
[7]:http://jinja.pocoo.org/
[8]:https://genshi.edgewall.org/
[9]:http://docs.makotemplates.org/en/latest/
[10]:http://jinja.pocoo.org/docs/2.10/
[11]:https://wiki.python.org/moin/Templating
