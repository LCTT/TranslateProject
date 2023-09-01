[#]: subject: "What helps people get comfortable on the command line?"
[#]: via: "https://jvns.ca/blog/2023/08/08/what-helps-people-get-comfortable-on-the-command-line-/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16085-1.html"

如何在命令行上舒适地生存？
======

![][0]

有时我与一些害怕使用命令行的朋友交谈，我感到自己给不出好的建议（我已经使用命令行太长时间了），因此我向一些 [Mastodon][1] 上的人提出了以下问题：

> 如果在过去一到三年内，你刚刚不再害怕使用命令行了，是什么帮助了你？
>
> （如果你不记得，或者你已经使用命令行舒适地工作了 15 年，则无需回答——这个问题不适用于你 :)）

这个列表还不如我希望的那么长，但我希望通过发布它来收集更多的答案。显然，并没有一个单一的方法适用于所有人，不同的人会选择不同的路径。

我认为舒适使用命令行有三个方面：**减少风险**、**动机**和**资源**。我将先谈谈减少风险，然后是一些动机，并列出一些资源。

### 减少风险的方式

很多人（没错！）对在命令行上意外执行了一些无法撤销的破坏性操作感到担心。

以下是一些人们提到的帮助他们减少风险的策略：

- 定期备份（有人提到他们在上周的一个命令行错误中意外删除了整个家目录，但很幸运他们有备份）。
- 对于代码，尽可能多地使用 `git`。
- 将 `rm` 设置为类似 `safe-rm` 或 `rmtrash` 这样的工具的别名，这样你就不会意外删除不应删除的内容（或者就设置别名到 `rm -i`）。
- 尽量避免使用通配符，使用制表符键补全代替（我的 Shell 会使用 `TAB` 键补全 `rm *.txt` 并显示我将要删除的内容）。
- 使用精美的终端提示符，可以显示当前目录、计算机名称、`git` 分支和你是否具有 root 权限。
- 如果你计划对文件运行未经测试或危险的命令，先备份文件副本。
- 拥有一台专用的测试机器（如便宜的旧 Linux 计算机或树莓派）进行特别危险的测试，例如测试备份软件或分区。
- 对于危险命令，如果有的话，使用 `--dry-run` 选项来查看执行结果而不实际执行操作。
- 在你的 Shell 脚本中构建自己的 `--dry-run` 选项。

这些策略有助于降低在命令行上引发不可逆操作的风险。

### 杀手级应用程序

一些人提到了一个“杀手级命令行应用程序”，这激励他们开始花更多时间在命令行上。例如：

  * [ripgrep][2]
  * jq
  * wget / curl
  * git（一些人发现他们更喜欢使用 git 命令行界面而不是使用图形界面）
  * ffmpeg（用于视频处理）
  * yt-dlp
  * 硬盘数据恢复工具（来自 [这个精彩的故事][3]）

还有一些人提到他们对图形界面工具感到失望（例如使用了所有内存，并使计算机崩溃的重型集成开发环境），并因此有动机用更轻量级的命令行工具替代它们。

### 激发人们的命令行技巧

有人提到被其他人在命令行上展示的酷炫功能所激励，例如：

  * [命令行工具可以比你的 Hadoop 集群快 235 倍][4]
  * [Gary Bernhardt 的这个“命令行链锯”演讲][5]

### explainshell

有几个人提到了 [explainshell][6]，它可以让你粘贴任何命令行指令，并将其分解成不同的部分解释。

### 命令历史、制表符补全等等

有很多小技巧和窍门可以使在命令行上工作更容易，例如：

  * 使用向上箭头查看先前的命令
  * 使用 `Ctrl+R` 搜索你的 Bash 历史记录
  * 使用快捷键在行内导航：`Ctrl+w` （删除一个单词）、`Ctrl+a`（跳转到行首）、`Ctrl+e`（跳转到行尾），以及 `Ctrl+left arrow` / `Ctrl+right arrow`（向前/向后跳转一个单词）
  * 将 Bash 历史记录设置为无限制
  * 使用 `cd -` 返回上一个目录
  * 文件名和命令名的制表符自动补全
  * 学习如何使用像 `less` 这样的分页工具阅读手册页或其他大型文本文件（如搜索、滚动等）
  * 在 macOS 上使用 `pbcopy`/`pbpaste` 将剪贴板内容复制/粘贴到 stdout/stdin
  * 在编辑配置文件之前备份它们

### fzf

很多人提到使用 [fzf][7] 作为模糊搜索 Shell 历史记录的更好方法。除了作为更好的模糊搜索 Shell 历史记录的工具，人们还提到了一些其他用途：

- 选择 `git` 分支（`git checkout $(git for-each-ref --format='%(refname:short)' refs/heads/ | fzf)`）
- 快速查找要编辑的文件（`nvim $(fzf)`）
- 切换 Kubernetes 上下文（`kubectl config use-context $(kubectl config get-contexts -o name | fzf --height=10 --prompt="Kubernetes Context> ")`）
- 从测试套件中选择要运行的特定测试

一般的模式是使用 `fzf` 来选择某个对象（文件、`git` 分支、命令行参数），`fzf` 将所选对象输出到标准输出，然后将其插入作为另一个命令的命令行参数。

你还可以将 `fzf` 用作工具，自动预览输出并快速迭代，例如：

- 自动预览 `jq` 的输出（`echo '' | fzf --preview "jq {q} < YOURFILE.json"`）
- 自动预览 `sed` 的输出（`echo '' | fzf --preview "sed {q} YOURFILE"`）
- 自动预览 `awk` 的输出（`echo '' | fzf --preview "awk {q} YOURFILE"`）

你可以参考这个思路。

通常，人们会为 `fzf` 的使用定义别名，比如输入 `gcb` 或其他命令，以快速选择要检出的 `git` 分支。

### 树莓派

一些人开始使用树莓派，这样可以更安全地进行实验，而不必担心损坏计算机（只需擦除 SD 卡然后重新开始即可！）。

### 漂亮的 Shell 环境

很多人说，当他们开始使用像 [oh-my-zsh][8] 或 [Fish][9] 这样更用户友好的 Shell 环境时，他们在命令行上感到更舒适。我非常同意这一点 – 我已经使用 Fish 十年了，我非常喜欢它。

在这里还有一些其他的事情可以做：

- 有些人说，让他们的终端更漂亮可以帮助他们感到更舒适（“让它变成粉色！”）。
- 设置一个漂亮的 Shell 提示符来提供更多信息（例如，当命令失败时，可以将提示符设置为红色）。特别是 [transient prompts][10]（在当前命令设置一个非常花哨的提示符，但在之前的命令中设置一个简单得多的提示符）看起来非常好。

![](https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/transient-prompt.gif)

一些用于美化终端的工具：

- 我使用 [base16-shell][11]
- [powerlevel10k][12] 是一个流行的漂亮的 Zsh 主题，具有 transient prompts
- [starship][13] 是一个漂亮的提示符工具
- 在 Mac 上，我认为 [iTerm2][14] 比默认的终端更容易自定义。

### 漂亮的文件管理器

一些人提到了像 [ranger][15] 或 [nnn][16] 这样的漂亮的终端文件管理器，这是我之前没有听说过的。

### 一个有帮助的朋友或同事

一个可以回答初学者问题并给你指点的人是无价的。

### 通过肩并肩地观察学习

有人提到观察更有经验的人使用终端 - 有很多经验丰富的用户甚至没有意识到自己在做什么，你可以从中学到很多小技巧。

### 别名

很多人说，为常用任务创建自己的别名或脚本就像是一个神奇的“灵光一现”时刻，因为：

- 他们不必记住语法
- 然后他们就有了一份自己常用命令的列表，可以轻松调用

### 查找示例的备忘单

很多手册页没有示例，例如 [openssl s_client][17] 的手册页就没有示例。这使得起步变得更加困难！

人们提到了一些备忘单工具，比如：

- [tldr.sh][18]
- [cheat][19]（还可以进行编辑 - 你可以添加自己的命令以供以后参考）
- [um][20]（一个非常精简的需要自己构建的系统）

例如，[openssl 的备忘单][21] 非常棒 - 我认为它几乎包含了我在实际中使用 `openssl` 时用过的所有内容（除了 `openssl s_client` 的 `-servername` 选项）。

有人说他们配置了他们的 `.bash_profile`，这样每次登录时都会打印出一张备忘单。

### 不要试图背诵

一些人说他们需要改变自己的方法 - 他们意识到不需要试图记住所有的命令，只需按需查找命令，随着时间的推移，他们会自然而然地记住最常用的命令。

（我最近对学习阅读 x86 汇编有了完全相同的体会 - 我正在上一门课程，讲师说“是的，刚开始时可以每次都查找，最终你会记住最常见的指令。”）

还有一些人说相反的观点 - 他们使用间隔重复应用程序（如 Anki）来记忆常用的命令。

### Vim

有人提到他们开始在命令行上使用 Vim 编辑文件，一旦他们开始使用终端文本编辑器，使用命令行处理其他事情也变得更自然。

此外，显然有一个名为 [micro][22] 的新编辑器，像是更好的 `pico`/`nano`，适用于那些不想学习 Emacs 或 Vim 的人。

### 桌面上使用 Linux

有人说他们开始使用 Linux 作为他们的日常主力系统，而需要修复 Linux 问题可以帮助他们学习。这也是我在大约 2004 年熟悉命令行的方式（我非常喜欢安装各种不同的 Linux 发行版，以找到我最喜欢的那个），但我猜这不是如今最受欢迎的策略。

### 被迫仅使用终端

有些人说他们参加了一门大学课程，教授让他们在终端上做所有事情，或者他们自己制定了一个规则，一段时间内必须在终端上完成所有工作。

### 工作坊

有几个人说像 [Software Carpentry][23] 这样的工作坊（面向科学家的命令行、Git 和 Python/R 编程简介）帮助他们更熟悉命令行。

你可以在这里查看 [Software Carpentry 课程][24]。

### 书籍和文章

一些提到的材料：

文章：

- 《[终端][25]》
- 《[命令行功夫][26]》（包含 UNIX 和 Windows 命令行技巧）

书籍：

- 《[Effective Linux at The Command Line][27]》
- 《Unix Power Tools》（可能有些过时）
- 《The Linux Pocket guide》

视频：

- Mindy Preston 的 [CLI tools aren’t inherently user-hostile][27a]
- Gary Bernhardt 的 [destroy all software screencasts][28]
- [DistroTube][29]

*（题图：MJ/c0dc082a-a477-434b-b826-77a42c8f61c3）*

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/08/08/what-helps-people-get-comfortable-on-the-command-line-/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://social.jvns.ca/@b0rk/110842645317766338
[2]: https://github.com/BurntSushi/ripgrep
[3]: https://github.com/summeremacs/public/blob/main/20230629T180135--how-i-came-to-use-emacs-and-other-things__emacs_explanation_linux_origin_raspberrypi_story_terminal.org
[4]: https://adamdrake.com/command-line-tools-can-be-235x-faster-than-your-hadoop-cluster.html
[5]: https://www.youtube.com/watch?v=ZQnyApKysg4&feature=youtu.be
[6]: https://explainshell.com/
[7]: https://github.com/junegunn/fzf
[8]: https://ohmyz.sh/
[9]: https://fishshell.com/
[10]: https://www.reddit.com/r/zsh/comments/dsh1g3/new_powerlevel10k_feature_transient_prompt/
[11]: https://github.com/chriskempson/base16-shell
[12]: https://github.com/romkatv/powerlevel10k
[13]: https://github.com/starship/starship
[14]: https://iterm2.com/
[15]: https://github.com/ranger/ranger
[16]: https://github.com/jarun/nnn
[17]: https://linux.die.net/man/1/s_client
[18]: https://tldr.sh/
[19]: https://github.com/cheat/cheat
[20]: http://ratfactor.com/cards/um
[21]: https://github.com/cheat/cheatsheets/blob/master/openssl
[22]: https://micro-editor.github.io/
[23]: https://software-carpentry.org/
[24]: https://software-carpentry.org/lessons/
[25]: https://furbo.org/2014/09/03/the-terminal/
[26]: http://blog.commandlinekungfu.com/
[27]: https://www.oreilly.com/library/view/efficient-linux-at/9781098113391/
[27a]: https://www.youtube.com/watch?v=IcV9TVb-vF4
[28]: https://www.destroyallsoftware.com/screencasts
[29]: https://www.youtube.com/@DistroTube
[0]: https://img.linux.net.cn/data/attachment/album/202308/12/101712ivlgozjogfvfczcg.jpg