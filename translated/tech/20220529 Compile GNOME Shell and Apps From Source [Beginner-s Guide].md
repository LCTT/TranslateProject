[#]: subject: "Compile GNOME Shell and Apps From Source [Beginner’s Guide]"
[#]: via: "https://www.debugpoint.com/2022/05/compile-gnome-source/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

从源码编译 Gnome Shell 和应用（初学者指南）
======
这是你如何从其来源码编译 GNOME 的快速指南，包括 shell，mutter 和一些原生应用。

在编译之前，你需要确保一些事情，因为以下编译直接来自 Gitlab 的主分支，其中包含一些开发包。

通常，你可以选择在任何 Linux 分发中编译。但是我建议使用 Fedora Rawhide（Fedora 的开发分支，即未来版本）。

另外，请勿在稳定系统中尝试此操作。因为操作可能出错，所以你可能最终得到损坏的系统。

总而言之，你需要以下内容来从源码编译 Gnome。

* 测试设置（[虚拟机][1]或测试系统）。
* Fedora Rawhide 发行版（推荐，[从此处下载][2]）。
* 确保你的发行版是最新的。
* 你已登录 X.org 会话。

我不建议你在 Wayland 会话中进行编译，因为你会遇到问题。

### 从源码编译 Gnome

Gnome 桌面是基于其功能的软件包集合。Linux 发行版的桌面组件在窗口管理器和 shell 下工作。

因此，对于 Gnome，我将首先编译 mutter – Gnome Shell 的窗口管理。然后进行 Gnome Shell 的编译。最后，我将编译一些原生应用。

我将使用 meson 构建系统进行编译。meson 是一个美丽的构建系统，快速且用户友好。

#### 编译 Mutter

打开终端并安装需要的 GNOME Shell 和 mutter。

```
sudo dnf build-dep mutter gnome-shell
```

在主目录（或你想要的任何地方）中创建演示目录。

```
cd ~
```

```
mkdir demo
```

```
cd demo
```

从 Gitlab 克隆 mutter 的主分支。

git clone https://gitlab.gnome.org/GNOME/mutter

进入克隆目录，然后使用以下 meson 命令来准备构建文件。默认情况下，Meson 使用 `/usr/local` 用于构建文件。但是，你也可以使用前缀开关将输出重定向到特定文件夹（如下所示）。

```
cd mutter
```

```
meson _build --prefix=/usr
```

![Compile Mutter for GNOME][3]

使用以下命令在构建完成时，将 mutter 安装在到系统中。

```
sudo ninja install -C _build
```

#### 编译 GNOME Shell

GNOME Shell 和其他软件包的编译方法类似。首先，从 GitLab 克隆 GNOME Shell 主仓库，然后进行编译和安装。你可以按照下面的命令依次进行。

在 GNOME Shell 中，你需要两个依赖项。它们是 [asciidoc][4] 和 [sassc][5] 。请在构建 GNOME Shell 之前安装它们。

```
sudo dnf install asciidoc
```

```
sudo dnf install sassc
```

安装完这些依赖项后，按照下面的命令来构建和安装 GNOME Shell。在运行这个命令之前，请确保你回到 `demo` 文件夹（我在第一步创建的）。

```
git clone https://gitlab.gnome.org/GNOME/gnome-shellcd gnome-shellmeson _build --prefix=/usrsudo ninja install -C _build
```

### 运行 GNOME Shell

编译完成后，你可以尝试重新启动 GNOME Shell 来查看主分支的变化。

在重启之前，正如我之前提到的，确保你处于 X.Org 会话中。按 `ALT+F2` 并输入 `r`。然后按回车键。这个命令将重启 GNOME Shell。

![Restart GNOME Shell (X11)][6]

恭喜你! 你已经成功地编译了 GNOME Shell 和 Mutter。

现在，是时候编译一些 GNOME 原生应用了。

### 编译 GNOME 原生应用

这些步骤对于 GNOME 或任何应用的所有源码都是一样的。你需要改变仓库的名字。因此，这里有一些编译必要的 GNOME 原生应用的命令示例。

#### Files（Nautilus）

```
git clone https://gitlab.gnome.org/GNOME/nautilus/cd gnome-shellmeson _build --prefix=/usrsudo ninja install -C _build
```

#### GNOME 软件

```
git clone https://gitlab.gnome.org/GNOME/gnome-software/cd gnome-shellmeson _build --prefix=/usrsudo ninja install -C _build
```

#### GNOME 控制中心

```
git clone https://gitlab.gnome.org/GNOME/gnome-control-center/cd gnome-shellmeson _build --prefix=/usrsudo ninja install -C _build
```

### FAQ

1. 使用上述步骤，你可以编译任何源码分支。不仅仅是 GNOME。
2. GitLab 服务器有时很慢，克隆一个仓库可能需要较长的时间。如果 `git clone` 失败，我建议你再试一次。

### 结束语

我希望这个小小的高级教程能够帮助你在 GNOME 每日构建系统出现之前尝试新的 GNOME 功能。既然你编译了，你也可以为测试新的 GNOME 功能做出贡献，并在 GitLab 问题页面上报告任何特定包的 bug 或问题。

这篇文章是开源应用编译系列的第一篇文章。请继续关注更多开源应用的编译文章。

另外，请让我在下面的评论栏中知道你的评论、建议，或者你在使用这些说明时遇到的任何错误。

干杯。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/compile-gnome-source/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/tag/virtual-machine
[2]: https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Workstation/x86_64/iso/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/05/Compile-Mutter-for-GNOME.jpg
[4]: https://asciidoc.org/
[5]: https://github.com/sass/sassc
[6]: https://www.debugpoint.com/wp-content/uploads/2022/05/Restart-GNOME-Shell-X11.jpg
