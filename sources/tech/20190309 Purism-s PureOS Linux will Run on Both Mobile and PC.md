[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Purism’s PureOS Linux will Run on Both Mobile and PC)
[#]: via: (https://itsfoss.com/pureos-convergence/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Purism’s PureOS Linux will Run on Both Mobile and PC
======

According to their latest announcement, Purism is working to create a unified operating system for their laptops and upcoming mobile device. Will Purism be able to succeed where others have failed?

[Purism][1] is a rather young tech company dedicated to freedom, privacy, and security. Their goal is to produce software and hardware that keeps the user’s information safe, instead of leaking it to the world. Purism currently produces a couple of laptops and is working on developing a [Linux-based smartphone][2].

### PureOS: The Future is convergent

![PureOS][3]

In their recent [announcement][4], Jeremiah Foster (Director of PureOS) states that Purism’s customized Linux distro ([PureOS][5]) will be convergent. This means that one codebase will work for both laptops and phones. In the future, you won’t have to choose between PureOS and PureOS Mobile. PureOS will work for both laptop/desktop and mobile.

> Many companies are eager to have their software be convergent, because it brings a consistent look and feel, as well as the exact same functionality for apps that run on your phone and your computer. Convergence can be really handy, since it allows you to use the apps you’re already familiar with, as well as the data that you’ve already synced. Convergence also brings plenty of benefits to developers, such as writing your app once, testing it once and running it everywhere.
>
> Jeremiah Foster, Director of PureOS

He acknowledges that the only way to create a convergent system is to have complete access to the source code and create an operating system that can work with many different CPU architectures. Because they are using Linux, Purism has a head start over their propriety competitors. They chose [Debian][6] as the base of their operating system because of it’s wide CPU support.

One of the biggest obstacles that Purism will have to overcome is getting apps to work and look the same on the two different form factors. This is an issue that web developers have been trying to overcome since the iPhone was released. To make this work, “Purism is hard at work on creating adaptive GNOME apps.”

If you are a developer, you can easily add convergence support to your existing applications. Purism is working on a library named [libhandy][7]. This library is “a mobile and adaptive presentation library for GTK+ and GNOME”. It is currently available in both PureOS and Debian. You can take advantage of the library by including it in your flatpak manifest in Builder.

### Convergence is nothing new

Foster notes in his announcement that both Apple and Google are currently working toward convergence, but haven’t reached it yet. Google is working to bake Android features and support into ChromeOS. For their part, Apple is working to integrate features from iOS into macOS.

![Ubuntu’s now discontinued convergence project ‘Ubuntu Touch’][8]

There have been a couple of failed attempts at convergence. The biggest took place back in 2013 when Canonical tried to raise $32 million dollars to create the [Ubuntu Edge][9]. The crowdfunding campaign ended with only $12,809,906. Canonical turned their focus to the [Ubuntu Touch][10] mobile operating system, which shared the same underpinning as mainline Ubuntu but had its own apps based on web technologies. [Canonical ended up dropping development of Ubuntu Touch][11].

Another project which has been more successful in creating convergence is [Maru][12]. Just like PureOS, [Maru][13] is based on Debian, but it also uses Android. Basically, when you are using your device as a phone, you will use Android (a cut down version of [LineageOS][14]). When you plug in a monitor and keyboard, you are using the Debian-based desktop. To find out more about Maru, read [our article on the project][12].

**Thoughts on PureOS and convergence**

When I initially read the Purism announce, I thought to myself “How are these guys going to pull this off when Canonical couldn’t.” After all, Canonical had more developers and a lot more money to put behind the project. However, the technology needed to make this work has come a long way in the past half dozen years. I am cautiously optimistic about the future of Purism’s convergence plans.

Have you ever used PureOS? Do you think Purism will be able to accomplish what others have failed to do? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][15].

--------------------------------------------------------------------------------

via: https://itsfoss.com/pureos-convergence/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://puri.sm/
[2]: https://itsfoss.com/librem-linux-phone/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/pureos.png?resize=800%2C497&ssl=1
[4]: https://puri.sm/posts/converging-on-convergence-pureos-is-convergent-welcome-to-the-future/
[5]: https://pureos.net/
[6]: https://itsfoss.com/reasons-why-i-love-debian/
[7]: https://source.puri.sm/Librem5/libhandy
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2016/02/convergence-ubuntu.jpg?resize=1024%2C588&ssl=1
[9]: https://en.wikipedia.org/wiki/Ubuntu_Edge
[10]: https://en.wikipedia.org/wiki/Ubuntu_Touch
[11]: https://itsfoss.com/ubuntu-unity-shutdown/
[12]: https://itsfoss.com/maru-os-linux/
[13]: https://maruos.com/
[14]: https://lineageos.org/
[15]: http://reddit.com/r/linuxusersgroup
