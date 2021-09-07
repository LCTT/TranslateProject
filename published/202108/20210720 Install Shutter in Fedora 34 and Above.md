[#]: subject: (Install Shutter in Fedora 34 and Above)
[#]: via: (https://www.debugpoint.com/2021/07/install-shutter-fedora/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13641-1.html)

在 Fedora 34 及以上版本中安装 Shutter
======

![](https://img.linux.net.cn/data/attachment/album/202108/01/211059fzo531621ydrr27k.jpg)

> 这个快速指南解释了在 Fedora 34 及以上版本中安装 Shutter 所需的步骤。

截图工具有很多替代和选择。但在我个人看来，没有一个能接近 Shutter 的灵活性。不幸的是，由于各种依赖性问题，特别是它的设计方式，多年来，Linux 发行版，如 Ubuntu、Fedora，都面临着将这个应用打包到官方仓库的问题。

主要问题是它仍然基于 GTK2 和 Perl。当大多数应用转移到 GTK3 时，它仍然是 GTK2。这就造成了一个依赖性问题，因为 Debian/Ubuntu、Fedora 删除了某些包的依赖的 GTK2 版本。

在 Fedora 34 及以上版本中安装 [Shutter][1] 截图工具需要采用另一种方法。

现在，你只能通过个人包存档（PPA）来安装这个工具。下面是如何在 Fedora 34 及以上版本中安装它。

![Shutter in Fedora][2]

### 在 Fedora 34 及以上版本中安装 Shutter

在你的 Fedora 中打开一个终端，启用以下 [Shutter 的 copr 仓库][3]。这个包存档为 Fedora 的 Shutter 提供了一个单独的构建，其中包含了所有未满足的依赖项。

```
sudo dnf copr enable geraldosimiao/shutter
```

完成后，你就可以通过 `dnf` 在 Fedora 34 及以上版本中简单地安装 Shutter。

```
sudo dnf install shutter
```

尽管目前最新的版本是 v0.97。遗憾的是，该仓库目前包含旧的 v0.94.x。我希望版本库的所有者尽快包括最新的版本。

安装后，你可以通过应用菜单启动它。

#### 卸载 Shutter

如果你愿意，你可以通过命令轻松地删除这个第三方仓库：

```
sudo dnf copr remove geraldosimiao/shutter
```

然后按照下面的方法，完全删除 Shutter，包括依赖关系。

```
sudo dnf autoremove shutter
```

#### 在其他 Linux 发行版中安装 Shutter

如果你想在 Debian、Ubuntu 或相关发行版中安装它，请 [查看此指南][4]。

### Shutter 的开发

最近，这个项目 [转移到了 GitHub][6]，以便更好地协作，并且正在进行 GTK3 移植。而且它相当活跃，最近还发布了一个版本。我们希望它能尽快被移植到 GTK3 上，并在各发行版的原生仓库中可用。

如果你在安装 Shutter 时遇到任何错误，请在评论栏告诉我。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/install-shutter-fedora/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/tag/shutter
[2]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Shutter-in-Fedora.jpeg
[3]: https://copr.fedorainfracloud.org/coprs/geraldosimiao/shutter/
[4]: https://www.debugpoint.com/2020/04/shutter-install-ubuntu/
[6]: https://github.com/shutter-project/shutter
