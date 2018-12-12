Emacs 系列（四）：使用 Org 模式自动管理邮件及同步文档
======

这是 [Emacs 和 Org 模式系列][4]的第四篇。

至今为止，你已经见识到了 Org 模式的强大和高效，如果你像我一样，你可能会想：

> “我真的很想让它在我所有的设备上同步。”

或者是说：

> “我能在 Org 模式中转发邮件吗？”

答案当然是肯定的，因为这就是 Emacs。

### 同步

由于 Org 模式只使用文本文件，所以使用任意工具都可以很容易地实现同步。我使用的是 git 的 `git-remote-gcrypt`。由于 `git-remote-gcrypt` 的一些限制，每台机器都倾向于推到自己的分支，并使用命令来控制。每台机器都会先合并其它所有的分支，然后再将合并后的结果推送到主干上。cron 作业可以实现将机器上的分支推送上去，而 elisp 会协调这一切 —— 确保在同步之前保存缓冲区，在同步之后从磁盘刷新缓冲区，等等。

这篇文章的代码有点多，所以我将把它链接到 github 上，而不是写在这里。


我有一个用来存放我所有的 Org 模式的文件的目录 `$HOME/org`，在 `~/org` 目录下有个 [Makefile][2] 文件来处理同步。该文件定义了以下目标：

  * `push`： 添加、提交和推送到以主机命名的分支上
  * `fetch`： 一个简单的 `git fetch` 操作
  * `sync`： 添加、提交和拉取远程的修改，合并，并（假设合并成功）将其推送到以主机命名的分支和主干上

现在，在我的用户 crontab 中有这个：

```
*/15 * * * * make -C $HOME/org push fetch 2>&1 | logger --tag 'orgsync'
```

[与之相关的 elisp 代码][3] 定义了一个快捷键（`C-c s`）来调用同步。多亏了 cronjob，只要文件被保存 —— 即使我没有在另一个机器上同步 —— 它们也会被拉取进来。

我发现这个设置非常好用。

### 用 Org 模式发邮件

在继续下去之前，首先要问自己一下：你真的需要它吗？ 我用的是带有 [mu4e][4] 的 Org 模式，而且它集成的也很好；任何 Org 模式的任务都可以通过 `Message-id` 链接到电子邮件，这很理想 —— 它可以让一个人做一些事情，比如提醒他在一周内回复一条消息。

然而，Org 模式不仅仅只有提醒。它还是一个知识库、创作系统等，但是并不是我所有的邮件客户端都使用 mu4e。(注意：移动设备中有像 MobileOrg 这样的应用)。我并没有像我想的那样经常使用它，但是它有它的用途，所以我认为我也应该在这里记录它。

现在我不仅想处理纯文本电子邮件。我希望能够处理附件、HTML 邮件等。这听起来很快就有问题了 —— 但是通过使用 ripmime 和 pandoc 这样的工具，情况还不错。

第一步就是要用某些方法将获取到的邮件放入指定的文件夹下。扩展名、特殊用户等。然后我用一个 [fetchmail 配置][5] 来将它拉取下来并运行我自己的 [insorgmail][6] 脚本。

这个脚本就是处理所有有趣的部分了。它开始用 ripmime 处理消息，用 pandoc 将 HTML 的部分转换为 Org 模式的格式。 Org 模式的层次结构是用来尽可能最好地表示 email 的结构。使用 HTML 和其他工具时，email 可能会变得相当复杂，但我发现这对于我来说是可以接受的。

### 下一篇

我最后一篇关于 Org 模式的文章将讨论如何使用它来编写文档和准备幻灯片 —— 我发现自己对 Org 模式的使用非常满意，但这需要一些调整。


--------------------------------------------------------------------------------

via: http://changelog.complete.org/archives/9898-emacs-4-automated-emails-to-org-mode-and-org-mode-syncing

作者：[John Goerzen][a]
译者：[oneforalone](https://github.com/oneforalone)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://changelog.complete.org/
[1]:https://changelog.complete.org/archives/tag/emacs2018
[2]:https://github.com/jgoerzen/public-snippets/blob/master/emacs/org-tools/Makefile
[3]:https://github.com/jgoerzen/public-snippets/blob/master/emacs/org-tools/emacs-config.org
[4]:https://www.emacswiki.org/emacs/mu4e
[5]:https://github.com/jgoerzen/public-snippets/blob/master/emacs/org-tools/fetchmailrc.orgmail
[6]:https://github.com/jgoerzen/public-snippets/blob/master/emacs/org-tools/insorgmail
