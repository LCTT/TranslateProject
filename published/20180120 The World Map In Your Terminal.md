MapSCII：在终端显示世界地图
======

![](https://www.ostechnix.com/wp-content/uploads/2018/01/MapSCII-8-720x340.png)

我偶然发现了一个有趣的工具。在终端里的世界地图！是的，这太酷了。给 `MapSCII` 打 call，这是可在 xterm 兼容终端上渲染的布莱叶盲文和 ASCII 世界地图。它支持 GNU/Linux、Mac OS 和 Windows。我原以为它只不过是一个在 GitHub 上托管的项目而已，但是我错了！他们做的事令人印象深刻。我们可以使用我们的鼠标指针在世界地图的任何地方拖拽放大和缩小。其他显著的特性是：

  * 发现任何特定地点周围的兴趣点
  * 高度可定制的图层样式，支持 [Mapbox 样式][1]
  * 可连接到任何公共或私有的矢量贴片服务器
  * 或者使用已经提供并已优化的基于 [OSM2VectorTiles][2] 服务器 
  * 可以离线工作并发现本地的 [VectorTile][3]/[MBTiles][4]
  * 兼容大多数 Linux 和 OSX 终端
  * 高度优化算法的流畅体验

### 使用 MapSCII 在终端中显示世界地图

要打开地图，只需从终端运行以下命令：

```
telnet mapscii.me
```

这是我终端上的世界地图。

![][6]

很酷，是吗？

要切换到布莱叶盲文视图，请按 `c`。

![][7]

再次输入 `c` 切回以前的格式。

要滚动地图，请使用“向上”、“向下”、“向左”、“向右”箭头键。要放大/缩小位置，请使用 `a` 和 `z` 键。另外，你可以使用鼠标的滚轮进行放大或缩小。要退出地图，请按 `q`。

就像我已经说过的，不要认为这是一个简单的项目。点击地图上的任何位置，然后按 `a` 放大。

放大后，下面是一些示例截图。

![][8]

我可以放大查看我的国家（印度）的州。

![][9]

和州内的地区（Tamilnadu）：

![][10]

甚至是地区内的镇 [Taluks][11]：

![][12]

还有，我完成学业的地方：

![][13]

即使它只是一个最小的城镇，MapSCII 也能准确地显示出来。 MapSCII 使用  [OpenStreetMap][14] 来收集数据。

### 在本地安装 MapSCII

喜欢它吗？很好！你可以安装在你自己的系统上。

确保你的系统上已经安装了 Node.js。如果还没有，请参阅以下链接。

- [在 Linux 上安装 NodeJS][15]

然后，运行以下命令来安装它。

```
sudo npm install -g mapscii
```

要启动 MapSCII，请运行：

```
mapscii
```

玩的开心！会有更好的东西。敬请关注！

干杯!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/mapscii-world-map-terminal/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.mapbox.com/mapbox-gl-style-spec/
[2]:https://github.com/osm2vectortiles
[3]:https://github.com/mapbox/vector-tile-spec
[4]:https://github.com/mapbox/mbtiles-spec
[5]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[6]:http://www.ostechnix.com/wp-content/uploads/2018/01/MapSCII-1-2.png 
[7]:http://www.ostechnix.com/wp-content/uploads/2018/01/MapSCII-2.png
[8]:http://www.ostechnix.com/wp-content/uploads/2018/01/MapSCII-3.png
[9]:http://www.ostechnix.com/wp-content/uploads/2018/01/MapSCII-4.png
[10]:http://www.ostechnix.com/wp-content/uploads/2018/01/MapSCII-5.png
[11]:https://en.wikipedia.org/wiki/Tehsils_of_India
[12]:http://www.ostechnix.com/wp-content/uploads/2018/01/MapSCII-6.png
[13]:http://www.ostechnix.com/wp-content/uploads/2018/01/MapSCII-7.png
[14]:https://www.openstreetmap.org/
[15]:https://www.ostechnix.com/install-node-js-linux/
