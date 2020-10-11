[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12708-1.html)
[#]: subject: (How to Use the Firefox Task Manager \(to Find and Kill RAM and CPU Eating Tabs and Extensions\))
[#]: via: (https://itsfoss.com/firefox-task-manager/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

如何使用 Firefox 任务管理器
======

![](https://img.linux.net.cn/data/attachment/album/202010/11/103209cc1l7ktc7asacjhe.jpg)

> 查找并杀死占用内存和 CPU 的标签页和扩展程序

Firefox 在 Linux 用户中很受欢迎。它是几个 Linux 发行版上的默认 Web 浏览器。

在它所提供的许多功能之中，Firefox 也提供了一个自己的任务管理器。

不过，在 Linux 中既然你有[任务管理器][1]这种形式的[系统监控工具][2]，为什么还要使用 Firefox 的呢？这里有个很好的理由。

假设你的系统占用了太多的内存或 CPU。如果你使用 `top` 或其他一些系统[资源监控工具，如 Glances][3]，你会发现这些工具无法区分是哪个打开的标签或扩展占用了资源。

通常情况下，每个 Firefox 标签页都显示为 “<ruby>Web 内容<rt>Web Content</rt></ruby>”。你可以看到是某个 Firefox 进程导致了这个问题，但这无法准确判断是哪个标签页或扩展。

这时你可以使用 Firefox 任务管理器。让我来告诉你怎么做！

### Firefox 任务管理器

有了 Firefox 任务管理器，你就可以列出所有消耗系统资源的标签页、跟踪器和附加组件。

![][4]

正如你在上面的截图中所看到的，你会看到标签页的名称、类型（标签或附加组件）、能源影响和消耗的内存。

其它的都不言自明，但**“能源影响”指的是 CPU 的使用**，如果你使用的是笔记本电脑，它是一个很好的指标，可以告诉你什么东西会更快耗尽电池电量。

#### 在 Firefox 中访问任务管理器

令人意外的是，任务管理器没有 [Firefox 键盘快捷键][5]。

要快速启动 Firefox 任务管理器，可以在地址栏中输入 `about:performance`，如下图所示。

![Quickly access task manager in Firefox][6]

另外，你也可以点击“菜单”图标，然后进入“更多”选项，如下截图所示。

![Accessing task manager in Firefox][7]

接下来，你会发现选择“任务管理器”的选项，只需点击它就行。

![][8]

#### 使用 Firefox 任务管理器

到这后，你可以检查资源的使用情况，展开标签页来查看跟踪器和它的使用情况，也可以选择关闭标签，如下截图高亮所示。

![][9]

以下是你应该知道的：

  * “能源影响”指的是 CPU 消耗。
  * 子框架或子任务通常是与需要在后台运行的标签相关联的跟踪器/脚本。

通过这个任务管理器，你可以发现网站上的流氓脚本，以及它是否导致你的浏览器变慢。

这并不是什么 高科技，但并不是所有人都知道 Firefox 任务管理器。现在你知道了，它应该很方便，你觉得呢？

--------------------------------------------------------------------------------

via: https://itsfoss.com/firefox-task-manager/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/task-manager-linux/
[2]: https://itsfoss.com/linux-system-monitoring-tools/
[3]: https://itsfoss.com/glances/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/firefox-task-manager-shot.png?resize=800%2C519&ssl=1
[5]: https://itsfoss.com/firefox-keyboard-shortcuts/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/firefox-url-performance.jpg?resize=800%2C357&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/firefox-task-manager-steps.jpg?resize=800%2C779&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/firefox-task-manager-menu.jpg?resize=800%2C465&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/firefox-task-manager-close-tab.png?resize=800%2C496&ssl=1
