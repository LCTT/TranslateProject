[#]: subject: "Analyze web pages with Python requests and Beautiful Soup"
[#]: via: "https://opensource.com/article/22/6/analyze-web-pages-python-requests-beautiful-soup"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14769-1.html"

使用 Python 的 requests 和 Beautiful Soup 来分析网页
======

![](https://img.linux.net.cn/data/attachment/album/202206/28/132859owwf9az49k2oje2o.jpg)

> 学习这个 Python 教程，轻松提取网页的有关信息。

浏览网页可能占了你一天中的大部分时间。然而，你总是需要手动浏览，这很讨厌，不是吗？你必须打开浏览器，然后访问一个网站，单击按钮，移动鼠标……相当费时费力。如果能够通过代码与互联网交互，岂不是更好吗？

在 Python 的 `requests` 模块的帮助下，你可以使用 Python 从互联网中获取数据：

```
import requests

DATA = "https://opensource.com/article/22/5/document-source-code-doxygen-linux"
PAGE = requests.get(DATA)

print(PAGE.text)
```

在以上代码示例中，你首先导入了 `requests` 模块。接着，你创建了两个变量：其中一个叫做 `DATA`，它用来保存你要下载的 URL。在之后的代码中，你将能够在每次运行应用程序时提供不同的 URL。不过，就目前而言，最简单的方法是“硬编码”一个测试 URL，以达到演示目的。

另一个变量是 `PAGE`。代码读取了存储在 `DATA` 中的 URL，然后把它作为参数传入 `requests.get` 函数，最后用变量 `PAGE` 来接收函数的返回值。`requests` 模块及其 `.get` 函数的功能是：“读取”一个互联网地址（一个 URL）、访问互联网，并下载位于该地址的任何内容。

当然，其中涉及到很多步骤。幸运的是，你不必自己弄清楚，这也正是 Python 模块存在的原因。最后，你告诉 Python 打印 `requests.get` 存储在 `PAGE` 变量的 `.text` 字段中的所有内容。

### Beautiful Soup

如果你运行上面的示例代码，你会得到示例 URL 的所有内容，并且，它们会不加选择地输出到你的终端里。这是因为在代码中，你对 `requests` 收集到的数据所做的唯一事情，就是打印它。然而，解析文本才是更加有趣的。

Python 可以通过其最基本的功能来“读取”文本，但解析文本允许你搜索模式、特定单词、HTML 标签等。你可以自己解析 `requests` 返回的文本，不过，使用专门的模块会容易得多。针对 HTML 和 XML 文本，我们有 [Beautiful Soup][2] 库。

下面这段代码完成了同样的事情，只不过，它使用了 Beautiful Soup 来解析下载的文本。因为 Beautiful Soup 可以识别 HTML 元素，所以你可以使用它的一些内置功能，让输出对人眼更友好。

例如，在程序的末尾，你可以使用 Beautiful Soup 的 `.prettify` 函数来处理文本（使其更美观），而不是直接打印原始文本：

```
from bs4 import BeautifulSoup
import requests

PAGE = requests.get("https://opensource.com/article/22/5/document-source-code-doxygen-linux")
SOUP = BeautifulSoup(PAGE.text, 'html.parser')

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    # do a thing here
    print(SOUP.prettify())
```

通过以上代码，我们确保了每个打开的 HTML 标签都输出在单独的一行，并带有适当的缩进，以帮助说明标签的继承关系。实际上，Beautiful Soup 能够通过更多方式来理解 HTML 标签，而不仅仅是将它打印出来。

你可以选择打印某个特定标签，而不是打印整个页面。例如，尝试将打印的选择器从 `print(SOUP.prettify())` 更改为：

```
print(SOUP.p)
```

这只会打印一个 `<p>` 标签。具体来说，它只打印遇到的第一个 `<p>` 标签。要打印所有的 `<p>` 标签，你需要使用一个循环。

### 循环

使用 Beautiful Soup 的 `find_all` 函数，你可以创建一个 `for` 循环，从而遍历 `SOUP` 变量中包含的整个网页。除了 `<p>` 标签之外，你可能也会对其他标签感兴趣，因此最好将其构建为自定义函数，由 Python 中的 `def` 关键字（意思是 <ruby>“定义”<rt>define</rt></ruby>）指定。

```
def loopit():
    for TAG in SOUP.find_all('p'):
        print(TAG)
```

你可以随意更改临时变量 `TAG` 的名字，例如 `ITEM` 或 `i` 或任何你喜欢的。每次循环运行时，`TAG` 中都会包含 `find_all` 函数的搜索结果。在此代码中，它搜索的是 `<p>` 标签。

函数不会自动执行，除非你显式地调用它。你可以在代码的末尾调用这个函数：

```
# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    # do a thing here
    loopit()
```

运行代码以查看所有的 `<p>` 标签和它们的内容。

### 只获取内容

你可以通过指定只需要 “<ruby>字符串<rt>string</rt></ruby>”（它是 “<ruby>单词<rt>words</rt></ruby>” 的编程术语）来排除打印标签。

```
def loopit():
    for TAG in SOUP.find_all('p'):
        print(TAG.string)
```

当然，一旦你有了网页的文本，你就可以用标准的 Python 字符串库进一步解析它。例如，你可以使用 `len` 和 `split` 函数获得单词个数：

```
def loopit():
    for TAG in SOUP.find_all('p'):
        if TAG.string is not None:
            print(len(TAG.string.split()))
```

这将打印每个段落元素中的字符串个数，省略那些没有任何字符串的段落。要获得字符串总数，你需要用到变量和一些基本数学知识：

```
def loopit():
    NUM = 0
    for TAG in SOUP.find_all('p'):
        if TAG.string is not None:
            NUM = NUM + len(TAG.string.split())
    print("Grand total is ", NUM)
```

### Python 作业

你可以使用 Beautiful Soup 和 Python 提取更多信息。以下是有关如何改进你的应用程序的一些想法：

* [接受输入][3]，这样你就可以在启动应用程序时，指定要下载和分析的 URL。
* 统计页面上图片（`<img>` 标签）的数量。
* 统计另一个标签中的图片（`<img>` 标签）的数量（例如，仅出现在 `<main>` div 中的图片，或仅出现在 `</p>` 标签之后的图片）。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/analyze-web-pages-python-requests-beautiful-soup

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/python_programming_question.png
[2]: https://beautiful-soup-4.readthedocs.io/en/latest/
[3]: https://opensource.com/article/17/3/python-tricks-artists-interactivity-Python-scripts
