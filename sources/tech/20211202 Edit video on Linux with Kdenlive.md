[#]: subject: "Edit video on Linux with Kdenlive"
[#]: via: "https://opensource.com/article/21/12/kdenlive-linux-creative-app"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "yjacks"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
在 Linux 上用 Kdenlive 编辑视频
======

尝试用这个 KDE 程序做专业的视频编辑。
![An old-fashioned video camera][1]

无论是雪日、季节性假期，或是任何假期、十二月，都是在你电脑前专心获取创意的好时候。我最喜欢的一种消遣就是剪视频。有时，我为了讲个故事来剪；其他时候，我则是为了表达我的心情、观点、为有启发性或沉着的音乐提供视频。也许这是因为我在学校就为了这一领域的职业学习了剪视频，或就只是因为我喜欢强力的开源工具。至今，我最喜欢的视频剪辑程序是优秀的 Kdenlive，一个提供了直观工作流、足够多的特效和转场的、健壮而专业的剪辑工具。

### 在 Linux 上安装 Kdenlive

Kdenlive 在大部分的 Linux 发行版包管可用。在 Fedora、Mageia 或类似的发行版：

```
`$ sudo dnf install kdenlive`
```

在 Elementary、Mine 或其他基于 Debian 的发行版：

```
`$ sudo apt install kdenlive`
```

不过，我用 [Flatpak][2] 来安装 Kdenlive。

### 如何籍视频讲故事

无论如何，“编辑”视频意味着什么？

视频剪辑有些夸张的误解。当然，这是放个大卫星，在世界范围影响数百万的方法：但是，当你在你的笔记本前坐下时，你不会往那方面想。剪辑视频就是一个十分简单的，移除”坏的“部分，并用好的部分替换的工作。

什么使镜头变坏或变好，完全取决于你自己的品味，甚至可能根据你想用你的创作 "说 "的内容而改变。如果你在剪你在后院发现的野生动物的镜头，你可能会剪掉那些突出你的垃圾桶或你踩着耙子的镜头。剩下的部分肯定会使你的后院看起来像一个神奇的秘密花园，里面有蜂鸟、蝴蝶、好奇的兔子和一只俏皮的狗。另一方面，留下这些 "坏 "的镜头，你就可以创造一部喜剧，讲述一个郊区人在清理垃圾时，踩到了耙子上，把所有的动物都吓跑了，总之是在捣乱。这没有对错之分。无论你切掉什么，没有人知道曾经存在过。无论你保留什么，都会有一个故事。

### 导入镜头

当你启动 Kdenlive，你会有个空项目。Kdenlive 窗口包括在左上角 **Project Bin**，一个在中间的信息框，以及一个在右上的 **Project Monitor**。在下面的是十分重要的部分——**Timeline**。**Timeline** 是你故事开始创建的地方。在你的项目结束时，**timeline** 中的所有内容都是你的观众所看到的。这就是你的视频。

在你开始在你的时间轴上构建故事前，你需要一些镜头。我猜你已经从相机或手机上获得了一些镜头，你必须在 **Project Bin** 中增加切片。右键 **Project Bin** 面板的空位置，然后选择 **Add Clip or Folder**。

![Adding clips in Kdenlive][3]

(Seth Kenlon, [CC BY-SA 4.0][4])

### 剪镜头

Kdenlive 中有许多方式来裁剪视频镜头。

#### 三点编辑

以前，官方的创建切片的方式是“三点编辑”，包括如下几点：

1\. 在 **Clip Monitor** 中打开一个视频片段，找到你视频的开始点，然后点键盘上的 **l** 来标记__开始__。
2\. 然后找你想让视频停下的点，并按**O**来标记__结束__.
3\. 从 **Clip Monitor** 拖动视频切片到在 Kdenlive 窗口底部的 **Timeline** 上的一点。

![A three-point edit in progress][5]

(Seth Kenlon, [CC BY-SA 4.0][4])

这个方法依然在一些设置中保有重要地位，但对于很多用户来说太“书面化”了。

#### 线内编辑

另一个编辑的方法是拖动切片到 Kdenlive 的 **Timeline** 面板，并拖动切片的边缘，直到只有好的部分保留。

![Editing in the timeline][6]

(Seth Kenlon, [CC BY-SA 4.0][4])

### <ruby><rt>cut-away</rt>离切</ruby>的艺术

另一种编辑技巧是 _离切_。因为他不只帮助你跳过视频切片中的坏的部分，而且可以为你的观众增加背景，所以这是个重要的技巧。在电影和电视中，你已经见过了许多离切，即使你不理解它。每次一些荧幕上的人看上去正处于惊讶之中，然后你就能看到他们的视角，这就是切。当一个记者报道了你们城市中的一处地方。然后那个地方的镜头跟随其后，这也是离切。

你可以轻易的在 Kdenlive 中完成离切操作，因为 Kdenlive **Timeline** 是叠层式的。默认情况下，Kdenlive 中有四个 "tracks"——最上面的两个分给视频，而下面的两个给所有附加的音频。当你在 timeline 上放置视频镜头，放在最高的视频 track 上的优先于放在下面的 track。这意味着你可以函数化的在视频 track 上编辑镜头，只需要通过在较那个 track 更上面的 track 放些更好的东西就行。

![A cut-away][7]

(Seth Kenlon, [CC BY-SA 4.0][4])

### 导出你的电影

你的编辑都完成后，你可以导出你的电影，然后来把它贴到线上，让其他人来看。为了那么做，点击在 Kdenlive 窗口顶端工具栏上的 **Render** 按钮。在显现的 **Rendering** 窗口中，选择你视频托管服务支持的格式。WEBMM 格式是近日很普遍的一种格式。另外，为了开源，它也是兼顾发行和存档目的的最好格式中的一个。它能支持 4K、立体影响、广色域，以及更多的特性。所有的主流浏览器都可以播放它。

Rendering 需要时间，受你的项目长度、你作出了多少编辑、以及你电脑的性能的影响。

## 一个长效解答

当我写这篇文章的时候，正好是十年前的今天，我在 Opensource.com 上发表了一个 [introductory six-part series on Kdenlive][8] 。令我惊讶的是，这意味着我成为 Kdenlive 用户的时间比我在电影学院学习的专有编辑器的时间还要长。这是一些令人印象深刻的寿命，而且我今天仍然在使用它，因为它的灵活性和可靠性是其他编辑器无法比拟的。糟糕的是，我所学的视频编辑器甚至都不存在了，至少不再以同样的形式存在（这让我希望我在一个开源平台上学习编辑！）。

Kdenlive 是一个功能强大的编辑器，有很多功能，但不要让这些吓倒你。我的介绍系列在今天和十年前一样相关和准确，在我看来，这是一个真正可靠的应用程序的特征。如果你选择探索 Kdenlive 作为一个编辑器，一定要下载我们的 **[cheat sheet][9]** ，这样你就可以内化键盘快捷键，减少点击次数，使编辑过程无缝进行。

现在去讲你的故事吧!

GNU/Linux 一直在寻找一个好的、可靠的、专业级的免费视频编辑器，这已经是众所周知的了。

在本系列的前一篇文章中，我们回顾了将镜头导入到......

那预言了即使是一个普通的视频编辑器也会有一套基本的视频转场功能......

好的摄影作品并不只是发生。仔细关注镜头设置、景深图、......

传统上，电影编辑过程是有条不紊和分门别类的。助理剪辑师们的工作是非常重要的。

后期制作是一个漫长而复杂的过程。正如这些文章所展示的，Kdenlive是......

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/kdenlive-linux-creative-app

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[yjacks译者ID](https://github.com/yjacks)
校对：[校对者ID](https://github.com/校对者ID)

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
