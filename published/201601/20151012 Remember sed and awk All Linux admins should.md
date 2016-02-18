sed 和 awk，所有的 Linux 管理员都应该会的技能！
==========================

![](http://images.techhive.com/images/article/2015/03/linux-100573790-primary.idge.jpg)

*图片来源: Shutterstock*

**我们不要让下一代 Linux 和 Unix 的管理员忘记初始化脚本和基本工具的好处**

我曾经有一次在 Reddit 看到一个帖子，“[请问如何操作文本文件][1]”。这是一个很简单的需求，就像我们常用 Unix 的人每天遇到的一样。他的问题是，如何删除文件中的重复行，只保留不重复的。 这听起来似乎很简单，但是当文件足够大时，就会有些复杂。

这个问题有很多种不同的答案。你可以使用几乎任何一种语言来写这样的一个脚本，只是时间的投入和代码的复杂性不同罢了。根据你的个人水平，它大概会花费20-60分钟。但是如果你使用了 Perl、Python、Ruby 中的一种，你可能很快实现它。

或者你可以使用下面的一个方法，让你无比暖心的: 只用 awk。

这个答案是迄今为止最简明、最简单的解决问题的方法。它只要一行！

``` 
awk '!seen[$0]++' <filename>
```

让我们来看看发生了什么：

在这个命令中，其实隐藏了很多代码。awk 是一种文本处理语言，并且它内部有很多预设。首先，你看到的实际上是一个 for 循环的结果。awk 假定你想通过循环处理输入文件的每一行，所以你不需要明确的去指定它。awk 还假定了你需要打印输出处理后的数据，所以你也不需要去指定它。最后，awk 假定循环在最后一句指令执行完结束，这一块也不再需要你去指定它。

这个例子中的字符串 seen 是一个关联数组的名字。$0 是一个变量，表示整个当前行。所以，这个命令翻译成人类语言就是“对这个文件的每一行进行检查，如果你之前没有见过它，就打印出来。” 如果该关联数组的键名还不存在就添加到数组，并增加其取值，这样 awk 下次遇到同样的行时就会不匹配（条件判断为“假”），从而不打印出来。

一些人认为这样是优雅的，另外的人认为这可能会造成混淆。任何在日常工作上使用 awk 的都是第一类人。awk 就是设计用来做这个的。在 awk 中，你可以写多行代码。你甚至可以[用 awk 写一些让人不安的复杂功能][2]。但终究来说，awk 还是一个进行文本处理的程序，一般是通过管道。去掉（没必要的）循环定义是很常见的快捷用法，不过如果你乐意，你也可以用下面的代码做同样的事情：


``` 
awk '{ if (!seen[$0]) print $0; seen[$0]++ }’ 
```

这会产生相同的结果。

awk 是完成这项工作的完美工具。不过，我相信很多管理员--特别是新管理员会转而使用 [Bash][3] 或 Python 来完成这一任务，因为对 awk 的知识和对它的能力的了解看起来随着时间而慢慢被人淡忘。我认为这是标志着一个问题，由于对之前的解决方案缺乏了解，那些已经解决了几十年的问题又突然出现了。

shell、grep、sed 和 awk 是 Unix 的基础。如果你不能非常轻松的使用它们，你将会被自己束缚住，因为它们构成了通过命令行和脚本与 Unix 系统交互的基础。学习这些工具如何工作最好的方法之一就是观察真实的例子和实验，你可以在各种 Unix 衍生系统的初始化系统中找到很多，但在 Linux 发行版中它们已经被 [systemd][4] 取代了。 

数以百万计的 Unix 管理员了解 Shell 脚本和 Unix 工具如何读、写、修改和用在初始化脚本上。不同系统的初始化脚本有很大不同，甚至是不同的 Linux 发行版也不同。但是它们都源自 sh，而且它们都用像 sed、awk 还有 grep 这样的核心的命令行工具。

我每天都会听到很多人抱怨初始化脚本太“古老”而且很“难”。但是实际上，初始化脚本和 Unix 管理员每天使用的工具一样，还提供了一个非常好的方式来更加熟悉和习惯这些工具。说初始化脚本难于阅读和难于使用实际上是承认你缺乏对 Unix 基础工具的熟悉。

说起在 Reddit 上看到的内容，我也碰到过这个问题，来自一个新入行的 Linux 系统管理员, “[问他是否应该还要去学老式的初始化系统 sysvinit][5]”。 这个帖子的大多数的答案都是正面的——是的，应该学习 sysvinit 和 systemd 两个。一位评论者甚至指出，初始化脚本是学习 Bash 的好方法。而另一个消息是，Fortune 50 强的公司还没有计划迁移到以 systemd 为基础的发行版上。

但是，这提醒了我这确实是一个问题。如果我们继续沿着消除脚本和脱离操作系统核心组件的方式发展下去，由于疏于接触，我们将会不经意间使新管理员难于学习基本的 Unix 工具。

我不知道为什么有些人想在一层又一层的抽象化来掩盖 Unix 内部，但是这样发展下去可能会让新一代的系统管理员们变成只会按下按钮的工人。我觉得这不是一件好事情。

------

via: http://www.infoworld.com/article/2985804/linux/remember-sed-awk-linux-admins-should.html

作者：[Paul Venezia][a]
译者：[Bestony](https://github.com/Bestony)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.infoworld.com/author/Paul-Venezia/
[1]: https://www.reddit.com/r/linuxadmin/comments/3lwyko/how_do_i_remove_every_occurence_of_duplicate_line/
[2]: http://intro-to-awk.blogspot.com/2008/08/awk-more-complex-examples.html
[3]: http://www.infoworld.com/article/2613338/linux/linux-how-to-script-a-bash-crash-course.html
[4]: http://www.infoworld.com/article/2608798/data-center/systemd--harbinger-of-the-linux-apocalypse.html
[5]: https://www.reddit.com/r/linuxadmin/comments/3ltq2y/when_i_start_learning_about_linux_administration/
