[#]: subject: "Fedora Linux Flatpak cool apps to try for September"
[#]: via: "https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-september/"
[#]: author: "Eduard Lucena https://fedoramagazine.org/author/x3mboy/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16167-1.html"

Fedora Linux Flatpak 九月推荐应用
======

![][0]

> 本文介绍了 Flathub 中可用的项目以及安装说明。

[Flathub][4] 是获取和分发适用于所有 Linux 的应用的地方。它由 Flatpak 提供支持，允许 Flathub 应用在几乎任何 Linux 发行版上运行。

请阅读 “[Flatpak 入门][5]”。为了启用 Flathub 作为你的 Flatpak 提供商，请参照 [Flatpak 站点][6] 上的说明。

### Flatseal

[Flatseal][7] 是一个图形程序，用于检查和修改 Flatpak 应用的权限。这是 Flatpak 世界中最常用的应用之一，它允许你提高 Flatpak 应用的安全性。然而，它需要谨慎使用，因为会让你的权限过于开放。

使用起来非常简单：只需启动 Flatseal，选择一个应用，然后修改其权限即可。进行更改后重新启动应用。如果出现任何问题，只需按重置按钮即可。

你可以通过单击网站上的安装按钮或手动使用以下命令来安装 Flatseal：

```
flatpak install flathub com.github.tchx84.Flatseal
```

你也可以在 Fedora 的仓库中找到它的 RPM 包。

### Reco

[Reco][8] 是一款录制应用，可帮助你回忆和收听之前听过的内容。

一些功能包括：

  * 同时录制麦克风和系统的声音。
  * 支持 ALAC、FLAC、MP3、Ogg Vorbis、Opus 和 WAV 等格式。
  * 定时录制。
  * 自动保存或始终询问保存位置的工作流程。
  * 应用退出时保存录制。

我经常用它来帮助我录制 [Fedora Podcast][9] 的采访。

你可以单击网站上的安装按钮或手动使用以下命令来安装 Reco：

```
flatpak install flathub com.github.ryonakano.reco
```

### Mini Text

[Mini Text][10] 是一个非常小且简约的文本查看器，具有最少的编辑功能。它是一个对要粘贴的文本的进行编辑地方，它没有保存功能。它使用 GTK4，其界面与 GNOME 很好地集成。

我发现这对于保留我想要粘贴到任何地方的数据非常有用，它没有不需要的和/或不需要的富文本功能，只是具有最少编辑功能的纯文本。

你可以通过单击网站上的安装按钮或使用以下命令手动安装 Mini Text：

```
flatpak install flathub io.github.nokse22.minitext
```

### Tagger

[Tagger][11] 是一个音乐标签编辑器，适合我们这些仍然在本地保存音乐的人。

其中一些功能是：

  * 一次编辑多个文件的标签和专辑封面，甚至跨子文件夹。
  * 支持多种音乐文件类型（mp3、ogg、flac、wma 和 wav）。
  * 轻松将文件名转换为标签，将标签转换为文件名。

你可以通过单击网站上的安装按钮或手动使用以下命令来安装 Tagger：

```
flatpak install flathub org.nickvision.tagger
```

*（题图：MJ/1d2d2ed0-a1c9-4cd6-954b-8ac76ddb8912）*

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-september/

作者：[Eduard Lucena][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/x3mboy/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/08/flatpak_cool_app_september-816x345.jpg
[2]: https://unsplash.com/@joannakosinska?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/photos/mjC9apK53a8?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://flathub.org
[5]: https://fedoramagazine.org/getting-started-flatpak/
[6]: https://flatpak.org/setup/Fedora
[7]: https://flathub.org/apps/com.github.tchx84.Flatseal
[8]: https://flathub.org/apps/com.github.ryonakano.reco
[9]: https://fedoraproject.org/podcast/
[10]: https://flathub.org/apps/io.github.nokse22.minitext
[11]: https://flathub.org/apps/org.nickvision.tagger
[0]: https://img.linux.net.cn/data/attachment/album/202309/07/105242i7jei9xj1zrqqfek.jpg