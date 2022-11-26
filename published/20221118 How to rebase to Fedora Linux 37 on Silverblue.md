[#]: subject: "How to rebase to Fedora Linux 37 on Silverblue"
[#]: via: "https://fedoramagazine.org/how-to-rebase-to-fedora-linux-37-on-silverblue/"
[#]: author: "Michal Konečný https://fedoramagazine.org/author/zlopez/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15290-1.html"

如何在 Silverblue 上变基到 Fedora Linux 37
======

![][1]

Fedora Silverblue 是 [基于 Fedora Linux 构建的桌面操作系统][2]。它非常适合日常使用、开发和基于容器的工作流程。它提供了 [众多优势][3]，例如能够在出现任何问题时回滚。如果你想在 Fedora Silverblue 系统上更新或变基到 Fedora Linux 37（这些说明与 Fedora Kinoite 类似），本文将告诉你如何操作。它不仅向你展示了该做什么，而且还向你展示了在发生不可预见的事情时如何恢复。

在实际对 Fedora Linux 37 进行变基之前，你应该应用任何待定的更新。在终端中输入以下内容：

```
$ rpm-ostree update
```

或通过 GNOME <ruby>软件<rt>Software</rt></ruby> 应用安装更新并重新启动。

### 使用 GNOME 软件应用变基

在更新页面上，GNOME <ruby>软件<rt>Software</rt></ruby> 应用向你显示有新版本的 Fedora Linux 可用。

![Fedora 37 更新可用][4]

你需要做的第一件事是下载新镜像，因此请点击“<ruby>下载<rt>Download</rt></ruby>”按钮。这需要一些时间。完成后，你将看到更新已准备好安装。

![Fedora 37 更新准备好安装][5]

点击 “<ruby>重启并更新<rt>Restart & Upgrade</rt></ruby>” 按钮。此步骤只需要几分钟，最后计算机将重启。重启后，你将获得全新的 Fedora Linux 37 版本。很简单，不是吗？

### 使用终端变基

如果你喜欢在终端中完成所有操作，那么本指南的这一部分适合你。

使用终端变基到 Fedora Linux 37 很容易。首先，检查 37 分支是否可用：

```
$ ostree remote refs fedora
```

你应该在输出中看到以下内容：

```
fedora:fedora/37/x86_64/silverblue
```

如果你想置顶当前部署（该部署将作为 GRUB 中的选项保留，直到你删除它），你可以通过运行以下命令来完成：

```
# 0 is entry position in rpm-ostree status
$ sudo ostree admin pin 0
```

要删除置顶部署，请使用以下命令：

```
# 2 is entry position in rpm-ostree status
$ sudo ostree admin pin --unpin 2
```

其中 2 是 rpm-ostree 状态中的位置。

接下来，将你的系统重新设置为 Fedora Linux 37 分支。

```
$ rpm-ostree rebase fedora:fedora/37/x86_64/silverblue
```

最后，要做的最后一件事是重新启动计算机并引导至 Fedora Linux 37。

### 如何回滚

如果发生任何不好的事情，例如，如果你根本无法启动到 Fedora Linux 37，这很容易回滚。在引导时选择 GRUB 菜单中的上一个条目（如果你没有看到它，请尝试在引导过程中按 `ESC`），你的系统将以切换到 Fedora Linux 37 之前的先前状态启动。要使此更改永久生效，请使用以下命令：

```
$ rpm-ostree rollback
```

就是这样。现在你知道如何将 Fedora Silverblue 变基到 Fedora Linux 37 并回滚。那么为什么不在今天做呢？

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-rebase-to-fedora-linux-37-on-silverblue/

作者：[Michal Konečný][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zlopez/
[b]: https://github.com/lujun9972
[1]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2021/04/silverblue-rebase-816x345.jpg
[2]: https://docs.fedoraproject.org/en-US/fedora-silverblue/
[3]: https://fedoramagazine.org/give-fedora-silverblue-a-test-drive/
[4]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2022/11/Screenshot-from-2022-11-15-11-11-32-1024x714.png
[5]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2022/11/Screenshot-from-2022-11-15-11-12-22-1024x714.png