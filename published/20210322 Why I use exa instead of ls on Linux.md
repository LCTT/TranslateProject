[#]: subject: (Why I use exa instead of ls on Linux)
[#]: via: (https://opensource.com/article/21/3/replace-ls-exa)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13237-1.html)

为什么我在 Linux 上使用 exa 而不是 ls？
======

> exa 是一个 Linux ls 命令的现代替代品。

![](https://img.linux.net.cn/data/attachment/album/202103/26/101726h008fn6tttn4g6gt.jpg)

我们生活在一个繁忙的世界里，当我们需要查找文件和数据时，使用 `ls` 命令可以节省时间和精力。但如果不经过大量调整，默认的 `ls` 输出并不十分舒心。当有一个 exa 替代方案时，为什么要花时间眯着眼睛看黑白文字呢？

[exa][2] 是一个常规 `ls` 命令的现代替代品，它让生活变得更轻松。这个工具是用 [Rust][3] 编写的，该语言以并行性和安全性而闻名。

### 安装 exa

要安装 `exa`，请运行：

```
$ dnf install exa
```

### 探索 exa 的功能

`exa` 改进了 `ls` 文件列表，它提供了更多的功能和更好的默认值。它使用颜色来区分文件类型和元数据。它能识别符号链接、扩展属性和 Git。而且它体积小、速度快，只有一个二进制文件。

#### 跟踪文件

你可以使用 `exa` 来跟踪某个 Git 仓库中新增的文件。

![Tracking Git files with exa][4]

#### 树形结构

这是 `exa` 的基本树形结构。`--level` 的值决定了列表的深度，这里设置为 2。如果你想列出更多的子目录和文件，请增加 `--level` 的值。

![exa's default tree structure][6]

这个树包含了每个文件的很多元数据。

![Metadata in exa's tree structure][7]

#### 配色方案

默认情况下，`exa` 根据 [内置的配色方案][8] 来标识不同的文件类型。它不仅对文件和目录进行颜色编码，还对 `Cargo.toml`、`CMakeLists.txt`、`Gruntfile.coffee`、`Gruntfile.js`、`Makefile` 等多种文件类型进行颜色编码。

#### 扩展文件属性

当你使用 `exa` 探索 xattrs（扩展的文件属性）时，`--extended` 会显示所有的 xattrs。

![xattrs in exa][9]

#### 符号链接

`exa` 能识别符号链接，也能指出实际的文件。

![symlinks in exa][10]

#### 递归

当你想递归当前目录下所有目录的列表时，`exa` 能进行递归。

![recurse in exa][11]

### 总结

我相信 `exa 是最简单、最容易适应的工具之一。它帮助我跟踪了很多 Git 和 Maven 文件。它的颜色编码让我更容易在多个子目录中进行搜索，它还能帮助我了解当前的 xattrs。

你是否已经用 `exa` 替换了 `ls`？请在评论中分享你的反馈。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/replace-ls-exa

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://the.exa.website/docs
[3]: https://opensource.com/tags/rust
[4]: https://opensource.com/sites/default/files/uploads/exa_trackingfiles.png (Tracking Git files with exa)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/exa_treestructure.png (exa's default tree structure)
[7]: https://opensource.com/sites/default/files/uploads/exa_metadata.png (Metadata in exa's tree structure)
[8]: https://the.exa.website/features/colours
[9]: https://opensource.com/sites/default/files/uploads/exa_xattrs.png (xattrs in exa)
[10]: https://opensource.com/sites/default/files/uploads/exa_symlinks.png (symlinks in exa)
[11]: https://opensource.com/sites/default/files/uploads/exa_recurse.png (recurse in exa)
