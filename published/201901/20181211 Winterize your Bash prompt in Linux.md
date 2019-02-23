[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10450-1.html)
[#]: subject: (Winterize your Bash prompt in Linux)
[#]: via: (https://opensource.com/article/18/12/linux-toy-bash-prompt)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

在 Linux 中打扮你的冬季 Bash 提示符
======

> 你的 Linux 终端可能支持 Unicode，那么为何不利用它在提示符中添加季节性的图标呢？

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-bash-prompt.png?itok=HK_kVn37)

欢迎再次来到 Linux 命令行玩具日历的另一篇。如果这是你第一次访问该系列，你甚至可能会问自己什么是命令行玩具？我们对此比较随意：它会是终端上有任何有趣的消遣，对于任何节日主题相关的还有额外的加分。

也许你以前见过其中的一些，也许你没有。不管怎样，我们希望你玩得开心。

今天的玩具非常简单：它是你的 Bash 提示符。你的 Bash 提示符？是的！我们还有几个星期的假期可以盯着它看，在北半球冬天还会再多几周，所以为什么不玩玩它。

目前你的 Bash 提示符号可能是一个简单的美元符号（ `$`），或者更有可能是一个更长的东西。如果你不确定你的 Bash 提示符是什么，你可以在环境变量 `$PS1` 中找到它。要查看它，请输入：

```
echo $PS1
```

对于我而言，它返回：

```
[\u@\h \W]\$
```

`\u`、`\h` 和 `\W` 分别是用户名、主机名和工作目录的特殊字符。你还可以使用其他一些符号。为了帮助构建你的 Bash 提示符，你可以使用 [EzPrompt][1]，这是一个 `PS1` 配置的在线生成器，它包含了许多选项，包括日期和时间、Git 状态等。

你可能还有其他变量来组成 Bash 提示符。对我来说，`$PS2` 包含了我命令提示符的结束括号。有关详细信息，请参阅 [这篇文章][2]。

要更改提示符，只需在终端中设置环境变量，如下所示：

```
$ PS1='\u is cold: '
jehb is cold:
```

要永久设置它，请使用你喜欢的文本编辑器将相同的代码添加到 `/etc/bashrc` 中。

那么这些与冬季化有什么关系呢？好吧，你很有可能有现代一下的机器，你的终端支持 Unicode，所以你不仅限于标准的 ASCII 字符集。你可以使用任何符合 Unicode 规范的 emoji，包括雪花 ❄、雪人 ☃ 或一对滑雪板 🎿。你有很多冬季 emoji 可供选择。

```
🎄 圣诞树
🧥 外套
🦌 鹿
🧤 手套
🤶 圣诞夫人
🎅 圣诞老人
🧣 围巾
🎿 滑雪者
🏂 滑雪板
❄ 雪花
☃ 雪人
⛄ 没有雪的雪人
🎁 包装好的礼物
```

选择你最喜欢的，享受冬天的欢乐。有趣的事实：现代文件系统也支持文件名中的 Unicode 字符，这意味着技术上你可以将你下个程序命名为 `❄❄❄❄❄.py`。只是说说，不要这么做。

你有特别喜欢的命令行小玩具需要我介绍的吗？这个系列要介绍的小玩具大部分已经有了落实，但还预留了几个空位置。如果你有特别想了解的可以评论留言，我会查看的。如果还有空位置，我会考虑介绍它的。如果没有，但如果我得到了一些很好的意见，我会在最后做一些有价值的提及。

查看昨天的玩具，[在 Linux 终端玩贪吃蛇][3]，记得明天再来！

--------------------------------------------------------------------------------
via: https://opensource.com/article/18/12/linux-toy-bash-prompt

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: http://ezprompt.net/
[2]: https://access.redhat.com/solutions/505983
[3]: https://opensource.com/article/18/12/linux-toy-snake
