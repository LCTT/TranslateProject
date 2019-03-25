[#]: collector: (lujun9972)
[#]: translator: (FSSlc)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10651-1.html)
[#]: subject: (4 Methods To Change The HostName In Linux)
[#]: via: (https://www.2daygeek.com/four-methods-to-change-the-hostname-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Linux 中改变主机名的 4 种方法
======

昨天我们已经在我们的网站中写过[如何在 Linux 中修改主机名的文章][1]。今天，我们将向你展示使用不同的方法来修改主机名。你可以从中选取最适合你的方法。

使用 `systemd` 的系统自带一个名为 `hostnamectl` 的好用工具，它可以使我们能够轻易地管理系统的主机名。

当你使用这个原生命令时，它可以立刻改变主机名而无需重启来生效。

但假如你通过手动修改某个配置文件来更改主机名，那么就可能需要经过重启来生效。

在这篇文章中，我们将展示在使用 `systemd` 的系统中改变主机名的 4 种方法。

`hostnamectl` 命令允许在 Linux 中设置三类主机名，它们的细节如下：

  * **静态：** 这是静态主机名，由系统管理员添加。
  * **瞬时/动态：** 这个由 DHCP 或者 DNS 服务器在运行时赋予。
  * **易读形式：** 它可以由系统管理员赋予。这个是自由形式的主机名，以一种易读形式来表示服务器，例如 “JBOSS UAT Server” 这样的名字。

这些都可以使用下面 4 种方法来设置。

  * `hostnamectl` 命令：控制系统主机名。
  * `nmcli` 命令：是一个控制 NetworkManager 的命令行工具。
  * `nmtui` 命令：是一个控制 NetworkManager 的文本用户界面。
  * `/etc/hostname` 文件：这个文件中包含系统的静态主机名。

### 方法 1：在 Linux 中使用 hostnamectl 来改变主机名

`hostnamectl` 可被用来查询和改变系统的主机名，以及相关设定。只需运行 `hostnamectl` 便可以查看系统的主机名了。

```
$ hostnamectl
```

或者使用下面的命令：

```
$ hostnamectl status
   Static hostname: daygeek-Y700
         Icon name: computer-laptop
           Chassis: laptop
        Machine ID: 31bdeb7b83230a2025d43547368d75bc
           Boot ID: 267f264c448f000ea5aed47263c6de7f
  Operating System: Manjaro Linux
            Kernel: Linux 4.19.20-1-MANJARO
      Architecture: x86-64
```

假如你想改变主机名，可以使用下面的命令格式：

语法格式：

```
$ hostnamectl set-hostname [YOUR NEW HOSTNAME]
```

使用下面的命令来使用 `hostnamectl` 更改主机名。在这个例子中，我将把主机名从 `daygeek-Y700` 改为 `magi-laptop`。

``` 
$ hostnamectl set-hostname magi-laptop
```

你可以使用下面的命令来查看更新后的主机名。

```
$ hostnamectl
   Static hostname: magi-laptop
         Icon name: computer-laptop
           Chassis: laptop
        Machine ID: 31bdeb7b83230a2025d43547368d75bc
           Boot ID: 267f264c448f000ea5aed47263c6de7f
  Operating System: Manjaro Linux
            Kernel: Linux 4.19.20-1-MANJARO
      Architecture: x86-64
```

### 方法 2：在 Linux 中使用 nmcli 命令来更改主机名

`nmcli` 是一个命令行工具，旨在控制 NetworkManager 并报告网络状态。

`nmcli` 被用来创建、展示、编辑、删除、激活和注销网络连接，同时还可以用来控制和展示网络设备的状态。另外，它也允许我们更改主机名。

使用下面的命令来利用 `nmcli` 查看当前的主机名。

```
$ nmcli general hostname
daygeek-Y700
```

语法格式：

```
$ nmcli general hostname [YOUR NEW HOSTNAME]
```

使用下面的命令来借助 `nmcli` 命令可以更改主机名。在这个例子中，我将把主机名从 `daygeek-Y700` 变成 `magi-laptop`。

```
$ nmcli general hostname magi-laptop
```

它可以在不重启下设备的情况下生效，但为了安全目的，只需要重启 `systemd-hostnamed` 服务来使得更改生效。

```
$ sudo systemctl restart systemd-hostnamed
```

再次运行相同的 `nmcli` 命令来检查更改后的主机名。

```
$ nmcli general hostname
magi-laptop
```

### 方法 3：在 Linux 中使用 nmtui 来更改主机名

`nmtui` 是一个基于 `curses` 库的 TUI 应用，被用来和 NetworkManager 交互。当启动 `nmtui` 后，如果没有指定 `nmtui` 的第一个命令行参数，它将提醒用户选择执行某项活动。

在终端中运行下面的命令来开启文本用户界面。

```
$ nmtui
```

使用向下箭头按键来选择 “Set system hostname” 这个选项，然后敲击回车键。

![][3]

下面的截图展示的是原来的主机名。

![][4]

我们需要做的就是删除原来的主机名，再输入新的主机名，然后选中 “OK” 敲击回车确认就可以了。

![][5]

然后它将在屏幕中向你展示更新后的主机名，再次选中 “OK” 敲击回车确认就完成更改了。

![][6]

最后，选中 “Quit” 按钮来从 `nmtui` 终端界面离开。

![][7]

它可以在不重启设备的情况下生效，但为了安全目的，需要重启 `systemd-hostnamed` 服务来使得更改生效。

```
$ sudo systemctl restart systemd-hostnamed
```

你可以运行下面的命令来查看更新后的主机名。

```
$ hostnamectl
   Static hostname: daygeek-Y700
         Icon name: computer-laptop
           Chassis: laptop
        Machine ID: 31bdeb7b83230a2025d43547368d75bc
           Boot ID: 267f264c448f000ea5aed47263c6de7f
  Operating System: Manjaro Linux
            Kernel: Linux 4.19.20-1-MANJARO
      Architecture: x86-64
```

### 方法 4：在 Linux 中使用 /etc/hostname 来更改主机名

除了上面的方法外，我们还可以通过修改 `/etc/hostname` 文件来达到修改主机名的目的。但这个方法需要服务器重启才能生效。

使用下面的命令来检查 `/etc/hostname` 文件以查看当前的主机名：

```
$ cat /etc/hostname
daygeek-Y700
```

要改变主机名，只需覆写这个文件就行了，因为这个文件只包含主机名这一项内容。

```
$ sudo echo "magi-daygeek" > /etc/hostname

$ cat /etc/hostname
magi-daygeek
```

然后使用下面的命令重启系统：

```
$ sudo init 6
```

最后查看 `/etc/hostname` 文件的内容来验证主机名是否被更改了。

```
$ cat /etc/hostname
magi-daygeek
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/four-methods-to-change-the-hostname-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-change-set-hostname/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.2daygeek.com/wp-content/uploads/2019/02/four-methods-to-change-the-hostname-in-linux-1.png
[4]: https://www.2daygeek.com/wp-content/uploads/2019/02/four-methods-to-change-the-hostname-in-linux-2.png
[5]: https://www.2daygeek.com/wp-content/uploads/2019/02/four-methods-to-change-the-hostname-in-linux-3.png
[6]: https://www.2daygeek.com/wp-content/uploads/2019/02/four-methods-to-change-the-hostname-in-linux-4.png
[7]: https://www.2daygeek.com/wp-content/uploads/2019/02/four-methods-to-change-the-hostname-in-linux-5.png
