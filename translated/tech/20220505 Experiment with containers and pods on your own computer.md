[#]: subject: "Experiment with containers and pods on your own computer"
[#]: via: "https://opensource.com/article/22/5/containers-pods-101-ebook"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在自己的电脑上实验容器和 pod
======
通过这个新的可下载指南开始探索容器技术的要领。

![Looking at a map][1]

（图片由：opensource.com）

在电视剧 *Battlestar Galactica* （太空堡垒卡拉狄加）中，这艘名副其实的巨型飞船并没有做什么。它是船员们坚守的庇护所，是战略和协调的中心联络点，也是资源管理的安全场所。然而，卡布里安毒蛇号，一个人的独立太空船，出去对付邪恶的赛昂人和其他太空中的危险。他们也从不只派一两艘毒蛇号出去。他们派了很多。许多冗余的飞船具有基本相同的能力和目的，但由于它们非常灵活和数量众多，它们总是能够处理每周威胁战星的任何问题。

如果你认为你正在感知一个发展中的类比，那么你是对的。 现代“云”又大又笨重，是分布在很远距离的大量基础设施的融合。它具有强大的功能，但如果你将其视为普通计算机，你将浪费它的大部分功能。当你想要处理来自数百万输入源的大量数据时，捆绑你的解决方案（无论是采用应用、网站、数据库、服务器还是其他形式）并发送该解决方案的微小镜像来处理数据集群，实际上是更有效的。当然，这些将是*容器*，它们是云的劳动力。它们是你发送来处理服务请求的小型解决方案工厂，并且由于你可以根据任何给定时间传入的请求生成任意数量的解决方案，因此理论上它们是取之不尽的。

### 家中的容器

如果你没有大量的传入请求需要处理，你可能会想知道容器给你带来什么好处。不过，在个人电脑上使用容器确实有其用途。

#### 容器作为虚拟环境

通过 Podman、LXC 和 Docker 等工具，你可以像以往运行虚拟机一样运行容器。不过，与虚拟机不同，容器不需要模拟固件和硬件的开销。

你可以从公共仓库下载容器镜像，启动一个最小化的 Linux 环境，并将其作为命令或开发的测试场所。例如，假设你想试试你在 Slackware Linux 上构建的一个应用。首先，在仓库中搜索一个合适的镜像：

```
$ podman search slackware
```

然后选择一个镜像，作为你的容器的基础：

```
$ podman run -it --name slackware vbatts/slackware
sh-4.3# grep -i ^NAME\= /etc/os-release
NAME=Slackware
```

### 工作中的容器

当然，容器不只是最小的虚拟机。他们可以为非常具体的需求提供高度具体的解决方案。如果你不熟悉容器，那么对任何新系统管理员最常见的通过仪式之一开始可能会有所帮助：在容器中启动你的第一个 Web 服务器。

首先，获得一个镜像。你可以使用 `podman search` 命令来搜索你喜欢的发行版，或者直接搜索你喜欢的 httpd 服务器。当使用容器时，我倾向于信任我在裸机上信任的相同发行版。

当你你找到一个镜像作为你的容器的基础，你就可以运行你的镜像。然而，正如这个术语所暗示的，容器是*被容器化的*，所以如果你只是启动一个容器，你将无法访问标准的 HTTP 端口。你可以使用 `-p` 选项将一个容器端口映射到一个标准的网络端口：

```
$ podman run -it -p 8080:80 docker.io/fedora/apache:latest
```

现在看看你本地主机上的 8080 端口：

```
$ curl localhost:8080
Apache
```

成功了。

### 了解更多

容器拥有比模仿虚拟机更多的潜力。你可以将它们分组在 pod 中，构建复杂应用的自动部署，启动冗余服务以满足高需求等等。如果你刚刚开始使用容器，你可以[下载我们最新的电子书][2]来学习该技术，甚至学习创建一个 pod，以便你可以运行 WordPress 和数据库。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/containers-pods-101-ebook

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/tips_map_guide_ebook_help_troubleshooting_lightbulb_520.png
[2]: https://opensource.com/downloads/containers-pods-101-ebook
