[#]: subject: "Open source 3D pixel art with Goxel"
[#]: via: "https://opensource.com/article/21/12/3d-pixel-art-goxel"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 Goxel 的开源 3D 像素艺术
======
使用 Goxel 构建模型很有趣，就像乐高最好的部分没有锋利的边缘，就像没有“爬行者”的 Minecraft。
![Pixel art in 3D with Goxel][1]

我喜欢乐高，这不是什么秘密，但我已经远离我的乐高收藏，把满满一柜子的经典乐高套装运到世界各地，这目前是一个有问题的提议。为了解决这个问题，我做了很多虚拟化的工作，从[在乐高 CAD 中建立模型][2]到[在 Blender 中用乐高纹理对模型进行造型][3]。最近我发现了 [Goxel][4]。这个简单得令人震惊的 3D 建模应用并没有自称是基于乐高的，甚至是与乐高相近的。然而，用 3D 像素建立模型的感觉与用乐高积木建立模型的满足感惊人地相似。你可以把 Goxel 看作是一个像素绘画程序，但却是 3D 的。

Goxel 采取了一种独特的 3D 建模方法，它专门针对_低模_建模。如果你想雕刻出栩栩如生的模型，就不应该使用这个程序。但是，如果你喜欢 Minecraft 和其他低模艺术的美感，那么你需要试试 Goxel。

### 在 Linux 上安装 Goxel

你可以从 [Flathub][6] 将 Goxel 作为 [Flatpak][5] 安装在 Linux 上。

对于 Android、Windows macOS 和 iOS，请到 [Goxel 网站][4]下载安装程序。

Goxel 是开源的，在 GPLv3 许可下发布。

### 使用体素绘画

当你第一次启动 Goxel 时，在 Goxel 窗口的中间会有一个空的“空间”或容器。这就是你的画布。

![The Goxel canvas][7]

（Seth Kenlon, [CC BY-SA 4.0][8]）

正是在这个容器中，且只有在这个容器中，你才能建立你的模型。在大多数三维建模应用中，深度感知是一种后天的技能，所以 Goxel 限制了你工作的空间，以防止你最终出现模型和模型部件彼此相距甚远的情况。Goxel 还限制你在一个严格的网格中移动。你可以沿 Y 轴上下移动，沿 X 轴左右移动，沿 Z 轴“近”和“远”移动，但只能在一个三维像素（或称为 _体素_）的片段中移动。就所有的意图和目的而言，Goxel 的体素是你用来建立模型的虚拟乐高砖块。

Goxel 中没有很多工具，这对一个三维建模应用来说是一个真正的特点。默认情况下，你已经激活了铅笔工具，所以你可以通过点击鼠标在体素容器内的任何地方立即开始建造。

![Hello from Goxel][9]

（Seth Kenlon, [CC BY-SA 4.0][8]）

试着点击容器周围，看看哪里有体素被添加。Goxel 让你比较容易看到你的铅笔即将添加体素的地方，它把体素当作砖块，假设当你靠近一个现有的体素时，你想把你的下一个体素连接到它。即便如此，在二维屏幕上实现 3D 也很困难。有时，体素会被添加到一个你没有意识到的地方。确保你的体素被添加到你想添加的地方的最好方法是经常旋转容器。你可以用键盘上的方向键来旋转容器，或者你可以点击并拖动鼠标中键。右击并拖动容器在 Goxel 工作区中移动，而鼠标的滚轮可以放大和缩小。

### 平面标记

Goxel 还提供了另一个对齐体素的技巧，那就是以半透明和临时平面的形式提供指导。当你在你的容器中添加一个平面时，它会创建一种力场，你的铅笔无法通过。

![Goxel planar guide][10]

(Seth Kenlon, [CC BY-SA 4.0][8])

其结果是，你只能沿着两个轴线安全地作画，而不能沿着第三个轴线作画。你可以沿着网格轻推平面，这样你就可以分片添加体素，就像 3D 打印机向物理模型添加一样。

禁用平面控制中的 **Visible** 选项来移除一个平面。

![Plane controls][11]

（Seth Kenlon, [CC BY-SA 4.0][8]）

### Goxel 工具栏

顶部的工具栏包含七个按钮。从左到右：

  * 撤销
  * 重做
  * 删除_所有的东西，且无需确认_
  * 添加一个象素
  * 减去（删除）一个体素
  * 画一个体素
  * 设置油漆颜色



你可以在单个体素上作画，也可以使用铅笔左边的形状工具，一次性添加体素区域。

除了用铅笔删除体素外，你还可以用激光工具来切割体素，因为它们出现在电脑显示器的 2D 屏幕上。激光工具，在形状工具的右边，把你的光标变成一个十字准线。把它指向你看到的体素，然后点击它来擦除。

### 极简主义的宁静

Goxel 有意简单，不仅在于它生产的内容，还在于它的生产方式。 我在本文中只讨论了 Goxel 的绘图工具。 虽然还有其他功能，例如控制光线的俯仰和偏航的能力、阴影的强度以及虚拟摄像机的位置，但该应用力求以最佳方式使事情变得简单和平常。 使用 Goxel 构建模型非常有趣，就像没有锋利边缘的乐高玩具，或者没有“爬行者”的 Minecraft。 去获取 Goxel，并构建一些模型！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/3d-pixel-art-goxel

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/header-image.jpg?itok=3MWdhreV (Pixel art in 3D with Goxel)
[2]: https://opensource.com/article/20/6/open-source-virtual-lego
[3]: https://opensource.com/article/20/7/lego-blender-bricker
[4]: https://goxel.xyz/
[5]: https://opensource.com/article/21/11/install-flatpak-linux
[6]: https://flathub.org/apps/details/io.github.guillaumechereau.Goxel
[7]: https://opensource.com/sites/default/files/uploads/goxel-canvas.jpg (The Goxel canvas)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://opensource.com/sites/default/files/uploads/goxel-hello.jpg (Hello from Goxel)
[10]: https://opensource.com/sites/default/files/uploads/goxel-plane-guide.jpg (Goxel planar guide)
[11]: https://opensource.com/sites/default/files/uploads/goxel-plane-controls.jpg (Plane controls)
