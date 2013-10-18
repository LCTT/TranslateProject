apt-fast：改善apt-get下载速度
===


apt-fast是一个为 **apt-get** 和 **aptitude** 的“ **shell脚本封装** ”，通过用每个包的多种连接的方式下载包可以大大改善APT下载时间。apt-fast使用aria2c或axel下载管理器去加快APT下载时间。就像传统的apt-get包管理器，apt-fast支持几乎所有的apt-get功能，如， **install** , **remove** , **update** , **upgrade** , **dist-upgrade** 等等。并且一个显著的特征是它也支持proxy。

**在Ubuntu上安装apt-fast**

使用以下PPA去安装apt-fast。apt-fast开发者说：“ **一些发行版，如PCLinux在他们默认的仓库中包括apt-fast** 。”我期待同样包含在Ubuntu/Debian默认仓库中。

添加apt-fast的PPA。在终端中输入以下命令。

	sudo add-apt-repository ppa:apt-fast/stable

用命令更新源：

	sudo apt-get update

使用命令安装apt-fast：

	sudo apt-get install apt-fast

在安装期间，它将要求你输入下载包的最大链接数。

![](https://github-camo.global.ssl.fastly.net/d9cba93cec82d5f2e442cb462f441df68cca57fb/687474703a2f2f3138303031363938382e722e63646e37372e6e65742f77702d636f6e74656e742f75706c6f6164732f323031332f31302f736b40736b2d5f3030332e706e67 )

选择No并继续安装。如果你选择Yes，apt-get在任何包安装期间不会问你确认与否。

![](https://github-camo.global.ssl.fastly.net/eae85edd1b18a837ab1603ff06b04011f8cd9ff3/687474703a2f2f3138303031363938382e722e63646e37372e6e65742f77702d636f6e74656e742f75706c6f6164732f323031332f31302f736b40736b2d5f303034312e706e67)

我发现 **aria2** 下载管理器已经随着apt-fast的安装而自动安装。所以，你不必单独安装aria2。

如果你想重新配置apt-fast选项，你可以使用命令： 

	sudo dpkg-reconfigure apt-fast
    
**用法**

与apt-get功能相似，我们可以使用：

    apt-fast install package
    
    apt-fast remove package
    
    apt-fast update
    
    apt-fast upgrade
    
    apt-fast dist-upgrade
    
更多。

工作中的apt-fast包管理器：

![](https://github-camo.global.ssl.fastly.net/45749e25eaaa3663ab07cca0bcbbc22c79885381/687474703a2f2f3138303031363938382e722e63646e37372e6e65742f77702d636f6e74656e742f75706c6f6164732f323031332f31302f736b40736b2d5f303035312e706e67)

**创建别名（可选）**

编辑 **~/.bashrc** 文件在末尾添加下面这行。

    alias apt-get='apt-fast'
    
或者简单运行以下命令在你的 **~/.bashrc** 中添加它。

    sudo echo "alias apt-get='apt-fast'" >> ~/.bashrc
    
从现在每当你运行apt-get命令去，移除，更新和升级包时，它将在后台自动使用apt-fast。听起来很酷？是的，这是必须的。

在测试期间，当下载包时我发现它与apt-get相比非常快。试一试，你将赞同我。感谢阅读！！

-------

via: http://www.unixmen.com/improve-apt-get-download-speed-apt-fast/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[Vito](https://github.com/Vito) 校对：[Caroline](https://github.com/carolinewuyan)

[1]:https://github.com/ilikenwf/apt-fast
