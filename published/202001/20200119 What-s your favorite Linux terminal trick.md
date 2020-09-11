[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11817-1.html)
[#]: subject: (What's your favorite Linux terminal trick?)
[#]: via: (https://opensource.com/article/20/1/linux-terminal-trick)
[#]: author: (Opensource.com https://opensource.com/users/admin)

你有什么喜欢的 Linux 终端技巧？
======

> 告诉我们你最喜欢的终端技巧，无论是提高生产率的快捷方式还是有趣的彩蛋。

![](https://img.linux.net.cn/data/attachment/album/202001/25/135858accxc70tfxuifxx1.jpg)

新年伊始始终是评估提高效率的新方法的好时机。许多人尝试使用新的生产力工具，或者想找出如何优化其最常用的流程。终端是一个需要评估的领域，尤其是在开源世界中，有无数种方法可以通过快捷键和命令使终端上的生活更加高效（又有趣！）。

我们向作者们询问了他们最喜欢的终端技巧。他们分享了一些节省时间的技巧，甚至还有一个有趣的终端彩蛋。你会采用这些键盘快捷键或命令行技巧吗？你有喜欢分享的最爱吗？请发表评论来告诉我们。

“我找不出哪个是我最喜欢的；每天我都会使用这三个：

* `Ctrl + L` 来清除屏幕（而不是键入 `clear`）。
* `sudo !!` 以 `sudo` 特权运行先前的命令。
* `grep -Ev '^#|^$' <file>` 将显示文件内容，不带注释或空行。” —Mars Toktonaliev

“对我来说，如果我正在使用终端文本编辑器，并且希望将其丢开，以便可以快速执行其他操作，则可以使用 `Ctrl + Z` 将其放到后台，接着执行我需要做的一切，然后用 `fg` 将其带回前台。有时我也会对 `top` 或 `htop` 做同样的事情。我可以将其丢到后台，并在我想检查当前性能时随时将其带回前台。我不会将通常很快能完成的任务在前后台之间切换，它确实可以增强终端上的多任务处理能力。” —Jay LaCroix

“我经常在某一天在终端中做很多相同的事情，有两件事是每天都不变的：

* `Ctrl + R` 反向搜索我的 Bash 历史记录以查找我已经运行并且希望再次执行的命令。
* 插入号（`^`）替换是最好的，因为我经常做诸如 `sudo dnf search <package name>` 之类的事情，然后，如果我以这种方式找到合适的软件包，则执行 `^search^install` 来重新运行该命令，以 `install` 替换 `search`。

这些东西肯定是很基本的，但是对我来说却节省了时间。” —Steve Morris

“我的炫酷终端技巧不是我在终端上执行的操作，而是我使用的终端。有时候我只是想要使用 Apple II 或旧式琥珀色终端的感觉，那我就启动了 Cool-Retro-Term。它的截屏可以在这个[网站][2]上找到。” —Jim Hall

“可能是用 `ssh -X` 来在其他计算机上运行图形程序。（在某些终端仿真器上，例如 gnome-terminal）用 `C-S c` 和 `C-S v` 复制/粘贴。我不确定这是否有价值（因为它有趣的是以 ssh 启动的图形化）。最近，我需要登录另一台计算机，但是我的孩子们可以在笔记本电脑的大屏幕上看到它。这个[链接][3]向我展示了一些我从未见过的内容：通过局域网从我的笔记本电脑上镜像来自另一台计算机屏幕上的活动会话（`x11vnc -desktop`），并能够同时从两台计算机上进行控制。” —Kyle R. Conway

“你可以安装 `sl`（`$ sudo apt install sl` 或 `$ sudo dnf install sl`），并且当在 Bash 中输入命令 `sl` 时，一个基于文本的蒸汽机车就会在显示屏上移动。” —Don Watkins

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/linux-terminal-trick

作者：[Opensource.com][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/admin
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://github.com/Swordfish90/cool-retro-term
[3]: https://elinux.org/Screen_Casting_on_a_Raspberry_Pi
