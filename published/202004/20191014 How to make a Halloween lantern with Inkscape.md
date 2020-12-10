[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12152-1.html)
[#]: subject: (How to make a Halloween lantern with Inkscape)
[#]: via: (https://opensource.com/article/19/10/how-make-halloween-lantern-inkscape)
[#]: author: (Jess Weichler https://opensource.com/users/cyanide-cupcake)

如何使用 Inkscape 制作万圣节灯笼
======

> 使用开源软件为你最喜欢的万圣节鬼屋制作一个有趣和怪异的装饰品。

![万圣节 - 背光飞行的蝙蝠][1]

使用开源软件装饰一个独一无二的万圣节灯笼！

通常，灯笼的一部分结构体是不透明的，以阻挡内部的光线。灯笼之所以成为灯笼，是因为其去掉了一些东西 ：从结构体上切开的窗口，这样光线就可以射出。虽然对于照明来说不实用，但是一个有着怪异形状窗口和隐藏暗色轮廓的灯笼却可以令人兴奋，并创造出很多乐趣。

这篇演示如何使用 [Inkscape][2] 创建你自己的灯笼。如果还没有 Inkscape ，在 Linux 上，你可以从软件库中安装它，在 MacOS 和 Windows 上，你可以从[Inkscape 网站][3] 上下载它.

### 使用材料

  * 模板（[A4][4] 或[信纸][5]大小）
  * 卡片纸（黑色是传统色）
  * 描图纸（可选）
  * 裁纸刀、尺子、切割垫板（可使用工艺切割机/激光切割机代替）
  * 工艺胶
  * LED 茶灯"蜡烛"
  
安全注意事项：这个项目只使用电池操作的蜡烛。

### 理解模板

首先，从上面的链接下载你所在区域（A4 或信纸）的合适的模板，然后在 Inkscape 中打开它。

![灯笼模板荧光屏][6]

灰白色的棋盘格背景是透明的（从技术角度来说，它是 alpha 通道。）

黑色基板构成了灯笼。现在，没有窗口可以让光线穿过；灯笼有一个非镂空的黑色基板。你将在 Inkscape 中使用**并集**和**差集**选项来数字化的设计窗口。

蓝色虚线表示折线。橙色实线表示参考线。采光窗口不应该放在橙色盒子的外面。

模板的左侧是你可以在你设计中使用的一些预先制作好的对象。

### 创建一个窗口或形状

1. 创建一个看起来像你想要的窗口样式的对象。可以使用 Inkscape 左侧工具栏中的一些形状工具来创建对象。此外，你可以下载共创或公共领域的剪贴画，并导入 PNG 文件到你的项目中。
2. 当你对对象的形状满意时，在顶部菜单中选择“路径” -> “对象转化成路径” 将其转换为一个路径（而不是一个形状，Inkscape 视其为两种不同的对象）。

    ![对象到路径 菜单][7]

3. 在基板形状的上面放置对象。
4. 选择对象和黑色基板。通过先单击一个，并按住 `Shift` 按键，再选择另一个来完成。
5. 从顶部菜单选择“路径” -> “差集” 来从基板的对象中移除形状。这将创建灯笼中的一个窗口。

    ![路径 > 差集 菜单][8]

### 添加对象到窗口中

在制作了一个窗口后，你可以添加对象到其中来创建一个场景。

提示：

* 所有的对象，包括文本，必须连接到灯笼的基板，否则，在切割后会掉落下来，并留下一片空白。
* 避免小而复杂的细微之处。即使使用激光切割机或工艺切割机等机器，也很难切割这些细微之处。

1. 创建或导入一个对象。
2. 放置对象到窗口内，以便它至少接触基板的两侧。
3. 选择对象后，从顶部菜单选择“连接” -> “对象转化成路径”。

    ![对象到路径 菜单][9]

4. 选择对象和黑色基板，通过在按住 `Shift` 按键的同时单击每一个来完成。
5. 选择“路径” -> “并集”来使对象和基板合二为一。

### 添加文本

文本既可以从基板剪出文字来创建一个窗口（就像我对星星所做的那样），或者也可以添加到一个窗口上（它可以阻挡来自灯笼内部的光线）。如果你要创建一个窗口，只需要执行下面的步骤 1 和步骤 2，然后使用“差集”来从基板移除文本。

1. 从左侧边栏中选择文本工具来创建文本。粗体字体效果最好。

    ![文本工具][10]

2. 选择你的文本，然后从顶部菜单选择“路径” -> “对象转化成路径”。这将转换文本对象为一个路径。注意，这个步骤意味着你将不能再编辑该文本，所以，*只有当*你确定你拥有想要的单词后，执行这个步骤。
3. 在你转换文本后，你可以按键盘上的 `F2` 来激活节点编辑器工具，当选择使用这个工具时，可以清楚地显示文本的节点。

    ![选中的文本使用节点编辑器][11]

4. 取消文本分组。
5. 调整每个字母，以便使其与相邻字母或基板稍微重叠。

    ![重叠文本][12]

6. 为将所有的字母彼此连接，并连接到基板，重新选择所有文本和基板，然后选择“路径” -> “并集”。

    ![使用 路径 > 并集 连接字母和基板][13]

### 准备打印

下面是手工切割灯笼的说明。如果使用激光切割机或工艺切割机，遵循硬件所需要的技巧来准备好你的文件。

1. 在“图层”面板中，单击“安全”图层旁边的“眼睛”图标来隐藏安全线。如果你看不到图层面板，通过顶部菜单选择“图层” -> “图层”来显示它。
2. 选择黑色基板。在“填充和笔划”面板中，设置填充为“X”（意味着*不填充*），设置“笔划”为纯黑色（对于喜欢十六进制的粉丝来说是 `#000000ff` ）。

    ![设置填充和笔划][14]

3. 使用“文件” -> “打印”来打印你的图案。
4. 使用一把工艺刀和直尺，小心地绕着每一条黑线切割。在蓝色虚线上轻划，然后折叠。

    ![裁剪灯笼][15]

5. 要完成窗口的制作，剪切描图纸为每个窗口的大小，然后粘贴它到灯笼的内侧。

    ![添加描图纸][16]

6. 在折条处把灯笼的边粘在一起。
7. 接通电池供电的 LED 蜡烛，并放置它到你灯笼中。

    ![完成灯笼][17]

现在你的灯笼已经完成了，准备好点亮你的鬼屋了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/how-make-halloween-lantern-inkscape

作者：[Jess Weichler][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cyanide-cupcake
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/halloween_bag_bat_diy.jpg?itok=24M0lX25 (Halloween - backlit bat flying)
[2]: https://opensource.com/article/18/1/inkscape-absolute-beginners
[3]: http://inkscape.org
[4]: https://www.dropbox.com/s/75qzjilg5ak2oj1/papercraft_lantern_A4_template.svg?dl=0
[5]: https://www.dropbox.com/s/8fswdge49jwx91n/papercraft_lantern_letter_template%20.svg?dl=0
[6]: https://opensource.com/sites/default/files/uploads/lanterntemplate_screen.png (Lantern template screen)
[7]: https://opensource.com/sites/default/files/uploads/lantern1.png (Object to path menu)
[8]: https://opensource.com/sites/default/files/uploads/lantern2.png (Object > Difference menu)
[9]: https://opensource.com/sites/default/files/uploads/lantern3.png (Object to path menu)
[10]: https://opensource.com/sites/default/files/uploads/lantern4.png (Text tool)
[11]: https://opensource.com/sites/default/files/uploads/lantern5.png (Text selected with Node editor)
[12]: https://opensource.com/sites/default/files/uploads/lantern6.png (Overlapping the text)
[13]: https://opensource.com/sites/default/files/uploads/lantern7.png (Connecting letters and base with Path > Union)
[14]: https://opensource.com/sites/default/files/uploads/lantern8.png (Setting fill and stroke)
[15]: https://opensource.com/sites/default/files/uploads/lantern9.jpg (Cutting out the lantern)
[16]: https://opensource.com/sites/default/files/uploads/lantern10.jpg (Adding tracing paper)
[17]: https://opensource.com/sites/default/files/uploads/lantern11.jpg (Completed lantern)
