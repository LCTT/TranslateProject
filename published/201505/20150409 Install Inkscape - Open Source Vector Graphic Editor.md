Inkscape - 开源适量图形编辑器
================================================================================
Inkscape是一款开源矢量图形编辑工具，并不同于Xara X、Corel Draw和Adobe Illustrator等竞争对手，它使用的是可缩放矢量图形(SVG)图形格式。SVG是一个广泛部署、免版税使用的图形格式，由W3C SVG工作组开发和维护。这是一个跨平台工具，完美运行于Linux、Windows和Mac OS上。

Inkscape始于2003年，起初它的bug跟踪系统托管于Sourceforge上，但是后来迁移到了Launchpad上。当前它最新的一个稳定版本是0.91，它不断地在发展和修改中。我们将在本文里了解一下它的突出特点和安装过程。

### 显著特性 ###

让我们直接来了解这款应用程序的显著特性。

#### 创建对象 ####

- 用铅笔工具来画出不同颜色、大小和形状的手绘线，用贝塞尔曲线（笔式）工具来画出直线和曲线，通过书法工具来应用到手写的书法笔画上等等
- 用文本工具来创建、选择、编辑和格式化文本。在纯文本框、在路径上或在形状里操作文本
- 方便绘制各种形状，像矩形、椭圆形、圆形、弧线、多边形、星形和螺旋形等等并调整其大小、旋转并修改（圆角化）它们
- 用简单地命令创建并嵌入位图

#### 对象处理 ####

- 通过交互式操作和调整参量来扭曲、移动、测量、旋转目标
- 可以对 Z 轴进行提升或降低操作。
- 通过对象组合和取消组合可以创建一个虚拟层用来编辑或处理
- 图层采用层次结构树的结构，并且能锁定或以各式各样的处理方式来重新布置
- 分布与对齐指令

#### 填充与边框 ####

- 可以复制/粘贴不同风格
- 取色工具
- 用RGB, HSL, CMS, CMYK和色盘这四种不同的方式选色
- 渐变层编辑器能创建和管理多停点渐变层
- 使用图像或其它选择区作为花纹填充
- 用一些预定义点状花纹进行笔触填充
- 通过路径标示器标示开始、对折和结束点

#### 路径上的操作 ####

- 节点编辑：移动节点和贝塞尔曲线控制点，节点的对齐和分布等等
- 布尔运算（是或否）
- 运用可变的路径起迄点可简化路径
- 路径插入和增设连同动态和链接偏移对象
- 通过路径追踪把位图图像转换成路径(彩色或单色路径）

#### 文本处理 ####

- 所有安装好的框线字体都能用，甚至可以从右至左对齐对象
- 格式化文本、调整字母间距、行间距或列间距
- 路径上和形状上的文本中的文本、路径或形状都可以被编辑和修改

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

Inkscape是一款特点鲜明的图形编辑工具，它给予用户充分发挥自己艺术能力的权利。它还是一款自由安装和自定义的开源应用，并且支持各种文件类型，包括JPEG, PNG, GIF和PDF及更多。访问它的 [官方网站][2] 来获取更多新闻和应用更新。

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-inkscape-open-source-vector-graphic-editor/

作者：[Aun Raza][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/
[1]:https://launchpad.net/~inkscape.dev/+archive/ubuntu/stable
[2]:https://inkscape.org/en/
