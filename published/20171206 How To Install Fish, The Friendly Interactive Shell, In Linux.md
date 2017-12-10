如何在 Linux 上安装友好的交互式 shell：Fish
======

Fish，<ruby>友好的交互式 shell<rt>Friendly Interactive SHell</rt></ruby> 的缩写，它是一个适于装备于类 Unix 系统的智能而用户友好的 shell。Fish 有着很多重要的功能，比如自动建议、语法高亮、可搜索的历史记录（像在 bash 中 `CTRL+r`）、智能搜索功能、极好的 VGA 颜色支持、基于 web 的设置方式、完善的手册页和许多开箱即用的功能。尽管安装并立即使用它吧。无需更多其他配置，你也不需要安装任何额外的附加组件/插件!

在这篇教程中，我们讨论如何在 Linux 中安装和使用 fish shell。

#### 安装 Fish

尽管 fish 是一个非常用户友好的并且功能丰富的 shell，但并没有包括在大多数 Linux 发行版的默认仓库中。它只能在少数 Linux 发行版中的官方仓库中找到，如 Arch Linux，Gentoo，NixOS，和 Ubuntu 等。然而，安装 fish 并不难。

在 Arch Linux 和它的衍生版上，运行以下命令来安装它。

```
sudo pacman -S fish
```

在 CentOS 7 上以 root 运行以下命令：

```
cd /etc/yum.repos.d/
wget https://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
yum install fish
```

在 CentOS 6 上以 root 运行以下命令：

```
cd /etc/yum.repos.d/
wget https://download.opensuse.org/repositories/shells:fish:release:2/CentOS_6/shells:fish:release:2.repo
yum install fish
```

在 Debian 9 上以 root 运行以下命令：

```
wget -nv https://download.opensuse.org/repositories/shells:fish:release:2/Debian_9.0/Release.key -O Release.key
apt-key add - < Release.key
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_9.0/ /' > /etc/apt/sources.list.d/fish.list
apt-get update
apt-get install fish
```

在 Debian 8 上以 root 运行以下命令：

```
wget -nv https://download.opensuse.org/repositories/shells:fish:release:2/Debian_8.0/Release.key -O Release.key
apt-key add - < Release.key
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' > /etc/apt/sources.list.d/fish.list
apt-get update
apt-get install fish
```

在 Fedora 26 上以 root 运行以下命令：

```
dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/Fedora_26/shells:fish:release:2.repo
dnf install fish
```

在 Fedora 25 上以 root 运行以下命令：

```
dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/Fedora_25/shells:fish:release:2.repo
dnf install fish
```

在 Fedora 24 上以 root 运行以下命令：

```
dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/Fedora_24/shells:fish:release:2.repo
dnf install fish
```

在 Fedora 23 上以 root 运行以下命令：

```
dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/Fedora_23/shells:fish:release:2.repo
dnf install fish
```

在 openSUSE 上以 root 运行以下命令：

```
zypper install fish
```

在 RHEL 7 上以 root 运行以下命令：

```
cd /etc/yum.repos.d/
wget https://download.opensuse.org/repositories/shells:fish:release:2/RHEL_7/shells:fish:release:2.repo
yum install fish
```

在 RHEL-6 上以 root 运行以下命令：

```
cd /etc/yum.repos.d/
wget https://download.opensuse.org/repositories/shells:fish:release:2/RedHat_RHEL-6/shells:fish:release:2.repo
yum install fish
```

在 Ubuntu 和它的衍生版上：

```
sudo apt-get update
sudo apt-get install fish
```

就这样了。是时候探索 fish shell 了。

### 用法

要从你默认的 shell 切换到 fish,请执行以下操作：

```
$ fish
Welcome to fish, the friendly interactive shell
```

你可以在 `~/.config/fish/config.fish` 上找到默认的 fish 配置（类似于 `.bashrc`）。如果它不存在，就创建它吧。

#### 自动建议

当我输入一个命令，它以浅灰色自动建议一个命令。所以，我需要输入一个 Linux 命令的前几个字母，然后按下 `tab` 键来完成这个命令。

 [![](http://www.ostechnix.com/wp-content/uploads/2017/12/fish-1.png)][2] 

如果有更多的可能性，它将会列出它们。你可以使用上/下箭头键从列表中选择列出的命令。在选择你想运行的命令后，只需按下右箭头键，然后按下 `ENTER` 运行它。 

 [![](http://www.ostechnix.com/wp-content/uploads/2017/12/fish-2.png)][3] 

无需 `CTRL+r` 了！正如你已知道的，我们通过按 `CTRL+r` 来反向搜索 Bash shell 中的历史命令。但在 fish shell 中是没有必要的。由于它有自动建议功能，只需输入命令的前几个字母，然后从历史记录中选择已经执行的命令。很酷，是吧。

#### 智能搜索

我们也可以使用智能搜索来查找一个特定的命令、文件或者目录。例如，我输入一个命令的一部分，然后按向下箭头键进行智能搜索，再次输入一个字母来从列表中选择所需的命令。

 [![](http://www.ostechnix.com/wp-content/uploads/2017/12/fish-6.png)][4] 

#### 语法高亮

当你输入一个命令时，你将注意到语法高亮。请看下面当我在 Bash shell 和 fish shell 中输入相同的命令时截图的区别。 

Bash：

 [![](http://www.ostechnix.com/wp-content/uploads/2017/12/fish-3.png)][5] 

Fish：

 [![](http://www.ostechnix.com/wp-content/uploads/2017/12/fish-4.png)][6] 

正如你所看到的，`sudo` 在 fish shell 中已经被高亮显示。此外，默认情况下它将以红色显示无效命令。

#### 基于 web 的配置方式

这是 fish shell 另一个很酷的功能。我们可以设置我们的颜色、更改 fish 提示符，并从网页上查看所有功能、变量、历史记录、键绑定。

启动 web 配置接口，只需输入：

```
fish_config
```

 [![](http://www.ostechnix.com/wp-content/uploads/2017/12/fish-5.png)][7] 

#### 手册页补完

Bash 和 其它 shells 支持可编程的补完，但只有 fish 可以通过解析已安装的手册来自动生成它们。

为此，请运行：

```
fish_update_completions
```

实例输出将是：

```
Parsing man pages and writing completions to /home/sk/.local/share/fish/generated_completions/
 3435 / 3435 : zramctl.8.gz
```

#### 禁用问候语

默认情况下，fish 在启动时问候你（“Welcome to fish, the friendly interactive shell”）。如果你不想要这个问候消息，可以禁用它。为此，编辑 fish 配置文件：

```
vi ~/.config/fish/config.fish
```

添加以下行：

```
set -g -x fish_greeting ''
```

你也可以设置任意自定义的问候语，而不是禁用 fish 问候。

```
set -g -x fish_greeting 'Welcome to OSTechNix'
```

#### 获得帮助

这是另一个吸引我的令人印象深刻的功能。要在终端的默认 web 浏览器中打开 fish 文档页面，只需输入：

```
help
```

官方文档将会在你的默认浏览器中打开。另外，你可以使用手册页来显示任何命令的帮助部分。

```
man fish
```

#### 设置 fish 为默认 shell

非常喜欢它？太好了！设置它作为默认 shell 吧。为此，请使用命令 `chsh`：

```
chsh -s /usr/bin/fish
```

在这里，`/usr/bin/fish` 是 fish shell 的路径。如果你不知道正确的路径，以下命令将会帮助你：

```
which fish
```

注销并且重新登录以使用新的默认 shell。

请记住，为 Bash 编写的许多 shell 脚本可能不完全兼容 fish。

要切换回 Bash，只需运行：

```
bash
```

如果你想 Bash 作为你的永久默认 shell，运行：

```
chsh -s /bin/bash
```

各位，这就是全部了。在这个阶段，你可能会得到一个有关 fish shell 使用的基本概念。 如果你正在寻找一个Bash的替代品，fish 可能是一个不错的选择。

Cheers!

资源:

*   [fish shell 官网][1]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/install-fish-friendly-interactive-shell-linux/

作者：[SK][a]
译者：[kimii](https://github.com/kimii)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://fishshell.com/
[2]:http://www.ostechnix.com/wp-content/uploads/2017/12/fish-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2017/12/fish-2.png
[4]:http://www.ostechnix.com/wp-content/uploads/2017/12/fish-6.png
[5]:http://www.ostechnix.com/wp-content/uploads/2017/12/fish-3.png
[6]:http://www.ostechnix.com/wp-content/uploads/2017/12/fish-4.png
[7]:http://www.ostechnix.com/wp-content/uploads/2017/12/fish-5.png
