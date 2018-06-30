让我们从 GitHub 中迁移出来
======

正如你们之前听到的那样，[微软收购了 GitHub][1]。这对 GitHub 的未来意味着什么尚不清楚，但 [Gitlab 的人][2]认为微软的最终目标是将 GitHub 整合到他们的 Azure 帝国。对我来说，这很有道理。

尽管我仍然不情愿地将 GitHub 用于某些项目，但我前一段时间将所有个人仓库迁移到了 Gitlab 中。现在是时候让你做同样的事情，并抛弃 GitHub。

![Microsft loven't Linux][3]

有些人可能认为微软的收购没有问题，但对我来说，这是压垮骆驼的最后一根稻草。几年来，微软一直在开展一场关于他们如何热爱 Linux 的大型营销活动，并突然决定用所有它的形式拥抱自由软件。更像 MS BS 给我​​的。

让我们花点时间提醒自己：

* Windows 仍然是一个巨大的专有怪物，数十亿人每天都丧失了他们的隐私和权利中。
* 微软公司（曾经）以传播自由软件的“危害”闻名，以防止政府和学校放弃 Windows，转而支持 FOSS。
* 为了确保他们的垄断地位，微软通过向全世界的小学颁发“免费”许可证来吸引孩子使用 Windows。毒品经销商使用相同的策略并提供免费样品来获取新客户。
* 微软的 Azure 平台 - 即使它可以运行 Linux 虚拟机 - 它仍然是一个巨大的专有管理程序。

我知道移动 git 仓库看起来像是一件痛苦的事情，但是 Gitlab 的员工正在乘着人们离开 GitHub 的浪潮，并通过[提供 GitHub 导入器][4]使迁移变得容易。

如果你不想使用 Gitlab 的主实例（[gitlab.org][5]），下面是另外两个你可以用于自由软件项目的备选实例：

* [Debian Gitlab 实例][6]适用于每个 FOSS 项目，它不仅适用于与 Debian 相关的项目。只要项目符合 [Debian 自由软件指南][7]，你就可以使用该实例及其 CI。
* Riseup 为名为 [0xacab][8] 的激进项目维护了一个 Gitlab 实例。如果你的[理念与 Riseup 的一致][9]，他们很乐意在那里托管你的项目。

朋友不要再让人使用 Github 了。

--------------------------------------------------------------------------------

via: https://veronneau.org/lets-migrate-away-from-github.html

作者：[Louis-Philippe Véronneau][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://veronneau.org/
[1]:https://www.bloomberg.com/news/articles/2018-06-03/microsoft-is-said-to-have-agreed-to-acquire-coding-site-github
[2]:https://about.gitlab.com/2018/06/03/microsoft-acquires-github/
[3]:https://veronneau.org/media/blog/2018-06-03/ms-lovent-linux.png (Microsoft loven't Linux)
[4]:https://docs.gitlab.com/ee/user/project/import/github.html
[5]:https://gitlab.org
[6]:https://salsa.debian.org
[7]:https://en.wikipedia.org/wiki/Debian_Free_Software_Guidelines
[8]:https://0xacab.org
[9]:https://riseup.net/en/about-us/politics
