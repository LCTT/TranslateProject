GIMP 过去的 20 年：一点一滴的进步
================================================================================
注：youtube 视频
<iframe width="660" height="371" frameborder="0" allowfullscreen="" src="https://www.youtube.com/embed/PSJAzJ6mkVw?feature=oembed"></iframe>

[GIMP][1]（GNU 图像处理程序（GNU Image Manipulation Program））—— 一流的开源自由的图像处理程序。加州大学伯克利分校的 Peter Mattis 和 Spencer Kimball 早在 1995 年的时候开始了该程序的开发。到了 1997 年，该程序成为了 [GNU Project][2] 官方的一部分，并正式更名为 GIMP。时至今日，GIMP 已经成为了最好的图像编辑器之一，并有经常有 “GIMP vs Photoshop” 之争。

### 1995 年 11 月 21 日，首版发布###

```
From: Peter Mattis
Subject: ANNOUNCE: The GIMP
Date: 1995-11-21
Message-ID: <48s543$r7b@agate.berkeley.edu>
Newsgroups: comp.os.linux.development.apps,comp.os.linux.misc,comp.windows.x.apps

GIMP：通用图像处理程序
------------------------------------------------

GIMP 是为各种图像编辑操作提供一个直观的图形界面而设计的。
以下是 GIMP 的主要功能介绍：
 图像查看
 -------------

   *  支持 8 位，15 位，16 位和 24 位颜色
   *  8 位色显示图像的排序和 Floyd-Steinberg 抖动算法
   *  以 RGB 色、灰度和索引色模式查看图像
   *  同时编辑多个图像
   *  实时缩放和全图查看
   *  支持 GIF、JPEG、PNG、TIFF 和 XPM 格式

 图像编辑
 -------------

   *  选区工具：包括矩形、椭圆、自由、模糊、贝尔赛曲线以及智能
   *  变换工具：包括旋转、缩放、剪切和翻转
   *  绘画工具：包括油漆桶、笔刷、喷枪、克隆、卷积、混合和文本
   *  效果滤镜：如模糊和边缘检测
   *  通道和颜色操作：叠加、反相和分解
   *  组件功能：允许你方便的添加新的文件格式和效果滤镜
   *  多步撤销/重做功能
```

### 1996 年，GIMP 0.54 版 ###

![](https://github.com/paulcarroty/Articles/raw/master/GIMP%20History/054.png)

GIMP 0.54 版需要具备 X11 显示、X-server 以及 Motif 1.2 组件，支持 8 位、15 位、16 位和 24 位的颜色深度和灰度，支持 GIF、JPEG、PNG、TIFF 和 XPM 图像格式。

基本功能：具备矩形、椭圆、自由、模糊、贝塞尔曲线和智能等选择工具，旋转、缩放、剪切、克隆、混合和翻转等变换工具。

扩展工具：文字添加、效果滤镜、通道和颜色操纵工具、撤销/重做功能。由于第一个版本支持组件扩展，才方便添加这些功能。

GIMP 0.54 版可以在  Linux、HP-UX、Solaris 和 SGI IRIX 中运行。

### 1997 年，GIMP 0.60 版 ###

![](https://github.com/paulcarroty/Articles/raw/master/GIMP%20History/060.gif)

这只是一个开发版本，并非面向用户发布的。GIMP 有了新的工具包——GDK（GIMP Drawing Kit，GIMP 绘图工具）和 GTK（GIMP Toolkit，GIMP 工具包），并弃用 Motif。GIMP 工具包随后也发展成为了 GTK+ 跨平台的微件工具包。新特性：

- 基本的图层功能
- 子像素取样
- 笔刷间距
- 改进剂喷枪功能
- 绘制模式

### 1997 年，GIMP 0.99 版 ###

![](https://github.com/paulcarroty/Articles/raw/master/GIMP%20History/099.png)

从 0.99 版本开始，GIMP 有了宏脚本的支持。GTK 及 GDK 功能增强版正式更名为 GTK+。其他更新：

- 支持大体积图像（大于 100M）
- 新增原生格式 – XCF
- 新的 API – 使得更加容易编写组件和扩展

### 1998 年，GIMP 1.0 版 ###

![](https://github.com/paulcarroty/Articles/raw/master/GIMP%20History/100.gif)

GIMP 和 GTK+ 开始分为两个不同的项目。GIMP 官网进行重构，包含新教程、组件和文档。新特性：

- 基于瓦片式（tile）的内存管理
- 组件 API 做了大量改变
- XFC 格式现在支持图层、导航和选择
- web 界面
- 在线图像生成

### 2000 年，GIMP 1.2 版 ###

新特性：

- 进行了非英文语言翻译
- 修复 GTK+ 和 GIMP 中的大量 bug
- 增加大量组件
- 图像映射
- 新工具：调整大小、测量、加亮、燃烧效果、颜色吸管和翻转等。
- 图像管道
- 保存前可以进行图像预览
- 按比例缩放的笔刷进行预览
- 通过路径进行递归选择
- 新的导航窗口
- 支持图像拖拽
- 支持水印

### 2004 年，GIMP 2.0 版 ###

![](https://github.com/paulcarroty/Articles/raw/master/GIMP%20History/200.png)

重大更新 – 更新 GTK+ 2.x toolkit.

### 2004 年，GIMP 2.2 版 ###

![](https://github.com/paulcarroty/Articles/raw/master/GIMP%20History/220.png)

修复大量 Bug 并支持图像拖拽

### 2007 年，GIMP 2.4 版 ###

![](https://github.com/paulcarroty/Articles/raw/master/GIMP%20History/240.png)

新特性：

- 更好的图像拖拽体验
- 使用新的脚本解释器 Script-Fu 替代了 旧的 Ti-Fu
- 新组件：影印效果、光晕效果、霓虹灯效果、卡通效果、小狗笔刷、水珠笔刷以及其他组件

### 2008 年，GIMP 2.6 版 ###

新特性：

- 更新了图形界面
- 新的选择工具
- 集成了 GEGL （GEneric Graphics Library，通用图形库）
- 为 MDI 行为实现了实用程序窗口提示

### 2012 年，GIMP 2.8 版 ###

![](https://github.com/paulcarroty/Articles/raw/master/GIMP%20History/280.png)

新特性：

- GUI 在视觉上做了一些改变
- 新的保存和导出菜单
- 更新文本框工具
- 支持图层群组
- 支持 JPEG2000 和导出为 pdf
- 网页截图工具

--------------------------------------------------------------------------------

via: https://tlhp.cf/20-years-of-gimp-evolution/

作者：[Pavlo Rudyi][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://tlhp.cf/author/paul/
[1]:https://gimp.org/
[2]:http://www.gnu.org/
