[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11722-1.html)
[#]: subject: (How to Start, Stop & Restart Services in Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/start-stop-restart-services-linux/)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

如何在 Ubuntu 和其他 Linux 发行版中启动、停止和重启服务
======

![](https://img.linux.net.cn/data/attachment/album/201912/28/081645vee5lkult55kituu.jpg)

服务是必不可少的后台进程，它通常随系统启动，并在关机时关闭。如果你是系统管理员，那么你会定期处理服务。如果你是普通桌面用户，你可能会遇到需要重启服务的情况，例如[安装 Barrier 来用于在计算机之间共享鼠标和键盘][1]。或[在使用 ufw 设置防火墙][2]时。

今天，我将向你展示两种管理服务的方式。你将学习在 Ubuntu 或任何其他 Linux 发行版中启动、停止和重启服务。

> systemd 与 init
> 
> 如今，Ubuntu 和许多其他发行版都使用 systemd 而不是旧的 init。
> 
> 在 systemd 中，可以使用 `systemctl` 命令管理服务。
> 
> 在 init 中，你可以使用 `service` 命令管理服务。
> 
> 你会注意到，即使你的 Linux 系统使用 systemd，它仍然可以使用 `service` 命令（与 init 系统一起使用的）。这是因为 `service` 命令实际上已重定向到 `systemctl`。systemd 引入了向后兼容性，因为系统管理员们习惯使用 `service` 命令。
> 
> 在本教程中，我将同时展示 `systemctl` 和 `service` 命令。

我用的是 Ubuntu 18.04，但其他版本的过程也一样。

### 方法 1：使用 systemd 在 Linux 中管理服务

我从 systemd 开始，因为它被广泛接受。

#### 1、列出所有服务

为了管理服务，你首先需要知道系统上有哪些服务可用。你可以使用 systemd 的命令列出 Linux 系统上的所有服务：

```
systemctl list-unit-files --type service -all
```

![systemctl list-unit-files][3]

此命令将输出所有服务的状态。服务状态有<ruby>启用<rt>enabled</rt></ruby>、<ruby>禁用<rt>disabled</rt></ruby>、<ruby>屏蔽<rt>masked</rt></ruby>（在取消屏蔽之前处于非活动状态）、<ruby>静态<rt>static</rt></ruby>和<ruby>已生成<rt>generated</rt></ruby>。

与 [grep 命令][4] 结合，你可以仅显示正在运行的服务：

```
sudo systemctl | grep running
```

![Display running services systemctl][5]

现在，你知道了如何引用所有不同的服务，你可以开始主动管理它们。

**注意：** 下列命令中的 `<service-name>` 应该用你想管理的服务名代替。（比如：network-manager、ufw 等）

#### 2、启动服务

要在 Linux 中启动服务，你只需使用它的名字：

```
systemctl start <service-name>
```

#### 3、停止服务

要停止 systemd 服务，可以使用 `systemctl` 命令的 `stop` 选项：

```
systemctl stop <service-name>
```

#### 4、重启服务

要重启 systemd 服务，可以使用：

```
systemctl restart <service-name>
```

#### 5、检查服务状态

你可以通过打印服务状态来确认你已经成功执行特定操作：

```
systemctl status <service-name>
```

这将以以下方式输出：

![systemctl status][6]

这是 systemd 的内容。现在切换到 init。

### 方法 2：使用 init 在 Linux 中管理服务

init 的命令和 systemd 的一样简单。

#### 1、列出所有服务

要列出所有 Linux 服务，使用：

```
service --status-all
```

![service –status-all][7]

前面的 `[ – ]` 代表**禁用**，`[ + ]` 代表**启用**。

#### 2、启动服务

要在 Ubuntu 和其他发行版中启动服务，使用命令：

```
service <service-name> start
```

#### 3、停止服务

停止服务同样简单。

```
service <service-name> stop
```

#### 4、重启服务

如果你想重启服务，命令是：

```
service <service-name> restart
```

#### 5、检查服务状态

此外，要检查是否达到了预期的结果，你可以输出服务状态：

```
service <service-name> status
```

这将以以下方式输出：

![service status][8]

最重要的是，这将告诉你某项服务是否处于活跃状态（正在运行）。

### 总结

今天，我详细介绍了两种在 Ubuntu 或任何其他 Linux 系统上管理服务的非常简单的方法。 希望本文对你有所帮助。

你更喜欢哪种方法？ 让我在下面的评论中知道！

--------------------------------------------------------------------------------

via: https://itsfoss.com/start-stop-restart-services-linux/

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/keyboard-mouse-sharing-between-computers/
[2]: https://itsfoss.com/set-up-firewall-gufw/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/systemctl_list_services.png?ssl=1
[4]: https://linuxhandbook.com/grep-command-examples/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/systemctl_grep_running.jpg?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/systemctl_status.jpg?ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/service_status_all.png?ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/service_status.jpg?ssl=1
