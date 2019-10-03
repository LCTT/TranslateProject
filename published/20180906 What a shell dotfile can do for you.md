Shell 点文件可以为你做点什么
======

> 了解如何使用配置文件来改善你的工作环境。

![](https://img.linux.net.cn/data/attachment/album/201910/03/123528x3skwqwb8sz8qo8s.jpg)

不要问你可以为你的 shell <ruby>点文件<rt>dotfile</rt></ruby>做什么，而是要问一个 shell 点文件可以为你做什么！

我一直在操作系统领域里面打转，但是在过去的几年中，我的日常使用的一直是 Mac。很长一段时间，我都在使用 Bash，但是当几个朋友开始把 [zsh][1] 当成宗教信仰时，我也试试了它。我没用太长时间就喜欢上了它，几年后，我越发喜欢它做的许多小事情。

我一直在使用 zsh（通过 [Homebrew][2] 提供，而不是由操作系统安装的）和 [Oh My Zsh 增强功能][3]。

本文中的示例是我的个人 `.zshrc`。大多数都可以直接用在 Bash 中，我觉得不是每个人都依赖于 Oh My Zsh，但是如果不用的话你的工作量可能会有所不同。曾经有一段时间，我同时为 zsh 和 Bash 维护一个 shell 点文件，但是最终我还是放弃了我的 `.bashrc`。

### 不偏执不行

如果你希望在各个操作系统上使用相同的点文件，则需要让你的点文件聪明点。

```
### Mac 专用
if [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac 专用内容在此
```

例如，我希望 `Alt + 箭头键` 将光标按单词移动而不是单个空格。为了在 [iTerm2][4]（我的首选终端）中实现这一目标，我将此代码段添加到了 `.zshrc` 的 Mac 专用部分：

```
### Mac 专用
if [[ "$OSTYPE" == "darwin"* ]]; then
        ### Mac 用于 iTerm2 的光标命令；映射 ctrl+arrows 或 alt+arrows 来快速移动
        bindkey -e
        bindkey '^[[1;9C' forward-word
        bindkey '^[[1;9D' backward-word
        bindkey '\e\e[D' backward-word
        bindkey '\e\e[C' forward-word
fi
```

（LCTT 译注：标题 “We're all mad here” 是电影《爱丽丝梦游仙境》中，微笑猫对爱丽丝讲的一句话：“我们这儿全都是疯的”。）

### 在家不工作

虽然我开始喜欢我的 Shell 点文件了，但我并不总是想要家用计算机上的东西与工作的计算机上的东西一样。解决此问题的一种方法是让补充的点文件在家中使用，而不是在工作中使用。以下是我的实现方式：

```
if [[ `egrep 'dnssuffix1|dnssuffix2' /etc/resolv.conf` ]]; then
        if [ -e $HOME/.work ]
                source $HOME/.work
        else
                echo "This looks like a work machine, but I can't find the ~/.work file"
        fi
fi
```

在这种情况下，我根据我的工作 dns 后缀（或多个后缀，具体取决于你的情况）来提供（`source`）一个可以使我的工作环境更好的单独文件。

（LCTT 译注：标题 “What about Bob?” 是 1991 年的美国电影《天才也疯狂》。）

### 你该这么做

现在可能是放弃使用波浪号（`~`）表示编写脚本时的主目录的好时机。你会发现在某些上下文中无法识别它。养成使用环境变量 `$HOME` 的习惯，这将为你节省大量的故障排除时间和以后的工作。

如果你愿意，合乎逻辑的扩展是应该包括特定于操作系统的点文件。

（LCTT 译注：标题 “That thing you do” 是 1996 年由汤姆·汉克斯执导的喜剧片《挡不住的奇迹》。）

### 别指望记忆

我写了那么多 shell 脚本，我真的再也不想写脚本了。并不是说 shell 脚本不能满足我大部分时间的需求，而是我发现写 shell 脚本，可能只是拼凑了一个胶带式解决方案，而不是永久地解决问题。

同样，我讨厌记住事情，在我的整个职业生涯中，我经常不得不在一天之中就彻彻底底地改换环境。实际的结果是这些年来，我不得不一再重新学习很多东西。（“等等……这种语言使用哪种 for 循环结构？”）

因此，每隔一段时间我就会觉得自己厌倦了再次寻找做某事的方法。我改善生活的一种方法是添加别名。

对于任何一个使用操作系统的人来说，一个常见的情况是找出占用了所有磁盘的内容。不幸的是，我从来没有记住过这个咒语，所以我做了一个 shell 别名，创造性地叫做 `bigdirs`：

```
alias bigdirs='du --max-depth=1 2> /dev/null | sort -n -r | head -n20'
```

虽然我可能不那么懒惰，并实际记住了它，但是，那不太 Unix ……

（LCTT 译注：标题 “Memory, all alone in the moonlight” 是一手英文老歌。）

### 输错的人们

使用 shell 别名改善我的生活的另一种方法是使我免于输入错误。我不知道为什么，但是我已经养成了这种讨厌的习惯，在序列 `ea` 之后输入 `w`，所以如果我想清除终端，我经常会输入 `cleawr`。不幸的是，这对我的 shell 没有任何意义。直到我添加了这个小东西：

```
alias cleawr='clear'
```

在 Windows 中有一个等效但更好的命令 `cls`，但我发现自己会在 Shell 也输入它。看到你的 shell 表示抗议真令人沮丧，因此我添加：

```
alias cls='clear'
```

是的，我知道 `ctrl + l`，但是我从不使用它。

（LCTT 译注：标题 “Typos, and the people who love them” 可能来自某部电影。）

### 要自娱自乐

工作压力很大。有时你需要找点乐子。如果你的 shell 不知道它显然应该执行的命令，则可能你想直接让它耸耸肩！你可以使用以下功能执行此操作：

```
shrug() { echo "¯\_(ツ)_/¯"; }
```

如果还不行，也许你需要掀桌不干了：

```
fliptable() { echo "（╯°□°）╯ ┻━┻"; } # 掀桌，用法示例: fsck -y /dev/sdb1 || fliptable
```

想想看，当我想掀桌子时而我不记得我给它起了个什么名字，我会有多沮丧和失望，所以我添加了更多的 shell 别名：

```
alias flipdesk='fliptable'
alias deskflip='fliptable'
alias tableflip='fliptable'
```

而有时你需要庆祝一下：

```
disco() {
        echo "(•_•)"
        echo "<)   )╯"
        echo " /    \ "
        echo ""
        echo "\(•_•)"
        echo " (   (>"
        echo " /    \ "
        echo ""
        echo " (•_•)"
        echo "<)   )>"
        echo " /    \ "
}
```

通常，我会将这些命令的输出通过管道传递到 `pbcopy`，并将其粘贴到我正在使用的相关聊天工具中。

我从一个我关注的一个叫 “Command Line Magic” [@ climagic][5] 的 Twitter 帐户得到了下面这个有趣的函数。自从我现在住在佛罗里达州以来，我很高兴看到我这一生中唯一的一次下雪：

```
snow() {
        clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.1;done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH*\033[0;0H",a[x],x;}}'
}
```

（LCTT 译注：标题 “Amuse yourself” 是 1936 年的美国电影《自娱自乐》）

### 函数的乐趣

我们已经看到了一些我使用的函数示例。由于这些示例中几乎不需要参数，因此可以将它们作为别名来完成。 当比一个短句更长时，我出于个人喜好使用函数。

在我职业生涯的很多时期我都运行过 [Graphite][6]，这是一个开源、可扩展的时间序列指标解决方案。 在很多的情况下，我需要将度量路径（用句点表示）转换到文件系统路径（用斜杠表示），反之亦然，拥有专用于这些任务的函数就变得很有用：

```
# 在 Graphite 指标和文件路径之间转换很有用
function dottoslash() {
        echo $1 | sed 's/\./\//g'
}
function slashtodot() {
        echo $1 | sed 's/\//\./g'
}
```

在我的另外一段职业生涯里，我运行了很多 Kubernetes。如果你对运行 Kubernetes 不熟悉，你需要编写很多 YAML。不幸的是，一不小心就会编写了无效的 YAML。更糟糕的是，Kubernetes 不会在尝试应用  YAML 之前对其进行验证，因此，除非你应用它，否则你不会发现它是无效的。除非你先进行验证：

```
function yamllint() {
        for i in $(find . -name '*.yml' -o -name '*.yaml'); do echo $i; ruby -e "require 'yaml';YAML.load_file(\"$i\")"; done
}
```

因为我厌倦了偶尔破坏客户的设置而让自己感到尴尬，所以我写了这个小片段并将其作为提交前挂钩添加到我所有相关的存储库中。在持续集成过程中，类似的内容将非常有帮助，尤其是在你作为团队成员的情况下。

（LCTT 译注：哦抱歉，我不知道这个标题的出处。）

### 手指不听话

我曾经是一位出色的盲打打字员。但那些日子已经一去不回。我的打字错误超出了我的想象。

在各种时期，我多次用过 Chef 或 Kubernetes。对我来说幸运的是，我从未同时使用过这两者。

Chef 生态系统的一部分是 Test Kitchen，它是加快测试的一组工具，可通过命令 `kitchen test` 来调用。Kubernetes 使用 CLI 工具 `kubectl` 进行管理。这两个命令都需要几个子命令，并且这两者都不会特别顺畅地移动手指。

我没有创建一堆“输错别名”，而是将这两个命令别名为 `k`：

```
alias k='kitchen test $@'
```

或

```
alias k='kubectl $@'
```

（LCTT 译注：标题 “Oh, fingers, where art thou?” 演绎自《O Brother, Where Art Thou?》，这是 2000 年美国的一部电影《逃狱三王》。）

### 分裂与合并

我职业生涯的后半截涉及与其他人一起编写更多代码。我曾在许多环境中工作过，在这些环境中，我们在帐户中复刻了存储库副本，并将拉取请求用作审核过程的一部分。当我想确保给定存储库的复刻与父版本保持最新时，我使用 `fetchupstream`：

```
alias fetchupstream='git fetch upstream && git checkout master && git merge upstream/master && git push'
```

（LCTT 译注：标题 “Timesplitters” 是一款视频游戏《时空分裂者》。）

### 颜色之荣耀

我喜欢颜色。它可以使 `diff` 之类的东西更易于使用。

```
alias diff='colordiff'
```

我觉得彩色的手册页是个巧妙的技巧，因此我合并了以下函数：

```
# 彩色化手册页，来自：
# http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
man() {
        env \
                LESS_TERMCAP_md=$(printf "\e[1;36m") \
                LESS_TERMCAP_me=$(printf "\e[0m") \
                LESS_TERMCAP_se=$(printf "\e[0m") \
                LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
                LESS_TERMCAP_ue=$(printf "\e[0m") \
                LESS_TERMCAP_us=$(printf "\e[1;32m") \
                man "$@"
}
```

我喜欢命令 `which`，但它只是告诉你正在运行的命令在文件系统中的位置，除非它是 Shell 函数才能告诉你更多。在多个级联的点文件之后，有时会不清楚函数的定义位置或作用。事实证明，`whence` 和 `type` 命令可以帮助解决这一问题。

```
# 函数定义在哪里？
whichfunc() {
        whence -v $1
        type -a $1
}
```

（LCTT 译注：标题“Mine eyes have seen the glory of the coming of color” 演绎自歌曲 《Mine Eyes Have Seen The Glory Of The Coming Of The Lord》）

### 总结

希望本文对你有所帮助，并能激发你找到改善日常使用 Shell 的方法。这些方法不必庞大、新颖或复杂。它们可能会解决一些微小但频繁的摩擦、创建捷径，甚至提供减少常见输入错误的解决方案。

欢迎你浏览我的 [dotfiles 存储库][7]，但我要警示你，这样做可能会花费很多时间。请随意使用你认为有帮助的任何东西，并互相取长补短。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/shell-dotfile

作者：[H.Waldo Grunenwald][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gwaldo
[1]: http://www.zsh.org/
[2]: https://brew.sh/
[3]: https://github.com/robbyrussell/oh-my-zsh
[4]: https://www.iterm2.com/
[5]: https://twitter.com/climagic
[6]: https://github.com/graphite-project/
[7]: https://github.com/gwaldo/dotfiles
