11个无用而有趣的Linux终端彩蛋
================================================================================
这里有一些很酷的Linux终端彩蛋，其中的每一个看上去并没有实际用途，但很有趣。

![](http://images.techhive.com/images/article/2015/05/slide_01-100587352-orig.png)

### 只工作不玩耍…… ###

当我们使用命令行工作时，Linux是功能和实用性最好的操作系统之一。想要执行一个特殊任务？可能一个程序或者脚本就可以帮你搞定。但就像一本书中说到的，只工作不玩耍聪明的孩子也会变傻。下边是我最喜欢的可以在终端做的没有实际用途的、傻傻的、恼人的、可笑的事情。

### 让终端成为一个有态度的人 ###

* 第一步）敲入`sudo visudo`
* 第二步）在“Defaults”末尾（文件的前半部分）添加一行“Defaults insults”。
* 第三步）保存文件。

“我刚才对电脑做了什么？”你可能这样问自己。一定是美妙的事情吧。现在，在sudo命令提示提示下输出错误的口令，你的电脑就会呼唤你的名字。我最喜欢的一句：“听好了，煎饼一样的脑子，我没有时间听你胡说八道了。”

![](http://images.techhive.com/images/article/2015/05/slide_02-100587353-orig.png)

### apt-get moo ###

![](http://images.techhive.com/images/article/2015/05/slide_03-100587354-orig.png)

你看过这张截图？那就是运行`apt-get moo`（在基于Debian的系统）的结果。对，就是它了。不要对它抱太多幻想，你会失望的，我不骗你。但是这是Linux世界最被人熟知的彩蛋之一。所以我把它包含进来，并且放在前排，然后我也就不会收到5千封邮件，指责我把它遗漏了。

### aptitude moo ###

更有趣的是将moo应用到aptitude上。敲入`aptitude moo`（在Ubuntu及其衍生版），你对`moo`可以做什么事情的看法会有所变化。你还还会知道更多事情，尝试重新输入这条命令，但这次添加一个`-v`参数。这还没有结束，试着添加更多`v`，一次添加一个，直到抓狂的aptitude给了你想要的东西。

![](http://images.techhive.com/images/article/2015/05/slide_04-100587355-orig.png)

### Arch: 将吃豆人放入pacman ###

这里有一个只为Arch爱好者准备的彩蛋。Pacman包管理工具已经很棒了，但我们可以让它变得更棒。

* 第一步）打开“/etc/pacman.conf”文件。
* 第二步）在“# Misc options”部分，去掉“Color”前的“#”。
* 第三步）添加“ILoveCandy”。

现在我们使用pacman安装新软件包时，进度条里会出现一个小吃豆人。真应该默认就这样的。

![](http://images.techhive.com/images/article/2015/05/slide_05-100587356-orig.png)

### Cowsay! ###

`aptitude moo`的输出格式很漂亮，但我想你苦于不能自由自在地使用。输入`cowsay`，它会做到你想做的事情。你可以让牛说任何你喜欢的东西。而且不只可以用牛，还可以用Calvin、Beavis和Ghostbusters logo的ASCII的艺术，输入`cowsay -l`可以得到所有可用的参数。它是Linux世界的强大工具。像很多其他命令一样，你可以使用管道把其他程序的输出输送给它，比如`fortune | cowsay`，让这头牛变成哲学家。

![](http://images.techhive.com/images/article/2015/05/slide_06-100587358-orig.png)

### 变成3l33t h@x0r ###

`nmap`并不是我们平时经常使用的基本命令。但如果你想蹂躏`nmap`的话，比如像人一样看起来像l33t。在任何`nmap`命令后添加`-oS`（比如`nmap -oS - google.com`）。现在你的`nmap`已经处于标准叫法是“[脚本玩具模式][1]”的模式了。Angelina Jolie和Keanu Reeves会为此骄傲的。

![](http://images.techhive.com/images/article/2015/05/slide_07-100587359-orig.png)

### 获得所有的Discordian日期 ###

如果你们曾经坐在一起思考，“嗨！我想使用无用但异想天开的方式来书写今天的日期……”试试运行`ddate`。结果类似于“Today is Setting Orange, the 72nd day of Discord in the YOLD 3181”，这会让你的服务树日志平添不少趣味。

注意：在技术层面，确实有一个[Discordian Calendar][2]，理论上被[Discordianism][3]追随者所使用。这意味着我可能得罪某些人。或者不会，我不确定。不管怎样，`ddate`是一个方便的工具。

![](http://images.techhive.com/images/article/2015/05/slide_08-100587360-orig.png)

### 我可以在任何地方看到颜色！###

厌倦了老旧的文本？想向世界展示出自己的个性？使用`lolcat`。安装它，然后在任何地方使用。它可以接收任何文本，然后将其转换成美轮美奂的彩虹效果。可以使用`fortune | lolcat`体验。

![](http://images.techhive.com/images/article/2015/05/slide_09-100587361-orig.png)

### 蒸汽机车 ###

在你的终端显示蒸汽机车的ASCII图形。如果你需要它，安装并运行`sl`命令。`sl -l`可以看到一个袖珍版本的。或者，如果你真想在上边花费更多时间，运行`sl -h`。这会显示一个完整的或者，还包括乘客车厢。

![](http://images.techhive.com/images/article/2015/05/slide_10-100587362-orig.png)

### 将任何文本逆序输出 ###

将任何文本使用管道输送给`rev`命令，它就会将文本内容逆序输出。`fortune | rev`会给你好运。当然，这不意味着rev会将幸运（fortune）转换成不幸。

![](http://images.techhive.com/images/article/2015/05/slide_11-100587364-orig.png)

### Matrix依然很酷，不是吗？ ###

想让你的终端显示滚动的文字、l33t和Matrix电影中的坠落数码？`cmatrix`是你的朋友。你甚至可以用它输出不同的颜色，非常华丽。使用`man cmatrix`学习使用方法。或者使用更好的方法，“man cmatrix | lolcat”。这确实是你在Linux终端可以做的最没实际用途却又精彩的事情了。

![](http://images.techhive.com/images/article/2015/05/slide_12-100587366-orig.png)

以上就是全部内容了。

--------------------------------------------------------------------------------

via: http://www.networkworld.com/article/2926630/linux/11-pointless-but-awesome-linux-terminal-tricks.html

作者：[Bryan Lunduke][a]
译者：[goreliu](https://github.com/goreliu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.networkworld.com/author/Bryan-Lunduke/
[1]:http://nmap.org/book/output-formats-script-kiddie.html
[2]:http://en.wikipedia.org/wiki/Discordian_calendar
[3]:http://en.wikipedia.org/wiki/Discordianism