Linux Bash 提示符的一些骚操作
=======================================================

> 一些能让你自定义 Bash 提示符的黑科技

![Bash prompt tips and tricks](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/osdc_terminals.png?itok=QmkPW7P1 "Bash prompt tips and tricks")

当你在 Linux 环境下打开一个 Shell 终端时，会看到命令行中出现了类似下面的一个 Bash 提示符：

```
[user@$host ~]$
```

你知道命令行提示符其实是可以自己设置添加许多非常有用的信息的吗？在这篇文章中我就会教你如何自定义自己的 Bash 命令行提示符，想看的话就接着看吧~

### 如何设置 Bash 提示符

Bash 提示符是通过环境变量 `PS1` （<ruby>提示符字符串 1<rt>Prompt String 1</rt></ruby>） 来设置的，它用于交互式 shell 提示符。当然如果你需要更多的输入才能完成一个 Bash 命令时，`PS2` 环境变量就是用来设置多行提示符的：

```
[dneary@dhcp-41-137 ~]$ export PS1="[Linux Rulez]$ "
[Linux Rulez] export PS2="... "
[Linux Rulez] if true; then
... echo "Success!"
... fi
Success!
```

### 在哪里设置 PS1 的值？

`PS1` 就是一个普通的环境变量，系统默认值设置在 `/etc/bashrc` 中，在我的系统中，默认提示符通过以下命令来设置的：

```
[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "
```

它判断 `PS1` 是否是系统的默认值 `\s-\v$` ，如果是的话则将值设置为 `[\u@\h \W]\$`。（LCTT 译注：注意命令中用 `\` 做了转义。）

但如果你想要自定义提示符，不应该修改 `/etc/bashrc` ，而是应该在你的主目录下将自定义命令加到 `.bashrc` 文件中。

### 上面提到的 `\u`、`\h`、`\W`、`\s` 和 `\v` 是什么意思？

在 `man bash` 中的 PROMPTING 章节中，你能够找到所有 `PS1` 和 `PS2` 相关的特殊字符的描述，以下是一些比较常用的：

- `\u`：用户名
- `\h`：短主机名
- `\W`：当前你所在的目录的名称（basename），`~` 表示你的主目录
- `\s`：Shell 名字（bash 或者 sh，取决于你的 Shell 的名字是什么）
- `\v`：Shell 的版本号

### 还有哪些特殊的字符串可以用在提示符当中

除了上面这些，还有很多有用的字符串可以用在提示符当中：

- `\d`：将日期扩展成 “Tue Jun 27” 这种格式
- `\D{fmt}`：允许自定义日期格式——可通过 `man strftime` 来获得更多信息
- `\D{%c}`：获得本地化的日期和时间
- `\n`：换行（参考下面的多行提示符）
- `\w`：显示当前工作目录的完整路径
- `\H`：当前工作机器的完整主机名

除了以上这些，你还可以在 Bash 的 man 页面的 PROMPTING 部分找到更多的特殊字符和它的用处。

### 多行提示符

如果你的提示符过长（比如说你想包括 `\H` 、`\w` 或完整的日期时间时 ），想将提示符切成两行，可以使用 `\n` 将提示符切断成两行显示，比如下面的多行的例子会在第一行显示日期、时间和当前工作目录，第二行显示用户名和主机名：

```
PS1="\D{%c} \w\n[\u@\H]$ "
```
### 还能再好玩点吗？

人们偶尔也想将提示符变成彩色的。虽然我觉得彩色提示符让人分心、易怒，但是也许你很喜欢。如果我们想将日期变成红色的，目录变成青蓝色，用户名搞一个黄色背景，你可以这样做：

```
PS1="\[\e[31m\]\D{%c}\[\e[0m\]
    \[\e[36m\]\w\[\e[0m\]\n[\[\e[1;43m\]\u\[\e[0m\]@\H]$ "
```

- `\[..\]` ：表示一些非打印字符
- `\e[..` ：转义字符，后面的跟着的特定的转义字符串在终端中表示颜色或者其他意思
- `31m` ：表示红色字体（`41m` 表示是红色背景）
- `36m` ：表示是青蓝色字体
- `1;43m` ：表示黄色字体（`1;33m` 表示黄色字体）
- `[\e[0m]]` ：它在最后将颜色恢复成系统终端默认颜色

你可以在 [Bash prompt HOWTO][11] 这里找到更多的颜色代码，甚至可以让字符反相和闪烁！我不知道为什么地球人会有这种想法，但是你可以这么干！

所以你最喜欢的自定义提示符是什么样子的呢？有没有让你抓狂的自定义提示符呢？请在评论里告诉我吧~


（照片来源：[ajmexico][8]. 修改自 [Jason Baker][9]. [CC BY-SA 2.0][10].）

---

作者简介：

Dave Neary - Dave Neary 是红帽开源和标准化团队成员，帮助开源项目对红帽的成功至关重要。自从在 1999 年为 GIMP 提交了第一个补丁以来，他一直带着各种不同的帽子，在开源的世界徜徉。

---

via: https://opensource.com/article/17/7/bash-prompt-tips-and-tricks

作者：[Dave Neary][a]
译者：[吴霄/toyijiu](https://github.com/toyijiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dneary
[1]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[2]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/article/17/7/bash-prompt-tips-and-tricks?rate=7o5TkSbm_tDUEANDpxTZJU3LgEg0EK-j4xPuNL79m3M
[7]:https://opensource.com/user/16681/feed
[8]:https://www.flickr.com/photos/15587432@N02/3281139507/
[9]:https://opensource.com/users/jason-baker
[10]:https://creativecommons.org/licenses/by/2.0/
[11]:http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
[12]:https://opensource.com/users/dneary
[13]:https://opensource.com/users/dneary
[14]:https://opensource.com/article/17/7/bash-prompt-tips-and-tricks#comments
