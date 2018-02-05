4 个用于构建优秀的命令行用户界面的 Python 库
============================================================

> 在这个分为两篇的关于[具有绝佳命令行界面的终端程序][18]的系列文章的第二篇教程中，我们将讨论 Prompt、Toolkit、Click、Pygments 和 Fuzzy Finder 。

![Getting started with 4 practical Python libraries: Prompt Toolkit, Click, Pygments, and Fuzzy Finder](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/library-libraries-search.png?itok=YE0Qk276 "Getting started with 4 practical Python libraries: Prompt Toolkit, Click, Pygments, and Fuzzy Finder")

> 图片来自 ： [美国 Mennonite 教堂档案][16] 。 Opensource.com. [CC BY-SA 4.0][17]

这是我的一个分为两篇的关于[具有绝佳命令行界面的终端程序][1]的系列文章的第二篇教程。在[第一篇文章][18]中，我们讨论了一些能够使命令行应用用起来令人感到愉悦的特性。在第二篇文章中，我们来看看如何用 Python 的一些库来实现这些特性。

我打算用少于 20 行 Python 代码来实现。让我们开始吧。

### Python Prompt Toolkit

我习惯于把这个库称为命令行应用的瑞士军刀，它可以作为 [readline][5] 、[curses][6] 等的替代品。让我们首先安装这个库，然后开始该教程：

```
pip install prompt_toolkit
```

我们以一个简单的 REPL （LCTT 译注：REPL —— Read-Eval-Print Loop，交互式开发环境）开始。一个典型的 REPL 会接收用户的输入，进行一个操作，然后输出结果。比如在我们的例子中，我们将要实现一个具有 “回显” 功能的 REPL 。它仅仅是原样打印出用户的输入：

#### REPL

```
from prompt_toolkit import prompt

while 1:
    user_input = prompt('>')
    print(user_input)
```

这就是实现 REPL 的全部代码。它可以读取用户的输入，然后打印出用户的输入内容。在这段代码中使用的 `prompt` 函数来自 `prompt_toolkit` 库，它是 `readline` 库的一个替代品。

#### 命令历史

为了增强我们的 REPL 的功能，我们可以添加命令历史：

```
from prompt_toolkit import prompt
from prompt_toolkit.history import FileHistory

while 1:
    user_input = prompt('>', 
                        history=FileHistory('history.txt'),
                       )
    print(user_input)
```

我们刚刚给 REPL 添加了持久的**命令历史**。现在，我们可以使用上/下箭头来浏览**命令历史**，并使用 `Ctrl-R` 来搜索**命令历史**。它满足了命令行的基本准则。

#### 自动推荐

在第一篇教程中，我讲到的一个可发现性技巧是自动推荐**历史命令**。（我是首先在 **fish shell** 中看到的这一特性）让我们把这一特性加入到我们的 REPL 中：

```
from prompt_toolkit import prompt
from prompt_toolkit.history import FileHistory
from prompt_toolkit.auto_suggest import AutoSuggestFromHistory

while 1:
    user_input = prompt('>', 
                        history=FileHistory('history.txt'),
                        auto_suggest=AutoSuggestFromHistory(),
                       )
    print(user_input)
```

我们只需要给 `prompt()` API 调用添加一个新的参数。现在，我们有了一个具有 **fish shell** 风格的 REPL，它可以自动推荐**历史命令**。

#### 自动补全

现在，让我们通过**自动补全**来加强 Tab 补全。它能够在用户开始输入的时候弹出可能的命令推荐。

REPL 如何来进行推荐呢？我们使用一个字典来进行可能项的推荐。

比如说我们实现一个针对 SQL 的 REPL 。我们可以把 SQL 关键字存到自动补全字典里面。让我们看一看这是如何实现的：

```
from prompt_toolkit import prompt
from prompt_toolkit.history import FileHistory
from prompt_toolkit.auto_suggest import AutoSuggestFromHistory
from prompt_toolkit.contrib.completers import WordCompleter

SQLCompleter = WordCompleter(['select', 'from', 'insert', 'update', 'delete', 'drop'],
                             ignore_case=True)

while 1:
    user_input = prompt('SQL>', 
                        history=FileHistory('history.txt'),
                        auto_suggest=AutoSuggestFromHistory(),
                        completer=SQLCompleter,
                        )
    print(user_input)
```

再次说明，我们只是简单的使用了 `prompt-toolkit` 内建的一个叫做 `WordCompleter` 的补全特性，它能够把用户输入和可能推荐的字典进行匹配，然后提供一个列表。

现在，我们有了一个能够自动补全、fish shell 风格的历史命令推荐以及上/下浏览历史的 REPL 。实现这些特性只用了不到 10 行的实际代码。

### Click

`Click` 是一个命令行创建工具包，使用它能够更容易的为程序解析命令行选项的参数和常量。在这儿我们不讨论如何使用 `Click` 来作为参数解析器。相反，我们将会看看 `Click` 带有的一些功能。

安装 `Click`： 

```
pip install click
```

#### 分页器

分页器是 Unix 系统上的实用工具，它们能够一次一页地显示很长的输出。分页器的一些例子包括 `less`、`more`、`most` 等。通过分页器来显示一个命令的输出不仅仅是一个友好的设计，同时也是必要的。

让我们进一步改进前面的例子。我们不再使用默认的 `print()` 语句，取而代之的是 `click.echo_via_pager()` 。它将会把输出通过分页器发送到标准输出。这是平台无关的，因此在 Unix 系统或 Windows 系统上均能工作。如果必要的话，`click_via_pager` 会尝试使用一个合适的默认分页器来输出，从而能够显示代码高亮。

```
from prompt_toolkit import prompt
from prompt_toolkit.history import FileHistory
from prompt_toolkit.auto_suggest import AutoSuggestFromHistory
from prompt_toolkit.contrib.completers import WordCompleter
import click

SQLCompleter = WordCompleter(['select', 'from', 'insert', 'update', 'delete', 'drop'],
                             ignore_case=True)

while 1:
    user_input = prompt(u'SQL>',
                        history=FileHistory('history.txt'),
                        auto_suggest=AutoSuggestFromHistory(),
                        completer=SQLCompleter,
                        )
    click.echo_via_pager(user_input)
```

#### 编辑器

在我前面的文章中一个值得一提的细节是，当命令过于复杂的时候进入编辑器来编辑。`Click` 有一个[简单的 API][24] 能够打开编辑器，然后把在编辑器中输入的文本返回给应用。

```
import click
message = click.edit()
```

### Fuzzy Finder

`Fuzzy Finder` 是一种通过少量输入来为用户减少推荐的方法。幸运的是，有一个库可以实现 `Fuzzy Finder` 。让我们首先安装这个库：

```
pip install fuzzyfinder
```

`Fuzzy Finder` 的 API 很简单。用户向它传递部分字符串和一系列可能的选择，然后，`Fuzzy Finder` 将会返回一个与部分字符串匹配的列表，这一列表是通过模糊算法根据相关性排序得出的。比如：

```
>>> from fuzzyfinder import fuzzyfinder

>>> suggestions = fuzzyfinder('abc', ['abcd', 'defabca', 'aagbec', 'xyz', 'qux'])

>>> list(suggestions)
['abcd', 'defabca', 'aagbec']
```

现在我们有了 `fuzzyfinder`，让我们把它加入到我们的 SQL REPL 中。方法是我们自定义一个 `completer` 而不是使用来自 `prompt-toolkit` 库的 `WordCompleter` 。比如：

```
from prompt_toolkit import prompt
from prompt_toolkit.history import FileHistory
from prompt_toolkit.auto_suggest import AutoSuggestFromHistory
from prompt_toolkit.completion import Completer, Completion
import click
from fuzzyfinder import fuzzyfinder

SQLKeywords = ['select', 'from', 'insert', 'update', 'delete', 'drop']

class SQLCompleter(Completer):
    def get_completions(self, document, complete_event):
        word_before_cursor = document.get_word_before_cursor(WORD=True)
        matches = fuzzyfinder(word_before_cursor, SQLKeywords)
        for m in matches:
            yield Completion(m, start_position=-len(word_before_cursor))

while 1:
    user_input = prompt(u'SQL>',
                        history=FileHistory('history.txt'),
                        auto_suggest=AutoSuggestFromHistory(),
                        completer=SQLCompleter(),
                        )
    click.echo_via_pager(user_input)
```

### Pygments

现在，让我们给用户输入添加语法高亮。我们正在搭建一个 SQL REPL，如果具有彩色高亮的 SQL 语句，这会很棒。

`Pygments` 是一个提供语法高亮的库，内建支持超过 300 种语言。添加语法高亮能够使应用变得彩色化，从而能够帮助用户在执行程序前发现 SQL 中存在的错误，比如拼写错误、引号不匹配或括号不匹配。

首先，安装 `Pygments` ：

```
pip install pygments
```

让我们使用 `Pygments` 来为 SQL REPL 添加颜色：

```
from prompt_toolkit import prompt
from prompt_toolkit.history import FileHistory
from prompt_toolkit.auto_suggest import AutoSuggestFromHistory
from prompt_toolkit.completion import Completer, Completion
import click
from fuzzyfinder import fuzzyfinder
from pygments.lexers.sql import SqlLexer

SQLKeywords = ['select', 'from', 'insert', 'update', 'delete', 'drop']

class SQLCompleter(Completer):
    def get_completions(self, document, complete_event):
        word_before_cursor = document.get_word_before_cursor(WORD=True)
        matches = fuzzyfinder(word_before_cursor, SQLKeywords)
        for m in matches:
            yield Completion(m, start_position=-len(word_before_cursor))

while 1:
    user_input = prompt(u'SQL>',
                        history=FileHistory('history.txt'),
                        auto_suggest=AutoSuggestFromHistory(),
                        completer=SQLCompleter(),
                        lexer=SqlLexer,
                        )
    click.echo_via_pager(user_input)
```

`Prompt Toolkit` 能够和 `Pygments` 一同很好的工作。我们把 `Pygments` 提供的 `SqlLexer` 加入到来自 `prompt-toolkit` 的 `prompt` 中。现在，所有的用户输入都会被当作 SQL 语句，并进行适当着色。

### 结论

我们的“旅途”通过创建一个强大的 REPL 结束，这个 REPL 具有常见的 shell 的全部特性，比如历史命令，键位绑定，用户友好性比如自动补全、模糊查找、分页器支持、编辑器支持和语法高亮。我们仅用少于 20 行 Python 代码就实现了这个 REPL 。

不是很简单吗？现在，你没有理由不会写一个自己的命令行应用了。下面这些资源可能有帮助：

*   [Click][7] （命令行界面创建工具）
*   [Fuzzy Finder][8]
*   [Prompt Toolkit][9]
*   在 `prompt-toolkit` 的仓库中查看 [Prompt Toolkit 教程][10] 和[例子][11] 
*   [Pygments][12]

你也可以在我在 [PyCon US 2017][13] 的演讲[优秀的命令行工具][14]中学到更多东西，该会议是 5 月 20 日在波特兰，俄勒冈举行的。

--------------------------------------------------------------------------------

作者简介：

Amjith Ramanujam - Amjith Ramanujam 是 `pgcli` 和 `mycli` 的创始人。人们认为它们很酷，他表示笑纳赞誉。他喜欢用 Python、JavaScript 和 C 编程。他喜欢写一些简单、易于理解的代码，有时候这样做是成功的。

----------------------------

via: https://opensource.com/article/17/5/4-practical-python-libraries

作者：[Amjith Ramanujam][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/amjith
[1]:https://opensource.com/tags/python?src=programming_resource_menu
[2]:https://opensource.com/tags/javascript?src=programming_resource_menu
[3]:https://opensource.com/tags/perl?src=programming_resource_menu
[4]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ&amp;amp;src=programming_resource_menu
[5]:https://docs.python.org/2/library/readline.html
[6]:https://docs.python.org/2/library/curses.html
[7]:http://click.pocoo.org/5/
[8]:https://pypi.python.org/pypi/fuzzyfinder
[9]:https://python-prompt-toolkit.readthedocs.io/en/latest/
[10]:https://github.com/jonathanslenders/python-prompt-toolkit/tree/master/examples/tutorial
[11]:https://github.com/jonathanslenders/python-prompt-toolkit/tree/master/examples/
[12]:http://pygments.org/
[13]:https://us.pycon.org/2017/
[14]:https://us.pycon.org/2017/schedule/presentation/518/
[15]:https://opensource.com/article/17/5/4-practical-python-libraries?rate=SEw4SQN1U2QSXM7aUHJZb2ZsPwyFylPIbgcVLgC_RBg
[16]:https://www.flickr.com/photos/mennonitechurchusa-archives/6987770030/in/photolist-bDu9zC-ovJ8gx-aecxqE-oeZerP-orVJHj-oubnD1-odmmg1-ouBNHR-otUoui-occFe4-ot7LTD-oundj9-odj4iX-9QSskz-ouaoMo-ous5V6-odJKBW-otnxbj-osXERb-iqdyJ8-ovgmPu-bDukCS-sdk9QB-5JQauY-fteJ53-ownm41-ov9Ynr-odxW52-rgqPBV-osyhxE-6QLRz9-i7ki3F-odbLQd-ownZP1-osDU6d-owrTXy-osLLXS-out7Dp-hNHsya-wPbFkS-od7yfD-ouA53c-otnzf9-ormX8L-ouTj6h-e8kAze-oya2zR-hn3B2i-aDNNqk-aDNNmR
[17]:https://creativecommons.org/licenses/by-sa/4.0/
[18]:https://linux.cn/article-8526-1.html
[19]:https://python-prompt-toolkit.readthedocs.io/en/latest/
[20]:http://click.pocoo.org/5/
[21]:http://pygments.org/
[22]:https://pypi.python.org/pypi/fuzzyfinder
[23]:https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop
[24]:http://click.pocoo.org/5/utils/#launching-editors
[25]:https://opensource.com/user/125521/feed
[26]:https://opensource.com/article/17/5/4-practical-python-libraries#comments
[27]:https://opensource.com/users/amjith
