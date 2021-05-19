[#]: collector: "lujun9972"
[#]: translator: "rakino"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13399-1.html"
[#]: subject: "OpenStreetMap: A Community-Driven Google Maps Alternative"
[#]: via: "https://itsfoss.com/openstreetmap/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"

OpenStreetMap：社区驱动的谷歌地图替代品
======

> 作为谷歌地图的潜在替代品，OpenStreetMap 是一个由社区驱动的地图项目，在本文中我们将了解更多关于这个开源项目的信息。

[OpenStreetMap][1]（OSM）是一个可自由编辑的世界地图，任何人都可以对 OpenStreetMap 贡献、编辑和修改，以对其进行改进。

![][2]

查看地图并不需要帐号，但如果你想要编辑或增加地图信息，就得先注册一个帐号了。

尽管 OpenStreetMap 以 [开放数据库许可证][3] 授权，可以自由使用，但也有所限制 —— 你不能使用地图 API 在 OpenStreetMap 之上建立另一个服务来达到商业目的。

因此，你可以下载地图数据来使用，以及在标示版权信息的前提下自己托管这些数据。可以在 OpenStreetMap 的官方网站上了解更多关于其 [API 使用政策][4] 和 [版权][5] 的信息。

在这篇文章中，我们将简单看看 OpenStreetMap 是如何工作的，以及什么样的项目使用 OpenStreetMaps 作为其地图数据的来源。

### OpenStreetMap：概述

![][6]

OpenStreetMap 是很好的谷歌地图替代品，虽然你无法得到和谷歌地图一样的信息水平，但对于基本的导航和旅行来说，OpenStreetMap 已经足够了。

就像其他地图一样，你能够在地图的多个图层间切换，了解自己的位置，并轻松地查找地点。

你可能找不到关于附近企业、商店和餐馆的所有最新信息。但对于基本的导航来说，OpenStreetMap 已经足够了。

通常可以通过网页浏览器在桌面和手机上访问 [OpenStreetMap 的网站][7] 来使用 OpenStreetMap，它还没有一个官方的安卓/iOS 应用程序。

然而，也有各种各样的应用程序在其核心中使用了 OpenStreetMap。因此，如果你想在智能手机上使用 OpenStreetMap，你可以看看一些流行的谷歌地图开源替代：

  * [OsmAnd][8]
  * [MAPS.ME][9]

**MAPS.ME** 和 **OsmAnd** 是两个适用于安卓和 iOS 的开源应用程序，它们利用 OpenStreetMap 的数据提供丰富的用户体验，并在应用中添加了一堆有用的信息和功能。

如果你愿意，也可以选择其他专有选项，比如 [Magic Earth][10]。

无论是哪种情况，你都可以在 OpenStreetMap 的官方维基页面上看一下适用于 [安卓][11] 和 [iOS][12] 的大量应用程序列表。

### 在 Linux 上使用 OpenStreetMap

![][13]

在 Linux 上使用 OpenStreetMap 最简单的方法就是在网页浏览器中使用它。如果你使用 GNOME 桌面环境，可以安装 GNOME 地图，它是建立在 OpenStreetMap 之上的。

还有几个软件（大多已经过时了）在 Linux 上使用 OpenStreetMap 来达到特定目的，你可以在 OpenStreetMap 的 [官方维基列表][14] 中查看可用软件包的列表。

### 总结

对于最终用户来说，OpenStreetMap 可能不是最好的导航源，但是它的开源模式允许它被自由使用，这意味着可以用 OpenStreetMap 来构建许多服务。例如，[ÖPNVKarte][15] 使用 OpenStreetMap 在一张统一的地图上显示全世界的公共交通设施，这样你就不必再浏览各个运营商的网站了。

你对 OpenStreetMap 有什么看法？你能用它作为谷歌地图的替代品吗？欢迎在下面的评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/openstreetmap/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[rakino](https://github.com/rakino)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.openstreetmap.org/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/openstreetmap.jpg?ssl=1
[3]: https://opendatacommons.org/licenses/odbl/
[4]: https://operations.osmfoundation.org/policies/api/
[5]: https://www.openstreetmap.org/copyright
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/open-street-map-2.jpg?ssl=1
[7]: https://www.openstreetmap.org
[8]: https://play.google.com/store/apps/details?id=net.osmand
[9]: https://play.google.com/store/apps/details?id=com.mapswithme.maps.pro
[10]: https://www.magicearth.com/
[11]: https://wiki.openstreetmap.org/wiki/Android#OpenStreetMap_applications
[12]: https://wiki.openstreetmap.org/wiki/Apple_iOS
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/open-street-map-1.jpg?ssl=1
[14]: https://wiki.openstreetmap.org/wiki/Linux
[15]: http://xn--pnvkarte-m4a.de/