[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12880-1.html)
[#]: subject: (How to rebase to Fedora 33 on Silverblue)
[#]: via: (https://fedoramagazine.org/how-to-rebase-to-fedora-33-on-silverblue/)
[#]: author: (Michal Konečný https://fedoramagazine.org/author/zlopez/)

如何在 Silverblue 上变基到 Fedora 33？
======

![](https://img.linux.net.cn/data/attachment/album/202012/02/232440exewdbwdhde4mqhv.jpg)

Silverblue 是[一个建立在 Fedora 之上的桌面操作系统][2]。它非常适合日常使用、开发和基于容器的工作流程。它提供了[众多的优势][3]，例如在出现任何问题时能够回滚。如果你想在你的 Silverblue 系统上更新到 Fedora 33，这篇文章会告诉你如何做。它不仅告诉你该怎么做，还告诉你如果发生了不可预见的事情时该如何回退。

在实际做变基到 Fedora 33 之前，你应该应用任何挂起的更新。在终端中输入以下内容：

```
$ rpm-ostree update
```

或通过 GNOME 软件中心安装更新并重启。

### 使用 GNOME 软件中心变基

GNOME 软件中心会在更新界面显示有新版本的 Fedora 可用。

![Fedora 33 is available][4]

首先你需要做的是下载新镜像，点击 “Download” 按钮。这将需要一些时间，完成后你会看到更新已经准备好安装了。

![Fedora 33 is ready for installation][5]

点击 “Install” 按钮。这一步只需要几分钟，然后会提示你重启电脑。

![Restart is needed to rebase to Fedora 33 Silverblue][6]

点击 “Restart” 按钮就可以了。重启后，你将进入新的 Fedora 33 版本。很简单，不是吗？

### 使用终端变基

如果你喜欢在终端上做所有的事情，那么接下来的指南就适合你。

使用终端变基到 Fedora 33 很简单。首先，检查 33 版本分支是否可用：

```
$ ostree remote refs fedora
```

你应该在输出中看到以下内容：

```
fedora:fedora/33/x86_64/silverblue
```

接下来，将你的系统变基到 Fedora 33 分支。

```
$ rpm-ostree rebase fedora:fedora/33/x86_64/silverblue
```

最后要做的是重启你的电脑并启动到 Fedora 33。

### 如何回滚

如果有什么不好的事情发生。例如，如果你无法启动到 Fedora 33，那很容易回滚回去。在启动时选择 GRUB 菜单中的前一个条目，你的系统就会以切换到 Fedora 33 之前的状态启动。要使这一改变永久化，请使用以下命令：

```
$ rpm-ostree rollback
```

就是这样了。现在你知道如何将 Silverblue 变基为 Fedora 33 并回滚了。那为什么不在今天就做呢？

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-rebase-to-fedora-33-on-silverblue/

作者：[Michal Konečný][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zlopez/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/02/fedora-silverblue-logo.png
[2]: https://docs.fedoraproject.org/en-US/fedora-silverblue/
[3]: https://fedoramagazine.org/give-fedora-silverblue-a-test-drive/
[4]: https://fedoramagazine.org/wp-content/uploads/2020/10/Screenshot-from-2020-10-29-12-53-37-1024x725.png
[5]: https://fedoramagazine.org/wp-content/uploads/2020/10/Screenshot-from-2020-10-29-13-00-15-1024x722.png
[6]: https://fedoramagazine.org/wp-content/uploads/2020/10/Screenshot-from-2020-10-29-13-01-32-1024x727.png
