Ubuntu 14.04中修复默认启用HDMI后没有声音的问题
================================================================================

声音问题在Ubuntu中是老生常谈了。先前我已经在[修复Ubuntu中的“无声”问题][1]一文中写到了多种方法，但是我在此正要谈及的声音问题跟在另外一篇文章中提到的有所不同。

因此，我安装了Ubuntu 14.04，实际上是重新安装了一遍。一如既往，我将[全新安装Ubuntu 14.04后要做的事][2]全部又重新做了一遍。然后，我意识到系统突然失声了。当我正侦查问题所在之时，我发现了一件奇怪的事情。我检查了[alsamixer][3]，发现它的状况有点离奇。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/06/alsamixer_Set_HDMI_Default.jpeg)

正如你能看到的，**alsamixer中默认设置了HDMI**。这意味着默认情况下将使用HDMI输出，而不是内置扬声器。这就是我从系统上内置扬声器无法获得声音的原因。

使用下面的命令来检查alsamixer的状态：

    alsamixer

如果alsamixer默认设置成了HDMI或者其它声音输出，那就继续读下去吧，看看我们是怎么来修复这个问题的。

### 修复默认设置成HDMI时Ubuntu的失声问题 ###

现在来强制Ubuntu使用模拟输出来取代默认的HDMI，但我们还需要一点点信息。打开终端，然后使用下列命令：

    aplay -l

这会列出设备，卡号之类的东西。注意，向下检查模拟输出使用的卡和设备编号。我的输出如下所示：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/AlsaMixer_List_Device.jpeg)

一旦你取得了所需的卡和设备编号，重新构建一个配置文件：

    sudo gedit /etc/asound.conf

上面的命令也会打开文件，将下面两行添加进去，当然将卡和设备编号替换成你自己的：

    defaults.pcm.card 1
    defaults.pcm.device 0

保存文件，并重启计算机。现在，你应该听到声音了吧。需要提一下的是，这对所有的Linux发行版都有效，如Linux Mint，Elementary OS，Fedora，Arch Linux等等都可以。正如我之前所说，该“失声疗法”仅针对HDMI被设置为默认设备的情况。对于其它情况，你可以阅读[关于在Ubuntu和Linux Mint中修复失声问题这篇文章][4]。

您可以尽情发表评论来告诉我这个方法是否有疗效，或者您有更好的方法来处理该问题，也可以告诉我。再见了！

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-includes/images/smilies/icon_smile.gif)

----------

![](http://1.gravatar.com/avatar/20749c268f5d3e4d2c785499eb6a17c0?s=100&r=pg&d=mm)

关于Abhishek
 
我是Abhishek Prakash，It's F.O.S.S.的“创立者”，我有一个通信系统工程的硕士学位。我酷爱Linux和开源。我使用Ubuntu，信奉知识分享。除了Linux之外，我也喜爱经典的侦探推理小说，是Agatha Christie作品的超级粉丝。大家尽可以在[Google+][g]上将我圈进去，并追随[@abhishek_pc][t]

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-sound-ubuntu-1404/

译者：[GOLinux](https://github.com/GOLinux) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/fix-sound-ubuntu-1304-quick-tip/
[2]:http://itsfoss.com/things-to-do-after-installing-ubuntu-14-04/
[3]:http://en.wikipedia.org/wiki/Alsamixer
[4]:http://itsfoss.com/fix-sound-ubuntu-1304-quick-tip/
[g]:https://plus.google.com/u/0/110180944531110746460
[t]:https://twitter.com/abhishek_pc
