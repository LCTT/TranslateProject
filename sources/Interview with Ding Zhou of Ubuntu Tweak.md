专访Ubuntu Tweak的作者周鼎
================================================================================
[Ubuntu tweak][1]是一款知名度很高的应用程序软件，Ubuntu用户可以用它来调整系统的性能、功能等各个细节。项目的创始人，周鼎又名Tualatrix Chou，正与我们分享Ubuntu Tweak的特性、使用感觉以及它跟Canonical的关系，并且勾勒了项目的未来计划蓝图。享受吧！

**你什么时候开始使用linux的，并基于什么使你决定开发Ubuntu tweak？**

我开始使用Linux是在2006年底，那时刚开始我的大学生活。当时我正在学C编程语言，一个朋友建议说要学习编程的话Linux是最好的平台环境，所以我就开始了我的Linux生涯，是从Fedora Core 6开始的。但用了仅仅只有一周的时间，我就换成Ubuntu 6.10,因为Ubuntu在中国有更好的社区，也有更好更快的源库/镜像。我立马就爱上了Ubuntu，就一周时间，就从Windows环境完全切换到Ubuntu环境。

在苦乐参半的半年使用时间后，我意识到Ubuntu对中国用户来说不是太友好，因为全新安装系统后，用户必须得自己配置字体、输入法以及其它很多很多设置。所以，我决定开发出一款应用程序来帮助新手，让他们很简单的就可以对系统做相应配置。

因此在2007年7月，我就开始开发Ubuntu Tweak,刚开始的时候，仅仅提供了汉语版本的，但很快就考虑了Ubuntu Tweak的国际版本，并且在2007年9月份就发布了首个国际版本。

**Ubuntu tweak已经是非常成功的项目了。很多Ubutu用户用它来调整系统的性能、功能等各个细节。能给我们谈论下Ubuntu Tweak能做些什么吗？**

![](http://180016988.r.cdn77.net/wp-content/uploads/2012/03/tualatrix1.jpg)

Ubuntu Tweak可以用来切换桌面图表的显示方式、设置字体、启用/禁用多用户切换功能以及登陆的标识（logo）等等。

在最新的Ubuntu Tweak 0.6版本中，你也可以调整你的Unity桌面以及关机功能。

你也能使用Ubuntu Tweak来清理系统的垃圾以释放空间和使系统保持干净。

**Canonical在他们的默认发布源中不考虑加入Ubuntu Tweak。这意味着什么？这对那些没有经验，但又想要使用你的应用程序来调整他们的系统的用户来说，存在某些风险吗？**

对的。因为在以前的Ubuntu Tweak发布版本中，为流行的PPA都提供了可用源，但我不能保证所有的PPA都是安全的，所以Ubuntu Tweak会有一些安全风险。

如你们所见，从0.6版本后Ubuntu Tweak就已经从源中心（Source Center）移除了，但请不要混淆“Ubuntu默认包含”和“加入源仓库”这两个概念。Ubuntu Tweak首先应该要被加入通用资源仓库，然后才能被Ubuntu默认包含。

从错误报告和用户反馈来看，Ubuntu Tweak已经比老版本更加稳定及更易使用。

**你有收到来自Canonical和Ubuntu开发者的支持或有跟他们合作（不论什么）的事项吗，是哪些方面的？**

当然，我得到Canonical公司的一些帮助，他们试着帮我把Ubuntu Tweak放入源仓库。这工作现在仍然在进行。

也得到社区的很多热心帮助，他们帮我翻译、设计、测试、报告错误，甚至提交代码分支。

**开发Ubuntu Tweak的有多少人？**

如果你说的是“代码开发者”，就仅仅我一个，但我们有很多设计人员：logo是M.Sharp设计的，Kevin Chou帮助设计了Ubuntu Tweak的用户界面(UI)原型，他就是0.6版本的样子。现在Jeonkwan Chan正在帮我重新美化用户界面,将会用在0.7版本上。任何人，只要愿意就可以加入到Ubuntu Tweak的开发中来:)

**在Ubuntu11.04版本中当Unity出现时，许多Ubuntu用户抱怨其可配置性不好，您对这个怎么看的？这个特殊的桌面环境能有些什么多适用性的配置能力呢？**

我喜欢桌面系统的可配置高适应性，这是Linux系统的优点，不是吗？

例如，我不喜欢Unity Launcher的自动隐藏功能，所以我设置让他不会隐藏。

事实上，Unity是可配置的，仅仅是它缺少CompizConfig设置管理器，所以你不能把Unity Launcher放到桌面底部或右面，这对左撇子来说很不友好。哈哈，开玩笑的。

如大家所见，Ubuntu 12.04已经增加了隐藏/显示切换功能，Launcher的大小在系统设置中也可以自定义设置。我认为Unity将会有更多的可配置功能。

**一般来说，你认为Canonical公司开发Unity桌面环境是正确的决策吗？他们与 Gnome开发者之间有合作争议，这有些是是不可避免的是吗？**

Yes, I think it’s the right decision for Canonical. If you look back three years, when Ubuntu first introduced the Indicator for GNOME Panel, it was a better design than the original GNOME Panel applet. But there’s some problematic collaboration between Canonical and GNOME Developers, so it has never landed in GNOME, until in GNOME 3, the GNOME Shell itself removed the GNOME Panel, and the design of GNOME Shell panel is almost the same as that of the Indicator. If they could share the same API, the desktop Linux world would be better.是的，对于Canonical公司来说，我觉得他们的决策很正确。回顾三年前，

So, between the company, community and GNOME, the different opinions for user interface finally made the Unity desktop out.

I think it’s a good thing, at least I like Unity more than GNOME Shell right now.

**Although you are developing an Ubuntu specialized application, I suppose you are using another distro for more advanced users. What is your distro of choice and why?**

Of course, I had played with Fedora, Arch, OpenSUSE, especially with Gentoo, I had been using it for one year long. It’s my second favourite Linux distribution, because it has one of the most advanced package management systems.

But now I only use Ubuntu for desktop and server, I also use Mac OS X. I got many design inspiration from it :)

**Can Ubuntu Tweak, be tweaked or forked or changed a little bit, in order to become useful in other linux distributions like Fedora, or OpenSuse, or Debian? Is the idea of a “Linux Tweak” application that people would choose distro and desktop environment plausible or not?**

Yes, Ubuntu Tweak can be easily adapted to be used under other distributions. Ubuntu Tweak is modular and very easy to hack.

In 2008, I released an “Ubuntu Tweak for Fedora”, but finally I gave up the maintenance of this version cause I should keep focus on Ubuntu, and I also don’t have that much energy.

**So what is the future of Ubuntu Tweak? Maybe Canonical will embrace it making it a default part of their distro, or they could use it to base their own tweaking tool. What do you think and what will be your next steps?**

Of course the future of Ubuntu Tweak will be bright. Hah.

I have already started the process of putting Ubuntu Tweak to the Software Center, it would be easier if users can install Ubuntu Tweak from the Software Center.

Now I’m focusing on developing the 0.7 version, It will be a better polished and well integrated version for Unity desktop than ever before, and it will also introduce some useful new features. I’d like to adapt Ubuntu Tweak to work better under Unity desktop as much as possible.

I plan to release the new version along with Ubuntu 12.04, hope everyone will like it :)

And one more thing to tell, I’ve already joined Canonical, in Beijing, and response for OEM things. Although Ubuntu Tweak is still a personal project and I’m not involved in the development of Ubuntu, I will try to move to the development team when possible :)

**That was great! Thanks Tualatrix.**

--------------------------------------------------------------------------------

via: http://www.unixmen.com/interview-with-ding-zhou-of-ubuntu-tweak/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://ubuntu-tweak.com/
