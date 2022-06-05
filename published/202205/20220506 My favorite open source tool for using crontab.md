[#]: subject: "My favorite open source tool for using crontab"
[#]: via: "https://opensource.com/article/22/5/cron-crontab-ui"
[#]: author: "Kevin Sonney https://opensource.com/users/ksonney"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14598-1.html"

管理 crontab 的开源工具
======

![](https://img.linux.net.cn/data/attachment/album/202205/16/100309tw6wgx3sss36wl6r.jpg)

> crontab-ui 是一个用 Node.js 编写的 Web 前端，帮助管理 crontab 文件。

*自动化是目前的一个热门话题。在我作为网站可靠性工程师（SRE）的日常工作中，我的部分职责是将尽可能多的重复性任务自动化。但是，有多少人在我们的日常非工作生活中这样做呢？今年，我专注于将劳作自动化，以便我们可以专注于重要的事情。*

作为一个初出茅庐的系统管理员，我最早了解的东西之一是 “cron”。cron 被广泛用于做一些事情，如轮换日志、启动和停止服务、运行程序作业等等。它在几乎所有的 Unix 和 Linux 系统中都可用，而且是我认识的每个系统管理员用来帮助管理服务和服务器的东西。cron 可以自动运行任何控制台应用或脚本，这使得它非常、非常灵活。

> LCTT 译注：CRON 是 “Command Run On” 的缩写，即在某个时间运行命令。

![Image of a Crontab][3]

我用 cron 来获取电子邮件，运行过滤程序，确保服务正在运行，与 Habitica 等在线游戏互动等。

### 以传统方式使用 cron

要开始使用 cron，你可以简单地在命令行输入 `crontab -e`，启动一个打开了当前 `crontab`（“cron table” 的缩写）文件的编辑器（如果你以 root 身份这样做，你访问的是系统 crontab）。这是保存作业计划的地方，记录了何时运行。David Both 已经写了 [大量][4] 关于该文件的格式和如何使用它的文章，所以我不打算在这里介绍。我要说的是，对于新用户来说，这可能有点吓人，而且设置时间有点痛苦。

### 介绍 crontab-ui

有一些奇妙的工具可以帮助解决这个问题。我最喜欢的是 [crontab-ui][5]，这是一个用 Node.js 编写的 Web 前端，可以帮助管理 crontab 文件。为了安装和启动 `crontab-ui` 供个人使用，我使用了以下命令。

```
# 做个备份
crontab -l > $HOME/crontab-backup
# 安装 Crontab UI
npm install -g crontab-ui
# 创建本地数据库目录
mkdir $HOME/crontab-ui
# 启动 crontab-ui
CRON_DB_PATH=$HOME/crontab-ui crontab-ui
```

完成这些后，只需将你的网页浏览器指向 `http://localhost:8000`，你就会看到 crontab-ui 的网页界面。要做的第一件事是点击 “<ruby>从 Crontab 获取<rt>Get from Crontab</rt></ruby>”，加载你可能有的任何现有作业。然后点击“<ruby>备份<rt>Backup</rt></ruby>”，这样你就可以回滚你所做的任何修改。

![Image of Crontab-UI][6]

添加和编辑 cron 作业是非常简单的。添加一个名称，你想运行的完整命令，以及时间（使用 cron 语法），然后保存。另外，你还可以捕获日志，并设置将工作状态邮寄到你选择的电子邮箱。

完成后，点击 “<ruby>保存到 Crontab<rt>Save to Crontab</rt></ruby>”。

我个人非常喜欢它的日志记录功能。有了 crontab-ui，你可以通过点击一个按钮来查看日志，这在排除故障时非常有用。

我建议不要一直运行 crontab-ui，至少不要公开运行。虽然它确实具有一些基本的身份验证功能，但它不应该暴露在你的本地机器之外。我不需要经常编辑我的 cron 作业，所以我可以按需启动和停止它。

下次你需要编辑你的 crontab 时，可以试试 crontab-ui！

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/cron-crontab-ui

作者：[Kevin Sonney][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png
[2]: https://creativecommons.org/licenses/by/3.0/us/
[3]: https://opensource.com/sites/default/files/2022-04/Day01-1.png
[4]: https://opensource.com/article/17/11/how-use-cron-linux
[5]: https://opensource.com/%5Bhttps%3A//github.com/alseambusher/crontab-ui%5D%28https%3A//github.com/alseambusher/crontab-ui%29
[6]: https://opensource.com/sites/default/files/2022-04/Day01-2.png
