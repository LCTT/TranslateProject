[#]: collector: "lujun9972"
[#]: translator: "zianglei"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-11108-1.html"
[#]: subject: "Make an RGB cube with Python and Scribus"
[#]: via: "https://opensource.com/article/19/7/rgb-cube-python-scribus"
[#]: author: "Greg Pittman https://opensource.com/users/greg-p/users/greg-p"

使用 Python 和 Scribus 创建一个 RGB 立方体
======

> 使用 Scribus 的 Python 脚本编写器功能，开发一个显示 RGB 色谱的 3D 立方体。

![cubes coming together to create a larger cube][1]

当我决定这个夏天要玩色彩游戏时，我想到通常色彩都是在色轮上描绘的。这些色彩通常都是使用色素而不是光，并且你失去了任何对颜色亮度或光度变化的感觉。

作为色轮的替代，我想在立方体表面使用一系列图形来显示 RGB 频谱。色彩的 RGB 值将在具有 X、Y、Z 轴的三维图形上展示。例如，一个平面将会保持 B（蓝色）为 0，其余的坐标轴将显示当我将 R（红色）和 G （绿色）的值从 0 绘制到 255 时发生的情况。

事实证明，使用 [Scribus][2] 及其 [Python 脚本编写器][3] 功能实现这一点并不困难。我可以创建 RGB 颜色，使矩形显示颜色，并以 2D 格式排列它们。我决定设置颜色值的间隔为 5，并让矩形按 5 个点（pt）进行绘图。因此，对于每个 2D 图形，我将使用大约 250 种颜色，立方体的一个边有 250 个点（pt），也就是 3.5 英寸。

我使用下面这段 Python 代码完成了绿 - 红图的任务：

```python
x = 300
y = 300
r = 0
g = 0
b = 0

if scribus.newDoc(scribus.PAPER_LETTER, (0,0,0,0),scribus.PORTRAIT, 1,                  scribus.UNIT_POINTS, scribus.NOFACINGPAGES, scribus.FIRSTPAGERIGHT):
    while r < 256:
        while g < 256:
            newcolor = str(r) + '_' + str(g) + '_' + str(b)
            if newcolor == '0_0_0':
                newcolor = 'Black'
            scribus.defineColorRGB(newcolor,r, g, b)
            rect = scribus.createRect(x + g, y, 5, 5)
            scribus.setFillColor(newcolor, rect)
            scribus.setLineColor(newcolor, rect)
            g = g + 5
        g = 0
        r = r + 5
        y = y – 5
```

这个脚本在 `300,300` 位置开始绘制图形，这个位置大约是一个美国信件大小的纸张的水平中心，大概是垂直方向从顶部到底的三分之一位置；这是图像的原点，然后它沿着 X 轴（绿色值）水平构建图形，然后返回到 Y 轴，向上移动 5 个点，然后绘制下一条矩形线。

![Red-Green graph][4]

这看起来很简单；我只需要调整一下数字就可以把立方体的另一面画出来。但这不仅仅是再画两个图，一个是蓝 - 绿色，另一个是红 - 蓝色的问题。我想创建一个展开的立方体，这样我就可以打印、剪开然后折叠它，创建一个 RGB 的 3D 视图。因此，下一部分（向下的页面）的原点（黑色的角落）需要在左上角，其水平方向是绿色，垂直方向是蓝色。

“调整数字”最终或多或少变成了试错，从而得到我想要的东西。在创建了第二个图之后，我需要第三个图，它是红 - 蓝色的，原点位于左上角，红色向左递增，蓝色向下递增。

下面是最终效果图：

![First half of RGB cube][5]

当然，这只是这个立方体的前半部分。我需要做一个类似的形状，除了原点应该是白色（而不是黑色）来表示高值。这是我希望自己更聪明的时候之一，因为我不仅需要做出一个类似的整体形状，还需要以镜像的方式与第一个形状交互（我认为）。有时候，尝试和错误是你唯一的朋友。

结果是这样的；我使用了一个单独的脚本，因为在一个美国信件大小的页面上没有足够的空间同时容纳这两个图案。

![Second half of RGB cube][6]

现在，是时候轮到打印机了！在这里，你可以直观了解彩色打印机如何处理 RGB 颜色到 CMYK 颜色的转换以及打印颜色密集空间。

接下来，朋友们，是剪切粘贴时间！我可以用胶带，但我不想改变表面的外观，所以我在切割的时候在两边留下了一些空间，这样我就可以把它们粘在里面了。根据我的经验，在复印纸上打印会产生一些不需要的皱纹，所以在我的复印纸原型完成后，我把立方体打印在了更厚的纸上，表面是哑光的。

![RGB cubes][7]

请记住，这只是 RGB 空间边界的一个视图；更准确地说，你必须做出一个可以在中间切片的实心立方体。例如，这是一个实心 RGB 立方体在蓝色 = 120 的切片。

![RGB cube slice][8]

最后，我做这个项目很开心。如果您也想参与其中，这里有两个脚本。

这是前半部分：

```python
#!/usr/bin/env python
# black2rgb.py
"""
Creates one-half of RGB cube with Black at origin
"""

import scribus

x = 300
y = 300
r = 0
g = 0
b = 0

if scribus.newDoc(scribus.PAPER_LETTER, (0,0,0,0),scribus.PORTRAIT, 1, scribus.UNIT_POINTS, scribus.NOFACINGPAGES, scribus.FIRSTPAGERIGHT):
    while r < 256:
        while g < 256:
            newcolor = str(r) + '_' + str(g) + '_' + str(b)
            if newcolor == '0_0_0':
                newcolor = 'Black'
            scribus.defineColorRGB(newcolor,r, g, b)
            rect = scribus.createRect(x + g, y, 5, 5)
            scribus.setFillColor(newcolor, rect)
            scribus.setLineColor(newcolor, rect)
            g = g + 5
        g = 0
        r = r + 5
        y = y - 5
       
    r = 0
    g = 0
    y = 305

    while b < 256:
        while g < 256:
            newcolor = str(r) + '_' + str(g) + '_' + str(b)
            if newcolor == '0_0_0':
                newcolor = 'Black'
            scribus.defineColorRGB(newcolor,r, g, b)
            rect = scribus.createRect(x + g, y, 5, 5)
            scribus.setFillColor(newcolor, rect)
            scribus.setLineColor(newcolor, rect)
            g = g + 5
        g = 0
        b = b + 5
        y = y + 5
       
    r = 255
    g = 0
    y = 305
    x = 39
    b = 0

    while b < 256:
        while r >= 0:
            newcolor = str(r) + '_' + str(g) + '_' + str(b)
            if newcolor == '0_0_0':
                newcolor = 'Black'
            scribus.defineColorRGB(newcolor,r, g, b)
            rect = scribus.createRect(x, y, 5, 5)
            scribus.setFillColor(newcolor, rect)
            scribus.setLineColor(newcolor, rect)
            r = r - 5
            x = x+5
        b = b + 5
        x = 39.5
        r = 255
        y = y + 5
       
scribus.setRedraw(True)
scribus.redrawAll()
```

后半部分：


```python
#!/usr/bin/env python
# white2rgb.py
"""
Creates one-half of RGB cube with White at origin
"""

import scribus

x = 300
y = 300
r = 255
g = 255
b = 255

if scribus.newDoc(scribus.PAPER_LETTER, (0,0,0,0),scribus.PORTRAIT, 1, scribus.UNIT_POINTS, scribus.NOFACINGPAGES, scribus.FIRSTPAGERIGHT):
    while g >= 0:
        while r >= 0:
            newcolor = str(r) + '_' + str(g) + '_' + str(b)
            if newcolor == '255_255_255':
                newcolor = 'White'
            scribus.defineColorRGB(newcolor,r, g, b)
            rect = scribus.createRect(x + 255 - r, y, 5, 5)
            scribus.setFillColor(newcolor, rect)
            scribus.setLineColor(newcolor, rect)
            r = r - 5
        r = 255
        g = g - 5
        y = y - 5
       
    r = 255
    g = 255
    y = 305

    while b >= 0:
        while r >= 0:
            newcolor = str(r) + '_' + str(g) + '_' + str(b)
            if newcolor == '255_255_255':
                newcolor = 'White'
            scribus.defineColorRGB(newcolor,r, g, b)
            rect = scribus.createRect(x + 255 - r, y, 5, 5)
            scribus.setFillColor(newcolor, rect)
            scribus.setLineColor(newcolor, rect)
            r = r - 5
        r = 255
        b = b - 5
        y = y + 5
       
    r = 255
    g = 0
    y = 305
    x = 39
    b = 255

    while b >= 0:
        while g < 256:
            newcolor = str(r) + '_' + str(g) + '_' + str(b)
            if newcolor == '255_255_255':
                newcolor = 'White'
            scribus.defineColorRGB(newcolor,r, g, b)
            rect = scribus.createRect(x + g, y, 5, 5)
            scribus.setFillColor(newcolor, rect)
            scribus.setLineColor(newcolor, rect)
            g = g + 5
        g = 0
        b = b - 5
        y = y + 5
       
scribus.setRedraw(True)
scribus.redrawAll()
```

由于我创建了大量的颜色，所以当看到 Scribus 文件比我用它创建的 PDF 文件大得多的时候，我并不感到惊讶。例如，我的 Scribus SLA 文件是 3.0MB，而从中生成的 PDF 只有 70KB。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/rgb-cube-python-scribus

作者：[Greg Pittman][a]
选题：[lujun9972][b]
译者：[zianglei](https://github.com/zianglei)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux 中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greg-p/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cube_innovation_process_block_container.png?itok=vkPYmSRQ "cubes coming together to create a larger cube"
[2]: https://www.scribus.net/
[3]: https://opensource.com/sites/default/files/ebooks/pythonscriptingwithscribus.pdf
[4]: https://opensource.com/sites/default/files/uploads/redgreengraph.png "Red-Green graph"
[5]: https://opensource.com/sites/default/files/uploads/rgbcubefirsthalf.png "First half of RGB cube"
[6]: https://opensource.com/sites/default/files/uploads/rgbcubesecondhalf.png "Second half of RGB cube"
[7]: https://opensource.com/sites/default/files/uploads/rgbcubecompositephoto.png "RGB cubes"
[8]: https://opensource.com/sites/default/files/uploads/rgbcubeslice.png "RGB cube slice"
