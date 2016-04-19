# 在NASA中使用开源工具进行图像处理

关键词：NASA，图像处理，Node.js，OpenCV

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/nasa_spitzer_space_pink_spiral.jpg?itok=3XEUstkl)

这个已逝的夏天，我是位于格伦的 [NASA](http://www.nasa.gov/centers/glenn/home/index.html) [GVIS](https://ocio.grc.nasa.gov/gvis/) 实验室的研究生，我将我对开源的热情带到了那里。我的任务是提高我们实验室对 Dan Schroeder 开发的一个开源流体动力学模拟器的贡献。原本的模拟器为用户呈现出可以用鼠标绘制的障碍，用来计算流体动力学模型。我们团队的贡献是加入图像处理的代码，这些代码分析实况视频的每一帧以显示一个物体如何与液体相互作用。而且，我们还要做更多事情。

我们想要让图像处理部分更加健全，所以我致力于改善图像处理库。

基于新的库，模拟器可以检测轮廓、进行空间坐标变换以及找到物体的质心。图像处理并不直接与流体动力学模拟器物理相关。它用摄像头检测物体，并且获取物体轮廓，为流体模拟器创建一个障碍物。然后，流体模拟器启动，输出结果会被投射到真实物体上。

我的目标是通过以下三种方式改进模拟器：

1. 找寻物体的轮廓
2. 找寻物体的质心
3. 能对物体中心进行相关的精确转换

我的导师建议我安装 [Node.js](http://nodejs.org/), [OpenCV](http://opencv.org/), 和 [Node.js bindings for OpenCV](https://github.com/peterbraden/node-opencv).。在等待软件安装的过程中，我查看了 OpenCV 的  [GitHub 主页](https://github.com/peterbraden/node-opencv)  上的示例源码。我发现示例源码使用 JavaScript 写的，而我还不懂 JavaScript ，所以我在 Codecademy 上学了一些课程。两天后，我对 JavaScript 依旧生疏，不过我还是开始了我的项目。。。它包含了更多的JavaScript。

示例的轮廓检测代码工作得很好。事实上，它使得我用几个小时就完成了第一个目标！为了获取一幅图片的轮廓，它看起来像这样：

![](https://opensource.com/sites/default/files/resize/image_processing_nasa_1-520x293.jpg)

> 包括所有轮廓的原始图，

示例的检测轮廓的代码工作得有点好过头了。不仅物体的轮廓被检测到了，整个图片中的轮廓都检测到了。这会导致模拟器要与那些没用的轮廓打交道。这是一个严重的问题，因为它会返回错误的数据。为了避免模拟器接触到不想要的轮廓，我加了一个区域约束。轮廓要位于一定的区域范围内才会被画出来。区域约束使得轮廓变干净了。

![](https://opensource.com/sites/default/files/resize/image_processing_nasa_2-520x293.jpg)

> 过滤后的轮廓，包含了阴影轮廓

虽然无关的轮廓没有了，但是图像还有个问题。图像本该只有一个轮廓，但是它来回绕了自己两次，没有完整地圈起来。区域在这里不能作为决定因素，所以必须试试其他方式。

这一次，我不是直接去找寻轮廓，而是先将图片转换成二值图。二值图是转换之后只有黑白像素的图片。为了获取到二值图我先把彩色图转成灰度图。转换之后我再用阈值函数对图片进行处理。阈值函数遍历图片每个像素点的值，如果值小于 30 ，像素的颜色就会改成黑色。否则则反。在原始图片转换成二值图之后，结果变成这样：

![](https://opensource.com/sites/default/files/resize/image_processing_nasa_3-520x293.jpg)

> 二值图。

然后我获取了二值图的轮廓，结果是一个更干净的轮廓，没有了阴影轮廓。

![](https://opensource.com/sites/default/files/image_processing_nasa_4.jpg)

> 最后的干净轮廓。

这个时候，我可以获取干净的轮廓、计算质心了。可惜的是，我没有足够的时间去完成质心的相关变换。因为我的实习时间不多了，我开始考虑我在这段有限时间内能做的其它事情。其中一个就是边界矩形。边界矩形是包含了图片轮廓的最小四边形。边界矩形很重要，因为它是在页面上缩放轮廓的关键。虽然很遗憾我没时间利用边界矩形做更多事情，但是我仍然想去了解更多，因为这是个很有用的工具。

最后，经过以上的努力，我完成了对图像的处理！

![](https://opensource.com/sites/default/files/resize/image_processing_nasa_5-521x293.jpg)

> 最后图像，红色的边界矩形和质心。

当这些图像处理代码写完之后，我用我的代码替代了模拟器中的老代码。非常意外的，它可以工作。

嗯，基本可以。

程序有内存泄露，每 1/10 秒泄露 100MB 。我很高兴原因不是我的代码。坏消息是修复它并不是我能控制的。好消息是有个解决方法我可以使用。它并不是最理想的，方法是不断检查模拟器使用的内存，当使用内存超过 1 GB，重新启动模拟器。

在 NASA 实验室，我们使用很多的开源软件，没有这些开源软件的帮助，我不可能完成这些工作。

* * *

via: [https://opensource.com/life/16/3/image-processing-nasa](https://opensource.com/life/16/3/image-processing-nasa)

作者：[Lauren Egts](https://opensource.com/users/laurenegts)
译者：[willowyoung](https://github.com/willowyoung)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
