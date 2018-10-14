使用 Handbrake 转换视频
======

> 这个开源工具可以很简单地将老视频转换为新格式。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OpenVideo.png?itok=jec9ibU5)

最近，当我的儿子让我数字化他的高中篮球比赛的一些旧 DVD 时，我马上就想到了 [Handbrake][1]。它是一个开源软件包，可轻松将视频转换为可在 MacOS、Windows、Linux、iOS、Android 和其他平台上播放的格式所需的所有工具。

Handbrake 是开源的，并在 [GPLv2 许可证][2]下分发。它很容易在 MacOS、Windows 和 Linux 包括 [Fedora][3] 和 [Ubuntu][4] 上安装。在 Linux 中，安装后就可以从命令行使用 `$ handbrake` 或从图形用户界面中选择它。（我的情况是 GNOME 3）

![](https://opensource.com/sites/default/files/uploads/handbrake_1.png)

Handbrake 的菜单系统易于使用。单击 “Open Source” 选择要转换的视频源。对于我儿子的篮球视频，它是我的 Linux 笔记本中的 DVD 驱动器。将 DVD 插入驱动器后，软件会识别磁盘的内容。

![](https://opensource.com/sites/default/files/uploads/handbrake_2.png)

正如你在上面截图中的 “Source” 旁边看到的那样，Handbrake 将其识别为 720x480 的 DVD，宽高比为 4:3，以每秒 29.97 帧的速度录制，有一个音轨。该软件还能预览视频。

如果默认转换设置可以接受，只需按下 “Start Encoding” 按钮（一段时间后，根据处理器的速度），DVD 的内容将被转换并以默认格式 [M4V][5] 保存（可以改变）。

如果你不喜欢文件名，很容易改变它。

![](https://opensource.com/sites/default/files/uploads/handbrake_3.png)

Handbrake 有各种格式、大小和配置的输出选项。例如，它可以生成针对 YouTube、Vimeo 和其他网站以及 iPod、iPad、Apple TV、Amazon Fire TV、Roku、PlayStation 等设备优化的视频。

![](https://opensource.com/sites/default/files/uploads/handbrake_4.png)

你可以在 “Dimensions” 选项卡中更改视频输出大小。其他选项卡允许你应用过滤器、更改视频质量和编码、添加或修改音轨，包括字幕和修改章节。“Tags” 选项卡可让你识别输出视频文件中的作者、演员、导演、发布日期等。

![](https://opensource.com/sites/default/files/uploads/handbrake_5.png)

如果使用 Handbrake 为特定平台输出，可以使用包含的预设。

![](https://opensource.com/sites/default/files/uploads/handbrake_6.png)

你还可以使用菜单选项创建自己的格式，具体取决于你需要的功能。

Handbrake 是一款非常强大的软件，但它并不是唯一的开源视频转换工具。你有其他喜欢的吗？如果有，请分享评论。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/handbrake

作者：[Don Watkins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://handbrake.fr/
[2]:https://github.com/HandBrake/HandBrake/blob/master/LICENSE
[3]:https://fedora.pkgs.org/28/rpmfusion-free-x86_64/HandBrake-1.1.0-1.fc28.x86_64.rpm.html
[4]:https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-releases
[5]:https://en.wikipedia.org/wiki/M4V
