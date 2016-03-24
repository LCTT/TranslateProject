禁用Ubuntu 13.10的Amazon及远程内容获取
================================================================================

Ubuntu 13.10已经发布一段时间了，是时候坐下来配置一下系统来满足你的要求。Ubuntu 13.10配备了很多东西，当你安装或者升级时其实有些并不是你所需要的。

举个例子，当你安装或者升级到Ubuntu 13.10时，会自动启用Amazon和一些其他商业购物网站的功能。当你打开Unity Dash时这些Lens就会显示。当你在Dash处执行搜索时，类似Amazon的远程数据源中符合你搜索内容的选项也会发送过来。

这些由Canonical公司提供的新增特性可能对某些人有用，但是对另一些用户，这些特性可能是他们不需要的。

因为从远程数据源获取内容需要带宽，这就可能会对你的上网账单有负面影响，特别是当你住在一个根据流量计费的地域。

对于另一些对安全和隐私有担忧的用户来说，本地自动搜索远程源可能不是一个好主意。还有一些用户只是不想当他们在本地搜索时会有商业公司展示他们的产品。

这篇简单的教程就是教你当使用Ubuntu 13.10时如何快速禁用Amazon和所有远程内容获取。

在你的键盘上按组合键 **Ctrl – Alt –  T** 显示终端。当它打开后运行下面的命令去禁用该功能。

    gsettings set com.canonical.Unity.Lenses remote-content-search 'none'

如果你想要重新启用它，运行以下命令。

    gsettings set com.canonical.Unity.Lenses remote-content-search 'all'

你需要重新登陆或者重启你的电脑使更改生效。在完成这些操作后，当你使用Ubuntu搜索时就没有远程源会被使用。

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/disable-amazon-remote-content-fetching-ubuntu-13-10/

译者：[whatever1992](https://github.com/whatever1992) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
