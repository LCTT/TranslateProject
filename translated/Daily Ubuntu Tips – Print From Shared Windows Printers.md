每日Ubuntu小技巧-使用Windows共享打印机进行打印
===
对于那些既有Windows电脑又有Ubuntu电脑但却只有一台打印机的用户，这篇博文向你展示如何在Windows中共享一个打印机，并允许Ubuntu使用它来打印。

几乎所有的打印机都默认支持Windows。许多打印机生产商都为Windows生产打印机但是很多却并不为Linux系统生产，包括Ubuntu。所以，假如你有一台支持Windows的打印机，你可以在Windows机器上分享它，然后让其它系统来使用它来打印。

在几年之前，我遇到了这个问题，那时大多数打印机生产商不支持Linux系统。我有一台老式的只支持Windows和Mac OS X但却不支持Linux的打印机。

我在我的Windows机器上安装了打印机驱动，然后它就可以很好的工作咯。我的Windows机器使用它来打印非常好，但是我的Ubuntu却无法使用它来打印，因为打印机并不支持LAN。

所以，我在Windows上共享该打印机，然后我的Ubuntu机器就可以使用合适的字体和风格进行打印咯。假如你也遇到类似的情景，你可以按照下面的指导也这样做。

首先，登入Windows，右击你要共享的打印机，然后点击‘**打印机属性**’

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/printersharingubuntu.png)

接着，选择“分享”标签页，勾选上‘分享这台打印机’复选框来分享这台打印机。记住共享打印机的名字，因为你要使用这个共享名来连接这台打印机。

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/printersharingubuntu1.png)

最后，以管理员权限运行命令行终端，运行以下命令以便于文件和打印机可以通过防火墙实现共享。

	netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes

接着，登入Ubuntu中，选择顶部面板右边的**齿轮**，然后选择**设置...**

系统设置打开后，选择打印机，然后点击**添加**。当跳出来一个窗口让你选择设备时，选择‘使用SAMBA的Windows打印机’。

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/printersharingubuntu2.png)

键入Windows电脑的IP地址或者主机名，后面接着键入共享的打印机名。你可能需要键入你的windows验证信息（用户名和密码）。验证后你就可以看到打印机咯，当你完成这些后，就可以点击向前继续下一步咯。

接着，选择打印机商标和模型。假如你在列表中看不到和你的打印机相似的模型，选择一个最接近它的然后继续。

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/printersharingubuntu3.png)

以上这些都搞定了之后，你的打印机就安装好咯，可以使用了。

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/printersharingubuntu4.png)

好好享受吧！

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/11/daily-ubuntu-tips-print-from-shared-windows-printers/

译者：[Linux-pdz](https://github.com/Linux-pdz) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
