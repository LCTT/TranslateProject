安装Inkscape - 开源适量图形编辑器
================================================================================
Inkscape是一款开源矢量图形编辑工具，它使用可缩放矢量图形(SVG)图形格式并不同于它的竞争对手如Xara X、Corel Draw和Adobe Illustrator等等。SVG是一个广泛部署、免版税使用的图形格式，由W3C SVG工作组开发和维护。这是一个跨平台工具，完美运行于Linux、Windows和Mac OS上。

Inkscape始于2003年，起初它的bug跟踪系统托管于Sourceforge上但是 后来迁移到了Launchpad上。当前它最新的一个稳定版本是0.91，它不断地在发展和修改中。我们将在本文里了解一下它的突出特点和安装过程。

### 显著特性 ###

让我们直接来了解这款应用程序的显著特性。

#### 创建对象 ####

- Drawing different colored sized and shaped freehand lines through pencil tool, straight lines and curves through Bezier (pen) tool, applying freehand calligraphic strokes through calligraphic tool etc
- Creating, selecting, editing and formatting text through text tool. Manipulating text in plain text boxes, on paths or in shapes
- Helps draw various shapes like rectangles, ellipses, circles, arcs, polygons, stars, spirals etc and then resize, rotate and modify (turn sharp edges round) them
- Create and embed bitmaps with simple commands

#### 对象处理 ####

- 通过交互式操作和调整数值来扭曲、移动、测量、旋转目标
- 执行力提升并减少了Z-order操作。
- 对象组群化或取消组群化可以去创建一个虚拟层阶用来编辑或处理
- 图层采用层次结构树的结构并且能锁定或以各式各样的处理方式来重新布置
- 分布与对齐指令

#### 填充与边框 ####

- 复制/粘贴风格
- 取色器
- Selecting colors on a continuous plot based on vectors of RGB, HSL, CMS, CMYK and color wheel
- Gradient editor helps creating and managing multi-stop gradients
- Define an image or selection and use it to pattern fill
- Dashed Strokes can be used with few predefined dashed patterns
- Beginning, middle and ending marks through path markers

#### 路径上的操作 ####

- Node Editing: Moving nodes and Bezier handles, node alignment and distribution etc
- Boolean operations like yes or no conditions
- Simplifying paths with variable levels or thresholds
- Path insetting and outsetting along with link and offset objects
- Converting bitmap images into paths (color and monochrome paths) through path tracing

#### 文本处理 ####

- All installed outlined fonts can be used even for right to left align objects
- Formatting text, letter spacing, line spacing or kerning
- Text on path and on shapes where both text and path or shapes can be edited or modified

#### 渲染 ####

- Inkscape fully support anti-aliased display which is a technique that reduces or eliminates aliasing by shading the pixels along the border.
- Support for alpha transparency display and PNG export

### 在Ubuntu 14.04和14.10上安装Inkscape ###

In order to install Inkscape on Ubuntu, we will need to first [add its stable Personal Package Archive][1] (PPA) to Advanced Package Tool (APT) repository. Launch the terminal and run following command to add its PPA.

     sudo add-apt-repository ppa:inkscape.dev/stable

![PPA Inkscape](http://blog.linoxide.com/wp-content/uploads/2015/03/PPA-Inkscape.png)

Once the PPA has been added to the APT repository we need to update it using following command.

     sudo apt-get update

![Update APT](http://blog.linoxide.com/wp-content/uploads/2015/03/Update-APT2.png)

After updating the repository we are ready to install inkscape which is accomplished using the following command.

     sudo apt-get install inkscape

![Install Inkscape](http://blog.linoxide.com/wp-content/uploads/2015/03/Install-Inkscape.png)

Congratulation, Inkscape has been installed now and all set for image editing and making full use of feature rich application.

![Inkscape Main](http://blog.linoxide.com/wp-content/uploads/2015/03/Inkscape-Main1.png)

### 结论 ###

Inkscape is a feature rich graphic editing tool which empowers its user with state of the art capabilities. It is an open source application which is freely available for installation and customizations and supports wide range of file formats including but not limited to JPEG, PNG, GIF and PDF. Visit its [official website][2] for more news and updates regarding this application.

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-inkscape-open-source-vector-graphic-editor/

作者：[Aun Raza][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/
[1]:https://launchpad.net/~inkscape.dev/+archive/ubuntu/stable
[2]:https://inkscape.org/en/
