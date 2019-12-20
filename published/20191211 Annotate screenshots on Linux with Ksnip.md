[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11695-1.html)
[#]: subject: (Annotate screenshots on Linux with Ksnip)
[#]: via: (https://opensource.com/article/19/12/annotate-screenshots-linux-ksnip)
[#]: author: (Clayton Dewey https://opensource.com/users/cedewey)

在 Linux 上使用 Ksnip 注释截图
======

> Ksnip 让你能轻松地在 Linux 中创建和标记截图。

![a checklist for a team][1]

我最近从 MacOS 切换到了 [Elementary OS][2]，这是一个专注于易用性和隐私性的 Linux 发行版。作为用户体验设计师和自由软件支持者，我会经常截图并进行注释。在尝试了几种不同的工具之后，到目前为止，我最喜欢的工具是 [Ksnip][3]，它是 GPLv2 许可下的一种开源工具。

![Ksnip screenshot][4]

### 安装

使用你首选的包管理器安装 Ksnip。我通过 Apt 安装了它：

```
sudo apt-get install ksnip
```

### 配置

Ksnip 有许多配置选项，包括：

* 保存截图的地方
* 默认截图的文件名
* 图像采集器行为
* 光标颜色和宽度
* 文字字体

你也可以将其与你的 Imgur 帐户集成。

![Ksnip configuration options][5]

### 用法

Ksnip 提供了大量的[功能][6]。我最喜欢的 Ksnip 部分是它拥有我需要的所有注释工具（还有一个我没想到的工具！）。

你可以使用以下注释：

  * 钢笔
  * 记号笔
  * 矩形
  * 椭圆
  * 文字

你还可以模糊区域来移除敏感信息。还有使用我最喜欢的新工具：用于在界面上表示步骤的带数字的点。

### 关于作者

我非常喜欢 Ksnip，因此我联系了作者 [Damir Porobic][7] 来了解有关该项目的更多信息。

当我问到是什么启发了他编写 Ksnip 时，他说：

> “几年前我从 Windows 切换到 Linux，却没有了在 Windows 中常用的 Windows Snipping Tool。当时的所有其他截图工具要么很大（很多按钮和复杂功能），要么缺少诸如注释等关键功能，所以我决定编写一个简单的 Windows Snipping Tool 克隆版，但是随着时间的流逝，它开始有越来越多的功能。“

这正是我在评估截图工具时发现的。他花时间构建解决方案并免费共享给他人使用，这真是太好了。

至于 Ksnip 的未来，Damir 希望添加全局快捷方式（至少对于 Windows 是这样）和用于新截图的选项卡，并允许该应用在后台运行。GitHub 上的功能请求列表也越来越多。

### 帮助的方式

Damir 最需要的是帮助开发 Ksnip。他和他的妻子很快就会有孩子了，所以他将没有太多的时间放在这个项目上。不过，他可以检查和接受拉取请求。

此外，此项目还可以通过 Snap 、Flatpak 以及 MacOS 安装包、Windows 安装包等其他安装方式安装。如果你想提供帮助，请查看 Ksnip 的 README 的 [Contribution][8] 部分。

* * *

> 此文章最初发表在 [Agaric Tech Cooperative 的博客][9]上，并经允许重新发布。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/annotate-screenshots-linux-ksnip

作者：[Clayton Dewey][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cedewey
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk (a checklist for a team)
[2]: https://elementary.io/
[3]: https://github.com/damirporobic/ksnip
[4]: https://opensource.com/sites/default/files/uploads/ksnip.png (Ksnip screenshot)
[5]: https://opensource.com/sites/default/files/uploads/ksnip-configuration.png (Ksnip configuration options)
[6]: https://github.com/DamirPorobic/ksnip#features
[7]: https://github.com/damirporobic/
[8]: https://github.com/DamirPorobic/ksnip/blob/master/README.md#contribution
[9]: https://agaric.coop/blog/annotate-screenshots-linux-ksnip
