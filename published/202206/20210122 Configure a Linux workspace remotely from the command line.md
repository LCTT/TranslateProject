[#]: collector: (lujun9972)
[#]: translator: (Donkey-Hao)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14776-1.html)
[#]: subject: (Configure a Linux workspace remotely from the command line)
[#]: via: (https://opensource.com/article/21/1/remote-configuration-xfce4)
[#]: author: (David Both https://opensource.com/users/dboth)

从命令行远程配置 Xfce4 工作区
======

> 几乎所有的事情都可以从 Linux 命令行完成，包括对 Xfce4 进行远程配置。

![](https://img.linux.net.cn/data/attachment/album/202206/30/114747lfub5hh0b5nyquf3.jpg)

与专有操作系统相比，我很欣赏 Linux 的一个特点是，几乎所有的东西都可以从命令行中进行管理和配置。意味着几乎所有的事情都可以在本地或者通过 SSH 远程登录进行管理。虽然有时候需要花费一点时间在互联网上搜索，但是你能想到的任务，是有可能从命令行完成的。

### 问题

有时候需要使用命令行对桌面进行远程配置。在这种特殊情况下，我需要响应远程用户的请求将在 [Xfce][2] 控制板上的工作区从四个减少到三个。这种配置只需要在互联网上搜索约 20 分钟就找到了。

xfwm4 的默认工作区数量和许多其他设置可以在 `/usr/share/xfwm4/defaults` 这个文件中找到和修改。因此将 `workspace_count=2` 设置为 `workspace_count=4` 就改变了主机上所有用户的默认值。同时，非 root 用户可以执行 `xfconf-query` 命令来查询和设置 xfwm4 窗口管理器的各种属性。它应该由需要改变设置的用户使用，而不是由 root 使用。

在下面的例子中，首先我验证了当前工作区数量为 `4` ，然后将数量改为 `2`，最后确认了新设置。

```
[user@test1 ~]# xfconf-query -c xfwm4 -p /general/workspace_count
4
[user@test1 ~]# xfconf-query -c xfwm4 -p /general/workspace_count -s 2
[user@test1 ~]# xfconf-query -c xfwm4 -p /general/workspace_count
2
[user@test1 ~]#
```

此更改会立即生效，用户可以马上看到，无需重新启动，甚至无需注销并重新登录。我曾在我的工作站上玩过这个游戏，当我输入设置不同数量的工作空间的命令时，可以观察到工作空间切换器的变化。我在哪儿都能找到乐子。;- )

### 更多探索

现在我解决了这个问题，我决深入了解一下 `xfconf-query` 命令。不幸的是，该工具没有手册或信息页，`/usr/share` 中也没有任何文档。退而求其次，使用 `-h` 选项获取一些帮助信息。

```
$ xfconf-query -h
 Usage:
   xfconf-query [OPTION…] - Xfconf commandline utility
 Help Options:
   -h, --help            显示帮助选项
 Application Options:
   -V, --version         版本信息
   -c, --channel         查询/修改通道
   -p, --property        查询/修改属性
   -s, --set             更新权限的值
   -l, --list            罗列属性（或者通道，如果没有用 -c 指定）
   -v, --verbose         详细输出
   -n, --create          当新属性不存在，则创建它
   -t, --type            指定属性值类型
   -r, --reset           重置属性
   -R, --recursive       递归（与 -r 一起使用）
   -a, --force-array     即使只有一个元素也强制采用数组
   -T, --toggle          反转现有的布尔属性
   -m, --monitor         监视属性更改的通道
```

这没有多大帮助，但我们还是可以从中找出一些有用的东西。首先，_通道_ 是可以修的属性的分组。我对 `general` 通道下的 `workspace_count` 属性进行了更改。让我们看看完整的通道列表：

```
$ xfconf-query -l
Channels:
  xfwm4
  xfce4-keyboard-shortcuts
  xfce4-notifyd
  xsettings
  xfdashboard
  thunar
  parole
  xfce4-panel
  xfce4-appfinder
  xfce4-settings-editor
  xfce4-power-manager
  xfce4-session
  keyboards
  displays
  keyboard-layout
  ristretto
  xfcethemer
  xfce4-desktop
  pointers
  xfce4-settings-manager
  xfce4-mixer
```

给定通道的属性也可以用下列的命令来查看。我使用 `less` 分页器，因为结果是一长串数据。我对下面的列表进行了裁剪，但留下了足够多的条目，你可以看到这些条目的类型。

```
$ xfconf-query -c xfwm4 -l | less
/general/activate_action
/general/borderless_maximize
/general/box_move
/general/box_resize
/general/button_layout
/general/button_offset
<裁剪>
/general/workspace_count
/general/workspace_names
/general/wrap_cycle
/general/wrap_layout
/general/wrap_resistance
/general/wrap_windows
/general/wrap_workspaces
/general/zoom_desktop
(END)
```

你可以用这种方式探索所有的通道。我发现通道通常对应“设置管理器”中的各种设置。这些属性是你在这些对话框中设置的。请注意，并非你在“设置管理器”对话窗口中找到的所有设置都是 Xfce 桌面的一部分，因此它们没有对应的通道。屏幕保护程序就是一个例子，因为它是通用的 GNU 屏幕保护程序，并不是 Xfce 独有的。“设置管理器” 是 Xfce 定位这些配置工具的一个很好的中心位置。

### 文档

综上所述，`xconf-query` 命令似乎没有任何手册或信息页，并且我在网上发现了很多不正确的、记录不全的信息。我发现对 Xfce4 来说最好的文档是 [Xfce 网站][2]，关于 `xconf-query` 的一些具体信息可以在这里找到。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/remote-configuration-xfce4

作者：[David Both][a]
选题：[lujun9972][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://www.xfce.org/
