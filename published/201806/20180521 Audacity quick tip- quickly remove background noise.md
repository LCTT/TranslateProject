Audacity 快速指南：快速消除背景噪音
======

![](https://fedoramagazine.org/wp-content/uploads/2018/03/audacity-noise-816x345.png)

当在笔记本电脑上录制声音时 —— 比如首次简单地录屏 —— 许多用户通常使用内置麦克风。但是，这些小型麦克风也会捕获很多背景噪音。在这个快速指南中，我们会学习如何使用 Fedora 中的 [Audacity][1] 快速移除音频文件中的背景噪音。

### 安装 Audacity

Audacity 是 Fedora 中用于混合、剪切和编辑音频文件的程序。在 Fedora 上它支持各种开箱即用的格式 - 包括 MP3 和 OGG。从软件中心安装 Audacity。

![][2]

如果你更喜欢终端，请使用以下命令：

```
sudo dnf install audacity
```

### 导入您的音频、样本背景噪音

安装 Audacity 后，打开程序，使用 “File > Import”  菜单项导入你的声音。这个例子使用了一个[来自 freesound.org 添加了噪音的声音][3]：

- https://ryanlerch.fedorapeople.org/noise.ogg?_=1

接下来，采样要滤除的背景噪音。导入音轨后，选择仅包含背景噪音的音轨区域。然后从菜单中选择 “Effect > Noise Reduction”，然后按下 “Get Noise Profile” 按钮。

![][4]

### 过滤噪音

接下来，选择你要过滤噪音的音轨区域。通过使用鼠标进行选择，或者按 `Ctrl + a` 来选择整个音轨。最后，再次打开 “Effect > Noise Reduction” 对话框，然后单击确定以应用滤镜。

![][5]

此外，调整设置，直到你的音轨听起来更好。这里是原始文件，接下来是用于比较的降噪音轨（使用默认设置）：

- https://ryanlerch.fedorapeople.org/sidebyside.ogg?_=2

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/audacity-quick-tip-quickly-remove-background-noise/

作者：[Ryan Lerch][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/introducing-flatpak/
[1]:https://www.audacityteam.org/
[2]:https://fedoramagazine.org/wp-content/uploads/2018/03/audacity-software.jpg
[3]:https://freesound.org/people/levinj/sounds/8323/
[4]:https://fedoramagazine.org/wp-content/uploads/2018/03/select-noise-profile.gif
[5]:https://fedoramagazine.org/wp-content/uploads/2018/03/apply-filter.gif
