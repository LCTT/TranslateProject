如何在 Ubuntu 上用 Go For It 管理您的待办清单
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-featured1.jpg)

任务管理可以说是工作及日常生活中最重要也最具挑战性的事情之一。当您在工作中承担越来越多的责任时，您的表现将与您管理任务的能力直接挂钩。

若您的工作有部分需要在电脑上完成，那么您一定很乐意知道，有多款应用软件自称可以为您减轻任务管理的负担。即便这些软件中的大多数都是为 Windows 用户服务的，在 Linux 系统中仍然有不少选择。在本文中，我们就来讨论这样一款软件：Go For It.

### Go For It ###

[Go For It][1] (GFI) 由 Manuel Kehl 开发，他声称：“这是款简单易用且时尚优雅的生产力软件，以待办清单（To-Do List）为主打特色，并整合了一个能让你专注于当前事务的定时器。”这款软件的定时器功能尤其有趣，它还可以让您在继续工作之前暂停下来，放松一段时间。

### 下载并安装 ###

使用基于 Debian 系统（如Ubuntu）的用户可以通过运行以下终端命令轻松地安装这款软件：

    sudo add-apt-repository ppa:mank319/go-for-it
    sudo apt-get update
    sudo apt-get install go-for-it

以上命令执行完毕后，您就可以使用这条命令运行这款应用软件了：

    go-for-it

### 使用及配置###

当你第一次运行 GFI 时，它的界面是长这样的：

![gfi-first-run](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-first-run1.png)

可以看到，界面由三个标签页组成，分别是*待办* (To-Do)，*定时器* (Timer)和*完成* (Done)。*待办*页是一个任务列表（上图所示的4个任务是默认生成的——您可以点击头部的方框删除它们），*定时器*页内含有任务定时器，而*完成*页则是已完成任务的列表。底部有个文本框，您可以在此输入任务描述，并点击“+”号将任务添加到上面的列表中。

举个例子，我将一个名为“MTE-research-work”的任务添加到了列表中，并点击选中了它，如下图所示：

![gfi-task-added](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-task-added1.png)

然后我进入*定时器*页，在这里我可以看到一个为当前“MTE-reaserch-work”任务设定的定时器，定时25分钟。

![gfi-active-task-timer](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-active-task-timer.png)

当然，您可以将定时器设定为你喜欢的任何值。然而我并没有修改，而是直接点击下方的“开始 (Start)”按钮启动定时器。一旦剩余时间为60秒，GFI 就会给出一个提示。

![gfi-first-notification-new](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-first-notification-new.jpg)

一旦时间到，它会提醒我休息5分钟。

![gfi-time-up-notification-new](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-time-up-notification-new.jpg)

5分钟过后，我可以为我的任务再次开启定时器。

![gfi-break-time-up-new](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-break-time-up-new.jpg)

任务完成以后，您可以点击*定时器*页中的“完成 (Done)”按钮，然后这个任务就会从*待办*页被转移到*完成*页。

![gfi-task-done](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-task-done1.png)

GFI 也能让您稍微调整一些它的设置。例如，下图所示的设置窗口就包含了一些选项，让您修改默认的任务时长，休息时长和提示时刻。

![gfi-settings](https://www.maketecheasier.com/assets/uploads/2015/10/gfi-settings1.png)

值得一提的是，GFI 是以 TODO.txt 格式保存待办清单的，这种格式方便了移动设备之间的同步，也让您能使用其他前端程序来编辑任务——更多详情请阅读[这里][2]。

您还可以通过以下视频观看 GFI 的动态展示。

注：youtube 视频
<iframe frameborder="0" src="http://www.youtube.com/embed/mnw556C9FZQ?autoplay=1&amp;autohide=2&amp;border=1&amp;wmode=opaque&amp;enablejsapi=1&amp;controls=1&amp;showinfo=0" id="youtube-iframe"></iframe>

### 结论###

正如您所看到的，GFI 是一款简洁明了且易于使用的任务管理软件。虽然它没有提供非常丰富的功能，但它实现了它的承诺，定时器的整合特别有用。如果您正在寻找一款实现了基础功能，并且开源的 Linux 任务管理软件，Go For It 值得您一试。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/to-do-lists-ubuntu-go-for-it/

作者：[Himanshu Arora][a]
译者：[Ricky-Gong](https://github.com/Ricky-Gong)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
[1]:http://manuel-kehl.de/projects/go-for-it/
[2]:http://todotxt.com/
