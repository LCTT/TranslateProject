[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11774-1.html)
[#]: subject: (Open source interior design with Sweet Home 3D)
[#]: via: (https://opensource.com/article/19/10/interior-design-sweet-home-3d)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Sweet Home 3D 开放源码室内设计
======

> 在你去真实世界购物前，在虚拟世界中尝试家具布局、配色方案等等。

![](https://img.linux.net.cn/data/attachment/album/202001/12/092633eyc3c9f7u3gfgj4e.jpg)

这里有关于如何装饰房间的三大流派：

1. 购买一堆家具，并把它们塞进房间。
2. 仔细测量每件家具，计算房间的理论容量，然后把它们全部塞进房间，忽略你在床上放置一个书架的事实。
3. 使用一台计算机进行预先可视化。

之前，我还实践了鲜为人知的第四个方式：不要家具。然而，自从我成为一个远程工作者，我发现家庭办公需要一些便利的设施，像一张桌子和一张椅子，一个用于存放参考书和技术手册的书架等等。因此，我一直在制定一个使用实际的家具来迁移我的生活和工作空间的计划，在该*计划*上强调由实木制作，而不是牛奶箱子(或胶水和锯末板之类的东西)。我最不想做的一件事：从旧货市场淘到得宝贝带回家时，发现其进不了门，或者比另一件家具大很多。

是时候做专业人士该做的事了，是时候做视觉预览了。

### 开放源码室内设计

[Sweet Home 3D][2] 是一个开源的（GPLv2）室内设计应用程序，可以帮助你绘制你的住宅平面图，然后定义、重新调整大小以及安排家具。你可以使用精确的尺寸来完成这些，精确到一厘米以下，而不使用任何数学运算，仅使用简单的拖拽操作就行。当你完成后，你可以以 3D 方式查看结果。在 Sweet Home 3D 中规划你家的室内设计，就和在 Word 程序中创建基本的表格一样简单。

### 安装

Sweet Home 3D 是一个 [Java][3] 应用程序，因此它是平台通用的。它运行在任何可以运行 Java 的操作系统上，包括 Linux、Windows、MacOS 和 BSD 。不用理会你的操作系统，你可以从网站[下载][4]该应用程序。

* 在 Linux 上，[untar][5] 存档文件。在 `SweetHome3D` 文件上右键单击，并选择**属性**。在**权限**选项卡中，授予文件可执行权限。
* 在 MacOS 和 Windows 上，展开存档文件并启动应用程序。当系统提示时，你必需授予它权限来在你的系统上运行。

![Sweet Home 3D permissions][6]

在 Linux 上，你也可以像一个 Snap 软件包一样安装 Sweet Home 3D ，前提是你已经安装并启用 **snapd**。

### 成功的测量

首先：打开你的卷尺。为充分利用 Sweet Home 3D，你必须知道你所计划的生活空间的实际尺寸。你可能需要测量精度到毫米或 1/16 英寸；你可以自己把握对偏差幅度的容忍度。但是你必需获得基本的尺寸，包括测量墙壁和门窗。

用你最好的判断力来判断常识。例如，当测量门时，包括门框；虽然从技术上讲它不是*门*本身的一部分，但它可能是你不想用家具遮挡的一部分墙壁空间。

![Measure twice, execute once][7]

### 创建一间房间

当你第一次启动 Sweet Home 3D 时，它会以其默认查看模式来打开一个空白的画布，蓝图视图在顶部面板中，3D 渲染在底部面板中。在我的 [Slackware][8] 桌面计算机上，它可以很好地工作，不过我的桌面计算机也是我的视频编辑和游戏计算机，所以它有一个极好的 3D 渲染显卡。在我的笔记本计算机上，这种视图模式是非常慢的。为了最好的性能（尤其是在一台计没有 3D 渲染的专用计算机上），转到窗口顶部的 **3D 视图** 菜单，并选择 **虚拟访问** 。这个视图模式基于虚拟访客的位置从地面视图渲染你的工作。这意味着你可以控制渲染的内容和时机。

不管你计算机是否强力，切换到这个视图的有意义的，因为地表以上的 3D 渲染不比蓝图平面图向你提供更多有用的详细信息。在你更改视图模式后，你可以开始设计。

第一步是定义你家的墙壁。使用**创建墙壁**工具完成，可以在顶部工具栏的**手形**图标右侧找到。绘制墙壁很简单：单击你想要墙壁开始的位置，单击以锚定位置，不断单击锚定，直到你的房间完成。

![Drawing walls in Sweet Home 3D][9]

在你闭合墙壁后，按 `Esc` 来退出工具。

#### 定义一间房间

Sweet Home 3D 在你如何创建墙壁的问题上是灵活的。你可以先绘制你房子的外部边界，然后再细分内部，或者你可以绘制每个房间作为结成一体的“容器”，最终形成你房子所占的空间量。这种灵活性是能做到的，因为在现实生活中和在 Sweet Home 3D 中，墙壁并不总是用来定义一间房间。为定义一间房间，使用在顶部工具栏的**创建墙壁**按钮右侧的**创建房间**按钮。

如果房间的地板空间是通过四面墙所定义，你需要做的全部的定义是像一间房间一样在四面墙壁内双击来圈占地方。Sweet Home 3D 将定义该空间为一间房间，并根据你的喜好，以英尺或米为单位向你提供房间的面积。

对于不规则的房间，你必需使用每次单击来手动定义房间的每个墙角。根据房间形状的复杂性，你可能不得不进行试验来发现你是否需要从你的原点来顺时针或逆时针工作，以避免奇怪的莫比斯条形地板。不过，一般来说，定义一间房间的地板空间是简单的。

![Defining rooms in Sweet Home 3D][10]

在你给定房间一层地板后，你可以更改到**箭头**工具，并在房间上双击来给予它一个名称。你也可以设置地板、墙壁、天花板和踢脚线的颜色及纹理。

![Modifying room floors, ceilings, etc. in Sweet Home 3D][11]

默认情况下，这些都不会在蓝图视图中渲染。为启用在你蓝图面板中的房间渲染，转到**文件**菜单并选择**首选项**。在**首选项**面板中，设置**平面图中房间渲染**为**地板颜色或纹理**。

### 门和窗

在你完成基本的地板平面图后，你可以长期地切换到**箭头**工具。

你可以在 Sweet Home 3D 的左栏中的**门和窗**类别下找到门和窗。你有很多选择，所以选择最接近你家的东西。

![Moving a door in Sweet Home 3D][12]

为放置一扇门或窗到你的平面图中，在你的蓝图平面图中的合适的墙壁上拖拽门或窗。要调整它的位置和大小，请双击门或窗。

### 添加家具

随着基本平面图完成，这部分工作感觉像是结束了！从这点继续，你可以摆弄家具布置以及其它装饰。

你可以在左栏中找到家具，按预期的方式来组织每个房间。你可以拖拽任何项目到你的蓝图平面图中，当你的鼠标悬停在项目的区域上时，使用可视化工具控制方向和大小。在任何项目上双击双击来调整它的颜色和成品表面。

### 查看和导出

为了看看你未来的家将会看起来是什么样子，在你的蓝图视图中拖拽“人”图标到一个房间中。

![Sweet Home 3D rendering][13]

你可以在现实和空间感受之间找到自己的平衡，你的想象力是你唯一的限制。你可以从 Sweet Home 3D [下载页面][4]获取附加的有用的资源来添加到你的家中。你甚至可以使用**库编辑器**应用程序创建你自己的家具和纹理，它可以从该项目的网站下载。

Sweet Home 3D 可以导出你的蓝图平面图为 SVG 格式，以便在 [Inkscape][14] 中使用，并且它可以导出你的 3D 模型为 OBJ 格式，以便在 [Blender][15] 中使用。为导出你的蓝图，转到**平面图**菜单，并选择**导出为 SVG 格式**。为导出一个 3D 模型，转到 **3D 视图** 菜单并选择**导出为 OBJ 格式**。

你也可以拍摄你家的"快照，以便于不打开 Sweet Home 3D 而回顾你的想法。为创建一个快照，转到 **3D 视图**菜单并选择**创建照片**。快照是按照蓝图视图中的人的图标的角度展现的，因此按照需要调整，然后在**创建照片**窗口中单击**创建**按钮。如果你对快照满意，单击**保存**。

### 甜蜜的家

在 Sweet Home 3D 中有更多的特色。你可以添加一片天空和一片草坪，为你的照片定位光线，设置天花板高度，给你房子添加另一楼层等等。不管你是打算租一套公寓，还是买一套房子，或是（尚）不存在的房子，Sweet Home 3D 是一款简单迷人的应用程序，当你匆忙购买家具时，它可以帮助你快乐地做出更好的购买选择。因此，你终于可以停止在厨房的柜台上吃早餐以及蹲在地上工作了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/interior-design-sweet-home-3d

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_housing.png?itok=s7i6pQL1 (Several houses)
[2]: http://www.sweethome3d.com/
[3]: https://opensource.com/resources/java
[4]: http://www.sweethome3d.com/download.jsp
[5]: https://opensource.com/article/17/7/how-unzip-targz-file
[6]: https://opensource.com/sites/default/files/uploads/sweethome3d-permissions.png (Sweet Home 3D permissions)
[7]: https://opensource.com/sites/default/files/images/life/sweethome3d-measure.jpg (Measure twice, execute once)
[8]: http://www.slackware.com/
[9]: https://opensource.com/sites/default/files/uploads/sweethome3d-walls.jpg (Drawing walls in Sweet Home 3D)
[10]: https://opensource.com/sites/default/files/uploads/sweethome3d-rooms.jpg (Defining rooms in Sweet Home 3D)
[11]: https://opensource.com/sites/default/files/uploads/sweethome3d-rooms-modify.jpg (Modifying room floors, ceilings, etc. in Sweet Home 3D)
[12]: https://opensource.com/sites/default/files/uploads/sweethome3d-move.jpg (Moving a door in Sweet Home 3D)
[13]: https://opensource.com/sites/default/files/uploads/sweethome3d-view.jpg (Sweet Home 3D rendering)
[14]: http://inkscape.org
[15]: http://blender.org
