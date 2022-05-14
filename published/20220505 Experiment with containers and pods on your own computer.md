[#]: subject: "Experiment with containers and pods on your own computer"
[#]: via: "https://opensource.com/article/22/5/containers-pods-101-ebook"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14591-1.html"

在自己的电脑上实验容器和荚
======

> 通过这篇新的可下载指南开始探索容器技术的要领。

![](https://img.linux.net.cn/data/attachment/album/202205/14/102808n8u3pkff174431v7.jpg)

在电视剧 《<ruby>太空堡垒卡拉狄加<rt>Battlestar Galactica</rt></ruby>》中，这艘名副其实的巨型飞船其实并没有做什么。它是船员们坚定的庇护所，是战略和协调的中心联络点，也是资源管理的安全场所。而 <ruby>卡布里安毒蛇号<rt>Caprican Vipers</rt></ruby> 这种单人的独立太空船，出去对付邪恶的<ruby>赛昂人<rt>Cylons</rt></ruby>和其他太空中的危险。他们也从不只派一两艘毒蛇号出去。他们派了很多。这许许多多的冗余的飞船具有基本相同的能力和目的，但由于它们非常灵活和数量众多，它们总是能够处理每个星期都在威胁战星的任何问题。

如果你认为你感到这像是一个正在发展中的比喻，那么你是对的。现代的“云”大而无当，是分布在很远距离的大量基础设施的集合体。它具有强大的能力，但如果你将其视为普通计算机，就会浪费了它的大部分能力。当你想要处理来自数百万个输入源的大量数据时，把你的解决方案（无论它是采用应用、网站、数据库、服务器还是其他形式）打包起来，并发送该解决方案的微小镜像来处理数据集群，实际上是更有效的。当然，这些都是 “<ruby>容器<rt>container</rt></ruby>”，它们是云的劳动力。它们是你发送来处理服务请求的小型解决方案工厂，并且由于你可以根据任何给定时间传入的请求生成所需要的数量，因此理论上它们是取之不尽的。

### 在家里使用容器

如果你没有大量的传入请求需要处理，你可能会想知道容器给你带来什么好处。不过，在个人电脑上使用容器确实有其用途。

#### 容器作为虚拟环境

通过 Podman、LXC 和 Docker 等工具，你可以像以往运行虚拟机一样运行容器。不过，与虚拟机不同，容器没有因模拟固件和硬件而产生的开销。

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

### 在工作中使用容器

当然，容器不只是个精简的虚拟机。它们可以是针对为非常具体的需求提供的特定解决方案。如果你不熟悉容器，那么新系统管理员最常见的入门仪式之一可能会有所帮助：启动你的第一个 Web 服务器，但是在容器中。

首先，获取一个镜像。你可以使用 `podman search` 命令来搜索你喜欢的发行版，或者直接搜索你喜欢的 httpd 服务器。当使用容器时，我倾向于信任我在裸机上使用的相同发行版。

当你你找到一个镜像作为你的容器的基础，你就可以运行你的镜像。然而，正如这个术语所暗示的，容器是*封起来的*，所以如果你只是启动一个容器，你将无法访问标准的 HTTP 端口。你可以使用 `-p` 选项将一个容器端口映射到一个标准的网络端口：

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

容器拥有比模仿虚拟机更多的潜力。你可以将它们分组在 “<ruby>荚<rt>pod<rt></ruby>” 中，构建复杂应用的自动部署，启动冗余服务以满足高需求等等。如果你刚刚开始使用容器，你可以 [下载我们最新的电子书][2] 来学习该技术，甚至学习创建一个 “<ruby>荚<rt>pod<rt></ruby>”，以便你可以运行 WordPress 和数据库。

> **[下载我们最新的电子书][2]**

（LCTT 译注：容器环境中使用的 “Pod” 一词，我以前根据容器相关术语多用航海领域名词比喻来将其译做“吊舱”，但也有同学表示了不同意见。根据 Kubernetes [文档][3]，这个词来自对<ruby>鲸鱼荚<rt>pod of whales</rt></ruby>、<ruby>豌豆荚<rt>pea pod</rt></ruby>的比喻，所以我觉得采用“荚”的翻译比较合适。—— wxy）

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/containers-pods-101-ebook

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/tips_map_guide_ebook_help_troubleshooting_lightbulb_520.png
[2]: https://opensource.com/downloads/containers-pods-101-ebook
[3]: https://kubernetes.io/docs/concepts/workloads/pods/#:~:text=A%20Pod%20\(as%20in%20a,run%20in%20a%20shared%20context.