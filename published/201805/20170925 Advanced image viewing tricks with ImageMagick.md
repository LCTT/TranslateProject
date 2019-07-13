ImageMagick 的一些高级图片查看技巧
======

> 用这些 ImageMagick 命令行图像编辑应用的技巧更好的管理你的数码照片集。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-photo-camera-green.png?itok=qiDqmXV1)

图片源于 [Internet Archive Book Images](https://www.flickr.com/photos/internetarchivebookimages/14759826206/in/photolist-ougY7b-owgz5y-otZ9UN-waBxfL-oeEpEf-xgRirT-oeMHfj-wPAvMd-ovZgsb-xhpXhp-x3QSRZ-oeJmKC-ovWeKt-waaNUJ-oeHPN7-wwMsfP-oeJGTK-ovZPKv-waJnTV-xDkxoc-owjyCW-oeRqJh-oew25u-oeFTm4-wLchfu-xtjJFN-oxYznR-oewBRV-owdP7k-owhW3X-oxXxRg-oevDEY-oeFjP1-w7ZB6f-x5ytS8-ow9C7j-xc6zgV-oeCpG1-oewNzY-w896SB-wwE3yA-wGNvCL-owavts-oevodT-xu9Lcr-oxZqZg-x5y4XV-w89d3n-x8h6fi-owbfiq),Opensource.com 修改，[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)协议

在我先前的[ImageMagick 入门：使用命令行来编辑图片][1] 文章中，我展示了如何使用 ImageMagick 的菜单栏进行图片的编辑和变换风格。在这篇续文里，我将向你展示使用这个开源的图像编辑器来查看图片的另外方法。

### 别样的风格

在深入 ImageMagick 的高级图片查看技巧之前，我想先分享另一个使用 `convert` 达到的有趣但简单的效果，在[上一篇文章][1]中我已经详细地介绍了 `convert` 命令，这个技巧涉及这个命令的 `edge` 和 `negate` 选项：

```
convert DSC_0027.JPG -edge 3 -negate edge3+negate.jpg
```

![在图片上使用 `edge` 和 `negate` 选项][3]

*使用`edge` 和 `negate` 选项前后的图片对比*

这些使我更喜爱编辑后的图片：海的外观，作为前景和背景的植被，特别是太阳及其在海上的反射，最后是天空。

### 使用 display 来查看一系列图片

假如你跟我一样是个命令行用户，你就知道 shell 为复杂任务提供了更多的灵活性和快捷方法。下面我将展示一个例子来佐证这个观点。ImageMagick 的 `display` 命令可以克服我在 GNOME 桌面上使用 [Shotwell][4] 图像管理器导入图片时遇到的问题。

Shotwell 会根据每张导入图片的 [Exif][5] 数据，创建以图片被生成或者拍摄时的日期为名称的目录结构。最终的效果是最上层的目录以年命名，接着的子目录是以月命名 (01、 02、 03 等等)，然后是以每月的日期命名的子目录。我喜欢这种结构，因为当我想根据图片被创建或者拍摄时的日期来查找它们时将会非常方便。

但这种结构也并不是非常完美的，当我想查看最近几个月或者最近一年的所有图片时就会很麻烦。使用常规的图片查看器，我将不停地在不同层级的目录间跳转，但 ImageMagick 的 `display` 命令可以使得查看更加简单。例如，假如我想查看最近一年的图片，我便可以在命令行中键入下面的 `display` 命令：

```
display -resize 35% 2017/*/*/*.JPG
```

我可以一个月又一个月，一天又一天地遍历这一年。

现在假如我想查看某张图片，但我不确定我是在 2016 年的上半年还是在 2017 的上半年拍摄的，那么我便可以使用下面的命令来找到它：

```
display -resize 35% 201[6-7]/0[1-6]/*/*.JPG
```

这限制查看的图片拍摄于 2016 和 2017 年的一月到六月

### 使用 montage 来查看图片的缩略图

假如现在我要查找一张我想要编辑的图片，使用 `display` 的一个问题是它只会显示每张图片的文件名，而不显示其在目录结构中的位置，所以想要找到那张图片并不容易。另外，假如我很偶然地在从相机下载图片的过程中将这些图片从相机的内存里面清除了它们，结果使得下次拍摄照片的名称又从 `DSC_0001.jpg` 开始命名，那么当使用 `display` 来展示一整年的图片时，将会在这 12 个月的图片中花费很长的时间来查找它们。

这时 `montage` 命令便可以派上用场了。它可以将一系列的图片缩略图放在一张图片中，这样就会非常有用。例如可以使用下面的命令来完成上面的任务：

```
montage -label %d/%f -title 2017 -tile 5x -resize 10% -geometry +4+4 2017/0[1-4]/*/*.JPG 2017JanApr.jpg
```

从左到右，这个命令以标签开头，标签的形式是包含文件名（`%f`）和以 `/` 分割的目录（`%d`）结构，接着这个命令以目录的名称（2017）来作为标题，然后将图片排成 5 列，每个图片缩放为 10% （这个参数可以很好地匹配我的屏幕）。`geometry` 的设定将在每张图片的四周留白，最后指定那些图片要包括到这张合成图片中，以及一个合适的文件名称（`2017JanApr.jpg`）。现在图片 `2017JanApr.jpg` 便可以成为一个索引，使得我可以不时地使用它来查看这个时期的所有图片。

### 注意内存消耗

你可能会好奇为什么我在上面的合成图中只特别指定了为期 4 个月（从一月到四月）的图片。因为 `montage` 将会消耗大量内存，所以你需要多加注意。我的相机产生的图片每张大约有 2.5MB，我发现我的系统可以很轻松地处理 60 张图片。但一旦图片增加到 80 张，如果此时还有另外的程序（例如 Firefox 、Thunderbird）在后台工作，那么我的电脑将会死机，这似乎和内存使用相关，`montage`可能会占用可用 RAM 的 80% 乃至更多（你可以在此期间运行 `top` 命令来查看内存占用）。假如我关掉其他的程序，我便可以在我的系统死机前处理 80 张图片。

下面的命令可以让你知晓在你运行 `montage` 命令前你需要处理图片张数：

```
ls 2017/0[1-4/*/*.JPG > filelist; wc -l filelist
```

`ls` 命令生成我们搜索的文件的列表，然后通过重定向将这个列表保存在任意以名为 `filelist` 的文件中。接着带有 `-l` 选项的 `wc` 命令输出该列表文件共有多少行，换句话说，展示出了需要处理的文件个数。下面是我运行命令后的输出：

```
163 filelist
```

啊呀！从一月到四月我居然有 163 张图片，使用这些图片来创建一张合成图一定会使得我的系统死机的。我需要将这个列表减少点，可能只处理到 3 月份或者更早的图片。但如果我在 4 月 20 号到 30 号期间拍摄了很多照片，我想这便是问题的所在。下面的命令便可以帮助指出这个问题：

```
ls 2017/0[1-3]/*/*.JPG > filelist; ls 2017/04/0[1-9]/*.JPG >> filelist; ls 2017/04/1[0-9]/*.JPG >> filelist; wc -l filelist
```

上面一行中共有 4 个命令，它们以分号分隔。第一个命令特别指定从一月到三月期间拍摄的照片；第二个命令使用 `>>` 将拍摄于 4 月 1 日至 9 日的照片追加到这个列表文件中；第三个命令将拍摄于 4 月 10 日到 19 日的照片追加到列表中。最终它的显示结果为：

```
81 filelist
```

我知道假如我关掉其他的程序，处理 81 张图片是可行的。

使用 `montage` 来处理它们是很简单的，因为我们只需要将上面所做的处理添加到 `montage` 命令的后面即可：

```
montage -label %d/%f -title 2017 -tile 5x -resize 10% -geometry +4+4 2017/0[1-3]/*/*.JPG 2017/04/0[1-9]/*.JPG 2017/04/1[0-9]/*.JPG 2017Jan01Apr19.jpg
```

从左到右，`montage` 命令后面最后的那个文件名将会作为输出，在它之前的都是输入。这个命令将花费大约 3 分钟来运行，并生成一张大小约为 2.5MB 的图片，但我的系统只是有一点反应迟钝而已。

### 展示合成图片

当你第一次使用 `display` 查看一张巨大的合成图片时，你将看到合成图的宽度很合适，但图片的高度被压缩了，以便和屏幕相适应。不要慌，只需要左击图片，然后选择 `View > Original Size` 便会显示整个图片。再次点击图片便可以使菜单栏隐藏。

我希望这篇文章可以在你使用新方法查看图片时帮助你。在我的下一篇文章中，我将讨论更加复杂的图片操作技巧。

### 作者简介

Greg Pittman - Greg 肯塔基州路易斯维尔的一名退休的神经科医生，对计算机和程序设计有着长期的兴趣，最早可以追溯到 1960 年代的 Fortran IV 。当 Linux 和开源软件相继出现时，他开始学习更多的相关知识，并分享自己的心得。他是 Scribus 团队的成员。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/9/imagemagick-viewing-images

作者：[Greg Pittman][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/greg-p
[1]:https://linux.cn/article-8851-1.html
[3]:https://opensource.com/sites/default/files/u128651/edge3negate.jpg "Using the edge and negate options on an image."
[4]:https://wiki.gnome.org/Apps/Shotwell
[5]:https://en.wikipedia.org/wiki/Exif
