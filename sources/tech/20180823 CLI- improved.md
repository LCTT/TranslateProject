Translating by DavidChenLiang

CLI: improved
======
命令行：增强
======

我不确定有多少web 开发者能完全逃避使用命令行。就我来说，我从1997年上大学就开始使用命令行了，那时l33t-hacker 让我着迷，同时我觉得又很难掌握它。

I'm not sure many web developers can get away without visiting the command line. As for me, I've been using the command line since 1997, first at university when I felt both super cool l33t-hacker and simultaneously utterly out of my depth.

过去这些年我的命令行本领在逐步加强，我经常会去搜寻在我工作中能使用的更好的命令行工具。就此来说，下面就是我现在使用的增强的命令行工具的列表。

Over the years my command line habits have improved and I often search for smarter tools for the jobs I commonly do. With that said, here's my current list of improved CLI tools.


### Ignoring my improvements
### 怎么忽略我的增强

在一些情况下我会用别名将新的和增强的命令行工具链接到原来的命令行（如`cat`和`ping`）。

In a number of cases I've aliased the new and improved command line tool over the original (as with `cat` and `ping`).

如果我需要运行原来的命令的话，有时我确实需要这么做，我能像下面这样来做。（我用的是Mac 你的输出可能不一样）

If I want to run the original command, which is sometimes I do need to do, then there's two ways I can do this (I'm on a Mac so your mileage may vary):

```
$ \cat # ignore aliases named "cat" - explanation: https://stackoverflow.com/a/16506263/22617
$ command cat # ignore functions and aliases

```

### bat > cat

`cat`用于打印文件的内容，但是如果你在命令行上花了很多时间的话，例如语法高亮之类的功能会非常有用。我先发现了[ccat][3]这个有语法高亮功能的的工具， 然后我发现了[bat][4]，它有语法高亮，分页，行号和git集成。

`cat` is used to print the contents of a file, but given more time spent in the command line, features like syntax highlighting come in very handy. I found [ccat][3] which offers highlighting then I found [bat][4] which has highlighting, paging, line numbers and git integration.

`bat`命令也能让我在输出里（只要输出比屏幕的高度长）
使用`/`关键字绑定来搜索（和用`less`搜索功能一样）。

The `bat` command also allows me to search during output (only if the output is longer than the screen height) using the `/` key binding (similarly to `less` searching).

![Simple bat output][5]

我将别名`bat`链接到了`cat`命令：

I've also aliased `bat` to the `cat` command:


```
alias cat='bat'

```

💾 [Installation directions][4]

### prettyping > ping
### prettyping > ping

`ping`非常有用，当我碰到“糟了，是不是神马服务挂了/我的网不通了？”这种情况下我最先想到的工具就是他了。但是`prettyping`（“prettyping” 可不是指"pre typing"）(译注：英文字面意思是'预打印')在`ping`上加上了友好的输出，这可让我感觉命令行友好了很多呢。

`ping` is incredibly useful, and probably my goto tool for the "oh crap is X down/does my internet work!!!". But `prettyping` ("pretty ping" not "pre typing"!) gives ping a really nice output and just makes me feel like the command line is a bit more welcoming.

![/images/cli-improved/ping.gif][6]

我也将`ping`用别名链接到了`prettyping`命令：

I've also aliased `ping` to the `prettyping` command:

```
alias ping='prettyping --nolegend'

```

💾 [Installation directions][7]

### fzf > ctrl+r

在命令行上使用`ctrl+r`将允许你在命令历史里发现搜索使用过的命令，这是个挺好的小技巧，但是它需要你给出非常精确的输入才能正常运行。

In the terminal, using `ctrl+r` will allow you to [search backwards][8] through your history. It's a nice trick, albeit a bit fiddly.

`fzf`这个工具相比于`ctrl+r`有了**巨大的**进步。它能针对命令行历史进行模糊查询，并且提供了对可能合格的结果的全面交互式预览。

The `fzf` tool is a **huge** enhancement on `ctrl+r`. It's a fuzzy search against the terminal history, with a fully interactive preview of the possible matches.

除了搜索命令历史，`fzf`还能预览和打开文件，我在下面的视频里展示了这些功能。

In addition to searching through the history, `fzf` can also preview and open files, which is what I've done in the video below:

对于预览的效果，我创建了一个叫`preview`的别名，它将`fzf`和前文提到的`bat`组合起来完成预览功能，还给上面绑定了一个定制的热键Ctrl+o来打开 VS Code

For this preview effect, I created an alias called `preview` which combines `fzf` with `bat` for the preview and a custom key binding to open VS Code:

```
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

```

💾 [Installation directions][9]

### htop > top

`top`是当我想快速诊断为什么机器上的CPU跑的那么累或者风扇为什么突然呼呼大做的时候首先会想到的工具。我在产品环境也会使用这个工具。讨厌的是Mac 上的`top`和 Linux 上的`top`有着极大的不同（包括其内部的 IMHO）

`top` is my goto tool for quickly diagnosing why the CPU on the machine is running hard or my fan is whirring. I also use these tools in production. Annoyingly (to me!) `top` on the Mac is vastly different (and inferior IMHO) to `top` on linux.

不过，`htop`是对 Linux 上的`top`和 Mac 上蹩脚的`top`的极大改进。它增加了包括颜色输出编码，键盘热键绑定以及不同的视图，这极大的帮助了我来理解进程之间的父子关系。

However, `htop` is an improvement on both regular `top` and crappy-mac `top`. Lots of colour coding, keyboard bindings and different views which have helped me in the past to understand which processes belong to which.

方便的热键绑定包括：

  * P - CPU 使用率排序
  * M - 内存使用排序
  * F4 - 用字符串过滤进程（例如只看包括"node"的进程）
  * space - 锚定一个单独进程，这样我能观察它是否有尖峰状态

Handy key bindings include:

  * P - sort by CPU
  * M - sort by memory usage
  * F4 - filter processes by string (to narrow to just "node" for instance)
  * space - mark a single process so I can watch if the process is spiking



![htop output][10]

在Mac Sieera 上htop 有个奇怪的bug，可以通过以root 运行来绕过(我实在记不清这个bug 是什么，但是这个别名能搞定它，有点讨厌的是我得每次都输入 root 密码。)：

There is a weird bug in Mac Sierra that can be overcome by running `htop` as root (I can't remember exactly what the bug is, but this alias fixes it - though annoying that I have to enter my password every now and again):

```
alias top="sudo htop" # alias top and fix high sierra bug

```

💾 [Installation directions][11]

### diff-so-fancy > diff

我非常确定我是一些年前从 Paul Irish 那儿学来的这个技巧，尽管我很少直接使用`diff`，我的git 命令行会一直使用`diff`。`diff-so-fancy`给了我代码颜色和更改字符高亮的功能。 

I'm pretty sure I picked this one up from Paul Irish some years ago. Although I rarely fire up `diff` manually, my git commands use diff all the time. `diff-so-fancy` gives me both colour coding but also character highlight of changes.

![diff so fancy][12]

在我的`~/.gitconfig`文件里我有下面的选项来打开`git diff`和`git show`的`diff-so-fancy`功能。

Then in my `~/.gitconfig` I have included the following entry to enable `diff-so-fancy` on `git diff` and `git show`:

```
[pager]
 diff = diff-so-fancy | less --tabs=1,5 -RFX
 show = diff-so-fancy | less --tabs=1,5 -RFX

```

💾 [Installation directions][13]

### fd > find

尽管我使用 Mac， 但我从来不是一个Spotlight的拥趸，我觉得他的功能很累赘，关键字也难记，更新它自己的数据库时会拖慢CPU，简直一无是处。我经常使用[Alfred][14]，但是它额搜索功能也工作的不是很好。

Although I use a Mac, I've never been a fan of Spotlight (I found it sluggish, hard to remember the keywords, the database update would hammer my CPU and generally useless!). I use [Alfred][14] a lot, but even the finder feature doesn't serve me well.

我倾向于在命令行中搜索文件，但是`find`的难用在于很难去记住那些合适的表达式来描述我想要的文件。（而且 Mac 上的 find 命令和非 Mac 的 find 命令还有些许不同，这更加深了我的失望。）

I tend to turn the command line to find files, but `find` is always a bit of a pain to remember the right expression to find what I want (and indeed the Mac flavour is slightly different non-mac find which adds to frustration).

`fd`是一个很好的替代品(它的作者和`bat`的作者是同一个人)。他非常快而且对于我经常要搜索的命令非常好记。

`fd` is a great replacement (by the same individual who wrote `bat`). It is very fast and the common use cases I need to search with are simple to remember.

A few handy commands:

几个非常方便的例子：

```
$ fd cli # all filenames containing "cli"
$ fd -e md # all with .md extension
$ fd cli -x wc -w # find "cli" and run `wc -w` on each file

```

![fd output][15]

💾 [Installation directions][16]

### ncdu > du

对我来说，知道当前的磁盘空间使用是非常重要的任务。我用过 Mac 上的[Dish Daisy][17],但是我觉得那个程序产生结果有点慢。

Knowing where disk space is being taking up is a fairly important task for me. I've used the Mac app [Disk Daisy][17] but I find that it can be a little slow to actually yield results.

`du -sh`命令是我经常会跑的命令(`-sh`是指结果以总结和人类可读的方式显示)，不过我经常会想要深入挖掘那些占用了大量的目录。

The `du -sh` command is what I'll use in the terminal (`-sh` means summary and human readable), but often I'll want to dig into the directories taking up the space.

`nudu`是一个非常棒的替代。它提供了一个交互式的界面并且允许快速的扫描那些占用了大量磁盘空间的目录和文件，它又快又准。（尽管不管在哪个工具的情况下，扫描我的home目录都要很长时间，它有550G）


`ncdu` is a nice alternative. It offers an interactive interface and allows for quickly scanning which folders or files are responsible for taking up space and it's very quick to navigate. (Though any time I want to scan my entire home directory, it's going to take a long time, regardless of the tool - my directory is about 550gb).

一旦当我找到一个目录我想要`处理`一下（如删除，移动或压缩文件），我都会使用命令+点击屏幕[iTerm2][18]上部的目录名字来对那个目录执行搜索。

Once I've found a directory I want to manage (to delete, move or compress files), I'll use the cmd + click the pathname at the top of the screen in [iTerm2][18] to launch finder to that directory.

![ncdu output][19]

还有另外一个选择[nnn][20],它提供了一个更漂亮的界面，尽管它也提供文件尺寸和使用情况，实际上它更像一个全功能的文件管理器。

There's another [alternative called nnn][20] which offers a slightly nicer interface and although it does file sizes and usage by default, it's actually a fully fledged file manager.

My `ncdu` is aliased to the following:

我的`nudu`使用下面的别名链接:

```
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

```

The options are:

选项有：

  * `--color dark` 使用颜色方案
  * `-rr` 只读模式（防止误删和运行新的登陆程序）
  * `--exclude` 忽略不想操作的目录


  * `--color dark` \- use a colour scheme
  * `-rr` \- read-only mode (prevents delete and spawn shell)
  * `--exclude` ignore directories I won't do anything about



💾 [Installation directions][21]

### tldr > man

几乎所有的单独命令行工具都有一个相伴的手册，其可以被`man 命令`来调出，但是在`man`的输出里找到东西可有点然人困惑，而且在一个包含了所有的技术细节的输出里找东西也挺可怕的。

It's amazing that nearly every single command line tool comes with a manual via `man <command>`, but navigating the `man` output can be sometimes a little confusing, plus it can be daunting given all the technical information that's included in the manual output.

这就是TL;DR(译注：英文里`文档太长，没空去读`的缩写)项目的初衷。这个一个由社区驱动的文档系统，它针对的是命令行。就我现在用下来，我还没碰到过一个命令它没有相应的文档，你[也可以做贡献][22].

This is where the TL;DR project comes in. It's a community driven documentation system that's available from the command line. So far in my own usage, I've not come across a command that's not been documented, but you can [also contribute too][22].

![TLDR output for 'fd'][23]

作为一个小技巧，我将`tldr`的别名链接到`help`（这样输入会快一点。。。）

As a nicety, I've also aliased `tldr` to `help` (since it's quicker to type!):

```
alias help='tldr'

```

💾 [Installation directions][24]

### ack || ag > grep

`grep`毫无疑问是一个命令行上的强力工具，但是经过这些年它已经被一些工具超越了。其中两个叫`ack`和`ag`。

`grep` is no doubt a powerful tool on the command line, but over the years it's been superseded by a number of tools. Two of which are `ack` and `ag`.

我个人来说`ack`和`ag`都尝试过，并没有非常明显的个人偏好，（那也就是说他们都很棒，并且很相似）。我倾向于默认只使用`ack`,因为这三个字符就在指尖，很好打。并且，`ack`有大量的`ack --bar`参数可以使用，（你一定会体会到这一点。）

I personally flitter between `ack` and `ag` without really remembering which I prefer (that's to say they're both very good and very similar!). I tend to default to `ack` only because it rolls of my fingers a little easier. Plus, `ack` comes with the mega `ack --bar` argument (I'll let you experiment)!

`ack`和`ag`都将使用正则表达式来表达搜索，并且对我的工作有关，我能指定搜索的文件类型而不用使用类似于`--js`或`--html`的文件标识（尽管`ag`比`ack`在文件类型过滤器里包括了更多的文件类型。）

Both `ack` and `ag` will (by default) use a regular expression to search, and extremely pertinent to my work, I can specify the file types to search within using flags like `--js` or `--html` (though here `ag` includes more files in the js filter than `ack`).

两个工具都支持常见的`grep`选项，如`-B`和`-A`用于在搜索的上下文里指代`之前`和`之后`。

Both tools also support the usual `grep` options, like `-B` and `-A` for before and after context in the grep.

![ack in action][25]

因为`ack`不支持markdown（而我又恰好写了很多markdown）， 我在我的`~/.ackrc`文件里放了如下的定制语句：

Since `ack` doesn't come with markdown support (and I write a lot in markdown), I've got this customisation in my `~/.ackrc` file:


```
--type-set=md=.md,.mkd,.markdown
--pager=less -FRX

```

💾 Installation directions: [ack][26], [ag][27]

[Futher reading on ack & ag][28]

### jq > grep et al

我是[jq][29]的粉丝之一。当然一开始我也在它的语法里苦苦挣扎，还好我对查询语言还算有些使用心得，现在我对`jq`可以说是每天都要用。（不过从前我要么使用grep 或者使用一个叫[json][30]的工具，相比而言后者非常基础了。）

I'm a massive fanboy of [jq][29]. At first I struggled with the syntax, but I've since come around to the query language and use `jq` on a near daily basis (whereas before I'd either drop into node, use grep or use a tool called [json][30] which is very basic in comparison).

我甚至开始撰写一个`jq`的说明系列（有2500字并且还在增加），我还发布了一个[web tool][31]和一个Mac 上的应用（这个还没有发布。）

I've even started the process of writing a jq tutorial series (2,500 words and counting) and have published a [web tool][31] and a native mac app (yet to be released).

`jq`允许我传入一个 JSON 并且能非常简单的转变其为一个 JSON格式的适合我要求的结果。下面这个例子允许我用一个命令更新我的所有节点依赖（为了便于于都，我将其分成为多行。）

`jq` allows me to pass in JSON and transform the source very easily so that the JSON result fits my requirements. One such example allows me to update all my node dependencies in one command (broken into multiple lines for readability):


```
$ npm i $(echo $(\
 npm outdated --json | \
 jq -r 'to_entries | .[] | "\(.key)@\(.value.latest)"' \
))

```

The above command will list all the node dependencies that are out of date, and use npm's JSON output format, then transform the source JSON from this:
```
{
 "node-jq": {
 "current": "0.7.0",
 "wanted": "0.7.0",
 "latest": "1.2.0",
 "location": "node_modules/node-jq"
 },
 "uuid": {
 "current": "3.1.0",
 "wanted": "3.2.1",
 "latest": "3.2.1",
 "location": "node_modules/uuid"
 }
}

```

…to this:

That result is then fed into the `npm install` command and voilà, I'm all upgraded (using the sledgehammer approach).

### Honourable mentions
### 很荣幸提及一些其他的工具

我也在开始尝试一些别的工具，但我还没有完全掌握他们。（出了`ponysay`,当我新启动一个命令行会话时，它就会出现。）

Some of the other tools that I've started poking around with, but haven't used too often (with the exception of ponysay, which appears when I start a new terminal session!):

  * [ponysay][32] > cowsay
  * [csvkit][33] > awk et al
  * [noti][34] > `display notification`
  * [entr][35] > watch



### What about you?
### 你有什么好点子吗？

上面是我的命令行清单。能告诉我们你的吗？你有没有增强一些你每天都会用到的命令呢？我非常乐意知道。

So that's my list. How about you? What daily command line tools have you improved? I'd love to know.


--------------------------------------------------------------------------------

via: https://remysharp.com/2018/08/23/cli-improved

作者：[Remy Sharp][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：DavidChenLiang(https://github.com/DavidChenLiang)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://remysharp.com
[1]: https://remysharp.com/images/terminal-600.jpg
[2]: https://training.leftlogic.com/buy/terminal/cli2?coupon=READERS-DISCOUNT&utm_source=blog&utm_medium=banner&utm_campaign=remysharp-discount
[3]: https://github.com/jingweno/ccat
[4]: https://github.com/sharkdp/bat
[5]: https://remysharp.com/images/cli-improved/bat.gif (Sample bat output)
[6]: https://remysharp.com/images/cli-improved/ping.gif (Sample ping output)
[7]: http://denilson.sa.nom.br/prettyping/
[8]: https://lifehacker.com/278888/ctrl%252Br-to-search-and-other-terminal-history-tricks
[9]: https://github.com/junegunn/fzf
[10]: https://remysharp.com/images/cli-improved/htop.jpg (Sample htop output)
[11]: http://hisham.hm/htop/
[12]: https://remysharp.com/images/cli-improved/diff-so-fancy.jpg (Sample diff output)
[13]: https://github.com/so-fancy/diff-so-fancy
[14]: https://www.alfredapp.com/
[15]: https://remysharp.com/images/cli-improved/fd.png (Sample fd output)
[16]: https://github.com/sharkdp/fd/
[17]: https://daisydiskapp.com/
[18]: https://www.iterm2.com/
[19]: https://remysharp.com/images/cli-improved/ncdu.png (Sample ncdu output)
[20]: https://github.com/jarun/nnn
[21]: https://dev.yorhel.nl/ncdu
[22]: https://github.com/tldr-pages/tldr#contributing
[23]: https://remysharp.com/images/cli-improved/tldr.png (Sample tldr output for 'fd')
[24]: http://tldr-pages.github.io/
[25]: https://remysharp.com/images/cli-improved/ack.png (Sample ack output with grep args)
[26]: https://beyondgrep.com
[27]: https://github.com/ggreer/the_silver_searcher
[28]: http://conqueringthecommandline.com/book/ack_ag
[29]: https://stedolan.github.io/jq
[30]: http://trentm.com/json/
[31]: https://jqterm.com
[32]: https://github.com/erkin/ponysay
[33]: https://csvkit.readthedocs.io/en/1.0.3/
[34]: https://github.com/variadico/noti
[35]: http://www.entrproject.org/
