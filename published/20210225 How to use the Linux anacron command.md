[#]: subject: (How to use the Linux anacron command)
[#]: via: (https://opensource.com/article/21/2/linux-automation)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13270-1.html)

如何使用 Linux anacron 命令
======

> 与其手动执行重复性的任务，不如让 Linux 为你做。

![](https://img.linux.net.cn/data/attachment/album/202104/06/084133bphrxxeolhoyqr0o.jpg)

在 2021 年，人们有更多的理由喜欢 Linux。在这个系列中，我将分享使用 Linux 的 21 个不同理由。自动化是使用 Linux 的最佳理由之一。

我最喜欢 Linux 的一个原因是它愿意为我做工作。我不想执行重复性的任务，这些任务会占用我的时间，或者容易出错，或者我可能会忘记，我安排 Linux 为我做这些工作。

### 为自动化做准备

“自动化”这个词既让人望而生畏，又让人心动。我发现用模块化的方式来处理它是有帮助的。

#### 1、你想实现什么？

首先，要知道你想产生什么结果。你是要给图片加水印吗？从杂乱的目录中删除文件？执行重要数据的备份？为自己明确定义任务，这样你就知道自己的目标是什么。如果有什么任务是你发现自己每天都在做的，甚至一天一次以上，那么它可能是自动化的候选者。

#### 2、学习你需要的应用

将大的任务分解成小的组件，并学习如何手动但以可重复和可预测的方式产生每个结果。在 Linux 上可以做的很多事情都可以用脚本来完成，但重要的是要认识到你当前的局限性。学习如何自动调整几张图片的大小，以便可以方便地通过电子邮件发送，与使用机器学习为你的每周通讯生成精心制作的艺术品之间有天壤之别。有的事你可以在一个下午学会，而另一件事可能要花上几年时间。然而，我们都必须从某个地方开始，所以只要从小做起，并时刻注意改进的方法。

#### 3、自动化

在 Linux 上使用一个自动化工具来定期实现它。这就是本文介绍的步骤!

要想自动化一些东西，你需要一个脚本来自动化一个任务。在测试时，最好保持简单，所以本文自动化的任务是在 `/tmp` 目录下创建一个名为 `hello` 的文件。

```
#!/bin/sh

touch /tmp/hello
```

将这个简单的脚本复制并粘贴到一个文本文件中，并将其命名为 `example`。

### Cron

每个安装好的 Linux 系统都会有的内置自动化解决方案就是 cron 系统。Linux 用户往往把 cron 笼统地称为你用来安排任务的方法（通常称为 “cron 作业”），但有多个应用程序可以提供 cron 的功能。最通用的是 [cronie][2]；它的优点是，它不会像历史上为系统管理员设计的 cron 应用程序那样，假设你的计算机总是开着。

验证你的 Linux 发行版提供的是哪个 cron 系统。如果不是 cronie，你可以从发行版的软件仓库中安装 cronie。如果你的发行版没有 cronie 的软件包，你可以使用旧的 anacron 软件包来代替。`anacron` 命令是包含在 cronie 中的，所以不管你是如何获得它的，你都要确保在你的系统上有 `anacron` 命令，然后再继续。anacron 可能需要管理员 root 权限，这取决于你的设置。

```
$ which anacron
/usr/sbin/anacron
```

anacron 的工作是确保你的自动化作业定期执行。为了做到这一点，anacron 会检查找出最后一次运行作业的时间，然后检查你告诉它运行作业的频率。

假设你将 anacron 设置为每五天运行一次脚本。每次你打开电脑或从睡眠中唤醒电脑时，anacron都会扫描其日志以确定是否需要运行作业。如果一个作业在五天或更久之前运行，那么 anacron 就会运行该作业。

### Cron 作业

许多 Linux 系统都捆绑了一些维护工作，让 cron 来执行。我喜欢把我的工作与系统工作分开，所以我在我的主目录中创建了一个目录。具体来说，有一个叫做 `~/.local` 的隐藏文件夹（“local” 的意思是它是为你的用户账户定制的，而不是为你的“全局”计算机系统定制的），所以我创建了子目录 `etc/cron.daily` 来作为 cron 在我的系统上的家目录。你还必须创建一个 spool 目录来跟踪上次运行作业的时间。

```
$ mkdir -p ~/.local/etc/cron.daily ~/.var/spool/anacron
```

你可以把任何你想定期运行的脚本放到 `~/.local/etc/cron.daily` 目录中。现在把 `example` 脚本复制到目录中，然后 [用 chmod 命令使其可执行][3]。

```
$ cp example ~/.local/etc/cron.daily
# chmod +x ~/.local/etc/cron.daily/example
```

接下来，设置 anacron 来运行位于 `~/.local/etc/cron.daily` 目录下的任何脚本。

### anacron

默认情况下，cron 系统的大部分内容都被认为是系统管理员的领域，因为它通常用于重要的底层任务，如轮换日志文件和更新证书。本文演示的配置是为普通用户设置个人自动化任务而设计的。

要配置 anacron 来运行你的 cron 作业，请在 `/.local/etc/anacrontab` 创建一个配置文件：

```
SHELL=/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin
1  0  cron.mine    run-parts /home/tux/.local/etc/cron.daily/
```

这个文件告诉 anacron 每到新的一天（也就是每日），延迟 0 分钟后，就运行（`run-parts`）所有在 `~/.local/etc/cron.daily` 中找到的可执行脚本。有时，会使用几分钟的延迟，这样你的计算机就不会在你登录后就被所有可能的任务冲击。不过这个设置适合测试。

`cron.mine` 值是进程的一个任意名称。我称它为 `cron.mine`，但你也可以称它为 `cron.personal` 或 `penguin` 或任何你想要的名字。

验证你的 `anacrontab` 文件的语法：

```
$ anacron -T -t ~/.local/etc/anacrontab \
  -S /home/tux/.var/spool/anacron
```

沉默意味着成功。

### 在 .profile 中添加 anacron

最后，你必须确保 anacron 以你的本地配置运行。因为你是以普通用户而不是 root 用户的身份运行 anacron，所以你必须将它引导到你的本地配置：告诉 anacron 要做什么的 `anacrontab` 文件，以及帮助 anacron 跟踪每一个作业最后一次执行是多少天的 spool 目录：

```
anacron -fn -t /home/tux/.local/etc/anacrontab \
  -S /home/tux/.var/spool/anacron
```

`-fn` 选项告诉 anacron *忽略* 时间戳，这意味着你强迫它无论如何都要运行你的 cron 作业。这完全是为了测试的目的。

### 测试你的 cron 作业

现在一切都设置好了，你可以测试作业了。从技术上讲，你可以在不重启的情况下进行测试，但重启是最有意义的，因为这就是设计用来处理中断和不规则的登录会话的。花点时间重启电脑、登录，然后寻找测试文件：

```
$ ls /tmp/hello
/tmp/hello
```

假设文件存在，那么你的示例脚本已经成功执行。现在你可以从 `~/.profile` 中删除测试选项，留下这个作为你的最终配置。

```
anacron -t /home/tux/.local/etc/anacrontab \
  -S /home/tux/.var/spool/anacron
```

### 使用 anacron

你已经配置好了你的个人自动化基础设施，所以你可以把任何你想让你的计算机替你管理的脚本放到 `~/.local/etc/cron.daily` 目录下，它就会按计划运行。

这取决于你希望作业运行的频率。示例脚本是每天执行一次。很明显，这取决于你的计算机在任何一天是否开机和醒着。如果你在周五使用电脑，但把它设置在周末，脚本就不会在周六和周日运行。然而，在周一，脚本会执行，因为 anacron 会知道至少有一天已经过去了。你可以在 `~/.local/etc` 中添加每周、每两周、甚至每月的目录，以安排各种各样的间隔。

要添加一个新的时间间隔：

  1. 在 `~/.local/etc` 中添加一个目录（例如 `cron.weekly`）。
  2. 在 `~/.local/etc/anacrontab` 中添加一行，以便在新目录下运行脚本。对于每周一次的间隔，其配置如下。`7 0 cron.mine run-parts /home/tux/.local/etc/cron.weekly/`（`0` 的值可以选择一些分钟数，以适当地延迟脚本的启动）。
  3. 把你的脚本放在 `cron.weekly` 目录下。

欢迎来到自动化的生活方式。它不会让人感觉到，但你将会变得更有效率。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-automation

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://github.com/cronie-crond/cronie
[3]: https://opensource.com/article/19/8/linux-chmod-command
