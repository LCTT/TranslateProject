小白技巧：openSUSE设置服务服务通过防火墙
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/openSUSE.png)

正如你所知道的，在openSUSE/SUSE系统上，不是所有的服务是激活并且默认允许的。例如，**ssh**服务是默认不允许通过防火墙的。当然，这是一个安全措施，但是有时我们必须需要ssh服务从远程地点来连接服务器。

这个小教程将会展示如何允许服务，不单是ssh，也包括所有其他的服务，如http，ftp等，通过服务器。我们可以使用**YaST**命令允许服务通过防火墙，**YaST**命令是openSUSE和其企业版，默认安装配置工具。

首先，在菜单中打开YaST控制中心。选择**Security and Users（安全和用户） -> Firewall（防火墙）**

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/openSUSE-13.1-Running-Oracle-VM-VirtualBox_001.png)

接下来，打开**Allowed Services（已允许服务）**选项卡；从Service to Allow（选择需要允许的服务）下拉框中选择**Secure Shell Service（ssh服务）**，然后 **Add（增加）**，**Next（下一步）**，最后**Finish（完成）**，搞定。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/openSUSE-13.1-Running-Oracle-VM-VirtualBox_002.png)

就是如此简单！ssh服务已经允许通过防火墙，这样你就可以在远程系统连接这个系统了。就像这样，我们可以同样设置其他服务。

鼓掌！！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/quick-tip-allow-services-firewall-opensuse/

作者：[SK][a]
译者：[VicYu/Vic020](http://www.vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
