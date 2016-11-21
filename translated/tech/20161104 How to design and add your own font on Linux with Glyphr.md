# 在Linux上使用Glyphr设计自己的字体

LibreOffice 提供了丰富的字体, 并且用户可以自由选择和下载增加自己的字体.即使你想创造自己的字体, 同样也可以非常简单的使用Glyphr创建.Glyphr可以直观的新开源字体设计器, 使用简单的交互界面和覆盖字体设计每一部分的强大功能集.虽然应用还在早起开发阶段, 但是这已经很强大了. 下面将会有一个简短的快速入门教你如何使用Glyphr创建字体并加入LibreOffice.

首先, 从官方Git库下载Glyphr([https://github.com/glyphr-studio/Glyphr-Studio-Desktop][14]). 它提供32位和64位版本.完成下载后, 进入下载文件夹, 解压文件, 进入解压文件, 右键点击Glyphr Studio, 选择"Run".

[
 ![](https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/pic_1.png) 
][13]

启动应用后会给你三个选项.一个是从头创建一个新的字体集. 第二个是读取已经存在的项目,可以是Glyphr Studio项目文件, 也可以是其他开源或ttf, 甚至是SVG字体.第三个是读取已有示例,然后可以在示例上修改创建.我将会选择第一个选项,并教你一些简单的设计概念.

[
 ![](https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/pic_2.png) 
][12]

完成进入编辑界面后, 你可以从左边的面板中选择字母,然后在右边的区域设计. 我选择A字母开始编辑.

[
 ![](https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/pic_3.png) 
][11]

要在绘图板上设计一些东西，我们可以从板的左上角选择矩形，椭圆形或者路径共享的“形状”工具，也可以使用工具的第二行的第一项的路径编辑工具。使用任意工具，开始在板上放点来创建形状。添加的点数越多, 接下来设计的形状选项就越大。

[
 ![](https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/pic_4.png) 
][10]

点移动到不同位置可以获得不同的路径, 可以使用路径编辑工具右边的路径编辑,点击会出现可编辑点.然后拖到任意点到你喜欢的位置.

[
 ![](https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/pic_5.png) 
][9]

最后，形状编辑工具帮助选择形状并将其拖动到位置，更改其尺寸以及旋转。

[
 ![](https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/pic_6.png) 
][8]

在进入了字母设计阶段,其他有用的设计动作集合是左侧面板提供的复制-粘贴, 翻转-旋转操作.来看个例子,假设我现在正在创作B字母,  我要下部分镜像已经创建好的上部分一样,保持良好的水平和一致性.

[
 ![](https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/pic_7.png) 
][7]

现在, 为了达到这个目的, 选择形状编辑工具, 选中欲编辑部分, 点击复制操作, 然后点击图形以外的地方, 在需要的位置粘贴,加上水平翻转或者垂直翻转到达目的.

[
 ![](https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/pic_8.png) 
][6]

[
 ![](https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/pic_9.png) 
][5]

这款应用在太多地方可以讲述.如果有兴趣深入,可以深入了解数字话编辑,弯曲和引导等等.

然而,字体并不是仅仅是单个字体的设计, 还需要发现字体设计的其他方面.通过应用左上角菜单栏上的"导航"还可以设置字间距, 斜体, 常规字体设置等.

[
 ![](https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/pic_10.png) 
][4]

最棒的是你可以使用"测试驱动"来使用你的新字体, 帮助你判断字体设计如何, 间距对不对, 最大化来优化你的字体.

[
 ![](https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/pic_11.png) 
][3]

完成设计和优化后, 我们还可以导出ttf和svg格式.

[
 ![](https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/pic_12.png) 
][2]

将新的字体加入到系统中, 打开字体浏览器并点击"安装"按钮. 如果它没有任何反应, 可以在主目录下创建一个新的文件夹叫做".fonts",并将字体复制进去.也可以使用root用户打开文件管理器, 进入/usr/share/fonts/opentype, 穿件一个新的文件夹并粘贴新的文件.然后打开终端,输入命令重建字体缓存"sudo fc-cache -f -v"

在LibreOffice中已经可以看见新的字体咯, 同样也可以使用Gedit来测试新字体.

[
 ![](https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/pic_13.png) 
][1]

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-design-and-add-your-own-font-on-linux-with-glyphr/

作者：[Bill Toulas][a]

译者：[VicYu/Vic020](http://vicyu.net)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/howtoforgecom
[1]:https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/big/pic_13.png
[2]:https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/big/pic_12.png
[3]:https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/big/pic_11.png
[4]:https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/big/pic_10.png
[5]:https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/big/pic_9.png
[6]:https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/big/pic_8.png
[7]:https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/big/pic_7.png
[8]:https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/big/pic_6.png
[9]:https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/big/pic_5.png
[10]:https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/big/pic_4.png
[11]:https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/big/pic_3.png
[12]:https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/big/pic_2.png
[13]:https://www.howtoforge.com/images/how-to-design-and-add-your-own-font-on-linux-with-glyphr/big/pic_1.png
[14]:https://github.com/glyphr-studio/Glyphr-Studio-Desktop
