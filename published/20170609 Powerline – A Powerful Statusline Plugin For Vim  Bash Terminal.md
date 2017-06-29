Powerline：Vim 和 Bash 中的一个强大状态栏插件
============================================================

[Powerline][2] 是 vim、zsh、bash、tmux、IPython、Awesome、bar、fish、lemonbar、pdb、rc、shell、tcsh、wm、i3 和 Qtil 中的一个状态栏插件。它给程序提供了状态栏，并使程序更好看。它用 Python 写成。

它是可扩展的并且功能丰富，它用 Python 写成，非常轻便不需要任何第三方的依赖，只需要一个 Python 解释器。

它的稳定以及可测试的代码库经过完整的测试，并且在 Python 2.6+ 和 Python 3 中工作良好。

最初该状态栏只在 vim 中可用，随后项目进化为许多 Linux 程序如 zsh、bash、tmux、IPython、Awesome、i3 和 Qtil 提供状态栏。

其配置以及配色方案用 JSON 写成。它是一种标准简易的文件格式，可以让用户配置 Powerline 支持的程序。

快速并且轻量级，支持守护进程可以提供更好的性能。

### 安装预先要求

确保你的系统有下面预先要求的包。如果没有，在安装 powerline 之前先安装它们。

对于 Debian 用户，使用 [APT 包管理器][3]或者[Apt-Get 包管理器][4]安装需要的包。

```
$ sudo apt-get install python-pip git
```

对于 openSUSE 用户，使用 [Zypper 包管理器][5]安装需要的包。

```
$ sudo zypper install python-pip git
```

对于 Fedora 用户，使用 [dnf 包管理器][6]安装需要的包。

```
$ sudo dnf install python-pip git
```

对于 Arch Linux 用户，使用 [pacman 包管理器][7]安装需要的包。

```
$ sudo pacman -S python-pip git
```

对于 CentOS/RHEL 用户，使用 [yum 包管理器][8]安装需要的包。

```
$ sudo yum install python-pip git
```

### 如何在 Linux 中安装 Powerline

在本篇中，我们将向你展示如何安装 Powerline。以及如何在基于 Debian 以及 RHEL 的系统中在 Bash、tumx 和 Vim 中使用。

```
$ sudo pip install git+git://github.com/Lokaltog/powerline
```

找出 powerline 安装位置以便配置程序。

```
$ pip show powerline-status
Name: powerline-status
Version: 2.6.dev9999+git.517f38c566456d65a2170f9bc310e6b4f8112282
Summary: The ultimate statusline/prompt utility.
Home-page: https://github.com/powerline/powerline
Author: Kim Silkebaekken
Author-email: kim.silkebaekken+vim@gmail.com
License: MIT
Location: /usr/lib/python2.7/site-packages
Requires: 
```

### 在 Bash Shell 中添加/启用 Powerline

添加下面的行到 `.bashrc` 中，它会默认在基础 shell 中启用 powerline。

```
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi
```

重新加载 `.bashrc` 文件使得 powerline 在当前窗口中立即生效。

```
$ source ~/.bashrc
```

[![](http://www.2daygeek.com/wp-content/uploads/2017/06/install-powerline-in-linux-1.png)][9] 

### 在 tmux 中添加/启用 Powerline

tmux 是最好的终端仿真程序之一，它提供多窗口以及状态栏，但是相比 powerline 的状态栏看上去不那么好。添加下面的的行到 `.tmux.conf` 中，它会默认在 tmux 中启用 powerline。如果你没有找到 `.tmux.conf` 文件，那么创建一个新的。

```
# vi ~/.tmuc.conf

source "/usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf"
```

[![](http://www.2daygeek.com/wp-content/uploads/2017/06/install-powerline-in-linux-2.png)][10] 

### 在 Vim 中添加/启用 Powerline

vim 是管理员最爱的文本编辑器之一。添加下面的行到 `.vmrc` 中，启用 powerline 使 vim 更加强大。注意，在 vim 7.x 中，你可能不会在系统中发现 .vimrc 文件，因此不必担心，创建一个新的文件，并添加下面行。

```
# vi ~/.vmrc

set  rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
```

[![](http://www.2daygeek.com/wp-content/uploads/2017/06/install-powerline-in-linux-3.png)][11] 

[![](http://www.2daygeek.com/wp-content/uploads/2017/06/install-powerline-in-linux-4.png)][12]

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/powerline-adds-powerful-statusline-to-vim-bash-tumx-in-ubuntu-fedora-debian-arch-linux-mint/

作者：[2DAYGEEK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/2daygeek/
[1]:http://www.2daygeek.com/author/2daygeek/
[2]:https://github.com/powerline/powerline
[3]:http://www.2daygeek.com/apt-command-examples/
[4]:http://www.2daygeek.com/apt-get-apt-cache-command-examples/
[5]:http://www.2daygeek.com/zypper-command-examples/
[6]:http://www.2daygeek.com/dnf-command-examples/
[7]:http://www.2daygeek.com/pacman-command-examples/
[8]:http://www.2daygeek.com/yum-command-examples/
[9]:http://www.2daygeek.com/wp-content/uploads/2017/06/install-powerline-in-linux-1.png
[10]:http://www.2daygeek.com/wp-content/uploads/2017/06/install-powerline-in-linux-2.png
[11]:http://www.2daygeek.com/wp-content/uploads/2017/06/install-powerline-in-linux-3.png
[12]:http://www.2daygeek.com/wp-content/uploads/2017/06/install-powerline-in-linux-4.png
