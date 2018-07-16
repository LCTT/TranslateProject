apt-fast：飞一般的apt-get
============================

apt-fast是一个为 **apt-get** 和 **aptitude** 做的“ **shell脚本封装** ”，通过对每个包进行并发下载的方式可以大大减少APT的下载时间。apt-fast使用aria2c或axel下载管理器来减少APT下载时间。就像传统的apt-get包管理器一样，apt-fast支持几乎所有的apt-get功能，如， **install** , **remove** , **update** , **upgrade** , **dist-upgrade** 等等，并且更重要的是它也支持proxy。

###在Ubuntu上安装apt-fast

使用以下PPA去安装apt-fast。apt-fast开发者说：“ **一些发行版，如PCLinux已经在他们默认的仓库中包括了apt-fast** 。” 我希望它将来也包含在Ubuntu/Debian的默认仓库中。

添加apt-fast的PPA，在终端中输入以下命令。

	sudo add-apt-repository ppa:apt-fast/stable

用命令更新源：

	sudo apt-get update

使用命令安装apt-fast：

	sudo apt-get install apt-fast

在安装期间，它将要求你输入下载包的最大链接数。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/sk@sk-_003.png)

在下一个对话框里面，会问你是否要禁止apt-fast的确认对话框。选择No并继续安装。如果你选择Yes，apt-fast在安装软件包时不会问你确认与否。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/sk@sk-_0041.png)

我发现 **aria2** 下载管理器已经随着apt-fast的安装而自动安装。所以，你不必单独安装aria2。

如果你想重新配置apt-fast选项，你可以使用命令： 

	sudo dpkg-reconfigure apt-fast
    
###用法

与apt-get功能相似，我们可以使用：

    apt-fast install package
    
    apt-fast remove package
    
    apt-fast update
    
    apt-fast upgrade
    
    apt-fast dist-upgrade
    
及更多命令。

工作中的apt-fast包管理器：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/sk@sk-_0051.png)

###创建别名（可选）

编辑 **~/.bashrc** 文件在末尾添加下面这行。

    alias apt-get='apt-fast'
    
或者简单运行以下命令在你的 **~/.bashrc** 中添加它。

    sudo echo "alias apt-get='apt-fast'" >> ~/.bashrc
    
从现在每当你运行apt-get命令去移除，更新和升级包时，它将在后台自动使用apt-fast。听起来很酷吧？

在测试期间，当下载包时我发现它与apt-get相比非常快。试一试，你一定会赞同我的看法。感谢阅读！！

-------

via: http://www.unixmen.com/improve-apt-get-download-speed-apt-fast/

译者：[Vito](https://github.com/Vito) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出


[1]:https://github.com/ilikenwf/apt-fast
