[#]: subject: "Using Homebrew Package Manager on Fedora Linux"
[#]: via: "https://fedoramagazine.org/using-homebrew-package-manager-on-fedora-linux/"
[#]: author: "Mehdi Haghgoo https://fedoramagazine.org/author/powergame/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Fedora Linux 上使用 Homebrew 包管理器
======

![][1]

### 简介

Homebrew 是一个 macOS 的包管理器，用于在 macOS 上安装 UNIX 工具。但是，它也可以在 Linux（和 Windows WSL）上使用。它是用 Ruby 编写的，并提供主机系统（macOS 或 Linux）可能不提供的软件包，因此它在操作系统包管理器之外提供了一个辅助的包管理器。此外，它只向其前缀（/home/linuxbrew/.linuxbrew 或 \~/.linuxbrew）安装软件包，作为非 root 用户，它不会污染系统路径。这个包管理器在 Fedora Linux 上也适用。在这篇文章中，我将尝试告诉你 Homebrew 与 Fedora Linux 包管理器 _dnf_ 有什么不同，为什么你可能想在 Fedora Linux 上安装和使用它，以及如何安装。

##### 警告

你应该经常检查你在系统上安装的软件包和二进制文件。Homebrew 包通常在专门前缀的路径以非 sudoer 用户运行，因此它们不太可能造成破坏或错误配置。然而，做所有的安装都要自己承担风险。作者和 Fedora 社区不对任何可能直接或间接因遵循这篇文章而造成的损失负责。

### Homebrew 如何工作

Homebrew 在背后使用 Ruby 和 Git。它使用特殊的 Ruby 脚本从源代码构建软件，这些脚本被称为 formula，看起来像这样（使用 wget 包作为例子）：

```

    class Wget < Formula
      homepage "https://www.gnu.org/software/wget/"
      url "https://ftp.gnu.org/gnu/wget/wget-1.15.tar.gz"
      sha256 "52126be8cf1bddd7536886e74c053ad7d0ed2aa89b4b630f76785bac21695fcd"

      def install
        system "./configure", "--prefix=#{prefix}"
        system "make", "install"
      end
    end

```

### Homebrew与 _dnf_ 有何不同

Homebrew 是一个包管理器，提供了许多 UNIX 软件工具和包的最新版本，例如 ffmpeg、composer、minikube 等。当你想安装一些由于某种原因在 Fedora Linux _rpm_ 仓库中没有的软件包时，它就会证明很有用。所以，它并不能取代 _dnf_。

### 安装 Homebrew

在开始安装 Homebrew 之前，确保你已经安装了 glibc 和 gcc。这些工具可以在 Fedora 上通过以下方式安装：

```

    sudo dnf groupinstall "Development Tools"

```

然后，通过在终端运行以下命令来安装 Homebrew：

```

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

```

在安装过程中，你会被提示输入你的 sudo 密码。另外，你可以选择 Homebrew 的安装前缀，但默认的前缀就可以了。在安装过程中，你将成为 Homebrew 前缀的所有者，这样你就不必输入 sudo 密码来安装软件包。安装将需要数分钟。完成后，运行以下命令，将 brew 添加到你的PATH中：

```

    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bash_profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

```

### 安装和检查软件包

要在 Homebrew 上使用 formula 安装一个软件包，只需运行：

```

    brew install <formula>

```

将 &lt;formula&gt; 替换为你要安装的 formula 的名称。例如，要安装 Minikube，只需运行：

```

    brew install minikube

```

你也可以用以下方式搜索 formula：

```

    brew search <formula>

```

要获得一个 formula 的信息，请运行：

```

    brew info <formula>

```

另外，你可以用以下命令查看所有已安装的 formula：

```

    brew list

```

### 卸载软件包

要从你的 Homebrew 前缀中卸载一个软件包，请运行：

```

    brew uninstall <formula>

```

### 升级软件包

要升级一个用 Homebrew 安装的特定软件包，请运行：

```

    brew upgrade <formula>

```

要更新 Homebrew 和所有已安装的 Formula 到最新版本，请运行：

```

    brew update

```

### 总结

Homebrew 是一个简单的包管理器，可以与 _dnf_ 一起成为有用的工具（两者完全没有关系）。尽量坚持使用 Fedora 的本地 _dnf_ 包管理器，以避免软件冲突。然而，如果你在 Fedora Linux 软件库中没有找到某个软件，那么你也许可以用 Homebrew 找到并安装它。请看 [Formula 列表][2]了解有哪些可用的软件。另外，Fedora Linux 上的 Homebrew 还不支持图形化应用（在 Homebrew 术语中称为 casks）。至少，我在安装任何 GUI 应用时没有任何运气。

### 参考资料和进一步阅读

要了解更多关于 Homebrew 的信息，请查看以下资源：

  * Homebrew 主页：<https://brew.sh>
  * Homebrew 文档：<https://docs.brew.sh>
  * 维基百科 Homebrew 页面：<https://en.wikipedia.org/wiki/Homebrew_(package_manager)>



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-homebrew-package-manager-on-fedora-linux/

作者：[Mehdi Haghgoo][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/powergame/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/03/homebrew_sized-up-816x346.png
[2]: https://formulae.brew.sh/formula/
