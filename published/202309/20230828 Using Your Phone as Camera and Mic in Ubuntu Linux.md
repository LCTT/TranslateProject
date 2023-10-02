[#]: subject: "Using Your Phone as Camera and Mic in Ubuntu Linux"
[#]: via: "https://itsfoss.com/ubuntu-phone-camera-mic/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16168-1.html"

将手机作为你的 Linux 桌面的摄像头和麦克风
======

![][0]

> 当你的桌面系统缺乏网络摄像头和专用麦克风时，你可以考虑使用智能手机。这里将教你如何在 Ubuntu Linux 中完成这个设置。

我和许多 Linux 用户一样，使用的是台式机。相较于笔记本电脑，并没有预装摄像头和麦克风。

若要获得与现代智能手机相媲美的画质，你可能需要购买一款高端的网络摄像头。

在此教程中，我将逐步指导你如何将你的手机用作麦克风和摄像头，这将非常适用于在线会议场景。

### Ubuntu 下使用手机的摄像头和麦克风

> 🚧 本教程采用第三方网站 <https://vdo.ninja/> 来托管音频和视频，因此，这并不是一项完全的开源方案。

我将指引你完成以下步骤：

  * 安装 OBS （如果你还未安装）
  * 通过 `vdo.ninja` 生成邀请链接
  * 设置虚拟音频线缆（用于音频输出）
  * 配置 OBS 以便从 `vdo.ninja` 重定向音视频流

首先，我们来看第一步。

> 📋 虽然本教程是在 Ubuntu 系统下完成的，但我相信，这些同样可以在其他 Linux 发行版上实现。你只需为你的发行版安装所需的包即可。你可以自行尝试，看看效果如何。

#### 1、在 Ubuntu 中安装 OBS

OBS（Open Broadcaster Software）是众多用于录制和直播视频的优秀软件之一，许多直播者都选择使用 OBS 在各个数字化平台进行直播。

幸运的是，OBS 已经包含在 Ubuntu 的默认仓库中，你可以通过以下命令来安装：

```
sudo apt install obs-studio
```

#### 2、通过 VDO.ninja 生成直播邀请

在这一节，我将教你如何在 vdo.ninja 上生成一个直播邀请，进而从你的手机上开始直播音频和视频。

首先，访问 [VDO.ninja][1] 并点击 “<ruby>创建可重用的邀请<rt>Create Reusable Invite</rt></ruby>”：

![][2]

接下来你会看到很多选项，包括质量设置，添加视频效果等。我推荐你使用默认设置，因为高质量视频需要更快的处理速度和更多的带宽。

为了创建一个链接，你只需要点击 “<ruby>生成邀请链接<rt>GENERATE THE INVITE LINK</rt></ruby>” 按钮：

![][3]

完成后你会看到：

  * 你需要用你的手机扫描的二维码（当然，你也可以选择使用链接）。
  * OBS 的链接。

**稍后我会在本教程中继续介绍 OBS 配置，所以请暂时别关闭这个窗口。**

首先，用你的手机扫描二维码，它会将你跳转到 VDO.ninja 的另一个页面，此时你需要：

  * 选择 “<ruby>共享你的相机<rt>Share your Camera</rt></ruby>” 选项。
  * 在视频源中选择使用前置或后置摄像头（默认为前置）。
  * 点击 “<ruby>开始<rt>Start</rt></ruby>” 按钮后，它将开始在 OBS 连接的页面上进行直播。

![][4]

#### 3、在 Ubuntu 上为 OBS 配置虚拟线缆

> 🚧 这种设置方法仅适用于 PulseAudio，并且在重启系统后虚拟线缆将被撤销。

首先，我们来解释一下“<ruby>虚拟线缆<rt>virtual cable</rt></ruby>”的概念，以及为何我们需要它来将手机做为摄像头和麦克风使用。

虚拟线缆是一种用于将音频流从一个应用传输到另一个应用的软件。

然而遗憾的是，它只支持 Windows 和 macOS。

啥？！那我为什么还要介绍这个呢？

答案其实很简单。我找到了一种变通方法，你可以在**当前的会话**中获得与虚拟线缆类似的功能。

要设置虚拟线缆，首先需要使用以下命令加载 `module-null-sink` 模块：

```
pactl load-module module-null-sink sink_name=Source
```

然后，执行下面的命令创建一个名为 `VirtualMic` 的虚拟音源：

```
pactl load-module module-virtual-source source_name=VirtualMic master=Source.monitor
```

这两个命令将返回一些数字，但无需对其过多关注。

接下来，前往系统“<ruby>设置<rt>Settings</rt></ruby>”，找到“<ruby>声音<rt>Sound</rt></ruby>”部分的设置：

![][5]

然后进入 “<ruby>输入<rt>Input</rt></ruby>” 部分，在此你会找到选择输入设备的选项。

将 “VirtualMic” 设为输入设备：

![][6]

这样就设置完了！

不过，如我之前所述，一旦你重启电脑，虚拟音频的设置就会被撤销，如果你打算经常使用手机作为摄像头和麦克风，这可能会造成一定的不便。

为了解决这个问题，你可以为这两个命令 [创建别名][7]，例如，为命令创建别名：`vc1` 和 `vc2`。

完成后，你就可以像这样 [一次执行两个命令][8]：`vc1 && vc2`。

#### 4、配置 OBS 从手机直播音视频

开始阶段，你需要打开我之前告诉你不要关闭的 VDO.ninja 标签页，并复制 OBS 链接：

![][9]

然后启动 OBS，在 “<ruby>源<rt>Sources</rt></ruby>” 区域你会看到一个 “➕（加号）”按钮，点击这个按钮并选择 “<ruby>浏览<rt>Browser</rt></ruby>”。

接着会弹出一个对话框，让你创建或选择一个源，你只需按下 “OK” 按钮即可：

![][10]

最后，将已经复制的链接粘贴进 “URL” 字段：

![][11]

然后你将能看到 OBS 正在使用你手机的摄像头：

![][12]

不过为了从你的手机接收音频，还有一些额外步骤需要执行。

首先，在菜单中点击 “<ruby>文件<rt>File</rt></ruby>” 并选择 “<ruby>设置<rt>Settings</rt></ruby>”：

![][13]

在出现的设置选项中选择 “<ruby>音频<rt>Audio</rt></ruby>”，然后寻找到 “<ruby>高级<rt>Advanced</rt></ruby>” 区域。

在 “高级” 区域里，你能找到 “<ruby>监控设备<rt>Monitoring Device</rt></ruby>” 的选项，这里你需要选择 “Source Audio/Sink sink”：

![][14]

点击 “<ruby>应用<rt>Apply</rt></ruby>” 保存更改。

对于大部分用户，此时音频应该已经能够正常工作了。如果你的音频依然无法工作，那么你可以按照以下步骤操作。

在 “<ruby>音频混音器<rt>Audio Mixer</rt></ruby>” 区域，可能显示的是 “<ruby>浏览<rt>Browser</rt></ruby>” 或 “<ruby>桌面音频<rt>Desktop Audio</rt></ruby>”，也可能两者都显示。

点击 “桌面音频” 或 “浏览” 旁边的三个点（在我这个例子中，是 “桌面音频”），并选择 “<ruby>高级音频属性<rt>Advanced Audio Properties</rt></ruby>”：

![][15]

然后，对于 “浏览” 和 “桌面音频”，都选择 “<ruby>监控和输出<rt>Monitor and Output</rt></ruby>”：

![][16]

这样就可以了！现在你可以从你的手机上享受摄像头和麦克风的功能了。

#### 5、测试所有设置

为了测试这个设置，我在我们读书俱乐部的周会上用我的手机做为摄像头和麦克风，效果极佳。

![][17]

你可以看到，上图显示摄像头和麦克风都在正常工作，这真的让我笑容满面 😸。

视频质量会取决于你的网络带宽，所以在开始重要的会议前，确保你有稳定的网络连接。

### 结语

作为一个没有摄像头和麦克风的台式计算机用户，我必须依靠笔记本或手机来参加工作会议，这让我感到非常烦躁。

需要注意的是，每次重启机器后，你都需要重新配置虚拟线缆，但这并不费时，因为只需要执行两条命令即可。

我已经多次使用这种解决方案，每一次都顺利运行。我真的希望你也能得到同样的结果。

*（题图：MJ/223b56b7-ffcc-4311-bfa6-8a25bfd5ad11）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-phone-camera-mic/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://vdo.ninja/
[2]: https://itsfoss.com/content/images/2023/08/Click-on-create-reusable-Invite-button.png
[3]: https://itsfoss.com/content/images/2023/08/Click-on-the-generate-invite-link-button.png
[4]: https://itsfoss.com/content/images/2023/08/setup-vdo.ninja-on-phone.png
[5]: https://itsfoss.com/content/images/2023/08/Open-sound-settings.png
[6]: https://itsfoss.com/content/images/2023/08/Choose-virtul-mic-as-an-audio-input-in-Linux-to-use-phone-s-camera-and-mic-.png
[7]: https://linuxhandbook.com/linux-alias-command/
[8]: https://linuxhandbook.com/run-multiple-commands/
[9]: https://itsfoss.com/content/images/2023/08/Copy-link-for-OBS.png
[10]: https://itsfoss.com/content/images/2023/08/Create-new-source-for-streaming-in-OBS-to-use-camera-and-mic-of-your-phone-in-Ubuntu-1.png
[11]: https://itsfoss.com/content/images/2023/08/Paste-VDO.ninja-link-in-OBS-to-use-your-phone-s-camera-and-mic-in-Ubuntu-Linux.png
[12]: https://itsfoss.com/content/images/2023/08/Stream-audio-and-video-from-your-phone-to-Ubuntu-Linux-using-OBS.png
[13]: https://itsfoss.com/content/images/2023/08/Open-settings-in-OBS.png
[14]: https://itsfoss.com/content/images/2023/08/Choose-virtual-audio-in-OBS-to-use-phone-s-mic-in-ubuntu-Linux.png
[15]: https://itsfoss.com/content/images/2023/08/Choose-advanced-option-to-use-audio-from-phone-in-Ubuntu-linux-using-OBS.png
[16]: https://itsfoss.com/content/images/2023/08/Enable-monitor-and-output-for-OBS.png
[17]: https://itsfoss.com/content/images/2023/08/Using-phone-s-camera-and-mic-in-Ubuntu-Linux.png
[0]: https://img.linux.net.cn/data/attachment/album/202309/07/155221kxjpb8j8j998xj50.jpg