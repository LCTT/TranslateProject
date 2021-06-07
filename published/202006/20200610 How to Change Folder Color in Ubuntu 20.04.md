[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12311-1.html)
[#]: subject: (How to Change Folder Color in Ubuntu 20.04)
[#]: via: (https://itsfoss.com/folder-color-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 20.04 中更改文件夹颜色
======

![](https://img.linux.net.cn/data/attachment/album/202006/13/133146y1bjzb73jj141143.jpg)

[Ubuntu 20.04][1] 中默认的 Yaru 主题赋予它优美、现代的外观。默认 Yaru 主题中的文件夹是紫色的外观，以与 Ubuntu 的品牌保持一致。

如果你不喜欢紫色，可以在 Ubuntu 中自由更改颜色主题。你可以更改 Ubuntu 的主题以使其有不同的颜色，但这将意味着放弃 Yaru 主题。

如果你只想在 Ubuntu 20.04 中更改文件夹的颜色，可以有两种方法：

* 为选定的文件夹赋予不同的颜色和标志（以便更好地组织文件和文件夹）
* 通过更改 Yaru 颜色主题来更改所有文件夹的颜色

让我向你展示两种方法。

### 更改所选文件和文件夹的颜色和标志

![][2]

我知道有些人将他们的文件夹使用不同的颜色或放在不同的位置，来表示工作正在进行中还是待处理或已完成。

如果你也是这样的，那么可以使用 [Folder Color 工具][3]更改文件夹的颜色。你还可以在文件夹中添加标志（绿色的勾号表示完成，加号表示新的，感叹号表示重要等）。你可以在上一张图片中看到一些例子。

你还可以在文件上使用 “Folder Color” 工具。你不能更改文件图标的颜色，但可以添加标志。

如果你在 Ubuntu 20.04 中[使用 Yaru 主题][4]，你可以使用[官方 PPA][5]：

```
sudo add-apt-repository ppa:costales/yaru-colors-folder-color
```

现在，使用 Yaru 兼容包安装 Folder Color。

```
sudo apt install folder-color yaru-colors-folder-color
```

安装后，你必须使用 `nautilus -q` 命令重启 Nautilus 文件管理器。之后，你可以进入文件管理器，右键单击文件夹或文件。你会在上下文菜单中看到 Folder Color 的选项。你将在此处看到颜色和标志选项。

![][6]

你还可以通过在菜单**通过选择“默认”恢复原始文件夹颜色**。

对于 Ubuntu 18.04 或更早版本，可以从软件中心安装 Folder Color。它还可用于 Linux Mint/Cinnamon 桌面的 Nemo 文件管理器和 MATE 桌面的 [Caja 文件管理器][7]。

#### 如何删除 Folder Color？

如果你不想使用 Folder Color，你可以删除应用并删除 PPA。首先删除该应用：

```
sudo apt remove folder-color yaru-colors-folder-color
```

现在[删除 PPA][8]：

```
sudo add-apt-repository -r ppa:costales/yaru-colors-folder-color
```

### Yaru Colors 主题包更改 Yaru 主题颜色

![Yaru Colors Blue Theme Variant][9]

如果你想继续使用 Yaru 主题但使用不同的颜色，那么需要[Yaru Colors 主题包][10]。

Yaru Colors 由 12 种 Yaru 颜色变体组成。它们浅绿色、蓝色、棕色、深蓝色、绿色、灰色、MATE 绿、橙色、粉红色、紫色、红色和黄色。

主题包括 GTK 主题、图标、光标和 GNOME Shell 主题。

  * 图标：更改文件夹的强调色
  * GTK 主题：更改应用窗口的强调色
  * 光标主题：向光标添加几乎可以忽略的色彩轮廓
  * GNOME Shell 主题：更改消息托盘和系统托盘中的强调色

你可以从它的 GitHub 仓库下载 Yaru Colors 主题包：

#### 下载 Yaru Colors 主题包

在提取内容时，你会发现图标、主题文件夹，这两个文件夹都包含上述十二种颜色。你可以分别在 `~/.local/share/.icons` 和 `~/.local/share/themes` 文件夹中复制图标和主题文件夹。

如果你不想亲自复制，那么你可以在解压文件夹中找到 `install.sh` 脚本。你可以运行它来通过交互式终端会话安装全部或选定的几个主题。

![][11]

要更改 GNOME Shell 主题，你必须[使用 GNOME Tweak 工具][12]。你也可以使用 GNOME Tweak 将图标和主题更改回默认。

![][13]

享受为你的 Ubuntu 生活增色 :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/folder-color-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/download-ubuntu-20-04/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/folder-colors-yaru-ubuntu.png?ssl=1
[3]: https://foldercolor.tuxfamily.org/
[4]: https://itsfoss.com/ubuntu-community-theme/
[5]: https://launchpad.net/folder-color
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/change-folder-color-ubuntu.png?ssl=1
[7]: https://github.com/mate-desktop/caja
[8]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/yaru-colors-blue-theme-variant.jpg?ssl=1
[10]: https://github.com/Jannomag/Yaru-Colors
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/yaru-colors-theme-install.png?resize=800%2C513&ssl=1
[12]: https://itsfoss.com/gnome-tweak-tool/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/restore-yaru-gnome-tweak.png?resize=800%2C557&ssl=1
