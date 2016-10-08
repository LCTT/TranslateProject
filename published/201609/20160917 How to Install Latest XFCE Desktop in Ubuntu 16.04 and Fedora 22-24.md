如何在 Ubuntu 16.04 和 Fedora 22-24 上安装最新的 XFCE 桌面？
==========================

Xfce 是一款针对 Linux 系统的现代化[轻型开源桌面环境][1]，它在其他的类 Unix 系统上，比如 Mac OS X、 Solaries、 *BSD 以及其它几种上也能工作得很好。它非常快并以简洁而优雅的用户界面展现了用户友好性。

在服务器上安装一个桌面环境有时还是有用的，因为某些应用程序可能需要一个桌面界面，以便高效而可靠的管理。 Xfce 的一个卓越的特性是其内存消耗等系统资源占用率很低，因此，如果服务器需要一个桌面环境的话它会是首选。

### XFCE 桌面的功能特性

另外，它的一些值得注意的组件和功能特性列在下面：

- Xfwm 窗口管理器
- Thunar 文件管理器
- 用户会话管理器：用来处理用户登录、电源管理之类
- 桌面管理器：用来设置背景图片、桌面图标等等
- 应用管理器
- 它的高度可连接性以及一些其他次要功能特性

Xfce 的最新稳定发行版是 Xfce 4.12，它所有的功能特性和与旧版本的变化都列在了[这儿][2]。

#### 在 Ubuntu 16.04 上安装 Xfce 桌面

Linux 发行版，比如 Xubuntu、Manjaro、OpenSUSE、Fedora Xfce Spin、Zenwalk 以及许多其他发行版都提供它们自己的 Xfce 桌面安装包，但你也可以像下面这样安装最新的版本。

```
$ sudo apt update
$ sudo apt install xfce4 
```

等待安装过程结束，然后退出当前会话，或者你也可以选择重启系统。在登录界面，选择 Xfce 桌面，然后登录，截图如下：

![](http://www.tecmint.com/wp-content/uploads/2016/09/Select-Xfce-Desktop-at-Login.png)

![](http://www.tecmint.com/wp-content/uploads/2016/09/XFCE-Desktop.png)


#### 在 Fedora 22-24 上安装 Xfce 桌面

如果你已经有一个安装好的 Linux 发行版 Fedora，想在上面安装 xfce 桌面，那么你可以使用如下所示的 yum 或 dnf 命令。

```
-------------------- 在 Fedora 22 上 --------------------
# yum install @xfce
-------------------- 在 Fedora 23-24 上 --------------------
# dnf install @xfce-desktop-environment
```


安装 Xfce 以后，你可以从会话菜单选择 Xfce 登录或者重启系统。

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


在这个简单的入门指南中，我们讲解了如何安装最新版 Xfce 桌面的步骤，我相信这很容易掌握。如果一切进行良好，你可以享受一下使用 xfce —— 这个[ Linux 系统上最佳桌面环境][1]之一。

此外，如果你再次回来，你可以通过下面的反馈表单和我们始终保持联系。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-xfce-desktop-in-ubuntu-fedora/

作者：[Aaron Kili][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/best-linux-desktop-environments/
[2]: https://www.xfce.org/about/news/?post=1425081600
