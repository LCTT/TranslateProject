如何在Ubuntu13.10中安装最新版的NVIDIA驱动
===

**有时候新版本的NVIDIA驱动安装会成为一个问题，尤其是你不习惯Linux系统中事情运作的方式时。**

![](http://i1-news.softpedia-static.com/images/news2/How-to-Install-the-Latest-NVIDIA-331-20-Drivers-in-Ubuntu-13-10-399182-2.jpg)

在这个手册中将教给大家的，帮助普通用户也能用最新的NVIDIA驱动331.20中获益。

在Ubuntu系统中有许多方法安装NVIDIA驱动，有容易的也有困难的方法。容易的方法也是最为直截了当的，但是你需要能够连接网络。这种方法也会把你带入PPA的美妙世界中去。

Ubuntu 13.10像它的前辈们一样，有一个很大的软件仓库可供使用，但是Canonical的开发者们由于种种考虑并不上传最新版的驱动。其中考虑最多的是开发者们担心最新版的驱动可能不够稳定。

幸运的是，我们有PPA可供使用，PPA中有最新版的驱动程序可供使用，而且里面的驱动会在官方放出新驱动一两天后就添加进去。只需在终端中敲入一下命令即可（当然你需要拥有root权限）：

	sudo add-apt-repository ppa:xorg-edgers/ppa
    sudo apt-get update
    sudo apt-get install nvidia-331

假如你已经安装了一个老版本的驱动，你需要用**sudo apt-get dist-upgrade**命令替换上面命令中的最后一条命令。

完成这些步骤之后重启你的电脑，新驱动就安装好了。在下一次NVIDIA更新驱动时，你就不用再添加PPA而只需更新系统就可以了。

第二种方法有点复杂，但是你可以不需联网（你需要先把驱动下载下来，但是你在安装的时候不再需要联网）。我们将使用64位版本的驱动最为例子讲解。

你必须按Ctrl+Alt+F1组合键进入真正的终端（译注：原文中为虚拟终端，但实际上按这个组合键进入的是真正的终端），然后使用用户名和密码登陆。接下俩，你需要用cd命令进入你放置驱动的位置（例如下载目录）然后输入以下命令：

	sudo service lightdm stop 
    sudo chmod a+x NVIDIA-Linux-x86_64-331.20.run
    sudo ./NVIDIA-Linux-x86_64-331.20.run
    sudo reboot

这样就搞定了。无论你选择使用什么方法，享受你的最新版的NVIDIA驱动吧。

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Install-the-Latest-NVIDIA-331-20-Drivers-in-Ubuntu-13-10-399182.shtml

译者：[Linux-pdz](https://github.com/Linux-pdz) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:
[2]: 
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
