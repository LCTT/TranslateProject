[#]: subject: "Don’t Suspend Ubuntu When Laptop Lid is Closed"
[#]: via: "https://itsfoss.com/laptop-lid-suspend-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

笔记本电脑合盖时不挂起 Ubuntu
======
如果你在笔记本电脑上使用 Ubuntu，你可能已经注意到当你合上盖子时系统处于挂起状态。

这是预期的行为。它可以节省电池和你的工作。你掀开盖子，系统唤醒，你可以登录并继续工作。

这一切听起来都不错，除非你使用多显示器设置。像我这样的一些人更喜欢关闭笔记本电脑，只使用外接显示器。

但是，如果关闭笔记本电脑盖会挂起系统，那么会产生问题。

让我告诉你如何改变这种行为。

### 关闭笔记本电脑盖时不要挂起

实际上，我注意到最近的 Ubuntu 版本在这个情况下更智能。当笔记本电脑连接到扩展坞并合上盖子时，它不会进入挂起模式。

这是正常的预期行为，但由于 Ubuntu 之神才知的原因，它可能不会一直有效。

好消息是你可以使用 GUI 和命令行强制更改此行为。

让我分享这两种方法。

#### 方法 1：使用 GNOME Tweaks 

如果你使用的是默认的 GNOME 桌面，那么你很幸运。 [在 Ubuntu 的软件中心安装 GNOME Tweaks 工具][1]或使用以下命令：

```
sudo apt install gnome-tweaks
```

安装后，启动 Tweaks 应用。在侧边栏的**常规选项卡**中，**关闭“关闭笔记本电脑盖时观其”按钮**。

![change lid close behavior ubuntu][2]

这就好了。你不需要重启即可使更改生效。

现在，让我们谈谈命令行方法。

#### 方法 2：更改登录配置（针对高级用户）

如果你查看文件 /etc/systemd/logind.conf 的内容，你将看到三种不同类型的笔记本电脑合盖默认设置。

* HandleLidSwitch：当笔记本电脑使用电池供电时
* HandleLidSwitchExternalPower：当笔记本电脑插入电源插座时
* HandleLidSwitchDocked：当笔记本电脑连接到扩展坞时

![Default laptop lid closing settings][3]

如你所见，如果合上盖子，笔记本电脑将挂起，无论它是否连接到电源。连接扩展坞忽略合盖。

如果需要，你可以根据自己的喜好将这些参数的值更改为其中之一：

* lock：合盖时锁定
* ignore：什么都不做
* poweroff：关机
* hibernate：合盖时休眠

如果你不希望你的系统在笔记本电脑盖合上时执行任何特殊操作，我建议你使用 `ignore`。

你可以编辑 /etc/systemd/logind.conf 文件并取消注释上述设置并更改其值，或者在 /etc/systemd/logind.conf.d 目录中创建一个新文件。如果此目录不存在，请创建此目录。

我不会给你确切的命令。如果你熟悉命令行，你应该可以做到。如果你对命令行感到不舒服，请使用前面的 GUI 方法。

我希望这可以帮助你。如果你有任何问题，请告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/laptop-lid-suspend-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/gnome-tweak-tool/
[2]: https://itsfoss.com/wp-content/uploads/2022/08/change-lid-close-behavior-ubuntu.png
[3]: https://itsfoss.com/wp-content/uploads/2022/08/laptop-lid-settings-ubuntu.png
