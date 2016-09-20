
如何在 Ubuntu 16.04 和 Fedora 22-24 上安装最新的 XFCE 桌面？
====

Xfce 是一款针对 Linux 系统的现代化轻型开源桌面环境，它在其他的类 Unix 系统上，比如 Mac OS X, Solaries, *BSD plus, 也能工作得很好。它非常快并且因具有一个简单而优雅的用户界面很好地体现出了用户友好性。

在服务器上安装一个桌面环境有时被证明是很有用的，因为确切的运用程序可能需要一个桌面界面来高效和可靠的管理。 Xfce 一个卓越的性能是它的系统资源占用率很低，比如内存消耗很低，因此，如果服务器需要一个桌面环境的话它会是首选。

### XFCE 桌面的功能特性

另外，它的一些显著的组成部分和功能特性列在下面：

- Xfwm 窗口管理器
- Thunar 文件管理器
- 用户会话管理器：用来处理用户登录，电源管理及以后
- 桌面管理器：用来设置背景图片，桌面头像等更多操作
- 运用管理器
- 它的高度可连接性也增加了一些其他次要功能特性

Xfce 的最新稳定发行版是 Xfce 4.12, 它所有的功能特性和区别于旧版本的变化都列在了这儿。

#### 在Ubuntu 16.04 上安装 Xfce 桌面

Linux 分支比如 Xubuntu, Manjaro, OpenSUSE, Fedora Xfce Spin, Zenwalk 等许多其他版本的都提供它们自己的 Xfce 桌面安装包，但你也可以像下面这样安装最新的版本。
```
$ sudo apt update
$ sudo apt install xfce4 
```

等待安装进程结束，然后退出当前会话或者你也可以选择重启系统。在登录界面，选择 Xfce 桌面，然后在像下面的频幕截图这样登录：
![](http://www.tecmint.com/wp-content/uploads/2016/09/Select-Xfce-Desktop-at-Login.png)

![](http://www.tecmint.com/wp-content/uploads/2016/09/XFCE-Desktop.png)


#### 在 Fedora 22-24 上安装 Xfce 桌面

如果你想在现存 Linux 分支 Fedora 上安装 xfce 桌面，那么你可以使用下面展示的 yum 或 dnf 命令。
```
-------------------- 在 Fedora 22 上 --------------------
# yum install @xfce
-------------------- 在 Fedora 23-24 上 --------------------
# dnf install @xfce-desktop-environment
```


安装 Xfce 以后，你可以从会话菜单选择 xfce 登录或者重启系统。
![](http://www.tecmint.com/wp-content/uploads/2016/09/Select-Xfce-Desktop-at-Fedora-Login.png)

![](http://www.tecmint.com/wp-content/uploads/2016/09/Install-Xfce-Desktop-in-Fedora.png)


如果你不再想要 Xfce 桌面留在你的系统上，那么可以使用下面的命令来卸载它：
```
-------------------- 在 Ubuntu 16.04 上 -------------------- 
$ sudo apt purge xfce4
$ sudo apt autoremove
-------------------- 在 Fedora 22 上 -------------------- 
# yum remove @xfce
-------------------- 在 Fedora 23-24 上 --------------------
# dnf remove @xfce-desktop-environment
```


在这个简单的入门指南中，我们讲解了如何安装最新版 Xfce 桌面的步骤，我相信这很容易掌握。如果一切进行良好，你可以享受一下使用 xfce, 作为其中一个 [best desktop environments for Linux systems][1].

然而，如果想再次和我们联系，你可以通过下面的反馈环节并且记得始终和 Tecmint 保持联系。



--------------------------------------------------------------------------------



via: http://linoxide.com/firewall/pfsense-setup-basic-configuration/

作者：[Aaron Kili ][a]
译者：[译者ucasFL](https://github.com/ucasFL)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/best-linux-desktop-environments/
