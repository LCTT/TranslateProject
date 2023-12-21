[#]: subject: "Searching for packages with ‘rpm-ostree search’"
[#]: via: "https://fedoramagazine.org/searching-for-packages-with-rpm-ostree-search/"
[#]: author: "Mateus Rodrigues Costa https://fedoramagazine.org/author/mateusrodcosta/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 “rpm-ostree search” 搜索软件包
======

![][1]

照片由 [Markus Winkler][2] 发布在 [Unsplash][3]

本文介绍如何使用 rpm-ostree 查找要添加到基于 ostree 的系统（例如 Silverblue 和 Kinoite）的应用。

基于 Fedora ostree 的系统的主要优点之一是系统的不变性。该镜像不仅是只读的，而且是预先构建在 Fedora 服务器上的。因此，更新正在运行的系统会下载更新增量（即仅差异）并修补系统。这使得许多安装在默认情况下都是相同的。

对于大多数人来说，预构建的映像就足够了，因为通常鼓励用户同时使用 Flatpak 安装应用，使用工具箱进行开发任务。但是，如果特定应用不符合此要求并且用户需要在主机系统上安装应用怎么办？

在这种情况下，可以选择在系统上覆盖软件包，在本地创建一个新的镜像，在标准镜像上添加软件包。

但是，我如何知道我要安装哪个包？ 搜索功能怎么样？

### 老方法（_toolbox_ \+ _dnf search_）

虽然始终可以通过支持 PackageKit 的软件中心（例如 GNOME Software 或 KDE Discover）搜索软件包，但通过 CLI 来搜索软件包有点困难。

由于 _rpm-ostree_ 不曾提供搜索命令，因此常见的搜索方式是使用 _toolbox enter_ 进入工具箱并使用 _dnf search <搜索词>_ 进行搜索。这样做的缺点是需要在工具箱中启用相同的仓库才能获得正确的搜索结果。

搜索 _neofetch_ 的示例：

```

    $ toolbox enter
    <注意，此时工具箱命令可能要求创建工具箱，这可能涉及下载容器镜像> 
    ⬢[fedora@toolbox ~]$ dnf search neofetch
    <snip>
    === Name Exactly Matched: neofetch ===
    neofetch.noarch : CLI system information tool written in Bash
    === Summary Matched: neofetch ===
    fastfetch.x86_64 : Like neofetch, but much faster because written in c

```

### 新方法（_rpm-ostree search_）

从 [version 2023.6][4] 开始，_rpm-ostree_ 支持 “search” 选项，允许用户使用 rpm-ostree 搜索可用的软件包。一个示例命令是：

````

      rpm-ostree search *kernel

````

要使用搜索选项，请首先确保你使用的是 _rpm-ostree_ 2023.6 或更高版本：

````

     $ rpm-ostree --version
    rpm-ostree:
     Version: '2023.8'
     Git: 9a99d0af32640b234318815a256a2d11e35fa64c
     Features:
      - rust
      - compose
      - container
      - fedora-integration

````

如果满足版本要求，你应该能够运行 _rpm-ostree search <搜索词>_。

这是一个使用 _rpm-ostree search_ 搜索 neofetch 的示例：

```

    $ rpm-ostree search neofetch

    ===== Name Matched =====
    neofetch : CLI system information tool written in Bash

    ===== Summary Matched =====
    fastfetch : Like neofetch, but much faster because written in c

```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/searching-for-packages-with-rpm-ostree-search/

作者：[Mateus Rodrigues Costa][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mateusrodcosta/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/11/rpm-ostree_search-816x345.jpg
[2]: https://unsplash.com/@markuswinkler?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[3]: https://unsplash.com/photos/magnifying-glass-on-white-table-afW1hht0NSs?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[4]: https://github.com/coreos/rpm-ostree/releases/tag/v2023.6
