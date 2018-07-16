如何正确双启动Ubuntu和Windows双系统
================================================================================

**尽管微软想让你信任Windows，但一个Linux操作系统和一个Windows操作系统可以在同一台PC上和平共存。这个文章会指导你如何让一个Ubuntu系统和Windows操作系统并行运行。**

![](http://i1-news.softpedia-static.com/images/news2/How-to-Dual-Boot-Ubuntu-and-Windows-Properly-415377-2.jpg)

你必须考虑两种场景，同时你也必须决定哪一种适合你。这里必须要考虑安装顺序。在你已经安装好Ubuntu操作系统后再安装Windows会有一点问题，因为微软似乎不太在意其他小伙伴。

如果你是在已经安装好Windows后安装Ubuntu，那么事情会变得简单多了，几乎没有任何工作和准备是必需的。

让我们开始处理更加困难的问题。如果你已经有一个Ubuntu系统，想安装Windows，你会丢掉GRUB，它是默认的引导程序。Windows不会在意它，并会擦除它。

如果你已经犯了这个错误，但你并没有重写Linux分区，请别沮丧。数据仍然在那里，你需要的是一个含有Ubuntu（最新到13.10版本）的可启动live CD。你需要安装一个名为Boot-Repair的应用程序，使用PPA来安装它。

记住，如果你使用U盘，安装应用会相当简单，因为Ubuntu安装镜像是混合镜像。用Live CD启动一个Ubuntu会话，打开终端，然后输入下列指令：

    sudo add-apt-repository ppa:yannubuntu/boot-repair && sudo apt-get update
    sudo apt-get install -y boot-repair && (boot-repair &)

打开应用程序，点击推荐修复，然后等待。在这个步骤完成后，重启机器，你就会重新看到GRUB，实现双启动。

在另一方面，如果你已经安装好Windows，想要安装Ubuntu，事情会更加简单。启动Ubuntu安装，选择安装到一个非Windows分区，格式化为EXT4，选择引导程序的位置，然后就搞定了。

如果你选择将引导程序安装在和Windows安装的同一块硬盘上，它会擦除微软的引导程序。这样没有问题，因为GRUB会识别出WIndows操作系统，你不会丢掉它。如果你把它安装在其它地方，譬如在另一块硬盘上，当你选择从不同的硬盘启动时，你会看到它们两个。

开始享受你的Ubuntu和Windows双系统启动的乐趣吧！

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Dual-Boot-Ubuntu-and-Windows-Properly-415377.shtml

译者：[KayGuoWhu](https://github.com/KayGuoWhu) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
