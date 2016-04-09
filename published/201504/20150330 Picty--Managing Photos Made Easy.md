Picty:让图片管理变简单
================================================================================
![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/03/picty_002-790x429.png)

### 关于Picty ###

**Picty**是个免费，简单，却强大的照片收藏管理器，它可以帮助你管理你的照片。它是围绕着**元数据**管理和图像**无损**处理设计的。Picty目前同时支持在线（基于网页的）和离线（本地的）收藏集。在本地的收藏集中，图片将被保存在一个本地的文件夹及其子文件夹中。为了加快用户主目录里图片的查询速度，它会维持一个数据库。在在线（基于网页的）收藏集中，你可以通过网页浏览器上传并分享图片。拥有适当权限的个人用户可以把图片分享给任何人，而且用户可以同时打开多个收藏集，收藏集也可以分享给多个用户。有个简单的界面可以通过传输插件在收藏集之间传输图片。

你可以从你的相机或任何设备中下载任何数量的照片。除此之外，Picty允许你在下载前浏览在你相机里的图片集。Picty是个轻量级的应用，界面清爽。它支持Linux和Windows平台。

### 功能 ###

- 支持大相片集（20000张以上）。
- 同时打开多个收藏集，还可以在它们之间传照片。
- 收藏集包括：
    - 本地文件系统中保存图片的文件夹。
    - 相机、电话及其他媒体设备中的图片。
    - 图片保存服务（目前支持Flickr）
- Picty不是把相片“导入”到它的数据库中，它仅仅提供了一个界面来访问它们，不管它们保存在哪。为了保持迅速的反应以及能使你在离线时浏览图片的能力，Picty会保存缩略图和元数据的缓存。
- 以业界标准格式Exif、IPTC和Xmp读写元数据。
- 无损的方法：
    - Picty把所有改变包括图像编辑以元数据的方式写入。例如，一个图片可以以任何方式剪切保存，原来的图像仍然保存在该文件里。
    - 修改会保存在Picty的收藏集缓存中直到你把你对元数据的修改保存到图片中，所以你能很容易撤销你不喜欢的未保存的修改。
- 基本图片编辑功能：
    - 目前支持基本的图像增强，如亮度、对比度、色彩、剪切以及矫正。
    - 将要推出一些工具改进及更多工具。（红眼消除、拉伸、弯曲、噪声消除）
- 图片标签：
    - 使用标准的IPTC和Xmp关键词为图片做标签。
    - 一个树状标签图让你能很容易的管理标签和在收藏集内导航。
- 文件夹视图：
    - 按照目录的结构对你的图片收藏集进行导航
- 支持多屏显示
    - Picty可以设置成让你在一个屏幕上浏览你的收藏集同时在另一个屏幕上全屏显示图片。
- 可个性化
    - 可以为外部工具创建快捷方式
    - 支持插件——目前提供的功能中有许多（标签和文件夹视图以及所有的图片编辑工具）都可以通过插件提供。
    - 使用Python编写——内置电池(batteries included)！

### 安装方法 ###

#### 1、从PPA安装 ####

Picty开发人员为Ubuntu这样的基于 Debian的发行版创建了一个PPA，让安装更简单。

要在Ubuntu和它的衍生版上安装，请运行以下命令：

    sudo add-apt-repository ppa:damien-moore/ppa
    sudo apt-get update
    sudo apt-get install picty

#### 2、从源文件安装 ####

此外，你还可以从源文件安装。首先安装如下依赖项。

    sudo apt-get install bzr python-pyinotify python-pyexiv2 python-gtk2 python-gnome2 dcraw python-osmgpsmap python-flickrapi

然后，使用下面这个命令得到最新版本：

    bzr branch lp:picty

要运行Picty，先转到Picty所在的目录，然后输入：

    cd picty
    bin/picty

要想更新到最新版，请运行：

    cd picty
    bzr pull

### 使用方法 ###

可以从目录或Unity Dash启动Picty。

![picty_001](http://www.unixmen.com/wp-content/uploads/2015/03/picty_001.png)

你可以选择已存在的收藏集、设备或目录。这里让我们创建一个**新收藏集** ，请先点击新收藏集（New Collection）按钮。进入收藏集，然后浏览到你保存图片的地方。最后，点击**创建（Create）**按钮。

![Create a Collection_001](http://www.unixmen.com/wp-content/uploads/2015/03/Create-a-Collection_001.png)

![picty_002](http://www.unixmen.com/wp-content/uploads/2015/03/picty_002.png)

你可以对每张图片进行修改，旋转，添加/移除标签，设置描述。只需右击任何一个图片然后爱做什么做什么。

访问下面这个Google组可以得到更多关于Picty相片管理器的信息和支持。

- [http://groups.google.com/group/pictyphotomanager][1]

干杯！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/picty-managing-photos-made-easy/

作者：[SK][a]
译者：[H-mudcup](https://github.com/H-mudcup)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://groups.google.com/group/pictyphotomanager
