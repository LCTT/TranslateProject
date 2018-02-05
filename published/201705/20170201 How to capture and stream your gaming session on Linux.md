如何在 Linux 中捕获并流式传输你的游戏过程
============================================================

也许没有那么多铁杆的游戏玩家使用 Linux，但肯定有很多 Linux 用户喜欢玩游戏。如果你是其中之一，并希望向世界展示 Linux 游戏不再是一个笑话，那么你会喜欢下面这个关于如何捕捉并且/或者以流式播放游戏的快速教程。我在这将用一个名为 “[Open Broadcaster Software Studio][5]” 的软件，这可能是我们所能找到最好的一种。

### 捕获设置

在顶层菜单中，我们选择 “File” → “Settings”，然后我们选择 “Output” 来设置要生成的文件的选项。这里我们可以设置想要的音频和视频的比特率、新创建的文件的目标路径和文件格式。这上面还提供了粗略的质量设置。

[
 ![Select output set in OBS Studio](https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/pic_1.png) 
][6]

如果我们将顶部的输出模式从 “Simple” 更改为 “Advanced”，我们就能够设置 CPU 负载，以控制 OBS 对系统的影响。根据所选的质量、CPU 能力和捕获的游戏，可以设置一个不会导致丢帧的 CPU 负载设置。你可能需要做一些试验才能找到最佳设置，但如果将质量设置为低，则不用太多设置。

[
 ![Change OBS output mode](https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/pic_2.png) 
][7]

接下来，我们转到设置的 “Video” 部分，我们可以设置我们想要的输出视频分辨率。注意缩小过滤（downscaling filtering ）方式，因为它使最终的质量有所不同。

[
 ![Down scaling filter](https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/pic_3.png) 
][8]

你可能还需要绑定热键以启动、暂停和停止录制。这特别有用，这样你就可以在录制时看到游戏的屏幕。为此，请在设置中选择 “Hotkeys” 部分，并在相应的框中分配所需的按键。当然，你不必每个框都填写，你只需要填写所需的。

[
 ![Configure Hotkeys in OBS](https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/pic_4.png) 
][9]

如果你对流式传输感兴趣，而不仅仅是录制，请选择 “Stream” 分类的设置，然后你可以选择支持的 30 种流媒体服务，包括 Twitch、Facebook Live 和 Youtube，然后选择服务器并输入 流密钥。

[
 ![Streaming settings](https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/pic_5.png) 
][10]

### 设置源

在左下方，你会发现一个名为 “Sources” 的框。我们按下加号来添加一个新的源，它本质上就是我们录制的媒体源。在这你可以设置音频和视频源，但是图像甚至文本也是可以的。

[
 ![OBS Media Source](https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/pic_6.png) 
][11]

前三个是关于音频源，接下来的两个是图像，JACK 选项用于从乐器捕获的实时音频， Media Source 用于添加文件等。这里我们感兴趣的是 “Screen Capture (XSHM)”、“Video Capture Device (V4L2)” 和 “Window Capture (Xcomposite)” 选项。

屏幕捕获选项让你选择要捕获的屏幕（包括活动屏幕），以便记录所有内容。如工作区更改、窗口最小化等。对于标准批量录制来说，这是一个适合的选项，它可在发布之前进行编辑。

我们来探讨另外两个。Window Capture 将让我们选择一个活动窗口并将其放入捕获监视器。为了将我们的脸放在一个角落，视频捕获设备用于人们可以在我们说话时可以看到我们。当然，每个添加的源都提供了一组选项来供我们实现我们最后要的效果。

[
 ![OBS Window Capture](https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/pic_7.png) 
][12]

添加的来源是可以调整大小的，也可以沿着录制帧的平面移动，因此你可以添加多个来源，并根据需要进行排列，最后通过右键单击执行基本的编辑任务。

[
 ![Add Multiple sources](https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/pic_8.png) 
][13]

### 过渡

最后，如果你正在流式传输游戏会话时希望能够在游戏视图和自己（或任何其他来源）之间切换。为此，请从右下角切换为“Studio Mode”，并添加一个分配给另一个源的场景。你还可以通过取消选中 “Duplicate scene” 并检查 “Transitions” 旁边的齿轮图标上的 “Duplicate sources” 来切换。 当你想在简短评论中显示你的脸部时，这很有帮助。

[
 ![Studio mode](https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/pic_9.png) 
][14]

这个软件有许多过渡效果，你可以按中心的 “Quick Transitions” 旁边的加号图标添加更多。当你添加它们时，还将会提示你进行设置。

### 总结

OBS Studio 是一个功能强大的免费软件，它工作稳定，使用起来相当简单直接，并且拥有越来越多的扩展其功能的[附加插件][15]。如果你需要在 Linux 上记录并且/或者流式传输游戏会话，除了使用 OBS 之外，我无法想到其他更好的解决方案。你有其他类似工具的经验么？ 请在评论中分享也欢迎包含一个展示你技能的视频链接。:)

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-capture-and-stream-your-gaming-session-on-linux/

作者：[Bill Toulas][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-capture-and-stream-your-gaming-session-on-linux/
[1]:https://www.howtoforge.com/tutorial/how-to-capture-and-stream-your-gaming-session-on-linux/#capture-settings
[2]:https://www.howtoforge.com/tutorial/how-to-capture-and-stream-your-gaming-session-on-linux/#setting-up-the-sources
[3]:https://www.howtoforge.com/tutorial/how-to-capture-and-stream-your-gaming-session-on-linux/#transitioning
[4]:https://www.howtoforge.com/tutorial/how-to-capture-and-stream-your-gaming-session-on-linux/#conclusion
[5]:https://obsproject.com/download
[6]:https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/big/pic_1.png
[7]:https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/big/pic_2.png
[8]:https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/big/pic_3.png
[9]:https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/big/pic_4.png
[10]:https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/big/pic_5.png
[11]:https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/big/pic_6.png
[12]:https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/big/pic_7.png
[13]:https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/big/pic_8.png
[14]:https://www.howtoforge.com/images/how-to-capture-and-stream-your-gaming-session-on-linux/big/pic_9.png
[15]:https://obsproject.com/forum/resources/categories/obs-studio-plugins.6/
