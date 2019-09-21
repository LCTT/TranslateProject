三款 Linux 下的 Git 图形客户端
======

> 了解这三个 Git 图形客户端工具如何增强你的开发流程。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/git-tools.jpg?itok=Be56iPT0)

在 Linux 下工作的人们对 [Git][1] 非常熟悉。一个理所当然的原因是，Git 是我们这个星球上最广为人知也是使用最广泛的版本控制工具。不过大多数情况下，Git 需要学习繁杂的终端命令。毕竟，我们的大多数开发工作可能是基于命令行的，那么没理由不以同样的方式与 Git 交互。

但在某些情况下，使用带图形界面的工具可能使你的工作更高效一点（起码对那些更倾向于使用图形界面的人们来说）。那么，有哪些 Git 图形客户端可供选择呢？幸运的是，我们找到一些客户端值得你花费时间和金钱（一些情况下）去尝试一下。在此，我主要推荐三种可以运行在 Linux 操作系统上的 Git 客户端。在这几种中，你可以找到一款满足你所有要求的客户端。

在这里我假设你理解如何使用 Git 和具有 GitHub 类似功能的代码仓库，[使用方法我之前讲过了][2]，因此我不再花费时间讲解如何使用这些工具。本篇文章主要是一篇介绍，介绍几种可以用在开发任务中的工具。

提前说明一下：这些工具并不都是免费的，它们中的一些可能需要商业授权。不过，它们都在 Linux 下运行良好并且可以轻而易举的和 GitHub 相结合。

就说这些了，快让我们看看这些出色的 Git 图形客户端吧。

### SmartGit

[SmartGit][3] 是一个商业工具，不过如果你在非商业环境下使用是免费的。如果你打算在商业环境下使用的话，一个许可证每人每年需要 99 美元，或者 5.99 美元一个月。还有一些其它升级功能（比如<ruby>分布式评审<rt>Distributed Reviews</rt></ruby>和<ruby>智能同步<rt>SmartSynchronize</rt></ruby>），这两个工具每个许可证需要另加 15 美元。你也能通过下载源码或者 deb 安装包进行安装。我在 Ubuntu 18.04 下测试，发现 SmartGit 运行良好，没有出现一点问题。

不过，我们为什么要用 SmartGit 呢？有许多原因，最重要的一点是，SmartGit 可以非常方便的和 GitHub 以及 Subversion 等版本控制工具整合。不需要你花费宝贵的时间去配置各种远程账号，SmartGit 的这些功能开箱即用。SmartGit 的界面（图 1）设计的也很好，整洁直观。

![SmartGit][5]

*图 1: SmartGit 帮助简化工作*

安装完 SmartGit 后，我马上就用它连接到了我的 GitHub 账户。默认的工具栏是和仓库操作相关联的，非常简洁。推送、拉取、检出、合并、添加分支、cherry pick、撤销、变基、重置 ——　这些 Git 的的流行功能都支持。除了支持标准 Git 和 GitHub 的大部分功能，SmartGit 运行也非常稳定。至少当你在 Ubuntu上使用时，你会觉得这一款软件是专门为 Linux 设计和开发的。

SmartGit 可能是使各个水平的 Git 用户都可以非常轻松的使用 Git，甚至 Git 高级功能的最好工具。为了了解更多 SmartGit 相关知识，你可以查看一下其[丰富的文档][7]。

### GitKraken

[GitKraken][8] 是另外一款商业 Git 图形客户端，它可以使你感受到一种绝不会后悔的使用 Git 或者 GitHub 的美妙体验。SmartGit 具有非常简洁的界面，而 GitKraken 拥有非常华丽的界面，它一开始就给你展现了很多特色。GitKraken 有一个免费版（你也可以使用完整版 15 天）。试用期过了，你也可以继续使用免费版，不过不能用于商业用途。

对那些想让其开发工作流发挥最大功效的人们来说，GitKraken 可能是一个比较好的选择。界面上具有的功能包括：可视化交互、可缩放的提交图、拖拽、与 Github、GitLab 和 BitBucked 的无缝整合、简单的应用内任务清单、应用内置的合并工具、模糊查找、支持 Gitflow、一键撤销与重做、快捷键、文件历史与追责、子模块、亮色和暗色主题、Git 钩子支持和 Git LFS 等许多功能。不过用户倍加赞赏的还是精美的界面（图 2)。

![GitKraken][10]

*图 2: GitKraken的界面非常出色*

除了令人惊艳的图形界面，另一个使 GitKraken 在 Git 图形客户端竞争中脱颖而出的功能是：GitKraken 使得使用多个远程仓库和多套配置变得非常简单。不过有一个告诫，使用 GitKraken 需要花钱（它是专有的）。如果你想商业使用，许可证的价钱如下：

  * 一人一年 49 美元
  * 10 人以上团队，39 美元每人每年
  * 100 人以上团队， 29 美元每人每年

专业版账户不但可以在商业环境使用 Git 相关功能，还可以使用 Glo Boards（GitKraken 的项目管理工具）。Glo Boards 的一个吸引人的功能是可以将数据同步到 GitHub <ruby>工单<rt>Issues</rt></ruby>。Glo Boards 具有分享功能还具有搜索过滤、问题跟踪、Markdown 支持、附件、＠ 功能、清单卡片等许多功能。所有的这些功能都可以在 GitKraken 界面里进行操作。

GitKraken 可以通过 deb 文件或者源码进行安装。

### Git Cola

[Git Cola][11] 是我们推荐列表中一款自由开源的 Git 图像客户端。不像 GitKraken 和 SmartGit，Git Cola是一款比较难啃的骨头，一款比较实用的 Git 客户端。Git Cola 是用 Python 写成的，使用的是 GTK 界面，因此无论你用的是什么 Linux 发行版和桌面，都可以无缝支持。并且因为它是开源的，你可以在你使用的发行版的包管理器中找到它。因此安装过程无非是打开应用商店，搜索 “Git Cola” 安装即可。你也可以通过下面的命令进行安装：

```
sudo apt install git-cola
```

或者

```
sudo dnf install git-cola
```

Git Cola 看起来相对比较简单（图 3）。事实上，你无法找到更复杂的东西，因为 Git Cola 是非常基础的。

![Git Cola][13]

*图 3：Git Cola 界面是非常简单的*

因为 Git Cola 看起来回归自然，所以很多时间你必须同终端打交道。不过这并不是什么难事儿（因为大多数开发人员需要经常使用终端）。Git Cola 包含以下特性：

  * 支持多个子命令
  * 自定义窗口设置
  * 可设置环境变量
  * 语言设置
  * 支持自定义 GUI 设置
  * 支持快捷键

尽管 Git Cola 支持连接到远程仓库，但和像 GitHub 这样的仓库整合看起来也没有 GitKraken 和 SmartGit 直观。不过如果你的大部分工作是在本地进行的，Git Cola 并不失为一个出色的工具。

Git Cola 也带有有一个高级的 DAG（有向无环图）可视化工具，叫做 Git DAG。这个工具可以使你获得分支的可视化展示。你可以独立使用 Git DAG，也可以在 Git Cola 内通过 “view->DAG” 菜单来打开。正是 Git DAG 这个威力巨大的工具使用 Git Cola 跻身于应用商店中 Git 图形客户端前列。

### 更多的客户端

还有更多的 Git 图形客户端。不过，从上面介绍的这几款中，你已经可以做很多事情了。无论你在寻找一款更有丰富功能的 Git 客户端（不管许可证的话）还是你本身是一名坚定的 GPL 支持者，都可以从上面找到适合自己的一款。

如果想学习更多关于 Linux 的知识，可以通过学习Linux基金会的[走进 Linux][14]课程。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/7/three-graphical-clients-git-linux

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[tarepanda1024](https://github.com/tarepanda1024)
校对：[wxy](https://github.com/wxy)

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
