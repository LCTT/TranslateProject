[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10557-1.html)
[#]: subject: (Get started with Go For It, a flexible to-do list application)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-go-for-it)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

开始使用 Go For It 吧，一个灵活的待办事项列表程序
======

> Go For It，是我们开源工具系列中的第十个工具，它将使你在 2019 年更高效，它在 Todo.txt 系统的基础上构建，以帮助你完成更多工作。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o)

每年年初似乎都有疯狂的冲动想提高工作效率。新年的决心，渴望开启新的一年，当然，“抛弃旧的，拥抱新的”的态度促成了这一切。通常这时的建议严重偏向闭源和专有软件，但事实上并不用这样。

这是我挑选出的 19 个新的（或者对你而言新的）开源工具中的第 10 个工具来帮助你在 2019 年更有效率。

### Go For It

有时，人们要高效率需要的不是一个花哨的看板或一组笔记，而是一个简单、直接的待办事项清单。像“将项目添加到列表中，在完成后检查”一样基本的东西。为此，[纯文本 Todo.txt 系统][1]可能是最容易使用的系统之一，几乎所有系统都支持它。

![](https://opensource.com/sites/default/files/uploads/go-for-it_1_1.png)

[Go For It][2] 是一个简单易用的 Todo.txt 图形界面。如果你已经在使用 Todo.txt，它可以与现有文件一起使用，如果还没有，那么可以同时创建待办事项和完成事项。它允许拖放任务排序，允许用户按照他们想要执行的顺序组织待办事项。它还支持 [Todo.txt 格式指南][3]中所述的优先级、项目和上下文。而且，只需单击任务列表中的项目或者上下文就可通过它们过滤任务。

![](https://opensource.com/sites/default/files/uploads/go-for-it_2.png)

一开始，Go For It 可能看起来与任何其他 Todo.txt 程序相同，但外观可能是骗人的。将 Go For It 与其他程序真正区分开的功能是它包含一个内置的[番茄工作法][4]计时器。选择要完成的任务，切换到“计时器”选项卡，然后单击“启动”。任务完成后，只需单击“完成”，它将自动重置计时器并选择列表中的下一个任务。你可以暂停并重新启动计时器，也可以单击“跳过”跳转到下一个任务（或中断）。在当前任务剩余 60 秒时，它会发出警告。任务的默认时间设置为 25 分钟，中断的默认时间设置为 5 分钟。你可以在“设置”页面中调整，同时还能调整 Todo.txt 和 done.txt 文件的目录的位置。

![](https://opensource.com/sites/default/files/uploads/go-for-it_3.png)

Go For It 的第三个选项卡是“已完成”，允许你查看已完成的任务并在需要时将其清除。能够看到你已经完成的可能是非常激励的，也是一种了解你在更长的过程中进度的好方法。

![](https://opensource.com/sites/default/files/uploads/go-for-it_4.png)

它还有 Todo.txt 的所有其他优点。Go For It 的列表可以被其他使用相同格式的程序访问，包括 [Todo.txt 的原始命令行工具][5]和任何已安装的[附加组件][6]。

Go For It 旨在成为一个简单的工具来帮助管理你的待办事项列表并完成这些项目。如果你已经使用过 Todo.txt，那么 Go For It 是你的工具箱的绝佳补充，如果你还没有，这是一个尝试最简单、最灵活系统之一的好机会。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-go-for-it

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: http://todotxt.org/
[2]: http://manuel-kehl.de/projects/go-for-it/
[3]: https://github.com/todotxt/todo.txt
[4]: https://en.wikipedia.org/wiki/Pomodoro_Technique
[5]: https://github.com/todotxt/todo.txt-cli
[6]: https://github.com/todotxt/todo.txt-cli/wiki/Todo.sh-Add-on-Directory
