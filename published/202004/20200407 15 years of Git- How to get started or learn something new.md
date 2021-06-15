[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12104-1.html)
[#]: subject: (15 years of Git: How to get started or learn something new)
[#]: via: (https://opensource.com/article/20/4/get-started-git)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Git 都 15 岁了，如何入门或学习点新东西
======

> 在 Git 15 周年之际，了解为什么 Git 是保持软件行业运行的重要组成部分。

![](https://img.linux.net.cn/data/attachment/album/202004/13/091410k80er3mttrznc22e.jpg)

如果说过去二十年来有什么东西改变了软件，那么 [Git][2] 肯定位列榜首。

如果你没有亲自使用过 Git，你可能会认为它只是一种技术时尚，只是因为它是由 [Linux][3] 项目的创始人创建的，所以在开发者中只是一个偶然的宠儿。这或许有一定的道理，但 Git 确实取得了一些其他行业所没有的成就。有了 Git，分布在世界各地的开发者们可以在同一时间对同一段代码进行工作，并记录下每一次修改的历史，然后将所有的工作合并到一起，形成一个成品。由于这件事情非常复杂，所以这个工具本身也会变得很复杂，但归根结底，它是维持软件行业运行的重要组成部分。

无论你是否了解 Git，如果你足够深入的研究开源软件，或者进入计算机科学领域，都有可能遇到它。无论你使用 Git 只是为了下载一个安装包，还是每天与它交互来管理代码，了解更多关于它的知识，都会对你有很大的启发和帮助。

### Git 术语

与任何专业工具一样，Git 中也有很多行话。像“<ruby>克隆<rt>clone</rt></ruby>”、“<ruby>合并<rt>merge</rt></ruby>”和“<ruby>变基<rt>rebase</rt></ruby>”这样的术语，最起码也是神秘的，而更糟的情况下会令人感到排斥。试图理解这些术语的含义可能会让人不知所措，但如果你从 Matthew Broberg 的优秀文章《[Git 术语基础][4]》中得到一点指导，就不会这样了。只需快速阅读一下，你就能真正理解地听懂关于 Git 的对话。

### Git 入门

如果你需要知道如何使用 Git，那么我自己的[关于使用 Git 的入门文章系列][5]是一个很好的开始。这些文章已经有几年的历史了，但就像许多 Linux 和 UNIX 技术一样，它的界面并没有发生很大的变化，所以这些文章和我写这些文章那时一样，在今天还是很有意义的。这一系列文章向你介绍了 Git 最基本的概念，并带领你完成创建仓库、提交文件、恢复文件、合并分支等过程。

### 常见的 Git 服务

Git 最常见的用途之一是公共的 Git 托管服务，比如 GitLab 和 GitHub。Kedar Vijay Kulkarni 在他的《[如何在 Git 中克隆、修改、添加和删除文件][6]》一文中，演示了大多数开发者使用 Git 执行的日常任务。这不是非开发者的必读书目，但对于任何想在公共 Git 托管服务上为项目做贡献的人来说，这篇文章是必读的。这篇文章专门针对的是 Github，因为它是当今最常见的平台之一，但其原理也适用于任何 Git 服务的 Web 前端，包括 [GitLab][7]、[Gogs][8] 和 [Gitea][9] 等流行的开源框架。

### 试试这个 Git 演练

与其漫无目的的探索，你是不是更喜欢在导游的带领下学习？有时候，学习一件事最简单的方法就是模仿别人的准确步骤。你知道最终的结果是肯定成功的，所以你在进行练习的时候会有信心，而你的大脑和手指也会得到重复的好处，从而建立起记忆。如果这是你的学习风格，那就跟着 Alan Formy-Duvall 的《[Git 的实用学习练习][10]》，找出成功的 Git 课程的感觉。

### Git 应用程序

信不信由你，Git 的界面比你在终端输入的文字更多。显然，在线托管的 Git 有 Web 界面，但是你也可以在计算机上使用 Git 客户端。如果想获得更多的帮助，请阅读 Jesse Duffield 关于 [Lazygit][11] 的文章或 Olaf Anders 关于 [Tig][12] 的文章。要获得完整的图形应用程序体验，请阅读我有关 [Git-cola][13]、[Sparkleshare][14] 以及[其它应用][15]的文章。是的，甚至还有[用于你的移动设备的界面][16]！

### 了解更多关于 Git 的信息

知识就是力量，所以不要让 Git 对你来说像个谜。无论你是直接使用它，还是只知道它的名字，或者你以前从未听说过它，现在都是了解 Git 的好时机。这里有很多资源可以帮助你了解它的工作原理、工作原理以及人们为什么这么喜欢它。潜入其中，按照自己的节奏来学习，并学会爱上 Git 吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/get-started-git

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/document_free_access_cut_security.png?itok=ocvCv8G2 (Scissors cutting open access to files)
[2]: https://en.wikipedia.org/wiki/Git
[3]: https://opensource.com/resources/linux
[4]: https://opensource.com/article/19/2/git-terminology
[5]: https://opensource.com/life/16/7/stumbling-git
[6]: https://opensource.com/article/18/2/how-clone-modify-add-delete-git-files
[7]: https://about.gitlab.com/install/
[8]: https://gogs.io/
[9]: https://gitea.io/en-us/
[10]: https://opensource.com/article/19/5/practical-learning-exercise-git
[11]: https://opensource.com/article/20/3/lazygit
[12]: https://opensource.com/article/19/6/what-tig
[13]: https://opensource.com/article/20/3/git-cola
[14]: https://opensource.com/article/19/4/file-sharing-git
[15]: https://opensource.com/life/16/8/graphical-tools-git
[16]: https://opensource.com/article/19/4/calendar-git#mobile
