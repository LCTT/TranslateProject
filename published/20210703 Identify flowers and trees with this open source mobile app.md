[#]: subject: (Identify flowers and trees with this open source mobile app)
[#]: via: (https://opensource.com/article/21/7/open-source-plantnet)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13568-1.html)

用开源移动应用 PlantNet 来识别花草和树木
======

> PlantNet 将开源技术与众包知识结合起来，帮助你成为业余植物学家。

![Fire pink flower in Maggie Valley, NC][1]

在我居住的地方很多小路和道路两旁都有花草树木。我所在的社区因其每年的枫树节而闻名，枫树对我来说很容易识别。然而，还有许多其他的树我无法识别名字。花也是如此：蒲公英很容易发现，但我不知道在我的步行道上的野花的名字。

最近，我的妻子告诉我了 PlantNet，一个可以识别这些花草和树木的移动应用。它可以在 iOS 和 Android 上使用，而且是免费的，所以我决定试试。

### 以开源的方式识别植物

我在手机上下载了这个应用程序，开始用它来识别我在村子周围散步时的一些花草和树木。随着我对这个应用的熟悉，我注意到我拍摄的图片（以及其他用户拍摄的图片）是以知识共享署名-相同方式共享（CC-BY-SA）的许可方式共享的。进一步的调查显示，PlantNet 是 [开源][2] 的。如果你喜欢，你可以匿名使用该应用，或者成为社区的注册成员。

根据 [Cos4Cloud][3] 公民科学项目，“PlantNet 是一个参与性的公民科学平台，用于收集、分享和审查基于自动识别的植物观察结果。它的目标是监测植物的生物多样性，促进公众对植物知识的获取”。它使用图像识别技术来清点生物多样性。

该项目的开发始于 2009 年，由法国的植物学家和计算机科学家进行。它最初是一个 [Web 应用][4]，而智能手机应用程序于 2013 年推出。该项目是 [Floris'Tic][5] 倡议的一部分，这是法国的另一个项目，旨在促进植物科学的科学、技术和工业文化。

PlantNet 允许用户利用智能手机的摄像头来收集视觉标本，并由软件和社区进行识别。然后，这些照片将与全世界数百万加入 PlantNet 网络的人分享。

该项目说：“PlantNet 系统的工作原理是，比较用户通过他们寻求鉴定的植物器官（花、果实、叶……）的照片传送的视觉模式。这些图像被分析，并与每天协作制作和充实的图像库进行比较。然后，该系统提供一个可能的物种清单及其插图”。

### 使用 PlantNet

该应用很容易使用。从你的智能手机上的应用图标启动它。

![PlantNet smartphone icon][6]

当应用打开时，你会看到你已经在资料库中收集的标本。显示屏底部的相机图标允许你使用你的相机将图片添加到你的照片库。

![Pl@ntnet homescreen][8]

选择“相机”选项，将手机的摄像头对准你想识别的树木或花草。拍完照后，点击与你想识别的标本相匹配的选项（叶、花、树皮、果实等）。

![Selecting plant type to identify][9]

例如，如果你想通过叶子的特征来识别一个标本，请选择**叶子**。PlantNet 对其识别的确定程度进行了分配，从高到低的百分比不等。你还可以使用你的智能手机的 GPS 功能，将位置信息自动添加到你的数据收集中，你还可以添加注释。

![Identified plant][10]

你可以在你的智能手机上或通过你的用户 ID（如果你创建了一个账户）登录网站，访问你上传的所有观测数据，并跟踪社区是否批准了它们。从网站界面上，你也可以下载 CSV 或电子表格格式的观察记录。

![Pl@ntnet provides user stats][11]

### 很好的户外活动

我特别喜欢 PlantNet 与维基百科的链接，这样我就可以阅读更多关于我收集的植物数据的信息。

目前全球大约有 1200 万 PlantNet 用户，所以数据集一直在增长。该应用是免费使用的，每天最多可以有 500 个请求。它还有一个 API，以 JSON 格式提供数据，所以你甚至可以把 Pl antNet 的视觉识别引擎作为一个 Web 服务使用。

PlantNet 的一个非常好的地方是，它结合了众包知识和开源技术，将用户相互联系起来，并与很好的户外活动联系起来。没有比这更好的理由来支持开源软件了。

关于该应用及其开发者的完整描述可在 [YouTube][12] 上找到（有法语、英文字幕）。你也可以在 [PlantNet][13] 的网站上了解更多该项目。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/open-source-plantnet

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fire-pink-flower-maggie-valley.jpg?itok=q6Ev7TSr (Fire pink flower in Maggie Valley, NC)
[2]: https://github.com/plantnet
[3]: https://cos4cloud-eosc.eu/citizen-science-innovation/cos4cloud-citizen-observatories/plntnet/
[4]: https://identify.plantnet.org/
[5]: http://floristic.org/
[6]: https://opensource.com/sites/default/files/uploads/plantnet-icon.jpg (PlantNet smartphone icon)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/plantnet_camera.jpg (Pl@ntnet homescreen)
[9]: https://opensource.com/sites/default/files/uploads/plantnet_plant-type.jpg (Selecting plant type to identify)
[10]: https://opensource.com/sites/default/files/uploads/plantnet-identification.jpg (Identified plant)
[11]: https://opensource.com/sites/default/files/uploads/plantnet_user-stats.jpg (Pl@ntnet provides user stats)
[12]: https://www.youtube.com/watch?v=W_cBqaPfRFE
[13]: https://plantnet.org/
