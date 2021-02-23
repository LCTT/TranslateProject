[#]: collector: (lujun9972)
[#]: translator: (JonnieWayy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12466-1.html)
[#]: subject: (My Linux story: breaking language barriers with open source)
[#]: via: (https://opensource.com/article/20/7/linux-bengali)
[#]: author: (Dr Anirban Mitra https://opensource.com/users/mitradranirban)

我的 Linux 故事：用开源打破语言壁垒
======

> 开源项目可以通过消除语言和其他障碍来帮着改变世界。  

![](https://img.linux.net.cn/data/attachment/album/202007/29/230730e4mb18km1nwn4ibm.jpg)

相较于我的许多同行和同事，我的开源之旅开始得着实很晚。  

2000 年，我实现了我从高中开始的梦想 —— 买一台属于我自己的个人计算机，当时我正在攻读医学研究生学位。在那之前，我对计算机的唯一接触是偶尔在图书馆或网吧上网，当时这些地方电脑使用的收费都相当高昂。所以我省下了一部分研究生津贴，设法买了一台 Pentium III 550 Mhz、128MB 内存的电脑，并且像当时大多数印度电脑的标准配置一样，装着盗版的 Windows 98 系统。  

我的宿舍房间上不了网。我不得不去附近的网吧，在那里下载软件，然后随身带着几十张软盘。  

当我终于拥有了自己的计算机，我非常高兴，但有一点也让我感到困扰，那就是我无法用我的母语孟加拉语写东西。我碰到了 CDAC 提供的资源，CDAC 是一个政府机构，它提供的印度语言工具是基于 ISCII 的，ISCII 是一个较早的国家标准，而印度语的 Unicode 标准就是基于这个标准。很难学习它的键盘布局。  

### 我的第一次贡献

不久后，我遇到了一款名叫 [Yudit][2] 的软件，它使用标准的 QWERTY 键盘布局来提供印地语的拼音输入。正是在通过 Yudit，我第一次遇到了诸如开源和自由软件、GNU 和 Linux 之类的术语。Yudit 也允许我把 UI 组件翻译成孟加拉语，当我将翻译提交给开发人员时，他很高兴地将它们合并到了下一个版本中，并在软件的 README 文件中称赞了我的功劳。  

第一次看到一款应用程序的用户元素以我的母语呈现，我感到十分兴奋。此外，尽管对写代码的知识几乎为零，我依然能够为软件开发做出贡献。我继续为 Yudit 创建了一个从 ISCII 到 Unicode 的转换器，这个转换器还可以用于各种印度语言之间的直译。我还买了本 Linux 杂志，随刊附赠了一张 Knoppix 的免费 live CD，正是通过它我体验到了 Linux 桌面。  

我面临的另一个问题是缺乏与 Unicode 兼容的 OpenType Bangla 字体。我使用的字体是共享软件，我需要为它支付许可费用。我在想，“为什么不尝试亲自开发呢？”在此过程中，我通过 bengalinux.org（后来更名为 Ankur 小组）接触到了分散在世界各地的孟加拉语使用者，他们正试图在 Linux 操作系统中使用孟加拉语。

我加入了他们的邮件列表，我们在内部与当局之间讨论了孟加拉语的 Unicode 和 OpenType 规范中的各种缺陷，然后在适当的时候进行了纠正。我的贡献是将传统的孟加拉字体转换为兼容 Unicode 的 OpenType 字体，翻译 UI 等。这个小组还发行了世界上第一张带有孟加拉语 UI 的 Live Linux CD。  

2003 年，我搬家到了一个无法访问互联网的地方。我只有在周日去加尔各答时才能联系到小组。当时，Linux 的孟加拉语本地化已经成为了主流。我们的一些志愿者加入了 Red Hat 从事翻译和字体开发工作。我也忙于我的医疗工作，几乎没时间去进行开源开发。  

如今，我觉得使用 Linux 做日常工作比其他任何操作系统都要舒服。我也为能与一个能让人们用自己的语言交流的项目联系在一起而感到自豪。它也为长期以来由于不会说英语而被认为处于“<ruby>数字鸿沟<rt>digital divide</rt></ruby>”另一端的人们带来了计算能力。孟加拉语实际上是世界上使用最广泛的语言之一，这个项目消除了全球人口中很大一部分人接触数字科技的主要语言壁垒。 

### 加入开源

加入到开源运动中来很容易。主动做一些对自己有用的事情，然后思索一下所做的事情如何能对他人也有帮助。关键在于使它免费可用，它可以给世界带来难以估量的价值。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/linux-bengali

作者：[Dr Anirban Mitra][a]
选题：[lujun9972][b]
译者：[JonnieWayy](https://github.com/JonnieWayy)
校对：[wxy](https://github.com/wxy )

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mitradranirban
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/india-globe-map.jpg?itok=6sSEL5iO (India on the globe)
[2]: http://www.yudit.org/
