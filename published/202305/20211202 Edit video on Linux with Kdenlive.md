[#]: subject: "Edit video on Linux with Kdenlive"
[#]: via: "https://opensource.com/article/21/12/kdenlive-linux-creative-app"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "yjacks"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15801-1.html"

在 Linux 上用 Kdenlive 编辑视频
======

> 尝试用这个 KDE 程序做专业的视频编辑。

![][0]

无论是雪日、季节性假期，或是任何假期，都是在你电脑前专心发挥创造力的好时候。我最喜欢的一种消遣就是剪视频。有时，我为了讲个故事来剪；其他时候，我则是为了表达我的心情、观点、为我发现或创作的音乐提供视觉效果。也许这是因为我在学校为从事这一领域的职业学习了剪视频，或就只是因为我喜欢强大的开源工具。至今，我最喜欢的视频剪辑程序是优秀的 Kdenlive，这是一个强大而专业的剪辑工具，提供了直观的工作流、大量的特效和转场。

### 在 Linux 上安装 Kdenlive

Kdenlive 可以通过大部分的 Linux 发行版的包管理器安装。在 Fedora、Mageia 或类似的发行版：

```
$ sudo dnf install kdenlive
```

在 Elementary、Mine 或其他基于 Debian 的发行版：

```
$ sudo apt install kdenlive
```

不过，我用 [Flatpak][2] 来安装 Kdenlive。

### 如何籍视频讲故事

到底“编辑”视频是什么意思？

剪辑视频有些夸张的误解。当然，它是使鸿篇巨制的大片影响全世界数百万人的过程，但当你在你的笔记本前坐下时，你不必那样想。剪辑视频就是一个十分简单的，移除“坏的”部分，直到只剩下“好的”部分的工作。

什么是“好”镜头还是“坏”镜头，完全取决于你自己的品味，甚至可能根据你想用你的创作 “说” 的内容而改变。如果你在剪辑你在后院发现的野生动物的镜头，你可能会剪掉那些突出你的垃圾桶或你踩着耙子的镜头。剩下的部分肯定会使你的后院看起来像一个神奇的秘密花园，里面有蜂鸟、蝴蝶、好奇的兔子和一只俏皮的狗。另一方面，留下这些 “坏” 镜头，你就可以创造一部喜剧，讲述一个郊区人在清理垃圾时，踩到了耙子上，把所有的动物都吓跑了，总之是在捣乱。这没有对错之分。无论你切掉什么，没有人知道曾经存在过。无论你保留什么，都会有一个故事。

### 导入镜头

当你启动 Kdenlive，你会有个空项目。Kdenlive 窗口包括在左上角 <ruby>项目箱<rt>Project Bin</rt></ruby>、一个在中间的信息框，以及一个在右上的 <ruby>项目监视器<rt>Project Monitor</rt></ruby>。在下面的是十分重要的部分—— <ruby>时间轴<rt>Timeline</rt></ruby>。时间轴是创建你的故事的地方。在你的项目结束时，时间轴中的所有内容都是你的观众所看到的。这就是你的影片。

在你开始在你的时间轴上构建故事前，你需要一些素材。假设你已经从相机或手机上获得了一些视频，你必须在项目箱中增加一些素材。右键点击项目箱面板的空位置，然后选择 <ruby>添加素材或文件夹<rt>Add Clip or Folder</rt></ruby>。

![Adding clips in Kdenlive][3]

### 裁剪镜头

Kdenlive 中有许多方式来裁剪视频镜头。

#### 三点式编辑

以前，创建素材的正式方式是“三点式编辑”，包括如下几点：

1. 在 <ruby>素材监视器<rt>Clip Monitor</rt></ruby> 中打开一个视频素材，找到你希望视频开始的点，然后点键盘上的 `l` 来标记 *开始*。
2. 然后找你想让视频停止的点，并按 `O` 来标记 *结束*。
3. 从素材监视器拖动视频素材到 Kdenlive 窗口底部的时间轴上的某一个位置。

![A three-point edit in progress][5]

这个方法依然在某些环境中保有重要地位，但对于很多用户来说太“书面化”了。

#### 轴内编辑

另一个编辑的方法是拖动切片到 Kdenlive 的时间轴面板，并拖动切片的边缘，直到只留下好的部分。

![Editing in the timeline][6]

### 离切的艺术

另一种编辑技巧是 <ruby><rt>离切</rt>cut-away</ruby>。这是个重要的技巧，它不只帮助你跳过视频切片中的坏的部分，而且可以为你的观众增加背景信息。在电影和电视中，你已经见过了许多离切，即使你不理解它。每当荧幕上的人看惊讶地抬头，然后你就能看到他们的视角，这就是离切。当一个新闻主播提到你们城市中的一处地方，然后那个地方的镜头跟随其后，这也是离切。

你可以轻易的在 Kdenlive 中完成离切操作，因为 Kdenlive 时间轴是叠层式的。默认情况下，Kdenlive 中有四个 “<ruby>轨道<rt>track</rt></ruby>” ——最上面的两个分给视频，而下面的两个给伴奏的音频。当你在时间轴上放置视频素材，放在较高的视频轨道上的优先于放在下面的轨道。这意味着你可以在功能上编辑掉视频轨道的镜头，只需要通过在较高的轨道上放些更好的素材就行。

![A cut-away][7]

### 导出你的电影

当你的编辑都完成后，你可以导出你的电影，然后来把它发布到网上，让其他人看到。要做到这一点，点击在 Kdenlive 窗口顶端工具栏上的 <ruby>渲染<rt>Render</rt></ruby> 按钮。在显现的 <ruby>渲染<rt>Rendering</rt></ruby> 窗口中，选择你的视频托管服务支持的格式。WEBM 格式是近日很普遍的一种格式，除了是开源的，它也是可用于分发和存档的最佳格式之一。它能支持 4K、立体图像、广色域等更多的特性。而且所有的主流浏览器都可以播放它。

渲染需要时间，这取决于你的项目长度、你作出了多少编辑、以及你电脑的性能。

### 一个长效的解决方案

当我写这篇文章的时候，正好在十年前的今天，我发表了 [关于 Kdenlive 的六篇介绍文章][8] 。令我惊讶的是，这意味着我成为 Kdenlive 用户的时间比我在电影学院学习的专有编辑器的时间还要长。这是令人印象深刻的长寿，而且我今天仍然在使用它，因为它的灵活性和可靠性是其他编辑器无法比拟的。糟糕的是，我所学过的专有视频编辑器甚至都不存在了，至少不再以同样的形式存在（这让我希望我在一个开源平台上学习编辑！）。

Kdenlive 是一个功能强大的编辑器，有很多功能，但不要让这些吓倒你。我的介绍系列在今天和十年前一样相关而准确，在我看来，这是一个真正可靠的应用程序的特征。如果你想选择 Kdenlive 作为视频编辑器，一定要下载我们的 [速查表][9]，这样你就可以熟练使用键盘快捷键，减少点击次数，使编辑过程无缝进行。

现在去讲你的故事吧！

*（题图：MJ/028511ed-687f-4894-b4aa-cf3f6c108a1a）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/kdenlive-linux-creative-app

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[yjacks](https://github.com/yjacks)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_film.png?itok=aElrLLrw (An old-fashioned video camera)
[2]: https://opensource.com/article/21/11/install-flatpak-linux
[3]: https://opensource.com/sites/default/files/uploads/project-bin.jpg (Adding clips in Kdenlive)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/3-point-edit.jpg (A three-point edit in progress)
[6]: https://opensource.com/sites/default/files/uploads/edit.jpg (Editing in the timeline)
[7]: https://opensource.com/sites/default/files/uploads/cut-away.jpg (A cut-away)
[8]: https://opensource.com/life/11/11/introduction-kdenlive
[9]: https://opensource.com/downloads/kdenlive-cheat-sheet
[0]: https://img.linux.net.cn/data/attachment/album/202305/11/115804olzlm9mkoh8yvtdo.jpg