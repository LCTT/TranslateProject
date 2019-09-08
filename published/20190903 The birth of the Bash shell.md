[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11314-1.html)
[#]: subject: (The birth of the Bash shell)
[#]: via: (https://opensource.com/19/9/command-line-heroes-bash)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberg)

Bash shell 的诞生
======

> 本周的《代码英雄》播客深入研究了最广泛使用的、已经成为事实标准的脚本语言，它来自于自由软件基金会及其作者的早期灵感。

![Listen to the Command Line Heroes Podcast][1]

对于任何从事于系统管理员方面的人来说，Shell 脚本编程是一门必不可少的技能，而如今人们编写脚本的主要 shell 是 Bash。Bash 是几乎所有的 Linux 发行版和现代 MacOS 版本的默认配置，也很快就会成为 [Windows 终端][2]的原生部分。你可以说 Bash 无处不在。

那么它是如何做到这一点的呢？本周的《[代码英雄][3]》播客将通过询问编写那些代码的人来深入研究这个问题。

### 肇始于 Unix

像所有编程方面的东西一样，我们必须追溯到 Unix。shell 的简短历史是这样的：1971 年，Ken Thompson 发布了第一个 Unix shell：Thompson shell。但是，脚本用户所能做的存在严重限制，这意味着严重制约了自动化以及整个 IT 运营领域。

这个[奇妙的研究][4]概述了早期尝试脚本的挑战：

> 类似于它在 Multics 中的前身，这个 shell（`/bin/sh`）是一个在内核外执行的独立用户程序。诸如通配（参数扩展的模式匹配，例如 `*.txt`）之类的概念是在一个名为 `glob` 的单独的实用程序中实现的，就像用于计算条件表达式的 `if` 命令一样。这种分离使 shell 变得更小，才不到 900 行的 C 源代码。
> 
> shell 引入了紧凑的重定向（`<`、`>` 和 `>>`）和管道（`|` 或 `^`）语法，它们已经存在于现代 shell 中。你还可以找到对调用顺序命令（`;`）和异步命令（`＆`）的支持。
>
> Thompson shell 缺少的是编写脚本的能力。它的唯一目的是作为一个交互式 shell（命令解释器）来调用命令和查看结果。

随着对终端使用的增长，对自动化的兴趣随之增长。

### Bourne shell 前进一步

在 Thompson 发布 shell 六年后，1977 年，Stephen Bourne 发布了 Bourne shell，旨在解决Thompson shell 中的脚本限制。（Chet Ramey 是自 1990 年以来 Bash 语言的主要维护者，在这一集的《代码英雄》中讨论了它）。作为 Unix 系统的一部分，这是这个来自贝尔实验室的技术的自然演变。

Bourne 打算做什么不同的事情？[研究员 M. Jones][4] 很好地概述了它：

> Bourne shell 有两个主要目标：作为命令解释器以交互方式执行操作系统的命令，和用于脚本编程（编写可通过 shell 调用的可重用脚本）。除了替换 Thompson shell，Bourne shell 还提供了几个优于其前辈的优势。Bourne 将控制流、循环和变量引入脚本，提供了更具功能性的语言来（以交互式和非交互式）与操作系统交互。该 shell 还允许你使用 shell 脚本作为过滤器，为处理信号提供集成支持，但它缺乏定义函数的能力。最后，它结合了我们今天使用的许多功能，包括命令替换（使用后引号）和 HERE 文档（以在脚本中嵌入保留的字符串文字）。

Bourne 在[之前的一篇采访中][5]这样描述它：

> 最初的 shell （编程语言）不是一种真正的语言；它是一种记录 —— 一种从文件中线性执行命令序列的方法，唯一的控制流的原语是 `GOTO` 到一个标签。Ken Thompson 所编写的这个最初的 shell 的这些限制非常重要。例如，你无法简单地将命令脚本用作过滤器，因为命令文件本身是标准输入。而在过滤器中，标准输入是你从父进程继承的，不是命令文件。
> 
> 最初的 shell 很简单，但随着人们开始使用 Unix 进行应用程序开发和脚本编写，它就太有限了。它没有变量、它没有控制流，而且它的引用能力非常不足。

对于脚本编写者来说，这个新 shell 是一个巨大的进步，但前提是你可以使用它。

### 以自由软件来重新构思 Bourne Shell 

在此之前，这个占主导地位的 shell 是由贝尔实验室拥有和管理的专有软件。幸运的话，你的大学可能有权访问 Unix shell。但这种限制性访问远非自由软件基金会（FSF）想要实现的世界。

Richard Stallman 和一群志同道合的开发人员那时正在编写所有的 Unix 功能，其带有可以在 GNU 许可证下免费获得的许可。其中一个开发人员的任务是制作一个 shell，那位开发人员是 Brian Fox。他对他的任务的讲述十分吸引我。正如他在播客上所说：

> 它之所以如此具有挑战性，是因为我们必须忠实地模仿 Bourne shell 的所有行为，同时允许扩展它以使其成为一个供人们使用的更好工具。

而那时也恰逢人们在讨论 shell 标准是什么的时候。在这一历史背景和将来的竞争前景下，流行的 Bourne shell 被重新构想，并再次重生。

### 重新打造 Bourne Shell

自由软件的使命和竞争这两个催化剂使重制的 Bourne shell（Bash）具有了生命。和之前不同的是，Fox 并没有把 shell 放到自己的名字之后命名，他专注于从 Unix 到自由软件的演变。（虽然 Fox Shell 这个名字看起来要比 Fish shell 更适合作为 fsh 命令 #missedopportunity）。这个命名选择似乎符合他的个性。正如 Fox 在剧集中所说，他甚至对个人的荣耀也不感兴趣；他只是试图帮助编程文化发展。然而，他并不是一个优秀的双关语。

而 Bourne 也并没有因为他命名 shell 的文字游戏而感到被轻视。Bourne 讲述了一个故事，有人走到他面前，并在会议上给了他一件 Bash T 恤，而那个人是 Brian Fox。

Shell | 发布于 | 创造者
---|---|---
Thompson Shell | 1971 | Ken Thompson
Bourne Shell | 1977 | Stephen Bourne
Bourne-Again Shell | 1989 | Brian Fox

随着时间的推移，Bash 逐渐成长。其他工程师开始使用它并对其设计进行改进。事实上，多年后，Fox 坚定地认为学会放弃控制 Bash 是他一生中最重要的事情之一。随着 Unix 让位于 Linux 和开源软件运动，Bash 成为开源世界的至关重要的脚本语言。这个伟大的项目似乎超出了单一一个人的愿景范围。

### 我们能从 shell 中学到什么？

shell 是一项技术，它是笔记本电脑日常使用中的一个组成部分，你很容易忘记它也需要发明出来。从 Thompson 到 Bourne 再到 Bash，shell 的故事为我们描绘了一些熟悉的结论：

* 有动力的人可以在正确的使命中取得重大进展。
* 我们今天所依赖的大部分内容都建立在我们行业中仍然活着的那些传奇人物打下的基础之上。
* 能够生存下来的软件超越了其原始创作者的愿景。
   
代码英雄在全部的第三季中讲述了编程语言，并且正在接近它的尾声。[请务必订阅，来了解你想知道的有关编程语言起源的各种内容][3]，我很乐意在下面的评论中听到你的 shell 故事。

--------------------------------------------------------------------------------

via: https://opensource.com/19/9/command-line-heroes-bash

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/commnad_line_hereoes_ep6_blog-header-292x521.png?itok=Bs1RlwoW (Listen to the Command Line Heroes Podcast)
[2]: https://devblogs.microsoft.com/commandline/introducing-windows-terminal/
[3]: https://www.redhat.com/en/command-line-heroes
[4]: https://developer.ibm.com/tutorials/l-linux-shells/
[5]: https://www.computerworld.com.au/article/279011/-z_programming_languages_bourne_shell_sh
