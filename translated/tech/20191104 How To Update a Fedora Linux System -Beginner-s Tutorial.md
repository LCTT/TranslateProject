[#]: collector: (lujun9972)
[#]: translator: (Morisun029)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Update a Fedora Linux System [Beginner’s Tutorial])
[#]: via: (https://itsfoss.com/update-fedora/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

如何更新 Fedora Linux 系统[入门教程]
======

_**本快速教程介绍了更新 Fedora Linux 安装的多种方法。**_


前几天，我安装了[新发布的 Fedora 31][1]。老实说，这是我第一次使用[非 Ubuntu 发行版][2]。

安装 Fedora 之后，我做的第一件事就是尝试安装一些软件。 我打开软件中心，发现该软件中心已“损坏”。 我无法从中安装任何应用程序。

我不确定我的安装出了什么问题。 在团队内部讨论时，Abhishek 建议我先更新系统。 我更新了， 更新后一切恢复正常。 更新[Fedora][3]系统后，软件中心也能正常工作了。

有时我们只是忽略了对系统的更新，而继续对我们所面临的问题进行故障排除。 不管问题有多大或多小，为了避免它们，你都应该保持系统更新。

在本文中，我将向你展示更新Fedora Linux系统的多种方法。

  * [使用软件中心更新 Fedora][4]
  * [使用命令行更新 Fedora][5]
  * [从系统设置更新 Fedora][6]



请记住，更新 Fedora 意味着安装安全补丁，更新内核和软件。 如果要从 Fedora 的一个版本更新到另一个版本，这称为版本升级，你可以[在此处阅读有关 Fedora 版本升级过程的信息][7]。

### 从软件中心更新 Fedora

![软件中心][8]

您很可能会收到通知，通知您有一些系统更新需要查看，您应该在单击该通知时启动软件中心。

您所要做的就是–点击“更新”，并验证 root 密码开始更新。

如果您没有收到更新的通知，则只需启动软件中心并转到“更新”选项卡即可。 现在，您只需要继续更新。

### 使用终端更新 Fedora

如果由于某种原因无法加载软件中心，则可以使用dnf 软件包管理命令轻松地更新系统。
只需启动终端并输入以下命令即可开始更新（系统将提示你确认root密码）：


```
sudo dnf upgrade
```

**dnf 更新 vs dnf 升级 
**
你会发现有两个可用的 dnf 命令：dnf 更新和 dnf 升级。 这两个命令执行相同的工作，即安装 Fedora 提供的所有更新。 那么，为什么要会有 dnf 更新和 dnf 升级，你应该使用哪一个呢？ dnf 更新基本上是 dnf 升级的别名。 尽管 dnf 更新可能仍然有效，但最好使用 dnf 升级，因为这是真正的命令。

### 从系统设置中更新 Fedora

![][9]

如果其它方法都不行（或者由于某种原因已经进入系统设置），请导航至设置底部的“详细信息”选项。

如上图所示，改选项中显示操作系统和硬件的详细信息以及一个“检查更新”按钮，如上图中所示。 您只需要单击它并提供root / admin密码即可继续安装可用的更新。


**总结**

如上所述，更新Fedora安装非常容易。 有三种方法供你选择，因此无需担心。

如果你按上述说明操作时发现任何问题，请随时在下面的评论部分告诉我。


--------------------------------------------------------------------------------

via: https://itsfoss.com/update-fedora/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[Morisun029](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/fedora-31-release/
[2]: https://itsfoss.com/non-ubuntu-beginner-linux/
[3]: https://getfedora.org/
[4]: tmp.Lqr0HBqAd9#software-center
[5]: tmp.Lqr0HBqAd9#command-line
[6]: tmp.Lqr0HBqAd9#system-settings
[7]: https://itsfoss.com/upgrade-fedora-version/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/11/software-center.png?ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/11/system-settings-fedora-1.png?ssl=1
