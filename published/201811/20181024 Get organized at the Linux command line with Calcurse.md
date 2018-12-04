使用 Calcurse 在 Linux 命令行中组织任务
======

> 使用 Calcurse 了解你的日历和待办事项列表。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calendar.jpg?itok=jEKbhvDT)

你是否需要复杂、功能丰富的图形或 Web 程序才能保持井井有条？我不这么认为。合适的命令行工具可以完成工作并且做得很好。

当然，说出命令行这个词可能会让一些 Linux 用户感到害怕。对他们来说，命令行是未知领域。

使用 [Calcurse][1] 可以轻松地在命令行中进行组织任务。Calcurse 在基于文本的界面里带来了图形化外观。你可以得到简单、结合易用性的命令行和导航。

让我们仔细看看 Calcurse，它是在 BSD 许可证下开源的。

### 获取软件

如果你喜欢编译代码（我通常不喜欢），你可以从 [Calcurse 网站][1]获取源码。否则，根据你的 Linux 发行版获取[二进制安装程序][2]。你甚至可以从 Linux 发行版的软件包管理器中获取 Calcurse。检查一下不会有错的。

编译或安装 Calcurse 后（两者都不用太长时间），你就可以开始使用了。

### 使用 Calcurse

打开终端并输入 `calcurse`。

![](https://opensource.com/sites/default/files/uploads/calcurse-main.png)

Calcurse 的界面由三个面板组成：

  * <ruby>预约<rt>Appointments</rt></ruby>（屏幕左侧）
  * <ruby>日历<rt>Calendar</rt></ruby>（右上角）
  * <ruby>待办事项清单<rt>TODO</rt></ruby>（右下角）

按键盘上的 `Tab` 键在面板之间移动。要在面板添加新项目，请按下 `a`。Calcurse 将指导你完成添加项目所需的操作。

一个有趣的地方地是预约和日历面板配合工作。你选中日历面板并添加一个预约。在那里，你选择一个预约的日期。完成后，你回到预约面板，你就看到了。

按下 `a` 设置开始时间、持续时间（以分钟为单位）和预约说明。开始时间和持续时间是可选的。Calcurse 在它们到期的那天显示预约。

![](https://opensource.com/sites/default/files/uploads/calcurse-appointment.png)

一天的预约看起来像这样：

![](https://opensource.com/sites/default/files/uploads/calcurse-appt-list.png)

待办事项列表独立运作。选中待办面板并（再次）按下 `a`。输入任务的描述，然后设置优先级（1 表示最高，9 表示最低）。Calcurse 会在待办事项面板中列出未完成的任务。

![](https://opensource.com/sites/default/files/uploads/calcurse-todo.png)

如果你的任务有很长的描述，那么 Calcurse 会截断它。你可以使用键盘上的向上或向下箭头键浏览任务，然后按下 `v` 查看描述。

![](https://opensource.com/sites/default/files/uploads/calcurse-view-todo.png)

Calcurse 将其信息以文本形式保存在你的主目录下名为 `.calcurse` 的隐藏文件夹中，例如 `/home/scott/.calcurse`。如果 Calcurse 停止工作，那也很容易找到你的信息。

### 其他有用的功能

Calcurse 其他的功能包括设置重复预约的功能。要执行此操作，找出要重复的预约，然后在预约面板中按下 `r`。系统会要求你设置频率（例如，每天或每周）以及你希望重复预约的时间。

你还可以导入 [ICAL][3] 格式的日历或以 ICAL 或 [PCAL][4] 格式导出数据。使用 ICAL，你可以与其他日历程序共享数据。使用 PCAL，你可以生成日历的 Postscript 版本。

你还可以将许多命令行参数传递给 Calcurse。你可以[在文档中][5]了解它们。

虽然很简单，但 Calcurse 可以帮助你保持井井有条。你需要更加关注自己的任务和预约，但是你将能够更好地关注你需要做什么以及你需要做的方向。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/calcurse

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: http://www.calcurse.org/
[2]: http://www.calcurse.org/downloads/#packages
[3]: https://tools.ietf.org/html/rfc2445
[4]: http://pcal.sourceforge.net/
[5]: http://www.calcurse.org/files/manual.chunked/ar01s04.html#_invocation
