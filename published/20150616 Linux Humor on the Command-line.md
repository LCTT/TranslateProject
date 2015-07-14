Linux命令行中的幽默
================================================================================
图形桌面总是很养眼的，它增强了可视化体验，有时也能够提升了某些软件的功能，让软件变得更有趣。但是，在命令行下工作也不需要总是很古板，如果您想在命令行下寻找些乐趣，那么有很多命令给您带来趣味。

Linux是个有趣的操作系统。它提供大量的小型开源工具，从平淡无奇的软件到稀奇古怪的应用。正是这些工具的功能和琳琅满目的选择帮助Linux脱颖而出。让我们一起来看看下面这七个小工具吧。

### 七彩虹：lolcat ###

![lolcat](http://www.linuxlinks.com/portal/content/reviews/Misc/Screenshot-lolcat.png)

lolcat是一个用于将文件或标准输入连接到标准输出（类似常见的cat）的程序，但是它会为输出添加七彩的颜色。

lolcat通常和其他诸如toilet或figlet等生成文本的应用结合使用。这个软件不应被误认为是一个或多个猫的图像的宏。

lolcat由Moe编写。

网址: [github.com][1]

### 牛郎的牛：cowsay ###

![cowsay](http://www.linuxlinks.com/portal/content/reviews/Misc/Screenshot-cowsay.png)

cowsay是一个可配置的开源软件，它用ASCII码生成奶牛的图片，并可以在对话气泡中显示消息。cowsay是用Perl写的。

cowsay并不仅仅只能显示奶牛。它能生成预先制作的图片或者其他动物，包括鸭子、考拉、麋鹿、小马、绵羊、剑龙和火鸡，以及奶酪、雪人和骷髅。

有一个叫cowthink的应用，与对话的气泡不同，它能在生成奶牛的同时生成思考的气泡。

功能包括：

- 让脚本变得更有趣
- Borg模式
- 可以更改奶牛看起来的样子，比如让奶牛看起来贪婪、偏执、固执、疲倦、古怪、年轻等
- 图形版变体：xcowsay

网址: [nog.net][2]

### 傻狗：doge ###

![doge](http://www.linuxlinks.com/portal/content/reviews/Misc/Screenshot-doge.png)

doge是一个简单的每日信息脚本，它基于有些愚蠢但很有趣的doge的梗。它随机的打印一些在语法上有误的句子，有时这些句子基于您电脑中的东西。

doge是一个在2013年非常流行的互联网潮流元素（梗）。这个梗通常由一幅日本柴犬的图片和彩色的文字组成。这些文字故意用一种蹩脚的语气写成了一些互联网的独白。

- 随机的用不同的颜色和蹩脚的英语写下随机的句子
- 终端中的柴犬效果非常棒
- 可以获得系统数据，比如主机名、运行中的程序、当前用户、$EDITOR
- 如果您安装了lolcat，您可以用它作为点缀: `while true; do doge | lolcat -a -d 100 -s 100 -p 1; done`
- 支持标准输入: `ls /usr/bin | doge` 将显示一些 /usr/bin下的可执行文件。哇噢，还有许多命令行的开关可以过滤词语以及控制词语的频率。

网址: [github.com/thiderman/doge][3]

### 水族箱：ASCIIQuarium ###

![Asciiquarium](http://www.linuxlinks.com/portal/content/reviews/Misc/Screenshot-Asciiquarium.png)

ASCIIQuarium是一个以ASCII码方式画出的水族馆/海洋动画。享受生活在您电脑中水底的奇妙生物吧。

想运行ASCIIQuarium，您需要安装Perl的curses包以及Term::Animation模块。请使用`sudo apt-get install libcurses-perl`来安装前者，使用sudo cpan Term::Animation来安装后者。两个命令都需要在终端中运行。

功能包括：

- 五彩的鱼儿
- 有趣的动画，包括钓鱼钩
- 还有许多的天鹅、鸭子、海豚和船只

网址: [www.robobunny.com][4]

### 蒸汽机车：sl ###

![sl](http://www.linuxlinks.com/portal/content/reviews/Misc/Screenshot-sl.png)

sl是一个有趣的终端应用，它为那些意外的错将ls输成sl的用户显示一个动画。

我打字通常非常草率，更喜欢速度而不是准确性。但错别字在命令行中是非常危险的。因此sl扮演了一个提醒者，提醒我们注意错误输入的这种坏习惯。它总是会让人咯咯的笑。

功能包括：

- 使用 -F, 火车在飞翔
- 使用 -l, 显示一个小型的火车
- 使用 -a, 看上去发生了意外

网址: [github.com/mtoyoda/sl][5]

### 火焰：aafire ###

![aafire](http://www.linuxlinks.com/portal/content/reviews/Misc/Screenshot-aafire.png)

aafire在终端中显示燃烧的ASCII火焰。它展示了aalib库的强大能力，一个ascii艺术库显示出来。

网址: [aa-project.sourceforge.net/aalib][6]

### 矩阵：CMatrix ###

![CMatrix](http://www.linuxlinks.com/portal/content/reviews/Misc/Screenshot-CMatrix.png)

CMatrix是一个基于ncurses的程序，它模拟《黑客帝国》（一部电影）中的画面。如果您在一个山洞里度过了上个15年，那么您可能不知道这部1999年的美国科幻电影，主角为 Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss, Hugo Weaving和 Joe Pantoliano。

它可以在终端设置为132x300的情况下工作，并且可以以同样的速率进行滚动或者以用户定义的速度进行异步的滚动。

功能包括：

- 修改文本颜色
- 使用粗体字符
- 异步滚动
- 使用老式的滚动效果
- 屏幕保护程序模式

网址: [www.asty.org/cmatrix][7]

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20150614112018846/Humor.html

译者：[wwy-hust](https://github.com/wwy-hust)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://github.com/busyloop/lolcat
[2]:https://web.archive.org/web/20120225123719/http://www.nog.net/%7Etony/warez/cowsay.shtml
[3]:https://github.com/thiderman/doge
[4]:http://www.robobunny.com/projects/asciiquarium/html/
[5]:https://github.com/mtoyoda/sl
[6]:http://aa-project.sourceforge.net/aalib/
[7]:http://www.asty.org/cmatrix/
