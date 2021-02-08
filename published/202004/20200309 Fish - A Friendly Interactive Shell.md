[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12069-1.html)
[#]: subject: (Fish – A Friendly Interactive Shell)
[#]: via: (https://fedoramagazine.org/fish-a-friendly-interactive-shell/)
[#]: author: (Michal Konečný https://fedoramagazine.org/author/zlopez/)

Fish：一个友好的交互式 Shell
======

![Fish — A Friendly Interactive Shell][1]

你是否正在寻找 bash 的替代品？你是否在寻找更人性化的东西？不用再看了，因为你刚发现了 fish！

Fish（友好的交互式 shell）是一个智能且用户友好的命令行 shell，可在 Linux、MacOS 和其他操作系统上运行。可以将其用于终端的日常工作和脚本编写。用 fish 编写的脚本比相同的 bash 版本具有更少的神秘性。

### Fish 的用户友好功能

* **建议**：Fish 会提示你之前写过的命令。当经常输入相同命令时，这样可以提高生产率。
* **健全的脚本能力**：Fish 避免使用那些隐秘字符。这提供了更清晰和更友好的语法。
* **基于手册页的补全**：Fish 会根据命令的手册页自动补全参数。
* **语法高亮**：Fish 会高亮显示命令语法以使其在视觉上友好。

### 安装

#### Fedora 工作站

使用 `dnf` 命令安装 fish：

```
$ sudo dnf install fish
```

安装 `util-linux-user` 包，然后使用适当的参数运行 `chsh`（更改 shell 程序）命令，将 fish 设置为默认 shell 程序：

```
$ sudo dnf install util-linux-user
$ chsh -s /usr/bin/fish
```

你需要注销然后重新登录，更改才能生效。

#### Fedora Silverblue

由于它不是 GUI 应用，因此你需要使用 `rpm-ostree` 将其加到层内。使用以下命令在 Fedora Silverblue 上安装 fish：

```
$ rpm-ostree install fish
```

在 Fedora Silverblue 上，你需要重启 PC 才能切换到新的 ostree 镜像。

如果你想在 Fedora Silverblue 用 fish 作为主要 shell，最简单的方法是更新 `/etc/passwd` 文件。找到你的用户，并将 `/bin/bash` 更改为 `/usr/bin/fish`。

你需要 [root 权限][2]来编辑 `/etc/passwd` 文件。另外，你需要注销并重新登录才能使更改生效。

### 配置

fish 的用户配置文件在 `~/.config/fish/config.fish`。要更改所有用户的配置，请编辑 `/etc/fish/config.fish`。

用户配置文件必须手动创建。安装脚本不会创建 `~/.config/fish/config.fish`。

以下是两个个配置示例以及它们的 bash 等效项，以帮助你入门：

#### 创建别名

* `~/.bashrc`：`alias ll='ls -lh'`
* `~/.config/fish/config.fish`: `alias ll='ls -lh'`

#### 设置环境变量

  * `~/.bashrc`：`export PATH=$PATH:~/bin`
  * `~/.config/fish/config.fish`：`set -gx PATH $PATH ~/bin`

### 使用 fish 工作

将 fish 配置为默认 shell 程序后，命令提示符将类似于下图所示。如果尚未将 fish 配置为默认 shell，只需运行 `fish` 命令以在当前终端会话中启动。

![][3]

在你开始输入命令时，你会注意到语法高亮显示：

![][4]

很酷，不是吗？🙂

你还将在输入时看到建议的命令。例如，再次开始输入上一个命令：

![][5]

注意输入时出现的灰色文本。灰色文本显示建议之前编写的命令。要自动补全，只需按 `CTRL+F`。

通过输入连接号（`–`）然后使用 `TAB` 键，它会根据前面命令的手册页获取参数建议：

![][6]

如果你按一次 `TAB`，它将显示前几个建议（或所有建议，如果只有少量参数可用）。如果再次按 `TAB`，它将显示所有建议。如果连续三次按 `TAB`，它将切换到交互模式，你可以使用箭头键选择一个参数。

除此之外，fish 的工作与大多数其他 shell 相似。其他差异已经写在文档中。因此，找到你可能感兴趣的其他功能应该不难。

### 让 fish 变得更强大

使用 [powerline][7] 使 fish 变得更强大。Powerline 可以为 fish 的界面添加命令执行时间、彩色化 git 状态、当前 git 分支等。

在安装 powerline 之前，你必须先安装 [Oh My Fish][8]。Oh My Fish 扩展了 fish 的核心基础架构，以支持安装其他插件。安装 Oh My Fish 的最简单方法是使用 `curl` 命令：

```
> curl -L https://get.oh-my.fish | fish
```

如果你不想直接将安装命令管道传给 `fish`，请参见 Oh My Fish 的 [README][9] 的安装部分，以了解其他安装方法。

Fish 的 powerline 插件是 [bobthefish][7]。Bobthefish 需要 `powerline-fonts` 包。

在 Fedora 工作站上：

```
> sudo dnf install powerline-fonts
```

在 Fedora Silverblue 上：

```
> rpm-ostree install powerline-fonts
```

在 Fedora Silverblue 上，你必须重启以完成字体的安装。

安装 `powerline-fonts` 之后，安装 `bobthefish`：

```
> omf install bobthefish
```

现在你可以通过 powerline 体验 fish 的全部奇妙之处：

![][10]

### 更多资源

查看这些网页，了解更多 fish 内容：

  * [官网][11]
  * [文档][12]
  * [教程][13]
  * [常见问题][14]
  * [在线体验][15]
  * [邮件列表][16]
  * [GitHub][17]


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fish-a-friendly-interactive-shell/

作者：[Michal Konečný][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zlopez/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/03/fish-816x345.jpg
[2]: https://fedoramagazine.org/howto-use-sudo/
[3]: https://fedoramagazine.org/wp-content/uploads/2020/03/Screenshot-from-2020-03-03-14-00-35.png
[4]: https://fedoramagazine.org/wp-content/uploads/2020/03/Screenshot-from-2020-03-03-14-19-24.png
[5]: https://fedoramagazine.org/wp-content/uploads/2020/03/Screenshot-from-2020-03-03-14-25-31.png
[6]: https://fedoramagazine.org/wp-content/uploads/2020/03/Screenshot-from-2020-03-03-14-58-07.png
[7]: https://github.com/oh-my-fish/theme-bobthefish
[8]: https://github.com/oh-my-fish/oh-my-fish
[9]: https://github.com/oh-my-fish/oh-my-fish/blob/master/README.md#installation
[10]: https://fedoramagazine.org/wp-content/uploads/2020/03/Screenshot-from-2020-03-03-15-38-07.png
[11]: https://fishshell.com/
[12]: https://fishshell.com/docs/current/index.html
[13]: https://fishshell.com/docs/current/tutorial.html
[14]: https://fishshell.com/docs/current/faq.html
[15]: https://rootnroll.com/d/fish-shell/
[16]: https://sourceforge.net/projects/fish/lists/fish-users
[17]: https://github.com/fish-shell/fish-shell/
