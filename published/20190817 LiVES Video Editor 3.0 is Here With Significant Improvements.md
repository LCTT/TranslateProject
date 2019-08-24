[#]: collector: (lujun9972)
[#]: translator: (scvoet)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11266-1.html)
[#]: subject: (LiVES Video Editor 3.0 is Here With Significant Improvements)
[#]: via: (https://itsfoss.com/lives-video-editor/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

LiVES 视频编辑器 3.0 有了显著的改善
======

我们最近列出了一个[最佳开源视频编辑器][1]的清单。LiVES 是这些开源视频编辑器之一，可以免费使用。

即使许多用户还在等待 Windows 版本的发行，但在刚刚发行的 LiVES 视频编辑器 Linux 版本中（最新版本 v3.0.1）进行了一个重大更新，包括了一些新的功能和改进。

在这篇文章里，我将会列出新版本中的重要改进，并且我将会提到在 Linux 上安装的步骤。

### LiVES 视频编辑器 3.0：新的改进

![Zorin OS 中正在加载的 LiVES 视频编辑器][2]

总的来说，在这次重大更新中 LiVES 视频编辑器旨在提供更加平滑的回放、防止意外崩溃、优化视频录制，以及让在线视频下载器更加实用。

下面列出了变化：

* 如果需要渲染的话，可以静默渲染直到到视频播放完毕。
* 改进回放插件为 openGL，提供更加平滑的回放。
* 重新启用了 openGL 回放插件的高级选项。
* 在所有帧的 VJ/预解码中允许“Enough”
* 重构了在回放时的时基计算的代码（a/v 同步更好）。
* 彻底修复了外部音频和音频，提高了准确性并减少了 CPU 占用。
* 进入多音轨模式时自动切换至内部音频。
* 重新显示效果映射器窗口时，将会正常展示效果状态（on/off）。
* 解决了音频和视频线程之间的冲突。
* 现在可以对在线视频下载器，可以对剪辑大小和格式进行修改并添加了更新选项。
* 对实时效果实例实现了引用计数。
* 大量重写了主界面，清理代码并改进许多视觉效果。
* 优化了视频播放器运行时的录制功能。
* 改进了 projectM 过滤器封装，包括对 SDL2 的支持。
* 添加了一个选项来逆转多轨合成器中的 Z-order（后层现在可以覆盖上层了）。
* 增加了对 musl libc 的支持
* 更新了乌克兰语的翻译

如果你不是一位高级视频编辑师，也许会对上面列出的重要更新提不起太大的兴趣。但正是因为这些更新，才使得“LiVES 视频编辑器”成为了最好的开源视频编辑软件。

[][3]

### 在 Linux 上安装 LiVES 视频编辑器

LiVES 几乎可以在所有主要的 Linux 发行版中使用。但是，你可能并不能在软件中心找到它的最新版本。所以，如果你想通过这种方式安装，那你就不得不耐心等待了。

如果你想要手动安装，可以从它的下载页面获取 Fedora/Open SUSE 的 RPM 安装包。它也适用于其他 Linux 发行版。

- [下载 LiVES 视频编辑器][4]

如果你使用的是 Ubuntu（或其他基于 Ubuntu 的发行版），可以安装由 [Ubuntuhandbook][6] 维护的[非官方 PPA][5]。

下面由我来告诉你，你该做些什么：

1、启动终端后输入以下命令：

```
sudo add-apt-repository ppa:ubuntuhandbook1/lives
```

系统将提示你输入密码用于确认添加 PPA。

2、完成后，你现在可以轻松地更新软件包列表并安装 LiVES 视频编辑器。以下是需要你输入的命令段：

```
sudo apt update
sudo apt install life-plugins
```

3、现在，它开始下载并安装这个视频编辑器，等待大约一分钟即可完成。

### 总结

Linux 上有许多[视频编辑器][7]。但它们通常被认为不能用于专业编辑。而我并不是一名专业人士，所以像 LiVES 这样免费的视频编辑器就足以进行简单的编辑了。

你认为怎么样呢？你在 Linux 上使用 LiVES 或其他视频编辑器的体验还好吗？在下面的评论中告诉我们你的感觉吧。

--------------------------------------------------------------------------------

via: https://itsfoss.com/lives-video-editor/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[Scvoet](https://github.com/scvoet)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/open-source-video-editors/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/lives-video-editor-loading.jpg?ssl=1
[3]: https://itsfoss.com/vidcutter-video-editor-linux/
[4]: http://lives-video.com/index.php?do=downloads#binaries
[5]: https://itsfoss.com/ppa-guide/
[6]: http://ubuntuhandbook.org/index.php/2019/08/lives-video-editor-3-0-released-install-ubuntu/
[7]: https://itsfoss.com/best-video-editing-software-linux/
