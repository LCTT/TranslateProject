i3 窗口管理器入门
======

> 本篇文章会介绍如何在 Fedora 系统中，安装、配置、使用 i3 瓦片式桌面管理器。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/windows-tiling-windows-wall.png?itok=mTH7uVrn)

在我的文章 [i3 桌面让 Linux 更好的 5 个理由][1]，我分享了选择 [i3 桌面管理器][2] 作为一种 Linux 桌面替代方案的最主要五个理由。

在本篇文章中，我将向大家展示，如何在 Fedora 28 上安装与简单配置 i3。

### 1、 安装

首先进入 Fedora 系统中，打开一个终端。使用 `dnf` 来安装需要的软件包，如下：

```
[ricardo@f28i3 ~]$ sudo dnf install -y i3 i3-ipc i3status i3lock dmenu terminator --exclude=rxvt-unicode
Last metadata expiration check: 1:36:15 ago on Wed 08 Aug 2018 12:04:31 PM EDT.
Dependencies resolved.
================================================================================================
 Package                     Arch         Version                           Repository     Size
================================================================================================
Installing:
 dmenu                       x86_64       4.8-1.fc28                        fedora         33 k
 i3                          x86_64       4.15-1.fc28                       fedora        323 k
 i3-ipc                      noarch       0.1.4-12.fc28                     fedora         14 k
 i3lock                      x86_64       2.9.1-2.fc28                      fedora         33 k
 i3status                    x86_64       2.12-1.fc28                       updates        62 k
 terminator                  noarch       1.91-4.fc28                       fedora        570 k
Installing dependencies:
 dzen2                       x86_64       0.8.5-21.20100104svn.fc28         fedora         60 k

... Skipping dependencies/install messages

Complete!
[ricardo@f28i3 ~]$
```

注意：在这个命令中，我排除了 `rxvt-unicode` 这个包，因为我更喜欢 `terminator` 作为我的终端模拟器。

据用户目前的系统状态，在命令执行过程中可能会安装很多依赖。等待所有的依赖安装完成，之后重启你的电脑。

### 2、 首次登录与初始化

在你的机器重启之后，你便可以第一次体验 i3 了。在 GNOME 显示管理器（GDM）屏幕，选择你的用户名，之后先别着急输密码，点击下方的密码输入框下方的小齿轮，之后选择 i3 而不是 GNOME，像下方这样：

![](https://opensource.com/sites/default/files/uploads/i3_first_login_small.png)

输入你的密码，并点击 “Sign In”。在你第一次登入之后，会先看到 i3 的配置界面：

![](https://opensource.com/sites/default/files/uploads/i3_first_configuration_small.png)

点击回车键就会在 `$HOME/.config/i3` 生成一个配置文件，之后你可以通过这个配置文件来定制化 i3 的一些行为。

在下一屏，你需要选择你的 `Mod` 键。这一步很关键，因为 `Mod` 键通常都会作为 i3 命令快捷键的发起键。按回车会选择 `Win` 键作为默认的 `Mod` 键。如果你的键盘没有 `Win` 键，用 `Alt` 键做替代，用方向键键选择后按回车键确认。

![](https://opensource.com/sites/default/files/uploads/i3_generate_config_small.png)

现在你就登录到了 i3 的系统中。由于 i3 是一个极简的窗口管理器，你会看到一个黑屏窗口，以及屏幕底端显示的状态栏：

![](https://opensource.com/sites/default/files/uploads/i3_start_small.png)

接下来，让我们看看 i3 的如何实际使用。

### 3、 基本的快捷键

现在你已经登录到了 i3 会话中，你需要几个基本的快捷键来应对基本的操作。

大多数的 i3 快捷键都会用到之前配置的 `Mod` 键。在下面的例子中，当我提到 `Mod` 键，请根据情况使用你定义的做替换。通常使用 `Win` 键或者 `Alt` 键。

首先，要打开一个终端，可以使用 `Mod+ENTER`。重复打开几个终端，观察 i3 是如何自动将它们在桌面中排列。默认情况下， i3 会在水平的方向分割屏幕；使用 `Mod + v` 来垂直分割，再按 `Mod + h` 会恢复水平分割模式。

![](https://opensource.com/sites/default/files/uploads/i3_3terminal_tiled_small.png)

当需要启动其他的应用，按 `Mod + d` 来打开 `dmenu`，一个简单的文字应用菜单。默认情况下，`dmenu` 会呈现出所有在你 `$PATH` 中设置的应用。使用方向键来选择你想启动的应用，同时你可以键入应用的名称，来缩小选择的范围，之后按回车键来启动选择的应用。

![](https://opensource.com/sites/default/files/uploads/i3_dmenu.png)

如果你的应用没有提供退出的方法，你可以使用 i3 来关闭对应的窗口，通过按 `Mod + Shift +q`。注意，你可能会丢失未保存的工作内容。

最后，当你想关闭会话并退出 i3，按 `Mod + Shift +e`。之后会在窗口的上方提示你是否退出。点击 “Yes, exit i3” 退出，或选择 “X” 来取消。

![](https://opensource.com/sites/default/files/uploads/i3_exit_small.png)

这些就是 i3 中最基本的快捷键，如果想了解更多，请查阅官方[文档][3]。

### 4、 替换 GDM

使用 i3 窗口管理器会降低你操作系统的内存占用；然而，Fedora 依然会使用 GDM 作为登录屏。GDM 会载入几个与 GNOME 相关的库从而占用内存。

如果你想进一步的降低你的内存占用，你可以使用一些更轻量级的显示管理器来替换 GDM，比如 lightdm ：

```
[ricardo@f28i3 ~]$ sudo dnf install -y lightdm
[ricardo@f28i3 ~]$ sudo systemctl disable gdm
Removed /etc/systemd/system/display-manager.service.
[ricardo@f28i3 ~]$ sudo systemctl enable lightdm
Created symlink /etc/systemd/system/display-manager.service -> /usr/lib/systemd/system/lightdm.service.
[ricardo@f28i3 ~]$
```

之后重启你的机器来使用 Lightdm 的登录界面。

现在你可以继续登录并使用 i3了。

![](https://opensource.com/sites/default/files/uploads/i3_lightdm_small.png)

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/getting-started-i3-window-manager

作者：[Ricardo Gerardi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[sd886393](https://github.com/sd886393)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rgerardi
[1]: https://opensource.com/article/18/8/i3-tiling-window-manager
[2]: https://i3wm.org
[3]: https://i3wm.org/docs/userguide.html#_default_keybindings
