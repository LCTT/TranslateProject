[#]: collector: (lujun9972)
[#]: translator: (amwps290)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11426-1.html)
[#]: subject: (Adding themes and plugins to Zsh)
[#]: via: (https://opensource.com/article/19/9/adding-plugins-zsh)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

给 Zsh 添加主题和插件
======

> 通过 Oh My Zsh 安装的主题和插件来扩展 Zsh 的功能。

![](https://img.linux.net.cn/data/attachment/album/201910/05/120457r49mk2l9oelv94bi.jpg)

在我的[前文][2]中，我向大家展示了如何安装并使用 [Z-Shell][2] (Zsh)。对于某些用户来说，Zsh 最令人激动的是它可以安装主题。Zsh 安装主题非常容易，一方面是因为有非常活跃的社区为 Z-Shell 设计主题，另一方面是因为有 [Oh My Zsh][3] 这个项目。这使得安装主题变得轻而易举。

主题的变化可能会立刻吸引你的注意力，因此如果你安装了 Zsh 并且将默认的 Shell 替换为 Zsh 时，你可能不喜欢 Shell 默认主题的样子，那么你可以立即更换 Oh My Zsh 自带的 100 多个主题。Oh My Zsh 不仅拥有大量精美的主题，同时还有数以百计的扩展 Zsh 功能的插件。

### 安装 Oh My Zsh

Oh My Zsh 的[官网][3]建议你使用一个脚本在有网络的情况下来安装这个包。尽管 Oh My Zsh 项目几乎是可以令人信服的，但是盲目地在你的电脑上运行一个脚本这是一个糟糕的建议。如果你想运行这个脚本，你可以把它下载下来，看一下它实现了什么功能，在你确信你已经了解了它的所作所为之后，你就可以运行它了。

如果你下载了脚本并且阅读了它，你就会发现安装过程仅仅只有三步：

#### 1、克隆 oh-my-zsh

第一步，克隆 oh-my-zsh 库到 `~/.oh-my-zsh` 目录：

```
% git clone http://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
```

#### 2、切换配置文件

下一步，备份你已有的 `.zshrc` 文件，然后将 oh-my-zsh 自带的配置文件移动到这个地方。这两步操作可以一步完成，只需要你的 `mv` 命令支持 `-b` 这个选项。

```
% mv -b \
~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```

#### 3、编辑配置文件

默认情况下，Oh My Zsh 自带的配置文件是非常简陋的。如果你想将你自己的 `~/.zshrc` 文件合并到 `.oh-my-zsh` 的配置文件中。你可以使用 [cat][4] 命令将你的旧的配置文件添加到新文件的末尾。

```
% cat ~/.zshrc~ >> ~/.zshrc
```

看一下默认的配置文件以及它提供的一些选项。用你最喜欢的编辑器打开 `~/.zshrc` 文件。这个文件有非常良好的注释。这是了解它的一个非常好的方法。

例如，你可以更改 `.oh-my-zsh` 目录的位置。在安装的时候，它默认是位于你的家目录。但是，根据 [Free Desktop][5] 所定义的现代 Linux 规范。这个目录应当放置于 `~/.local/share` 。你可以在配置文件中进行修改。如下所示：

```
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.local/share/oh-my-zsh
```

然后将 .oh-my-zsh 目录移动到你新配置的目录下：

```
% mv ~/.oh-my-zsh $HOME/.local/share/oh-my-zsh
```

如果你使用的是 MacOS，这个目录可能会有点含糊不清，但是最合适的位置可能是在 `$HOME/Library/Application\ Support`。

### 重新启动 Zsh

编辑配置文件之后，你必须重新启动你的 Shell。在这之前，你必须确定你的任何操作都已正确完成。例如，在你修改了 `.oh-my-zsh` 目录的路径之后。不要忘记将目录移动到新的位置。如果你不想重新启动你的 Shell。你可以使用 `source` 命令来使你的配置文件生效。

```
% source ~/.zshrc
➜  .oh-my-zsh git:(master) ✗
```

你可以忽略任何丢失更新文件的警告；他们将会在重启的时候再次进行解析。

### 更换你的主题

安装好 oh-my-zsh 之后。你可以将你的 Zsh 的主题设置为 `robbyrussell`，这是一个该项目维护者的主题。这个主题的更改是非常小的，仅仅是改变了提示符的颜色。

你可以通过列出 `.oh-my-zsh` 目录下的所有文件来查看所有安装的主题：

```
➜  .oh-my-zsh git:(master) ✗ ls ~/.local/share/oh-my-zsh/themes
3den.zsh-theme
adben.zsh-theme
af-magic.zsh-theme
afowler.zsh-theme
agnoster.zsh-theme
[...]
```

想在切换主题之前查看一下它的样子，你可以查看 Oh My Zsh 的 [wiki][6] 页面。要查看更多主题，可以查看 [外部主题][7] wiki 页面。

大部分的主题是非常易于安装和使用的，仅仅需要改变 `.zshrc` 文件中的配置选项然后重新载入配置文件。

```
➜ ~ sed -i 's/_THEME=\"robbyrussel\"/_THEME=\"linuxonly\"/g' ~/.zshrc
➜ ~ source ~/.zshrc
seth@darkstar:pts/0-&gt;/home/skenlon (0) ➜
```

其他的主题可能需要一些额外的配置。例如，为了使用 `agnoster` 主题，你必须先安装 Powerline 字体。这是一个开源字体，如果你使用 Linux 操作系统的话，这个字体很可能在你的软件库中存在。使用下面的命令安装这个字体：

```
➜ ~ sudo dnf install powerline-fonts
```

在配置文件中更改你的主题：

```
➜ ~ sed -i 's/_THEME=\"linuxonly\"/_THEME=\"agnoster\"/g' ~/.zshrc
```

重新启动你的 Sehll（一个简单的 `source` 命令并不会起作用）。一旦重启，你就可以看到新的主题：

![agnoster theme][8]

### 安装插件

Oh My Zsh 有超过 200 的插件，你可以在 `.oh-my-zsh/plugins` 中看到它们。每一个扩展目录下都有一个 `README` 文件解释了这个插件的作用。

一些插件相当简单。例如，`dnf`、`ubuntu`、`brew` 和 `macports` 插件仅仅是为了简化与 DNF、Apt、Homebres 和 MacPorts 的交互操作而定义的一些别名。

而其他的一些插件则较为复杂，`git` 插件默认是被激活使用的。当你的目录是一个 git 仓库的时候，这个扩展就会更新你的 Shell 提示符，以显示当前的分支和是否有未合并的更改。

为了激活这个扩展，你可以将这个扩展添加到你的配置文件 `~/.zshrc` 中。例如，你可以添加 `dnf` 和 `pass` 插件，按照如下的方式更改：

```
plugins=(git dnf pass)
```

保存修改，重新启动你的 Shell。

```
% source ~/.zshrc
```

这个扩展现在就可以使用了。你可以通过使用 `dnf` 提供的别名来测试一下：

```
% dnfs fop
====== Name Exactly Matched: fop ======
fop.noarch : XSL-driven print formatter
```

不同的插件做不同的事，因此你可以一次安装一两个插件来帮你学习新的特性和功能。

### 兼容性

一些 Oh My Zsh 插件具有通用性。如果你看到一个插件声称它可以与 Bash 兼容，那么它就可以在你自己的 Bash 中使用。另一些插件需要 Zsh 提供的特定功能。因此，它们并不是所有都能工作。但是你可以添加一些其他的插件，例如 `dnf`、`ubuntu`、`firewalld`，以及其他的一些插件。你可以使用 `source` 使你的选择生效。例如：

```
if [ -d $HOME/.local/share/oh-my-zsh/plugins ]; then
        source $HOME/.local/share/oh-my-zsh/plugins/dnf/dnf.plugin.zsh
fi
```

### 选择或者不选择 Zsh

Z-shell 的内置功能和它由社区贡献的扩展功能都非常强大。你可以把它当成你的主 Shell 使用，你也可以在你休闲娱乐的时候尝试一下。这取决于你的爱好。

什么是你最喜爱的主题和扩展可以在下方的评论告诉我们！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/adding-plugins-zsh

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/build_structure_tech_program_code_construction.png?itok=nVsiLuag (Someone wearing a hardhat and carrying code )
[2]: https://linux.cn/article-11378-1.html
[3]: https://ohmyz.sh/
[4]: https://opensource.com/article/19/2/getting-started-cat-command
[5]: http://freedesktop.org
[6]: https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
[7]: https://github.com/robbyrussell/oh-my-zsh/wiki/External-themes
[8]: https://opensource.com/sites/default/files/uploads/zsh-agnoster.jpg (agnoster theme)
[9]: https://opensource.com/resources/what-is-git
[10]: https://opensource.com/article/19/7/make-linux-stronger-firewalls
