在Linux上将视频转换成动态gif图片
================================================================================
虽然曾经被认为是过时的艺术形式，但动态GIF图片现在复苏了。如果你还没有留意到，不少在线分享和社交网络网站都开始支持动态GIF图片，例如，[Tumblr][1]，[Flickr][2]，[Google+][3]和[Facebook的部分地方][4]。由于在消费和共享上的容易，GIF的动画已经成为主流互联网文化的一部分了。

所以，你们中的一些人会好奇怎样才能生成这样的动态GIF图片。已经有各种各样专门用来生成动态GIF图片的在线或离线工具。另一种选择是创建一副动态GIF图片时关闭现有的视频剪辑。在这个教程中，我会描述**在Linux上如何将一段视频文件转换成一副动态GIF图片**。

作为一个更有用的例子，让我展示如何**将一个YouTube视频转换成一副动态GIF图片**。

### 第一步：下载YouTube视频 ###

首先，下载一个你想要转换的YouTube视频。你可以使用[youtube-dl][5]这个工具将YouTube视频保存为MP4文件。假设你把你最爱的YouTube视频保存为"funny.mp4"。（译注：对于墙内的同学，请无视YT吧，自行去好人楼主那里寻找一个MP4吧，;-}）

### 第二步：从视频中解压视频帧 ###

接下来，在Linux系统上[安装FFmpeg][5]，我会用这个工具去解压从视频中解压出视频帧。

下面的指令会解压出独立的视频帧，将它们保存为GIF图片。确保使用诸如("out%04d.gif")的输出文件格式。这样，独立的帧就被合适地命名并保存。

    ffmpeg -t <时长> -ss <hh:mm:ss格式的开始位置> -i <视频文件> out%04d.gif

例如，如果你想解压输入视频的视频帧，从第10秒开始，每5秒一帧，请运行下列命令。

    $ ffmpeg -t 5 -ss 00:00:10 -i funny.mp4 out%04d.gif 

在完成FFmpeg之后，你会看到一组创建出来的GIF文件，它们被命名为"out[\d+].gif"。

### 第三步：合并视频帧进一副动态GIF ###

下面这一步要合并单个的GIF文件成一副动态GIF图片。为此，你可以使用ImageMagick。

首先，如果你还没有的话，在Linux系统上[安装ImageMagick][7]。

    convert -delay <帧数>x<每秒帧数> -loop 0 out*gif <输出文件>

在这个命令中，"-delay"是控制动态速度的选项。这个选项表示在显示下一帧画面前需要等待的秒数：帧数/每秒帧数 。"-loop 0"选项表示动画的无限次循环。如果你愿意，你可以指定"-loop N"让动画只重复N次。

例如，为了生成一副每秒20帧和循环无数次的动态GIF图片，使用如下命令。

    $ convert -delay 1x20 -loop 0 out*.gif animation.gif 

### 第四步（可选）：减少动态GIF的大小 ###

最后这一步（可选）是通过使用ImageMagick的GIF优化功能来减少生成的GIF文件的大小。

使用下列命令去减少GIF大小。

    convert -layers Optimize animation.gif animation_small.gif 

现在你已经准备好在你的社交网络上分享制作完成的GIF图片。下面是一副我从一个可爱的YouTube视频中生成的GIF样例图片。

享受技术带来的乐趣吧！:-)

[![](http://farm8.staticflickr.com/7372/10988763123_4e89a18085_o.gif)][8]

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/11/convert-video-animated-gif-image-linux.html

译者：[KayGuoWhu](https://github.com/KayGuoWhu) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://staff.tumblr.com/post/15623140287/1mb-gifs
[2]:http://www.flickr.com/photos/markus-weldon-imagebank/4439159924/sizes/o/in/photostream/
[3]:https://plus.google.com/communities/110524851358723545415
[4]:http://mashable.com/2013/08/29/gifs-return-to-facebook/
[5]:http://xmodulo.com/2013/03/how-to-save-youtube-videos-on-linux.html
[6]:http://xmodulo.com/2013/06/how-to-install-ffmpeg-on-linux.html
[7]:http://ask.xmodulo.com/install-imagemagick-linux.html
[8]:http://www.flickr.com/photos/xmodulo/10988763123/
