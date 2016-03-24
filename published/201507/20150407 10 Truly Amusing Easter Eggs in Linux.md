十个非常有趣的 Linux 彩蛋
================================================================================

*制作 Adventure 的程序员悄悄的把一个秘密的功能塞进了游戏里。Atari 并没有对此感到生气，而是给这类“秘密功能”起了个名字——“彩蛋”，因为——你懂的——你会像找复活节彩蛋一样寻找它们。*

![](http://en.wikipedia.org/wiki/File:Adventure_Easteregg.PNG)

*图片来自： Wikipedia*

在1979年的时候，公司为 Atari 2600 开发了一个电子游戏——[Adventure][1]。

制作 Adventure 的程序员悄悄的把这样的一个功能放进了游戏里，当用户把一个“隐形方块”移动到特定的一面墙上时，会让用户进入一个“密室”。那个房间里只有一句话：“Created by [Warren Robinett][2]”——意思是，由 [Warren Robinett][2] 创建。

Atari 有一项反对作者将自己的名字放进他们的游戏里的政策，所以这个无畏的程序员只能偷偷的把自己的名字放进游戏里。Atari 在 Warren Robinett 离开公司之后才发现这个“密室”。Atari 并没有对此感到生气，而是给这类“秘密功能”起了个名字——“彩蛋”，因为——你懂的——你会寻找它们。Atari 还宣布将在之后的游戏中加入更多的“彩蛋”。

这种软件里的“隐藏功能”并不是第一次出现（这类特性的首次出现是在1966年[PDP-10][3]的操作系统上），但这是它第一次有了名字，同时也是第一次真正的被众多电脑用户和游戏玩家所注意。

Linux（以及和Linux相关的软件）也没有被遗忘。这些年来，人们为这个倍受喜爱的操作系统创作了很多非常有趣的彩蛋。下面将介绍我个人最喜爱的彩蛋——以及如何找到它们。

你很快就会想到这些彩蛋大多需要通过终端才能体验到。这是故意的。因为终端比较酷。【我应该借此机机会提醒你一下，如果你想运行我所列出的应用，然而你却还没有安装它们，你是绝对无法运行成功的。你应该先安装好它们的。因为……毕竟只是计算机。】

### Arch : 包管理器（pacman）里的吃豆人（Pac-Man） ###

为了广大的 [Arch Linux][4] 粉丝，我们将以此开篇。你们可以将“[pacman][6]” (Arch 的包管理器)的进度条变成吃豆人吃豆的样子。别问我为什么这不是默认设置。

你需要在你最喜欢的文本编辑器里编辑“/etc/pacman.conf”文件。在“# Misc options”区下面，删除“Color”前的“#”，添加一行“ILoveCandy”。因为吃豆人喜欢糖豆。

没错，这样就行了！下次你在终端里运行pacman管理器时，你就会让这个黄颜色的小家伙吃到些午餐（至少能吃些糖豆）。

### GNU Emacs : 俄罗斯方块（Tetris）以及…… ###

![emacs Tetris](http://www.linux.com/images/stories/41373/emacsTetris.jpg)

*我不喜欢 emacs。一点也不喜欢。但是它确实能玩俄罗斯方块。*

我要坦白一件事：我不喜欢[emacs][7]。一点也不喜欢。

有些东西让我满心欢喜。有些东西能带走我所有伤痛。有些东西能解决我的烦恼。这些[绝对跟 emacs 无关][8]。

但是它确实能玩俄罗斯方块。这可不是件小事。方法如下：

第一步）打开 emacs。（有疑问？输入“emacs”。）

第二步）按下键盘上的Esc和X键。

第三步）输入“tetris”然后按下“Enter”。

玩腻了俄罗斯方块？试试“pong”、“snake”还有其他一堆小游戏（或奇怪的东西）。在“/usr/share/emacs/*/lisp/play”文件中可以看见完整的清单。

### 动物说话了 ###

让动物在终端里说话在 Linux 世界里有着悠久而辉煌的历史。下面这些真的是最应该知道的。

在用基于 Debian 的发行版？试试输入“apt-get moo"。

![apt-get moo](http://www.linux.com/images/stories/41373/AptGetMoo.jpg)

*apt-get moo*

简单？的确。但这是只会说话的牛，所以惹我们喜欢。再试试“aptitude moo”。他会告诉你“There are no Easter Eggs in this program（这个程序里没有彩蛋）”。

关于 [aptitude][9] 有一件事你一定要知道，它是个肮脏、下流的骗子。如果 aptitude 是匹诺曹，那它的鼻子能刺穿月球。在这条命令中添加“-v”选项。不停的添加 v，直到它被逼得投降。

![](http://www.linux.com/images/stories/41373/AptitudeMoo.jpg)

*我猜大家都同意，这是 aptitude 中最重要的功能。*

我猜大家都同意，这是 aptitude 中最重要的功能。但是万一你想把自己的话让一头牛说出来怎么办？这时我们就需要“cowsay”了。

还有，别让“cowsay（牛说）”这个名字把你给骗了。你可以让你的话从各种东西的嘴里说出来。比如一头大象，Calvin，Beavis 甚至可以是 Ghostbusters（捉鬼敢死队）的标志。只需在终端输入“cowsay -l”就能看到所有选项的列表。

![](http://www.linux.com/images/stories/41373/cowsay.jpg)

*你可以让你的话从各种东西的嘴里说出来*

想玩高端点的？你可以用管道把其他应用的输出放到 cowsay 中。试试“fortune | cowsay”。非常有趣。

### Sudo 请无情的侮辱我 ###

当你做错事时希望你的电脑骂你的人请举手。反正，我这样想过。试试这个：

输入“sudo visudo”以打开“sudoers”文件。在文件的开头你很可能会看见几行以“Defaults”开头的文字。在那几行后面添加“Defaults insults”并保存文件。

现在，只要你输错了你的 sudo 密码，你的系统就会骂你。这些可以提高自信的语句包括“听着，煎饼脑袋，我可没时间听这些垃圾。”，“你吃错药了吧？”以及“你被电过以后大脑就跟以前不太一样了是不是？”

把这个设在同事的电脑上会有非常有趣。

### Firefox 是个厚脸皮 ###

这一个不需要终端！太棒了！

打开火狐浏览器。在地址栏填上“about:about”。你将得到火狐浏览器中所有的“about”页。一点也不炫酷，是不是？

现在试试“about:mozilla”，浏览器就会回应你一条从“[Book of Mozilla（Mozilla 之书）][10]”——这本浏览网页的圣经——里引用的话。我的另一个最爱是“about:robots”，这个也很有趣。

![](http://www.linux.com/images/stories/41373/About-Mozilla550.jpg)

*“[Book of Mozilla（Mozilla 之书）][10]”——浏览网页的圣经。*

### 精心调制的混搭日历 ###

是否厌倦了千百年不变的 [Gregorian Calendar（罗马教历）][11]？准备好乱入了吗？试试输入“ddate”。这样会把当前日历以[Discordian Calendar（不和教历）][12]的方式显示出来。你会遇见这样的语句：

“今天是Sweetmorn（甜美的清晨），3181年Discord（不和）季的第18天。”

我听见你在说什么了，“但这根本不是什么彩蛋！”嘘~，闭嘴。只要我想，我就可以把它叫做彩蛋。

### 快速进入黑客行话模式 ###

想不想尝试一下电影里超级黑客的感觉？试试（通过添加“-oS”）把扫描器设置成“[Script Kiddie][13]”模式。然后所有的输出都会变成最3l33t的[黑客范][14]。

例如: “nmap -oS - google.com”

赶快试试。我知道你有多想这么做。你一定会让安吉丽娜·朱莉（Angelina Jolie）[印象深刻][15]

### lolcat彩虹  ###

在你的Linux终端里有很多彩蛋真真是极好的……但是如果你还想要变得……更有魅力些怎么办？输入：lolcat。把任何一个程序的文本输出通过管道输入到lolcat里。你会得到它的超级无敌彩虹版。

![](http://www.linux.com/images/stories/41373/lolcat.jpg)

*把任何一个程序的文本输出通过管道输入到lolcat里。你会得到它的超级无敌彩虹版。*

### 追光标的小家伙 ###

![oneko cat](http://www.linux.com/images/stories/41373/onekocat.jpg)

*“Oneko” -- 经典 “Neko”的Linux移植版本。*

接下来是“Oneko” -- 经典 “[Neko][16]”的Linux移植版本。基本上就是个满屏幕追着你的光标跑的小猫。

虽然严格来它并不算是“彩蛋”，它还是很有趣的。而且感觉上也是很彩蛋的。

你还可以用不同的选项（比如“oneko -dog”）把小猫替代成小狗，或是调成其他样式。用这个对付讨厌的同事有着无限的可能。

就是这些了！一个我最喜欢的Linux彩蛋（或是类似东西）的清单。请尽情的的在下面的评论区留下你的最爱。因为这是互联网。你就能做这些事。

--------------------------------------------------------------------------------

via: http://www.linux.com/news/software/applications/820944-10-truly-amusing-linux-easter-eggs-

作者：[Bryan Lunduke][a]
译者：[H-mudcup](https://github.com/H-mudcup)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linux.com/community/forums/person/56734
[1]:http://en.wikipedia.org/wiki/Adventure_(Atari_2600)
[2]:http://en.wikipedia.org/wiki/Warren_Robinett
[3]:http://en.wikipedia.org/wiki/PDP-10
[4]:http://en.wikipedia.org/wiki/Arch_Linux
[5]:http://en.wikipedia.org/wiki/Pac-Man
[6]:http://www.linux.com/news/software/applications/820944-10-truly-amusing-linux-easter-eggs-#Pacman
[7]:http://en.wikipedia.org/wiki/GNU_Emacs
[8]:https://www.youtube.com/watch?v=AQ4NAZPi2js
[9]:https://wiki.debian.org/Aptitude
[10]:http://en.wikipedia.org/wiki/The_Book_of_Mozilla
[11]:http://en.wikipedia.org/wiki/Gregorian_calendar
[12]:http://en.wikipedia.org/wiki/Discordian_calendar
[13]:http://nmap.org/book/output-formats-script-kiddie.html
[14]:http://nmap.org/book/output-formats-script-kiddie.html
[15]:https://www.youtube.com/watch?v=Ql1uLyuWra8
[16]:http://en.wikipedia.org/wiki/Neko_%28computer_program%29
