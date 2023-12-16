[#]: subject: "My open source journey with C from a neurodiverse perspective"
[#]: via: "https://opensource.com/article/22/5/my-journey-c-neurodiverse-perspective"
[#]: author: "Rikard Grossman-Nielsen https://opensource.com/users/rikardgn"
[#]: collector: "lkxed"
[#]: translator: "CanYellow"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16454-1.html"

从神经多样性视角看待我在 C 语言上的开源之旅
======

![][0]

> 我了解到，如果你能找到适合你的方法，不管老师和其他学生怎么说，你都可以学到任何你感兴趣的开源技能。

我生于 1982 年，以人类的年岁计算，这只过去了 40 年（在写这篇文章的时候）。然而就计算机发展而言，那已经是很久以前了。十岁的时候，我得到了我的第一台电脑，一台 Commodare 64 计算机。后来，我买了一台 Amiga，到了13岁的时候，我买了一台 “IBM 兼容” 机（那时，大家都这么称呼它）。

高中的时候，我用图形计算器做了很多基本的编程。高二的时候，我学习了基本的 C 语言编程，然后到了高三，我开始做更高级的 C 语言编程，开始应用库、指针和图形界面。

### 我从编程学生成为老师的旅程

在我的大学时代，我学习了 Java，所以 [Java 成为了我的主要语言][2]。我还为一种叫做个人数据助理（PDA）的设备编写了一些 C# 语言的程序，这是现代智能手机的前身。因为 Java 语言是面向对象的、跨平台的，并且使得 GUI 编程变得容易，我想以后我的大部分编程工作都会用 Java 来完成。

在大学里，我也发现自己有教学的天赋，所以我帮助别人编程，而当我选修计算机科学时，他们也帮助我学习数学。在大学后期，我选修了一些 C 语言编程的课程，目的是学习基本的嵌入式编程和测量仪器的控制。

30 岁之后，我用 C 语言作为教学工具，教高中生学习用 C 语言编程。我还用 [Fritzing][3] 教高中生如何编写 Arduino 程序。我对 C 语言编程的兴趣在去年再次被唤醒，当时我找到了一份工作，帮助大学生学习计算机科目中的差异。

### 我如何接触 C 语言和其他语言进行编程

每个人学习的方式都不一样。作为一个患有 <ruby>阿斯伯格综合症<rt>Asperger's</rt></ruby> 和多动症（ADHD）的 <ruby>神经多样性<rt>neurodiverse</rt></ruby> 人士，我的学习过程有时与其他人很不一样。当然，每个人都有不同的学习风格，尽管神经多样性人士可能比其他人更喜欢某种学习风格。

我倾向于用图片和文字来思考。就我个人而言，我需要一步一步地解码事物，一步一步地理解它们。这使得 C 语言适合我的学习风格。当我学习代码的时候，我通过学习观察一行行的代码，比如我面前的 `# include <stdio.h>` ，逐渐将代码合并到我的大脑中。根据我在互联网上获取的对其他神经多样性人群的描述，他们中的一些人似乎也有这种学习风格。我们“内化代码”。

有些自闭症人士在记忆大段代码方面比我强得多，但过程似乎是一样的。在理解诸如结构、指针、指针的指针、矩阵和向量之类的概念时，用图片来思考是很有帮助的，比如在编程教程和书籍中可以找到的那些。

我喜欢使用 C 语言来理解工作是如何在较低的级别上完成的，例如 [文件输入和输出（I/O）][4]、网络编程等等。这并不意味着我不喜欢处理字符串操作或创建数组等任务的库。我也喜欢用 Java 语言创建数组和向量的简单性。然而，对于创建用户界面，尽管我已经在 C 语言中看过这样的代码，但是我更喜欢使用图形化编辑器，比如 Netbeans 和类似的编辑器。

### 我理想中用于创建应用程序的 C 语言 GUI 开源工具

如果我想象一个理想的用 C 语言创建 GUI 的开源工具，它将类似于 [Netbeans][5]，例如，通过拖放来创建 GTK 接口。还可以在按钮上绑定 C 语言函数，等等，来使它们执行操作。也许有这样一个工具。我承认我没怎么仔细查找过。

### 为什么我鼓励年轻的神经多样性的人学习 C语言

[游戏行业][6] 是一个很大的产业。一些研究表明，神经多样性的孩子可能比其他孩子更专注于游戏。我会告诉一个神经多样性的高中生或大学生，如果你学习 C 语言，你可能会学到一些基础知识，例如，为显卡编写高效的驱动程序，或者编写高效的文件 I/O 例程来优化他们最喜欢的游戏。我还要诚实地说，学习需要时间和精力，但是值得付出努力。一旦你学会了它，你就可以更好地控制硬件一类的东西。

对于学习 C 语言，我建议一个神经多样性的孩子安装一个初学者友好的 Linux 发行版，然后在网上找到一些教程。我还建议一步一步地分解事物，并给它们绘制图表，例如，指针。我这样做是为了更好地理解这个概念，这对我很有效。

最后，这就是它的意义所在: 不管老师和其他学生怎么说，找到一种适合你的学习方法，用它来学习你感兴趣的开源技能。这是可以做到的，任何人都可以做到。

*（题图：DA/f0d98968-4c13-4395-8414-3690bc20b0ae）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/my-journey-c-neurodiverse-perspective

作者：[Rikard Grossman-Nielsen][a]
选题：[lkxed][b]
译者：[CanYellow](https://github.com/CanYellow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rikardgn
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/images/life/computer_code_programming_laptop_0.jpg
[2]: https://opensource.com/article/20/12/learn-java
[3]: https://fritzing.org
[4]: https://opensource.com/article/21/3/file-io-c
[5]: https://opensource.com/article/20/12/netbeans
[6]: https://opensource.com/tags/gaming
[0]: https://img.linux.net.cn/data/attachment/album/202312/09/104136g8fvixs7xsky72ks.jpg