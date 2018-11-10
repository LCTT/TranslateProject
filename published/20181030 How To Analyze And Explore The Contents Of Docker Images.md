如何分析并探索 Docker 容器镜像的内容
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/dive-tool-720x340.png)

或许你已经了解到 Docker 容器镜像是一个轻量、独立、含有运行某个应用所需全部软件的可执行包，这也是为什么容器镜像会经常被开发者用于构建和分发应用。假如你很好奇一个 Docker 镜像里面包含了什么东西，那么这篇简要的指南或许会帮助到你。今天，我们将学会使用一个名为 **Dive** 的工具来分析和探索 Docker 镜像每层的内容。

通过分析 Docker 镜像，我们可以发现在各个层之间可能重复的文件并通过移除它们来减小 Docker 镜像的大小。Dive 工具不仅仅是一个 Docker 镜像分析工具，它还可以帮助我们来构建镜像。Dive 是一个用 Go 编程语言编写的自由开源工具。

### 安装 Dive

首先从该项目的 [发布页][1] 下载最新版本，然后像下面展示的那样根据你所使用的发行版来安装它。

假如你正在使用 **Debian** 或者 **Ubuntu**，那么可以运行下面的命令来下载并安装它。

```
$ wget https://github.com/wagoodman/dive/releases/download/v0.0.8/dive_0.0.8_linux_amd64.deb
```

```
$ sudo apt install ./dive_0.0.8_linux_amd64.deb
```

**在 RHEL 或 CentOS 系统中**

```
$ wget https://github.com/wagoodman/dive/releases/download/v0.0.8/dive_0.0.8_linux_amd64.rpm
```

```
$ sudo rpm -i dive_0.0.8_linux_amd64.rpm
```

Dive 也可以使用 [Linuxbrew][2] 包管理器来安装。

```
$ brew tap wagoodman/dive
```

```
$ brew install dive
```

至于其他的安装方法，请参考 [Dive 项目的 GitHub 网页][3]。

### 分析并探索 Docker 镜像的内容

要分析一个 Docker 镜像，只需要运行加上 Docker 镜像 ID 的 `dive` 命令就可以了。你可以使用 `sudo docker images` 来得到 Docker 镜像的 ID。

```
$ sudo dive ea4c82dcd15a
```

上面命令中的 `ea4c82dcd15a` 是某个镜像的 ID。

然后 `dive` 命令将快速地分析给定 Docker 镜像的内容并将它在终端中展示出来。

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Dive-1.png)

正如你在上面的截图中看到的那样，在终端的左边一栏列出了给定 Docker 镜像的各个层及其详细内容，浪费的空间大小等信息。右边一栏则给出了给定 Docker 镜像每一层的内容。你可以使用 `Ctrl+空格` 来在左右栏之间切换，使用 `UP`/`DOWN` 光标键来在目录树中进行浏览。

下面是 `dive` 的快捷键列表：

  * `Ctrl+空格` —— 在左右栏之间切换
  * `空格` —— 展开或收起目录树
  * `Ctrl+A` —— 文件树视图：展示或隐藏增加的文件
  * `Ctrl+R` —— 文件树视图：展示或隐藏被移除的文件
  * `Ctrl+M` —— 文件树视图：展示或隐藏被修改的文件
  * `Ctrl+U` —— 文件树视图：展示或隐藏未修改的文件
  * `Ctrl+L` —— 层视图：展示当前层的变化
  * `Ctrl+A` —— 层视图：展示总的变化
  * `Ctrl+/` —— 筛选文件
  * `Ctrl+C` —— 退出

在上面的例子中，我使用了 `sudo` 权限，这是因为我的 Docker 镜像存储在 `/var/lib/docker/` 目录中。假如你的镜像保存在你的家目录 （`$HOME`）或者在其他不属于 `root` 用户的目录，你就没有必要使用 `sudo` 命令。

你还可以使用下面的单个命令来构建一个 Docker 镜像并立刻分析该镜像：

```
$ dive build -t <some-tag>
```

Dive 工具仍处于 beta 阶段，所以可能会存在 bug。假如你遇到了 bug，请在该项目的 GitHub 主页上进行报告。

好了，这就是今天的全部内容。现在你知道如何使用 Dive 工具来探索和分析 Docker 容器镜像的内容以及利用它构建镜像。希望本文对你有所帮助。

更多精彩内容即将呈现，请保持关注！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-analyze-and-explore-the-contents-of-docker-images/

作者：[SK][a]
选题：[lujun9972][b]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://github.com/wagoodman/dive/releases
[2]: https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
[3]: https://github.com/wagoodman/dive
