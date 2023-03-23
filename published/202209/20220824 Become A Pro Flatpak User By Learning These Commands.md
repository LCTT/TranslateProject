[#]: subject: "Become A Pro Flatpak User By Learning These Commands"
[#]: via: "https://www.debugpoint.com/flatpak-commands/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15007-1.html"

如何成为专业的 Flatpak 用户
======

> 在这篇文章中，我将向你展示各种 Flatpak 命令，使你成为 Flatpak 的专业用户。

![][1]

Flatpak 沙盒技术是 Linux 应用分发的未来。如今，几乎所有重要的发行版都预装了 Flatpak，因为采用它很容易，维护它也更直接。

如果你每天都使用 Flatpak，你可能知道这些命令。但如果你还在考虑把每一个应用程序都转到 Flatpak，那么你应该通过这个命令列表来了解如何轻松管理 Flatpak 应用程序。

因此，为了帮助你做到这一点，我列出了一些易于使用的 Flatpak 命令供你参考，这些命令是从文档中的大量命令集中筛选出来的。

### Flatpak 命令参考

首先，我们来谈谈一些基本的命令。

#### 1、安装 Flatpak

自从上次我检查过后，如今所有重要的发行版都预装了 Flatpak。因此，你可能不需要安装它。

然而，安装 Flatpak 就像在这两个主要发行版中运行以下命令一样简单：

```
sudo apt install flatpak // 用于 Ubuntu 和相关发行版
```

```
sudo dnf install flatpak // 适用于 Fedora 和基于 RPM 的发行版
```

如果你正在运行其他发行版，你可以查看我们关于 Flatpak 安装的 [详细指南][2]。

#### 2、设置 Flatpak 远程仓库

接下来，你需要在安装后设置与 <ruby>远程仓库<rt>remote</rt></ruby>的连接。远程仓库就像是一个存储库（参考 PPA），用来分发 Flatpak 应用程序。

主要的仓库是 Flathub，你可以用下面的命令来设置它。这个命令对所有发行版都是一样的。完成后，重新启动你的系统，你就可以安装 Flatpak 应用程序了。

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

**提示**：如果你有别的远程仓库，你可以使用相同的命令来添加该仓库。在一个系统中设置多个远程仓库是正常的。

**提示**：另外，你可以指定 `--user` 或 `--system` 开关来安装特定于你的用户 ID 或整个系统的 Flatpak 远程仓库。

```
flatpak remote-add --if-not-exists --user https://flathub.org/repo/flathub.flatpakrepo
```

```
flatpak remote-add --if-not-exists --system https://flathub.org/repo/flathub.flatpakrepo
```

#### 3、从 Flathub 安装 Flatpak 应用程序

Linux 中大多数重要的基于 GUI 的软件商店都默认允许安装 Flatpak 应用程序。例如，如果你正在使用“<ruby>软件<rt>Software</rt></ruby>”（适用于 Ubuntu 或 Fedora GNOME 版），你可以找到应用程序并点击安装按钮进行安装。

或者，在 KDE Plasma 的 “<ruby>发现<rt>Discover</rt></ruby>” 中：

![KDE “发现”可以从 Flathub 拉取 Flatpak 应用程序][3]

但是，最简单的方法是复制 [Flathub 商店][4] 中的安装命令（可在每个应用程序信息页面的底部找到）并将其粘贴到终端。这是安装 Flatpak 应用程序的最快方法。

```
flatpak install org.kde.kdenlive
```

#### 4、运行一个应用程序

有两种方法来运行你安装的 Flatpak 应用程序。你可以在图形化桌面环境的应用程序菜单中找到它。或者，你可以使用简单的运行（`run`）参数来启动。

你可以从 Flathub 应用程序页面找到运行命令。

```
flatpak run org.kde.kdenlive
```

现在，你已经学会了如何设置、安装和运行 Flatpak 应用程序。现在是时候深入了解一下了。

#### 5、找出已安装的 Flatpak 应用程序列表

经过几年，你可能已经安装和删除了许多 Flatpak 应用程序。但是，你怎么找出安装了多少 Flatpak 应用程序？或者你可能想知道系统所安装的 Flatpak 应用是什么。

这里有一些 Flatpak 命令（通过终端运行），可以在这方面帮助你。

一个简单的 `flatpak` 命令可以列出所有安装的应用程序。这包括系统应用和你的应用：

```
flatpak list
```

只显示你的应用程序：

```
flatpak --user list
```

更详细一点，你可以在上述两个命令中使用额外的列（如名称、大小等）进行过滤：

```
flatpak --columns=app,name,size,installation list
```

```
flatpak --columns=name,size --user list
```

![flatpak 带有额外列的列出命令][5]

#### 6、找出已安装应用程序的更多信息

现在，你已经通过上述 Flatpak 命令安装了一个应用程序。但是，如果你想知道架构、版本、分支、许可证和其他信息，该怎么办呢？你可以使用 `info` 参数来实现。这个命令需要 Flatpak 的 “应用 ID”，你可以通过上面的 `flatpak list` 命令得到它。

例如：

```
flatpak info org.kde.kdenlive
```

![flatpak info 命令][6]

#### 7、找出 flatpak 命令在你系统中的全部历史记录

`flatpak` 命令中的 `histroy` 开关会列出在你的系统中发生的活动，包括安装、更新、卸载和日期时间戳。如果你想调查一些事情，这非常有用。

```
flatpak history
```

#### 8、更新 Flatpak 应用程序

`flatpak` 命令中的 `update` 参数可以更新所有的应用程序和运行时。当你运行这个命令时，它会显示可用的更新，并要求你确认是否继续。

```
flatpak update
```

如果你想更新一个特定的应用程序而不是整个系统，请使用 `--app` 或 `--runtime` 开关，分别用于应用程序和运行时。

例如，如果我想在我的系统中只更新 kdenlive，我将运行以下命令：

```
flatpak update --app org.kde.kdenlive
```

**提示**：`update` 参数通常会更新到任何程序的分支顶端。然而，使用 `update` 参数中的 `--commit` 开关，你可以更新到 Flatpak 中的某个特定分支（升级或降级）。例如：

```
flatpak update --app org.kde.kdenlive --commit 37103f4ee56361a73d20cf6957d88f3cab802909a5966c27a6e81d69795a15
```

如果你想使用同一个应用程序的多个版本，这个 `--commit` 开关是非常有用的。

![flatpak 带有提交开关的更新命令示例][7]

#### 9、管理 Flatpak 应用程序的权限

不同的应用程序需要不同的权限，如摄像头、麦克风、屏幕等等。通过命令来管理这些单独的权限有点让人不知所措。因此，管理 Flatpak 权限的最好方法是使用另一个叫做 Flatseal 的 Flatpak 应用程序。它为你提供了一个漂亮的 GUI，有切换按钮来启用/禁用/审查已安装的 Flatpak 应用程序的权限。

你可以在 [这里][8] 阅读 Flatseal 的更多信息。

#### 10、卸载 Flatpak 应用程序的命令

卸载 Flatpak 应用程序有不同的使用情况。所以，这里是快速指南。

要卸载单个应用程序，使用 `uninstall` 参数和应用程序 ID。例如：

```
flatpak uninstall org.kde.kdenlive
```

要卸载所有应用程序，使用 `—all` 开关：

```
flatpak uninstall --all
```

要卸载未使用的应用程序，请使用以下方法：

```
flatpak uninstall --unused
```

#### 11、删除并去除 Flatpak 应用程序的所有痕迹

**使用以下命令时要特别小心，因为它将删除一切。**

即使你卸载了 Flatpak 应用程序，一些应用程序的数据仍然保留在你的系统中，除非你在运行卸载程序时增加一些开关。在你可能想删除所有东西并重新开始使用 Flatpak 的情况下，这是必要的。

要卸载和删除特定应用程序的数据，请使用以下命令。例如：

```
flatpak uninstall -y --delete-data org.kde.kdenlive
```

要卸载和删除所有与 Flatpak 相关的东西，请使用下面的命令：

```
flatpak uninstall --all --delete-data
```

#### 12、清理和磁盘空间的使用

默认情况下，Flatpak 被安装在 `/var/lib/flatpak`。这个目录包含所有与 Flatpak 相关的数据和元数据以及运行时文件。而用户特定的安装目录是 `~/.local/share/flatpak`。

你可以用以下命令找出 Flatpak 应用程序使用的磁盘空间。

```
du -h /var/lib/flatpak
```

要清理，你可以使用上面提到的 `--unused` 或 `--uninstall` 开关。详情请访问我们的 [Flatpak 清理指南][9]。

### 总结

为了便于你随时参考，这里是对上面解释的 `flatpak` 命令的一个总结。把这个页面收藏起来，以便于参考。

```
# 安装和运行
flatpak install org.kde.kdenlive
flatpak run org.kde.kdenlive

# 列出已安装的 Flatpak 应用程序
flatpak list
flatpak --user list
flatpak --columns=app,name,size,installation list
flatpak --columns=name,size --user list

# 找出应用 ID 和命令历史
flatpak info org.kde.kdenlive
flatpak history

# 更新 Flatpak 应用程序
flatpak update
flatpak update --app org.kde.kdenlive

# 删除 Flatpak 应用程序
flatpak uninstall org.kde.kdenlive
flatpak uninstall --unused

# 删除应用及数据（小心使用）
flatpak uninstall --all
flatpak uninstall -y --delete-data org.kde.kdenlive
flatpak uninstall --all --delete-data
```

最后，请在评论框中告诉我，你认为还有哪些 Flatpak 命令也应该包括在这个列表中。

[一些例子来自官方参考资料][10]。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/flatpak-commands/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/08/fpref-1024x576.jpg
[2]: https://www.debugpoint.com/how-to-install-flatpak-apps-ubuntu-linux/
[3]: https://www.debugpoint.com/?attachment_id=10760
[4]: https://flathub.org/apps
[5]: https://www.debugpoint.com/?attachment_id=10758
[6]: https://www.debugpoint.com/?attachment_id=10757
[7]: https://www.debugpoint.com/wp-content/uploads/2022/08/Example-of-flatpak-commands-update-with-commit-1024x576.jpg
[8]: https://www.debugpoint.com/manage-flatpak-permission-flatseal/
[9]: https://www.debugpoint.com/clean-up-flatpak/
[10]: https://docs.flatpak.org/en/latest/flatpak-command-reference.html
