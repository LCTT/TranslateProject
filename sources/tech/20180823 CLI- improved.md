
命令行：增强版
======

我不确定有多少Web 开发者能完全逃避使用命令行。就我来说，我从1997年上大学就开始使用命令行了，那时的l33t-hacker 让我着迷，同时我也觉得它很难掌握。

过去这些年我的命令行本领在逐步加强，我经常会去搜寻在我工作中能使用的更好的命令行工具。下面就是我现在使用的用于增强原有命令行工具的列表。


### 怎么忽略我所做的命令行增强

通常情况下我会用别名将新的或者增强的命令行工具链接到原来的命令行（如`cat`和`ping`）。


如果我需要运行原来的命令的话（有时我确实需要这么做），我会像下面这样来运行未加修改的原来的命令行。（我用的是Mac，你的输出可能不一样）


```
$ \cat # 忽略叫 "cat" 的别名 - 具体解释: https://stackoverflow.com/a/16506263/22617
$ command cat # 忽略函数和别名

```

### bat > cat

`cat`用于打印文件的内容，如果你在命令行上要花很多时间的话，例如语法高亮之类的功能会非常有用。我首先发现了[ccat][3]这个有语法高亮功能的的工具，然后我发现了[bat][4]，它的功能有语法高亮，分页，行号和git集成。


`bat`命令也能让我在输出里（只要输出比屏幕的高度长）
使用`/`关键字绑定来搜索（和用`less`搜索功能一样）。


![Simple bat output][5]

我将别名`cat`链接到了`bat`命令：



```
alias cat='bat'

```

💾 [Installation directions][4]

### prettyping > ping

`ping`非常有用，当我碰到“糟了，是不是什么服务挂了？/我的网不通了？”这种情况下我最先想到的工具就是它了。但是`prettyping`（“prettyping” 可不是指"pre typing"）(译注：英文字面意思是'预打印')在`ping`上加上了友好的输出，这可让我感觉命令行友好了很多呢。


![/images/cli-improved/ping.gif][6]

我也将`ping`用别名链接到了`prettyping`命令：


```
alias ping='prettyping --nolegend'

```

💾 [Installation directions][7]

### fzf > ctrl+r

在命令行上使用`ctrl+r`将允许你在命令历史里[反向搜索][8]使用过的命令，这是个挺好的小技巧，但是它需要你给出非常精确的输入才能正常运行。

`fzf`这个工具相比于`ctrl+r`有了**巨大的**进步。它能针对命令行历史进行模糊查询，并且提供了对可能的合格结果进行全面交互式预览。


除了搜索命令历史，`fzf`还能预览和打开文件，我在下面的视频里展示了这些功能。


为了这个预览的效果，我创建了一个叫`preview`的别名，它将`fzf`和前文提到的`bat`组合起来完成预览功能，还给上面绑定了一个定制的热键Ctrl+o来打开 VS Code：


```
alias preview="fzf --preview 'bat --color \"always\" {}'"
# 支持在 VS Code 里用ctrl+o 来打开选择的文件
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

```

💾 [Installation directions][9]

### htop > top

`top`是当我想快速诊断为什么机器上的CPU跑的那么累或者风扇为什么突然呼呼大做的时候首先会想到的工具。我在产品环境也会使用这个工具。讨厌的是Mac上的`top`和 Linux 上的`top`有着极大的不同（恕我直言，应该是差的多）。


不过，`htop`是对 Linux 上的`top`和 Mac 上蹩脚的`top`的极大改进。它增加了包括颜色输出编码，键盘热键绑定以及不同的视图输出，这极大的帮助了我来理解进程之间的父子关系。


方便的热键绑定包括：

  * P - CPU使用率排序
  * M - 内存使用排序
  * F4 - 用字符串过滤进程（例如只看包括"node"的进程）
  * space - 锚定一个单独进程，这样我能观察它是否有尖峰状态


![htop output][10]

在Mac Sieera 上htop 有个奇怪的bug，不过这个bug可以通过以root运行来绕过(我实在记不清这个bug 是什么，但是这个别名能搞定它，有点讨厌的是我得每次都输入root密码。)：


```
alias top="sudo htop" # 给top加上别名并且绕过 Sieera 上的bug
```

💾 [Installation directions][11]

### diff-so-fancy > diff

我非常确定我是一些年前从 Paul Irish 那儿学来的这个技巧，尽管我很少直接使用`diff`，但我的git命令行会一直使用`diff`。`diff-so-fancy`给了我代码语法颜色和更改字符高亮的功能。 


![diff so fancy][12]

在我的`~/.gitconfig`文件里我有下面的选项来打开`git diff`和`git show`的`diff-so-fancy`功能。


```
[pager]
 diff = diff-so-fancy | less --tabs=1,5 -RFX
 show = diff-so-fancy | less --tabs=1,5 -RFX

```

💾 [Installation directions][13]

### fd > find

尽管我使用 Mac， 但我从来不是一个Spotlight的拥趸，我觉得它的性能很差，关键字也难记，加上更新它自己的数据库时会拖慢CPU，简直一无是处。我经常使用[Alfred][14]，但是它的搜索功能也工作的不是很好。


我倾向于在命令行中搜索文件，但是`find`的难用在于很难去记住那些合适的表达式来描述我想要的文件。（而且 Mac 上的 find 命令和非Mac的find命令还有些许不同，这更加深了我的失望。）

`fd`是一个很好的替代品(它的作者和`bat`的作者是同一个人)。它非常快而且对于我经常要搜索的命令非常好记。



几个使用方便的例子：

```
$ fd cli # 所有包含"cli"的文件名
$ fd -e md # 所有以.md作为扩展名的文件
$ fd cli -x wc -w # 搜索"cli"并且在每个搜索结果上运行`wc -w`


```

![fd output][15]

💾 [Installation directions][16]

### ncdu > du

对我来说，知道当前的磁盘空间使用是非常重要的任务。我用过 Mac 上的[Dish Daisy][17],但是我觉得那个程序产生结果有点慢。


`du -sh`命令是我经常会跑的命令(`-sh`是指结果以`总结`和`人类可读`的方式显示)，我经常会想要深入挖掘那些占用了大量磁盘空间的目录,看看到底是什么在占用空间。

`ncdu`是一个非常棒的替代品。它提供了一个交互式的界面并且允许快速的扫描那些占用了大量磁盘空间的目录和文件，它又快又准。（尽管不管在哪个工具的情况下，扫描我的home目录都要很长时间，它有550G）


一旦当我找到一个目录我想要“处理”一下（如删除，移动或压缩文件），我都会使用命令+点击屏幕[iTerm2][18]上部的目录名字来对那个目录执行搜索。


![ncdu output][19]

还有另外一个选择[一个叫nnn的另外选择][20],它提供了一个更漂亮的界面，它也提供文件尺寸和使用情况，实际上它更像一个全功能的文件管理器。


我的`ncdu`使用下面的别名链接:

```
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

```


选项有：

  * `--color dark` 使用颜色方案
  * `-rr` 只读模式（防止误删和运行新的登陆程序）
  * `--exclude` 忽略不想操作的目录



💾 [Installation directions][21]

### tldr > man

几乎所有的单独命令行工具都有一个相伴的手册，其可以被`man <命令名>`来调出，但是在`man`的输出里找到东西可有点让人困惑，而且在一个包含了所有的技术细节的输出里找东西也挺可怕的。


这就是TL;DR(译注：英文里`文档太长，没空去读`的缩写)项目创建的初衷。这是一个由社区驱动的文档系统，而且针对的是命令行。就我现在用下来，我还没碰到过一个命令它没有相应的文档，你[也可以做贡献][22]。


![TLDR output for 'fd'][23]

作为一个小技巧，我将`tldr`的别名链接到`help`（这样输入会快一点。。。）

```
alias help='tldr'

```

💾 [Installation directions][24]

### ack || ag > grep

`grep`毫无疑问是一个命令行上的强力工具，但是这些年来它已经被一些工具超越了,其中两个叫`ack`和`ag`。


我个人对`ack`和`ag`都尝试过，而且没有非常明显的个人偏好，（那也就是说他们都很棒，并且很相似）。我倾向于默认只使用`ack`,因为这三个字符就在指尖，很好打。并且，`ack`有大量的`ack --`参数可以使用，（你一定会体会到这一点。）


`ack`和`ag`都将使用正则表达式来表达搜索，这非常契合我的工作，我能指定搜索的文件类型而不用使用类似于`--js`或`--html`的文件标识（尽管`ag`比`ack`在文件类型过滤器里包括了更多的文件类型。）


两个工具都支持常见的`grep`选项，如`-B`和`-A`用于在搜索的上下文里指代`之前`和`之后`。


![ack in action][25]

因为`ack`不支持markdown（而我又恰好写了很多markdown）， 我在我的`~/.ackrc`文件里放了如下的定制语句：



```
--type-set=md=.md,.mkd,.markdown
--pager=less -FRX

```

💾 Installation directions: [ack][26], [ag][27]

[Futher reading on ack & ag][28]

### jq > grep et al

我是[jq][29]的粉丝之一。当然一开始我也在它的语法里苦苦挣扎，好在我对查询语言还算有些使用心得，现在我对`jq`可以说是每天都要用。（不过从前我要么使用grep 或者使用一个叫[json][30]的工具，相比而言后者的功能就非常基础了。）


我甚至开始撰写一个`jq`的教程系列（有2500字并且还在增加），我还发布了一个[web tool][31]和一个Mac 上的应用（这个还没有发布。）


`jq`允许我传入一个 JSON 并且能非常简单的将其转变为一个 使用JSON格式的结果，这正是我想要的。下面这个例子允许我用一个命令更新我的所有节点依赖（为了阅读方便，我将其分成为多行。）


```
$ npm i $(echo $(\
 npm outdated --json | \
 jq -r 'to_entries | .[] | "\(.key)@\(.value.latest)"' \
))

```
上面的命令将使用npm 的 JSON 输出格式来列出所有的过期节点依赖，然后将下面的源JSON转换为：


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

转换结果为：（译注：原文此处并未给出结果）

上面的结果会被作为`npm install`的输入，你瞧，我的升级就这样全部搞定了。（当然，这里有点小题大做了。）


### 很荣幸提及一些其他的工具

我也在开始尝试一些别的工具，但我还没有完全掌握他们。（除了`ponysay`,当我新启动一个命令行会话时，它就会出现。）


  * [ponysay][32] > cowsay
  * [csvkit][33] > awk et al
  * [noti][34] > `display notification`
  * [entr][35] > watch



### 你有什么好点子吗？


上面是我的命令行清单。能告诉我们你的吗？你有没有试着去增强一些你每天都会用到的命令呢？请告诉我，我非常乐意知道。



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
