两款 Linux 桌面端可用的科学计算器
======

> 如果你想找个高级的桌面计算器的话，你可以看看开源软件，以及一些其它有趣的工具。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_OpenData_CityNumbers.png?itok=lC03ce76)

每个 Linux 桌面环境都至少带有一个功能简单的桌面计算器，但大多数计算器只能进行一些简单的计算。

幸运的是，还是有例外的：不仅可以做得比开平方根和一些三角函数还多，而且还很简单。这里将介绍两款强大的计算器，外加一大堆额外的功能。

### SpeedCrunch

[SpeedCrunch][1] 是一款高精度科学计算器，有着简明的 Qt5 图像界面，并且强烈依赖键盘。

![SpeedCrunch graphical interface][3]

*SpeedCrunch 运行中*

它支持单位，并且可用在所有函数中。

例如，

```
2 * 10^6 newton / (meter^2)
```

你可以得到：

```
= 2000000 pascal
```

SpeedCrunch 会默认地将结果转化为国际标准单位，但还是可以用 `in` 命令转换：

例如：

```
3*10^8 meter / second in kilo meter / hour
```

结果是：

```
= 1080000000 kilo meter / hour
```

`F5` 键可以将所有结果转为科学计数法（`1.08e9 kilo meter / hour`），`F2` 键可以只将那些很大的数或很小的数转为科学计数法。更多选项可以在配置页面找到。

可用的函数的列表看上去非常壮观。它可以用在 Linux 、 Windows、macOS。许可证是 GPLv2，你可以在 [Bitbucket][4] 上得到它的源码。

### Qalculate!

[Qalculate!][5]（有感叹号）有一段长而复杂的历史。

这个项目给了我们一个强大的库，而这个库可以被其它程序使用（在 Plasma 桌面中，krunner 可以用它来计算），以及一个用 GTK3 搭建的图形界面。它允许你转换单位，处理物理常量，创建图像，使用复数，矩阵以及向量，选择任意精度，等等。

![Qalculate! Interface][7]

*在 Qalculate! 中查看物理常量*

在单位的使用方面，Qalculate! 会比 SppedCrunch 更加直观，而且可以识别一些常用前缀。你有听说过 exapascal 压力吗？反正我没有（太阳的中心大概在 `~26 PPa`），但 Qalculate! ，可以准确 `1 EPa` 的意思。同时，Qalculate!  可以更加灵活地处理语法错误，所以你不需要担心打括号：如果没有歧义，Qalculate! 会直接给出正确答案。

一段时间之后这个项目看上去被遗弃了。但在 2016 年，它又变得强大了，在一年里更新了 10 个版本。它的许可证是  GPLv2 （源码在 [GitHub][8] 上），提供Linux 、Windows 、macOS的版本。

### 更多计算器

#### ConvertAll

好吧，这不是“计算器”，但这个程序非常好用。

大部分单位转换器只是一个大的基本单位列表以及一大堆基本组合，但 [ConvertAll][9] 与它们不一样。有试过把天文单位每年转换为英寸每秒吗？不管它们说不说得通，只要你想转换任何种类的单位，ConvertAll 就是你要的工具。

只需要在相应的输入框内输入转换前和转换后的单位：如果单位相容，你会直接得到答案。

主程序是在 PyQt5 上搭建的，但也有 [JavaScript 的在线版本][10]。

#### 带有单位包的 (wx)Maxima

有时候（好吧，很多时候）一款桌面计算器时候不够你用的，然后你需要更多的原力。

[Maxima][11] 是一款计算机代数系统（LCTT 译注：进行符号运算的软件。这种系统的要件是数学表示式的符号运算），你可以用它计算导数、积分、方程、特征值和特征向量、泰勒级数、拉普拉斯变换与傅立叶变换，以及任意精度的数字计算、二维或三维图像··· ···列出这些都够我们写几页纸的了。

[wxMaxima][12] 是一个设计精湛的 Maxima 的图形前端，它简化了许多 Maxima 的选项，但并不会影响其它。在 Maxima 的基础上，wxMaxima 还允许你创建 “笔记本”，你可以在上面写一些笔记，保存你的图像等。其中一项 (wx)Maxima 最惊艳的功能是它可以处理尺寸单位。

在提示符只需要输入：

```
load("unit")
```

按 `Shift+Enter`，等几秒钟的时间，然后你就可以开始了。

默认地，单位包可以用基本的 MKS 单位，但如果你喜欢，例如，你可以用 `N` 为单位而不是 `kg*m/s2`，你只需要输入：`setunits(N)`。

Maxima 的帮助（也可以在 wxMaxima 的帮助菜单中找到）会给你更多信息。

你使用这些程序吗？你知道还有其它好的科学、工程用途的桌面计算器或者其它相关的计算器吗？在评论区里告诉我们吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/scientific-calculators-linux

作者：[Ricardo Berlasso][a]
译者：[zyk2290](https://github.com/zyk2290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rgb-es
[1]:http://speedcrunch.org/index.html
[2]:/file/382511
[3]:https://opensource.com/sites/default/files/u128651/speedcrunch.png "SpeedCrunch graphical interface"
[4]:https://bitbucket.org/heldercorreia/speedcrunch
[5]:https://qalculate.github.io/
[6]:/file/382506
[7]:https://opensource.com/sites/default/files/u128651/qalculate-600.png "Qalculate! Interface"
[8]:https://github.com/Qalculate
[9]:http://convertall.bellz.org/
[10]:http://convertall.bellz.org/js/
[11]:http://maxima.sourceforge.net/
[12]:https://andrejv.github.io/wxmaxima/
