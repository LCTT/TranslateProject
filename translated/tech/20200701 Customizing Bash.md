[#]: collector: (lujun9972)
[#]: translator: (nophDog)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Customizing Bash)
[#]: via: (https://fedoramagazine.org/customizing-bash/)
[#]: author: (Stephen Snow https://fedoramagazine.org/author/jakfrost/)

定制 Bash
======

![][1]

操作系统的最外层 —— 也就是跟你直接打交道的 —— 叫做 [shell][2]。Fedora 预装了好几种不同的 shell。Shell 可以是图形界面，或者字符界面。在文档中，你常常能见到首字母缩写词 GUI (Graphical User Interface) 跟 CLI (Command-Line Interface) ，这两个词用来区分图形和字符 shell/界面。[GNOME][5] 和 [Bash][6] 分别是 Fedora 默认的图形和命令行界面，不过你也可以使用其它 [GUI][3] 或者 [CLI][4] shell。

接下来我们会讨论一些比较推荐的 Bash 字符界面点文件配置。

### Bash 概览

Bash 参考手册中写道：

> 根本上来说，shell 只是一个能执行命令的宏处理器。宏处理器这个词意味着通过扩展文本跟符号，从而构成更复杂的表达式。
>
> Bash 参考手册
> 第五版，Bash 5.0
> 2019 年 五月

除了能使用其它程序之外，Bash shell 还含有一些内置命令和关键字。Bash 内置功能很强大，甚至能够作为一[门高级语言][7]独当一面。部分 Bash 关键字和操作符类似于 [C 语言][8] 中的规范。

Bash 能够以交互式或非交互式模式启动。在交互模式中，Bash 就是一个很多人都熟悉的典型终端/命令行界面。[GNOME Terminal][9] 默认以交互模式打开 Bash。有一个 Bash 运行于非交互模式的典型例子，当它通过[管道][10]从文件或者 shell 脚本中获取命令和数据时。其它 Bash 可以运行的模式包括：登录（login），非登录（non-login），远程（remote），POSIX，unix sh，受限（restricted），以及不同于用户的 UID/GUI 模式。各种模式是可以相互组合的。比如，interactive + restricted + POSIX 或者 non-interactive + non-login + remote。不同的启动模式，决定着 Bash 所读取的启动文件。理解这些操作模式，有助于帮助我们修改启动文件。

根据 Bash 参考手册，它有以下行为：

> 1\. 从文件中读取输入...，从作为 -c 调用选项传入参数的字符...，或者从用户的终端。
>
>2\. 将输入分解成单词和操作符，遵循 [它的] 引用规则。...这些标记使用元字符隔开。这一步执行别名扩展。
>
> 3\. 将标记解析成简单与复合命令。
>
> 4\. 执行这种 shell 扩展...，将扩展之后的标记分解成文件名...和命令以及参数。
>
> 5\. 执行必要的重定向...从参数列表中去除重定向操作符和操作数。
>
> 6\. 执行命令。
>
> 7\. 必要时等待命令完成，收集退出状态。
>
> Bash 参考文档
>  版本 5.0，Bash 版本 5.0
>  五月 2019

当用户开启终端模拟器进入命令行环境时，便产生了一次交互式 shell 会话。GNOME Terminal 默认以非登录模式为用户打开 Shell。你可以在 Edit → Preferences → Profilles → Command 配置 GNOME Terminal 以何种模式（登录与非登录式）启动。登录模式可以在启动时通过 _-login_ 标识向 Bash 传递。要注意一点，Bash 的 _login_ 与 _non-interactive_ 模式并不互斥。可以让 Bash 同时以 _login_ 和 _non-Interactive_ 模式运行。

### 启动 Bash

除非传入 _noprofile_ 选项，否则 Bash 登录 shell 会默认读取、执行找到的初始化文件。如果 _/etc/profile_ 存在，它会是第一个被执行的文件，紧接着是按 _~/.bash_profile_， _~/.bash_login_ 或 _~/.profile_ 顺序找到的第一个文件。当用户退出登录 shell 时，或者有脚本在非交互登录 shell 中调用了内置 _exit_ 命令，Bash 会读取并执行 _~/.bash_logout_ 中的命令，如果 _/etc/bash_logout_ 存在的话，会紧接着执行。通常来说，_/etc/profile_ 会执行 _/etc/bashrc_ 文件，读取、执行其中的命令，然后查找并执行 _/etc/profile.d_ 目录中以 _sh_ 结尾的文件。同样的，_~/.bash_profile_ 通常也会执行 _~/.bashrc_ 文件。_/etc/bashrc_ 和 _~/.bashrc_ 都会进行检查，避免重复执行。


第一次打开非登录式的交互 shell，会执行 _~/.bashrc_ 文件。这是用户在 Fedora 打开终端使用 shell 最常见的情形。当 Bash 以非交互模式启动 —— 就像运行脚本时那样 —— 它会寻找 _BASH_ENV_ 环境变量。如果找到了，就获取它的值作为文件名，接着读取、执行该文件中的命令。效果跟执行以下命令相同：

```
if [ -n "$BASH_ENV" ]; then . "$BASH_ENV"; fi
```

值得注意的是，_PATH_ 变量的值不会用于搜索文件名。

### 重要的用户点文件

Bash 最广为人知的用户点文件是 _~/.bashrc_。通过编辑该文件，可以设置许多个性化选项。由于我们常常需要设置一些选项，会改动上面提及甚至没有提及的文件，所以大部分自定义选项会成为一个麻烦事。Bash 环境具有很高的可定制性，正是为了适应不同用户的不同需求。

![][11]

当登录 shell 正常退出时，如果 _~/.bash_logout_ 和 _/etc/bash_logout_ 存在，它们会被调用。下一幅图展示了 Bash 作为交互式 shell 启动时的过程。例如，当用户从桌面环境打开终端模拟器时，会按照以下顺序进行。

![][12]

我们已经知道，在不同的启动模式下，Bash 会执行不同的命令，所以很明显，只有几种最需要关注的典型启动模式。分别是非交互、交互式登录 shell，和非交互式、交互式非登录 shell。如果想定义某些全局环境，那么需要将一个具有唯一名称、以 _.sh_ 为后缀的文件（例如 _custom.sh）放置 _/etc/profile.d_ 目录。

对于非交互式非登录启动方式，需要特别注意。在这种模式下，Bash 会检查 _BASH_ENV_ 变量。如果定义了该变量，Bash 会执行它所指向的文件。另外，处理 _BASH_ENV_ 时并不会使用 _PATH_ 变量所存储的值。所以它必须包含执行文件的绝对路径。比如说，如果有人希望非交互式执行脚本时，shell 能读取 _~/.bashrc_ 文件中的设置，那么他可以把类似下面这样的内容放在一个名为 _/etc/profile.d/custom.sh_ 的文件中...

```
# custom.sh
.
.
.
#If Fedora Workstation
BASH_ENV="/home/username/.bashrc"
.
.
.
#If Fedora Silverblue Workstation
BASH_ENV="/var/home/username/.bashrc"

export BASH_ENV
```

上面这份脚本会让每个 shell 脚本在运行之前先执行该用户的 _~/.bashrc_。

用户一般都会自定义系统环境，以便契合他们自己的工作习惯与偏好。举例来说，用户可以通过别名来实现这种程度的自定义。拥有相同起始参数、需要频繁使用的命令是制作别名的最佳选择。以下展示了一些来自 _~/.bashrc_ 文件中定义的别名。

```
# .bashrc
# 执行全局文件
if [ -f /etc/bashrc ];
   then . /etc/bashrc
fi
.
.
.
# 用户别名和函数
alias ls='ls -hF --color=auto'
alias la='ls -ahF --color=auto'

# 让 dir 命令用起来像在 Windows 那样
alias dir='ls --color=auto --format=long'

# 用颜色高亮 grep 结果
alias grep='grep --color=auto'
```

在系统中，别名是一种自定义各种命令的方法。它能减少击键次数，而且让命令用起来更方便。针对用户级别的别名通常存放在该用户的 _~/.bashrc_ 文件中。

如果你发现自己经常要去历史中查找曾经执行过的某条命令，那可能需要改改历史设置了。你依然可以在 _~/.bashrc_ 文件中设置针对用户级别的历史选项。比如说，如习惯同时使用多个终端，那你可能要启用 _histappend_ 选项。某些 Bash 相关的 shell 选项本质上是布尔值（接收 _on_ 或 _off_），通常可以用内置命令 _shopt_ 启用或禁用。接收更复杂的值的 Bash 选项，常常通过赋值给环境变量来达到配置目的。以下演示如何以 shell 选项和环境变量定制 Bash。

```
# 配置 Bash 历史

# Expand dir env vars on tab and set histappend
shopt -s direxpand histappend

#  - ignoreboth = ignorespace and ignoredup
HISTCONTROL='ignoreboth'

# 控制 `history` 输出中的时间格式
HISTTIMEFORMAT="[%F %T] "

# 无限历史记录
# at least, only this works
# NB：在新版 Bash 中，任何 < 0 的写法都有效，但是在 CentOS/RHEL 中，至少只有这样才行得通
HISTSIZE=
HISTFILESIZE=

# 或者对于使用新版 Bash 的人
HISTSIZE=-1
HISTFILESIZE=-1
```

上面例子中的 _direxpand_ 选项，可以让 Bash 用文件名扩展结果替换目录名。它会改变 readline 编辑缓冲区的内容，所以你所输入的东西已经被补全得到的结果替换了。

_HISTCONTROL_ 变量用于启用或禁用命令历史的某些过滤选项。重复行，以空白打头的行，都能通过该选项将它们从命令历史中过滤掉。引用自 Dusty Mabe，我从他那儿得到的启发：

> _ignoredup_ 可以让历史不记录重复条目（如果你反复执行同一条命令）。_ignorespace_ 会忽略前面有空白的条目，当你在设置一个包含敏感信息的环境变量或者执行一条不想被记录进磁盘的命令时，这就很有用。_ignoreboth_ 相当于这两条选项的结合体。
>
> Dusty Mabe – Redhat Principle Software Engineer, June 19, 2020

对于命令行重度用户，Bash 有一个 _CDPATH_ 环境变量。如果 _CDPATH_ 包含一列目录供搜索，且提供一个相对路径作为 _cd_ 命令的第一个参数，那么它会检查所有的目录，寻找匹配的子目录并切换到第一个匹配结果目录。

```
# .bash_profile

# 设置 CDPATH
CDPATH="/var/home/username/favdir1:/var/home/username/favdir2:/var/home/username/favdir3"

# 也可以写成这样
CDPATH="/:~:/var:~/favdir1:~/favdir2:~/favdir3"

export CDPATH
```

_CDPATH_ 通常像 _PATH_ 一样更新 —— 通过在赋值右侧引用自身来保留原来的值。

```
# .bash_profile

# 设置 CDPATH
CDPATH="/var/home/username/favdir1:/var/home/username/favdir2:/var/home/username/favdir3"

# 或者写成这样
CDPATH="/:~:/var:~/favdir1:~/favdir2:~/favdir3"

CDPATH="$CDPATH:~/favdir4:~/favdir5"

export CDPATH
```

_PATH_ 是另一个极其重要的变量。它是系统上命令的搜索路径。注意，有些应用要求将它们自己的目录加入 _PATH_ 变量，这样才能正常使用。跟 _CDPATH_ 一样，通过在赋值右侧引用原值来追加新值到 _PATH_ 变量。如果你希望将新值前置，只需要把原来的值（_$PATH_）放到列表末尾即可。还有注意的是在 Fedora，这一列值通过冒号分隔（**:**）。

```
# .bash_profile

# 添加 PATH 值到 PAHT 环境变量
PATH="$PATH:~/bin:~:/usr/bin:/bin:~/jdk-13.0.2:~/apache-maven-3.6.3"

export PATH
```

命令提示符是另一个流行的自定义选项。它有七个可定制的参数：

> **PROMPT_COMMAND** 如果设置了，会在每一个主提示符（$PS1）出现之前执行。
>
> **PROMPT_DIRTRIM** 如果设置成大于零的数，则该值用作扩展 \w 和 \W 提示符字符串转义符时保留的尾随目录组件数量。删除的字符将替换为省略号。
>
> **PS0** 这个参数的值像 _PS1_ 一样扩展，在交互式 shell 读取命令之后、执行命令之前展示。
>
> **PS1** 主提示符字符串。默认值是 ‘**\s-\v\$** ‘。
>
> **PS2** 次提示符字符串。默认是 ‘_**&gt;**_ ‘。在显示之前，_PS2_ 像 _PS1_ 那样扩展。
>
> **PS3** 这个参数的值用作 _select_ 命令的提示符。如果这个变量没有设置，_select_ 命令会用 ‘**#?** ‘ 作为提示符。
>
> **PS4** 这个参数的值像 _PS1_ 那样扩展，如果设置了 _-x_ 选项，这个值会在命令行被打印之前作为提示符显示。扩展后的值的第一个字符在必要时会复制数次，指示间接层数。默认值是 ‘_**+**_ ‘。
>
> Bash 参考文档
>  版本 5.0，Bash 版本 5.0
>  五月 2019

整篇文章只讨论了 Bash 的这一个方面。你可以找到许许多多信息和例子。有些点文件范例，包括提示符重构，都可以在文章底部链接的仓库中找到。你可以随意使用仓库中的例子进行学习和体验。

### 总结

既然你已经稍微了解 Bash 的工作原理，那就可以轻松修改你的 Bash 点文件，满足你自己的需求和习惯。美化你的提示符。制作一些别名。这样你的电脑才真的属于你。查看 _/etc/profile_，_/etc/bashrc_ 和 _/etc/profile.d/_ 这些文件的内容，获得一些启发。

你也可以留下关于终端模拟器的想法。有很多办法可以将你最喜欢的终端，完全配置成你想要的样子。你或许早就想到了，但是通常可以通过...没错...用户家目录的点文件实现这个目的。终端模拟器也能以一次登录会话启动，有些人总喜欢用登录环境。你使用终端和电脑的姿势，取决于你如何（或者不）修改你的点文件。

如果你很好奇自己的命令行处于什么会话状态，使用下面这个脚本来判断一下。

```
#!/bin/bash

case "$-" in
   (*i*) echo This shell is interactive ;;
   (*) echo This shell is not interactive ;;
esac
```

把这几行放到一个文件里，加上可执行权限，然后运行，就能看到你当前处于何种类型的 shell。_$-_ 在 Bash 中是一个变量，如果是交互式 shell，它会包含字母 **i**。此外，你可以直接输出 $- 变量然后检查它的输出中是否含有 **i** 标记。

```
$ echo $-
```

### 参考信息

可以参考以下资料以获取更多信息和示例。 Bash 手册也是一个很好的信息来源。请注意，确保你的本地手册页记录了你当前运行的 Bash 版本的特性，因为在网上找到的信息有时可能太老（过时了）或太新（你的系统还没有安装）。

<https://opensource.com/tags/command-line>

<https://opensource.com/downloads/bash-cheat-sheet>

在上面的网站中，你必须要输入一个有效的电子邮箱地址，或者注册，才能下载。

<https://opensource.com/article/19/12/bash-script-template>

对本文有各种形式（点文件示例、提示，以及脚本文件）贡献的社区成员：

  * Micah Abbott – Principal Quality Engineer
  * Micah Abbott – 首席质量工程师
  * John Lebon – Principal Software Engineer
  * John Lebon – 首席软件工程师
  * Dusty Mabe – Principal Software Engineer
  * Dusty Mabe – 首席软件工程师
  * Colin Walters – Senior Principal Software Engineer
  * Colin Walters – 高级首席软件工程师


示例点文件和脚本可以在这个仓库中找到。

<https://github.com/TheOneandOnlyJakfrost/bash-article-repo>

请仔细检查上面所提供的仓库中的信息。有些可能已经过时了。里面还包含很多开发中的自定义脚本和宠物容器（pet container）配置例子，那些不是点文件。我推荐从 Lebon 的点文件开始学习，从头到尾都含有完善的解说，在我读过的脚本里属于最详细那一类。祝你学得开心！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/customizing-bash/

作者：[Stephen Snow][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/nophDog)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/jakfrost/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/05/bashenvironment-816x346.png
[2]: https://en.wikipedia.org/wiki/Shell_(computing)
[3]: https://fedoramagazine.org/fedoras-gaggle-of-desktops/
[4]: https://en.wikipedia.org/wiki/Comparison_of_command_shells
[5]: https://en.wikipedia.org/wiki/GNOME
[6]: https://en.wikipedia.org/wiki/Bash_(Unix_shell)
[7]: https://en.wikipedia.org/wiki/High-level_programming_language
[8]: https://en.wikipedia.org/wiki/C_(programming_language)
[9]: https://en.wikipedia.org/wiki/GNOME_Terminal
[10]: https://en.wikipedia.org/wiki/Pipeline_(Unix)
[11]: https://fedoramagazine.org/wp-content/uploads/2020/06/bash-initialization-1-1024x711.png
[12]: https://fedoramagazine.org/wp-content/uploads/2020/06/bash-initialization-2-1024x544.png
[13]: https://en.wikipedia.org/wiki/Boolean_data_type
