在 Linux 下使用任务管理器
====================================

![](https://itsfoss.com/wp-content/uploads/2016/06/Task-Manager-in-Linux.jpg)

有很多 Linux 初学者经常问起的问题，“**Linux 有任务管理器吗？**”，“**怎样在 Linux 上打开任务管理器呢？**”

来自 Windows 的用户都知道任务管理器非常有用。你可以在 Windows 中按下 `Ctrl+Alt+Del` 打开任务管理器。这个任务管理器向你展示了所有的正在运行的进程和它们消耗的内存，你可以从任务管理器程序中选择并杀死一个进程。

当你刚使用 Linux 的时候，你也会寻找一个**在 Linux 相当于任务管理器**的一个东西。一个 Linux 使用专家更喜欢使用命令行的方式查找进程和消耗的内存等等，但是你不用必须使用这种方式，至少在你初学 Linux 的时候。

所有主流的 Linux 发行版都有一个类似于任务管理器的东西。大部分情况下，它叫系统监视器（System Monitor），不过实际上它依赖于你的 Linux 的发行版及其使用的[桌面环境][1]。

在这篇文章中，我们将会看到如何在以 GNOME 为[桌面环境][2]的 Linux 上找到并使用任务管理器。

### 在使用 GNOME 桌面环境的 Linux 上的任务管理器等价物

使用 GNOME 时，按下 super 键（Windows 键）来查找任务管理器：

![](https://itsfoss.com/wp-content/uploads/2016/06/system-monitor-gnome-fedora.png)

当你启动系统监视器的时候，它会向你展示所有正在运行的进程及其消耗的内存。

![](https://itsfoss.com/wp-content/uploads/2016/06/fedora-system-monitor.jpeg)

你可以选择一个进程并且点击“终止进程（End Process）”来杀掉它。

![](https://itsfoss.com/wp-content/uploads/2016/06/kill-process-fedora.png)

你也可以在资源（Resources）标签里面看到关于一些统计数据，例如 CPU 的每个核心的占用，内存用量、网络用量等。

![](https://itsfoss.com/wp-content/uploads/2016/06/system-stats-fedora.png)

这是图形化的方式。如果你想使用命令行，在终端里运行“top”命令然后你就可以看到所有运行的进程及其消耗的内存。你也可以很容易地使用命令行[杀死进程][3]。

这就是关于在 Fedora Linux 上任务管理器的知识。我希望这个教程帮你学到了知识，如果你有什么问题，请尽管问。

--------------------------------------------------------------------------------

via: https://itsfoss.com/task-manager-linux/

作者：[Abhishek Prakash][a] 
译者：[xinglianfly](https://github.com/xinglianfly) 
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject)原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: https://wiki.archlinux.org/index.php/desktop_environment
[2]: https://itsfoss.com/best-linux-desktop-environments/
[3]: https://itsfoss.com/how-to-find-the-process-id-of-a-program-and-kill-it-quick-tip/
