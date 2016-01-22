与 Linux 一起学习：物理模拟
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/07/physics-fetured.jpg)

[与 Linux 一起学习][1]的所有文章：

- [与 Linux 一起学习：学习打字][2]
- [与 Linux 一起学习：物理模拟][3]
- [与 Linux 一起学习：玩音乐][4]
- [与 Linux 一起学习：两款地理软件][5]
- [与 Linux 一起学习：掌握数学][6]

Linux 提供大量的教学软件和工具，面向各个年级段以及不同年龄段，提供大量学科的练习实践，其中大多数是可以与用户进行交互的。本“与 Linux 一起学习”系列就来介绍一些教学软件。

物理是一个有趣的课题，证据就是任何物理课程都可以用具体的图片演示给你看。能看到物理变化过程是一个很妙的体验，特别是你不需要到教室就能体验到。Linux 上有很多很好的科学软件来为你提供这种美妙感觉，本篇文章只着重介绍其中几种。

### 1. Step ###

[Step][7] 是一个交互型物理模拟器，属于 [KDEEdu][8]（KDE 教育）项目的一部分。没人会比它的作者更了解它的作用。在项目官网主页上写着“[Step] 是这样玩的：你放点东西进来，添加一些力（地心引力或者弹簧），然后点击‘模拟（Simulate）’按钮，这款软件就会为你模拟这个物体在真实世界的物理定律影响下的运动状态。你可以改变物体或力的属性（允许在模拟过程中进行修改），然后观察不同属性下产生的现象。Step 可以让你从体验中学习物理！”

Step 依赖 Qt 以及其他一些 KDE 所依赖的软件，正是由于像 KDEEdu 之类的项目存在，才使得 KDE 变得如此强大，当然，你可能需要忍受由此带来的庞大的桌面系统。

Debian 的源中包含了 step 软件，终端下运行以下命令安装：

    sudo apt-get install step

在 KDE 环境下，它只需要很少的依赖，几秒钟就能安装完成。

Step 有个简单的交互界面，你进去后直接可以进行模拟操作。

![physics-step-main](https://www.maketecheasier.com/assets/uploads/2015/07/physics-step-main.png)

你会发现所有物品在屏幕左边，包括不同的质点，空气，不同形状的物体，弹簧，以及不同的力（见区域1） 。如果你选中一个物体，屏幕右边会出现简短的描述信息（见区域2），以及你创造的世界的介绍（主要介绍这个世界中包含的物体）（见区域3），以及你当前选中的物体的属性（见区域4），以及你的操作历史（见区域5）。

![physics-step-parts](https://www.maketecheasier.com/assets/uploads/2015/07/physics-step-parts.png)

一旦你放好了所有物体，点击下“模拟”按钮，可以看到物体与物体之间的相互作用。

![physics-step-simulate1](https://www.maketecheasier.com/assets/uploads/2015/07/physics-step-simulate1.png)

![physics-step-simulate2](https://www.maketecheasier.com/assets/uploads/2015/07/physics-step-simulate2.png)

![physics-step-simulate3](https://www.maketecheasier.com/assets/uploads/2015/07/physics-step-simulate3.png)

想要更多了解 Step，按 F1 键，KDE 帮助中心会显示出详细的软件操作手册。

### 2. Lightspeed ###

Lightspeed 是一个简单的基于 GTK+ 和 OpenGL 的模拟器，可以模拟一个高速移动的物体被观测到的现象。这个模拟器的理论基础是爱因斯坦的狭义相对论，在 Lightspeed 的 [srouceforge 页面][9]上，他们这样介绍：当一个物体被加速到几千公里每秒，它就会表现得扭曲和褪色；当物体被不断加速到接近光速（299,792,458 m/s）时，这个现象会越来越明显，并且在不同方向观察这个物体的扭曲方式，会得到完全不一样的结果。

受到相对速度影响的现象如下（LCTT 译注：都可以从“光速不变”理论推导出来）：

- **洛伦兹收缩（The Lorentz contraction）** —— 物体看起来变短了
- **多普勒红移/蓝移（The Doppler red/blue shift）** —— 物体的颜色变了
- **前灯效应（The headlight effect）** —— 物体的明暗变化（LCTT 译注：当物体接近光速移动时，会在它前进的方向强烈地辐射光子，从这个角度看，物体会变得很亮，相反，从物体背后观察，会发现它很暗）
- **光行差效应（Optical aberration）** —— 物体扭曲变形了

Lightspeed 有 Debian 的源，执行下面的命令来安装：

    sudo apt-get install lightspeed

用户界面非常简单，里边有一个物体（你可以从 sourceforge 下载更多形状的物体）沿着 x 轴运动（按下 A 键或在菜单栏 object 项目的 Animation 选项设置，物体就会开始运动）。

![physics-lightspeed](https://www.maketecheasier.com/assets/uploads/2015/08/physics-lightspeed.png)

你可以滑动右边的滑动条来控制物体移动的速度。

![physics-lightspeed-deform](https://www.maketecheasier.com/assets/uploads/2015/08/physics-lightspeed-deform.png)

其他一些简单的控制器可以让你获得更多的视觉效果。

![physics-lightspeed-visual](https://www.maketecheasier.com/assets/uploads/2015/08/physics-lightspeed-visual.png)

点击界面并拖动鼠标可以改变物体视角，在 Camera 菜单下可以修改背景颜色或者物体的图形模式，以及其他效果。

### 特别推荐： Physion ###

Physion 是个非常有趣并且美观的物理模拟软件，比上面介绍的两款软件都好玩好看。

可以从它的[官网][10]下载：

- [Linux][11]

从他们放在 Youtube 上的视频来看，Physion 还是值得我们下载下来玩玩的。\

注：youtube 视频
<iframe frameborder="0" src="//www.youtube.com/embed/P32UHa-3BfU?autoplay=1&amp;autohide=2&amp;border=0&amp;wmode=opaque&amp;enablejsapi=1&amp;controls=0&amp;showinfo=0" id="youtube-iframe"></iframe>

你有其他 Linux 下的好玩的物理模拟、演示、教学软件吗？如果有，请在评论处分享给我们。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/linux-physics-simulation/

作者：[Attila Orosz][a]
译者：[bazz2](https://github.com/bazz2)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/attilaorosz/
[1]:https://www.maketecheasier.com/series/learn-with-linux/
[2]:https://linux.cn/article-6902-1.html
[3]:https://www.maketecheasier.com/linux-physics-simulation/
[4]:https://www.maketecheasier.com/linux-learning-music/
[5]:https://www.maketecheasier.com/linux-geography-apps/
[6]:https://linux.cn/article-6546-1.html
[7]:https://edu.kde.org/applications/all/step
[8]:https://edu.kde.org/
[9]:http://lightspeed.sourceforge.net/
[10]:http://www.physion.net/
[11]:http://physion.net/en/downloads/linux/13-physion-linux-x8664/download