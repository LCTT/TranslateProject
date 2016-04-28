Debian Live项目的剧变

围绕Ｄebian Live 项目发生了很多戏剧性事件,但是有一个关于Debian Live项目］［１］结束的［公告］［２］，它比项目第一次出现的时候影响力还小。这个项目的创始人退出必定是有原因的，社区对他的待遇和项目的收效是很令人沮丧的,但是这个项目还是会以其他的形式继续下去。所以Ｄebian仍然会有很多的工具去在创造启动光盘和其他介质的道路上继续向前。项目创始人Ｄabiel Baumann和Ｄebian CD团队以及安装检测团队之间出现的长期争论已经被＂解决＂了，尽管是用这样一种有遗憾的方式。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　

在１１月９日，Ｂaumann发表了题为＂Dabian Live项目的突然结束＂的一篇公告。在那篇短文中，他一一列举出了自从这个和他有关的［项目被发起］［３］以来１０间发生的不同的事件，可以表明他在Debian Live项目上的努力一直没有被重视，至少从这些方面。最具决定性的因素是因为在＂包的含义＂上存在冲突，Ｒ.Learmonth［申请］［４］了新的包名，而这却侵犯了在Ｄebian Live上使用的命名空间。

考虑到最主要的Ｄebian Live包之一被命名为＂live-build＂，而新的包名却叫＂live-build-ng＂,这简直是对＂live-build＂的挑战。live-build-ng意为一种围绕［vmdebootstrap］［５］【译者注：创造真实的和虚拟机Debian的磁盘映像】工具的外部包装，这种包装是为了创造live介质（光盘和USB的插入），也是Debian Live最需要的的部分。但是当 Baumann Learmonth［要求］［６］为他的包换一个不同的名字的时候，他得到了一个“有趣”的［回复］［７］：
        
```

live-build不是一个Debian项目，这件事应该受到我们的关注，它是一个外部的项目。但是社区要求它成为一个官方的Debian项目，这件事需要我们敲定。
这不是命名空间的问题，我们要将以目前维护的live配置和live启动包为基础，把它加入到Debian的本地项目。如果迫不得已的话，这将会有很多分支，但是我希望它不要发生，这样的话我们就可以把这些包整合到Debian中继续以一种协作的方式去开发。
live-build已经被debian-cd放弃，live-build-ng将会取代它。至少在一个精简的Debian环境中，live-build会被放弃。live-build-ng将要通过debian-cd和Debian安装者合作的方式去开发。
```



Debian　Live 是一个“官方的”Debian项目（或者可以狭义的＂官方＂），尽管它因为思路上的不同产生过争论．除此之外，vmdebootstrap的维护者Neil Willians为脱离Debian Live项目［提供了如下的解释］［８］:

```

为了更好的支持live-build的代替者,vmdebootstrap肯定会被推广。这项工作会由debian-cd团队来负责，debian-cd能够用live-build解决目前存在的问题。 这些问题包括可靠性问题，以及不能很好的支持多种机器和UEFI等。 vmdebootstrap也存在着这些问题，我们用来自于对live-boot和live-config的支持情况来确定vmdebootstrap的功能。
```



这些想要取代＂live-build＂的说辞看起来有道理，但是目前的项目存在的上述问题已经得到了初步解决。相反的，一些秘密的项目很明显的意图是取代live-build。正如Baumann［指出］［９］的，这些计划没有被加入到debian-live的邮件列表中。人们可以从Ｄebian Live项目中得到这些计划的信息也是因为这一次的ITP事件。所以它看起来像是一个＂秘密计划"—有些东西在一个像Debian这样的项目中不能很好的安排。

人们可能已经猜到了，有很多帖子都支持Baumann［重命名］［１０］＂live-build-ng＂的请求，但是紧跟着，人们就因为他要停止在Ｄｅbian Live 上继续工作的决定而变得沮丧。但是Learmonth 和 Williams却坚定不移，他们两人都是取代live-build所需要的开发者。Learmonth 给“live-build-ng”换了一个新的有很少争议性的名字：Live-wrapper。他说他的目标是为Debian Live项目加入新的工具（并且“把Debian Live 项目引入Debian里面），但是完成这件事还需要很大的努力。


```

我向已经被ITP问题所困扰的每个人道歉。作为live-build的取代者,live-wrapper这个软件的稳定性还很差，为了让人们知道工作的进展同时收集反馈，它已经被存档。虽然有了这部分的工作，但是收到的反馈并不是我所需要的。
```

这种对于取代live-build的强烈的反对或许已经被预知到了。自由软件社区的沟通和交流很关键，所以，替换一个项目核心的计划是很有争议的——更何况这个计划一直不被人们所知。从Banumann的角度来说，他当然不是完美的，他通过上传和下载一个不合适的［syslinux包］［１１］来延迟“wheezy”的发布，并且从那以后他从一个Debian发起人［成为］［１２］了一个Debian维护者。——但是他也不应该受到这种对待。当然，这个项目还有其他人参与，所以不仅仅是Baumann受到了影响。

Ben Armstrong是这些人中的其中之一，在这个事件中，他很圆滑地处理了一些事，并且想从这个事件中全身而退。他从一个邮件［１３］开始，这个邮件是为了庆祝这个项目以及他和他的团队在过去几年完成的一些工作。正如他所说，这种基于Debian Live的［下流项目列表］［１４］是很令人振奋的。在另一个邮件中，他也［指出］［１５］了这个项目不是没有生命力的：


```

如果Debian CD开发团队通过他们的努力获得成功，这样产品的替换就会是可行的、可靠的、利于测试的，同时有一个合适的候选者去取代live-build，这对于Debian项目有利无害。如果他们继续做这件事，他们不会“用一个官方改良的，不可靠的，几乎没有测试的待选者取代live-build”。到目前为止，我还没有看到他们那样做。其间，live-build仍在存档,没有很快删除,它仍然处于良好状态,并没有一种改进的继任者来取代它。
```


11月24号，Armstrong也在［他的博客］［１６］上［发布］［１７］了一个有关Debian Live的新消息。它展示了自从 Baumann退出后两周内的让人高兴的进展。可以说是在这个项目和live-wrapper开发者之间产生合作的里程碑。博客上也有了一个［计划表］［１８］，同时不可避免地寻求更多的帮助。他也列举了一些理由，试图让人们相信围绕项目发生的戏剧性事件仅仅是一个可以避免的小问题，而不是像现在这样。






---------------------------------

via: https://lwn.net/Articles/665839/

作者：Jake Edge
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出


[1]: https://lwn.net/Articles/666127/
[2]: http://live.debian.net/
[3]: https://www.debian.org/News/weekly/2006/08/
[4]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=804315
[5]: http://liw.fi/vmdebootstrap/
[6]: https://lwn.net/Articles/666173/
[7]: https://lwn.net/Articles/666176/
[8]: https://lwn.net/Articles/666181/
[9]: https://lwn.net/Articles/666208/
[10]: https://lwn.net/Articles/666321/
[11]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=699808
[12]: https://nm.debian.org/public/process/14450
[13]: https://lwn.net/Articles/666336/
[14]: http://live.debian.net/project/downstream/
[15]: https://lwn.net/Articles/666338/
[16]: https://lwn.net/Articles/666340/
[17]: http://syn.theti.ca/2015/11/24/debian-live-after-debian-live/
[18]: https://wiki.debian.org/DebianLive/TODO
