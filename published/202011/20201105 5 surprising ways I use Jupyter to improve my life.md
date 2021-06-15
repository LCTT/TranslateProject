[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12816-1.html)
[#]: subject: (5 surprising ways I use Jupyter to improve my life)
[#]: via: (https://opensource.com/article/20/11/surprising-jupyter)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

5 种令人惊讶的使用 Jupyter 的方式
======

> Jupyter 不仅仅是一个数据分析工具，让我们看看如何以最有创意的方式使用这个基于 Python 的软件。

![](https://img.linux.net.cn/data/attachment/album/202011/12/224138d99jlp3q5qjqv5v7.jpg)

[Jupyter][2] 项目提供了用 JupyterLab 和 Jupyter Notebook 等交互式编写软件的技术方式。这个软件通常用于数据分析，但你可能不知道（Jupyter 社区也没有想到），你可以用它做多少事情。

以下是我使用 Jupyter 的五大意想不到的创造性方法。

### 1、处理图像

在[图像编辑和处理][3]方面，有很多很好的开源工具 —— 从那些可以与 Photoshop 媲美的工具到实验性的 [Glimpse][4]。但即使有这么多选择，有时我还是不想离开 [Python][5] 的世界。

幸运的是，Jupyter 是一个做轻量级图像处理的好选择。利用 Jupyter 直接将 [Pillow][6] 对象显示为图像的优势，让你可以尽情地对图片进行实验。我甚至还用它给孩子[做了一个涂色画][7]。

### 2、做一个 SSH 跳板遥控器

由于 JupyterLab 可以让你[上传和下载][8]文件、[编辑][9]文件，甚至[运行终端][10]，所以它拥有制作 SSH 跳板环境所需的所有部件。

通过一些 SSH 转发魔法，你可以让 Jupyter 成为防火墙另一边的[远程控制台][11]。

### 3、开发 Web 应用程序

我最喜欢的使用 Jupyter 的方式之一是用于一种意想不到的软件开发。我[做了一次演讲][12]，在演讲中，我使用 Jupyter Notebook 实时开发了一个 [Web 应用][13]。讲演的最后是一个简单的表单，它是 XSS 和 CSS 安全的，并包括一些轻量级的服务器端计算。

一个日常的 Jupyter 用户可能不会期望它是一个最棒的 Web 开发环境，但它是一个非常强大的环境。

### 4、从你喜欢的服务中提取报告

JupyterLab 中的数据分析是一种常见的用法，但<ruby>自我提升分析<rt>self-improvement analysis</rt></ruby>呢？

你可以使用 Jupyter 来[分析你的日历][14]。如果你最喜欢的服务允许 API 导出，甚至可以让你导出一个 CSV，你可以将这些与你的日历进行关联。如果你发现你在社交媒体上发帖的时候，你的日历上写着你应该和你的经理开会，那 Jupyter 也救不了你！

### 5、开发游戏

对于扩大对 Jupyter Notebook 的期望值，我最喜欢的方式是和孩子一起建立一个游戏。我之前写过这方面的文章，有一个使用 [PursuedPyBear][16] 和 Jupyter [编写游戏][15]的分步教程。

在试图弄清游戏机制时，这种迭代式的游戏开发方法特别有用。能够在游戏中途改变规则（对不起，我必须得这样做）是一个改变游戏规则的方法。

你甚至可以使用 IPywidgets 来修改数字参数，就像[这个视频][17]所示。

### 下载电子书

JupyterLab 和 Jupyter Notebooks 提供了一个不可思议的实验环境。[下载这本指南][18]，其中包含了以令人吃惊的方式使用 Jupyter 的教程。 

你是如何以创造性的方式使用它的？在下面的评论中分享你的最爱。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/surprising-jupyter

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://jupyter.org/
[3]: https://opensource.com/life/12/6/design-without-debt-five-tools-for-designers
[4]: https://glimpse-editor.github.io/
[5]: https://opensource.com/resources/python
[6]: https://pillow.readthedocs.io/en/stable/index.html
[7]: https://opensource.com/article/20/8/edit-images-python
[8]: https://jupyterlab.readthedocs.io/en/stable/user/files.html#uploading-and-downloading
[9]: https://jupyterlab.readthedocs.io/en/stable/user/files.html#opening-files
[10]: https://jupyterlab.readthedocs.io/en/stable/user/terminal.html
[11]: https://opensource.com/article/20/8/remote-management-jupyter
[12]: https://opensource.com/article/20/8/write-talk-using-jupyter-notebooks
[13]: https://github.com/moshez/interactive-web-development/blob/e31ae72d8cab7637d18bc734c4e8afc10c60251f/interactive-web-development.ipynb
[14]: https://opensource.com/article/20/9/analyze-your-life-jupyter
[15]: https://opensource.com/article/20/5/python-games
[16]: https://ppb.dev/
[17]: https://www.youtube.com/watch?v=JaTf_ZT7tE8
[18]: https://opensource.com/downloads/jupyter-guide
