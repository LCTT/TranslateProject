Arch Linux：DIY 用户的终极圣地，纯粹主义者的最后避难所
==============

![Tripple Renault photo by Gilles Paire via
Shutterstock ](https://regmedia.co.uk/2016/10/31/tripple_renault_photo_by_gilles_paire_via_shutterstock.jpg?x=648&y=348&crop=1)

让我们翻过一页页 Linux 的新闻报道，你会发现其中对一些冷门的 Linux 发行版的报道数量却出乎预料的多。像 Elementary OS 和 Solus 这样的新发行版因其华丽的界面而被大家所关注，而搭载 MATE 桌面环境的那些系统则因其简洁性而被广泛报道。

感谢像《黑客军团》这样的电视节目，我完全可以预料到关于 Kali Linux 系统的报道很快就会增加。

尽管有很多关于 Linux 系统的报道，然而有一个被广泛使用的 Linux 发行版几乎被大家完全遗忘了：Arch Linux 系统！

关于 Arch 的新闻报道很少的原因有很多，不仅仅是因为它很难安装，而且你还得能在命令行下娴熟地完成各种配置以使其正常运行。更糟糕的是，以大多数的用户的观点来看，其困难是设计之初就没有考虑过其复杂的安装过程会令无数的菜鸟们望而却步。

这的确很遗憾，在我看来，实际上一旦安装完成后，Arch 比我用过的其它 Linux 发行版易用得多。

确实如此，Arch 的安装过程很让人蛋疼。有些发行版的安装过程只需要点击“安装”后就可以放手地去干其它事了。Arch 相对来说要花费更多的时间和精力去完成手动分区、手动挂载、生成 fstab 文件等。但是从 Arch 的安装过程中，我们学到很多。它掀开帷幕，让我们弄明白很多背后的东西。事实上，这层掩盖底层细节的帷幕已经彻底消失了，在 Arch 的世界里，你就是帷幕背后的主宰。

除了大家所熟知的难于安装外，Arch 甚至没有自己默认的桌面环境，虽然这有些让人难以理解，但是 Arch 也因其可定制化而被广泛推崇。你可以自行决定在 Arch 的基础软件包上安装的任何东西。

![ARCH "DESKTOP" SCREENSHOT LINUX -
OBVS VARIES DEPENDING ON USER ](https://regmedia.co.uk/2016/11/01/arch.jpg?x=648&y=364&infer_y=1
"ARCH "DESKTOP" SCREENSHOT LINUX - OBVS VARIES DEPENDING ON USER
")

虽然你可以视之为无限可定制性，但也可以说它完全没有定制化。比如，不像 Ubuntu 系统那样，Arch 中几乎没有修改过或是定制开发过的软件包。Arch 的开发者从始至终都使用的是上游开发者提供的软件包。对于部分用户来说，这种情况非常棒。比如，你可以使用“纯粹”的 GNOME 桌面环境。但是，在某些情况下，定制的补丁可以解决一些上游开发者没有处理的很多的缺陷。 

由于 Arch 缺乏一些默认的应用程序和桌面系统，以至于很难形成一致的看法——或者根本不会有什么真正的看法，因为我安装的毫无疑问和你安装的不会一样。我可能选择安装最小化安装配置 Openbox、tint2 和 dmenu，你可能却是使用了最新版的 GNOME 桌面系统。我们都在使用 Arch，但我们的体验却是大相径庭。对于任何发行版来说也有这种情况，但是其它大多数的 Linux 系统都至少有个默认的桌面环境。

然而对 Arch 的看法还是由很多共性的元素的。比如说，我使用 Arch 系统的主要原因是因为它是一个滚动更新的发行版。这意味着两件事情。首先，Arch 会尽可能的使用最新的内核，只要它们可用，被认为稳定就行。这就意味着我可以在 Arch 系统里测试一些在其它 Linux 发行版中难于测试的东西。滚动版另外一个最大的好处就是所有软件更新就绪就会被即时发布出来。这不仅意味着软件包更新速度更快，而且意味着不会出现破坏掉系统的大规模更新。

很多用户因为 Arch 是一个滚动发行版认为它不太稳定。但是在我使用了 9 个多月之后，我并不赞同这种观点。

然而，我从未因为一次升级系统而搞坏过任何东西。我确实有过回滚，因为系统启动分区 /boot 没有挂载，但是后来我发现那完全是自己操作上的失误，我更新后而忘记写入改变。一些暴露出来的缺陷（比如我关于戴尔 XPS 笔记本触摸板又出现以前解决过的问题）很快被修复，并且更新速度要比其它非滚动发行版快得多。总的来说，我认为 Arch 滚动更新的发布模式比其它我在用的发行版要稳定得多。唯一一点我要强调的是查阅维基上的资料，多关注你要更新的内容。

我怀疑 Arch 之所以没那么受欢迎，主要原因就是你必须要随时小心你的操作。盲目的更新 Arch 系统是极其危险的。但是任何一个发行版的更新都有风险，你只是认为它没有风险而已——因为你别无选择。

[Arch 的哲学理念][1]是我支持它的另外一个最主要的原因。我认为 Arch 最吸引用户的一点就是：“（Arch）面向的是专业的 Linux 用户，或者是有 DIY 精神，愿意查资料并解决问题的人”。

随着 Linux 进一步纳入主流，开发者们更需要顺利地渡过每一个艰难的技术领域。那些晦涩难懂的专有软件方面的经验恰恰能反映出用户高深的技术能力。

尽管在这个时代听起来有些怪怪的，但是事实上我们很多人更愿意自己动手装配一些东西。在这种情形下，Arch 将会是Linux DIY 用户的终极圣地。 

--------------------------------------------------------------------------------
via: http://www.theregister.co.uk/2016/11/02/arch_linux_taster/

作者：[Scott Gilbertson][a]
译者：[rusking](https://github.com/rusking)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.theregister.co.uk/Author/1785
[1]:https://wiki.archlinux.org/index.php/Arch_Linux
[2]:http://www.theregister.co.uk/Author/1785
[3]:https://www.linkedin.com/shareArticle?mini=true&url=http://www.theregister.co.uk/2016/11/02/arch_linux_taster/&title=Arch%20Linux%3A%20In%20a%20world%20of%20polish%2C%20DIY%20never%20felt%20so%20good&summary=Last%20refuge%20for%20purists
[4]:http://twitter.com/share?text=Arch%20Linux%3A%20In%20a%20world%20of%20polish%2C%20DIY%20never%20felt%20so%20good&url=http://www.theregister.co.uk/2016/11/02/arch_linux_taster/&via=theregister
[5]:http://www.reddit.com/submit?url=http://www.theregister.co.uk/2016/11/02/arch_linux_taster/&title=Arch%20Linux%3A%20In%20a%20world%20of%20polish%2C%20DIY%20never%20felt%20so%20good
