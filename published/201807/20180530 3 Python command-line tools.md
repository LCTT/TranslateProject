3 个 Python 命令行工具
======

> 用 Click、Docopt 和 Fire 库写你自己的命令行应用。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-lead-tool-box.png?itok=NrJYb417)

有时对于某项工作来说一个命令行工具就足以胜任。命令行工具是一种从你的 shell 或者终端之类的地方交互或运行的程序。[Git][2] 和 [Curl][3] 就是两个你也许已经很熟悉的命令行工具。

当你有一小段代码需要在一行中执行多次或者经常性地被执行，命令行工具就会很有用。Django 开发者执行 `./manage.py runserver` 命令来启动他们的网络服务器；Docker 开发者执行 `docker-compose up` 来启动他们的容器。你想要写一个命令行工具的原因可能和你一开始想写代码的原因有很大不同。

对于这个月的 Python 专栏，我们有 3 个库想介绍给希望为自己编写命令行工具的 Python 使用者。

### Click

[Click][4] 是我们最爱的用来开发命令行工具的 Python 包。其：

  * 有一个富含例子的出色文档
  * 包含说明如何将命令行工具打包成一个更加易于执行的 Python 应用程序
  * 自动生成实用的帮助文本
  * 使你能够叠加使用可选和必要参数，甚至是 [多个命令][5]
  * 有一个 Django 版本（ [`django-click`][6] ）用来编写管理命令

Click 使用  `@click.command()` 去声明一个函数作为命令，同时可以指定必要和可选参数。

```
# hello.py
import click 

@click.command()
@click.option('--name', default='', help='Your name')
def say_hello(name):
    click.echo("Hello {}!".format(name))

if __name__ == '__main__':
    say_hello()
```

`@click.option()` 修饰器声明了一个 [可选参数][7] ，而 `@click.argument()` 修饰器声明了一个 [必要参数][8]。你可以通过叠加修饰器来组合可选和必要参数。`echo()` 方法将结果打印到控制台。

```
$ python hello.py --name='Lacey'
Hello Lacey!
```

### Docopt

[Docopt][9] 是一个命令行工具的解析器，类似于命令行工具的 Markdown。如果你喜欢流畅地编写应用文档，在本文推荐的库中 Docopt 有着最好的格式化帮助文本。它不是我们最爱的命令行工具开发包的原因是它的文档犹如把人扔进深渊，使你开始使用时会有一些小困难。然而，它仍是一个轻量级的、广受欢迎的库，特别是当一个漂亮的说明文档对你来说很重要的时候。

Docopt 对于如何格式化文章开头的 docstring 是很特别的。在工具名称后面的 docsring 中，顶部元素必须是 `Usage:` 并且需要列出你希望命令被调用的方式（比如：自身调用，使用参数等等）。`Usage:` 需要包含 `help` 和 `version` 参数。

docstring 中的第二个元素是 `Options:`，对于在 `Usages:` 中提及的可选项和参数，它应当提供更多的信息。你的 docstring 的内容变成了你帮助文本的内容。

```
"""HELLO CLI

Usage:
    hello.py
    hello.py <name>
    hello.py -h|--help
    hello.py -v|--version

Options:
    <name>  Optional name argument.
    -h --help  Show this screen.
    -v --version  Show version.
"""

from docopt import docopt

def say_hello(name):
    return("Hello {}!".format(name))


if __name__ == '__main__':
    arguments = docopt(__doc__, version='DEMO 1.0')
    if arguments['<name>']:
        print(say_hello(arguments['<name>']))
    else:
        print(arguments)
```

在最基本的层面，Docopt 被设计用来返回你的参数键值对。如果我不指定上述的 `name` 调用上面的命令，我会得到一个字典的返回值：

```
$ python hello.py
{'--help': False,
 '--version': False,
 '<name>': None}
```

这里可看到我没有输入 `help` 和 `version` 标记并且 `name` 参数是 `None`。

但是如果我带着一个 `name` 参数调用，`say_hello` 函数就会执行了。

```
$ python hello.py Jeff
Hello Jeff!
```

Docopt 允许同时指定必要和可选参数，且各自有着不同的语法约定。必要参数需要在 `ALLCAPS` 和 `<carets>` 中展示，而可选参数需要单双横杠显示，就像 `--like`。更多内容可以阅读 Docopt 有关 [patterns][10] 的文档。

### Fire

[Fire][11] 是谷歌的一个命令行工具开发库。尤其令人喜欢的是当你的命令需要更多复杂参数或者处理 Python 对象时，它会聪明地尝试解析你的参数类型。

Fire 的 [文档][12] 包括了海量的样例，但是我希望这些文档能被更好地组织。Fire 能够处理 [同一个文件中的多条命令][13]、使用 [对象][14] 的方法作为命令和 [分组][15] 命令。

它的弱点在于输出到控制台的文档。命令行中的 docstring 不会出现在帮助文本中，并且帮助文本也不一定标识出参数。

```
import fire


def say_hello(name=''):
    return 'Hello {}!'.format(name)


if __name__ == '__main__':
    fire.Fire()
```

参数是必要还是可选取决于你是否在函数或者方法定义中为其指定了一个默认值。要调用命令，你必须指定文件名和函数名，比较类似 Click 的语法：

```
$ python hello.py say_hello Rikki
Hello Rikki!
```

你还可以像标记一样传参，比如 `--name=Rikki`。

### 额外赠送：打包！

Click 包含了使用 `setuptools` [打包][16] 命令行工具的使用说明（强烈推荐按照说明操作）。

要打包我们第一个例子中的命令行工具，将以下内容加到你的 `setup.py` 文件里：

```
from setuptools import setup

setup(
    name='hello',
    version='0.1',
    py_modules=['hello'],
    install_requires=[
        'Click',
    ],
    entry_points='''
        [console_scripts]
        hello=hello:say_hello
    ''',
)
```

任何你看见 `hello` 的地方，使用你自己的模块名称替换掉，但是要记得忽略 `.py` 后缀名。将 `say_hello` 替换成你的函数名称。

然后，执行 `pip install --editable` 来使你的命令在命令行中可用。

现在你可以调用你的命令，就像这样：

```
$ hello --name='Jeff'
Hello Jeff!
```

通过打包你的命令，你可以省掉在控制台键入 `python hello.py --name='Jeff'` 这种额外的步骤以减少键盘敲击。这些指令也很可能可在我们提到的其他库中使用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/3-python-command-line-tools

作者：[Jeff Triplett][a]，[Lacey Williams Hensche][1]
选题：[lujun9972](https://github.com/lujun9972)
译者：[hoppipolla-](https://github.com/hoppipolla-)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/laceynwilliams
[1]:https://opensource.com/users/laceynwilliams
[2]:https://git-scm.com/
[3]:https://curl.haxx.se/
[4]:http://click.pocoo.org/5/
[5]:http://click.pocoo.org/5/commands/
[6]:https://github.com/GaretJax/django-click
[7]:http://click.pocoo.org/5/options/
[8]:http://click.pocoo.org/5/arguments/
[9]:http://docopt.org/
[10]:https://github.com/docopt/docopt#usage-pattern-format
[11]:https://github.com/google/python-fire
[12]:https://github.com/google/python-fire/blob/master/docs/guide.md
[13]:https://github.com/google/python-fire/blob/master/docs/guide.md#exposing-multiple-commands
[14]:https://github.com/google/python-fire/blob/master/docs/guide.md#version-3-firefireobject
[15]:https://github.com/google/python-fire/blob/master/docs/guide.md#grouping-commands
[16]:http://click.pocoo.org/5/setuptools/

