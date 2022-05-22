[#]: collector: (lujun9972)
[#]: translator: (rakino)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12706-1.html)
[#]: subject: (Things You Didn't Know About GNU Readline)
[#]: via: (https://twobithistory.org/2019/08/22/readline.html)
[#]: author: (Two-Bit History https://twobithistory.org)

你所不知的 GNU Readline
======

![](https://img.linux.net.cn/data/attachment/album/202010/10/222755etdndudtu97wddz7.jpg)

有时我会觉得自己的计算机是一栋非常大的房子，我每天都会访问这栋房子，也对一楼的大部分房间都了如指掌，但仍然还是有我没有去过的卧室，有我没有打开过的衣柜，有我没有探索过的犄角旮旯。我感到有必要更多地了解我的计算机了，就像任何人都会觉得有必要看看自己家里从未去过的房间一样。

GNU Readline 是个不起眼的小软件库，我依赖了它多年却没有意识到它的存在，也许有成千上万的人每天都在不经意间使用它。如果你用 Bash shell 的话，每当你自动补全一个文件名，或者在输入的一行文本中移动光标，以及搜索之前命令的历史记录时，你都在使用 GNU Readline；当你在 Postgres（`psql`）或是 Ruby REPL（`irb`）的命令行界面中进行同样的操作时，你依然在使用 GNU Readline。很多软件都依赖 GNU Readline 库来实现用户所期望的功能，不过这些功能是如此的辅助与不显眼，以至于在我看来很少有人会停下来去想它是从哪里来的。

GNU Readline 最初是自由软件基金会在 20 世纪 80 年代创建的，如今作为每个人的基础计算设施的重要的、甚至看不见的组成部分的它，由一位志愿者维护。

### 充满特色

GNU Readline 库的存在，主要是为了增强各种命令行界面，它提供了一组通用的按键，使你可以在一个单行输入中移动和编辑。例如，在 Bash 提示符中按下 `Ctrl-A`，你的光标会跳到行首，而按下 `Ctrl-E` 则会跳到行末；另一个有用的命令是 `Ctrl-U`，它会删除该行中光标之前的所有内容。

有很长一段时间，我通过反复敲击方向键来在命令行上移动，如今看来这十分尴尬，也不知道为什么，当时的我从来没有想过可以有一种更快的方法。当然了，没有哪一个熟悉 Vim 或 Emacs 这种文本编辑器的程序员愿意长时间地击打方向键，所以像 Readline 这样的东西必然会被创造出来。在 Readline 上可以做的绝非仅仅跳来跳去，你可以像使用文本编辑器那样编辑单行文本——这里有删除单词、单词换位、大写单词、复制和粘贴字符等命令。Readline 的大部分按键/快捷键都是基于 Emacs 的，它基本上就是一个单行文本版的 Emacs 了，甚至还有录制和重放宏的功能。

我从来没有用过 Emacs，所以很难记住所有不同的 Readline 命令。不过 Readline 有着很巧妙的一点，那就是能够切换到基于 Vim 的模式，在 Bash 中可以使用内置的 `set` 命令来这样做。下面会让 Readline 在当前的 shell 中使用 Vim 风格的命令：

```
$ set -o vi
```

该选项启用后，就可以使用 `dw` 等命令来删除单词了，此时相当于 Emacs 模式下的 `Ctrl-U` 的命令是 `d0`。

我第一次知道有这个功能的时候很兴奋地想尝试一下，但它对我来说并不是那么好用。我很高兴知道有这种对 Vim 用户的让步，在使用这个功能上你可能会比我更幸运，尤其是你还没有使用 Readline 的默认按键的话；我的问题在于，我听说有基于 Vim 的界面时已经学会了几种默认按键，因此即使启用了 Vim 的选项，也一直在错误地用着默认的按键；另外因为没有某种指示器，所以 Vim 的模态设计在这里会很尴尬——你很容易就忘记了自己处于哪个模式，就因为这样，我卡在了一种虽然使用 Vim 作为文本编辑器，但却在 Readline 上用着 Emacs 风格的命令的情况里，我猜其他很多人也是这样的。

如果你觉得 Vim 和 Emacs 的键盘命令系统诡异而神秘（这并不是没有道理的），你可以按照喜欢的方式自定义 Readline 的键绑定。Readline 在启动时会读取文件 `~/.inputrc`，它可以用来配置各种选项与键绑定，我做的一件事是重新配置了 `Ctrl-K`：通常情况下该命令会从光标处删除到行末，但我很少这样做，所以我在 `~/.inputrc` 中添加了以下内容，把它绑定为直接删除整行：

```
Control-k: kill-whole-line
```

每个 Readline 命令（文档中称它们为 “函数” ）都有一个名称，你可以用这种方式将其与一个键序列联系起来。如果你在 Vim 中编辑 `~/.inputrc`，就会发现 Vim 知道这种文件类型，还会帮你高亮显示有效的函数名，而不高亮无效的函数名。

`~/.inputrc` 可以做的另一件事是通过将键序列映射到输入字符串上来创建预制宏。[Readline 手册][1]给出了一个我认为特别有用的例子：我经常想把一个程序的输出保存到文件中，这意味着我得经常在 Bash 命令中追加类似 `> output.txt` 这样的东西，为了节省时间，可以把它做成一个 Readline 宏：

```
Control-o: "> output.txt"
```

这样每当你按下 `Ctrl-O` 时，你都会看到 `> output.txt` 被添加到了命令行光标的后面，这样很不错！

不过你可以用宏做的可不仅仅是为文本串创建快捷方式；在 `~/.inputrc` 中使用以下条目意味着每次按下 `Ctrl-J` 时，行内已有的文本都会被 `$(` 和 `)` 包裹住。该宏先用 `Ctrl-A` 移动到行首，添加 `$(` ，然后再用 `Ctrl-E` 移动到行尾，添加 `)`：

```
Control-j: "\C-a$(\C-e)"
```

如果你经常需要像下面这样把一个命令的输出用于另一个命令的话，这个宏可能会对你有帮助：

```
$ cd $(brew --prefix)
```

`~/.inputrc` 文件也允许你为 Readline 手册中所谓的 “变量” 设置不同的值，这些变量会启用或禁用某些 Readline 行为，你也可以使用这些变量来改变 Readline 中像是自动补全或者历史搜索这些行为的工作方式。我建议开启的一个变量是 `revert-all-at-newline`，它是默认关闭的，当这个变量关闭时，如果你使用反向搜索功能从命令历史记录中提取一行并编辑，但随后又决定搜索另一行，那么你所做的编辑会被保存在历史记录中。我觉得这样会很混乱，因为这会导致你的 Bash 命令历史中出现从未运行过的行。所以在你的 `~/.inputrc` 中加入这个：

```
set revert-all-at-newline on
```

在你用 `~/.inputrc` 设置了选项或键绑定以后，它们会适用于任何使用 Readline 库的地方，显然 Bash 也包括在内，不过你也会在其它像是 `irb` 和 `psql` 这样的程序中受益。如果你经常使用关系型数据库的命令行界面，一个用于插入 `SELECT * FROM` 的 Readline 宏可能会很有用。

### Chet Ramey

GNU Readline 如今由凯斯西储大学的高级技术架构师 Chet Ramey 维护，Ramey 同时还负责维护 Bash shell；这两个项目都是由一位名叫 Brian Fox 的自由软件基金会员工在 1988 年开始编写的，但从 1994 年左右开始，Ramey 一直是它们唯一的维护者。

Ramey 通过电子邮件告诉我，Readline 远非一个原创的想法，它是为了实现 POSIX 规范所规定的功能而被创建的，而 POSIX 规范又是在 20 世纪 80 年代末被制定的。许多早期的 shell，包括 Korn shell 和至少一个版本的 Unix System V shell，都包含行编辑功能。1988 年版的 Korn shell（`ksh88`）提供了 Emacs 风格和 Vi/Vim 风格的编辑模式。据我从[手册页][2]中得知，Korn shell 会通过查看 `VISUAL` 和 `EDITOR` 环境变量来决定你使用的模式，这一点非常巧妙。POSIX 中指定 shell 功能的部分近似于 `ksh88` 的实现，所以 GNU Bash 也要实现一个类似的灵活的行编辑系统来保持兼容，因此就有了 Readline。

Ramey 第一次参与 Bash 开发时，Readline 还是 Bash 项目目录下的一个单一的源文件，它其实只是 Bash 的一部分；随着时间的推移，Readline 文件慢慢地成为了独立的项目，不过直到 1994 年（Readline 2.0 版本发布），Readline 才完全成为了一个独立的库。

Readline 与 Bash 密切相关，Ramey 也通常把 Readline 与 Bash 的发布配对，但正如我上面提到的，Readline 是一个可以被任何有命令行界面的软件使用的库，而且它真的很容易使用。下面是一个例子，虽然简单，但这就是在 C 程序中使用 Readline 的方法。向 `readline()` 函数传递的字符串参数就是你希望 Readline 向用户显示的提示符：

```
#include <stdio.h>
#include <stdlib.h>
#include "readline/readline.h"

int main(int argc, char** argv)
{
    char* line = readline("my-rl-example> ");
    printf("You entered: \"%s\"\n", line);

    free(line);

    return 0;
}
```

你的程序会把控制权交给 Readline，它会负责从用户那里获得一行输入（以这样的方式让用户可以做所有花哨的行编辑工作），一旦用户真正提交了这一行，Readline 就会把它返回给你。在我的库搜索路径中有 Readline 库，所以我可以通过调用以下内容来链接 Readline 库，从而编译上面的内容：

```
$ gcc main.c -lreadline
```

当然，Readline 的 API 比起那个单一的函数要丰富得多，任何使用它的人都可以对库的行为进行各种调整，库的用户（开发者）甚至可以添加新的函数，来让最终用户可以通过 `~/.inputrc` 来配置它们，这意味着 Readline 非常容易扩展。但是据我所知，即使是 Bash ，虽然事先有很多配置，最终也会像上面的例子一样调用简单的 `readline()` 函数来获取输入。（参见 GNU Bash 源代码中的[这一行][3]，Bash 似乎在这里将获取输入的责任交给了 Readline）。

Ramey 现在已经在 Bash 和 Readline 上工作了二十多年，但他的工作却从来没有得到过报酬 —— 他一直都是一名志愿者。Bash 和 Readline 仍然在积极开发中，尽管 Ramey 说 Readline 的变化比 Bash 慢得多。我问 Ramey 作为这么多人使用的软件唯一的维护者是什么感觉，他说可能有几百万人在不知不觉中使用 Bash（因为每个苹果设备都运行 Bash），这让他担心一个破坏性的变化会造成多大的混乱，不过他已经慢慢习惯了所有这些人的想法。他还说他会继续在 Bash 和 Readline 上工作，因为在这一点上他已经深深地投入了，而且他也只是单纯地喜欢把有用的软件提供给世界。

_你可以在 [Chet Ramey 的网站][4]上找到更多关于他的信息。_

_喜欢这篇文章吗？我会每四周写出一篇像这样的文章。关注推特帐号 [@TwoBitHistory][5] 或者[订阅 RSS][6] 来获取更新吧！_

--------------------------------------------------------------------------------

via: https://twobithistory.org/2019/08/22/readline.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[rakino](https://github.com/rakino)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://tiswww.case.edu/php/chet/readline/readline.html
[2]: https://web.archive.org/web/20151105130220/http://www2.research.att.com/sw/download/man/man1/ksh88.html
[3]: https://github.com/bminor/bash/blob/9f597fd10993313262cab400bf3c46ffb3f6fd1e/parse.y#L1487
[4]: https://tiswww.case.edu/php/chet/
[5]: https://twitter.com/TwoBitHistory
[6]: https://twobithistory.org/feed.xml
[7]: https://twitter.com/TwoBitHistory/status/1112492084383092738?ref_src=twsrc%5Etfw
