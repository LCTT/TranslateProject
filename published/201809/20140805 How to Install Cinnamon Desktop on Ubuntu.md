如何在 Ubuntu 上安装 Cinnamon 桌面环境  
======

> 这篇教程将会为你展示如何在 Ubuntu 上安装 Cinnamon 桌面环境。

[Cinnamon][1] 是 [Linux Mint][2] 的默认桌面环境。不同于 Ubuntu 的 Unity 桌面环境，Cinnamon 是一个更加传统而优雅的桌面环境，其带有底部面板和应用菜单。由于 Cinnamon 桌面以及它类 Windows 的用户界面，许多桌面用户[相较于 Ubuntu 更喜欢 Linux Mint][3]。  

现在你无需[安装 Linux Mint][4] 就能够体验到 Cinnamon了。在这篇教程，我将会展示给你如何在 Ubuntu 18.04，16.04 和 14.04 上安装 Cinnamon。  

在 Ubuntu 上安装 Cinnamon 之前，有一些事情需要你注意。有时候，安装的额外桌面环境可能会与你当前的桌面环境有冲突。可能导致会话、应用程序或功能等的崩溃。这就是为什么你需要在做这个决定时谨慎一点的原因。  

### 如何在 Ubuntu 上安装 Cinnamon 桌面环境

![如何在 Ubuntu 上安装 Cinnamon 桌面环境][5]  

过去有 Cinnamon 团队为 Ubuntu 提供的一系列的官方 PPA，但现在都已经失效了。不过不用担心，还有一个非官方的 PPA，而且它运行的很完美。这个 PPA 里包含了最新的 Cinnamon 版本。  

```
sudo add-apt-repository  
ppa:embrosyn/cinnamon  
sudo apt update && sudo apt install cinnamon  
```

下载的大小大概是 150 MB（如果我没记错的话）。这其中提供的 Nemo（Cinnamon 的文件管理器，基于 Nautilus）和 Cinnamon 控制中心。这些东西提供了一个更加接近于 Linux Mint 的感觉。  

### 在 Ubuntu 上使用 Cinnamon 桌面环境  

Cinnamon 安装完成后，退出当前会话，在登录界面，点击用户名旁边的 Ubuntu 符号：

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2014/08/Change_Desktop_Environment_Ubuntu.jpeg)  

之后，它将会显示所有系统可用的桌面环境。选择 Cinnamon。  

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2014/08/Install_Cinnamon_Ubuntu.jpeg)  

现在你应该已经登录到有着 Cinnamon 桌面环境的 Ubuntu 中了。你还可以通过同样的方式再回到 Unity 桌面。这里有一张以 Cinnamon 做为桌面环境的 Ubuntu 桌面截图。  

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2014/08/Cinnamon_Ubuntu_1404.jpeg)  

看起来是不是像极了 Linux Mint。此外，我并没有发现任何有关 Cinnamon 和 Unity 的兼容性问题。在 Unity 和 Cinnamon 来回切换，它们也依旧工作的很完美。  

#### 从 Ubuntu 卸载 Cinnamon  

如果你想卸载 Cinnamon，可以使用 PPA Purge 来完成。首先安装 PPA Purge：  

```
sudo apt-get install ppa-purge
```  

安装完成之后，使用下面的命令去移除该 PPA：  

```
sudo ppa-purge ppa:embrosyn/cinnamon
```  

更多的信息，我建议你去阅读 [如何从 Linux 移除 PPA][6] 这篇文章。  

我希望这篇文章能够帮助你在 Ubuntu 上安装 Cinnamon。也可以分享一下你使用 Cinnamon 的经验。  

------  

via: https://itsfoss.com/install-cinnamon-on-ubuntu/  

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: http://cinnamon.linuxmint.com/
[2]: http://www.linuxmint.com/
[3]: https://itsfoss.com/linux-mint-vs-ubuntu/
[4]: https://itsfoss.com/guide-install-linux-mint-16-dual-boot-windows/
[5]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/install-cinnamon-ubuntu.png
[6]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
