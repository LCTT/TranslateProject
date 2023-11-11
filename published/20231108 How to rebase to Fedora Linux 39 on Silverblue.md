[#]: subject: "How to rebase to Fedora Linux 39 on Silverblue"
[#]: via: "https://fedoramagazine.org/how-to-rebase-to-fedora-linux-39-on-silverblue/"
[#]: author: "Michal Konečný https://fedoramagazine.org/author/zlopez/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16369-1.html"

如何将 Silverblue 重定位到 Fedora Linux 39
======

![][0]

Fedora Silverblue 是 [一款基于 Fedora Linux 构建的面向桌面的操作系统][2]。这款操作系统非常适合日常使用、开发和容器化的工作流程。它有 [许多优势][3]，例如可以在发生问题时轻松回滚操作。如果你想在 Fedora Silverblue 系统上更新或将系统 <ruby>重定位<rt>rebase</rt></ruby> 到 Fedora Linux 39，本文会提供帮助。文章不仅会指导你执行操作，还会教你如何在遇到意外情况时撤销操作。

### 更新你目前的系统

在实际重定位至 Fedora Linux 39 前，你需要先安装所有待处理的更新。你可以在终端中使用下面的命令：

```
$ rpm-ostree update
```

或者你也可以通过 GNOME “软件”应用安装更新，然后重新启动系统。

### 使用 GNOME “软件” 重定位

在 GNOME “软件”应用的更新页面上，你可以看到 Fedora Linux 的新版本已经可以使用。

首先，你需要点击 “<ruby>下载<rt>Download</rt></ruby>” 按钮来下载新的操作系统镜像。这个过程可能需要一些时间。完成后，你会发现更新已经准备好进行安装。

接下来，点击 “<ruby>重新启动 & 升级<rt>Restart & Upgrade</rt></ruby>” 按钮。这个过程只需要几分钟，一旦更新完成，计算机将会重新启动。重启后，你会看到崭新的 Fedora Linux 39 的系统环境，看起来很简单，是吧？

### 使用终端进行重定位

如果你更喜欢在终端操作，那么这部分指南就是为你准备的。

首先你需要确认 39 版本是否已经可以使用：

```
$ ostree remote refs fedora
```

在命令输出中你应该看到如下内容：

```
fedora:fedora/39/x86_64/silverblue
```

如果你想保留当前的部署（这意味着这个部署将会持续在 GRUB 中显示为一个选项，直到你手动移除它），你可以通过运行下面的命令实现：

```
# 0 是在 rpm-ostree 状态中的条目位置
$ sudo ostree admin pin 0
```

如果你想移除已经固定的部署，你可以使用下面的命令：

```
# 2 是在 rpm-ostree 状态中的条目位置
$ sudo ostree admin pin --unpin 2
```

然后，将你的系统重定位至 Fedora Linux 39 镜像。

```
$ rpm-ostree rebase fedora:fedora/39/x86_64/silverblue
```

最后，重启你的电脑，启动进入 Fedora Linux 39 版本。

### 如何进行回滚

如果遇到任何问题（例如，如果你无法启动 Fedora Linux 39），回滚是非常容易的。在系统启动时，在 GRUB 菜单中选择 Fedora Linux 39 之前的版本，然后你的系统就会启动这个更早的版本而非 Fedora Linux 39。如果你在启动过程中看不到 GRUB 菜单，那么在启动时尝试按下 `ESC` 键。如果你想让更早版本的选择永久生效，你可以使用下面的命令：

```
$ rpm-ostree rollback
```

现在，你已经了解如何将 Fedora Silverblue 系统重定位到 Fedora Linux 39，以及如何进行系统回滚了。那么何不今天就试试看呢？

### 常见问题解答

在每篇关于重定位 Silverblue 到新版本的文章的评论中，总会有相似的问题，因此我会在这个部分尝试解答这些问题。

**问题：在 Fedora 的重定位过程中我能跳过某些版本吗？例如直接从 Fedora 37 Silverblue 更新到 Fedora 39 Silverblue。**

答案：虽然有时可能可以在重定位过程中跳过某些版本，但并不推荐这样操作。你应当始终更新到紧邻的新版本（例如从 38 更新到 39），以避免不必要的错误。

**问题：我安装了 [rpm-fusion][4] ，在重定位过程中出现错误，我应当怎样进行重定位？**

答案：如果你在 Silverblue 安装上加入了 [rpm-fusion][4]，你在重定位前应当执行以下操作：

```
rpm-ostree update \
    --uninstall rpmfusion-free-release \
    --uninstall rpmfusion-nonfree-release \
    --install rpmfusion-free-release \
    --install rpmfusion-nonfree-release
```

执行完上述操作后，你可以按照本篇博文的步骤完成重定位过程。

**问题：这个指南是否适用于其他的 ostree 版本（例如 Kinoite， Sericea）？**

答案：是的，你可以照着本指南的 _使用终端进行重定位_ 部分的操作来完成所有的 Fedora ostree 版本的重定位过程。只需要使用对应的分支即可。例如对于 Kinoite，你可以使用

```
fedora:fedora/39/x86_64/kinoite
```

而非

```
fedora:fedora/39/x86_64/silverblue
```

*（题图：MJ/71150afc-ae44-48f3-8689-e86758e07b1e）*

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-rebase-to-fedora-linux-39-on-silverblue/

作者：[Michal Konečný][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zlopez/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/04/silverblue-rebase-816x345.jpg
[2]: https://docs.fedoraproject.org/en-US/fedora-silverblue/
[3]: https://fedoramagazine.org/give-fedora-silverblue-a-test-drive/
[4]: https://rpmfusion.org/
[0]: https://img.linux.net.cn/data/attachment/album/202311/11/152119r6nv12c115vntzp4.png