[#]: subject: (Kooha is a Nascent Screen Recorder for GNOME With Wayland Support)
[#]: via: (https://itsfoss.com/kooha-screen-recorder/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13227-1.html)

Kooha：一款支持 Wayland 的新生 GNOME 屏幕录像机
======

Linux 中没有一个 [像样的支持 Wayland 显示服务器的屏幕录制软件][1]。

如果你使用 Wayland 的话，[GNOME 内置的屏幕录像机][1] 可能是少有的（也是唯一的）支持的软件。但是那个屏幕录像机没有可视界面和你所期望的标准屏幕录像软件的功能。

值得庆幸的是，有一个新的应用正在开发中，它提供了比 GNOME 屏幕录像机更多一点的功能，并且在 Wayland 上也能正常工作。

### 遇见 Kooha：一个新的 GNOME 桌面屏幕录像机

![][2]

[Kooha][3] 是一个处于开发初期阶段的应用，它可以在 GNOME 中使用，是用 GTK 和 PyGObject 构建的。事实上，它利用了与 GNOME 内置屏幕录像机相同的后端。

以下是 Kooha 的功能：

  * 录制整个屏幕或选定区域
  * 在 Wayland 和 Xorg 显示服务器上均可使用
  * 在视频里用麦克风记录音频
  * 包含或忽略鼠标指针的选项
  * 可以在开始录制前增加 5 秒或 10 秒的延迟
  * 支持 WebM 和 MKV 格式的录制
  * 允许更改默认保存位置
  * 支持一些键盘快捷键

### 我的 Kooha 体验

![][4]

它的开发者 Dave Patrick 联系了我，由于我急需一款好用的屏幕录像机，所以我马上就去试用了。

目前，[Kooha 只能通过 Flatpak 安装][5]。我安装了 Flatpak，当我试着使用时，它什么都没有记录。我和 Dave 进行了快速的邮件讨论，他告诉我这是由于 [Ubuntu 20.10 中 GNOME 屏幕录像机的 bug][6]。

你可以想象我对支持 Wayland 的屏幕录像机的绝望，我 [将我的 Ubuntu 升级到 21.04 测试版][7]。

在 21.04 中，可以屏幕录像，但仍然无法录制麦克风的音频。

我注意到了另外几件无法按照我的喜好顺利进行的事情。

例如，在录制时，计时器在屏幕上仍然可见，并且包含在录像中。我不会希望在视频教程中出现这种情况。我想你也不会喜欢看到这些吧。

![][8]

另外就是关于多显示器的支持。没有专门选择某一个屏幕的选项。我连接了两个外部显示器，默认情况下，它录制所有三个显示器。可以使用设置捕捉区域，但精确拖动屏幕区域是一项耗时的任务。

它也没有 [Kazam][9] 或其他传统屏幕录像机中有的设置帧率或者编码的选项。

### 在 Linux 上安装 Kooha（如果你使用 GNOME）

请确保在你的 Linux 发行版上启用 Flatpak 支持。目前它只适用于 GNOME，所以请检查你使用的桌面环境。

使用此命令将 Flathub 添加到你的 Flatpak 仓库列表中：

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

然后用这个命令来安装：

```
flatpak install flathub io.github.seadve.Kooha
```

你可以通过菜单或使用这个命令来运行它：

```
flatpak run io.github.seadve.Kooha
```

### 总结

Kooha 并不完美，但考虑到 Wayland 领域的巨大空白，我希望开发者努力修复这些问题并增加更多的功能。考虑到 [Ubuntu 21.04 将默认切换到 Wayland][10]，以及其他一些流行的发行版如 Fedora 和 openSUSE 已经默认使用 Wayland，这一点很重要。

--------------------------------------------------------------------------------

via: https://itsfoss.com/kooha-screen-recorder/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/gnome-screen-recorder/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/kooha-screen-recorder.png?resize=800%2C450&ssl=1
[3]: https://github.com/SeaDve/Kooha
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/kooha.png?resize=797%2C364&ssl=1
[5]: https://flathub.org/apps/details/io.github.seadve.Kooha
[6]: https://bugs.launchpad.net/ubuntu/+source/gnome-shell/+bug/1901391
[7]: https://itsfoss.com/upgrade-ubuntu-beta/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/kooha-recording.jpg?resize=800%2C636&ssl=1
[9]: https://itsfoss.com/kazam-screen-recorder/
[10]: https://news.itsfoss.com/ubuntu-21-04-wayland/
