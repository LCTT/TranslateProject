Git 中糟糕的想法
============================================================


 ![Corey Quinn](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/corey-quinn-lcna.png?itok=IU3oGzfn "Corey Quinn") 
在 LinuxCon 北美会议上 FutureAdvisor 的 Corey Quinn 说：“Git 的确让你可以做一些额外的强大的事。在这次谈论中，强大是愚蠢的委婉说法” [Linux 基金会][2]

在 LinuxCon 北美会议上 FutureAdvisor 的 Corey Quinn 说：“Git 的确让你可以做一些额外的强大的事。在这次谈论中，强大是愚蠢的委婉说法”。在使用 Git 时，谁没有至少经历一个时刻让你感觉像个傻子？当然，Git 是很棒的，每个人都在使用它，你可以用几个基本命令完成你的大部分工作。但它也有强大的力量，让我们觉得我们不知道我们在做什么。

但这真的对我们自己不公平。没有人知道一切，每个人知道的都不同。Quinn 提醒我们：“在我许多谈话的 QA 时，人们有时举手说：“嗯，我有一个傻问题。” 你看到人们在那里说：“是啊！这是一个非常愚蠢的问题”。但是当他们得到答案时，这些人正在大量记笔记。

![Git](https://www.linux.com/sites/lcom/files/styles/floated_images/public/heffalump-git-corey-quinn_0.png?itok=xh5JlnLW "Git") 

[有权限使用][1]

Quinn 开始了一些有趣的演示，你可以用 Git 做一些可怕的事情，例如 rebase master 然后进行强制推送搞乱整个项目、输入错误命令并收到 git 提示、提交大型二进制文件等。然后他演示了如何使这些可怕的事情不怎么可怕，如更加明智地管理大型二进制文件。“你可以提交大的二进制文件，你可以在 Git 中提交大文件，如果你需要存储大的二进制文件，这里有两个工具会真的加快加载，一个是 git-annex，这是由 Debian 开发人员 Joey Hess 开发的，而 git-lfs 是由 GitHub 支持的。

你有连续输入错误么？例如，当你想要 “git status” 时却输入 “git stitis”？Quinn 有一个方案：“Git 确实对别名有内置支持，所以你可以使用相对较长、复杂的东西，并把它命名为一个短的 Git 命令。” 你还可以使用 shell 别名。

Quinn 说：“我们都听说过 rebase master 然后强制推送，这样一个给你所有同事的搞笑恶作剧，它会改变历史，所以突然之前发生的事情并不是人们真正在做的事，而且其他人都被卷入了这个过程。。一群鲸鱼被称为“pod”，一群乌鸦中被称为“谋杀”，一群开发者被称为“合并冲突”。。。更严重的是，如果有人这样做，你有几个选择。包括从备份中恢复 master，还原提交，或者把责任人从屋顶扔下去。或者，采取一定的预防措施并使用一个并不知名的 Git 功能称为分支保护。启用分支保护后，无法删除或强制推送分支，并且在接受前，请求必须至少有一个审核。”

Quinn 演示了几个更奇妙的有用工具，使 Git 更高效和万无一失，如 mr、vcsh和定制的 shell 提示。你可以在下面看到完整的视频，并享受更多的傻笑话。

--------------------------------------------------------------------------------

via: https://www.linux.com/news/event/LinuxCon-Europe/2016/terrible-ideas-git-0

作者：[CARLA SCHRODER][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/linux-foundation
[3]:https://www.linux.com/files/images/heffalump-git-corey-quinnpng-0
[4]:https://www.linux.com/files/images/corey-quinn-lcnapng
[5]:http://events.linuxfoundation.org/events/linuxcon-north-america
