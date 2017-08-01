如何将树莓派变成电子书服务器
============================================================

> Calibre 电子书管理软件可以轻松地在树莓派 3 上设置电子书服务器，即使在连接较慢区域也是如此。
 
![How to turn a Raspberry Pi into an eBook server](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/idea_innovation_mobile_phone.png?itok=Ep49JfKU "How to turn a Raspberry Pi into an eBook server")

最近 [Calibre 3.0 发布了][12]，它让用户能够在浏览器中阅读电子书！注意 Raspbian 的仓库还没有更新它（截至写作时）。

电子书是教师、图书馆员和其他人与学生共享书籍、课堂资料或其他文件的好方法，只需要你有可靠的带宽接入即可。但是，即使你的连接速度较慢或无法连接，还有一个简单的解决方案：使用在树莓派 3 上运行的开源 Calibre 电子书管理软件创建电子书服务器。这是我所做的，你也可以。

首先我下载了最新的 [Raspbian Pixel 镜像][13]，并安装在一个新的 8GB microSD 卡上。然后我插入 microSD，连接了键盘、鼠标并用一根 HDMI 线连接到一台旧的 LCD 电视，然后启动了 Pi。在我的显示器上[调整了 Pixel 环境分辨率][14]并连接到本地网络之后，我准备开始了。我打开一个终端，并输入 `sudo apt-get update` 以获取操作系统的最新更新。

![Updating Raspbian Pixel](https://opensource.com/sites/default/files/u128651/1updateos.png "Updating Raspbian Pixel")

接下来，我在终端中输入 `sudo apt-get install calibre` 来安装 [Calibre][15]。

![Installing Calibre](https://opensource.com/sites/default/files/u128651/2install_calibre.png "Installing Calibre")

我从命令行启动了 Calibre（注意它也可以从 GUI 启动）。Calibre 的界面非常直观。第一次启动时，你会看到 **Welcome to Calibre** 的向导。我将默认 “Calibre Library” 更改为 “CalibreLibrary”（一个词），因为这启动内容服务器时更容易。

在选择完我的 Calibre 内容位置后，我准备好开始下载书了。

![Calibre's interface](https://opensource.com/sites/default/files/u128651/3calibre-interface.png "Calibre's interface")

我从菜单中选择了 **Get Books** 选项，在这很容易输入我的搜索字词，并选择我感兴趣的电子书提供者。我正在寻找[非 DRM][16] 的材料，所以我选择 [Project Gutenberg][17] 作为我的源。（Caliber 的免责声明指出，电子书交易是在你和个人内容提供商之间。）我在作者字段中输入 “Mark Twain”，并得到10个结果。

![Searching for e-books](https://opensource.com/sites/default/files/u128651/4books.png "Searching for e-books")

我选择了 _Adventures of Huckleberry Finn_ 这本书。在下一页面上，我可以选择 **MOBI** 和 **EPUB** 这两种电子书格式。我选择了 EPUB，这本书下载得很快。
 

![Choosing the e-book format](https://opensource.com/sites/default/files/u128651/5ebook-formats.png "Choosing the e-book format")

你也可以从其他内容提供商向库中添加图书，而不是在 Calibre 的列表中添加图书。例如，老师可以通过该内容服务器与学生分享电子书格式的开放教育资源。要加载内容，请使用界面最左侧的 “Add Books” 选项。

根据你图书库的大小，你也许需要增加 microSD 卡的大小。

![start_the_server.png](https://opensource.com/sites/default/files/images/life-uploads/start_the_server.png)

将内容添加到电子书服务器后，即可与网络中的其他人共享内容。通过在终端中输入 `ifconfig` 获取你的树莓派 IP 地址。我正在使用无线网络，所以我在下面的例子中使用了 **wlan0** 中的结果。点击界面的最右侧并展开菜单。然后点击 “Connect and Share” 并启动服务器。

![Identifying the IP address with ipconfig](https://opensource.com/sites/default/files/u128651/6ipconfig.png "Identifying the IP address with ipconfig")

我下一步是通过我的电脑客户端连接到树莓派访问我添加的电子书。我在客户端上打开一个浏览器并输入树莓的地址，后面加上 **:8080** 端口。在我这里是 **http://192.168.1.10:8080** （根据你 Pi 的地址来适配）。

你会在浏览器中看到主页：

![Calibre's client homepage](https://opensource.com/sites/default/files/u128651/7calibre-home.png "Calibre's client homepage")

我已经测试，并能用 iPhone、Linux、MacOS 计算机轻易连接到服务器。

你可以在这个主页总探索选项，或者点击 **All Books** 显示服务器上的所有内容。

![Browsing e-books](https://opensource.com/sites/default/files/u128651/8browsing-books.png "Browsing e-books")

从这里，你可以下载书到你的设备并离线阅读了。

你还没有设置一台电子书服务器么？或者你考虑自己设置一台么？在评论中分享你的建议或者问题。

--------------------------------------------------------------------------------

作者简介：

Don Watkins - 教育家、教育技术专家、企业家、开源倡导者。教育心理学硕士、教育领导硕士、Linux 系统管理员、CCNA、使用 Virtual Box 虚拟化。关注我 @Don_Watkins。

-----------------

via: https://opensource.com/article/17/6/raspberrypi-ebook-server

作者：[Don Watkins][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://opensource.com/file/356446
[2]:https://opensource.com/file/356451
[3]:https://opensource.com/file/356456
[4]:https://opensource.com/file/356461
[5]:https://opensource.com/file/356466
[6]:https://opensource.com/file/356471
[7]:https://opensource.com/file/356476
[8]:https://opensource.com/file/356481
[9]:https://opensource.com/article/17/6/raspberrypi-ebook-server?rate=60Tv_hObNU1MQs2f3G6kNoT4qLyxJ03S1q75p2UEOYg
[10]:http://192.168.1.10:8080/
[11]:https://opensource.com/user/15542/feed
[12]:https://the-digital-reader.com/2017/06/19/calibre-3-0-released/
[13]:https://www.raspberrypi.org/downloads/raspbian/
[14]:https://www.raspberrypi.org/forums/viewtopic.php?t=5851
[15]:https://calibre-ebook.com/
[16]:https://en.wikipedia.org/wiki/Digital_rights_management
[17]:https://www.gutenberg.org/
[18]:https://opensource.com/users/don-watkins
[19]:https://opensource.com/article/17/6/raspberrypi-ebook-server#comments
