[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12258-1.html)
[#]: subject: (How to Properly Install and Setup KDE Plasma on Arch Linux)
[#]: via: (https://itsfoss.com/install-kde-arch-linux/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

如何在 Arch Linux 上正确安装和设置 KDE Plasma？
======

我相信你是按照[这份很棒的指南安装来 Arch Linux][1] 的，这篇指南最后提到了 [GNOME 桌面][2]的安装步骤。

但现在，不是每个人都是 GNOME 的粉丝，有几个读者要求我们向他们展示如何在 [Arch Linux][4] 上配置 [KDE 桌面][3]。

因此，我创建了这个指南来演示如何在 Arch Linux 上正确安装和配置 KDE 桌面（也被称为 KDE Plasma桌面）的步骤。

### 如何在 Arch Linux 上安装和设置 KDE 桌面环境？

![][5]

请记住，KDE 不允许直接以 root 身份登录。如果你已经安装了 Arch Linux 并以 root 身份使用，你应该创建一个新的用户，并给它以 root 身份运行命令的 sudo 权限。

如果你只是最小化安装了 Arch Linux，那么你可能是以 TTY 终端方式登录的。如果你使用的是其他桌面环境，步骤也是一样的。

让我们开始吧!

#### 步骤 1：创建一个 sudo 用户（如果你只有 root 用户）

你可以使用 [useradd 命令][6]来创建一个新用户。我创建的用户名为 `dimitrios`（这是我的名字）。你可以使用与你的名字匹配的东西。

选项 `-m` 为新创建的用户创建一个主目录。

```
useradd -m dimitrios
```

你还应该为这个用户设置一个密码。使用此命令：

```
passwd dimitrios
```

现在你已经创建了用户，给它 sudo 权限。首先，安装 sudo 和一个像 [nano][8] 这样的[命令行文本编辑器][7]。

```
pacman -S sudo nano
```

sudo 的配置文件是 `/etc/sudoers`。该文件应该使用 `visudo` 来编辑，它会锁定 `sudoers` 文件，将编辑的内容保存到一个临时文件中，并在复制到 `/etc/sudoers` 之前检查该文件的语法。

要使用 `nano` 作为 `visudo` 编辑器，请这样设置:

```
EDITOR=nano visudo
```

像我的示例那样添加下面这一行，然后保存并退出。

```
dimitrios ALL=(ALL) ALL
```

![Adding Sudoer in Arch Linux][9]

保存你的更改，然后退出编辑器。你现在在 Arch Linux 上有了一个 sudo 用户。

#### 步骤 2 ：安装 KDE Plasma 桌面

要运行 KDE 桌面，你需要以下软件包。

  * [Xorg][10] 组
  * [KDE Plasma][3] 桌面环境
  * [Wayland][11] KDE Plasma 的会话
  * [KDE 应用程序][12]组（包括 KDE 特有的应用程序：Dolphin 管理器和其他有用的应用程序）。

你可以用下面的命令安装上述部分。

```
pacman -S xorg plasma plasma-wayland-session kde-applications
```

安装后，启用显示管理器和网络管理器服务。

```
systemctl enable sddm.service
systemctl enable NetworkManager.service
```

快完成了。关闭你的系统。

```
shutdown now
```

重新打开系统电源，你应该会看到 KDE 的登录界面。你还记得为你的 sudo 用户设置的密码吗？用它来登录。

![Arch KDE Plasma Desktop][13]

#### 接下来？

你可能会想探索一下[基本的 pacman 命令][14]，了解一下 [Arch 用户资源库][15]，了解一下 [AUR 助手][16]。

希望这篇教程对你在 Arch Linux 上安装 KDE 桌面有所帮助。如果你在安装过程中遇到任何障碍或困难，请在下面的评论中告诉我们。

你最喜欢的桌面环境或窗口管理器是什么？请告诉我们，别忘了在我们的社交媒体上订阅。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-kde-arch-linux/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-9170-1.html
[2]: https://www.gnome.org/
[3]: https://kde.org/plasma-desktop
[4]: https://www.archlinux.org/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/install-kde-arch-linux.png?ssl=1
[6]: https://linuxhandbook.com/useradd-command/
[7]: https://itsfoss.com/command-line-text-editors-linux/
[8]: https://www.nano-editor.org/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/adding-sudoer-arch-linux.png?ssl=1
[10]: https://wiki.archlinux.org/index.php/Xorg
[11]: https://wiki.archlinux.org/index.php/Wayland
[12]: https://www.archlinux.org/groups/x86_64/kde-applications/
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/Arch-Plasma-desktop.jpg?fit=800%2C450&ssl=1
[14]: https://itsfoss.com/pacman-command/
[15]: https://linux.cn/article-12107-1.html
[16]: https://linux.cn/article-12019-1.html
