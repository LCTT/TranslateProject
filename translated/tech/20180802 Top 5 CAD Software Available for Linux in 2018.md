Linux 上 5 个最好 CAD 软件
======

[计算机辅助设计 (CAD)][1] 是很多工程流程的必不可少的部分。CAD 用于建筑、汽车零部件设计、航天飞机研究、航空、桥梁施工、室内设计，甚至服装和珠宝设计等专业领域。

在 Linux 上并不原生支持一些专业级 CAD 软件，如 SolidWorks 和 Autodesk AutoCAD。因此，今天，我们将看看排名靠前的 Linux 上可用的 CAD 软件。预知详情，请看下文。

### Linux 可用的最好的 CAD 软件

![CAD Software for Linux][2]

在我们查看这份 Linux 的 CAD 软件列表前，你应该记住一件事，在这里不是所有的应用程序都是开源软件。我们也将包含一些非自由和开源软件的 CAD 软件来帮助普通的 Linux 用户。

我们为基于 Ubuntu 的 Linux 发行版提供了安装操作指南。对于其它发行版，你可以检查相应的网站来了解安装程序步骤。

该列表没有任何特殊顺序。在第一顺位的 CAD 应用程序不能认为比在第三顺位的好，以此类推。

#### 1、FreeCAD

对于 3D 建模，FreeCAD 是一个极好的选择，它是自由 (免费和自由) 和开源软件。FreeCAD 坚持以构建机械工程和产品设计为目标。FreeCAD 是多平台的，可用于 Windows、Mac OS X+ 以及 Linux。

![freecad][3]

尽管 FreeCAD 已经是很多 Linux 用户的选择，应该注意到，FreeCAD 仍然是 0.17 版本，因此，不适用于重要的部署。但是最近开发加速了。

- [FreeCAD][4]

FreeCAD 并不专注于 direct-2D 绘图和真实形状的动画，但是它对机械工程相关的设计极好。FreeCAD 的 0.15 版本在 Ubuntu 存储库中可用。你可以通过运行下面的命令安装。

```
sudo apt install freecad
```

为获取新的每日构建（目前 0.17），打开一个终端（`ctrl+alt+t`），并逐个运行下面的命令。

```
sudo add-apt-repository ppa:freecad-maintainers/freecad-daily
sudo apt update
sudo apt install freecad-daily
```

#### 2、LibreCAD

LibreCAD 是一个自由开源的、2D CAD 解决方案。一般来说，CAD 是一个资源密集型任务，如果你有一个相当普通的硬件，那么我建议你使用 LibreCAD ，因为它在资源使用方面真的轻量化。LibreCAD 是几何图形结构方面的一个极好的候选者。

![librecad][5]

作为一个 2D 工具，LibreCAD 是好的，但是它不能在 3D 模型和渲染上工作。它有时可能不稳定，但是，它有一个可靠的自动保存，它不会让你的工作浪费。

- [LibreCAD][6]

你可以通过运行下面的命令安装 LibreCAD。

```
sudo apt install librecad
```

#### 3、OpenSCAD

OpenSCAD 是一个自由的 3D CAD 软件。OpenSCAD 非常轻量和灵活。OpenSCAD 不是交互式的。你需要‘编程’模型，OpenSCAD 来解释这些代码来渲染一个可视化模型。在某种意义上说，它是一个编译器。你不能直接绘制模型，而是描述模型。

![openscad][7]

OpenSCAD 是这个列表上最复杂的工具，但是，一旦你了解它，它将提供一个令人愉快的工作经历。

- [OpenSCAD][8]

你可以使用下面的命令来安装 OpenSCAD。

```
sudo apt-get install openscad
```

#### 4、BRL-CAD

BRL-CAD 是最老的 CAD 工具之一。它也深受 Linux/UNIX 用户喜爱，因为它与模块化和自由的 *nix 哲学相一致。

![BRL-CAD rendering by Sean][9]

BRL-CAD 始于 1979 年，并且，它仍然在积极开发。现在，BRL-CAD 不是 AutoCAD，但是对于像热穿透和弹道穿透等等的运输研究仍然是一个极好的选择。BRL-CAD 构成 CSG 的基础，而不是边界表示。在选择 BRL-CAD 时，你可能需要记住这一点。你可以从它的官方网站下载 BRL-CAD 。

- [BRL-CAD][10]

#### 5、DraftSight (非开源)

如果你习惯在 AutoCAD 上作业。那么，DraftSight 将是完美的替代。

DraftSight 是一个在 Linux 上可用的极好的 CAD 工具。它有相当类似于 AutoCAD 的工作流，这使得迁移更容易。它甚至提供一种类似的外观和感觉。DrafSight 也兼容 AutoCAD 的 .dwg 文件格式。 但是，DrafSight 是一个 2D CAD 软件。截至当前，它不支持 3D CAD 。

![draftsight][11]

尽管 DrafSight 是一款起价 149 美元的商业软件。在 [DraftSight 网站][12]上可获得一个免费版本。你可以下载 .deb 软件包，并在基于 Ubuntu 的发行版上安装它。为了开始使用 DraftSight ，你需要使用你的电子邮件 ID 来注册你的免费版本。

- [DraftSight][12]

#### 荣誉提名

* 随着云计算技术的巨大发展，像 [OnShape][13] 的云 CAD 解决方案已经变得日渐流行。
* [SolveSpace][14] 是另一个值得一提的开源软件项目。它支持 3D 模型。
* 西门子 NX 是一个在 Windows、Mac OS 及 Linux 上可用的工业级 CAD 解决方案，但是它贵得离谱，所以，在这个列表中被忽略。
* 接下来，你有 [LeoCAD][15]，它是一个 CAD 软件，在软件中你使用乐高积木来构建东西。你使用这些信息做些什么取决于你。

### 我对 Linux 上的 CAD 的看法

尽管在 Linux 上游戏变得流行，我总是告诉我的铁杆游戏朋友坚持使用 Windows。类似地，如果你是一名在你是课程中使用 CAD 的工科学生，我建议你使用学校规定的软件 (AutoCAD、SolidEdge、Catia)，这些软件通常只在 Windows 上运行。

对于高级专业人士来说，当我们讨论行业标准时，这些工具根本达不到标准。

对于想在 WINE 中运行 AutoCAD 的那些人来说，尽管一些较旧版本的 AutoCAD 可以安装在 WINE 上，它们根本不执行工作，小故障和崩溃严重损害这些体验。

话虽如此，我高度尊重上述列表中软件的开发者的工作。他们丰富了 FOSS 世界。很高兴看到像 FreeCAD 一样的软件在近些年中加速开发速度。

好了，今天到此为止。使用下面的评论区与我们分享你的想法，不用忘记分享这篇文章。谢谢。

--------------------------------------------------------------------------------

via: https://itsfoss.com/cad-software-linux/

作者：[Aquil Roshan][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/aquil/
[1]:https://en.wikipedia.org/wiki/Computer-aided_design
[2]:https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/08/cad-software-linux.jpeg
[3]:https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/07/freecad.jpg
[4]:https://www.freecadweb.org/
[5]:https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/07/librecad.jpg
[6]:https://librecad.org/
[7]:https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/07/openscad.jpg
[8]:http://www.openscad.org/
[9]:https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/07/brlcad.jpg
[10]:https://brlcad.org/
[11]:https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/07/draftsight.jpg
[12]:https://www.draftsight2018.com/
[13]:https://www.onshape.com/
[14]:http://solvespace.com/index.pl
[15]:https://www.leocad.org/
