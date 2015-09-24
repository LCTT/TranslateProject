开启 Ubuntu 系统自动升级
================================================================================
在学习如何开启Ubuntu系统自动升级之前，先解释下为什么需要自动升级。

默认情况下，ubuntu每天一次检查更新。但是一周只会弹出一次软件升级提醒，除非当有安全性升级时，才会立即弹出。所以，如果你已经使用Ubuntu一段时间，你肯定很熟悉这个画面：

![Ubuntu软件升级提醒](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Software-Update-Ubntu.png)

但是做为一个正常桌面用户，根本不会去关心有什么更新细节。而且这个提醒完全就是浪费时间，你肯定信任Ubuntu提供的升级补丁，对不对？所以，大部分情况你肯定会选择“现在安装”，对不对？

所以，你需要做的就只是点一下升级按钮。现在，明白为什么需要自动系统升级了吧？开启自动系统升级意味着所有最新的更新都会自动下载并安装，并且没有请求确认。是不是很方便？

### 开启Ubuntu自动升级 ###

演示使用Ubuntu15.04，Ubuntu 14.04步骤类似。

打开Unity Dash ，找到软件&更新：

![Ubuntu 软件升级设置](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/08/Software_Update_Ubuntu.jpeg)

打开软件资源设置，切换到升级标签：

![Ubuntu 软件升级设置](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Software-Update-Ubntu-1.png)

可以发现，默认设置就是每日检查并立即提醒安全升级。

![改变软件更新频率](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Software-Update-Ubntu-2.png)

改变 ‘当有安全升级’和‘当有其他升级’的选项为：下载并自动安装。

![Automatic updates in Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Software-Update-Ubntu-3.png)

关闭对话框完成设定。这样每次Ubuntu检查更新后就会自动升级。事实上，这篇文章十分类似[改变Ubuntu升级提醒频率][1]。

你喜欢自动升级还是手动安装升级呢？欢迎评论。

--------------------------------------------------------------------------------

via: http://itsfoss.com/automatic-system-updates-ubuntu/

作者：[Abhishek][a]
译者：[Vic020/VicYu](http://vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/ubuntu-notify-updates-frequently/
