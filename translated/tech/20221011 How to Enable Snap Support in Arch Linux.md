[#]: subject: "How to Enable Snap Support in Arch Linux"
[#]: via: "https://itsfoss.com/install-snap-arch-linux/"
[#]: author: "Pranav Krishna https://itsfoss.com/author/pranav/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Arch Linux 中启用 Snap 支持
======
Snap 是由 Ubuntu 的母公司 Canonical 设计的通用包格式。有些人不喜欢 Snap，但它有一些优势。

通常，某些应用仅以 Snap 格式提供。这为你提供了在 Arch Linux 中启用 snap 的充分理由。

我知道 AUR 拥有大量应用，但 snap 应用通常直接来自开发人员。

如果你希望能够在 Arch Linux 中安装 Snap 应用，你需要先启用 snap 支持。

有两种方法可以做到：

* 使用 AUR 助手启用 Snap 支持（更简单）
* 通过从 AUR 获取包手动启用 Snap 支持

让我们看看怎么做。

### 方法 1. 使用 AUR 助手启用 Snap

Snap 在 Arch 用户仓库中以 *snapd* 包的形式提供。你可以使用 AUR 助手轻松安装它。

存在[许多 AUR 助手][1]，但 *yay* 是我更喜欢的，因为它的语法类似于 [pacman 命令][2]。

如果你还没有安装 AUR，请使用以下命令安装 Yay（需要事先 git）：

```
git clone https://aur.archlinux.org/yay

cd yay

makepkg -si
```

![安装 yay][3]

现在 *yay* 已安装，你可以通过以下方式安装 snapd：

```
yay -Sy snapd
```

![使用 yay 从 AUR 安装 snapd][4]

每当你[更新 Arch Linux][5] 系统时，Yay 都会启用 snapd 的自动更新。

### 验证 snap 是否有效

要测试 snap 是否正常工作，请安装并运行 *hello-world* snap 包。

```
sudo snap install hello-world

hello-world
（或者）
sudo snap run hello-world
```

![hello-world snap 包执行][6]

如果它运行良好，那么你可以轻松安装其他 snap 包。

### 方法 2. 从 AUR 手动构建 snap 包

如果你不想使用 AUR 助手，你仍然可以从 AUR 获取 snap。让我展示详细的过程。

你需要先安装一些构建工具。

```
sudo pacman -Sy git go go-tools python-docutils
```

![为 snap 安装依赖项][7]

完成依赖项安装后，现在可以克隆 AUR 目录，如下所示：

```
git clone https://aur.archlinux.org/snapd

cd snapd
```

![克隆仓库][8]

然后构建 snapd 包：

```
makepkg -si
```

当它要求安装其他依赖包时输入 yes。

![手动构建 snapd][9]

你已安装 snapd 守护程序。但是，需要启用它以在启动时自动启动。

```
sudo systemctl enable snapd --now

sudo systemctl enable snapd.apparmor --now #start snap applications

sudo ln -s /var/lib/snapd/snap /snap #optional: classic snap support
```

![启动时启用 snap][10]

手动构建包的主要缺点是每次新更新启动时你都必须手动构建。使用 AUR 助手为我们解决了这个问题。

### 总结

我更喜欢 Arch Linux 中的 pacman 和 AUR。很少能看到不在 AUR 中但以其他格式提供的应用。尽管如此，在某些你希望直接从源获取它的情况下，使用 snap 可能是有利的，例如 [在 Arch 上安装 Spotify][11]。

希望本教程对您有所帮助。如果你有任何问题，请告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-snap-arch-linux/

作者：[Pranav Krishna][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pranav/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/best-aur-helpers/
[2]: https://itsfoss.com/pacman-command/
[3]: https://itsfoss.com/wp-content/uploads/2022/10/yay-makepkg.png
[4]: https://itsfoss.com/wp-content/uploads/2022/10/yay-install-snapd.png
[5]: https://itsfoss.com/update-arch-linux/
[6]: https://itsfoss.com/wp-content/uploads/2022/10/snap-hello-world-1.png
[7]: https://itsfoss.com/wp-content/uploads/2022/10/snapd-manual-install-dependencies.png
[8]: https://itsfoss.com/wp-content/uploads/2022/10/snapd-manual-install-clone.png
[9]: https://itsfoss.com/wp-content/uploads/2022/10/snapd-manual-install-makepkg-800x460.png
[10]: https://itsfoss.com/wp-content/uploads/2022/10/enable-snapd-startup-2.png
[11]: https://itsfoss.com/install-spotify-arch/
