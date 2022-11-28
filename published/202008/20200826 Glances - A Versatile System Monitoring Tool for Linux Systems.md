[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12567-1.html)
[#]: subject: (Glances – A Versatile System Monitoring Tool for Linux Systems)
[#]: via: (https://itsfoss.com/glances/)
[#]: author: (Chinmay https://itsfoss.com/author/chinmay/)

Glances：多功能 Linux 系统监控工具
======

![](https://img.linux.net.cn/data/attachment/album/202008/30/212820tgdi7iou6dg6qqq2.jpg)

Linux 上最常用的[命令行进程监控工具][1]是 `top` 和它那色彩斑斓、功能丰富的表弟 [htop][2]。

要[监控 Linux 上的温度][3]，可以使用 [lm-sensors][4]。同样，还有很多实用工具可以监控其他实时指标，如磁盘 I/O、网络统计等。

[Glances][5] 是一个系统监控工具，它把这些都联系在一起，并提供了更多的功能。我最喜欢的是，你可以在远程 Linux 服务器上运行 Glances 来监控本地系统的系统资源，也可以通过 Web 浏览器监控。

下面是它的外观。下面截图中的终端已经[用 Pywal 工具美化过，可以根据壁纸自动改变颜色][6]。

![][7]

你也可以将它集成到像 [Grafana][8] 这样的工具中，在一个直观的仪表盘中监控统计数据。

它是用 Python 编写的，这意味着它的绝大多数功能都可以在大多数平台上使用。

### Glances 的功能

![Glances Data In Grafana Dashboard][9]

让我们快速浏览一下 Glances 提供的主要功能：

  * 可以监控系统上的 15 个之多的指标（包括 Docker 容器）。
  * 灵活的使用模式：单机模式、客户端-服务器模式、通过 SSH 和 Web 模式。
  * 可用于集成的各种 REST API 和 XML-RPC API。
  * 支持将数据轻松导出到不同的服务和数据库。
  * 高度的可配置性和适应不同的需求。
  * 非常全面的文档。

### 在 Ubuntu 和其他 Linux 发行版上安装 Glances

Glances 在许多 Linux 发行版的官方软件库中都有。这意味着你可以使用你的发行版的软件包管理器来轻松安装它。

在基于 Debian/Ubuntu 的发行版上，你可以使用以下命令：

```
sudo apt install glances
```

你也可以使用 snap 包安装最新的 Glances：

```
sudo snap install glances
```

由于 Glances 是基于 Python 的，你也可以使用 PIP 在大多数 Linux 发行版上安装它。先[安装 PIP][10]，然后用它来安装 Glances：

```
sudo pip3 install glances
```

如果没有别的办法，你还可以使用 Glances 开发者提供的自动安装脚本。虽然我们不建议直接在你的系统上随便运行脚本，但这完全取决于你自己：

```
curl -L https://bit.ly/glances | /bin/bash
```

你可以从他们的[文档][11]中查看其他安装 Glances 的方法，甚至你还可以把它作为一个 Docker 容器来安装。

### 使用 Glances 监控本地系统上的 Linux 系统资源（独立模式）

你可以通过在终端上运行这个命令，轻松启动 Glances 来监控你的本地机器：

```
glances
```

你可以立即观察到，它将很多不同的信息整合在一个屏幕上。我喜欢它在顶部显示电脑的公共和私人 IP：

![][12]

Glances 也是交互式的，这意味着你可以在它运行时使用命令与它互动。你可以按 `s` 将传感器显示在屏幕上；按 `k` 将 TCP 连接列表显示在屏幕上；按 `1` 将 CPU 统计扩展到显示单个线程。

你也可以使用方向键在进程列表中移动，并按不同的指标对表格进行排序。

你可以通过各种命令行选项来启动 Glances。此外，它还有很多交互式命令。你可以在他们的[丰富的文档][13]中找到完整的列表。

按 `Ctrl+C` 键退出 Glances。

### 使用 Glances 监控远程 Linux 系统（客户端-服务器模式）

要监控远程计算机，你可以在客户端-服务器模式下使用 Glances。你需要在两个系统上都安装 Glances。

在远程 Linux 系统上，使用 `-s` 选项在服务器模式下启动 Glances：

```
glances -s
```

在客户端系统中，使用下面的命令在客户端模式下启动 Glances 并连接到服务器：

```
glances -c server_ip_address
```

你也可以通过 SSH 进入任何一台电脑，然后启动 Glances，它可以完美地工作。更多关于客户端-服务器模式的信息请看[这里][14]。

### 使用 Glances 在 Web 浏览器中监控 Linux 系统资源（Web 模式）

Glances 也可以在 Web 模式下运行。这意味着你可以使用 Web 浏览器来访问 Glances。与之前的客户端-服务器模式不同，你不需要在客户端系统上安装 Glances。

要在 Web 模式下启动 Glances，请使用 `-w` 选项：

```
glances -w
```

请注意，即使在 Linux 服务器上，它也可能显示 “Glances Web User Interface started on http://0.0.0.0:61208”，而实际上它使用的是服务器的 IP 地址。

最主要的是它使用的是 61208 端口号，你可以用它来通过网络浏览器访问 Glances。只要在服务器的 IP 地址后面输入端口号，比如 <http://123.123.123.123:61208>。

你也可以在本地系统中使用 <http://0.0.0.0:61208/> 或 <https://localhost:61208/> 访问。

![][15]

Web 模式也模仿终端的样子。网页版是根据响应式设计原则打造的，即使在手机上也很好看。

你可能想用密码来保护 Web 模式，这样只有授权的人才能使用它。默认的用户名是 `glances`。

```
root@localhost:~# glances -w --password
Define the Glances webserver password (glances username):
Password (confirm):
Do you want to save the password? [Yes/No]: n
Glances Web User Interface started on http://0.0.0.0:61208/
```

你可以在[快速入门指南][16]中找到关于配置密码的更多信息。

### 导出 Glances 数据到不同的服务

使用 Glances 最大的优势之一就是开箱即用，它支持将数据导出到各种数据库、服务，并无缝集成到各种数据管道中。

你可以在监控的同时用这个命令导出到 CSV：

```
glances --export csv --export-csv-file /tmp/glances.csv
```

`/tmp/glances.csv` 是文件的位置。数据以时间序列的形式整齐地填入。

![][17]

你也可以导出到其它大型应用程序，如 [Prometheus][18]，以启用条件触发器和通知。

它可以直接插入到消息服务（如 RabbitMQ、MQTT）、流媒体平台（如 Kafka），并将时间序列数据导出到数据库（如 InfluxDB），并使用 Grafana 进行可视化。

你可以在[这里][19]查看服务和导出选项的整个列表。

### 使用 REST API 将 Glances 与其他服务进行整合

这是整个栈中我最喜欢的功能。Glances 不仅可以将各种指标汇集在一起，还可以通过 API 将它们暴露出来。

这个简单而强大的功能使得为任何特定的用例构建自定义应用程序、服务和中间件应用程序变得非常容易。

当你在 Web 模式下启动 Glances 时，REST API 服务器会自动启动。要在 API 服务器模式下启动它，你可以使用以下命令：

```
glances -w --disable-webui
```

[REST API][20] 的文档很全面，其响应也很容易与 Web 应用集成。这使得使用类似 [Node-RED][21] 这样的工具可以很容易地构建一个统一的仪表盘来监控多个服务器。

![][22]

Glances 也提供了一个 XML-RPC 服务器，你可以在[这里][23]查看文档。

### 关于 Glances 的结束语

Glances 使用 [psutil][24] Python 库来访问不同的系统统计数据。早在 2017 年，我就曾使用相同的库构建了一个简单的 API 服务器来检索 CPU 的使用情况。我能够使用 Node-RED 构建的仪表盘监控一个集群中的所有树莓派。

Glances 可以为我节省一些时间，同时提供更多的功能，可惜我当时并不知道它。

在写这篇文章的时候，我确实尝试着在我的树莓派上安装 Glances，可惜所有的安装方法都出现了一些错误，失败了。当我成功后，我会更新文章，或者可能再写一篇文章，介绍在树莓派上安装的步骤。

我希望 Glances 能提供一种顶替 `top` 或 `htop` 等的方法。让我们希望在即将到来的版本中得到它。

我希望这能给你提供大量关于 Glances 的信息。你们使用什么系统监控工具呢，请在评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/glances/

作者：[Chinmay][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/chinmay/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-system-monitoring-tools/
[2]: https://hisham.hm/htop/
[3]: https://itsfoss.com/monitor-cpu-gpu-temp-linux/
[4]: https://github.com/lm-sensors/lm-sensors
[5]: https://nicolargo.github.io/glances/
[6]: https://itsfoss.com/pywal/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/glances-linux.png?resize=800%2C510&ssl=1
[8]: https://grafana.com/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/glances-data-in-grafana-dashboard.jpg?resize=800%2C472&ssl=1
[10]: https://itsfoss.com/install-pip-ubuntu/
[11]: https://github.com/nicolargo/glances/blob/master/README.rst#installation
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/Screenshot-from-2020-08-13-11-54-18.png?resize=800%2C503&ssl=1
[13]: https://glances.readthedocs.io/en/latest/cmds.html
[14]: https://glances.readthedocs.io/en/latest/quickstart.html#central-client
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/Screenshot-from-2020-08-13-16-49-11.png?resize=800%2C471&ssl=1
[16]: https://glances.readthedocs.io/en/stable/quickstart.html
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/Screenshot-from-2020-08-13-12-25-40.png?resize=800%2C448&ssl=1
[18]: https://prometheus.io/
[19]: https://glances.readthedocs.io/en/latest/gw/index.html
[20]: https://github.com/nicolargo/glances/wiki/The-Glances-RESTFULL-JSON-API
[21]: https://nodered.org/
[22]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/Screenshot-from-2020-08-13-17-49-41.png?resize=800%2C468&ssl=1
[23]: https://github.com/nicolargo/glances/wiki
[24]: https://pypi.org/project/psutil/
