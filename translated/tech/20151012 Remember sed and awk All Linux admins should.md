
# 学会Sed和Awk? 所有的Linux管理员都应该会的技能

![](http://images.techhive.com/images/article/2015/03/linux-100573790-primary.idge.jpg)

图片来源: Shutterstock

**我们不希望下一代Linux和Unix的管理员忘记任何初始化脚本和基本工具的好处**

我曾经有一次在Reddit发表文章的机会， [asking about textfile manipulation][1].这是一个很简单请求，就像我们平时常用Unix的人所见到的。他的问题是，如何删除文件中的重复行，并保存在独立的实例里。 这听起来似乎很简单，但是当文件足够大时，就会有些复杂。

这个问题有很多种不同的答案。我怀疑你可以使用几乎任何一种语言来写这样的一个脚本，只是时间的投入和代码的复杂性不同罢了。根据你的个人水平，它大概会花费20-60分钟。但是如果你使用了Perl,Python,Ruby中的一种，你可能很快实现它。

或者你可以使用下面的一个方法，让你无比暖心的: 只用 awk.

这个答案是迄今为止最简明、最简单的解决问题的方法。他只要一行：

``` 
awk '!seen[$0]++' <filename>. 
```

让我们来分析一下

在这段代码中，其实隐藏了很多代码。AWK是一种文本处理语言，并且他内部做了大量的假设。首先，你看到的实际上是一个循环的结果。Awk假定你想通过循环输入文件的每一行，所以你不需要明确的去设定它。Awk还假定了你需要打印数据的输出，所以你也不需要去指定它。最好，Awk假定循环在最后一句话执行完结束，这一块也不再需要你去指定它

这个例子中看到的字符串是一个关联的数组的名字。$0是一个变量，表示当前行的全部。所以，这个命令翻译成话就是“对这个文件的每一行进行检查，如果你之前没有见过他，就打印出来。”Awk通过做这些来看这个数组是否早已存在或值不相等的，这样就不匹配参数，下次就不会再打印了。

一些人认为这样是优雅的，另外的人认为这可能会造成混淆。任何在日常基础事情上使用Awk的都是第一类人。Awk就是被设计做这个的。在Awk中，你可以写多行。甚至是一些复杂的功能。你甚至可以[用awk写一些让人不安的复杂功能][2]。但，最终，Awk还是一个通过管道进行文字处理的程序。去除循环定义的外部缺陷是很常见的用法，你可以用下面的代码做同样的事情



``` 
awk '{ if (!seen[$0]) print $0; seen[$0]++ }’ 
```

这必将导致相同的结果

Awk是完成这项工作的完美工具。不过，我相信很多管理员--特别是新管理员会跳转到[Bash][ 3 ]或Python来完成这一任务,因为Awk的知识和他所能做的事情总是随着时间而褪色。我认为这是一个标识性的事情。几十年来，以前的解决方案总是缺乏对新的问题的处理方法

The shell, grep, sed, and awk 是Unix的计算基础.如果你不能非常轻松的使用他们，你将会变得十分脆弱。因为他们通过命令行和脚本的相互作用来实现。学习这些工具如何工作最好的方法之一就是观察和正在运行的范例一起工作，通过Unix系统特有的Init系统，或者在Linux发行版被称为 [systemd][4]. 

数以百万计的Unix管理员了解Shell脚本和Unix工具同读、写、修改和研究Init脚本。不同系统的Init脚本有很大不同，甚至是不同的发行版。但是他们都源自sh，而且他他们都用核心命令行工具像sed,awk还有grep

我每天都会挺到很多抱怨init脚本太“古老”而且很“难”。但是实际上，Init脚本和Unix管理员每天使用的工具一样，而且还提供了一个非常好的方式来更加熟悉和习惯这些工具。说Init脚本难的应该承认，你缺乏对Unix基础工具的熟悉。

说起在Reddit上的事情，我也碰到过这个问题，从一个初露头角的Linux系统管理员, [问他是否应该去学Sysvinit][5]. 大多数的答案都是好的方向--是的，应该学习sysvinit和systemd.一位评论者甚至指出，Init脚本是学习Bash的好方法。而另一个国家50强的公司不会搬到一个以系统为基础的发行版

但是，这提醒了我这是一个问题。如果我们继续沿着消除脚本和脱离我们操作系统的系统核心组件。由于出现的太少，我们将会不经意间的使新的管理员学习基本的Unix工具变得更难

我不知道为什么有些人想掩盖Unix内核抽象化和反抽象化，但是这样的一条路径可以减少一代Unix管理员出事后对服务支持的依赖。我相信这不是一件好事情。

------

via: http://www.infoworld.com/article/2985804/linux/remember-sed-awk-linux-admins-should.html

作者：[Paul Venezia][a]

译者：[Bestony](https://github.com/Bestony)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.infoworld.com/author/Paul-Venezia/
[1]: https://www.reddit.com/r/linuxadmin/comments/3lwyko/how_do_i_remove_every_occurence_of_duplicate_line/
[2]: http://intro-to-awk.blogspot.com/2008/08/awk-more-complex-examples.html
[3]: http://www.infoworld.com/article/2613338/linux/linux-how-to-script-a-bash-crash-course.html
[4]: http://www.infoworld.com/article/2608798/data-center/systemd--harbinger-of-the-linux-apocalypse.html
[5]: https://www.reddit.com/r/linuxadmin/comments/3ltq2y/when_i_start_learning_about_linux_administration/
