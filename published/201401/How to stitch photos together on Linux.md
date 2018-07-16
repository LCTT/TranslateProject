如何在 Linux 中生成全景照片
================================================================================
如果你是一位狂热的摄影爱好者，那么你的摄影集中可能会有一些令人叹为观止的全景摄影作品。事实上，制作这些照片既不需要专业的摄影技术，也不需要什么特别的设备，利用一些照片合并软件（在线或者是离线，桌面设备或者移动设备）就可以将两幅或者多幅有重叠部分的照片轻松合成一幅全景照片。

这篇教程里，我将会解释 **如何在 Linux 中完成全景照片的合并工作**。在这儿，我将会使用一款叫做 [Hugin][1] 的照片合并软件。

Hugin 是一款开源（GPLv2）并可以免费使用的照片合并工具。它目前支持多个平台，包括 Linux，Windows，OS X 和 FreeBSD。 尽管作为一款开源软件，但是不论在功能上还是质量上，Hugin 都丝毫不逊色于商业软件。相反，Hugin 非常强大，不仅可以用来创建360度全景照片，还支持多种高级测光修正和优化。

### 在 Linux 中安装 Hugin

在 Debian，Ubuntu 或者 Linux Mint 中安装 Hugin：

    $ sudo apt-get install hugin

在 Fedora 中安装 Hugin：

    $ sudo yum install hugin

### 启动 Hugin

我们使用命令来启动Hugin。

    $ hugin

在这儿（Assistant页），我们要做的第一件事就是导入我们想要合并的照片。我们先来点击Load images 按钮，然后导入（两张或者多张）图片。当然了，这些照片应该需要相互有一些重叠的部分（我们这里载入了三张）。

[![](http://farm3.staticflickr.com/2884/11230363115_9aaaf5d8e4_z.jpg)][2]

### 第一次照片合并

在导入照片之后，点击 Align 按钮来开始我们的第一次合并

[![](http://farm8.staticflickr.com/7405/11230471403_4aab2dd708_z.jpg)][3]

为了正确合并照片，Hugin 将会在一个单独的窗口中启动合并助手，用来分析照片之间的关键点（控制点）。分析完毕之后，呈现在你眼前的将会是一幅全景照片的预览图。

接下来让我们切换回 Hugin 的主窗口。在 Align 按钮的下方，你将会看见照片合并的状态（比如控制点的数量，错误情况）。当然，还会有合并好坏的相关提示。

[![](http://farm3.staticflickr.com/2838/11230471243_c59a6dd6cd_z.jpg)][4]

如果合并提示显示 bad 或者 really bad，你可以继续按照下面的办法来进行排列的调整。

### 添加或者删除控制点

在主窗口中，进入 Control Points 标签页。在这儿，Hugin 展现在组合照片中常用的的控制点。我们看到，在左右面板中展现了一对照片，上面的一些同色的小方盒表示的是常用的控制点。你可以手动来添加或者删除这些控制点。这些控制点匹配的越精确，我们得到的合并质量也就越高。除此之外，如果这些控制点分散得比较均匀，得到的效果将会更好。

[![](http://farm4.staticflickr.com/3706/11230392866_aeee95908d_z.jpg)][5]

使用顶部中间的左右箭头按钮来找到拥有最少控制点的两幅照片。如这样的两幅照片，我们可以试图按照下面的办法来手动增加控制点。

首先我们点击左边照片中的某个点，然后再来点击右边照片中对应的点。Hugin 将会试图自动调整。接下来，我们继续点击底部的 Add 按钮来添加匹配对。重复上面的操作来添加更多的控制点。

[![](http://farm4.staticflickr.com/3790/11230376534_4acfdf09c8_z.jpg)][6]

### 其他优化

我们可以试图进行重新优化，比如点击工具栏中的 Re-optimize 按钮，或者去 Optimizer 标签中重新调整之前的优化。

[![](http://farm4.staticflickr.com/3830/11230470413_05dbb778d0_z.jpg)][5]

接下来回到 Hugin 主窗口中的 Assistant 标签，再次点击 Align 按钮来看看是否能得到一个更棒的结果。

倘若合并的全景照片的水平线参差不齐，我们可以试图将它拉直。首先点击工具栏上的 Preview panorama 按钮。

[![](http://farm8.staticflickr.com/7423/11230361845_afbb2e11ea_z.jpg)][6]

然后点击预览窗口中的 Straighten 按钮。

[![](http://farm4.staticflickr.com/3750/11230470463_2b4ef3dedf_z.jpg)][7]

一旦你对合并的结果感到满意，你可以继续将它导出为图片文件。只需要到 Hugin 主窗口中 Sticher 标签页里进行下面的操作：

调整画布大小，剪切数量。当然，还需要选择输出格式（比如 TIFF，JPEG，PNG）。最后，点击 Stitch！按钮来完成。

[![](http://farm3.staticflickr.com/2837/11230376234_2e46342a01_z.jpg)][8]

之后会有提示保存当前项目文件（*.pto），设定保存好输出的文件名即可。 

导出过程可能会需要花费几秒钟的时间。

这里有一张我利用 Hugin 的实验输出结果。画面中是墨西哥坎昆迷人海滩的全景。:-)

[![](http://farm8.staticflickr.com/7305/11230423496_c7dfaf6c12_c.jpg)][9]

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/12/stitch-photos-together-linux.html

译者：[ailurus1991](https://github.com/ailurus1991) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://hugin.sourceforge.net/
[2]:http://www.flickr.com/photos/xmodulo/11230363115/
[3]:http://www.flickr.com/photos/xmodulo/11230471403/
[4]:http://www.flickr.com/photos/xmodulo/11230471243/
[5]:http://www.flickr.com/photos/xmodulo/11230392866/
[6]:http://www.flickr.com/photos/xmodulo/11230376534/
[7]:http://www.flickr.com/photos/xmodulo/11230470413/
[8]:http://www.flickr.com/photos/xmodulo/11230361845/
[9]:http://www.flickr.com/photos/xmodulo/11230470463/
[10]:http://www.flickr.com/photos/xmodulo/11230376234/
[11]:http://www.flickr.com/photos/xmodulo/11230423496/
