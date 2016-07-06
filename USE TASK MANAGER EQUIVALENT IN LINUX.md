#在linux下使用任务管理器
![](https://camo.githubusercontent.com/6e8051da4bdc2ef86c6196aba4fa752205dfc558/68747470733a2f2f697473666f73732e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031362f30362f5461736b2d4d616e616765722d696e2d4c696e75782e6a7067)

有很多Linux初学者经常问起的问题，“Linux有任务管理器吗?”，“在Linux上面你是怎样打开任务管理器的呢?”。
来自Windows的用户都知道任务管理器非常有用。你按下Ctrl+Alt+Del来打开任务管理器。这个任务管理器向你展示了所有的正在运行的进程和它们消耗的内存。你可以从任务管理器程序中选择并杀死一个进程。
当你刚使用Linux的时候，你会寻找一个在Linux相当于任务管理器的一个东西。一个Linux使用专家更喜欢使用命令行的方式查找进程和消耗的内存，但是你不必去使用这种方式，至少在你初学Linux的时候。
所有主流的Linux发行版都有一个类似于任务管理器的东西。大部分情况下，它叫System Monitor。但是它实际上依赖于你的Linux的发行版和它使用的[桌面环境](https://wiki.archlinux.org/index.php/desktop_environment)。
在这篇文章中，我们将会看到如何在使用GNOME的[桌面环境](https://wiki.archlinux.org/index.php/desktop_environment)的Linux上查找并使用任务管理器。
##在使用GNOME的桌面环境的linux上使用任务管理器
当你使用GNOME的时候，按下super键（Windows 键）来查找任务管理器。
![](https://camo.githubusercontent.com/7cce696347c8df84294f03056ad0073c25f73b87/68747470733a2f2f697473666f73732e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031362f30362f73797374656d2d6d6f6e69746f722d676e6f6d652d6665646f72612e706e67)

当你启动System Monitor的时候，它会向你展示所有正在运行的进程和被它们消耗的内存。
![](https://camo.githubusercontent.com/faa97f4ac67cae3fe357ea0c111558f3bcb0e52f/68747470733a2f2f697473666f73732e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031362f30362f6665646f72612d73797374656d2d6d6f6e69746f722e6a706567)

你可以选择一个进程并且点击“End Process”来杀掉它。
![](https://camo.githubusercontent.com/61fe7e9aaa68c4182ccfe5febdc7ae2c56d2a626/68747470733a2f2f697473666f73732e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031362f30362f6b696c6c2d70726f636573732d6665646f72612e706e67)

你也可以在Resources标签里面看到关于一些系统的数据，例如每个cpu核心的消耗，内存的使用，网络的使用等：
![](https://camo.githubusercontent.com/0d13b8478225adaa73b3833bb1c95edd17d4a260/68747470733a2f2f697473666f73732e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031362f30362f73797374656d2d73746174732d6665646f72612e706e67)

这是图形化的一种方式。如果你想使用命令行，在终端里运行“top”命令然后你就可以看到所有运行的进程和他们消耗的内存。你也可以[使用命令行杀死进程](https://itsfoss.com/how-to-find-the-process-id-of-a-program-and-kill-it-quick-tip/)。
这就是所有你需要知道的关于在Fedora Linux上任务管理器的知识。我希望这个教程帮你学到了知识，如果你有什么问题，请尽管问。

via:(https://itsfoss.com/task-manager-linux/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+ItsFoss+%28Its+FOSS%21+An+Open+Source+Blog%29)

作者：[Abhishek Prakash](https://itsfoss.com/author/abhishek/) 译者：[xinglianfly](https://github.com/xinglianfly) 校对：

本文由 [LCTT](https://github.com/LCTT/TranslateProject)原创编译，[Linux中国](https://linux.cn/) 荣誉推出

