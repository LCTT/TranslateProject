安装Inkscape - 开源适量图形编辑器
================================================================================
Inkscape是一款开源矢量图形编辑工具，它使用可缩放矢量图形(SVG)图形格式并不同于它的竞争对手如Xara X、Corel Draw和Adobe Illustrator等等。SVG是一个广泛部署、免版税使用的图形格式，由W3C SVG工作组开发和维护。这是一个跨平台工具，完美运行于Linux、Windows和Mac OS上。

Inkscape始于2003年，起初它的bug跟踪系统托管于Sourceforge上但是 后来迁移到了Launchpad上。当前它最新的一个稳定版本是0.91，它不断地在发展和修改中。我们将在本文里了解一下它的突出特点和安装过程。

### 显著特性 ###

让我们直接来了解这款应用程序的显著特性。

#### 创建对象 ####

- 用铅笔工具来画出不同颜色、大小和形状的手绘线，用贝塞尔曲线（笔式）工具来画出直线和曲线，通过书法工具来应用到手写的书法笔画上等等
- 用文本工具来创建、选择、编辑和格式化文本。在纯文本框、在路径上或在形状里操作文本
- 有效绘制各种形状，像矩形、椭圆形、圆形、弧线、多边形、星形和螺旋形等等并调整其大小、旋转并修改（圆角化）它们
- 用简单地命令创建并嵌入位图

#### 对象处理 ####

- 通过交互式操作和调整数值来扭曲、移动、测量、旋转目标
- 执行力提升并减少了Z-order操作。
- 对象群组化或取消群组化可以去创建一个虚拟层阶用来编辑或处理
- 图层采用层次结构树的结构并且能锁定或以各式各样的处理方式来重新布置
- 分布与对齐指令

#### 填充与边框 ####

- 复制/粘贴风格
- 取色工具
- 用RGB, HSL, CMS, CMYK和色盘这四种不同的方式选色
- 渐层编辑器能创建和管理多停点渐层
- 定义一个图像或其它选择用来进行花纹填充
- 用一些预定义泼洒花纹可对边框进行花纹泼洒
- 通过路径标示器来开始、对折和结束标示

#### 路径上的操作 ####

- 节点编辑：移动节点和贝塞尔曲线掌控，节点的对齐和分布等等
- 布尔运算（是或否）
- 运用可变的路径起迄点可简化路径
- 路径插入和增设连同动态和链接偏移对象
- 通过路径追踪把位图图像转换成路径(彩色或单色路径）

#### 文本处理 ####

- 所有安装好的外框字体都能用甚至可以从右至左对齐对象
- 格式化文本、调整字母间距、行间距或列间距
- 路径上的文本和形状上的文本和路径或形状都可以被编辑和修改

#### 渲染 ####

- Inkscape完全支持抗锯齿显示，这是一种通过柔化边界上的像素从而减少或消除凹凸锯齿的技术。
- 支持alpha透明显示和PNG格式图片的导出

### 在Ubuntu 14.04和14.10上安装Inkscape ###

为了在Ubuntu上安装Inkscape，我们首先需要 [添加它的稳定版Personal Package Archive][1] (PPA) 至Advanced Package Tool (APT) 库中。打开终端并运行一下命令来添加它的PPA：

     sudo add-apt-repository ppa:inkscape.dev/stable

![PPA Inkscape](http://blog.linoxide.com/wp-content/uploads/2015/03/PPA-Inkscape.png)

PPA添加到APT库中后，我们要用以下命令进行更新：

     sudo apt-get update

![Update APT](http://blog.linoxide.com/wp-content/uploads/2015/03/Update-APT2.png)

更新好库之后，我们准备用以下命令来完成安装：

     sudo apt-get install inkscape

![Install Inkscape](http://blog.linoxide.com/wp-content/uploads/2015/03/Install-Inkscape.png)

恭喜，现在Inkscape已经被安装好了，我们可以充分利用它的丰富功能特点来编辑制作图像了。

![Inkscape Main](http://blog.linoxide.com/wp-content/uploads/2015/03/Inkscape-Main1.png)

### 结论 ###

Inkscape是一款特点鲜明的图形编辑工具，它给予用户充分发挥自己艺术力的权利。它还是一款自由安装和自定义开源应用并且支持大范围文件类型包括JPEG, PNG, GIF和PDF且不仅这些。访问它的 [官方网站][2] 来获取更多新闻和应用更新。

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-inkscape-open-source-vector-graphic-editor/

作者：[Aun Raza][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/
[1]:https://launchpad.net/~inkscape.dev/+archive/ubuntu/stable
[2]:https://inkscape.org/en/
