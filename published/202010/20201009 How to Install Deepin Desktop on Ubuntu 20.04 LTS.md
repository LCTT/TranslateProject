[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12724-1.html)
[#]: subject: (How to Install Deepin Desktop on Ubuntu 20.04 LTS)
[#]: via: (https://itsfoss.com/install-deepin-ubuntu/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

如何在 Ubuntu 20.04 LTS 上安装深度（Deepin）桌面环境
======

![](https://img.linux.net.cn/data/attachment/album/202010/15/223607kqs5zguiq53fkkig.png)

> 本教程向你展示在 Ubuntu 上安装深度（Deepin）桌面环境的正确步骤。还提到了移除步骤。

毫无疑问，深度操作系统（Deepin OS）是一个 [漂亮的 Linux 发行版][1]。最近发布的 [深度操作系统 V20][2] 就更加美观了。

[深度操作系统][3] 是基于 [Debian][4] 的，默认的存储库镜像太慢了。如果你更愿意使用 Ubuntu，可以选择 [UbuntuDDE Linux 发行版][5] 形式的 Ubuntu 的深度操作系统的变体。它还不是 [官方的 Ubuntu 风格][6] 之一。

[重新安装新的发行版][7] 是一个麻烦，因为你会丢失数据，你将不得不在新安装的 UbuntuDDE 上重新安装你的应用程序。

一个更简单的选择是在现有的 Ubuntu 系统上安装深度桌面环境（DDE）。毕竟，你可以轻松地在一个系统中安装多个[桌面环境][8]。

不要烦恼，这很容易做到，如果你不喜欢，也可以恢复这些更改。让我来告诉你怎么做。

### 在 Ubuntu 20.04 上安装深度桌面环境

UbuntuDDE 团队已为他们的发行版创建了一个 PPA，你可以使用相同的 PPA 在 Ubuntu 20.04 上安装深度桌面环境。请记住，此 PPA 仅适用于 Ubuntu 20.04。请阅读有关 [在 Ubuntu 中使用 PPA][10]。

> 没有深度桌面环境 V20
>
> 你将在此处使用 PPA 安装的深度桌面环境还不是新的 V20。它可能会在 Ubuntu 20.10 发布后出现，但是我们不能担保。

以下是你需要遵循的步骤：

**步骤 1**：你需要首先在终端上输入以下内容，来添加 [Ubuntu DDE Remix 团队的官方 PPA][11]：

```
sudo add-apt-repository ppa:ubuntudde-dev/stable
```

**步骤 2**：添加存储库以后，继而安装深度桌面环境。

```
sudo apt install ubuntudde-dde
```

![][12]

现在，安装将启动，一段时间后，将要求你选择<ruby>显示管理器<rt>display manager</rt></ruby>。

![][13]

如果需要深度桌面主题的锁屏，则需要选择 “lightdm”。如果不需要，你可以将其设置为 “gdm3”。

如果你看不到此选项，可以通过键入以下命令来获得它，然后选择你首选的显示管理器：

```
sudo dpkg-reconfigure lightdm
```

**步骤 3**： 完成后，你必须退出并通过选择 “Deepin” 会话再次登录，或者重新启动系统。

![][14]


就是这样。马上在你的 Ubuntu 20.04 LTS 系统上享受深度桌面环境体验吧！

![][15]

### 从 Ubuntu 20.04 删除深度桌面

如果你不喜欢这种体验，或者由于某些原因它有 bug，可以按照以下步骤将其删除。

**步骤 1**： 如果你已将 “lightdm” 设置为显示管理器，则需要在卸载深度桌面环境之前将显示管理器设置为 “gdm3”。为此，请键入以下命令：

```
sudo dpkg-reconfigure lightdm
```

![Select gdm3 on this screen][13]

然后，选择 “gdm3” 继续。

完成此操作后，你只需输入以下命令即可完全删除深度桌面环境：

```
sudo apt remove startdde ubuntudde-dde
```

你只需重启即可回到原来的 Ubuntu 桌面环境。如果图标没有响应，只需打开终端（`CTRL + ALT + T`）并输入：


```
reboot
```

### 总结

有不同的 [桌面环境选择][16] 是件好事。如果你真的喜欢深度桌面环境的界面，那么这可能是在 Ubuntu 上体验深度操作系统的一种方式。

如果你有任何疑问或遇到任何问题，请在评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-deepin-ubuntu/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[gxlct008](https://github.com/gxlct008)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/beautiful-linux-distributions/
[2]: https://itsfoss.com/deepin-20-review/
[3]: https://www.deepin.org/en/
[4]: https://www.debian.org/
[5]: https://itsfoss.com/ubuntudde/
[6]: https://itsfoss.com/which-ubuntu-install/
[7]: https://itsfoss.com/reinstall-ubuntu/
[8]: https://itsfoss.com/what-is-desktop-environment/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/ubuntu-20-with-deepin.jpg?resize=800%2C386&ssl=1
[10]: https://itsfoss.com/ppa-guide/
[11]: https://launchpad.net/~ubuntudde-dev/+archive/ubuntu/stable
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/deepin-desktop-install.png?resize=800%2C534&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/deepin-display-manager.jpg?resize=800%2C521&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/deepin-session-ubuntu.jpg?resize=800%2C414&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/ubuntu-20-with-deepin-1.png?resize=800%2C589&ssl=1
[16]: https://itsfoss.com/best-linux-desktop-environments/
