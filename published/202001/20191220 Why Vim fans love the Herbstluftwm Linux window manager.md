[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11734-1.html)
[#]: subject: (Why Vim fans love the Herbstluftwm Linux window manager)
[#]: via: (https://opensource.com/article/19/12/herbstluftwm-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

为什么 Vim 爱好者喜欢 Herbstluftwm Linux 窗口管理器
======

> 本文是 24 天 Linux 桌面特别系列的一部分。如果你是 Vim 爱好者，请试试 Herbstluftwm，这是一个受到 “Vim 方式”启发的平铺式 Linux 窗口管理器。

![](https://img.linux.net.cn/data/attachment/album/201912/31/215943pisvzwkm8mvsefhm.jpg)

每个人都喜欢 Vim（除了 Dvorak 和 Emacs 用户）。Vim 非常流行，它不仅仅是个编辑器，还有整个都使用 Vim 键绑定来浏览网页的 Web 浏览器，在非常流行的 [Zsh][2] 终端仿真器中也有 Vim 模式。此外，还有一个名为 [herbstluftwm][3] 的窗口管理器，它部分模仿了 “Vim 方式”。Herbstluftwm 取消了窗口，而是在程序载入和使用时使用平铺的贴片或者象限代替。你可以使用键盘（`Alt+h`、`Alt+j`、`Alt+k` 和 `Alt+l`）从一个平铺贴片移动到另一个平铺贴片。

可以从发行版软件仓库安装 Herbstluftwm。安装后，请退出当前桌面会话，以便可以登录到新会话。默认情况下，会话管理器（KDM、GDM、LightDM 或 XDM，具体取决于你的设置）将继续登录到以前的桌面，因此在登录之前必须覆盖它。

在 GDM 中：

![][5]

在 SDDM 中：

![][6]

### Herbstluftwm 桌面之旅

第一次登录 Herbstluftwm 时，你只会看到一个绿屏，边缘有深绿色边框。你所看到的是初始的平铺贴片，其中没有加载任何应用程序。要启动默认应用，请按 `Alt+Enter`。

![][4]

文档中强调使用 `$HOME/.config/herbstluftwm/autostart` 作为登录时启动重要应用的配置文件。对于不必在每次登录时启动的应用，可以使用 xterm 作为启动守护进程。与往常一样，在命令后加一个 `&` 符号会将 shell 的控制权返回给你。例如，要启动 Emacs：

```
% emacs &
```

这将在新的平铺贴片中启动 Emacs 窗口，然后返回命令行。

![Emacs running in Herbstluftwm][7]

#### 切换平铺贴片

要从一个平铺贴片移动到另一个平铺贴片，请使用经典的 `h`、`j`、`k` 或 `l` 与 `Alt` 的 Vim 导航组合键。例如，要从终端切换到其下方的平铺贴片中的应用（即屏幕底部），请按 `Alt+j`。要返回，请按 `Alt+k`。左移和右移分别为 `Alt+h` 和 `Alt+l`。

#### 分割屏幕

你可以使用 `Alt+o` 垂直分割屏幕，使用 `Alt+u` 水平分割屏幕。

要删除空白平铺贴片，请移动到该平铺贴片，然后按 `Alt+r`。

### 配置 herbstluftwm

除了 `Alt` 键绑定外，你还可通过 `herbstclient` 命令与 Herbstluftwm 进行通信。此命令可以在 shell 中交互，或者你可在配置文件中保留你的首选项。

你可以查看 Herbstluftwm 中的所有可用属性：

```
$ herbstclient attr
```

Herbstluftwm 的默认行为定义在其默认配置文件中，你可以将其复制到你的家目录并进行修改。启动后，Herbstluftwm 执行配置文件中包含的命令。例如，你觉得使用以 `Alt` 为中心的键绑定很笨拙（它传统上是应用内保留快捷键），那你可以在配置文件中更改触发 Herbstluftwm 操作的键：

```
% mkdir ~/.config/herbstluftwm
% cp /usr/xdg/herbstluftwm/autostart ~/.config/herbstluftwm
% sed -i 's/Mod=Mod1/Mod=Mod4/' ~/.config/herbstluftwm
% herbstclient reload
```

这将使 Herbstluftwm 的修饰键更改为 `Super` 键（“Windows” 或 “Tux” 键，具体取决于你的键盘）。

使用 `autostart` 文件，你可以设置自定义键绑定，为特定类型的应用创建标签，以便以一致的方式平铺应用，并执行更多操作。

### 为何你要尝试 herbstluftwm

Herbstluftwm 是一个平铺窗口管理器的很好例子。它默认平铺窗口，并允许用户定义全局规则的例外。它使用类似 Vim 的导航方式，但可以快速简单地覆盖它。它可能是你一直在寻找的平铺管理器，所以请马上尝试一下。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/herbstluftwm-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openstack_python_vim_2.jpg?itok=4fza48WU (OpenStack source code (Python) in VIM)
[2]: https://opensource.com/article/19/9/getting-started-zsh
[3]: https://herbstluftwm.org
[4]: https://opensource.com/sites/default/files/uploads/advent-herbsluftwm.png (Herbstluftwm)
[5]: https://opensource.com/sites/default/files/advent-gdm_1.jpg
[6]: https://opensource.com/sites/default/files/advent-kdm_0.jpg
[7]: https://opensource.com/sites/default/files/uploads/advent-herbsluftwm-emacs.jpg (Emacs running in Herbstluftwm)
