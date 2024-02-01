[#]: subject: "How to Use Subtitles with VLC"
[#]: via: "https://itsfoss.com/vlc-use-subtitles/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16594-1.html"

如何通过 VLC 使用字幕
======

![][0]

> 使用 VLC 媒体播放器播放和管理字幕的新手指南。

我是一个超级动漫迷，如果你想观看最新的剧集，那么你只能观看日语音频，因此字幕对于非日语观众来说是必不可少的。

值得庆幸的是，我最喜欢的视频播放器 VLC 很好地支持字幕。难怪它是有史以来 [最好的视频播放器][1] 之一。

VLC 实际上可以做的不仅仅是播放提供的字幕。

在本指南中，我将引导你完成以下内容：

   * 如何使用可用的字幕（如果有的话）
   * 如何使用下载的字幕
   * 如何自动下载字幕（使用 vlsub 扩展）
   * 如何将字幕与视频同步
   * VLC 支持哪些字幕格式

那么让我们从第一个开始。

### 如何在 VLC 中启用字幕

有些视频附带字幕文件。如果字幕与视频文件位于同一文件夹中，你可以轻松启用字幕。

虽然启用字幕的方法有多种，但我将向你展示两种有效的方法。

#### 按 V 键（最简单的方法）

如果当前播放的视频有一个或多个字幕，那么你可以按 `V` 键，它将在可用选项之间更改字幕。

正如你所看到的，当我按下 `V` 时，它会在多个字幕之间漫游，甚至可以选择完全禁用字幕。

#### 使用顶部菜单栏或右键单击上下文菜单

虽然按 `V` 键是启用字幕的最简单方法，但如果你有多个字幕文件（可能有多种语言）并且必须选择其中之一，那么按 `V` 键的效果就不是最好了。

假设你要查找的字幕位于最后一个位置，那么你必须按 `V` 键几次，如果你错过了，请再次重复该过程。

因此，在这种情况下，从顶部菜单中选择字幕轨道是一种简单方便的方法。

要使用此方法，你必须遵循两个简单的步骤：

   * 单击顶部菜单栏中的 “<ruby>字幕<rt>Subtitle</rt></ruby>” 菜单
   * 选择 “<ruby>子轨道<rt>Sub Track</rt></ruby>”，然后选择所需的字幕轨道

![][2]

你还可以通过右键单击正在播放的视频，并选择字幕选项来完成此操作。

### 如何在 VLC 中使用下载的字幕

如果你从网上下载了字幕，但不知道如何在 VLC 中使用它们，那么本节将解决该问题。

要使用下载的字幕，你必须将其导入 VLC。并且可以通过遵循给定的简单步骤轻松完成：

   * 首先，单击顶部菜单栏中的 “字幕”
   * 选择第一个 “<ruby>添加字幕文件<rt>Add Subtitle File</rt></ruby>” 选项，它将打开文件管理器
   * 从这里找到字幕文件所在的位置并选择它

![][3]

完成后，可以通过顶部菜单栏中的`字幕`菜单访问添加的字幕：

![][4]

> 💡 如果你要保存视频以供将来使用，我建议将字幕文件复制到与视频文件本身相同的文件夹中。更好的方法是将文件重命名为与视频文件相同的名称。因此，如果视频文件是 `my-xyz.mp4`，则字幕文件应该是 `my-xyz.srt`。这样，字幕要么自动播放，要么在你按 `v` 键时被识别。

### 如何在 VLC 中自动下载字幕（适用于 Linux 用户）

你是否知道 VLC 有一个名为 VLsub 的插件，可用于从网络下载字幕并直接在 VLC 中访问它们？

如果你是 Linux 用户，请按照给定的说明将其添加到 VLC 中。

首先，[使用 wget 命令][5] 下载 zip 文件：

```
wget https://github.com/exebetche/vlsub/archive/master.zip
```

接下来，如下所示 [使用 unzip 命令解压文件][6]：

```
unzip master.zip
```

之后，你需要 [创建一个新目录][7]：

```
mkdir -p ~/.local/share/vlc/lua/extensions
```

最后，使用 [mv 命令][8] 将文件移动到创建的目录，如下所示：

```
mv ~/vlsub-master/vlsub.lua ~/.local/share/vlc/lua/extensions
```

现在，打开VLC播放器，在 “<ruby>视图<rt>View</rt></ruby>” 菜单下，你将找到 “VLsub”：

![][9]

要使用 VLsub 下载字幕，首先，输入电影名称和年份以获得更好的结果，然后点击“<ruby>按名称搜索<rt>Search by name</rt></ruby>”按钮，从结果中选择字幕文件，然后单击“<ruby>下载选择<rt>Download selection</rt></ruby>”按钮，如图所示 :

![][10]

就是这样！

要了解有关如何使用 VLsub 扩展的更多信息，请参阅我们有关该主题的 [详细指南][11]。

### 如何在 VLC 中将字幕与电影同步

有时，下载的字幕可能会比电影中发生的事情稍微落后或提前，这可能会令人沮丧！

不用担心！ VLC也有解决这个问题的方法！

在 VLC 中，你可以通过按 `G` 和 `H` 键前进或后退字幕。

   * `G` 键将使字幕快进 50 毫秒
   * `H` 键将使字幕后退 50 毫秒

虽然 50 毫秒听起来太短，但你会在 2-3 次按键内注意到显着差异。

**如果你在实际场景中跑得太超前或落后，也可以按住它们。**

还感到困惑吗？ 你可以参考我们的 [如何在 VLC 中同步字幕的详细指南][13]。

### VLC 支持哪些字幕格式？

如果你想从互联网上下载字幕，那么你必须了解 VLC 支持的字幕格式。

以下是 VLC 支持的字幕格式列表：

  * *.idx（VOBSub）
  * *.cvd（Chaoji VCD）
  * *.usf（通用字幕）
  * *.ttxt（MPEG-4 定时文本）
  * *.srt（SubRip）
  * *.ssa（Sub Station Alpha）
  * *.smi（SAMI）
  * *.aqt（AQTitle）
  * *.txt（ML2/VPlayer）
  * *.rt（RealText/Smil）
  * *.psb（PowerDivX）
  * *.pjs（Phoenix Subtitle）
  * *.dks（DKS）
  * *.mpl（ML2）
  * *.jss（JACOSub）
  * *.svcd（Super Video CD）
  * *.txt（ML2/VPlayer）

但最流行的微妙类型是 `*.srt`，并且通常在你下载视频文件时默认提供。

### VLC 的功能远不止播放视频

你知道可以使用 VLC 下载 YouTube 视频吗？ 嗯，它可以做的远不止这些。

为此，我们制作了关于 [你可以使用 VLC 播放器做的很酷的事情][14] 的详细指南。

以下是如何充分利用 VLC 的方法：

> **[让 VLC 播放器在 Linux 中发挥更大作用的 5 个技巧][15]**

我希望本指南对你有所帮助。

*（题图：DA/39a917f2-a1b3-4167-8393-1af0859105b0）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/vlc-use-subtitles/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/video-players-linux/
[2]: https://itsfoss.com/content/images/2023/08/Enable-subtitles-from-menu-bar-in-VLC.png
[3]: https://itsfoss.com/content/images/2023/08/Use-subtitles-downloaded-from-web-in-VLC.png
[4]: https://itsfoss.com/content/images/2023/08/Add-subtitles-in-VLC.png
[5]: https://learnubuntu.com/install-wget/?ref=itsfoss.com
[6]: https://learnubuntu.com/unzip-file/?ref=itsfoss.com
[7]: https://linuxhandbook.com/mkdir-command/?ref=itsfoss.com
[8]: https://linuxhandbook.com/mv-command/?ref=itsfoss.com
[9]: https://itsfoss.com/content/images/2023/08/use-VLsub-extension-in-VLC-to-download-subtitles-easily.png
[10]: https://itsfoss.com/content/images/2023/08/How-to-download-subtitles-in-VLC-using-VLsub-extension.png
[11]: https://itsfoss.com/download-subtitles-automatically-vlc-media-player-ubuntu/
[12]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[13]: https://itsfoss.com/how-to-synchronize-subtitles-with-movie-quick-tip/
[14]: https://itsfoss.com/simple-vlc-tips/
[15]: https://itsfoss.com/vlc-pro-tricks-linux/
[0]: https://img.linux.net.cn/data/attachment/album/202401/29/181554ruyylfyiusdq9yla.jpg