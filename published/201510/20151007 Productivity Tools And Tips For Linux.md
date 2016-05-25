Linux 产能工具及其使用技巧
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Productivity-Tips-Linux.jpg)

由于生产力本身是一个主观术语，我不打算详细解释我这里要讲到的“生产力”是什么。我打算给你们展示一些工具及其使用技巧，希望这会帮助你在Linux中工作时能更专注、更高效，并且能节省时间。

### Linux产能工具及其使用技巧 ###

再次说明，我在写下本文时正在使用的是Ubuntu。但是，我将要在这里展示给大家产能工具及其使用技巧却适用于市面上的大多数Linux发行版。

#### 外界的音乐 ####

[音乐影响生产力][1]，这已经是一个公开的秘密了。从心理学家到管理大师，他们都一直在建议使用外界的杂音来让自己放松并专注于工作。我不打算就此进行辩论，因为这对于我确实有效。我戴上耳机，然后倾听着鸟叫声和风声，这确实让我很放松。

在Linux中，我使用ANoise播放器来播放外界的杂音。多亏了官方提供的PPA，你可以很容易地[安装Ambient Noise播放器到Ubuntu中][2]，以及其它基于Ubuntu的Linux发行版中。安装它，也可以让它离线播放外界的音乐。

另外，你也总可以在线听外界杂音。我最喜欢的在线外界音乐站点是[Noisli][3]。强烈推荐你试试这个。

#### 任务管理应用 ####

一个良好的生产习惯，就是制订一个任务列表。如果你将它和[番茄工作法][4]组合使用，那就可能创造奇迹了。这里我所说的是，创建一个任务列表，如果可能，将这些任务分配到特定的某个时间。这将会帮助你跟踪一天中计划好的任务。

对于此，我推荐[Go For It!][5]应用。你可以将它安装到所有主流Linux发行版中，由于它基于[ToDo.txt][6]，你也可以很容易地同步到你的智能手机中。我已经为此写了一个详尽的指南[如何使用Go For It!][7]。

此外，你可以使用[Sticky Notes][8]或者[Google Keep][9]。如果你需要某些更类似[Evernote][10]的功能，你可以使用这些[Evernote的开源替代品][11]。

#### 剪贴板管理器 ####

Ctrl+ C和Ctrl+V是我们日常计算机生活中不可缺少的一部分，它们唯一的不足之处在于，这些重要的活动不会被记住（默认情况下）。假如你拷贝了一些重要的东西，然后你意外地又拷贝了一些其它东西，你将丢失先前拷贝的东西。

剪贴板管理器在这种情况下会派上用场，它可以显示你最近拷贝（到剪贴板的）内容的历史记录，你可以从它这里将文本拷贝回到剪贴板中。

对于该目的，我更偏好[Diodon剪贴板管理器][12]。它处于活跃开发中，并且在Ubuntu的仓库中可以得到它。

#### 最近通知 ####

如果你正忙着处理其它事情，而此时一个桌面通知闪了出来又逐渐消失了，你会怎么做？你会想要看看通知都说了什么，不是吗？最近通知指示器就是用于处理此项工作，它会保留一个最近所有通知的历史记录。这样，你就永远不会错过桌面通知了。

你可以在此阅读[最近通知指示器][13]。

#### 终端技巧 ####

不，我不打算给你们展示所有那些Linux命令技巧和快捷方法，那会写满整个博客了。我打算给你们展示一些终端黑技巧，你可以用它们来提高你的生产力。

- **修改**sudo**密码超时**：默认情况下，sudo命令要求你在15分钟后再次输入密码，这真是让人讨厌。实际上，你可以修改默认的sudo密码超时。[此教程][14]会给你展示如何来实现。
- **获取命令完成的桌面通知**：这是IT朋友们之间的一个常见的玩笑——开发者们花费大量时间来等待程序编译完成——然而这不完全是正确的。但是，它确实影响到了生产力，因为在你等待程序编译完成时，你可以做其它事情，并忘了你在终端中运行的命令。一个更好的途径，就是在一个命令完成时，让它显示桌面通知。这样，你就不会长时间被打断，并且可以回到之前想要做的事情上。请阅读[如何获取命令完成的桌面通知][15]。

我知道，这不是一篇全面涵盖了**提升生产力**的文章。但是，这些小应用和小技巧可以在实际生活中帮助你在你宝贵的时间中做得更多。

现在，该轮到你们了。在Linux中，你使用了什么程序或者技巧来提高生产力呢？有哪些东西你想要和社区分享呢？

--------------------------------------------------------------------------------

via: http://itsfoss.com/productivity-tips-ubuntu/

作者：[Abhishek][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://www.helpscout.net/blog/music-productivity/
[2]:https://linux.cn/article-5233-1.html
[3]:http://www.noisli.com/
[4]:https://en.wikipedia.org/wiki/Pomodoro_Technique
[5]:http://manuel-kehl.de/projects/go-for-it/
[6]:http://todotxt.com/
[7]:https://linux.cn/article-5337-1.html
[8]:http://itsfoss.com/indicator-stickynotes-windows-like-sticky-note-app-for-ubuntu/
[9]:https://linux.cn/article-2634-1.html
[10]:https://evernote.com/
[11]:http://itsfoss.com/5-evernote-alternatives-linux/
[12]:https://esite.ch/tag/diodon/
[13]:http://itsfoss.com/7-best-indicator-applets-for-ubuntu-13-10/
[14]:http://itsfoss.com/change-sudo-password-timeout-ubuntu/
[15]:http://itsfoss.com/notification-terminal-command-completion-ubuntu/
