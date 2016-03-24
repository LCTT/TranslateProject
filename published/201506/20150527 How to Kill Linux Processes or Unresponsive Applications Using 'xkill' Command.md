如何使用xkill命令杀掉Linux进程/未响应的程序
================================================================================

我们如何在Linux中杀掉一个资源/进程？很明显我们会找出资源的pid然后用kill命令。

说的更明白一点，我们可以找到某个资源（比如terminal）的PID：

    $ ps -A | grep -i terminal
    
    6228 ?        00:00:00 gnome-terminal

上面的输出中，‘6288’就是进程（gnome-terminal）的pid， 使用下面的命令来杀掉进程。

    $ kill 6228

kill命令会发送一个信号给该pid的进程。

另外一个方法是我们可以使用pkill命令，它可以基于进程的名字或者其他的属性来杀掉进程。同样我们要杀掉一个叫terminal的进程可以这么做：

    $ pkill terminal

**注意**: pkill命令后面进程名的长度不大于15个字符

pkill看上去更加容易上手，因为你你不用找出进程的pid。但是如果你要对系统做更好的控制，那么没有什么可以打败'kill'。使用kill命令可以更好地审视你要杀掉的进程。

我们已经有一篇覆盖了[kill、pkill和killall命令][1]细节的指导了。

对于那些运行X Server的人而言，有另外一个工具称为xkill可以将进程从X Window中杀掉而不必传递它的名字或者pid。

xkill工具强制X server关闭与它的客户程序之间的联系，其结果就是X resource关闭了这个客户程序。xkill是X11工具集中一个非常容易上手的杀掉无用窗口的工具。

它支持的选项如在同时运行多个X Server时使用-display选项后面跟上显示号连接到指定的X server，使用-all(并不建议)杀掉所有在屏幕上的所有顶层窗口，以及帧（-frame）参数。

要列出所有的客户程序你可以运行：

    $ xlsclients

#### 示例输出 ####

    '  ' /usr/lib/libreoffice/program/soffice
    deb  gnome-shell
    deb  Docky
    deb  google-chrome-stable
    deb  soffice
    deb  gnome-settings-daemon
    deb  gnome-terminal-server

如果后面没有跟上资源id，xkill会将鼠标指针变成一个特殊符号，类似于“X”。只需在你要杀掉的窗口上点击，它就会杀掉它与server端的通信，这个程序就被杀掉了。

    $ xkill

![Xkill Command](http://www.tecmint.com/wp-content/uploads/2015/05/Xkill.png)

*使用xkill杀掉进程*

需要注意的是xkill并不能保证它的通信会被成功杀掉/退出。大多数程序会在与服务端的通信被关闭后杀掉。然而仍有少部分会继续运行。

需要指出的点是：

- 这个工具只能在X11 server运行的时候才能使用，因为这是X11工具的一部分。
- 不要在你杀掉一个资源而它没有完全退出时而困惑。
- 这不是kill的替代品

**我需要在linux命令行中使用xkill么**

不是，你不必非在命令行中运行xkill。你可以设置一个快捷键，并用它来调用xkill。

下面是如何在典型的gnome3桌面中设置键盘快捷键。

进入设置-> 选择键盘。点击'+'并添加一个名字和命令。点击点击新条目并按下你想要的组合键。我的是Ctrl+Alt+Shift+x。

![Gnome Settings](http://www.tecmint.com/wp-content/uploads/2015/05/22.png)

*Gnome 设置*

![Add Shortcut Key](http://www.tecmint.com/wp-content/uploads/2015/05/31.png)

*添加快捷键*

下次你要杀掉一个X资源只要用组合键就行了（Ctrl+Alt+Shift+x），你看到你的鼠标变成x了。点击想要杀掉的x资源就行了。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/kill-processes-unresponsive-programs-in-ubuntu/

作者：[Avishek Kumar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:https://linux.cn/article-2116-1.html
