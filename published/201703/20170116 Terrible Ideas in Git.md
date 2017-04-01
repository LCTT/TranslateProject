Git 中的那些可怕的事
============================================================


![Corey Quinn](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/corey-quinn-lcna.png) 

在 LinuxCon 北美会议上 FutureAdvisor 的 Corey Quinn 说：“Git 的确让你可以做一些超级强大的事。‘强大’，在这次讲演中，这是一种说你愚蠢的委婉说法”。在使用 Git 时，谁没有经历让你感觉自己像个傻子的时刻？当然，Git 是很棒的，每个人都在使用它，你可以用几个基本命令完成你的大部分工作。但它也有一些强大的功能，让我们觉得我们不知道我们在做什么。

但这真的对我们来说不公平。没有人会知道一切，每个人知道的都不同。Quinn 提醒我们：“在我许多讲演的问答部分，人们有时举手说：“嗯，我有一个傻问题。” 你看到人们在那里说：“是啊！这是一个非常愚蠢的问题”。但是当他们得到答案时，那些这么说的人也正在低头记笔记。

![Git](https://www.linux.com/sites/lcom/files/styles/floated_images/public/heffalump-git-corey-quinn_0.png) 

Quinn 在演讲的开始做了一些有趣的演示，演示了一些你可以用 Git 做到的可怕的事情，例如变基主干然后进行强制推送来搞乱整个项目、胡乱输入一些命令让 git 吐槽、提交大型二进制文件等。然后他演示了如何使这些可怕的事情不怎么可怕，如更加明智地管理大型二进制文件。“你可以提交大型二进制文件，你可以在 Git 中暴力提交，如果你需要存储大的二进制文件，这里有两个工具会可以加速载入，一个是 git-annex，这是由 Debian 开发人员 Joey Hess 开发的，而 git-lfs 是由 GitHub 支持的。”

你经常同样地错误输入么？例如，当你想要 `git status` 时却输入 `git stitis`？Quinn 有一个方案：“Git 有内置的别名支持，所以你可以将相对较长、复杂的东西命名为一个短的 Git 命令。” 此外，你还可以使用 shell 别名。

Quinn 说：“我们都听说过变基主干然后强制推送这样的搞笑恶作剧，它会改变版本历史，突然发生的事情让所有人都措手不及，每个人都被卷入了这种混乱当中。一群鲸鱼被称为“pod”，一群乌鸦中被称为“谋杀”，一群开发者被称为“合并冲突”……更严重的是，如果有人干了这种事情，你有几个选择。包括从备份中恢复主干，还原提交；或者把责任人从屋顶上尖叫着扔下去。或者，采取一定的预防措施并使用一个并不知名的 Git 功能称为分支保护。启用分支保护后，无法删除或强制推送分支，并且在接受前，拉取请求（pull request）必须至少有一个审核。”

Quinn 演示了几个更奇妙的有用的工具，使 Git 更高效和万无一失，如 mr、vcsh 和定制的 shell 提示。你可以在下面看到完整的视频，了解更多有趣的事情。

--------------------------------------------------------------------------------

via: https://www.linux.com/news/event/LinuxCon-Europe/2016/terrible-ideas-git-0

作者：[CARLA SCHRODER][a]
译者：[geekpi](https://github.com/geekpi)
校对：[Bestony](https://github.com/Bestony)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/linux-foundation
[3]:https://www.linux.com/files/images/heffalump-git-corey-quinnpng-0
[4]:https://www.linux.com/files/images/corey-quinn-lcnapng
[5]:http://events.linuxfoundation.org/events/linuxcon-north-america
