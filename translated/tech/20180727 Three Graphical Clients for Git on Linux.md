Three Graphical Clients for Git on Linux
三款Linux下的Git图形客户端
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/git-tools.jpg?itok=Be56iPT0)

在Linux下工作的人们对[Git][1]非常熟悉。一个理所当然的原因是，Git是我们这个星球上最广为人知也是使用最广泛的版本控制工具。不过大多数情况下，git需要学习繁杂的终端命令。既然我们的大多数开发工作可能是基于命令行的，那么为什么不试试图形界面的Git客户端呢？

在某些情况下，使用带图形界面的工具可能使你的工作更高效一点（起码对那些更倾向于使用图像界面的人们来说）。那么，有哪些Git图形客户端可供选择呢？幸运的是，我们找到一些客户端值得你花费时间和金钱（一些情况下）去尝试一下。在此，我主要推荐三种可以运行在Linux操作系统上的Git客户端。在这几种中，你可以找到一款满足你所有要求的客户端。

在这里我假设你理解如何使用Git和具有github类似功能的代码仓库，[使用方法我之前讲过了][2]，因此我不再花费时间讲解如何使用这些工具。本篇文章主要是一篇介绍，介绍几种可以用在开发任务中的工具。

提前说明一下：这些工具并不都是免费的，它们中的一些可能需要商业授权。不过，它们都在Linux下运行良好并且可以轻而易举的和Github相结合。

就说这些了，快让我们看看这些出色的Git图形客户端吧。

### SmartGit

[SmartGit][3]是一个专有工具，不过如果你在非商业环境下使用是免费的。如果你打算在商业环境下使用的话，一个许可证每人每年需要99美元，或者5.99美元一个月。还有一些附加功能（比如分布式代码评论和文件目录比对），每个工具每个许可证需要另加15美元。你也有通过下载源码码或者deb安装包进行安装。我在Ubuntu18.04下测试，发现SmartGit运行良好，没有出现一点问题。

不过，我们为什么要用SmartGit呢？有许多原因，最重要的一点是，SmartGit可以非常方便的和github以及SVN等版本控制工具整合。不需要你花费宝贵的时间区去配置各种账号，SmartGit的这些功能开箱即用。SmartGit的界面（图片1）设计的也很好，整洁直观。

![SmartGit][5]

图片 1: SmartGit 帮助简化工作

[Used with permission][6]

我们安装完SmartGit后，就需要连接Github账户。默认的工具栏是和仓库操作相关联的，非常简洁。Push, pull, check out, merge, add branches, cherry pick, revert, rebase, reset　—　这些Git的的流行功能都支持。除了支持标准Git和Github的大部分功能,SmartGit运行也非常稳定。至少当年在Ubuntu上使用时，你会觉得这一款软件是专门为Linux设计和开发的。

SmartGit可能是使各个水平的Git用户都可以非常轻松的使用Git，甚至Git高级功能的最好工具。为了了解更多SmartGit相关知识，你可以看一下[扩展文档][7].

### GitKraken

[GitKraken][8]是另外一款商业Git图形客户端，它可以使你感受到一种绝不会后悔的使用Git或者Github的美妙体验。SmartGit具有非常简洁的界面，而GitKraken拥有非常华丽的界面，它一开始就给你展现了很多特色。GitKraken有一个免费版（你也可以使用完整版15天）。试用期过了，你也可以继续使用免费版，不过不能用于商业用途。

对那些想获得开发工具链最大功效的人们来说，GitKraken可能是一个比较好的选择。界面上具有的功能包括：可视化交互、调调整commit图像的大小、拖拽和无缝整合(Github、gitlab和BitBucked)、简单的app内任务清单、app内的merge工具、模糊查找、支持gitflow、一键撤销和重做、快捷键、文件历史、子模块、亮色和暗色主题、git hook支持和git LFS等许多功能。不过用户倍加赞赏的还是精美的界面(图片2)。

![GitKraken][10]

图片 2: GitKraken的界面非常出色

[Used with permission][6]

除了令人惊艳的图形界面，另一个使GitKraken在Git图形客户端竞争中脱颖而出的功能是：GitKraken使得同远程仓库的交互变得非常简单。不过有一个告诫，使用GitKraken需要花钱（它是专有的）。如果你想商业，许可证的价钱如下：

  * 一人一年49美元

  * 10人以上团队39美元每人每年

  * 100人以上团队29美元每人每年

专业版账户不但可以在商业环境使用Git相关功能还可以使用Glo Boards（一款项目管理工具） 。Glo Boards的一个吸引人的功能是可以将数据同步到 GitHub Issues。Glo Boards具有分享功能还具有搜索过滤、问题跟踪、Markdown支持、附件、＠功能、清单等许多功能。所有的这些功能都可以在GitKraken上进行操作。

GitKraken可以通过deb文件或者源码进行安装。

### Git Cola

[Git Cola][11]是我们推荐列表中一款免费开源的Git图像客户端。不像GitKraken和SmartGit，Git Cola是一款比较难啃的骨头，一款比较实用的Git客户端。Git Cola是用Python写成的，使用的GTk接口，因此无论你用的什么Linux桌面发型版，都可以无缝支持。并且因为它是开源的，你可以在你使用的发行版的包管理器中找到它。因此安装过程无非是打开App 商店，搜索“Git Cola”安装即可。你也可以通过下面的命令进行安装：
```
sudo apt install git-cola
```
或者
```
sudo dnf install git-cola
```

Git Cola看起来相对比较简单（图像3）。事实上，你无法找到更复杂的东西，因为Git Cola是非常基础的。

![Git Cola][13]


图像3：Git Cola界面是非常简单的

[Used with permission][6]

因为Git Colak看起来回归自然，所以很多时间你必须同终端打交道。不过这并不是什么难事儿（因为大多数开发人员需要经常使用终端）。Git Cola包含以下特性：

  * 支持多个子终端

  * 自定义窗口设置

  * 设置环境变量

  * 语言设置

  * 支持自定义GUI设置

  * 支持快捷键

尽管Git Cola不支持连接到远程仓库，和Github的整合看起来也没有GitKraken和SmartGit直观。不过如果你的大部分工作是在本地进行的，Git Cola并不失为一个出色的工具。

和Git Cola一起出现的还有一个高级的DAG（有向无环图）可视化工具，叫做Git Dag。这个工具可以使你获得分支的可视化展示。你可以独立使用Git Cola也可以通过Git Cola内菜单 "view->DAG" 来打开。正是Git DAG这个威力巨大的工具使用 Git Cola跻身于App商店中Git图行客户端前列。

### 更多的客户端

还有更多的Git图形客户端。不过，从上面介绍的这几款中，你已经可以做很多事情了。无论你在寻找一款更有丰富功能的Git客户端（不管许可证的话）还是你本事是一名坚定的GPL支持者，都可以从上面找到适合自己的一款。

如果想学习更多关于Linux的知识，可以通过学习Linux基金会的["走进Linux" ][14]课程。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/7/three-graphical-clients-git-linux

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[tarepanda1024](https://github.com/tarepanda1024)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://git-scm.com/
[2]:https://www.linux.com/learn/intro-to-linux/2018/7/introduction-using-git
[3]:https://www.syntevo.com/smartgit/
[4]:/files/images/gitgui1jpg
[5]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/gitgui_1.jpg?itok=LEZ_PYIf (SmartGit)
[6]:/licenses/category/used-permission
[7]:http://www.syntevo.com/doc/display/SG/Manual
[8]:https://www.gitkraken.com/
[9]:/files/images/gitgui2jpg
[10]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/gitgui_2.jpg?itok=Y8crSLhf (GitKraken)
[11]:https://git-cola.github.io/
[12]:/files/images/gitgui3jpg
[13]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/gitgui_3.jpg?itok=bS9OYPQo (Git Cola)
[14]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
