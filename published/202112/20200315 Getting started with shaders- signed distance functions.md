[#]: collector: (lujun9972)
[#]: translator: (Starryi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14107-1.html)
[#]: subject: (Getting started with shaders: signed distance functions!)
[#]: via: (https://jvns.ca/blog/2020/03/15/writing-shaders-with-signed-distance-functions/)
[#]: author: (Julia Evans https://jvns.ca/)

着色器入门：符号距离函数！
======

![](https://img.linux.net.cn/data/attachment/album/202112/22/162653fn58ajqa6d65e8f5.jpg)

大家好！不久前我学会了如何使用着色器制作有趣的闪亮旋转八面体：

![][1]

我的着色器能力仍然非常基础，但事实证明制作这个有趣的旋转八面体比我想象中要容易得多（从其他人那里复制了很多代码片段！）。

我在做这件事时， 从一个非常有趣的叫做 [符号距离函数教程：盒子和气球][2] 的教程中学到了“符号距离函数”的重要思路。

在本文中，我将介绍我用来学习编写简单着色器的步骤，并努力让你们相信着色器并不难入门！

### 更高级着色器的示例

如果你还没有看过用着色器做的真正有趣的事情，这里有几个例子：

  1. 这个非常复杂的着色器就像一条河流的真实视频：<https://www.shadertoy.com/view/Xl2XRW>
  2. 一个更抽象（更短！）有趣的着色器，它有很多发光的圆圈：<https://www.shadertoy.com/view/lstSzj>

### 步骤一：我的第一个着色器

我知道你可以在 shadertoy 上制作着色器，所以我去了 <https://www.shadertoy.com/new>。它们提供了一个默认着色器，如下图所示：

![][3]

代码如下：

```
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // 规范像素坐标 (从 0 到 1)
    vec2 uv = fragCoord / iResolution.xy;

    // 随时间改变像素颜色
    vec3 col = 0.5 + 0.5 * cos(iTime + uv.xyx + vec3(0, 2, 4));

    // 输出到屏幕
    fragColor = vec4(col, 1.0);
}
```

虽然还没有做什么令人兴奋的事情，但它已经教会了我着色器程序的基本结构！

### 思路：将一对坐标（和时间）映射到一个颜色

这里的思路是获得一对坐标作为输入（`fragCoord`），你需要输出一个 RGBA 向量作为此坐标的颜色。该函数也可以使用当前时间（`iTime`），图像从而可以随时间变化。

这种编程模型（将一对坐标和时间映射到其中）的巧妙之处在于，它非常容易并行化。我对 GPU 了解不多，但我的理解是，这种任务（一次执行 10000 个微不足道的可并行计算）正是 GPU 擅长的事情。

### 步骤二：使用 `shadertoy-render` 加快开发迭代

玩了一段时间的 shadertoy 之后，我厌倦了每次保存我的着色器时都必须在 shadertoy 网站上单击“重新编译”。

我找到了一个名为 [shadertoy-render][4] 命令行工具，它会在每次保存时实时查看文件并更新动画。现在我可以运行：

```
shadertoy-render.py circle.glsl
```

并更快地开发迭代！

### 步骤三：画一个圆圈

接下来我想 —— 我擅长数学！我可以用一些基本的三角学来画一个会弹跳的彩虹圈！

我知道圆的方程为（`x^2 + y^2 = 任意正数`！），所以我写了一些代码来实现它：

![][5]

代码如下：（你也可以 [在 shadertoy 上查看][6]）

```
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // 规范像素坐标 (从 0 到 1)
    vec2 uv = fragCoord / iResolution.xy;
    // 绘制一个中心位置依赖于时间的圆
    vec2 shifted = uv - vec2((sin(iGlobalTime) + 1) / 2, (1 + cos(iGlobalTime)) / 2);
    if (dot(shifted, shifted) < 0.03) {
        // 改变像素颜色
        vec3 col = 0.5 + 0.5 * cos(iGlobalTime + uv.xyx + vec3(0, 2, 4));
        fragColor = vec4(col, 1.0);
    } else {
        // 使圆之外的其他像素都是黑色
        fragColor = vec4(0,0, 0, 1.0);
    }
}
```

代码将坐标向量 `fragCoord` 与自身点积，这与计算 `x^2 + y^2` 相同。我还在这个圆圈的中心玩了一点花活 – 圆心为 `vec2（（sin（iGlobalTime） + 1）/ 2，（1 + cos（faster）） / 2`，这意味着圆心也随着时间沿另一个圆移动。

### 着色器是一种学习数学的有趣方式！

我觉得有意思的（即使我们没有做任何超级高级的事情！）是这些着色器为我们提供了一种有趣的可视化方式学习数学 - 我用 `sin` 和 `cos` 来使某些东西沿着圆移动，如果你想更直观地了解三角函数的工作方式， 也许编写着色器会是一种有趣的方法！

我喜欢的是，可以获得有关数学代码的即时视觉反馈 - 如果你把一些东西乘以 2，图像里的东西会变得更大！或更小！或更快！或更慢！或更红！

### 但是我们如何做一些真正有趣的事情呢？

这个会弹跳的圆圈很好，但它与我见过的其他人使用着色器所做的非常奇特的事情相去甚远。那么下一步要做什么呢？

### 思路：不要使用 if 语句，而是使用符号距离函数！

在我上面的圆圈代码中，我基本上是这样写的：

```
if (dot(uv, uv) < 0.03) {
    // 圆里的代码
} else {
    // 圆外的代码
}
```

但问题（也是我感到卡住的原因）是不清楚如何将它推广到更复杂的形状！编写大量的 `if` 语句似乎不太好用。那人们要如何渲染这些 3d 形状呢？

所以！<ruby>符号距离函数<rt>Signed distance function</rt></ruby> 是定义形状的另一种方式。不是使用硬编码的 `if` 语句，而是定义一个 **函数**，该函数告诉你，对于世界上的任何一个点，该点与你的形状有多远。比如，下面是球体的符号距离函数。

```
float sdSphere( vec3 p, float center )
{
  return length(p) - center;
}
```

符号距离函数非常棒，因为它们：

  * 易于定义！
  * 易于组合！如果你想要一个被切去一块的球体, 你可以用一些简单的数学来计算并集/交集/差集。
  * 易于旋转/拉伸/弯曲！

### 制作旋转陀螺的步骤

当我开始时，我不明白需要编写什么代码来制作一个闪亮的旋转东西。结果表明如下是基本步骤：

  1. 为想要的形状创建一个符号距离函数（在我的例子里是八面体）
  2. 光线追踪符号距离函数，以便可以在 2D 图片中显示它（或沿光线行进？我使用的教程称之为光线追踪，我还不明白光线追踪和光线行进之间的区别）
  3. 编写代码处理形状的表面纹理并使其发光

我不打算在本文中详细解释符号距离函数或光线追踪，因为我发现这个 [关于符号距离函数的神奇教程][2] 非常友好，老实说，它比我做的更好，它解释了如何执行上述 3 个步骤，并且代码有大量的注释，非常棒。

  * 该教程名为“符号距离函数教程：盒子和气球”，它在这里：<https://www.shadertoy.com/view/Xl2XWt>
  * 这里有大量符号距离函数，你可以将其复制粘贴到代码中（以及组合它们以制作其他形状的方法）：<http://www.iquilezles.org/www/articles/distfunctions/distfunctions.htm>

### 步骤四：复制教程代码并开始更改内容

我在这里使用了久负盛名的编程实践，即“复制代码并以混乱的方式更改内容，直到得到我想要的结果”。

最后一堆闪亮的旋转八面体着色器在这里：<https://www.shadertoy.com/view/wdlcR4>

动画出来的样子是这样的：

![][7]

为了做到这一点，我基本上只是复制了关于符号距离函数的教程，该函数根据符号距离函数呈现形状，并且：

  * 将 `sdfBalloon` 更改为 `sdfOctahedron`，并使八面体旋转而不是在我的符号距离函数中静止不动
  * 修改 `doBalloonColor` 着色功能，使其有光泽
  * 有很多八面体而不是一个

### 使八面体旋转！

下面是我用来使八面体旋转的代码！事实证明这真的很简单：首先从 [这个页面][8] 复制一个八面体符号距离函数，然后添加一个 `rotate` 使其根据时间旋转，然后它就可以旋转了！

```
vec2 sdfOctahedron( vec3 currentRayPosition, vec3 offset ){
    vec3 p = rotate((currentRayPosition), offset.xy, iTime * 3.0) - offset;
    float s = 0.1; // s 是啥?
    p = abs(p);
    float distance = (p.x + p.y + p.z - s) * 0.57735027;
    float id = 1.0;
    return vec2( distance,  id );
}
```

### 用一些噪音让它发光 

我想做的另一件事是让我的形状看起来闪闪发光/有光泽。我使用了在 [这个 GitHub gist][9] 中找到的噪声函数使表面看起来有纹理。

以下是我如何使用噪声函数的代码。基本上，我只是随机地将参数更改为噪声函数（乘以 2？3？1800？随你！），直到得到喜欢的效果。

```
float x = noise(rotate(positionOfHit, vec2(0, 0), iGlobalTime * 3.0).xy * 1800.0);
float x2 = noise(lightDirection.xy * 400.0);
float y = min(max(x, 0.0), 1.0);
float y2 = min(max(x2, 0.0), 1.0);
vec3 balloonColor = vec3(y, y + y2, y + y2);
```

## 编写着色器很有趣！

上面就是全部的步骤了！让这个八面体旋转并闪闪发光使我很开心。如果你也想用着色器制作有趣的动画，希望本文能帮助你制作出很酷的东西！

通常对于不太了解的主题，我可能在文章中说了至少一件关于着色器的错误事情，请让我知道错误是什么！

再说一遍，如下是我用到的两个资源：

  1. “符号距离函数教程：盒子和气球”：<https://www.shadertoy.com/view/Xl2XWt>（修改和玩起来真的很有趣）
  2. 可以将大量符号距离函数复制并粘贴到你的代码中：<http://www.iquilezles.org/www/articles/distfunctions/distfunctions.htm>


--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/03/15/writing-shaders-with-signed-distance-functions/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[Starryi](https://github.com/Starryi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/images/spinny.gif
[2]: https://www.shadertoy.com/view/Xl2XWt
[3]: https://jvns.ca/images/colour.gif
[4]: https://github.com/alexjc/shadertoy-render
[5]: https://jvns.ca/images/circle.gif
[6]: https://www.shadertoy.com/view/tsscR4
[7]: https://jvns.ca/images/octahedron2.gif
[8]: http://www.iquilezles.org/www/articles/distfunctions/distfunctions.htm
[9]: https://gist.github.com/patriciogonzalezvivo/670c22f3966e662d2f83
