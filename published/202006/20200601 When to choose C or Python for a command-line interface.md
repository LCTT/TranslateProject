[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12286-1.html)
[#]: subject: (When to choose C or Python for a command-line interface)
[#]: via: (https://opensource.com/article/20/6/c-python-cli)
[#]: author: (Erik O'Shaughnessy https://opensource.com/users/jnyjny)

用 Python 解析命令行参数
======

> 借鉴 C 语言的历史，学习如何用 Python 编写有用的 CLI 程序。

![](https://img.linux.net.cn/data/attachment/album/202006/05/231539dyinqzceci4ci8vv.jpg)

本文的目标很简单：帮助新的 Python 开发者了解一些关于[命令行接口][2]（CLI）的历史和术语，并探讨如何在 Python 中编写这些有用的程序。

### 最初……

首先，从 [Unix][3] 的角度谈谈命令行界面设计。

Unix 是一种计算机操作系统，也是 Linux 和 macOS（以及许多其他操作系统）的祖先。在图形用户界面之前，用户通过命令行提示符与计算机进行交互（想想如今的 [Bash][4] 环境）。在 Unix 下开发这些程序的主要语言是 [C][5]，它的[功能][6]非常强大。

因此，我们至少应该了解 [C 程序][7]的基础知识。

假设你没有读过上面那个链接的内容，C 程序的基本架构是一个叫做 `main` 的函数，它的签名是这样的。

```
   int main(int argc, char **argv)
   {
   ...
   }
```

对于 Python 程序员来说，这应该不会显得太奇怪。C 函数首先有一个返回类型、一个函数名，然后是括号内的类型化参数。最后，函数的主体位于大括号之间。函数名 `main` 是[运行时链接器][8]（构造和运行程序的程序）如何决定从哪里开始执行你的程序。如果你写了一个 C 程序，而它没有包含一个名为 `main` 的函数，它将什么也做不了。伤心。

函数参数变量 `argc` 和 `argv` 共同描述了程序被调用时用户在命令行输入的字符串列表。在典型的 Unix 命名传统中，`argc` 的意思是“<ruby>参数计数<rt>argument count</rt></ruby>”，`argv` 的意思是“<ruby>参数向量<rt>argument vector</rt></ruby>”。向量听起来比列表更酷，而 `argl` 听起来就像一个要勒死的求救声。我们是 Unix 系统的程序员，我们不求救。我们让*其他人*哭着求救。

#### 再进一步

```
$ ./myprog foo bar -x baz
```

如果 `myprog` 是用 C 语言实现的，则 `argc` 的值是 5，而 `argv` 是一个有五个条目的字符指针数组。（不要担心，如果这听起来过于技术，那换句话说，这是一个由五个字符串组成的列表。）向量中的第一个条目 `argv[0]` 是程序的名称。`argv` 的其余部分包含参数。

```
   argv[0] == "./myprog"
   argv[1] == "foo"
   argv[2] == "bar"
   argv[3] == "-x"
   argv[4] == "baz"
   
   /* 注：不是有效的 C 代码 */
```

在 C 语言中，你有很多方法来处理 `argv` 中的字符串。你可以手动地循环处理数组 `argv`，并根据程序的需要解释每个字符串。这相对来说比较简单，但会导致程序的接口大相径庭，因为不同的程序员对什么是“好”有不同的想法。

```
include <stdio.h>

/* 一个打印 argv 内容的简单 C 程序。 */

int main(int argc, char **argv) {
    int i;
   
    for(i=0; i<argc; i++)
      printf("%s\n", argv[i]);
}
```

#### 早期对命令行标准化的尝试

命令行武器库中的下一个武器是一个叫做 [getopt][11] 的 [C 标准库][10]函数。这个函数允许程序员解析开关，即前面带破折号的参数（比如 `-x`），并且可以选择将后续参数与它们的开关配对。想想 `/bin/ls -alSh` 这样的命令调用，`getopt` 就是最初用来解析该参数串的函数。使用 `getopt` 使命令行的解析变得相当简单，并改善了用户体验（UX）。

```
include <stdio.h>
#include <getopt.h>

#define OPTSTR "b:f:"

extern char *optarg;

int main(int argc, char **argv) {
    int opt;
    char *bar = NULL;
    char *foo = NULL;
   
    while((opt=getopt(argc, argv, OPTSTR)) != EOF)
       switch(opt) {
          case 'b':
              bar = optarg;
              break;
          case 'f':
              foo = optarg;
              break;
          case 'h':
          default':
              fprintf(stderr, "Huh? try again.");
              exit(-1);
              /* NOTREACHED */
       }
    printf("%s\n", foo ? foo : "Empty foo");
    printf("%s\n", bar ? bar : "Empty bar");
}
```

就个人而言，我*希望* Python 有*开关*，但这[永远][12]、永远不会[发生][13]。

#### GNU 时代

[GNU][14] 项目出现了，并为他们实现的传统 Unix 命令行工具引入了更长的格式参数，比如`--file-format foo`。当然，我们这些 Unix 程序员很讨厌这样，因为打字太麻烦了，但是就像我们这些旧时代的恐龙一样，我们输了，因为用户*喜欢*更长的选项。我从来没有写过任何使用 GNU 风格选项解析的代码，所以这里没有代码示例。

GNU 风格的参数也接受像 `-f foo` 这样的短名，也必须支持。所有这些选择都给程序员带来了更多的工作量，因为他们只想知道用户要求的是什么，然后继续进行下去。但用户得到了更一致的用户体验：长格式选项、短格式选项和自动生成的帮助，使用户不必再试图阅读臭名昭著的难以解析的[手册][15]页面（参见 [ps][16] 这个特别糟糕的例子）。

### 但我们正在讨论 Python？

你现在已经接触了足够多（太多？）的命令行的历史，对如何用我们最喜欢的语言来编写 CLI 有了一些背景知识。Python 在命令行解析方面给出了类似的几个选择：自己解析，<ruby>自给自足<rt>batteries-included</rt></ruby>的方式，以及大量的第三方方式。你选择哪一种取决于你的特定情况和需求。

#### 首先，自己解析

你可以从 [sys][17] 模块中获取程序的参数。

```
import sys

if __name__ == '__main__':
   for value in sys.argv:
       print(value)
```

#### 自给自足

在 Python 标准库中已经有几个参数解析模块的实现：[getopt][18]、[optparse][19]，以及最近的 [argparse][20]。`argparse` 允许程序员为用户提供一致的、有帮助的用户体验，但就像它的 GNU 前辈一样，它需要程序员做大量的工作和“[模板代码][21]”才能使它“奏效”。

```
from argparse import ArgumentParser

if __name__ == "__main__":

   argparser = ArgumentParser(description='My Cool Program')
   argparser.add_argument("--foo", "-f", help="A user supplied foo")
   argparser.add_argument("--bar", "-b", help="A user supplied bar")
   
   results = argparser.parse_args()
   print(results.foo, results.bar)
```

好处是当用户调用 `--help` 时，有自动生成的帮助。但是<ruby>[自给自足][22]<rt>batteries included</rt></ruby>的优势呢？有时，你的项目情况决定了你对第三方库的访问是有限的，或者说是没有，你不得不用 Python 标准库来“凑合”。

#### CLI 的现代方法

然后是 [Click][23]。`Click` 框架使用[装饰器][24]的方式来构建命令行解析。突然间，写一个丰富的命令行界面变得有趣而简单。在装饰器的酷炫和未来感的使用下，很多复杂的东西都消失了，用户惊叹于自动支持关键字补完以及上下文帮助。所有这些都比以前的解决方案写的代码更少。任何时候，只要你能写更少的代码，还能把事情做好，就是一种胜利。而我们都想要胜利。

```
import click

@click.command()
@click.option("-f", "--foo", default="foo", help="User supplied foo.")
@click.option("-b", "--bar", default="bar", help="User supplied bar.")
def echo(foo, bar):
    """My Cool Program
   
    It does stuff. Here is the documentation for it.
    """
    print(foo, bar)
   
if __name__ == "__main__":
    echo()
```

你可以在 `@click.option` 装饰器中看到一些与 `argparse` 相同的模板代码。但是创建和管理参数分析器的“工作”已经被抽象化了。现在，命令行参数被解析，而值被赋给函数参数，从而函数 `echo` 被*魔法般地*调用。

在 `Click` 接口中添加参数就像在堆栈中添加另一个装饰符并将新的参数添加到函数定义中一样简单。

### 但是，等等，还有更多!

[Typer][25] 建立在 `Click` 之上，是一个更新的 CLI 框架，它结合了 `Click` 的功能和现代 Python [类型提示][26]。使用 `Click` 的缺点之一是必须在函数中添加一堆装饰符。CLI 参数必须在两个地方指定：装饰符和函数参数列表。`Typer` [免去你造轮子][27] 去写 CLI 规范，让代码更容易阅读和维护。

```
import typer

cli = typer.Typer()

@cli.command()
def echo(foo: str = "foo", bar: str = "bar"):
    """My Cool Program
   
    It does stuff. Here is the documentation for it.
    """
    print(foo, bar)
   
if __name__ == "__main__":
    cli()
```

### 是时候开始写一些代码了

哪种方法是正确的？这取决于你的用例。你是在写一个只有你才会使用的快速而粗略的脚本吗？直接使用 `sys.argv` 然后继续编码。你需要更强大的命令行解析吗？也许 `argparse` 就够了。你是否有很多子命令和复杂的选项，你的团队是否会每天使用它？现在你一定要考虑一下 `Click` 或 `Typer`。作为一个程序员的乐趣之一就是魔改出替代实现，看看哪一个最适合你。

最后，在 Python 中有很多用于解析命令行参数的第三方软件包。我只介绍了我喜欢或使用过的那些。你喜欢和/或使用不同的包是完全可以的，也是我们所期望的。我的建议是先从这些包开始，然后看看你最终的结果。

去写一些很酷的东西吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/c-python-cli

作者：[Erik O'Shaughnessy][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)


本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jnyjny
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_python_programming.png?itok=ynSL8XRV (Searching for code)
[2]: https://en.wikipedia.org/wiki/Command-line_interface
[3]: https://en.wikipedia.org/wiki/Unix
[4]: https://www.gnu.org/software/bash/
[5]: https://en.wikipedia.org/wiki/C_(programming_language)
[6]: https://www.toptal.com/c/after-all-these-years-the-world-is-still-powered-by-c-programming
[7]: https://opensource.com/article/19/5/how-write-good-c-main-function
[8]: https://en.wikipedia.org/wiki/Dynamic_linker
[9]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[10]: https://en.wikipedia.org/wiki/C_standard_library
[11]: http://man7.org/linux/man-pages/man3/getopt.3.html
[12]: https://www.python.org/dev/peps/pep-0275/
[13]: https://www.python.org/dev/peps/pep-3103/
[14]: https://www.gnu.org
[15]: https://en.wikipedia.org/wiki/Man_page
[16]: http://man7.org/linux/man-pages/man1/ps.1.html
[17]: https://docs.python.org/3/library/sys.html
[18]: https://docs.python.org/2/library/getopt.html
[19]: https://docs.python.org/2/library/optparse.html
[20]: https://docs.python.org/3/library/argparse.html
[21]: https://en.wikipedia.org/wiki/Boilerplate_code
[22]: https://www.python.org/dev/peps/pep-0206/
[23]: https://click.palletsprojects.com/en/7.x/
[24]: https://wiki.python.org/moin/PythonDecorators
[25]: https://typer.tiangolo.com
[26]: https://docs.python.org/3/library/typing.html
[27]: https://en.wikipedia.org/wiki/Don%27t_repeat_yourself
[28]: https://pybit.es/guest-exploring-python-clis.html
