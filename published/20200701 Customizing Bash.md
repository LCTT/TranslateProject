[#]: collector: (lujun9972)
[#]: translator: (nophDog)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12429-1.html)
[#]: subject: (Customizing Bash)
[#]: via: (https://fedoramagazine.org/customizing-bash/)
[#]: author: (Stephen Snow https://fedoramagazine.org/author/jakfrost/)

深入了解定制 Bash
======

![](https://img.linux.net.cn/data/attachment/album/202007/19/110018bl392bj3g3g41a23.jpg)

操作系统的最外层 —— 也就是跟你直接打交道的 —— 叫做 [shell][2]（“外壳”）。Fedora 预装了好几种不同的 shell。shell 可以是图形界面，或者字符界面。在文档中，你常常能见到两个母缩写词 GUI （<ruby>图形用户界面<rt>Graphical User Interface</rt></ruby>）跟 CLI（<ruby>命令行界面<rt>Command-Line Interface</rt></ruby>），它们用来区分图形和基于字符的 shell/界面。[GNOME][5] 和 [Bash][6] 分别是 Fedora 默认的图形和命令行界面，不过你也可以使用其它 [GUI][3] 或者 [CLI][4] shell。

接下来在这篇文章中，我们会讨论一些比较推荐的 Bash 字符界面的点文件配置。

### Bash 概览

Bash 参考手册中写道：

> 根本上来说，shell 只是一个能执行命令的宏处理器。宏处理器这个词意味着通过扩展文本跟符号，从而构成更复杂的表达式。
>
> **Bash 参考手册**
> **第五版，Bash 5.0**
> **2019 年 5 月**

除了能使用其它程序之外，Bash shell 还含有一些内置命令和关键字。Bash 内置功能很强大，甚至能够作为一门 [高级语言][7] 独当一面。Bash 的几个关键字和操作符类似于 [C 语言][8]。

Bash 能够以交互式或非交互式模式启动。Bash 的交互模式是一个很多人都熟悉的典型的终端/命令行界面。[GNOME 终端][9] 默认以交互模式打开 Bash。Bash 在非交互模式下运行的例子是，当命令和数据从文件或 shell 脚本通过 [管道][10] 传送到 Bash 时。其它 Bash 可以运行的模式包括：<ruby>登录<rt>login</rt></ruby>、<ruby>非登录<rt>non-login</rt></ruby>、<ruby>远程<rt>remote</rt></ruby>、POSIX、Unix sh、<ruby>受限<rt>restricted</rt></ruby>，以及使用与用户不同的 UID/GID 模式。各种模式是可以相互组合的。比如，交互式 + 受限 + POSIX 或者非交互式 + 非登录 + 远程。不同的启动模式，决定着 Bash 所读取的启动文件。理解这些操作模式，有助于帮助我们修改启动文件。

根据 Bash 参考手册，它会：

> 1. 从文件中...、从作为 `-c` 调用选项传入参数的字符...，或者从用户的终端中读取输入。
> 2. 将输入分解成单词和操作符，遵循 [它的] 引用规则。...这些标记使用元字符隔开。这一步执行别名展开。
> 3. 将标记解析成简单与复合命令。
> 4. 执行各种 shell 展开...，将展开之后的标记分解成文件名...以及命令和参数的列表。
> 5. 执行必要的重定向...并从参数列表中去除重定向操作符及其操作数。
> 6. 执行命令。
> 7. 必要时等待命令完成，并收集退出状态。
>
> **Bash 参考文档**
> **第五版，Bash 版本 5.0**
> **2019 年 5 月**

当用户开启终端模拟器进入命令行环境时，便启动了一次交互式 shell 会话。GNOME 终端默认以非登录模式为用户打开 Shell。你可以在 “<ruby>编辑 → 首选项 → 配置文件 → 命令<rt>Edit → Preferences → Profilles → Command</rt></ruby>” 中配置 GNOME 终端以何种模式（登录与非登录式）启动。也可以在 Bash 启动时通过向其传递 `-login` 标志来要求进入登录模式。要注意一点，Bash 的登录模式与非交互模式并不互斥。可以让 Bash 同时以登录模式和非交互模式运行。

### 启动 Bash

除非传入 `-noprofile` 选项，否则登录模式的 Bash shell 会默认读取并执行某些初始化文件中命令。如果 `/etc/profile` 存在，它会是第一个被执行的文件，紧接着是按 `~/.bash_profile`、`~/.bash_login` 或 `~/.profile` 顺序找到的第一个文件。当用户退出登录模式的 shell 时，或者有脚本在非交互式登录模式的 shell 中调用了内置 `exit` 命令，Bash 会读取并执行 `~/.bash_logout` 中的命令，如果 `/etc/bash_logout` 存在的话，会紧接着执行它。通常来说，`/etc/profile` 会<ruby>援引<rt>source</rt></ruby> `/etc/bashrc` 文件，读取并执行其中的命令，然后查找并读取执行 `/etc/profile.d` 目录中以 `.sh` 结尾的文件。同样的，`~/.bash_profile` 通常也会<ruby>援引<rt>source</rt></ruby> `~/.bashrc` 文件。`/etc/bashrc` 和 `~/.bashrc` 都会进行检查，避免重复<ruby>援引<rt>source</rt></ruby>。

（LCTT 译注：在 Bash 中，脚本会通过 `source` 或 `.` 命令来将另外一个脚本引入其中，这个行为称之为 “source”、“sourcing”，但是该行为一直没有公认且常用的翻译方法。经过多番斟酌，我认为可以译做“援引”，理由如下：1、“援引”具有“引用、引入”的意思，符合该行为；2、“援”这个词的发音和“source” 常见的汉语意思“源”同音，便于记忆。以上是我们的愚见，供大家参考讨论。—— 老王，2020/7/19）

一个交互式的 shell，如果不是登录 shell，那么当它第一次被调用的时候，会执行 `~/.bashrc` 文件。这是用户在 Fedora 上打开终端时通常会进入的 shell 类型。当 Bash 以非交互模式启动 —— 就像运行脚本时那样 —— 它会寻找 `BASH_ENV` 环境变量。如果找到了，就会展开它的值作为文件名，接着读取并执行该文件。效果跟执行以下命令相同：

```
if [ -n "$BASH_ENV" ]; then . "$BASH_ENV"; fi
```

值得注意的是，不会使用 `PATH` 环境变量的值来搜索该文件名（LCTT 译注：意即不会检索搜索路径）。

### 重要的用户点文件

Bash 最广为人知的用户点文件是 `~/.bashrc`。通过编辑该文件，可以设置大多数个性化选项。由于我们常常需要设置一些选项，会改动上面提及甚至没有提及的文件，所以大部分自定义选项会成为一个麻烦事。Bash 环境具有很高的可定制性，正是为了适应不同用户的不同需求。

![][11]

当登录 shell 正常退出时，如果 `~/.bash_logout` 和 `/etc/bash_logout` 存在，它们会被调用。下一幅图展示了 Bash 作为交互式 shell 启动时的过程。例如，当用户从桌面环境打开终端模拟器时，会按照以下顺序进行。

![][12]

我们已经知道，在不同的启动模式下，Bash 会执行不同的命令，所以很明显，只有几种最需要关注的典型启动模式。分别是非交互、交互式登录 shell，和非交互式、交互式非登录 shell。如果想定义某些全局环境，那么需要将一个具有唯一名称、以 `.sh` 为后缀的文件（例如 `custom.sh`）放置在 `/etc/profile.d` 目录。

对于非交互式非登录启动方式，需要特别注意。在这种模式下，Bash 会检查 `BASH_ENV` 变量。如果定义了该变量，Bash 会援引它所指向的文件。另外，处理 `BASH_ENV` 时并不会使用 `PATH` 变量所存储的值（LCTT 译注：意即不会检索搜索路径），所以它必须包含执行文件的绝对路径。比如说，如果有人希望非交互式执行脚本时，shell 能读取 `~/.bashrc` 文件中的设置，那么他可以把类似下面这样的内容放在一个名为 `/etc/profile.d/custom.sh` 的文件中...

```
# custom.sh
.
.
.
# 如果使用 Fedora Workstation
BASH_ENV="/home/username/.bashrc"
.
.
.
# 如果使用 Fedora Silverblue Workstation
BASH_ENV="/var/home/username/.bashrc"

export BASH_ENV
```

上面这份脚本会让每个 shell 脚本在运行之前先执行该用户的 `~/.bashrc`。

用户一般都会自定义他们的系统环境，以便契合他们自己的工作习惯与偏好。举例来说，用户可以通过别名来实现这种程度的自定义。拥有相同起始参数、需要频繁使用的命令是制作别名的最佳选择。以下展示了一些来自 `~/.bashrc` 文件中定义的别名。

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

在系统中，别名是一种自定义各种命令的方法。它能减少击键次数，而且让命令用起来更方便。针对用户级别的别名通常存放在该用户的 `~/.bashrc` 文件中。

如果你发现自己经常要去历史中查找曾经执行过的某条命令，那可能需要改改历史设置了。你依然可以在 `~/.bashrc` 文件中设置针对用户级别的历史选项。比如说，如习惯同时使用多个终端，那你可能要启用 `histappend` 选项。某些 Bash 相关的 shell 选项本质上是布尔值（接收 `on` 或 `off`），通常可以用内置命令 `shopt` 启用或禁用。接收更复杂的值的 Bash 选项（如 `HISTTIMEFORMAT`），常常通过赋值给环境变量来达到配置目的。以下演示如何以 shell 选项和环境变量定制 Bash。

```
# 配置 Bash 历史

# 用制表符扩展目录环境变量，并设置 histappend
shopt -s direxpand histappend

# ignoreboth 等同于 ignorespace 和 ignoredup
HISTCONTROL='ignoreboth'

# 控制 `history` 输出中的时间格式
HISTTIMEFORMAT="[%F %T] "

# 无限历史记录
# NB：在新版 Bash 中，任何 < 0 的写法都有效，但是在 CentOS/RHEL 中，只有这样才行得通
HISTSIZE=
HISTFILESIZE=

# 或者对于使用新版 Bash 的人
HISTSIZE=-1
HISTFILESIZE=-1
```

上面例子中的 `direxpand` 选项，可以让 Bash 在文件名补全时，用单词展开结果替换目录名。它会改变 readline 编辑缓冲区的内容，所以你所输入的东西已经被补全得到的结果替换了。

`HISTCONTROL` 变量用于启用或禁用命令历史的某些过滤选项。重复行、以空白打头的行，都能通过该选项将它们从命令历史中过滤掉。引用自 Dusty Mabe，这是我从他那儿得到的技巧：

> `ignoredup` 可以让历史不记录重复条目（如果你反复执行同一条命令）。`ignorespace` 会忽略前面有空白的条目，当你在设置一个包含敏感信息的环境变量或者执行一条不想被记录进磁盘的命令时，这就很有用。`ignoreboth` 相当于这两条选项的结合体。
>
> **Dusty Mabe – Redhat 首席软件工程师，2020.6.19**

对于命令行重度用户，Bash 有一个 `CDPATH` 环境变量。如果 `CDPATH` 包含一系列供 `cd` 命令搜索的目录，且提供一个相对路径作为第一个参数，那么它会按顺序检查所有列出的目录，寻找匹配的子目录并切换到第一个匹配结果目录。

```
# .bash_profile

# 设置 CDPATH
CDPATH="/var/home/username/favdir1:/var/home/username/favdir2:/var/home/username/favdir3"

# 也可以写成这样
CDPATH="/:~:/var:~/favdir1:~/favdir2:~/favdir3"

export CDPATH
```

`CDPATH` 通常像 `PATH` 一样的方式进行更新 —— 通过在赋值右侧引用自身来保留原来的值。

```
# .bash_profile

# 设置 CDPATH
CDPATH="/var/home/username/favdir1:/var/home/username/favdir2:/var/home/username/favdir3"

# 或者写成这样
CDPATH="/:~:/var:~/favdir1:~/favdir2:~/favdir3"

CDPATH="$CDPATH:~/favdir4:~/favdir5"

export CDPATH
```

`PATH` 是另一个极其重要的变量。它是系统上的命令的搜索路径。注意，有些应用要求将它们自己的目录加入 `PATH` 变量，这样才能正常使用。跟 `CDPATH` 一样，通过在赋值右侧引用原值来追加新值到 `PATH` 变量。如果你希望将新值前置，只需要把原来的值（`$PATH`）放到列表末尾即可。还有注意的是在 Fedora，这一列值通过冒号分隔（`:`）。

```
# .bash_profile

# 添加 PATH 值到 PAHT 环境变量
PATH="$PATH:~/bin:~:/usr/bin:/bin:~/jdk-13.0.2:~/apache-maven-3.6.3"

export PATH
```

命令提示符是另一个流行的自定义选项。它有七个可定制的参数：

> - `PROMPT_COMMAND`：如果设置了，会在每一个主提示符（`$PS1`）出现之前执行该值。
> - `PROMPT_DIRTRIM`：如果设置成大于零的数，则该值用作展开 `\w` 和 `\W` 提示符字符串转义符时保留的尾随目录组件数量。删除的字符将替换为省略号。
> - `PS0`：这个参数的值像 `PS1` 一样展开，在交互式 shell 读取命令之后、执行命令之前展示。
> - `PS1`：主提示符字符串。默认值是 `\s-\v\$ `。
> - `PS2`：次提示符字符串。默认是 `> `。在显示之前，`PS2` 像 `PS1` 那样展开。
> - `PS3`：这个参数的值用作 `select` 命令的提示符。如果这个变量没有设置，`select` 命令会用 `#? ` 作为提示符。
> - `PS4`：这个参数的值像 `PS1` 那样展开，如果设置了 `-x` 选项，这个展开值会在命令行被回显之前作为提示符显示。展开后的值的第一个字符在必要时会复制数次，指示间接层数。默认值是 `+ `。
>
> **Bash 参考文档**
> **第五版，Bash 版本 5.0**
> **2019 年 5 月**

 Bash 的这一个方面就可以用整篇文章来讨论。你可以找到许许多多信息和例子。在本文末尾链接的存储库中提供了一些点文件范例，包括提示符重新配置。你可以随意使用该存储库中的例子进行学习和体验。

### 总结

既然你已经掌握了一些 Bash 的工作原理，那就可以轻松修改你的 Bash 点文件，满足你自己的需求和习惯。美化你的提示符，制作一些别名，这样你的电脑才真的属于你。查看 `/etc/profile`、`/etc/bashrc` 和 `/etc/profile.d/` 这些文件的内容，获得一些启发。

你也可以在这里写一些关于终端模拟器的评论。有很多办法可以将你最喜欢的终端，完全配置成你想要的样子。你或许早就想到了，但是通常可以通过……嗯……用户家目录的点文件实现这个目的。终端模拟器也可以作为登录会话启动，有些人总喜欢用登录环境。你使用终端和电脑的姿势，取决于你如何修改（或不修改）你的点文件。

如果你很好奇自己的命令行处于什么会话状态，使用下面这个脚本来判断一下。

```
#!/bin/bash

case "$-" in
   (*i*) echo This shell is interactive ;;
   (*) echo This shell is not interactive ;;
esac
```

把这几行放到一个文件里，加上可执行权限，然后运行，就能看到你当前处于何种类型的 shell。`$-` 在 Bash 中是一个变量，如果是交互式 shell，它会包含字母 `i`。此外，你可以直接输出 `$-` 变量然后检查它的输出中是否含有 `i` 标记。

```
$ echo $-
```

### 参考信息

可以参考以下资料以获取更多信息和示例。Bash 手册也是一个很好的信息来源。请注意，确保你的本地手册页记录了你当前运行的 Bash 版本的特性，因为在网上找到的信息有时可能太老（过时了）或太新（你的系统还没有安装）。

- <https://opensource.com/tags/command-line>
- <https://opensource.com/downloads/bash-cheat-sheet>（在该网站中，你必须要输入一个有效的电子邮箱地址，或者注册，才能下载。）
- <https://opensource.com/article/19/12/bash-script-template>

对本文有各种形式（点文件示例、提示，以及脚本文件）贡献的社区成员：

  * Micah Abbott – 首席质量工程师
  * John Lebon – 首席软件工程师
  * Dusty Mabe – 首席软件工程师
  * Colin Walters – 高级首席软件工程师

示例点文件和脚本可以在这个存储库中找到：

- <https://github.com/TheOneandOnlyJakfrost/bash-article-repo>

请仔细检查上面所提供的存储库中的信息。有些可能已经过时了。里面还包含很多开发中的自定义脚本和<ruby>宠物容器<rt>pet container</rt></ruby>配置例子，那些不是点文件。我推荐从 John Lebon 的点文件开始学习，从头到尾都含有完善的解说，它们是我见过的最详细的，并且包含了非常好的描述。祝你学得开心！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/customizing-bash/

作者：[Stephen Snow][a]
选题：[lujun9972][b]
译者：[nophDog](https://github.com/nophDog)
校对：[wxy](https://github.com/wxy)

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
