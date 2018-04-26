另一个 TUI 图形活动监视器，使用 Go 编写
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/Gotop-720x340.png)
你已经知道 “top” 命令，对么？是的，它提供类 Unix 操作系统中运行中的进程的动态实时信息。一些开发人员为 top 命令构建了图形前端，因此用户可以在图形窗口中轻松找到他们系统的活动。其中之一是 **Gotop**。顾名思义，Gotop 是一个 TUI 图形活动监视器，使用 **Go** 语言编写。它是完全免费、开源的，受到 [gtop][1] 和 [vtop][2] 的启发。

在此简要的指南中，我们将讨论如何安装和使用 Gotop 来监视 Linux 系统的活动。

### 安装 Gotop

Gotop 是用 Go 编写的，所以我们需要先安装它。要在 Linux 中安装 Go 语言，请参阅以下指南。

安装 Go 之后，使用以下命令下载最新的 Gotop 二进制文件。
```
$ sh -c "$(curl https://raw.githubusercontent.com/cjbassi/gotop/master/download.sh)"

```

然后，将下载的二进制文件移动到您的 $PATH 中，例如 **/usr/local/bin/**。
```
$ cp gotop /usr/local/bin

```

最后，用下面的命令使其可执行：
```
$ chmod +x /usr/local/bin/gotop

```

如果你使用的是基于 Arch 的系统，Gotop 存在于 **AUR** 中，所以你可以使用任何 AUR 助手程序进行安装。

使用 [**Cower**][3]：
```
$ cower -S gotop

```

使用 [**Pacaur**][4]：
```
$ pacaur -S gotop

```

使用 [**Packer**][5]：
```
$ packer -S gotop

```

使用 [**Trizen**][6]：
```
$ trizen -S gotop

```

使用 [**Yay**][7]：
```
$ yay -S gotop

```

使用 [yaourt][8]：
```
$ yaourt -S gotop

```

### 用法

Gotop 的使用非常简单！你所要做的就是从终端运行以下命令。
```
$ gotop

```

这样就行了！你将在简单的 TUI 窗口中看到系统 CPU、磁盘、内存、网络、CPU温度和进程列表的使用情况。

![][10]

要仅显示CPU、内存和进程组件，请使用下面的 **-m** 标志
```
$ gotop -m

```

![][11]

你可以使用以下键盘快捷键对进程表进行排序。

  * **c** – CPU
  * **m** – 内存
  * **p** – PID



对于进程浏览，请使用以下键。

  * **上/下** 箭头或者 **j/k** 键用于上移下移。
  * **Ctrl-d** 和 **Ctrl-u** – 上移和下移半页。
  * **Ctrl-f** 和 **Ctrl-b** – 上移和下移整页。
  * **gg** 和 **G** – 跳转顶部和底部。



按下 **< TAB>** 切换进程分组。要杀死选定的进程或进程组，请输入 **dd**。要选择一个进程，只需点击它。要向下/向上滚动，请使用鼠标滚动按钮。要放大和缩小 CPU 和内存图，请使用 **h** 和 **l**。要显示帮助菜单，只需按 **?**。

**推荐阅读：**

就是这些了。希望这有帮助。还有更多好东西。敬请关注！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/gotop-yet-another-tui-graphical-activity-monitor-written-in-go/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://github.com/aksakalli/gtop
[2]:https://github.com/MrRio/vtop
[3]:https://www.ostechnix.com/cower-simple-aur-helper-arch-linux/
[4]:https://www.ostechnix.com/install-pacaur-arch-linux/
[5]:https://www.ostechnix.com/install-packer-arch-linux-2/
[6]:https://www.ostechnix.com/trizen-lightweight-aur-package-manager-arch-based-systems/
[7]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[8]:https://www.ostechnix.com/install-yaourt-arch-linux/
[9]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[10]:http://www.ostechnix.com/wp-content/uploads/2018/04/Gotop-1.png
[11]:http://www.ostechnix.com/wp-content/uploads/2018/04/Gotop-2.png
