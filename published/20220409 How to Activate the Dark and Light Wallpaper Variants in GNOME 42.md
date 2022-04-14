[#]: subject: "How to Activate the Dark and Light Wallpaper Variants in GNOME 42"
[#]: via: "https://itsfoss.com/dark-light-wallpaper-gnome/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14472-1.html"

如何启用 GNOME 42 中的深色和浅色双主题壁纸
======

GNOME 42 的主要 [功能][1] 之一就是提供了深色和浅色模式的双主题壁纸。

![GNOME 42 中的深色和浅色壁纸][2]

基本上，有了这个功能，当你切换到浅色模式时，系统就会使用浅色版本的壁纸。而当你 [在 GNOME 中切换到深色模式][3]时，壁纸就会切换成深色的版本。

下面是一个双主题壁纸的例子，你可以比较一下：

![GNOME 中的深色和浅色双主题壁纸：浅色][4]

![GNOME 中的深色和浅色双主题壁纸：深色][4a]

这种双主题壁纸可在“<ruby>设置<rt>Settings</rt></ruby> > <ruby>外观<rt>Appearance</rt></ruby>”的“<ruby>背景<rt>Background</rt></ruby>”部分中启用。

然而，在某些情况下，设置中可能没有双主题壁纸，你可能会看到一个空的“背景”部分，像下面这样：

![没有双主题壁纸][5]

这是我的同事 Sreenath 在更新他的 Endeavour OS 系统、得到新的 GNOME 42 桌面时注意到的情况。

### 在 GNOME 42 中启用深色和浅色双主题壁纸

如果你也在 GNOME 42 中面临同样的情况，我这里有一个快速而简单的解决方案。你只需要使用软件包管理器，安装 `gnome-backgrounds` 软件包，问题就会得到解决。

首先，请 [检查桌面环境细节][6]，确保你正在运行 GNOME 42。你可以在系统设置的“<ruby>关于<rt>About</rt></ruby>”部分查看你的桌面版本。

当你确定你的系统安装了 GNOME 42，请继续执行剩下的步骤。

对于 [基于 Arch 的发行版][7]，请使用 [pacman 命令][8]，如下：

```
sudo pacman -S gnome-backgrounds
```

等待命令执行完毕。

![][9]

你不需要重新启动，甚至不需要注销。改动将立即生效。

你只需进入“<ruby>设置<rt>Settings</rt></ruby> > <ruby>外观<rt>Appearance</rt></ruby>”，然后选择“<ruby>背景<rt>Background</rt></ruby>”部分，应该就会看到各种具有双重模式的壁纸。

选择其中的一对，它就会根据你的系统主题来设置图像。

![GNOME 中的深色和浅色壁纸][10]

太好了。但你只能得到 GNOME 团队或者发行版的开发者提供的少数双主题壁纸。如果你想拥有一套自己的深色和浅色模式的壁纸呢？那么，你可以自己制作壁纸，只是需要一点调整和耐心。

### 制作你自己的双主题壁纸（针对高级用户）

我假设你知道自己在干什么，你可以搜索下面的步骤，以在深色和浅色双主题壁纸中添加额外的壁纸时：

  * 下载两张图片
  * 把浅色壁纸重命名为 `image-l.jpg`，把深色壁纸重命名为 `image-d.jpg`
  * 如果你想让新壁纸对所有用户可用，请在 `/usr/share` 目录下新建一个 `gnome-background-properties` 目录。否则，如果你只想自己使用，请在 `.local/share` 中新建这个目录
  * 将这段 [GNOME 官方 GitLab 仓库中的代码][11] 拷贝到文本编辑器中，并在 `<filename>` 标签中分别修改相应的浅色或深色图片的位置
  * 将其保存在你之前创建的 `gnome-background-properties` 目录下
  * 现在可以在系统设置里修改背景壁纸了

需要更多帮助吗？WOGUE 有一个很好的视频，里面展示了这些步骤的操作。

![video](https://youtu.be/y1vSt1_ZKps)

我希望你喜欢这个快速小技巧。祝你体验愉快！

--------------------------------------------------------------------------------

via: https://itsfoss.com/dark-light-wallpaper-gnome/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/gnome-42-features/
[2]: https://itsfoss.com/wp-content/uploads/2022/04/fedora-36-gnome-42-dark-800x450.jpg
[3]: https://itsfoss.com/fedora-dark-mode/
[4]: https://itsfoss.com/wp-content/uploads/2022/04/GNOME_Light_Desktop.jpg
[4a]: https://itsfoss.com/wp-content/uploads/2022/04/GNOME_Dark_Desktop.jpg
[5]: https://itsfoss.com/wp-content/uploads/2022/04/no-dark-light-wallpaper-in-gnome-800x326.png
[6]: https://itsfoss.com/find-desktop-environment/
[7]: https://itsfoss.com/arch-based-linux-distros/
[8]: https://itsfoss.com/pacman-command/
[9]: https://itsfoss.com/wp-content/uploads/2022/04/add-dark-light-wallpapers-gnome-800x366.png
[10]: https://itsfoss.com/wp-content/uploads/2022/04/dark-light-wallpapers-gnome-800x370.jpg
[11]: https://gitlab.gnome.org/GNOME/gnome-backgrounds/-/blob/main/backgrounds/adwaita.xml.in
