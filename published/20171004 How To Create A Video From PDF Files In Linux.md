如何在 Linux 中从 PDF 创建视频
======

![](https://www.ostechnix.com/wp-content/uploads/2017/10/Video-1-720x340.jpg)

我在我的平板电脑中收集了大量的 PDF 文件，其中主要是 Linux 教程。有时候我懒得在平板电脑上看。我认为如果我能够从 PDF 创建视频，并在大屏幕设备（如电视机或计算机）中观看会更好。虽然我对 [FFMpeg][1] 有一些经验，但我不知道如何使用它来创建视频。经过一番 Google 搜索，我想出了一个很好的解决方案。对于那些想从一组 PDF 文件制作视频文件的人，请继续阅读。这并不困难。

### 在 Linux 中从 PDF 创建视频

为此，你需要在系统中安装 “FFMpeg” 和 “ImageMagick”。

要安装 FFMpeg，请参考以下链接。

- [在 Linux 上安装 FFMpeg][2]

Imagemagick 可在大多数 Linux 发行版的官方仓库中找到。

在 Arch Linux 以及 Antergos、Manjaro Linux 等衍生产品上，运行以下命令进行安装。

```
sudo pacman -S imagemagick
```

Debian、Ubuntu、Linux Mint：

```
sudo apt-get install imagemagick
```

Fedora：

```
sudo dnf install imagemagick
```

RHEL、CentOS、Scientific Linux：

```
sudo yum install imagemagick
```

SUSE、 openSUSE：

```
sudo zypper install imagemagick
```

在安装 ffmpeg 和 imagemagick 之后，将你的 PDF 文件转换成图像格式，如 PNG 或 JPG，如下所示。

```
convert -density 400 input.pdf picture.png
```

这里，`-density 400` 指定输出图像的水平分辨率。

上面的命令会将指定 PDF 的所有页面转换为 PNG 格式。PDF 中的每个页面都将被转换成 PNG 文件，并保存在当前目录中，文件名为： `picture-1.png`、 `picture-2.png` 等。根据选择的 PDF 的页数，这将需要一些时间。

将 PDF 中的所有页面转换为 PNG 格式后，运行以下命令以从 PNG 创建视频文件。

```
ffmpeg -r 1/10 -i picture-%01d.png -c:v libx264 -r 30 -pix_fmt yuv420p video.mp4
```

这里：

* `-r 1/10` ：每张图像显示 10 秒。
* `-i picture-%01d.png` ：读取以 `picture-` 开头，接着是一位数字（`％01d`），最后以  `.png` 结尾的所有图片。如果图片名称带有 2 位数字（也就是 `picture-10.png`、`picture11.png` 等），在上面的命令中使用（`％02d`）。
* `-c:v libx264`：输出的视频编码器（即 h264）。
* `-r 30` ：输出视频的帧率
* `-pix_fmt yuv420p`：输出的视频分辨率
* `video.mp4`：以 .mp4 格式输出视频文件。

好了，视频文件完成了！你可以在任何支持 .mp4 格式的设备上播放它。接下来，我需要找到一种方法来为我的视频插入一个很酷的音乐。我希望这也不难。

如果你想要更高的分辨率，你不必重新开始。只要将输出的视频文件转换为你选择的任何其他更高/更低的分辨率，比如说 720p，如下所示。

```
ffmpeg -i video.mp4 -vf scale=-1:720 video_720p.mp4
```

请注意，使用 ffmpeg 创建视频需要一台配置好的 PC。在转换视频时，ffmpeg 会消耗大量系统资源。我建议在高端系统中这样做。

就是这些了。希望你觉得这个有帮助。还会有更好的东西。敬请关注！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/create-video-pdf-files-linux/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/20-ffmpeg-commands-beginners/
[2]:https://www.ostechnix.com/install-ffmpeg-linux/