如何在 Linux 上自动调整屏幕亮度保护眼睛
================================================================================

当你开始在计算机前花费大量时间的时候，问题自然开始显现。这健康吗？怎样才能舒缓我眼睛的压力呢？为什么光线灼烧着我？尽管解答这些问题的研究仍然在不断进行着，许多程序员已经采用了一些应用来改变他们的日常习惯，让他们的眼睛更健康点。在这些应用中，我发现了两个特别有趣的东西：Calise和Redshift。

### Calise ###

处于时断时续的开发中，[Calise][1]的意思是“相机光感应器（Camera Light Sensor）”。换句话说，它是一个根据摄像头接收到的光强度计算屏幕最佳的背光级别的开源程序。更进一步地说，Calise可以基于你的地理坐标来考虑你所在地区的天气。我喜欢它是因为它兼容各个桌面，甚至非X系列。

![](https://farm1.staticflickr.com/569/21016715646_6e1e95f066_o.jpg)

它同时附带了命令行界面和图形界面，支持多用户配置，而且甚至可以导出数据为CSV。安装完后，你必须在见证奇迹前对它进行快速校正。

![](https://farm6.staticflickr.com/5770/21050571901_1e7b2d63ec_c.jpg)

不怎么令人喜欢的是，如果你和我一样有被偷窥妄想症，在你的摄像头前面贴了一条胶带，那就会比较不幸了，这会大大影响Calise的精确度。除此之外，Calise还是个很棒的应用，值得我们关注和支持。正如我先前提到的，它在过去几年中经历了一段修修补补的艰难阶段，所以我真的希望这个项目继续开展下去。

![](https://farm1.staticflickr.com/633/21032989702_9ae563db1e_o.png)

### Redshift ###

如果你想过要减少由屏幕导致的眼睛的压力，那么你很可能听过f.lux，它是一个免费的专有软件，用于根据一天中的时间来修改显示器的亮度和配色。然而，如果真的偏好于开源软件，那么一个可选方案就是：[Redshift][2]。灵感来自f.lux，Redshift也可以改变配色和亮度来加强你夜间坐在屏幕前的体验。启动时，你可以使用经度和纬度来配置地理坐标，然后就可以让它在托盘中运行了。Redshift将根据太阳的位置平滑地调整你的配色或者屏幕。在夜里，你可以看到屏幕的色温调向偏暖色，这会让你的眼睛少遭些罪。

![](https://farm6.staticflickr.com/5823/20420303684_2b6e917fee_b.jpg)

和Calise一样，它提供了一个命令行界面，同时也提供了一个图形客户端。要快速启动Redshift，只需使用命令：

    $ redshift -l [LAT]:[LON] 

替换[LAT]:[LON]为你的维度和经度。

然而，它也可以通过gpsd模块来输入你的坐标。对于Arch Linux用户，我推荐你读一读这个[维基页面][3]。

### 尾声 ###

总而言之，Linux用户没有理由不去保护自己的眼睛，Calise和Redshift两个都很棒。我真希望它们的开发能够继续下去，让它们获得应有的支持。当然，还有比这两个更多的程序可以满足保护眼睛和保持健康的目的，但是我感觉Calise和Redshift会是一个不错的开端。

如果你有一个经常用来舒缓眼睛的压力的喜欢的程序，请在下面的评论中留言吧。

--------------------------------------------------------------------------------

via: http://xmodulo.com/automatically-dim-your-screen-linux.html

作者：[Adrien Brochard][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://calise.sourceforge.net/
[2]:http://jonls.dk/redshift/
[3]:https://wiki.archlinux.org/index.php/Redshift#Automatic_location_based_on_GPS
