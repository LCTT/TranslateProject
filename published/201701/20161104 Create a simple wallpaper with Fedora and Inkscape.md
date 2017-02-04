使用 Fedora 和 Inkscape 制作一张简单的壁纸
================

![inkscape-wallpaper](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-wallpaper-945x400.png) 

在先前的两篇 Inkscape 的文章中，我们已经[介绍了 Inkscape 的基本使用、创建对象][18]以及[一些基本操作和如何修改颜色。][17]

在接下来的介绍中，我们会集合这些新的技巧，并且创建我们的第一个作品 —— 一张简单的壁纸。

### 更改文档大小

回顾先前的教程时，你可能会注意到主画板上的默认文档尺寸是一个黑色边框的矩形。Inkscape 中默认文档的大小是 A4 纸大小：

[
 ![Screenshot from 2016-09-07 08-37-01](https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-08-37-01.png) 
][16]

对于这张壁纸而言，我们会将尺寸改为**1024px x 768px**。要改变文档的尺寸，进入`File` > `Document Properties...`。在<ruby>文档属性<rt>Document Properties</rt></ruby>对话框中<ruby>自定义文档大小<rt>Custom Size</rt></ruby>区域中输入宽度为 `1024`，高度为 `768` ，单位是 `px`：

[
 ![Screenshot from 2016-09-07 09-00-00](https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-00-00.png) 
][15]

页面上文档的轮廓大概像这样：

[
 ![Screenshot from 2016-09-07 09-01-03](https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-01-03.png) 
][14]

### 绘画背景

接下来，我们会画一个和文档一样大的矩形。因此选择**<ruby>矩形工具<rt>rectangle tool</rt></ruby>**来画一个矩形，并使用<ruby>工具控制栏<rt>Tools Control bar</rt></ruby>来调整矩形的大小。

[
 ![rect](https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/rect.png) 
][13]

接着在矩形中添加一个<ruby>渐变填充<rt>Gradient Fill</rt></ruby>。如果你需要复习添加渐变，请阅读先前添加色彩的[那篇文章][12]。

[
 ![Screenshot from 2016-09-07 09-41-13](https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-41-13.png) 
][11]

你的矩形也可以设置轮廓颜色。 使用<ruby>填充和轮廓<rt> Fill and Stroke</rt></ruby>对话框将轮廓设置为 **none**。

[
 ![Screenshot from 2016-09-07 09-44-15](https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-44-15.png) 
][10]

### 绘制图样

接下来我们画一个三角形，使用 3 个顶点的星型/多边形工具。你可以按住 `CTRL` 键给三角形一个角度并使之对称。

[
 ![Screenshot from 2016-09-07 09-52-38](https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-52-38.png) 
][9]

选中三角形并按下 `CTRL+D` 来复制它（复制的图形会覆盖在原来图形的上面），**因此在复制后确保将它移动到别处。**

[
 ![Screenshot from 2016-09-07 10-44-01](https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-10-44-01.png) 
][8]

如图选中一个三角形，进入`Object` > `FLIP-HORIZONTAL`（水平翻转）。

[
 ![Screenshot from 2016-09-07 09-57-23](https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-57-23.png) 
][7][
 ![Screenshot from 2016-09-07 09-57-42](https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-57-42.png) 
][6]

为这三个三角形重新着色。让它看上去和背景和谐。

[
 ![Screenshot from 2016-09-07 09-58-52](https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-58-52.png) 
][5]

选中所有的三角形并复制，以填充你的样式：

[
 ![Screenshot from 2016-09-07 10-49-25](https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-10-49-25.png) 
][4]

### 导出背景

最后，我们需要将我们的文档导出为 PNG 文件。点击 `File` > `EXPORT PNG`，打开导出对话框，选择文件位置和名字，确保选中的是 `Drawing` 标签，并点击 `EXPORT`。

[
 ![Screenshot from 2016-09-07 11-07-05](https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-11-07-05-1.png) 
][3]

不要让工具成为你想象力的障碍。来制作美丽的壁纸并提交你的设计到 [FEDORA 25 壁纸][2]上来吧。你的设计或许会幸运地被选中成为上千万用户的壁纸。下面是用  Inkscape 和上面提到的技术制作的一些壁纸示例：

[
 ![back1](https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/back1.png) 
][1]
 ![back2](https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/back2.png)

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/inkscape-design-imagination/

作者：[a2batic][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://a2batic.id.fedoraproject.org/
[1]:https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/back1.png
[2]:https://fedoramagazine.org/keeping-fedora-beautiful-contribute-wallpaper/
[3]:https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-11-07-05-1.png
[4]:https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-10-49-25.png
[5]:https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-58-52.png
[6]:https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-57-42.png
[7]:https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-57-23.png
[8]:https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-10-44-01.png
[9]:https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-52-38.png
[10]:https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-44-15.png
[11]:https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-41-13.png
[12]:https://linux.cn/article-8084-1.html
[13]:https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/rect.png
[14]:https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-01-03.png
[15]:https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-09-00-00.png
[16]:https://1504253206.rsc.cdn77.org/wp-content/uploads/2016/10/Screenshot-from-2016-09-07-08-37-01.png
[17]:https://linux.cn/article-8084-1.html
[18]:https://linux.cn/article-8079-1.html
[19]:https://fedoramagazine.org/inkscape-design-imagination/
