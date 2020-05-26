[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12252-1.html)
[#]: subject: (3 Python templating languages you should (probably) never use)
[#]: via: (https://opensource.com/article/20/4/python-templating-languages)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

你应该（或许）没使用过的 3 种 Python 模板语言
======

> 包括这 3 个模板语言在内，Python 积累了许多模板语言。

![](https://img.linux.net.cn/data/attachment/album/202005/26/110220lxie9osmd592m5ee.jpg)

当需要使用模板语言来编写 [Python][2] Web 应用时，有很多健壮的解决方案。

有 [Jinja2][3]、[Genshi 和 Mako][4]。甚至还有 [Chameleon][5] 之类的解决方案，虽然有些陈旧，但仍被 [Pyramid][6] 框架推荐。

Python 已经存在了很长时间。此时，在系统的深处，它积累了一些几乎被遗忘的模板语言，它们都是值得一试的。

这些语言就像桉树上可爱的考拉一样，在自己的生态圈里快乐地生活着，有时也会有危险的工作，这些都是很少有人听说过的模板语言，使用过的应该更少。

### 3、string.Template

你是否曾经想过：“如何获得一种没有任何特性的模板语言，而且同时也不需要 `pip install` 安装任何东西？” Python 标准库已经为你提供了答案。虽然没有循环和条件，但 `string.Template` 类是一种最小的模板语言。

使用它很简单。

```
>>> import string
>>> greeting = string.Template("Hello, $name, good $time!")
>>> greeting.substitute(name="OpenSource.com", time="afternoon")
'Hello, OpenSource.com, good afternoon!'
```

### 2、twisted.web.template

你会给一个包罗万象的库送什么礼物？

当然，不是模板语言，因为它已经有了。twisted.web.template 中嵌套了两种模板语言。一种是基于 XML 的，并有一个[很棒的文档][7]。

但是它还有另一种，一种基于使用 Python 作为领域特定语言（DSL）来生成 HTML 文档。

它基于两个原语：包含标签对象的 `twisted.web.template.tags` 和渲染它们的 `twisted.web.template.flattenString`。由于它是 Twisted 的一部分，因此它内置支持高效异步渲染。

此例将渲染一个小页面：

```
async def render(reactor):
    my_title = "A Fun page"
    things = ["one", "two", "red", "blue"]
    template = tags.html(
            tags.head(
                tags.title(my_title),
            ),
            tags.body(
                tags.h1(my_title),
                tags.ul(
                    [tags.li(thing) for thing in things],
                ),
                tags.p(
                    task.deferLater(reactor, 3, lambda: "Hello "),
                    task.deferLater(reactor, 3, lambda: "world!"),
                )
            )
    )
    res = await flattenString(None, template)
    res = res.decode('utf-8')
    with open("hello.html", 'w') as fpout:
        fpout.write(res)
```

该模板是使用 `tags.<TAGNAME>` 来指示层次结构的常规 Python 代码。原生支持渲染字符串，因此任何字符串都正常。

要渲染它，你需要做的是添加调用：

```
from twisted.internet import task, defer
from twisted.web.template import tags, flattenString

def main(reactor):
    return defer.ensureDeferred(render(reactor))
```

最后写上：


```
task.react(main)
```

只需 3 秒（而不是 6 秒），它将渲染一个不错的 HTML 页面。在实际中，这些 `deferLater` 可以是对 HTTP API 的调用：它们将并行发送和处理，而无需付出任何努力。我建议你阅读关于[更好地使用 Twisted][8]。不过，这已经可以工作了。

### 1、Quixote

你会说：“但是 Python 并不是针对 HTML 领域而优化的领域特定语言。” 如果有一种语言可以[转化][9]到 Python，但是更适合定义模板，而不是像 Python 那样按原样解决呢？如果可以的话，请使用“Python 模板语言”（PTL）。

编写自己的语言，有时被说成是一个攻击假想敌人的唐吉坷德项目。当 Quixote（可在 [PyPI][10] 中找到）的创造者决定这样做时，并没有受此影响。

以下将渲染与上面 Twisted 相同的模板。*警告：以下不是有效的 Python 代码*：

```
import time

def render [html] ():
    my_title = "A Fun page"
    things = ["one", "two", "red", "blue"]
    "<html><head><title>"
    my_title
    "</head></title><body><h1>"
    my_title
    "</h1>"
    "<ul>"
    for thing in things:
        "<li>"
        thing
        "</li>"
    "<p>"
    time.sleep(3)
    (lambda: "Hello ")()
    time.sleep(3)
    (lambda: "world!")()
    "</p>"
    "</body></html>"

def write():
    result = render()
    with open("hello.html", 'w') as fpout:
        fpout.write(str(result))
```

但是，如果将它放到 `template.ptl` 文件中，那么可以将其导入到 Quixote 中，并写出可以渲染模板的版本：


```
>>> from quixote import enable_ptl
>>> enable_ptl()
>>> import template
>>> template.write()
```

Quixote 安装了一个导入钩子，它会将 PTL 文件转换为 Python。请注意，此渲染需要 6 秒，而不是 3 秒。你不再获得自由的异步性。

### Python 中的模板太多

Python 库的历史悠久且曲折，其中一些库可以或多或少都能达到类似结果（例如，Python [包管理][11]）。

我希望你喜欢探索这三种*可以*用 Python 创建模板的方式。另外，我建议从[这三个库之一][4]开始了解。

你是否有另一种深奥的模板方法？请在下面的评论中分享！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/python-templating-languages

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
[2]: https://opensource.com/resources/python
[3]: https://opensource.com/article/20/2/jinja2-cheat-sheet
[4]: https://opensource.com/resources/python/template-libraries
[5]: https://chameleon.readthedocs.io/en/latest/
[6]: https://opensource.com/article/18/5/pyramid-framework
[7]: https://twistedmatrix.com/documents/13.1.0/web/howto/twisted-templates.html
[8]: https://opensource.com/article/20/3/treq-python
[9]: https://en.wikipedia.org/wiki/Source-to-source_compiler
[10]: https://pypi.org/project/Quixote/
[11]: https://opensource.com/article/19/4/managing-python-packages
