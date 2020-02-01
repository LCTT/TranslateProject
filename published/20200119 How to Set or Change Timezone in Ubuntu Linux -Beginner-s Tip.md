[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11838-1.html)
[#]: subject: (How to Set or Change Timezone in Ubuntu Linux [Beginner’s Tip])
[#]: via: (https://itsfoss.com/change-timezone-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu Linux 中设置或更改时区
======

[你安装 Ubuntu 时][1]，它会要求你设置时区。如果你选择一个错误的时区，或者你移动到世界的一些其它地方，你可以很容易地在以后更改它。

### 如何在 Ubuntu 和其它 Linux 发行版中更改时区

这里有两种方法来更改 Ubuntu 中的时区。你可以使用图形化设置或在终端中使用 `timedatectl` 命令。你也可以直接更改 `/etc/timezone` 文件，但是我不建议这样做。

在这篇初学者教程中，我将向你展示图形化和终端两种方法：

  * [通过 GUI 更改 Ubuntu 中的时区][2] （适合桌面用户）
  * [通过命令行更改 Ubuntu 中的时区][3] （桌面和服务器都工作）

![][4]

#### 方法 1: 通过终端更改 Ubuntu 时区

[Ubuntu][5] 或一些使用 systemd 的其它发行版可以在 Linux 终端中使用 `timedatectl` 命令来设置时区。

你可以使用没有任何参数的 `timedatectl` 命令来检查当前是日期和时区设置：

```
[email protected]:~$ timedatectl
                      Local time: Sat 2020-01-18 17:39:52 IST
                  Universal time: Sat 2020-01-18 12:09:52 UTC
                        RTC time: Sat 2020-01-18 12:09:52
                       Time zone: Asia/Kolkata (IST, +0530)
       System clock synchronized: yes
systemd-timesyncd.service active: yes
                 RTC in local TZ: no
```

正如你在上面的输出中所看，我的系统使用 Asia/Kolkata 。它也告诉我现在比世界时早 5 小时 30 分钟。

为在 Linux 中设置时区，你需要知道准确的时区。你必需使用时区的正确的格式 (时区格式是洲/城市)。

为获取时区列表，使用 `timedatectl` 命令的 `list-timezones` 参数:

```
timedatectl list-timezones
```

它将向你显示大量可用的时区列表。

![Timezones List][6]

你可以使用向上箭头和向下箭头或 `PgUp` 和 `PgDown` 键来在页面之间移动。

你也可以 `grep` 输出，并搜索你的时区。例如，假如你正在寻找欧洲的时区，你可以使用：

```
timedatectl list-timezones | grep -i europe
```

比方说，你想设置时区为巴黎。在这里，使用的时区值的 Europe/Paris ：

```
timedatectl set-timezone Europe/Paris
```

它虽然不显示任何成功信息，但是时区会立即更改。你不需要重新启动或注销。

记住，虽然你不需要成为 root 用户并对命令使用 `sudo`，但是你的账户仍然需要拥有管理器权限来更改时区。

你可以使用 [date 命令][7] 来验证更改的时间好时区：

```
[email protected]:~$ date
Sat Jan 18 13:56:26 CET 2020
```

#### 方法 2: 通过 GUI 更改 Ubuntu 时区

按下 `super` 键 (Windows 键) ，并搜索设置：

![Applications Menu Settings][8]

在左侧边栏中，向下滚动一点，查看详细信息：

![Go to Settings -> Details][9]

在详细信息中，你将在左侧边栏中找到“日期和时间”。在这里，你应该关闭自动时区选项（如果它已经被启用），然后在时区上单击：

![In Details -> Date & Time, turn off the Automatic Time Zone][10]

当你单击时区时，它将打开一个交互式地图，你可以在你选择的地理位置上单击，关闭窗口。

![Select a timezone][11]

在选择新的时区后，除了关闭这个地图后，你不必做任何事情。不需要注销或 [关闭 Ubuntu][12]。

我希望这篇快速教程能帮助你在 Ubuntu 和其它 Linux 发行版中更改时区。如果你有问题或建议，请告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/change-timezone-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-ubuntu/
[2]: tmp.bHvVztzy6d#change-timezone-gui
[3]: tmp.bHvVztzy6d#change-timezone-command-line
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/Ubuntu_Change-_Time_Zone.png?ssl=1
[5]: https://ubuntu.com/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/timezones_in_ubuntu.jpg?ssl=1
[7]: https://linuxhandbook.com/date-command/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/applications_menu_settings.jpg?ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/settings_detail_ubuntu.jpg?ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/change_timezone_in_ubuntu.jpg?ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/change_timezone_in_ubuntu_2.jpg?ssl=1
[12]: https://itsfoss.com/schedule-shutdown-ubuntu/
