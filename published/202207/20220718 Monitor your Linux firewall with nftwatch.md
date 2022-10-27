[#]: subject: "Monitor your Linux firewall with nftwatch"
[#]: via: "https://opensource.com/article/22/7/nftwatch-linux-firewall"
[#]: author: "Kenneth Aaron https://opensource.com/users/flyingrhino"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14858-1.html"

用 nftwatch 监控你的 Linux 防火墙
======

![](https://img.linux.net.cn/data/attachment/album/202207/24/070724d542rvbbg3af3o9p.jpg)

> 我创建了 Linux nftwatch 命令来观察防火墙的流量统计。

Netfilter 表（[nftables][4]）是现代 Linux 发行版中的默认防火墙。它在 Fedora 和 RHEL 8、最新的 Debian 和许多其他版本上都有。它取代了早期发行版中捆绑的旧版 iptables。它是一个强大的、值得的 iptables 替代品，作为一个广泛使用它的人，我欣赏它的能力和功能。

nftables 的一个特点是能够为许多元素添加计数器，例如规则。这些都是按需启用的。你需要使用 `counter` 参数，在每一行明确地要求它。我为我的防火墙中的特定规则启用了这些计数器，这使我能够看到这些规则。

这让我开始思考。我怎样才能实时查看这些计数器？一开始我尝试了 `watch`，它允许诸如刷新率之类的东西，但我不喜欢默认格式，而且它不能滚动。我发现使用 `head` 和 `tail` 以及 `awk` 也不理想，并不存在一个用户友好的解决方案。所以我自己写了一个，我想与开源社区分享。

### Linux 上的 nftwatch 介绍

我的解决方案，我称之为 `nftwatch`，做了几件事：

* 它对 nftables 的输出进行重新排序和改写，使其更具有可读性。
* 它允许向上或向下滚动输出。
* 可以由用户定义的刷新率（可以实时改变）。
* 它可以暂停显示。

你得到的不是一个表格的转储，而是显示每个规则活动的输出。

![Image of nftwatch][5]

你可以从它的 [Git 仓库][6]下载它。

它是 100% 的 Python 代码，100% 的开源，100% 的免费。它满足了所有免费的高质量程序的要求。

### 在 Linux 上安装 nftwatch

以下是手动安装说明：

1. 克隆或从 git 仓库下载该项目。
2. 将 `nftwatch.yml` 复制到 `/etc/nftwatch.yml`。
3. 将 `nftwatch` 复制到 `/usr/local/bin/nftwatch` 并使用 `chmod a+x` 授予其可执行权限。
4. 使用 `nftwatch`，不带任何参数来运行它。
5. 参见 `nftwatch -m` 的手册。

你也可以在没有 [YAML][7] 配置文件的情况下运行 nftwatch，在这种情况下它使用内置的默认值。

### 使用

`nftwatch` 命令显示 nftables 规则。大多数控制都是为此目的而设计的。

箭头键和等效的 Vim 的按键控制滚动。使用 `F` 或 `S` 键来改变刷新速度。使用 `P` 键来暂停显示。

运行 `nftwatch -m` 以获得完整的说明，以及交互式按键控制的列表。

### 防火墙的新观点

即使你花费了时间去配置防火墙，它也会显得晦涩难懂和模糊不清。除了从日志条目中推断指标外，很难判断你的防火墙实际看到的活动类型。 使用 `nftwatch`，你可以看到你的防火墙在工作，并且可以更好地了解你的网络每天需要处理的流量类型。

*（文内图片来自 Kenneth Aaron，CC BY-SA 4.0）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/nftwatch-linux-firewall

作者：[Kenneth Aaron][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/flyingrhino
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_tea_laptop_computer_work_desk.png
[2]: https://unsplash.com/@jonasleupe?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/tea-cup-computer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://developers.redhat.com/blog/2016/10/28/what-comes-after-iptables-its-successor-of-course-nftables?extIdCarryOver=true&sc_cid=701f2000001OH79AAG#getting_started
[5]: https://opensource.com/sites/default/files/2022-07/nftwatch-sample.png
[6]: https://github.com/flyingrhinonz/nftwatch
[7]: https://opensource.com/article/21/9/yaml-cheat-sheet
