[#]: subject: (Replace du with dust on Linux)
[#]: via: (https://opensource.com/article/21/6/dust-linux)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13532-1.html)

在 Linux 上用 dust 代替 du
======

> dust 命令是用 Rust 编写的对 du 命令的一个更直观实现。

![](https://img.linux.net.cn/data/attachment/album/202106/29/033403l8x83x7a4tt4fq84.jpg)

如果你在 Linux 命令行上工作，你会熟悉 `du` 命令。了解像 `du` 这样的命令，可以快速返回磁盘使用情况，是命令行使程序员更有效率的方法之一。然而，如果你正在寻找一种方法来节省更多的时间，使你的生活更加容易，看看 [dust][2]，它是用 Rust 重写的 `du`，具有更多的直观性。

简而言之，`dust` 是一个提供文件类型和元数据的工具。如果你在一个目录中运行了 `dust`，它将以几种方式报告该目录的磁盘利用率。它提供了一个信息量很大的图表，告诉你哪个文件夹使用的磁盘空间最大。如果有嵌套的文件夹，你可以看到每个文件夹使用的空间百分比。

### 安装 dust

你可以使用 Rust 的 Cargo 包管理器安装 `dust`：

```
$ cargo install du-dust
```

另外，你可以在 Linux 上的软件库中找到它，在 macOS 上，可以使用 [MacPorts][3] 或 [Homebrew][4]。

### 探索 dust

在一个目录中执行 `dust` 命令，会返回一个图表，以树状格式显示其内容和每个项目所占的百分比。


```
$ dust
 5.7M   ┌── exa                                                           │                                                ██ │   2%
 5.9M   ├── tokei                                                         │                                                ██ │   2%
 6.1M   ├── dust                                                          │                                                ██ │   2%
 6.2M   ├── tldr                                                          │                                                ██ │   2%
 9.4M   ├── fd                                                            │                                                ██ │   4%
 2.9M   │ ┌── exa                                                         │                                              ░░░█ │   1%
  15M   │ ├── rustdoc                                                     │                                              ░███ │   6%
  18M   ├─┴ bin                                                           │                                              ████ │   7%
  27M   ├── rg                                                            │                                            ██████ │  11%
 1.3M   │     ┌── libz-sys-1.1.3.crate                                    │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█ │   0%
 1.4M   │     ├── libgit2-sys-0.12.19+1.1.0.crate                         │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█ │   1%
 4.5M   │   ┌─┴ github.com-1ecc6299db9ec823                               │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█ │   2%
 4.5M   │ ┌─┴ cache                                                       │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█ │   2%
 1.0M   │ │   ┌── git2-0.13.18                                            │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   0%
 1.4M   │ │   ├── exa-0.10.1                                              │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 1.5M   │ │   │ ┌── src                                                   │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 2.2M   │ │   ├─┴ idna-0.2.3                                              │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 1.2M   │ │   │       ┌── linux                                           │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   0%
 1.6M   │ │   │     ┌─┴ linux_like                                        │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 2.6M   │ │   │   ┌─┴ unix                                                │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 3.1M   │ │   │ ┌─┴ src                                                   │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 3.1M   │ │   ├─┴ libc-0.2.94                                             │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 1.2M   │ │   │     ┌── test                                              │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   0%
 2.6M   │ │   │   ┌─┴ zlib-ng                                             │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 904K   │ │   │   │   ┌── vstudio                                         │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   0%
 2.0M   │ │   │   │ ┌─┴ contrib                                           │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 3.4M   │ │   │   ├─┴ zlib                                                │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 6.1M   │ │   │ ┌─┴ src                                                   │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓██ │   2%
 6.1M   │ │   ├─┴ libz-sys-1.1.3                                          │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓██ │   2%
 1.6M   │ │   │     ┌── pcre                                              │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 2.5M   │ │   │   ┌─┴ deps                                                │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 3.8M   │ │   │   ├── src                                                 │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 7.4M   │ │   │ ┌─┴ libgit2                                               │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓██ │   3%
 7.6M   │ │   ├─┴ libgit2-sys-0.12.19+1.1.0                               │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓██ │   3%
  26M   │ │ ┌─┴ github.com-1ecc6299db9ec823                               │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████ │  10%
  26M   │ ├─┴ src                                                         │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████ │  10%
 932K   │ │   ┌── .cache                                                  │               ░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█ │   0%
  11M   │ │   │     ┌── pack-c3e3a51a17096a3078196f3f014e02e5da6285aa.idx │               ░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███ │   4%
 135M   │ │   │     ├── pack-c3e3a51a17096a3078196f3f014e02e5da6285aa.pack│               ░░░░░░▓▓███████████████████████████ │  53%
 147M   │ │   │   ┌─┴ pack                                                │               ░░░░░░█████████████████████████████ │  57%
 147M   │ │   │ ┌─┴ objects                                               │               ░░░░░░█████████████████████████████ │  57%
 147M   │ │   ├─┴ .git                                                    │               ░░░░░░█████████████████████████████ │  57%
 147M   │ │ ┌─┴ github.com-1ecc6299db9ec823                               │               ░░░░░░█████████████████████████████ │  57%
 147M   │ ├─┴ index                                                       │               ░░░░░░█████████████████████████████ │  57%
 178M   ├─┴ registry                                                      │               ███████████████████████████████████ │  69%
 257M ┌─┴ .                                                               │██████████████████████████████████████████████████ │ 100%
$
```

将 `dust` 应用于一个特定的目录：

```
$ dust ~/Work/
```

![Dust output from a specific directory][5]

`-r` 选项以相反的顺序显示输出，“根”在底部：

```
$ dust -r ~/Work/
```

使用 `dust -d 3` 会返回三层的子目录和它们的磁盘利用率：

```
$ dust -d 3 ~/Work/wildfly/jaxrs/target/classes
 4.0K     ┌── jaxrs.xml                                                           │                                         █ │   1%
 4.0K   ┌─┴ subsystem-templates                                                   │                                         █ │   1%
 4.0K   │   ┌── org.jboss.as.controller.transform.ExtensionTransformerRegistration│                                         █ │   1%
 4.0K   │   ├── org.jboss.as.controller.Extension                                 │                                         █ │   1%
 8.0K   │ ┌─┴ services                                                            │                                         █ │   2%
 8.0K   ├─┴ META-INF                                                              │                                         █ │   2%
 4.0K   │ ┌── jboss-as-jaxrs_1_0.xsd                                              │                                        ░█ │   1%
 8.0K   │ ├── jboss-as-jaxrs_2_0.xsd                                              │                                        ░█ │   2%
  12K   ├─┴ schema                                                                │                                        ██ │   3%
 408K   │   ┌── as                                                                │  ████████████████████████████████████████ │  94%
 408K   │ ┌─┴ jboss                                                               │  ████████████████████████████████████████ │  94%
 408K   ├─┴ org                                                                   │  ████████████████████████████████████████ │  94%
 432K ┌─┴ classes                                                                 │██████████████████████████████████████████ │ 100%
$
```

### 总结

`dust` 的魅力在于它是一个小而简单的、易于理解的命令。它使用颜色方案来表示最大的子目录，使你的目录易于可视化。这是一个受欢迎的项目，欢迎大家来贡献。

你是否使用或考虑使用 `dust`？如果是，请在下面的评论中告诉我们你的想法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/dust-linux

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/sand_dunes_desert_hills_landscape_nature.jpg?itok=wUByylBb
[2]: https://github.com/bootandy/dust
[3]: https://opensource.com/article/20/11/macports
[4]: https://opensource.com/article/20/6/homebrew-mac
[5]: https://opensource.com/sites/default/files/uploads/dust-work.png (Dust output from a specific directory)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
