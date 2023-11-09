[#]: subject: "Install Brave on Arch Linux"
[#]: via: "https://itsfoss.com/install-brave-arch-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16291-1.html"

在 Arch Linux 上安装 Brave
======

![][0]

> 在这篇初学者教程中，学习在 Arch Linux 中安装 Brave 浏览器。

Firefox 和 Brave 是我日常浏览网页的程序。

当我安装带有 GNOME 的 Arch Linux 时，它有 GNOME Web 浏览器。这是一个不错的浏览器，但我不能接受它，因为我需要保存的密码、浏览历史记录和插件。

因此，我开始安装我最喜欢的网络浏览器，因此本教程是关于在 Arch Linux 中安装 Brave。

如果你安装了 Yay（或任何其他 AUR 帮助程序），那么安装 Brave 就像使用以下命令一样简单：

```
yay -S brave-bin
```

是的！就这么简单。让我们详细看看。

> 💡 Manjaro 内置了 AUR 支持。你可以使用 Pamac 软件中心或 `pamac`/`pacman` 命令在 Manjaro 中安装 Brave。

### 在 Arch Linux 上安装 Brave 浏览器

Brave 在官方 Arch 仓库中不可用。但是，它可以在 AUR（Arch 用户仓库）中使用，并且可以使用 Yay 等 AUR 帮助程序轻松安装。

如果你没有 Yay 或任何其他 AUR 帮助程序，请逐一使用这些命令来 [安装 Yay][1]：

```
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

安装 Yay 后，用它来安装 Brave：

```
yay -S brave-bin
```

不用担心。它最终会要求你输入密码。

如果这是你第一次安装浏览器，系统可能会要求你选择字体提供方。使用默认选择或选择任何其他选项。

![][2]

接下来，它会询问你有关清理构建的问题。Yay 询问你是否应该重新下载软件包（和依赖项）并再次构建它或使用早期构建的缓存（如果有）。

你可以按回车键继续操作，这应该意味着不清理构建。

![][3]

事实上，当你看到默认选项时，你可以继续按回车键。

在实际安装之前，系统会要求你输入帐户密码。输入你的密码并继续该过程。它将下载大小约为 350 MB 的文件：

![][4]

安装后，在系统菜单中查找 [Brave browser][5] 并从那里运行它。

![][6]

### 保持 Brave 更新

你可以使用以下命令更新通过 Yay 安装的 AUR 软件包来保持 Brave 浏览器更新：

```
yay -Sua
```

### 从 Arch 中删除 Brave

不喜欢 Brave？ 不用担心。你可以轻松将其删除。

与任何其他软件一样，使用 `pacman` 命令从 Arch 中删除 Brave：

```
sudo pacman -Rs brave-bin
```

### 总结

AUR 再次拯救你！ 安装 Brave 变得非常简单。

顺便说一句，我注意到 Brave 不知何故成为打开图像的默认应用。这意味着，双击图像将在新的 Brave 窗口中打开它们。

我必须通过右键单击图像并选择“打开方式”选项再次将图像查看器设置为默认值。

![Somehow Brave becomes the default image viewer. You should change it][7]

在接下来的几天里，我将分享更多我的 Arch 经验。敬请关注！

*（题图：MJ/46bf8413-5fe1-41aa-b6f3-a5e660efce2b）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-brave-arch-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-yay-arch-linux/
[2]: https://itsfoss.com/content/images/2023/10/yay-install-brave-font-install.png
[3]: https://itsfoss.com/content/images/2023/10/clean-build-yay.png
[4]: https://itsfoss.com/content/images/2023/10/installing-brave-arch-linux.png
[5]: https://brave.com/
[6]: https://itsfoss.com/content/images/2023/10/run-brave-arch-linux.png
[7]: https://itsfoss.com/content/images/2023/10/open-images-in-viewer-not-brave.png
[0]: https://img.linux.net.cn/data/attachment/album/202310/17/103648le2r0e688pef1v22.jpg