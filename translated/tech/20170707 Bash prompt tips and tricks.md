Linux Bash 提示符的一些骚操作
=======================================================

###一些能让你自定义 Bash 提示符的黑科技
![Bash prompt tips and tricks](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/osdc_terminals.png?itok=QmkPW7P1 "Bash prompt tips and tricks")
照片来源 : 

[ajmexico][8]. 修改自 [Jason Baker][9]. [CC BY-SA 2.0][10].

当你在 Linux 环境下打开一个 Shell 终端时，会看到命令行中出现了类似下面的一个提示符:
```git
[user@$host ~]$
```
你知道命令行提示符其实是可以自己设置添加许多非常有用的信息的吗？在这篇文章中我就会教你如何自定义自己的 Bash 命令行提示符，想看的话就接着看吧~

###如何设置 Bash 提示符
Bash 提示符是通过环境变量 PS1(提示符字符串1) 来设置的。当然如果你想一次输入多行的数据，可以尝试通过 PS2 环境变量来设置提示符：
```git
[dneary@dhcp-41-137 ~]$ export PS1="[Linux Rulez]$ "
[Linux Rulez] export PS2="... "
[Linux Rulez] if true; then
... echo "Success!"
... fi
Success!
```

###在哪里设置 PS1 的值？
PS1 就是一个普通的环境变量，系统默认值设置在 /etc/bashrc 目录中，在我的系统中，默认提示符通过以下命令来设置：
```git
[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "
```
它判断 PS1 是否是系统的默认值 \s-\v$ ,如果是的话则将值设置为 [\u@\h \W]\$。
如果你想要自定义提示符，就不应该修改 /etc/bashrc ，而是应该在你的用户目录下将自定义命令加到.bashrc文件中。

###上面提到的 \u,\h,\W,\s 和 \v 是什么意思？
这里有一些参考链接：
- [Linux 是什么](1)
- [Linux 容器是什么](2)
- [快下载吧：这里有Linux 命令小抄](3)
- [比楼上更高级的 Linux 命令小抄](4)
- [我们最新的 Linux 相关文章](5)
在 man bash 中的 PROMPTING 章节，你能够找到所有 PS1 和 PS2 相关描述符的功能，以下是一些比较常用的：
- \u: 用户名
- \h: 短主机名
- \W: 当前你所在的目录名，只显示你的当前父目录
- \s：Shell 名字（bash 或者 sh，取决于你的 Shell 尊姓大名）
- \v：Shell 的版本号

###还有其他的一些特殊的字符串可以用在提示符当中吗
除了上面这些，还有很多有用的字符串可以用在提示符当中：
- \d：将日期扩展成 "Tue Jun 27" 这种格式
- \D{fmt}：允许自定义日期格式-可通过 man strftime 来获得更多信息
- \D{%c}：获得当地的日期和时间
- \n：换行（参考下面的多行提示符）
- \w：显示当前工作目录的绝对路径
- \H：党建工作机器的全名
除了以上这些，你还可以在 Bash man page 的 PROMPTING 部分找到更多的特殊字符和它的用处。

###多行提示符
如果你的提示符过长，想将提示符切成两行，可以使用 "\n" 将提示符切断成两行显示，比如下面的例子会在第一行显示日期，时间和当前工作目录，第二行显示用户名和主机名：
```git
PS1="\D{%c} \w\n[\u@\H]$ "
```
人们偶尔也想将提示符变成彩色的。虽然我觉得彩色提示符让人分心/易怒，但是也许你很喜欢。如果我们想将日期变成红色的，目录变成青蓝色，用户名搞一个黄色背景，你可以这样做：
```git
PS1="\[\e[31m\]\D{%c}\[\e[0m\]
    \[\e[36m\]\w\[\e[0m\]\n[\[\e[1;43m\]\u\[\e[0m\]@\H]$ "
```
- [..] ：表示不需要打印的字符
- \e[.. ：转义字符，后面的字符串表示颜色或者其他意思
- 31m ：表示红色字体（41m 表示是红色背景）
- 36m ：表示是青蓝色字体
- 1;43m ：表示黄色字体（1;33m 表示黄色字体）
- [\e[0m]] ：将颜色恢复成系统终端默认颜色
你可以在[Bash prompt HOWTO](11)这个网站找到更多的颜色代码，甚至可以让字符翻转和闪烁！我可不想这个干，但是你可以！
所以你最喜欢的自定义提示符是什么样子的呢？有没有让你抓狂的自定义提示符呢？请在评论里告诉我吧~

作者简介：

Dave Neary - Dave Neary is a member of the Open Source and Standards team at Red Hat, helping make Open Source projects important to Red Hat be successful. Dave has been around the free and open source software world, wearing many different hats, since sending his first patch to the GIMP in 1999.

via: https://opensource.com/article/17/7/bash-prompt-tips-and-tricks

作者：[Dave Neary  ][a]
译者：[吴霄/toyijiu](https://github.com/toyijiu)
校对：[校对者ID](https://github.com/校对者ID)

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


















