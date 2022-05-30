[#]: subject: "How I configure Vim as my default editor on Linux"
[#]: via: "https://opensource.com/article/22/2/configure-vim-default-editor"
[#]: author: "David Both https://opensource.com/users/dboth"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14475-1.html"

我如何在 Linux 上把 Vim 配置为默认编辑器
======

> Vim 是我最喜爱的编辑器。对于那些默认使用其他编辑器的程序，我对系统所做的这些改变可以使得 Vim 成为它们默认编辑器。

![](https://img.linux.net.cn/data/attachment/album/202204/15/172912fvtvpfff83r373yy.png)

我使用 Linux 大概有 25 年了，在那之前我还使用了几年的 Unix。在这段时间里，我对一些日常使用的工具形成了偏好。Vim 是我使用的最重要的工具之一。

我在 90 年代初学习 Solaris 时，就开始使用 Vi 了，因为有人告诉我，它在任何系统上都能使用。从我的经验来看，确实是这样。我也试过其他编辑器，它们都能够胜任工作。但是，对于我来说，Vim 的使用效果最好。我经常使用它，以至于形成了肌肉记忆，甚至我在使用其他编辑器时也会下意识地去按 Vim 的快捷键。

另外，我只是单纯地喜欢 Vim 而已。

许多配置文件使用的名字是 Vi 而不是 Vim，你可以运行 `vi` 命令。不过，`vi` 命令其实是 `vim` 命令的一个链接。

许多 Linux 工具使用的编辑器都是在模拟或是直接调用的 [Nano][2]、[Emacs][3] 或者 Vim。其他的一些工具允许用户（比如那些有着明确偏好的用户）使用他们喜欢的编辑器。举两个对我影响最大的例子，一个是 Bash 命令行，它默认使用 Emacs；另一个是 Alpine 文本模式的邮件客户端，它默认使用 Pico。事实上，Pico 是专门为 Pine 邮件客户端编写的，而 Pine 是 Alpine 的前身。

并非所有使用外部编辑器的程序都是可配置的。有些程序只使用开发者指定的编辑器。对于那些可配置的应用程序，有不同的方法来选择你喜欢的编辑器。

### 在 Linux 命令行中编辑

除了实际编辑文本文件外，另一个我经常使用，且和编辑密切相关的工具是 Bash shell。Bash 的默认编辑器是 Emacs。虽然我也用过 Emacs，但我肯定更喜欢 Vim。所以很多年前，我把 Bash 命令行的默认编辑器从 Emacs 换成了 Vim，这对我来说更舒服。

有很多种方法可以配置 Bash。你可以使用一个本地配置文件，比如 `/home/yourhomedirectory/.bashrc`，它只对你的用户账户进行默认修改，而不对同一系统的其他用户进行修改。我个人倾向于让这些改变成为全局性的，基本上就是我的个人账户和 root。如果你也想全局配置，你可以创建你自己的配置文件，并把它放在 `/etc/profile.d` 目录中。

我在 `/etc/profile.d` 中添加了一个名为 `myBashConfig.sh` 的文件。`/etc/profile.d` 目录中存放了所有已安装的 shell 的启动文件。在启动终端会话时，每个 shell 仅会根据文件名的扩展名，读取为其准备的启动文件。例如，Bash shell 只读取扩展名为 `.sh` 的文件。

```
<截断>
alias vim='vim -c "colorscheme desert" '
# 把 vi 设置为 Bash 的默认编辑器
set -o vi
# 为所有检查 $EDITOR 变量的程序设置默认编辑器为 vi
EDITOR=vi
<截断>
```

在这个全局 Bash 配置文件段中，`set -o vi` 将 Vi 设置为默认编辑器。这个 `set` 命令中的 `-o` 选项将 `vi` 定义为编辑器。为使配置生效，你需要关闭所有正在运行的 Bash 会话，并打开新的会话。

现在，你现在可以使用所有你熟悉的 Vim 命令，包括光标移动。只要按下 `Esc` 键就可以进入 Vim 编辑模式。我特别喜欢多次使用 `b` 将光标移回多个字的功能。

### 将 Vim 设置为其他程序的默认值

一些 Linux 命令行工具和程序会检查 `$EDITOR` 环境变量来决定使用哪个编辑器。你可以用下面的命令检查这个变量的当前值。我在一个新安装的虚拟机上运行过该命令，以查看默认的编辑器到底是什么。

```
# echo $EDITOR
/usr/bin/nano
#
```

默认情况下，检查 `$EDITOR` 环境变量的 Fedora 程序会使用 Nano 编辑器。在 `myBashConfig.sh` 中添加一行 `EDITOR=vi`（如上面的片段所示），可以将默认值改为 Vi（Vim）编辑器。然而，不是所有使用外部编辑器的命令行程序都会检查这个环境变量。

### 在 Alpine 中编辑电子邮件

几周前，我认为 Pico 不太适合作为我的电子邮件编辑器。我可以使用它，而且在从 Thunderbird 转到 [Alpine][4] 之后的一段时间内我也用了一段时间。但我发现，Pico 妨碍了我，我总是习惯使用 Vim 按键序列，这影响了我的工作效率。

我在 Alpine 的用户帮助中看到，默认编辑器是可以修改的。我决定把它改成 Vim。实际上这很容易做到。

在 Alpine 主菜单上，按 `S` 键进入设置，然后按 `C` 键进行配置。在 “<ruby>编辑器设置<rt>Composer Preferences</rt></ruby>” 部分，按 `X` 选择 “<ruby>启用外部编辑器命令<rt>Enable Alternate Editor Command</rt></ruby>” 和 “<ruby>隐式启用外部编辑器<rt>Enable Alternate Editor Implicitly</rt></ruby>” 项目。在往下滚动几页的 “<ruby>高级用户设置<rt>Advanced User Preferences</rt></ruby>” 部分，找到 `Editor 那一行。如果它还没有被修改的话，它应该是这样的：

```
Editor    = <No Value Set>
```

用光标栏突出显示 `Editor` 这一行，然后按回车键来编辑。将 `<No Value Set>` 改为 `vim`，再按回车键，然后按 `E` 键退出，最后按 `Y` 键保存修改。

要用 Vim 编辑电子邮件，只需进入电子邮件正文，Vim 就会自动启动，就像 Pico 那样。所有我喜欢的编辑功能都还在，因为它实际上是在使用 Vim。甚至退出 Vim 的 `Esc :wq` 序列也是一样的。

### 总结

与其他编辑器相比，我更喜欢 Vim，对我的系统进行的这些改动后，那些默认使用其他编辑器的应用程序，将使用 Vim 来替代它们的默认编辑器。有些程序使用 `$EDITOR` 环境变量，因此你只需要做一次修改就够了。其他有用户配置选项的程序，如 Alpine，则必须为每个程序单独设置。

这种可以选择你喜欢的外部编辑器的能力，非常符合 Unix 哲学的宗旨：“每个程序都只做一件事，而且要做得出色”。既然已经有几个优秀的编辑器，为什么还要再写一个呢？而且它也符合 Linux 哲学的宗旨：“使用你最喜欢的编辑器”。

当然，你可以把你的默认文本编辑器改为 Nano、Pico、Emacs 或任何其他你喜欢的编辑器。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/configure-vim-default-editor

作者：[David Both][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/20/12/gnu-nano
[3]: https://opensource.com/tags/emacs
[4]: https://opensource.com/article/21/5/alpine-linux-email
