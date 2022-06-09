[#]: subject: "Amberol is a Stunning Looking Music Player for Linux That Just Plays Music and Nothing Else"
[#]: via: "https://itsfoss.com/amberol-music-player/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Amberol 是一款外观漂亮的 Linux 音乐播放器，只播放音乐，不做其他事情
======
虽然音乐世界被流媒体服务所主导，但这并没有阻止开发者为桌面电脑创建音乐播放器。

最近，我发现了一个外观漂亮的新的 Linux 桌面音乐播放器。它名为 Amberol，我被它的美丽所震撼了。

![amberol music player interface][1]

看起来不错，不是吗？让我们仔细看看它。

### Amberol，Linux 上的可爱的音乐播放器

看起来不错是它所做的两件（或几件）事情中的一件。另一件事是播放音乐。

这就是它。[Amberol][2] 没有额外的花哨（和有用）的功能，如生成专辑封面、元数据编辑、歌词显示或播放列表和库管理。

这些功能也不像会在未来的版本中加入。Amberol 只想播放音乐。就是这样。

#### 令人惊叹的用户界面

Amberol 和大多数新的 GNOME 应用一样，是用 Rust 和 GTK 编写的。

它有一个自适应的用户界面，可以根据你正在播放的专辑颜色来改变颜色。渐变效果给了它一个现代、时尚的外观，肯定会成为你的 Linux rice 截图的一部分。

![amberol music player][3]

由于 UI 没有传统的手柄和菜单，它给应用一个统一的外观。

#### 播放列表

它从你添加的文件夹中存在的文件自动生成一个播放列表。它显示在左手边的侧边栏。

![amberol playlist][4]

你可以在左上角看到整个播放列表将播放多长时间的音乐。点击“勾选符号”，你可以选择歌曲，并从播放列表中删除它们。

如果你愿意，你可以隐藏播放列表的侧边栏。

![amberol without playlist][5]

#### 音乐播放选项

你可以在界面上看到歌曲的进度。该播放器与键盘上的媒体控制按钮整合得很好。你可以用专用的媒体键播放/暂停和改变曲目（如果你的系统上有）。

Amberol 为你提供了一些播放音乐的选项。你可以打开随机播放功能，按随机顺序播放音乐。你也可以把一首歌放在重复的位置，一直播放，直到你厌倦它。

![amberol music playing options][6]

底部的手柄菜单让你可以选择添加文件或文件夹，并显示可用的键盘快捷方式。

![amberol keyboard shortcuts][7]

你也可以从这里禁用 UI 颜色变化以配合专辑封面。

### 在 Linux 上安装 Amberol

Amberol 是[以 Flatpak 形式提供][8]。请确保[你的系统已启用 Flatpak 支持][9]。

要安装 Amberol，请打开终端并使用以下命令：

```
flatpak install flathub io.bassi.Amberol
```

安装完毕后，在菜单中搜索该应用，并点击启动。

第一次运行时，它会要求你添加音乐文件或文件夹。你也可以拖放文件。

![amberol first run][10]

### 总结

就个人而言，我更喜欢流媒体服务，因为我没有一个很好的本地音乐收藏。但我知道有的人有/有大量的 CD 收藏，现在都保存在硬盘上。

Amberol 是一个外观漂亮的应用，对于播放本地音乐来说，它足够好。最吸引人的是基于专辑封面的自适应用户界面。

我请你试试它，并在评论区分享你的经验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/amberol-music-player/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/06/amberol-music-player-interface-800x693.png
[2]: https://apps.gnome.org/app/io.bassi.Amberol/
[3]: https://itsfoss.com/wp-content/uploads/2022/06/amberol-music-player-800x580.png
[4]: https://itsfoss.com/wp-content/uploads/2022/06/Amberol-playlist-800x548.png
[5]: https://itsfoss.com/wp-content/uploads/2022/06/amberol-without-playlist-800x693.png
[6]: https://itsfoss.com/wp-content/uploads/2022/06/Amberol-music-playing-options-800x548.png
[7]: https://itsfoss.com/wp-content/uploads/2022/06/Amberol-keyboard-shortcuts-800x528.png
[8]: https://flathub.org/apps/details/io.bassi.Amberol
[9]: https://itsfoss.com/flatpak-guide/
[10]: https://itsfoss.com/wp-content/uploads/2022/06/amberol-first-run-800x693.png
