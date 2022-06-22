[#]: collector: (lujun9972)
[#]: translator: (Donke-Hao)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Configure a Linux workspace remotely from the command line)
[#]: via: (https://opensource.com/article/21/1/remote-configuration-xfce4)
[#]: author: (David Both https://opensource.com/users/dboth)

从命令行远程配置 Linux 工作区

======

几乎所有的事情都可以从 Linux 命令行完成，包括 Xfce4 的远程配置。
![Coding on a computer][1]

几乎所有的事情都可以通过命令行管理和配置。意味着几乎所有的事情都可以在本地或者通过 SSH 远程登录进行管理。有时候在互联网上搜索会花费一点时间，但是如果（译者：个人感觉这里上下文有省略一些意思，我感觉是“如果利用这段时间，你能想到…”——_**请校对者注意并删除括号内的话**_）你能想到一个可能可以从命令行完成的任务。


### 问题
有时候需要使用命令行进行远程修改。在这种特殊情况下，我需要响应远程用户的请求将在 [Xfce][2] 控制板上的工作区从四个减少到三个。这种配置仅需要在互联网上搜索约 20 分钟。

默认工作区数量和许多其他 **xfwm4** 设置可以在 **/usr/share/xfwm4/defaults** 这个文件中找到并修改。因此将 _workspace_count=2_ 设置为 _workspace_count=4_  改变了所有主机的默认值。 同时，非 root 用户可以执行 **xfconf-query** 命令来查询并修改 **xfwm4** 窗口管理器的不同属性。它应该由需要更改的用户帐户使用，而不是由 root 使用。

在下面的例子中，首先我验证了当前工作区数量为 _4_ ，然后将数量改为 _2_ ,最后确认了新设置。



```
[user@test1 ~]# xfconf-query -c xfwm4 -p /general/workspace_count
4
[user@test1 ~]# xfconf-query -c xfwm4 -p /general/workspace_count -s 2
[user@test1 ~]# xfconf-query -c xfwm4 -p /general/workspace_count
2
[user@test1 ~]#
```

此更改会立即发生，并且用户可以看到，无需重新启动，甚至无需注销并重新登录。当我输入命令以设置不同数量的工作区时，通过观察工作区切换器的变化，使我在我的工作站上有些快乐。 这些天，我尽我所能获得娱乐。 ;-)


### 更多探索

现在我解决了问题，我决定更详细的探索一下 **xfconf-query** 命令。不幸的是，该工具没有手册或信息页，**/usr/share** 中也没有任何文档。退而求其次，使用 **-h** 选项获取一些帮助信息。


```
$ xfconf-query -h
 Usage:
   xfconf-query [OPTION…] - Xfconf commandline utility
 Help Options:
   -h, --help            显示帮助选项
 Application Options:
   -V, --version         版本信息
   -c, --channel         询问/修改通道
   -p, --property        询问/修改属性
   -s, --set             更新权限的值
   -l, --list            罗列属性（或者通道 如果没有用 -c 指定）
   -v, --verbose         详细输出
   -n, --create          当新属性不存在，则创建它
   -t, --type            指定属性值类型
   -r, --reset           重置属性
   -R, --recursive       递归（与 -r 一起使用）
   -a, --force-array     即使只有一个元素也强制数组
   -T, --toggle          反转现有的布尔属性
   -m, --monitor         监视属性更改的通道
```

这没有多大帮助，但无论如何我们都可以从中找出一些好处。首先， _通道_ 以属性分组便于修改。我对 **general** 通道进行了更改，属性为 **workspace_count** 。 让我们看看完整的通道列表。

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

给定通道的属性也可以用下列的命令来查看。我使用 **less** 寻呼机，因为结果是一长串数据。我已经缩减了下表，但留下了足够的空间来查看你可以找到的条目类型。


```
$ xfconf-query -c xfwm4 -l | less
/general/activate_action
/general/borderless_maximize
/general/box_move
/general/box_resize
/general/button_layout
/general/button_offset
&lt;SNIP&gt;
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

你可以用这种方式探索所有的通道。我发现频道通常对应 **设置管理器** 中的各种设置。属性是你将在这些对话框中设置的属性。请注意，并非您会在 **设置管理器** 对话窗口中找到的所有图标都是 **Xfce** 桌面的一部分，因此它们没有对应的通道。 **屏幕保护程序** 就是一个例子，因为它是通用的 GNU 屏幕保护程序，并不是 **Xfce** 独有的。 **设置管理器** 是 **Xfce** 定位这些配置工具的一个很好的中心位置。


### 总结

综上所述，在 **xconf-query** 命令似乎没有任何手册或信息页，并且我在网上发现了一些错误的糟糕的记录信息。我发现对 **Xfce4** 来说最好的文件是 [Xfce 网站][2]，以及一些具体信息可以在 **xconf-query** 找到。、

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/remote-configuration-xfce4

作者：[David Both][a]
选题：[lujun9972][b]
译者：[Donke-Hao](https://github.com/Donke-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://www.xfce.org/
