[#]: subject: "Install and Use Nix Package Manager on non-Nix OS like Ubuntu"
[#]: via: "https://itsfoss.com/ubuntu-install-nix-package-manager/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16307-1.html"

在 Ubuntu 等非 Nix 操作系统上安装和使用 Nix 包管理器
======

![][0]

> Nix 软件包管理器可以安装在任何 Linux 发行版上。具体方法如下。

[人们喜欢使用不可变的 NixOS][1] 的原因之一是它的 Nix 包管理器。

它有超过 80,000 个软件包，这可能与 Debian 软件包的数量相差比较大，但仍然令人印象深刻。

好处是你不必仅仅为了包管理器而 [安装 NixOS][2]。与 [Homebrew][3] 和 Rust 的 [Cargo 包管理器][4] 一样，你可以在当前发行版中使用 Nix 包管理器。

为什么要这么做？因为有时，你可能会发现仅以 Nix 打包格式提供的新应用。这种情况很少见，但有可能。

在本教程中，我将引导你完成以下内容：

   * 安装 Nix 包管理器
   * 搜索并安装包
   * 尝试/测试软件包而不安装它们
   * 更新包
   * 删除包

### 在其他 Linux 发行版上安装 Nix 包管理器

Nix 包管理器有两种安装方式：全局安装和本地安装。

> 📋 全局安装意味着系统上的每个可用用户都可以访问 nix 包管理器，而本地安装仅适用于当前用户。[Nix 官方文档][5] 建议你使用全局安装。

#### 全局安装

如果你想全局安装 Nix 包管理器，那么，你需要执行以下命令：

````
sh <(curl -L https://nixos.org/nix/install) --daemon
````

执行上述命令后，需要输入 `y` 键并按回车键：

![][6]

完成后，关闭当前终端，因为它不会在当前终端会话上运行。

#### 本地安装

如果你更喜欢本地安装并且不想每次都使用 `sudo`，则执行以下命令：

````
sh <(curl -L https://nixos.org/nix/install) --no-daemon
````

输入 `y` 并在要求确认时按回车键。

完成后，关闭当前终端会话并启动一个新终端会话以使用 Nix 包管理器。

### 搜索并安装包

安装 Nix 包管理器后，下一步是搜索包。

首先，[访问 Nix 搜索的官方页面][7] 并输入你要安装的软件包的名称。

从给定的描述中，你可以找到所需的软件包，然后选择 `nix-env` 进行永久安装。

在这里，你可以添加一些额外的关键字以获得更好的搜索结果。例如，在这里，我搜索 “Firefox browser”：

![][8]

我上面提到的最后一步（“复制命令”）什么也不做，只是为你提供了一个用于安装的命令。

现在，你所要做的就是在终端中执行该命令。

就我而言，它给了我以下命令来安装 Firefox：

````
nix-env -iA nixpkgs.firefox
````

完成后，你可以使用以下命令列出已安装的软件包：

````
nix-env -q
````

![][9]

### 使用包而不安装它们

到目前为止，这是 Nix 包管理器的最佳功能，因为你可以使用/测试包甚至不用安装它！

为此，你可以使用 Nix Shell，它允许你将交互式 Shell 与指定的包一起使用，关闭后，你将无法再访问该包。

很酷，对吧？

要使用 nix-shell 访问你喜欢的软件包，请使用以下命令语法：

````
nix-shell -p <package_name>
````

例如，我想使用一次 `neofetch`，所以我使用了以下命令：

````
nix-shell -p neofetch
````

![][10]

要退出 Shell，你所要做的就是执行 `exit` 命令：

````
exit
````

### 使用 Nix 包管理器更新包

使用 Nix 包管理器更新包非常简单。

要更新软件包，首先，你需要使用以下命令更新频道：

````
nix-channel --update
````

接下来，你可以通过试运行更新命令来列出过时的软件包：

````
nix-env --upgrade --dry-run
````

![][11]

就我而言，Firefox 浏览器已经过时，需要更新！

要更新单个包，请使用以下命令：

````
nix-env -u <Package_name>
````

如果你想一次更新所有软件包，请使用以下命令：

````
nix-env -u
````

### 使用 Nix 包管理器删除包

要删除软件包，你只需按以下方式执行 `nix-env` 命令即可：

````
nix-env --uninstall [package_name]
````

例如，如果我想删除 Firefox 浏览器，那么，我将使用以下命令：

````
nix-env --uninstall firefox
````

![][12]

### 通过 NixOS 释放其全部潜力

如果你喜欢 Nix 包管理器背后的想法，请相信我，你一定会喜欢 [NixOS][13]。

仅使用一个配置文件来复制整个系统就足以说服我切换到 NixOS，但还有更多原因：

我喜欢 NixOS。以至于我写了整个系列，这样你就不必阅读文档（基础知识）：

> **[NixOS 系列][1]**

我希望你能像我一样喜欢使用它。

*（题图：MJ/da586165-eadb-4ed7-9a0b-9c92903344d5）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-install-nix-package-manager/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-15606-1.html
[2]: https://linux.cn/article-15624-1.html
[3]: https://linux.cn/article-14065-1.html
[4]: https://linux.cn/article-13938-1.html
[5]: https://nixos.org/learn
[6]: https://itsfoss.com/content/images/2023/10/Install-nix-package-manager-globally.png
[7]: https://search.nixos.org/packages
[8]: https://itsfoss.com/content/images/2023/10/Search-packages-to-install-using-the-Nix-package-manager.png
[9]: https://itsfoss.com/content/images/2023/10/List-installed-packages-using-the-nix-package-manager.png
[10]: https://itsfoss.com/content/images/2023/10/Use-packages-wihout-installing-them-using-the-nix-package-manager.png
[11]: https://itsfoss.com/content/images/2023/10/List-outdated-packages-using-the-nix-package-manager.png
[12]: https://itsfoss.com/content/images/2023/10/Remove-packages-using-the-nix-package-manager-1.png
[13]: https://nixos.org/
[0]: https://img.linux.net.cn/data/attachment/album/202310/22/082116ket5ed87padptmbw.jpg