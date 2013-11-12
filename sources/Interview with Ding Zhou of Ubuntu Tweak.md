专访Ubuntu Tweak的作者周鼎
================================================================================
[Ubuntu tweak][1]是一款知名度很高的应用程序软件，Ubuntu用户可以用它来调整系统的性能、功能等各个细节。项目的创始人，周鼎又名Tualatrix Chou，正与我们分享Ubuntu Tweak的特性、使用感觉以及它跟Canonical的关系，并且勾勒了项目的未来计划蓝图。享受吧！

**你什么时候开始使用linux的，并基于什么使你决定开发Ubuntu tweak？**

我开始使用Linux是在2006年底，那时刚开始我的大学生活。当时我正在学C编程语言，一个朋友建议说要学习编程的话Linux是最好的平台环境，所以我就开始了我的Linux生涯，是从Fedora Core 6开始的。但用了仅仅只有一周的时间，我就换成Ubuntu 6.10,因为Ubuntu在中国有更好的社区，也有更好更快的源库/镜像。我立马就爱上了Ubuntu，就一周时间，就从Windows环境完全切换到Ubuntu环境。

在苦乐参半的半年使用时间后，我意识到Ubuntu对中国用户来说不是太友好，因为全新安装系统后，用户必须得自己配置字体、输入法以及其它很多很多设置。所以，我决定开发出一款应用程序来帮助新手，让他们很简单的就可以对系统做相应配置。

因此在2007年7月，我就开始开发Ubuntu Tweak,刚开始的时候，仅仅提供了汉语版本的，但很快就考虑了Ubuntu Tweak的国际版本，并且在2007年9月份就发布了首个国际版本。

**Ubuntu tweak已经是非常成功的项目了。很多Ubutu用户用它来调整系统的性能、功能等各个细节。能给我们谈论下Ubuntu Tweak能做些什么吗？**

![](http://180016988.r.cdn77.net/wp-content/uploads/2012/03/tualatrix1.jpg)

Ubuntu Tweak can be used to toggle the desktop icon display, set the fonts, enable/disable the user switch, logo.

In the latest version of Ubuntu Tweak (0.6), you can also use it to tweak your Unity desktop.ut and shutdown functions.

You can also use Ubuntu Tweak to cleanup system cruft to free space and make system clean.

**Canonical decides not to include Ubuntu Tweak in their distro by default. What does that mean? Is there some kind of risk for inexperienced users who want to tweak their system using your application?**

That’s right. Because in the previous version of Ubuntu Tweak, it provided a feature to enable the popular PPA, I wasn’t able to ensure all the PPA were safe, so Ubuntu Tweak had some security risks.

As you see, Source Center has been removed since 0.6. But please don’t mix the “include default by Ubuntu” and “put into the repository”, Ubuntu Tweak first should be put into the universal repository, then can be included by default in Ubuntu.

From the bug reports and user feedback, Ubuntu Tweak has became a lot more stable and easy to use than the old versions.

**What kind of support or collaboration (if any) you have from/with Canonical and the Ubuntu developers?**

Of course I received some help from the company, they helped me try to put Ubuntu Tweak into repository. It is still a work in progress.

I also received a lot of help from community, people help to translate, design, test and report bugs, and some of them even submitted patch for it.

**How many people are involved in the development of Ubuntu Tweak?**

If you say “programmer”, I’m the only one. But we have designers: the logo was designed by M.Sharp, Kevin Chou helped to design the mockup UI of Ubuntu Tweak, it became the 0.6. And currently Jeonkwan Chan are helping me polish the UI, it will become 0.7. Anyone can be involved in the development of Ubuntu Tweak, if they like :)

**When Unity came out on 11.04, a lot of Ubuntu users complained about the lack of configurability. What is your opinion on that, and what are the adaptability-configurability that this particular desktop environment can have?**

I’d like a desktop to have adaptability-configurability, that’s the advantage of Linux, isn’t it?

For example, I don’t like the auto-hide feature of Unity Launcher, so I set it to never hide.

Actually, Unity is configurable, the only thing that Unity is missing (through the ccsm) is that you can’t place Launcher to bottom or right – that’s maybe unfriendly for the left-handedness. Hah, just a joke.

As you can see, Ubuntu 12.04 has already added the hide/show toggle, Launcher size setting in system settings, I think Unity will be more configurable in the future.

**In general, do you think that the development of the Unity desktop environment was the right decision for Canonical? Was it something inevitable because of the problematic collaboration they had with the Gnome developers?**

Yes, I think it’s the right decision for Canonical. If you look back three years, when Ubuntu first introduced the Indicator for GNOME Panel, it was a better design than the original GNOME Panel applet. But there’s some problematic collaboration between Canonical and GNOME Developers, so it has never landed in GNOME, until in GNOME 3, the GNOME Shell itself removed the GNOME Panel, and the design of GNOME Shell panel is almost the same as that of the Indicator. If they could share the same API, the desktop Linux world would be better.

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