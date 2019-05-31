Adobe Lightroom 的三个开源替代品
=======

> 摄影师们：在没有 Lightroom 套件的情况下，可以看看这些 RAW 图像处理器。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/camera-photography-film.jpg?itok=oe2ixyu6)

如今智能手机的摄像功能已经完备到多数人认为可以代替传统摄影了。虽然这在傻瓜相机的市场中是个事实，但是对于许多摄影爱好者和专业摄影师看来，一个高端单反相机所能带来的照片景深、清晰度以及真实质感是口袋中的智能手机无法与之相比的。

所有的这些功能在便利性上要付出一些很小的代价；就像传统的胶片相机中的反色负片，单反照相得到的 RAW 格式文件必须预先处理才能印刷或编辑；因此对于单反相机，照片的后期处理是无可替代的，并且 首选应用就是 Adobe Lightroom。但是由于 Adobe Lightroom 的昂贵价格、基于订阅的定价模式以及专有许可证都使更多人开始关注其开源替代品。

Lightroom 有两大主要功能：处理 RAW 格式的图片文件，以及数字资产管理系统（DAM） —— 通过标签、评星以及其他元数据信息来简单清晰地整理照片。

在这篇文章中，我们将介绍三个开源的图片处理软件：Darktable、LightZone 以及 RawTherapee。所有的软件都有 DAM 系统，但没有任何一个具有 Lightroom 基于机器学习的图像分类和标签功能。如果你想要知道更多关于开源的 DAM 系统的软件，可以看 Terry Hacock 的文章：“[开源项目的 DAM 管理][2]”，他分享了他在自己的 [Lunatics!][3] 电影项目研究过的开源多媒体软件。

### Darktable

![Darktable][4]

类似其他两个软件，Darktable 可以处理 RAW 格式的图像并将它们转换成可用的文件格式 —— JPEG、PNG、TIFF、PPM、PFM 和 EXR，它同时支持 Google 和 Facebook 的在线相册，上传至 Flikr，通过邮件附件发送以及创建在线相册。

它有 61 个图像处理模块，可以调整图像的对比度、色调、明暗、色彩、噪点；添加水印；切割以及旋转；等等。如同另外两个软件一样，不论你做出多少次修改，这些修改都是“无损的” —— 你的初始 RAW 图像文件始终会被保存。

Darktable 可以从 400 多种相机型号中直接导入照片，以及有 JPEG、CR2、DNG、OpenEXR 和 PFM 等格式的支持。图像在一个数据库中显示，因此你可以轻易地过滤并查询这些元数据，包括了文字标签、评星以及颜色标签。软件同时支持 21 种语言，支持 Linux、MacOS、BSD、Solaris 11/GNOME 以及 Windows（Windows 版本是最新发布的，Darktable 声明它比起其他版本可能还有一些不完备之处，有一些未实现的功能）。

Darktable 在开源许可证 [GPLv3][7] 下发布，你可以了解更多它的 [特性][8]，查阅它的 [用户手册][9]，或者直接去 Github 上看[源代码][10] 。

### LightZone

![LightZone's tool stack][11]

[LightZone][12] 和其他两个软件类似同样是无损的 RAW 格式图像处理工具：它是跨平台的，有 Windows、MacOS 和 Linux 版本，除 RAW 格式之外，它还支持 JPG 和 TIFF 格式的图像处理。接下来说说 LightZone 其他独特特性。

这个软件最初在 2005 年时，是以专有许可证发布的图像处理软件，后来在 BSD 证书下开源。此外，在你下载这个软件之前，你必须注册一个免费账号，以便 LightZone的 开发团队可以跟踪软件的下载数量以及建立相关社区。（许可很快，而且是自动的，因此这不是一个很大的使用障碍。）

除此之外的一个特性是这个软件的图像处理通常是通过很多可组合的工具实现的，而不是叠加滤镜（就像大多数图像处理软件），这些工具组可以被重新编排以及移除，以及被保存并且复制用到另一些图像上。如果想要编辑图片的部分区域，你还可以通过矢量工具或者根据色彩和亮度来选择像素。

想要了解更多，见 LightZone 的[论坛][13] 或者查看 Github上的 [源代码][14]。

### RawTherapee

![RawTherapee][15]

[RawTherapee][16] 是另一个值得关注的开源（[GPL][17]）的 RAW 图像处理器。就像 Darktable 和 LightZone，它是跨平台的（支持 Windows、MacOS 和 Linux），一切修改都在无损条件下进行，因此不论你叠加多少滤镜做出多少改变，你都可以回到你最初的 RAW 文件。

RawTherapee 采用的是一个面板式的界面，包括一个历史记录面板来跟踪你做出的修改，以方便随时回到先前的图像；一个快照面板可以让你同时处理一张照片的不同版本；一个可滚动的工具面板可以方便准确地选择工具。这些工具包括了一系列的调整曝光、色彩、细节、图像变换以及去马赛克功能。

这个软件可以从多数相机直接导入 RAW 文件，并且支持超过 25 种语言，得到了广泛使用。批量处理以及 [SSE][18] 优化这类功能也进一步提高了图像处理的速度以及对 CPU 性能的利用。

RawTherapee 还提供了很多其他 [功能][19]；可以查看它的 [官方文档][20] 以及 [源代码][21] 了解更多细节。

你是否在摄影中使用另外的开源 RAW 图像处理工具？有任何建议和推荐都可以在评论中分享。

------

via: https://opensource.com/alternatives/adobe-lightroom

作者：[Opensource.com][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[scoutydren](https://github.com/scoutydren)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com
[1]: https://en.wikipedia.org/wiki/Raw_image_format
[2]: https://opensource.com/article/18/3/movie-open-source-software
[3]: http://lunatics.tv/
[4]: https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/raw-image-processors_darkroom1.jpg?itok=0fjk37tC	"Darktable"
[5]: http://www.darktable.org/
[6]: https://www.darktable.org/about/faq/#faq-windows
[7]: https://github.com/darktable-org/darktable/blob/master/LICENSE
[8]: https://www.darktable.org/about/features/
[9]: https://www.darktable.org/resources/
[10]: https://github.com/darktable-org/darktable
[11]: https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/raw-image-processors_lightzone1tookstack.jpg?itok=1e3s85CZ
[12]: http://www.lightzoneproject.org/
[13]: http://www.lightzoneproject.org/Forum
[14]: https://github.com/ktgw0316/LightZone
[15]: https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/raw-image-processors_rawtherapee.jpg?itok=meiuLxPw	"RawTherapee"
[16]: http://rawtherapee.com/
[17]: https://github.com/Beep6581/RawTherapee/blob/dev/LICENSE.txt
[18]: https://en.wikipedia.org/wiki/Streaming_SIMD_Extensions
[19]: http://rawpedia.rawtherapee.com/Features
[20]: http://rawpedia.rawtherapee.com/Main_Page
[21]: https://github.com/Beep6581/RawTherapee
