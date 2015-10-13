在Linux中连接和使用云存储的三种途径
===
![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2013/10/linux-cloud-840x420.jpg)
个人云存储现在变得非常有用，因为你再也不用担心你把东西存储在什么地方了：你能很容易的获取你的文件，并时刻保持文件更新。在Linux上你也多种保持访问你的云存储。这一点非常棒，因为你可以使用你最喜欢的方式，哪怕你是个终端控。

###使用官方客户端

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2013/10/linux_accessing_cloud_ubuntu_one.jpg)

使用这种方式的明显好处就是你可以通过使用他们各自的官方应用访问你的各种云存储。目前，提供官方Linux客户端的服务提供商有[SpiderOak][1], [Dropbox][2], [Ubuntu One][3],[Copy][5]。[Ubuntu One][3]虽不出名但的确是[一个不错的云存储竞争着][4]。[Copy][5]则提供比Dropbox更多的空间，是[Dropbox的替代选择之一][6]。使用这些官方Linux客户端可以保持你的电脑与他们的服务器之间的通信，还可以让你进行属性设置，如选择性同步。

对于普通桌面用户，使用官方客户端是最好的选择，因为官方客户端可以提供最多的功能和最好的兼容性。使用它们也很简单，只需要下载他们对应你的发行版的软件包，然后安装安装完后在运行一下就Ok了。安装客户端时，它一般会指导你完成这些简单的过程。

###Dropbox：可以使用命令行脚本

假如你是Dropbox用户，你也可以通过终端命令行访问你的云存储。这种方式尤其适合于重度终端控，因为他们可以利用Dropbox提供的命令来写个脚本以便于执行自动任务。你可以运行以下命令来安装它（对于Debian，Ubuntu或者她们的衍生版 - 其它发行版可以使用相应的等价命令代替）：

       sudo apt-get install curl
       curl "https://raw.github.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o /tmp/dropbox_uploader.sh
       sudo install /tmp/dropbox_uploader.sh /usr/local/bin/dropbox_uploader
       dropbox_uploader


![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2013/10/linux_accessing_cloud_terminal_dropbox.jpg)

当你运行最后一条命令后，脚本会提醒你这是你第一次运行这个脚本。它将告诉你去浏览一个Dropbox的特定网页以便访问你的账户。它还会告诉你所有你需要放入网站的信息，这是为了让Dropbox给你App Key和App Secret以及赋予这个脚本你给予的访问权限。现在脚本就拥有了访问你账户的合法授权了。

这些一旦完成，你就可以这个脚本执行各种任务了，例如上传、下载、删除、移动、复制、创建文件夹、查看文件、共享文件、查看文件信息和取消共享。对于全部的语法解释，你可以查看一下[这个页面][9]。

###通过[Storage Made Easy][7]将SkyDrive带到Linux上

微软并没有提供SkyDrive的官方Linux客户端，这一点也不令人惊讶。但是你并不意味着你不能在Linux上访问SkyDrive，记住：SkyDrive的web版本是可用的。

但是假如你要把你的多个云存储合并在一起，或者你想有一个比较方便的方式在Linux上访问你的SkyDrive账户，你可以试试Storage Made Easy。这个第三方服务可以将它自己提供的云存储服务以及和多大三个其它的云存储服务整合在一起。更好的一点是：它提供官方Linux客户端，而且SkyDrive也是它支持的扩展云存储服务之一!

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2013/10/linux_accessing_cloud_configure_skydrive.jpg)

为了使用Stroage Made Easy，你首先需要创建一个他们的账号。完成账号创建后，你需要回到控制界面，选择“Add a Cloud Provider”。在这儿，你可以选择SkyDrive API 然后填入登录信息。添加完登录信息后，点击授权按钮以便给予必要的授权。然后，你就可以下载它的Linux客户端并安装它了。

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2013/10/linux_accessing_cloud_storagemadeeasy.jpg)

第一次启动时。它会要求你登录，还有询问你要把云存储挂载到什么地方。在你做完了这些后，你就可以浏览你选择的文件夹，你还可以访问你的Storage Made Easy空间以及你的SkyDrive空间了！这种方法对于那些想在Linux上使用SkyDrive的人来说非常好，对于想把他们的多个云存储服务整合到一个地方的人来说也很不错。这种方法的缺点是你无法使用他们各自官方客户端中可以使用的特殊功能。

因为现在在你的Linux桌面上也可以使用SkyDrive，接下来你可能需要阅读一下我写的[SkyDrive与Google Drive的比较][8]以便于知道究竟哪种更适合于你。

###结论

正如你所见，本文提供了多种方式访问你的个人云存储。当然，假如你觉得你当前使用的就是最适合于你的，那么你无须更换。然而，举个例子，假如你是一个终端控，要去寻找可以在终端中与你的Dropbox账户进行交互的方式，你就可以按照本文提供的方法去做！美妙之处就在于你可以选择最适于你的方式。同时，你要保持你的思想开放，本文在这儿展示的工具和例子，在将来也许会有针对其它云存储服务的其它工具出现，让你可以更加自由灵活的使用。

你最喜欢哪种方式来访问你的云存储呢？哪种是你最理想的形式呢？请在评论栏里留言，让我们知道你的想法!

---

via: http://www.makeuseof.com/tag/3-ways-to-access-and-use-cloud-storage-skydrive-etc-in-linux/

译者：[Linux-pdz](https://github.com/Linux-pdz) 校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://spideroak.com/opendownload/
[2]:https://www.dropbox.com/install?os=lnx
[3]:http://one.ubuntu.com/
[4]:http://www.makeuseof.com/tag/ubuntu-unknown-worthy-contender-cloud-storage/
[5]:http://www.copy.com/
[6]:http://www.makeuseof.com/tag/copy-a-dropbox-alternative-with-more-storage-mac-linux-windows-ios-android/
[7]:http://storagemadeeasy.com/
[8]:http://www.makeuseof.com/tag/skydrive-vs-google-drive-which-is-best-for-office-productivity/
[9]:https://github.com/andreafabrizi/Dropbox-Uploader
