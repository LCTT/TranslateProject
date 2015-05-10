使用Prey定位被盗的Ubuntu笔记本与智能电话
===============================================================================
Prey是一款跨平台的开源工具，可以帮助你找回被盗的笔记本，台式机，平板和智能手机。它已经获得了广泛的流行，声称帮助找回了成百上千台丢失的笔记本和智能手机。Prey的使用特别简单，首先安装在你的笔记本或者手机上，当你的设备不见了，用你的账号登入Prey网站，并且标记你的设备为“丢失”。只要小偷将设备接入网络，Prey就会马上发送设备的地理位置给你。如果你的笔记本有摄像头，它还会拍下该死的贼。

Prey占用很小的系统资源；你不会对你的设备运行有任何影响。你也可以配合其他你已经在设备上安装的防盗软件使用。Prey在你的设备与Prey服务器之间采用安全加密的通道进行数据传输。

### 在Ubuntu上安装并配置Prey ###

让我们来看看如何在Ubuntu上安装和配置Prey，需要提醒的是，在配置过程中，我们必须到Prey官网进行账号注册。一旦完成上述工作，Prey将会开始监视你的设备了。免费的账号最多可以监视三个设备，如果你需要添加更多的设备，你就需要购买合适的的套餐了。

可以想象Prey多么流行与被广泛使用，它现在已经被添加到了官方的软件库中了。这意味着你不要往软件包管理器添加任何PPA。很简单，登录你的终端，运行以下的命令来安装它：
	
	sudo apt-get install prey

![Install Prey](http://blog.linoxide.com/wp-content/uploads/2015/03/Install-Prey.png)

![Install Prey 1](http://blog.linoxide.com/wp-content/uploads/2015/03/Install-Prey-1.png)

Prey是十分轻巧的软件，只使用了系统几兆的空间，安装完成后，从Application >> Prey启动，之后它会询问你进行相关配置。

选择“New User”，如果你是第一次使用的话。

![Prey New User](http://blog.linoxide.com/wp-content/uploads/2015/03/Prey-New-User.png)

第二步实际上就是官网注册的流程。请提供你的用户名，邮箱地址和密码，来申清一个免费的账号。

![Register Prey](http://blog.linoxide.com/wp-content/uploads/2015/03/Register-Prey.png)

点击“Apply”完成，所有工作搞定，现在你的计算机被Prey保护了。

![Prey Configuration](http://blog.linoxide.com/wp-content/uploads/2015/03/Prey-Configuration.png)

登录你最新建立的[Prey 账号][1]，你就应该可以在“Devices”菜单下看见你的设备信息了。

![Prey Web Login](http://blog.linoxide.com/wp-content/uploads/2015/03/Prey-Web-Login.png)

只要你的笔记本或者任何其他设备丢失了，就登录你的Prey网站账号，然后点击“Set Device to Missing”选项修改设备状态为“missing”。

![Prey Missing Page](http://blog.linoxide.com/wp-content/uploads/2015/03/Prey-Missing-1.png)

从这里选择定时报告，并点击“Yes，my device is missing”。定时报告选项是指一段时间间隔后，软件会更新并发送给你设备的地理位置。它还会从网页界面那发邮件给你，只要设备的状态改变了。

![Prey Missing Email](http://blog.linoxide.com/wp-content/uploads/2015/03/Prey-Missing-2.png)

而一旦被盗的设备接入了互联网，Prey就会马上发送报告给你，包括设备的地理位置和IP地址。

![Prey Found Report](http://blog.linoxide.com/wp-content/uploads/2015/03/Prey-Missing-3.png)

点击报告链接，你应该会看到设备的地理位置和IP地址。

![Prey Final](http://blog.linoxide.com/wp-content/uploads/2015/03/Prey-Final.png)

Prey有一个明显的不足。它需要你的设备接入互联网才会发送地理位置给你，如果小偷比较聪明，在接入网络前将你的设备磁盘格式化了，那么你就永远不会收到设备被发现的报告了。但是这里仍然是有一个方法克服这个不足，确保添加一个BIOS密码，并且禁用从可移除的设备里启动系统。

### 结论 ###

这是一款小巧，非常有用的安全保护应用，可以让你在一个地方追踪你所有的设备，尽管不完美，但是仍然提供了找回被盗设备的机会。它在Linux，Windows和Mac平台上无缝运行。以上就是[Prey][2]完整使用的所有细节。

-------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/anti-theft-application-prey-ubuntu/

作者：[Aun Raza][a]
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/
[1]:https://preyproject.com/
[2]:https://preyproject.com/plans
