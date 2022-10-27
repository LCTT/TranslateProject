[#]: subject: "Amazon’s Own Linux Distribution is Now Completely Based on Fedora"
[#]: via: "https://news.itsfoss.com/amazon-linux-2022-preview/"
[#]: author: "Abhishek https://news.itsfoss.com/author/root/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14019-1.html"

亚马逊自己的 Linux 发行版现在完全基于 Fedora 了
======

> 亚马逊已经发布了 Amazon Linux 2022 的公开预览版，并有了新的发布模式。

![](https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/amazon-linux-2022.png?w=1200&ssl=1)

如果你还不知道，亚马逊有自己的通用 Linux 发行版，自然而然，它被称为 Amazon Linux。

它的目的是在 AWS 服务器上使用。当你部署服务器时，你可以选择使用 Amazon Linux，或其他流行的选择，如 Ubuntu、Debian 等。由于它来自亚马逊，所以没有许可费，而且亚马逊对软件库和软件包进行控制。你可以期待它与 AWS 工具紧密结合，并通过它获得新的 AWS 创新。

Amazon Linux 2022（AL2022）是其版本 1 和 2 之后的下一个版本，它将在 2022 年发布（你可以从版本号上猜到）。

### 即将发布的 Amazon Linux 2022 只基于 Fedora

到目前为止，Amazon Linux 的发布是基于红帽 Linux 和 Fedora 两者的组合。从 AL2022 开始，它将明确使用 Fedora 作为上游。

此举意在为 AWS 客户“提供各种最新软件，如更新的语言运行时，作为季度发布的一部分”。

为了提高安全性，减少攻击面，AL2022 还将启用 [SELinux][1] 并默认执行。

### 与 Ubuntu 相似的新发布模式

Amazon Linux 还选择了一个更可预测的发布时间表。每两年将发布一个新的 Amazon Linux 主要版本，并将支持五年。这样，用户就会知道何时以及如何升级他们的操作系统。

这种“每两年一个新的 LTS 版本和 5 年的支持”与 Ubuntu 如今的特点非常相似。

### 还有什么？

AL2022 也能锁定到亚马逊 Linux 软件包库的特定版本。这使得用户可以控制如何以及何时吸收更新。

Amazon Linux 2022 在所有的地理区域都可以作为预览版（即 beta 版）体验。你可以访问他们的 GitHub 页面了解更多关于 AL2022 的信息。


--------------------------------------------------------------------------------

via: https://news.itsfoss.com/amazon-linux-2022-preview/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy) 

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/selinux/
