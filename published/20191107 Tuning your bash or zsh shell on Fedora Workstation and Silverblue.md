[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11560-1.html)
[#]: subject: (Tuning your bash or zsh shell on Fedora Workstation and Silverblue)
[#]: via: (https://fedoramagazine.org/tuning-your-bash-or-zsh-shell-in-workstation-and-silverblue/)
[#]: author: (George Luiz Maluf https://fedoramagazine.org/author/georgelmaluf/)

在 Fedora 上优化 bash 或 zsh
======

![][1]

本文将向你展示如何在 Fedora 的命令行解释器（CLI）Shell 中设置一些强大的工具。如果使用bash（默认）或zsh，Fedora 可让你轻松设置这些工具。

### 前置需求

这需要一些已安装的软件包。在 Fedora 工作站上，运行以下命令：

```
sudo dnf install git wget curl ruby ruby-devel zsh util-linux-user redhat-rpm-config gcc gcc-c++ make
```

在 Silverblue 上运行：

```
sudo rpm-ostree install git wget curl ruby ruby-devel zsh util-linux-user redhat-rpm-config gcc gcc-c++ make
```

注意：在 Silverblue 上，你需要重新启动才能继续。

### 字体

你可以通过安装新字体使终端焕然一新。为什么不使用可以同时显示字符和图标的字体呢？

#### Nerd-Fonts

打开一个新终端，然后键入以下命令：

```
git clone https://github.com/ryanoasis/nerd-fonts ~/.nerd-fonts
cd .nerd-fonts
sudo ./install.sh
```

#### Awesome-Fonts

在工作站上，使用以下命令进行安装：

```
sudo dnf fontawesome-fonts
```

在 Silverblue 上键入：

```
sudo rpm-ostree install fontawesome-fonts
```

### Powerline

Powerline 是 vim 的状态行插件，并为其他几个应用程序也提供了状态行和提示符，包括 bash、zsh、tmus、i3、Awesome、IPython 和 Qtile。你也可以在官方[文档站点][3]上找到更多信息。

#### 安装

要在 Fedora 工作站上安装 Powerline 实用程序，请打开一个新终端并运行：

```
sudo dnf install powerline vim-powerline tmux-powerline powerline-fonts
```

在 Silverblue 上，命令更改为：

```
sudo rpm-ostree install powerline vim-powerline tmux-powerline powerline-fonts
```

注意：在 Silverblue 上，你需要重新启动才能继续。

#### 激活 Powerline

要使 Powerline 默认处于活动状态，请将下面的代码放在 `~/.bashrc` 文件的末尾：

```
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi
```

最后，关闭终端并打开一个新终端。它看起来像这样：

![][4]

### Oh-My-Zsh

[Oh-My-Zsh][5] 是用于管理 Zsh 配置的框架。它捆绑了有用的功能、插件和主题。要了解如何将 Zsh 设置为默认外壳程序，请参见[这篇文章][6]。

#### 安装

在终端中输入：

```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

或者，你也可以输入以下内容：

```
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

最后，你将看到如下所示的终端：

![][7]

恭喜，Oh-my-zsh 已安装成功。

#### 主题

安装后，你可以选择主题。我喜欢使用 powerlevel10k。优点之一是它比 powerlevel9k 主题快 100 倍。要安装它，请运行以下命令行：

```
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
```

并在你的 `~/.zshrc` 文件设置 `ZSH_THEME`：

```
ZSH_THEME=powerlevel10k/powerlevel10k
```

关闭终端。再次打开终端时，powerlevel10k 配置向导将询问你几个问题以正确配置提示符。

![][8]

完成 powerline10k 配置向导后，你的提示符将如下所示：

![][9]

如果你不喜欢它。你可以随时使用 `p10k configure` 命令来运行 powerline10k 向导。

#### 启用插件

插件存储在 `.oh-my-zsh/plugins` 文件夹中。要激活插件，你需要编辑 `~/.zshrc` 文件。安装插件意味着你创建了一系列执行特定功能的别名或快捷方式。

例如，要启用 firewalld 和 git 插件，请首先编辑 `~/.zshrc`：

```
plugins=(firewalld git)
```

注意：使用空格分隔插件名称列表。

然后重新加载配置：

```
source ~/.zshrc
```

要查看创建的别名，请使用以下命令：

```
alias | grep firewall
```

![][10]

#### 更多配置

我建议安装语法高亮和语法自动建议插件。

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

将它们添加到文件 `~/.zshrc` 的插件列表中。

```
plugins=( [plugins...] zsh-syntax-highlighting zsh-autosuggestions)
```

重新加载配置。

```
source ~/.zshrc
```

查看结果：

![][11]

### 彩色的文件夹和图标

`colorls` 是一个 ruby gem，可使用颜色和超棒的字体图标美化终端的 `ls` 命令。你可以访问官方[网站][12]以获取更多信息。

因为它是个 ruby gem，所以请按照以下简单步骤操作：

```
sudo gem install colorls
```

要保持最新状态，只需执行以下操作：

```
sudo gem update colorls
```

为防止每次输入 `colorls`，你可以在 `~/.bashrc` 或 `~/.zshrc` 中创建别名。

```
alias ll='colorls -lA --sd --gs --group-directories-first'
alias ls='colorls --group-directories-first'
```

另外，你可以为 `colorls` 的选项启用制表符补完功能，只需在 shell 配置末尾输入以下行：

```
source $(dirname ($gem which colorls))/tab_complete.sh
```

重新加载并查看会发生什么：

![][13]

![][14]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/tuning-your-bash-or-zsh-shell-in-workstation-and-silverblue/

作者：[George Luiz Maluf][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/georgelmaluf/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/10/tuning-shell-816x345.jpg
[2]: https://fedoramagazine.org/add-power-terminal-powerline/
[3]: https://powerline.readthedocs.io/en/latest/
[4]: https://fedoramagazine.org/wp-content/uploads/2019/10/terminal_bash_powerline.png
[5]: https://ohmyz.sh
[6]: https://fedoramagazine.org/set-zsh-fedora-system/
[7]: https://fedoramagazine.org/wp-content/uploads/2019/10/oh-my-zsh.png
[8]: https://fedoramagazine.org/wp-content/uploads/2019/10/powerlevel10k_config_wizard.png
[9]: https://fedoramagazine.org/wp-content/uploads/2019/10/powerlevel10k.png
[10]: https://fedoramagazine.org/wp-content/uploads/2019/10/aliases_plugin.png
[11]: https://fedoramagazine.org/wp-content/uploads/2019/10/sintax.png
[12]: https://github.com/athityakumar/colorls
[13]: https://fedoramagazine.org/wp-content/uploads/2019/10/ls-1024x495.png
[14]: https://fedoramagazine.org/wp-content/uploads/2019/10/ll-1024x495.png
