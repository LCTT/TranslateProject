Translated by H-mudcup

Picty:让图片管理变简单
================================================================================
![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/03/picty_002-790x429.png)

### 关于Picty ###

**Picty**是个免费，简单，却强大的照片收藏管理器，它可以帮助你管理你的照片。它的设计围绕着管理**元数据**和**无损**的处理图像的方法。Picty目前同时支持在线（基于网页的）和离线（本地的）收藏集。在本地的收藏集中，图片将被保存在一个本地的文件夹和它的子文件夹中。为了加快用户主目录里图片的查询速度，它会维持一个数据库。在在线（基于网页的）收藏集中，你可以通过网页浏览器上传并分享图片。拥有适当权限的个人用户可以把图片分享给任何人，而且每个用户可以同时开放多个收藏集，收藏集也可以被多个用户分享。通过一个转载插件在收藏集间传递图片就有了个简单的交互界面。

你可以从你的相机或任何设备中下载任何数量的照片。除此之外，Picty允许你在下载前浏览在你相机里的图片集。Picty是个轻量级的应用，还有着清爽的界面。它支持Linux和Windows平台。

### 功能 ###

- 支持大相片集（20000张以上）。
- 同时开放多个收藏集还可以在它们之间传照片。
- 收藏集包括：
    - 本地文件系统中保存图片的文件夹。
    - 相机、电话及其他媒体设备中的图片。
    - 图片保存服务（目前支持Flickr）
- Picty不是把相片“导入”到它的数据库中，它仅仅提供了一个界面来访问它们，不管它们保存在哪。为了保持迅速的反应以及能使你在离线时浏览图片的能力，Picty会保存缩略图和元数据的缓存。
- 以业界标准格式Exif、IPTC和Xmp读写元数据。
- 无损的方法：
    - Picty把所有改变包括图像编辑以元数据写入。例如，一个图片可以以任何方式剪切保存，原来的像素仍然保存在该文件里。
    - 修改会保存在Picty的收藏集缓存中直到你把你对元数据的修改保存到图片中。你能很容易撤销你不喜欢的未保存的修改。
- 基本图片编辑：
    - 目前支持基本的图像增强，如亮度、对比度、色彩、剪切以及矫正。
    - Improvements to those tools and other tools coming soon (red eye reduction, levels, curves, noise reduction)对这些工具的改善和其他的工具即将到来。（红眼消除、拉伸、弯曲、噪声消除）
- 图片标签：
    - 使用标准的IPTC和Xmp关键词为图片做标签。
    - 一个树状标签图让你能很容易的管理标签和对你的收藏集进行导航。
- 文件夹视图：
    - 按照目录的结构对你的图片收藏进行导航
- 支持多屏显示
    - Picty可以设置成让你在一个屏幕上浏览你的收藏集同时在另一个屏幕上全屏显示图片。
- 可个性化
    - 可以为外部工具创建快捷方式
    - 支持插件——目前提供的功能中有许多（标签和文件夹视图以及所有的图片编辑工具）都可以通过插件提供。
    - 使用Python编写——自带batteries！（python的这个特点使它可在mac、Linux和windows上直接安装使用，无需复杂的设置。）

### 安装方法 ###

#### 1、从PPA安装 ####

Picty开发人员为基于Debian的发行版，如Ubuntu，创建了一个PPA，让安装更简单。

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

你可以选择已存在的收藏集、设备或目录。让我们创建一个**新收藏集** 。要这样做，得先点击新收藏集（New Collection）按钮。进入收藏集，然后浏览都你保存图片的地方。最后，点击**创建（Create）**按钮。

![Create a Collection_001](http://www.unixmen.com/wp-content/uploads/2015/03/Create-a-Collection_001.png)

![picty_002](http://www.unixmen.com/wp-content/uploads/2015/03/picty_002.png)

你可以修改，旋转，添加/移除标签，设置每个图片的描述。要这么做，只需右击任何一个图片然后爱做什么做什么。

访问下面这个Google组可以得到更多关于Picty相片管理器的信息和支持。

- [http://groups.google.com/group/pictyphotomanager][1]

干杯！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/picty-managing-photos-made-easy/

作者：[SK][a]
译者：[H-mudcup](https://github.com/H-mudcup)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://groups.google.com/group/pictyphotomanager
