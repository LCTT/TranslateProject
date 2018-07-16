Linux大神们的顶级命令行秘诀
================================================================================
![](http://www.linuxinsider.com/images/rw509807/command-line.jpg)

**好吧**，Linux博客圈这里这周相对比较平静，给网民们一个拖了很久的机会集体喘口气吧，去享受一下龙舌兰、燕尾服、鸡尾酒带来的欢快吧，然后评估一下过去几周来发生的和自由开放软件相关的事件吧。

“你是否曾经在听一张专辑的时候想过‘伙计，这听起来不错，但是我希望它能经常从用户空间过渡到内核空间去！’”粉丝们在Facebook上写道，“我们会全力支持你的。我们的专辑现在完全可以作为一个可加载的Linux内核模块来播放。”

Linux女孩曾经认为她自己已经完全进入Linux世界了，但是她现在却意识到她的想法是错误的。谢谢你们，粉丝们，是你们让生活一直这么有趣！

### ‘命令行秘诀’ ###

![](http://www.linuxinsider.com/images/article_images/linuxgirl_bg_pinkswirl_150x245.jpg)

说到有趣，没什么比围坐在吧台前谈论行业内的事情来度过平静的一周更带劲了，而上周搞了一次。Linux博客圈内的生活很惬意。

座谈会内容是《Linux之声》——那本炫目出世的新杂志，读者也许记得它是[去年年底发布的][6]——而谈话的主题恰恰就是[命令行秘诀][7]

Linux女孩太激动了。

###  ‘它打算渲染大多数网页’  ###

“有很多使用命令行的真正的好理由，”《Linux之声》的策划者写道，“它是让你和计算机进行交互的强大而简明的方法“

“然而，我想花点时间来看看它里头一些更为晦涩的用法（有人会说毫无意义，不值得去做了）。“他们补充说。

杂志首先列出的是elinks网页浏览器：“它可能看起来没有它的竞争对手那样光彩照人，但它的目标是能够渲染大多数网页。”他们解释道，“它也有着极客时尚，当你需要快速检查你是否能从只能通过SSH访问的计算机上去访问网页时，它就会派上用场了。“

之后谈到的包含了从维基百科上查阅一些定义等其它一些实用的小建议。

### '对维护很重要'  ###

“命令行的小技巧很有趣，真的很有趣。”比如，Google+博主亚历桑德鲁：埃伯索尔满怀热情地说，“但是他们忘了[cowsay][8]，它可以用来在黑漆漆的终端里博你一笑。“

”命令行对于维护很重要。“他补充说，”大家可以使用bash脚本来自动化，只需按几个快捷键（或者只要一个就行）来完成复杂的任务。”

其它命令行秘诀，埃伯索尔会把它们放进原来的列表的包括sl（蒸汽机车），以及这些[这些奇怪的点子][9]：

    * % cat "food in cans"
    cat: can't open food in cans
    * % nice man woman
    No manual entry for woman.
    * % [Where is Jimmy Hoffa?
    Missing ].
    * % make love
    Make: Don't know how to make love. Stop.
    * % man: why did you get a divorce?
    man:: Too many arguments.

### '最珍贵的精华'  ###

“命令行秘诀？根本没这玩意。”博主[罗伯特：伯格森][10]告诉Linux女孩道，”失望了吧，新手？那就猛敲‘help’吧。还想要点提示？随便‘man’个什么吧。想更多来点不同？敲‘ls /bin /sbin /usr/bin /usr/sbin | less’，随便捡几个宝贝命令出来，整晚地‘man’去吧。我已经干那活超过十年了，到现在还玩得不亦乐乎。”
		
伯格森记不得多久以前他发现了‘ssh’，但是“它是自由/开源软件世界中最璀璨的宝石了。“他说。

”ssh的强大力量在于，你可以在一台计算机上输入命令获得快乐，你更可以在100台计算机上干同样的事情来获得100倍的快乐。“他补充道，”当然，要输入100次命令可不是闹着玩的。所以，学习一下通过ssh安全地无密码登陆，可以让ssh的远程登陆透明化。“

### '带着尊重来用吧'  ###

当然，”就像干任何快乐的事一样，有人会沉迷于搞破坏。“伯格森警告道，”作为root用户，你可以输入命令来删除所有的东西，或者把这一切搞乱。“

”这是核弹按钮，就像全球领袖处理世界事务一样，在按下那个键之前一定要三思而后行，评估干这事所产生的结果，带着尊重和高尚的动机来使用它。“他补充道。

”我曾经删除了一个文件系统，因为我的大拇指在输入一个命令时不小心蹭到了空格键。“伯格森总结道，”坦白地说，这种蠢事我只干过一次。“

### '很强大'  ###

Google+博主贡萨洛：贝拉斯科C不那么热情。

“即使[GUI][11]工具更易用，在*nix领域，命令行仍然很强大。“他告诉Linux女孩，”甚至一些高级MacOS用户也用它们。”

对于贡萨洛：贝拉斯科C他自己而言，“我想要掌握的唯一一些命令是进程控制和杀死命令，想要使用ctrl+alt+退格键，因为我可以用来处理给我造成麻烦的那个进程，我还想要掌握tar.gz文件的管理——那玩意到现在还让我头痛。“他说。

#### '你正在做错事' ####

最后一点，但并非不重要，SoylentNews博主hairyfeet有一个完全不同的观点。

“我只想谈一件事情来充实一下命令行界面这个报道：如果你不干IT，而且做着一些重复的事情，而这些事情只是很简单、很原始地去记录一些有用的事情，但你还在用命令行，那么‘你在走一条不归路’“hairyfeet告诉Linux女孩，”命令行界面没什么神奇——它只是1970年代以来的一个图形化界面！“

今天，有很多“有用的图形化界面，这要多亏了CPU速度的提升和内存的增加，而不是一美元店里的廉价手表——我们甚至有IDE和脚本语言，大大超过70年代那些古董，可以在广域网或者局域网上工作，并与操作系统最底层交互，一切都在变得更易用，这多亏了智能感应和自动完成这样的技术。“他解释说，”所以上天作证，如果你不是那3%的系统管理员，工作在以字节计数的世界里，你会把那一堆垃圾从陈年旧帐中翻出来？

这是Hairyfeet的最佳命令行建议？“不要——被21世纪那些不切实际的想法所左右，学学怎样真正来使用语言和工具吧。“他总结道，”让命令行成为泡影，把软盘都扔进历史的垃圾桶吧。“

> 本文作者Katherine Noyes总是尽忠职守扮演好她的Linux女孩，那件斗篷她从2007穿到现在了。作为一个白天举止温和的女记者，她晚上像逛夜店一样，为了搜寻最新的小道消息，在Linux博客圈上灌水。你也能在 [Twitter][12]和[Google+][13]上找到她。

--------------------------------------------------------------------------------

via: http://www.linuxinsider.com/story/80437.html?rss=1

译者：[GOLinux](https://github.com/GOLinux) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.computer.org/portal/web/pressroom/Linus-Torvalds-Named-Recipient-of-the-2014-IEEE-Computer-Society-Computer-Pioneer-Award
[2]:http://www.ieee.org/
[3]:http://www.linuxinsider.com/story/80386.html
[4]:https://www.facebook.com/netcatband/posts/755205877853161?stream_ref=10
[5]:http://www.netcat.co/
[6]:http://www.linuxinsider.com/story/79448.html
[7]:http://www.linuxvoice.com/commandline-secrets/
[8]:http://en.wikipedia.org/wiki/Cowsay
[9]:https://www.linux.com/community/blogs/133-general-linux/10408
[10]:http://mrpogson.com/
[11]:http://en.wikipedia.org/wiki/GUI
[12]:http://twitter.com/noyesk
[13]:https://plus.google.com/+KatherineNoyes?rel=author
