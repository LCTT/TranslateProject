如何在Linux上制作一个屏幕录像视频教程
================================================================================
一图胜千言，一个精心设计的指导视频更是能给你带来良好体验。Linux上有你需要的制作有用且高质量教学视频的所有工具。我们将用强大的kdenlive视频编辑器和Audacity音频录制器和编辑器制作一个简单的屏幕录像，并学习如何在YouTube上分享精彩的屏幕录像。

一台安装了Kdenlive和Audacit软件的Linux系统PC，一个质量好的麦克风或耳机，和一个YouTube的帐号就是你需要准备的全部。（是的，除了Youtube还有很多其他的免费视频共享服务，你也可以使用它们。）YouTube属于Google，Google想让你与全世界共享任何人和事。如果这不是你想做的，请说no。

我们的工作流程是这样的：

- 用Kdenlive录制屏幕录像
- 用Audacity录制音轨
- 添加音轨到Kdenlive
- 上传到YouTube
- 全世界看你的视频，好开心

kdenlive支持最流行的数字视频格式，包括AVI，MP4，H.264，和MOV。它支持的图像文件包括GIF，PNG，SVG和TIFF；支持的音频文件格式，包括非压缩的PCM，Vorbis，WAV，MP3和 AC3。你甚至可以阅读和编辑Flash文件。总之，它可以处理很多东西。

你的配音与你的视频一样重要。请一定要重视你的音频。使音频保持干净和简单，去除杂乱的题外话、方言，并将背景噪声降到最低点。我喜欢用一个质量好的耳麦做讲述，这样你不必担心话筒位置，你可以反复听你自己的讲述而不会影响到你身边的人。

Kdenlive的文档已过期，它会告诉你制作屏幕录像需要RecordMyDesktop软件。我用的是kdenlive 0.9.4，其实不需要Recordmydesktop。

![](http://www.linux.com/images/stories/41373/fig-1-settings.png)

*图 1：默认配置* 

### 制作屏幕录像 ###

首次安装kdenlive,第一次运行时会启动配置向导。不必在意默认设置，因为你随时都可以改变它们。

这是我的屏幕录像的设置：高清720p每秒30帧，1280x720的屏幕尺寸。如何知道该使用什么设置项？ [Google上有一些说明][1]。设置这些值可到Settings > Configure Kdenlive > Project Defaults > Default Profile > HD 720p 30fps（图1）。

设置捕捉屏幕的大小到 Settings > Configure Kdenlive > Capture > Screen Grab（图2）。虽然你也可以选择捕捉全屏幕，但最好还是坚持用YouTube规定的尺寸。因为如果使用的尺寸与YouTube规定的不一样，则YouTube将增加黑边来达到合适的尺寸。热切的观众会更加希望看到一个充满生动的内容的屏幕，而不是黑边。

![](http://www.linux.com/images/stories/41373/fig-2-settings.png)

*图 2：屏幕录像的屏幕大小*

默认的YouTube视频播放器的大小是640x360标清320p，又小又模糊。播放器有小屏，大屏，全屏，和多个质量等级的控制。这些设置只有你的观众会使用，640x360标清320p看起来真的不咋样，但郁闷的是你无法改变这个缺陷。尽管如此，你仍然想制作高质量视频的话，你可以添加一些文字来提醒观众尝试更好的配置。

### 保存你的项目 ###

在你做任何其他事情之前，点击 File->Save as 保存您的项目，并记住周期性地保存它。

### 抓取屏幕 ###

抓屏小菜一碟。到Record Monitor，选择Screen Grab，然后点击Record按钮。屏幕上将打开一个带虚线的框，框里面的所有内容都将被录制下来。因此，你需要做的所有事就是移动框并调整框的大小到你想要l录制的范围。完成后点击停止按钮（图3）。


![](http://www.linux.com/images/stories/41373/fig-3-screen-grab.png)

*图 3：屏幕抓取*

单击Stop，自动打开Clip Monitor，你可以预览你的裁剪效果。如果你觉得不错，把它从Project Tree中拖到Video 1轨道。现在你可以编辑你的视频了。总会有需要你修剪的地方；一个快速的方法是，你在Project Monitor里播放你的剪辑片，直到播放到你需要移除部分的末尾。然后暂停，然后按下Shift+r。你的剪辑片将会在你按下停止的时间轴上的点上被切割为两个剪辑。点击你要删除的片断，按下Delete键，噗！它就消失了。

对于剩下的剪辑片断，可能你想要从时间轴上的某一点开始播放，也可能你想要加入一些好的变换。比如一些简单的渐变就相当不错；右键点击你的剪辑片断，点击Add Effect > Fade > Fade from black 和 Fade to black，然后Kdenlive将自动将这两个效果放到开头和末尾。

### 添加配音 ###

请参阅[Whirlwind Intro to Audacity on Linux: From Recording to CD in One Lesson][2]来学习使用Audacity录音的基础操作。以16bit的wav格式导出你的音频文件，然后通过Project > Add Clip导入到Kdenlive。然后将你的新音频剪辑拖到Audio tracks。一个简单的制作视频讲述的方式是边播视频边说。运气好的话，你不需要做很多的清理工作，你的讲述就会与视频同步。

![](http://www.linux.com/images/stories/41373/fig-4-audio-gap.png)

*图 4：用Shift+r切割音轨，然后将其中一个剪辑片从切割点拖离，创建一个静音间隙* 

如果你的语速比视频快,你可以在音轨中添加空档时间.很简单,用Shift+r切割音轨，然后将其中一个剪辑片从切割点拖离，创建一个静音间隙。（图4）。

### Rendering Your Project ### 渲染你的项目

当你满意自己的编辑，并准备导出你的最终格式时，点击Render按钮。这需要几分钟的时间，取决于你的电脑速度和项目大小。已有为网站预先设定的值，如果你选择File Rendering， 你可以调整你的设置（图5）。我用File Rendering中的H.264，Video比特率12000， Audio比特率384取得了不错的效果。H.264是一种超压缩格式，使用这种格式发布的文件小但质量好。


![](http://www.linux.com/images/stories/41373/fig-5-rendering.png)

*图 5：选择文件渲染，调整你的网页设置*

### 发布到YouTube ###

现在你可以在VLC或MPlayer或你喜欢的任何播放器中播放你的视频了，如果它看起来很好，那么你就可以将它上传到你的YouTube帐户里了。YouTube是典型的Google风格，信息中心和视频管理器会混乱又复杂，不过请坚持多研究下，你会理出头绪的。在你做任何事情之前，你必须对你的账户做资格认证，也就是通过短信和邮件获得一个验证码。通过输入验证码证明你不是一个网络爬虫后，你就能上传你的视频了。

你可以上传你的视频，然后标记它们为私人可见或所有人可见。Google有一些编辑工具，你可能会喜欢，比如自动纠错和配背景音乐。不过以我的拙见，几乎没有人是这样子做背景音乐的，所以这种工具只会令人讨厌。不过你有可能是第一个正确使用这个工具的人哦。

最有用的编辑工具是自动字幕。我推荐在你所有的视频上使用此功能，不光是为了那些听觉障碍的人，也为了那些需要保持低音量观看的人，确保所有的人都明白你在说什么。字幕工具也能创建副本。

另一个有用的工具是注释工具，它支持对话气泡，标题，聚光灯和标签。当然，在Kdenlive中，这些你都可以做到，所以都可以尝试一下。

好吧，到这里就结束了，但似乎我们刚刚开始。请分享你的视频，并在评论中添加Youtube的小建议和技巧。如果可以的话，请在[video.linux.com][3]分享你的新的视频教程，并参加100个Linux教程比赛。


--------------------------------------------------------------------------------

来源于: http://www.linux.com/learn/tutorials/745745-how-to-make-a-youtube-instructional-screencast-video-on-linux/

译者：[coolpigs](https://github.com/coolpigs) 校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://support.google.com/youtube/answer/1722171?hl=en&ref_topic=2888648
[2]:http://www.linux.com/learn/tutorials/422799-whirlwind-intro-to-audacity-on-linux
[3]:http://video.linux.com/100-linux-tutorials
