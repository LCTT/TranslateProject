[#]: subject: (Using Git Version Control as a Writer)
[#]: via: (https://news.itsfoss.com/version-control-writers/)
[#]: author: (Theena https://news.itsfoss.com/author/theena/)
[#]: collector: (lujun9972)
[#]: translator: (piaoshi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13604-1.html)

作为一个写作者如何使用 Git 版本控制
======

> 我使用 Vim 和 Git 来写小说。是的，你也可以用 Git 来完成非编码任务。

![](https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/Using-Git-for-Writing.jpg?w=1200&ssl=1)

我相信当代的写作者们应该开始思考他们的工作流程了。

在一个注意力高度分散的世界里，作为写作者，我们必须对每天执行的任务链拥有控制权。传统上，作家们会把他们的写作放在分散注意力的事较少、注意力高度集中的时间段。不幸的是，海明威、阿特伍德们的这些建议不再真正适用于我们了。我们所生活的世界联系得更紧密了，因此对作家来说就有了更多的陷阱。这首先要求我们要有足够的自制力，不要让社交媒体或小狗和小猫的可爱视频在我们写作的时候分散我们的注意力。

但是，如果你的写作需要快速地检查事实、拼写不常见和技术性的词汇等，断开与互联网连接并不是一个现实的选项 —— 这正是我写作时的场景。另一个问题是你用于写作的应用程序本身的干扰；作为一个长期使用 MS Word 的人，我发现它越来越漂亮，但速度越来越慢，也越来越让人分心。作为当初我 [迁移到 Vim 的主要原因][1] 之一，我曾详细地谈到了这一点，所以我不打算再在这个问题上大谈特谈。重点是，在现代世界中，在现代设备上进行写作，可能远非理想状态。

因为我已经详细介绍过了 [我为什么转向 Vim][2] 和开源版本控制，在这篇文章中，我更想谈谈该 **怎么做**，特别是如何使用开源的版本控制技术，比如 Git（和 GitHub）。

### 什么是版本控制？再来一次？

![Source: https://git-scm.com/][3]

上图是我们如何进行传统版本控制的一个说明。这个图中假设你有一台设备，而且你只在那台设备上写作。但对我而言，我在许多机器上写作，包括我的安卓手机和一些不同年代的笔记本电脑，我会在特定的任务、特定的位置使用到它们。我在所有这些设备上进行的一个共同任务就是写作 —— 因此，我的设备必须以合理的方式捕捉变化并控制文件的版本。不要再让我将 `file1V1_device1_date.doc` 作为文件名了。

上图也没有考虑到我们用来写作的工具。像 LibreOffice Write 这样的文字处理器可以在 Linux、Mac 和 Windows 系统上使用，但在手机上使用文字处理器将会是一段不愉快的经历。我们中的一些写作者还使用其他文本工具（包括 Gmail 或我们的电子邮件客户端）来为我们的写作打草稿。但按逻辑顺序跟踪所有这些文件和电子邮件是相当折磨人的，我就用这样的流程写过一本书，相信我：我花在弄清文件名、版本变化、评论、给自己的注释以及带有附加注释的电子邮件上的时间，足以让我精神错乱。

读到这里，你们中的一些人可能会正确地指出，有云备份技术呀。虽然云存储的好处是巨大的，而且我也在继续使用它们，但其版本控制几乎不存在，或者说并不强大。

### 一个更好的工作流程

就像地球上的其它地方一样，大流行病的开始引发了一些焦虑和一些反思。我利用这段时间在 [The Odin Project][4]（强烈推荐给那些想学习 html、CSS、JavaScript/Ruby 的人）上自学了网络开发。

在课程的第一个模块中，有一个关于 Git 的介绍：什么是版本控制，以及它试图解决什么问题。读了这一章后，我豁然开朗。我立即意识到，这个 _Git_ 正是我作为一个写作者所要寻找的东西。

是的，更好的方法不是本地化的版本控制，而是 _分布式_ 的版本控制。“分布式”描述的是设备的分布，而我在这些设备上访问文件，以及之后进行编辑修改。下图是分布式版本控制的一个直观说明。

![Source: https://git-scm.com/][5]

### 我的方法

我为写作建立一个版本控制系统的目标如下：

  * 使我的稿件库可以从任何地方、任何设备上访问
  * 易于使用
  * 减少或消除因在写作、学习和编码各工作流程之间的场景切换而产生的摩擦 —— 尽可能使用同一工具（即 Vim）。
  * 可扩展性
  * 易于维护

基于以上需求，下图是我进行写作的分布式版本控制系统。

![][6]

如你所见，我的版本控制系统是分布式版本控制的一个简单的适配。在我的例子中，通过将 Git 版本控制应用到云存储（[pCloud][7]）的一个文件夹上，我可以同时利用这两种技术的优点。因此，我的工作流程可以用下图描述：

![][8]

#### 优势

  1. 我用一个写作（和编码）工具
  2. 我可以对我的手稿进行版本控制，无论我是从什么设备上访问文件的
  3. [超级简单，几乎没有任何不便之处][9]
  4. 易于维护

#### 缺点

你们中的写作者一定想知道这个系统存在什么缺点。以下是我在持续使用和完善这一工作流程时预计到的几个问题。

  * 对草稿的评论：文字处理器的一个更有用的功能是具有评论的功能。当我希望以后再回到文本的某一部分时，我经常在这部分为自己留下一个评论。我仍然没有想出一个解决这个问题的办法。
  * 协作：文字处理程序允许写作者之间进行协作。在我以前做广告相关工作的时候，我会用 Google Docs 来写文案，然后分享链接给我的设计师，从而他可以为广告和网站对文案进行摘录。现在，我的解决方法是用 Markdown 写文案，并通过 Pandoc 将 Markdown 文件导出为 .doc 文件。更关键的是，当我的手稿完成后，我仍然需要将文件以 .doc 格式发送给我的编辑。一旦我的编辑做了一些修改并把它发回来，我再尝试用 Vim 打开它就没有意义了。在这一点上，该系统的局限性变得更加明显。

我并不是说这是最好的方法，但在我职业生涯的这个阶段，这是对我来说最好的方法。我想，随着我对我的新的 [用于写作的开源工具][10] 和版本控制越来越熟悉和适应，我将进一步完善这个方法。

我希望这篇文章能为那些想使用 Git 进行文档版本控制的写作者提供一个很好的介绍。这肯定不是一篇详尽的文章，但我将分享一些有用的链接，使你的旅程更容易。

  1. [The Odin Project 介绍的 Git 基础知识][11]
  2. [开始使用 Git][12]
  3. GitHub 的 Git 基础知识教程

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/version-control-writers/

作者：[Theena][a]
选题：[lujun9972][b]
译者：[piaoshi](https://github.com/piaoshi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/theena/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/how-i-started-loving-vim/
[2]: https://news.itsfoss.com/configuring-vim-writing/
[3]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/local.png?w=800&ssl=1
[4]: https://www.theodinproject.com/
[5]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/distributed.png?w=668&ssl=1
[6]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/Version_Control.png?w=617&ssl=1
[7]: https://itsfoss.com/recommends/pcloud/
[8]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/Version_Control_2.png?w=886&ssl=1
[9]: https://www.youtube.com/watch?v=NtH-HhaLw-Q
[10]: https://itsfoss.com/open-source-tools-writers/
[11]: https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/introduction-to-git
[12]: https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control
