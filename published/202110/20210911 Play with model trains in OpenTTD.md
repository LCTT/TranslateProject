[#]: subject: "Play with model trains in OpenTTD"
[#]: via: "https://opensource.com/article/21/9/model-trains-openttd"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13924-1.html"

在 OpenTTD 中玩模型火车
======

> 想玩实体模型火车，却没有足够大的空间？试试 OpenTTD 中的虚拟火车吧。

![](https://img.linux.net.cn/data/attachment/album/202110/27/100255emc3x33icci0cacc.jpg)

我父亲一直很喜欢火车模型，我记得我小时候，曾看着他在圣诞树周围建了一整条轨道。当 [乐高][2] 火车套装发布时，因其便利性和固有可扩展性，我们转而投向了乐高火车的怀抱。多年来，我们热衷于建造和改装乐高火车及单轨轨道。我经常想象，未来我会有一个车库或地下室，专门用于微型景观和电动汽笛火车。强调一下，我沉迷于另一个爱好的可能性非常低，所以当发现 _虚拟_ 模型铁路可以为我提供相同的满足感时，我很开心。我的虚拟爱好引擎是 [OpenTTD][3]，这是一款基于名为 **Transport Tycoon Deluxe** 的 90 年代老游戏的开源模拟游戏。

### 安装 OpenTTD

你可以在 [openttd.org/downloads][4] 下载适用于 Linux、macOS 和 Windows 的 OpenTTD。 

如果你正使用 Debian Linux 或其衍生产品，甚至是[在使用 Chromebook][5]，你可以下载 `.deb` 包。使用 `apt` 命令安装它：

```
$ sudo apt install ./openttd*deb
```

如果你在使用其他 Linux 发行版，请下载通用安装程序，并使用 [tar 命令][6]解压缩包： 

```
$ tar xvf openttd-x.yy.z-linux*.tar.xz
```

OpenTTD 已经在 Linux、macOS 和 Windows 的 [Steam][7] 中上架（Steam 是一个非开源的，但是很常见的跨平台游戏客户端）。

### 启动 OpenTTD 

如果你安装了 OpenTTD，可以从应用程序菜单启动它。

如果你是下载了通用包，可以切换到游戏目录，使用本地的 `openttd` 命令启动游戏： 

```
$ cd openttd*
$ ./openttd &amp;
```

首次启动 OpenTTD 时，游戏会提示必须下载图像集，在 Steam 版中会自动安装，但在独立应用程序中需要单击一下鼠标。无论如何，因为 OpenTTD 是开源的，经过了很好的改进，所以在默认图像之外，你最终还会下载的还有很多其他图像。 

下载图像集后，你会看到一个古色古香的小型界面。我觉得 640x480 的界面有点小，虽然旧图像界面确实更有年代感（那时计算能力还比较弱），但一些适配现代屏幕的轻度升级还是很好用的。因此，你的第一步操作就是点击“<ruby>检查在线内容<rt>Check online content</rt></ruby>”按钮。 

### 加载模组

“<ruby>内容下载<rt>Content downloading</rt></ruby>”界面是一个查看已通过审查的 OpenTTD <ruby>模组<rt>mod</rt></ruby>的窗口，可以提供个性化的改进图像界面、全新音乐、火车模型和地图名称。我使用了新西兰全套配置，所以对我来说，生成的所有城市都很熟悉，尽管 2020 年我转而开始使用“辐射 3”套装了。模组 _非常多_，可以使用右上角的搜索栏来缩小选择范围。 

下面是一些个人认为必备的模组：

  * **abase** - 高分辨率图像。将近 300 MB，这可能是你玩此游戏需要的最大一次下载（游戏本身只有 50 MB）。
  * **OpenSFX** - 一个声音合集。让你能听到城市中的交通声、船运的喇叭声以及很棒的火车汽笛声。
  * **Town names** - 城镇名称。默认的城市名称很有趣，但我认为记一些本地化的名称更容易。
  * **Trains** - 火车模组。OpenTTD 有一组运行良好的默认火车模型，但如果你已经是一名火车观察员，那你可能会喜欢下载一些额外的火车模型。我使用的是 NZR 火车合集，但还有很多火车也是可用的，包括来自英国、美国、奥地利、比利时、捷克共和国的车，以及按字母表顺序排列的许多其他火车。
  * **Beginner tutorial** - 新手教程。是一个帮你学习游戏及界面的引导场景。 

### 游戏引擎默认值 

下载新素材后，你需要将它们设置为默认值。有两个设置的地方：游戏引擎默认值、游戏内脚本与素材。

![OpenTTD main menu][8]

*OpenTTD 菜单（Seth Kenlon, [CC BY-SA 4.0][9]）*

单击“<ruby>游戏选项<rt>Game Options</rt></ruby>”按钮。 在游戏选项屏幕中，调整以下设置： 

  * 将<ruby>屏幕分辨率<rt>screen resolution</rt></ruby>设置为你喜欢的界面尺寸。
  * 将<ruby>基础图像集 <rt>base graphics set</rt></ruby>设置为 **abase**。
  * 将<ruby>基础声音设置<rt>base sounds set</rt></ruby>设置为 **OpenSFX**。

关闭游戏选项屏幕。你的改动会自动保存。

### 游戏选项

在主菜单界面，单击“<ruby>NewGRF 设置<rt>NewGRF Settings</rt></ruby>”按钮。 

![NewGRF settings window][10]

*NewGRF 设置菜单（Seth Kenlon, [CC BY-SA 4.0][9]）*

未活动的模组显示在 NewGRF 设置窗口的下半部分。要激活一个未活动的模组，请选择它并单击左下角的“<ruby>添加<rt>Add</rt></ruby>”按钮。选择要激活的模组后，再单击“<ruby>应用<rt>Apply</rt></ruby>”按钮。 

### 教程 

如果你下载了“<ruby>初学者教程<rt>Beginner tutorial</rt></ruby>”场景，可以通过它来学习 OpenTTD。开始教程请单击主菜单屏幕顶部附近的“<ruby>播放场景<rt>Play scenario</rt></ruby>” 按钮，然后选择该教程并开始。 

初学者教程有着游戏界面的完整浏览流程，全部完成需要花费一些时间。 

### 快速开始

现在我们快速介绍一下，此处你要了解以下内容：车辆出自仓库，一切活动都需要时间表。记住这两条规则，你可以立即开始建造火车（以及道路、海港和机场）。 

#### 建造车站

要在两个城市之间建立一条简单的铁路线，请单击顶部图标栏中的铁路轨道图标。

![New icon bar - railway option][11]

*新建图标栏——铁路选项（Seth Kenlon, [CC BY-SA 4.0][9]）*

铁路以车站开始和结束，所以我通常在预定线路的两端各放置一个车站。单击火车站图标（将鼠标悬停在其上方可查看其标签）。一个火车站要服务于一个地区，其作用范围必须与该地区尽量多地重叠。要查看车站的覆盖范围，请通过单击车站对话框底部的“<ruby>开启<rt>On</rt></ruby>”按钮以启用<ruby>覆盖区域高亮<rt>Coverage area highlight</rt></ruby>功能。 

![Station coverage window][12]

*车站覆盖信息窗口（Seth Kenlon, [CC BY-SA 4.0][9]）*

黑色网格表示覆盖范围，而白色网格显示车站的物理占据范围。当你将鼠标悬停在一个区域上时，车站的覆盖范围所需耗材会在弹出窗口中列出。从简单的开始，创建一个单轨 4 辆车的站台。在地图上的两个城市之间重复执行此操作两次。 

![create station menu][13]

*创建车站菜单（Seth Kenlon, [CC BY-SA 4.0][9]）*

### 铺设铁轨 

接下来，用铁轨连接车站。 OpenTTD 的等距视图需要一些时间来适应，但是在单击铁路图标并在地图上单击拖动之后，你就开始大概有所了解了。X-rail 图标提供了“自动轨道”模式，该模式会根据用户单击的方块位置对齐轨道。 

铺设导轨时要细心。OpenTTD 是不可撤回的，所以一旦点击一个正方形，轨道就会被构造出来。你必须使用炸药图标来移除导轨。和现实生活中一样，没有撤消按钮。 

### 火车车库

火车来自<ruby>车库<rt>depot</rt></ruby>。因此，要在铁路上添加火车，必须在沿线的某处添加一个车库。单击车库图标并在现有铁路附近放置。将车库连接到现有轨道，以确保你的火车可以从车库到达适当线路的（在此简单示例中，线路是唯一的）。

![create depot menu][14]

*建造车库菜单（Seth Kenlon, [CC BY-SA 4.0][9]）*

### 模型火车

终于，你可以将虚拟模型火车添加到虚拟铁路中了。要创建火车，请单击车库。 

单击站点窗口底部的“<ruby>新建车辆<rt>New Vehicle</rt></ruby>”按钮，会列出可用的火车引擎和汽车。列表会部分取决于你从可下载内容中添加的模型。一般来说，发动机分为三种：蒸汽发动机、柴油发动机和电动发动机。游戏内时间从 1950 年开始，所以早期你只有蒸汽可选。随着时间推进，你会获得可用于升级的创新型新模型。 

![create train menu][15]

*创建火车菜单（Seth Kenlon, [CC BY-SA 4.0][9]）*

现在创建一个简单的火车，其中包括一节引擎、一节客车和一节邮车。如果想添加其他类型的车厢，请单击站点以确认它们的可提供车型（由其覆盖区域决定）

### 创建火车时刻表

现在有了铁路和火车，还需要创建一个火车时刻表。时间表与车辆关联，因此无论何时添加新车，都要记得添加时间表，以让新车投入使用。 

要为火车添加时刻表，请单击其车库列表中列车左侧的编号。这样可以打开火车视口，窗口右侧会有按钮。单击箭头图标即可查看该列车的时刻表。 

![create schedule menu][16]

*创建时刻表菜单（Seth Kenlon, [CC BY-SA 4.0][9]）*

要创建时间表，请单击时间表窗口底部的“<ruby>前往<rt>Go To</rt></ruby>”按钮，然后单击要设置成第一个目的地的车站。然后点击下一站。你可以在时间表中选择一个停靠点，浏览“<ruby>满载<rt>Full load</rt></ruby>”和“<ruby>卸载<rt>Unload</rt></ruby>”下拉菜单中的选项，以此调整装卸要求，并且可以在“<ruby>无停靠<rt>Non-stop</rt></ruby>”下拉菜单中调整路线（如果开发了新路线）。选项有很多，随着城市发展和地图完善，你可能需要随时调整策略。 

但是现在，单击火车视口底部的红色“<ruby>已停止<rt>Stopped</rt></ruby>”按钮，让火车投入使用吧！ 

![train moving from station to station][17]

*在役中的火车（Seth Kenlon, [CC BY-SA 4.0][9]）*

### 试试 OpenTTD 吧

OpenTTD 是一个模拟器，同时也是一个游戏，所以确实会有一些限制，比如你可能想要优化的预算和参数。例如，你可以单击一个城市、农场或工厂，了解其可接受的进出口类型。你可以通过单击 OpenTTD 窗口右下角的预算按钮来借钱。它不仅仅是一个虚拟的火车集合游戏。你还可以建造道路、机场、海港等。记得所有车辆都需要车库和时间表，你就在实现虚拟企业的路上成功了一半。 

OpenTTD 有着活跃而热情的社区，以及[详细的维基][18]，并且有大量的资源和教程在线可用。下载游戏并试试吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/model-trains-openttd

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/train-plane-speed-big-machine.png?itok=f377dXKs (Old train)
[2]: https://opensource.com/article/20/6/open-source-virtual-lego
[3]: http://openttd.org
[4]: https://www.openttd.org/downloads/openttd-releases/latest.html
[5]: https://opensource.com/article/21/2/chromebook-linux
[6]: https://opensource.com/article/17/7/how-unzip-targz-file
[7]: https://store.steampowered.com/app/1536610/OpenTTD/
[8]: https://opensource.com/sites/default/files/openttd-menu.jpg (OpenTTD menu)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/openttd-newgrf.jpg (The NewGRF settings menu)
[11]: https://opensource.com/sites/default/files/openttd-iconbar-railway.jpg (The new icon bar - railway option)
[12]: https://opensource.com/sites/default/files/openttd-window-station.jpg (Station coverage information window)
[13]: https://opensource.com/sites/default/files/openttd-create-station.jpg (The create station menu)
[14]: https://opensource.com/sites/default/files/openttd-create-depot.jpg (Create depot menu)
[15]: https://opensource.com/sites/default/files/openttd-create-train.jpg (The create train menu)
[16]: https://opensource.com/sites/default/files/openttd-create-schedule.png (The create schedule menu)
[17]: https://opensource.com/sites/default/files/openttd-train.jpg (Train in service)
[18]: https://wiki.openttd.org/en/
