Lolcat ：一个在 Linux 终端中输出彩虹特效的命令行工具
================================================================================
那些相信 Linux 命令行是单调无聊且没有任何乐趣的人们，你们错了，这里有一些有关 Linux 的文章,它们展示着 Linux 是如何的有趣和“淘气” 。

- [Linux命令及Linux终端的20个趣事][1]
- [终端中的乐趣：6个有趣的Linux命令行工具][2]
- [Linux终端的乐趣之把玩字词计数][3]

在本文中，我将讨论一个名为“lolcat”的小工具 – 它可以在终端中生成彩虹般的颜色。

![为终端生成彩虹般颜色的输出的 Lolcat 命令](http://www.tecmint.com/wp-content/uploads/2015/06/Linux-Lolcat.png)

*为终端生成彩虹般颜色的输出的 Lolcat 命令*

#### 何为 lolcat ? ####

Lolcat 是一个针对 Linux，BSD 和 OSX 平台的工具，它类似于 [cat 命令][4]，并为 `cat` 的输出添加彩虹般的色彩。 Lolcat 主要用于在 Linux 终端中为文本添加彩虹般的色彩。

### 在 Linux 中安装 Lolcat ###

**1. Lolcat 工具在许多 Linux 发行版的软件仓库中都可获取到，但可获得的版本都有些陈旧，而你可以通过 git 仓库下载和安装最新版本的 lolcat。**

由于 Lolcat 是一个 ruby gem 程序，所以在你的系统中必须安装有最新版本的 RUBY。

    # apt-get install ruby      [在基于 APT 的系统中]
    # yum install ruby          [在基于 Yum 的系统中]
    # dnf install ruby          [在基于 DNF 的系统中]
    
一旦 ruby 软件包安装成功，请确保验证安装的 ruby 的版本。

    # ruby --version
    
    ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]

**2. 接着使用下面的命令来从 lolcat 的 git 仓库中下载和安装最新版本的 lolcat。**

    # wget https://github.com/busyloop/lolcat/archive/master.zip
    # unzip master.zip
    # cd lolcat-master/bin
    # gem install lolcat

一旦 lolcat 安装后，你可以检查它的版本号。

    # lolcat --version
    
    lolcat 42.0.99 (c)2011 moe@busyloop.net

### Lolcat 的用法 ###

**3. 在开始使用 lolcat 之前，使用下面的命令来了解它可用的选项和其帮助文档。**

    # lolcat -h

![Lolcat 的帮助文档](http://www.tecmint.com/wp-content/uploads/2015/06/Lolcat-Help1.png)

*Lolcat 的帮助文档*

**4. 接着, 通过管道连接 lolcat 和其他命令，例如 ps, date 和 cal:**

    # ps | lolcat
    # date | lolcat
    # cal | lolcat

![ps 命令的输出](http://www.tecmint.com/wp-content/uploads/2015/06/ps-command-output.png)

*ps 命令的输出*

![Date 的输出](http://www.tecmint.com/wp-content/uploads/2015/06/Date.png)

*Date 的输出*

![Calendar 的输出](http://www.tecmint.com/wp-content/uploads/2015/06/Cal.png)

*Calendar 的输出*

**5. 使用 lolcat 来展示一个脚本文件的代码:**

    # lolcat test.sh

![用 lolcat 来展示代码](http://www.tecmint.com/wp-content/uploads/2015/06/Script-Output.png)

*用 lolcat 来展示代码*

**6. 通过管道连接 lolcat 和 figlet 命令。Figlet 是一个展示由常规的屏幕字符组成的巨大字符串的应用。我们可以通过管道将 figlet 的输出连接到 lolcat 中来展示出如下的多彩输出:**

    # echo I ❤ Tecmint | lolcat
    # figlet I Love Tecmint | lolcat

![多彩的文字](http://www.tecmint.com/wp-content/uploads/2015/06/Colorful-Text.png)

*多彩的文字*

**注**: 注意， ❤ 是一个 unicode 字符。要安装 figlet，你需要像下面那样使用 yum 和 apt 来得到这个软件包:

    # apt-get figlet 
    # yum install figlet 
    # dnf install figlet

**7. 给文本赋予彩虹颜色的动画:**

    $ echo I ❤ Tecmit | lolcat -a -d 500

![动的文本](http://www.tecmint.com/wp-content/uploads/2015/06/Animated-Text.gif)

*动的文本*

这里选项 `-a` 指的是 Animation(动画)， `-d` 指的是 duration(持续时间)。在上面的例子中，持续 500 次动画。

**8. 在彩虹般的颜色下阅读 man 页(例如 `man ls`):**

    # man ls | lolcat

![多彩地显示文件](http://www.tecmint.com/wp-content/uploads/2015/06/List-Files-Colorfully.png)

*多彩地显示文件*

**9. 通过管道连接 lolcat 和 cowsay。cowsay 是一个可配置的正在思考或说话的奶牛，这个程序也支持其他的动物。**

使用下面的命令来安装 cowsay :

    # apt-get cowsay
    # yum install cowsay
    # dnf install cowsay

安装后，使用下面的命令来显示在 cowsay 中的所有动物：

    # cowsay -l

**样例输出**

    Cow files in /usr/share/cowsay/cows:
    apt beavis.zen bong bud-frogs bunny calvin cheese cock cower daemon default
    dragon dragon-and-cow duck elephant elephant-in-snake eyes flaming-sheep
    ghostbusters gnu head-in hellokitty kiss kitty koala kosh luke-koala
    mech-and-cow meow milk moofasa moose mutilated pony pony-smaller ren sheep
    skeleton snowman sodomized-sheep stegosaurus stimpy suse three-eyes turkey
    turtle tux unipony unipony-smaller vader vader-koala www

通过管道连接 lolcat 和 cowsay 后的输出，并且使用了‘gnu’形象的 cowfile。

    # cowsay -f gnu ☛ Tecmint ☚ is the best Linux Resource Available online | lolcat

![使用 Lolcat 的 Cowsay](http://www.tecmint.com/wp-content/uploads/2015/06/Cowsay-with-Lolcat.png)

*使用 Lolcat 的 Cowsay*

**注**: 你可以在将 lolcat 和其他任何命令用管道连接起来在终端中得到彩色的输出。

**10. 你可以为最常用的命令创建别名来使得命令的输出呈现出彩虹般的色彩。你可以像下面那样为 ‘ls -l‘ 命令创建别名，这个命令输出一个目录中包含内容的列表。**

    # alias lolls="ls -l | lolcat"
    # lolls

![多彩的 Alias 命令](http://www.tecmint.com/wp-content/uploads/2015/06/Alias-Commands-with-Colorful.png)

*多彩的 Alias 命令*

你可以像上面建议的那样，为任何命令创建别名。为了使得别名永久生效，你需要添加相关的代码(上面的代码是 ls -l 的别名) 到 ~/.bashrc 文件中，并登出后再重新登录来使得更改生效。

现在就是这些了。我想知道你是否曾经注意过 lolcat 这个工具？你是否喜欢这篇文章？欢迎在下面的评论环节中给出你的建议和反馈。喜欢并分享我们，帮助我们传播。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/lolcat-command-to-output-rainbow-of-colors-in-linux-terminal/

作者：[Avishek Kumar][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:https://linux.cn/article-2831-1.html
[2]:https://linux.cn/article-4128-1.html
[3]:https://linux.cn/article-4088-1.html
[4]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/