Powerline：给 Vim 和 Bash 提供更棒的状态行和提示信息
=================================================

Powerline 是一个极棒的 [Vim 编辑器][1]的状态行插件，这个插件是使用 Python 开发的，主要用于显示状态行和提示信息，适用于很多软件，比如 bash、zsh、tmux 等等。

[
 ![Install Powerline Statuslines in Linux](http://www.tecmint.com/wp-content/uploads/2015/10/Install-Powerline-Statuslines-in-Linux-620x297.png) 
][2]

*Powerline 使 Linux 终端更具威力*

### 特色

1. 使用 python 编写，使其更具扩展性且功能丰富
2. 稳定易测的代码库，兼容 python 2.6+ 和 python 3
3. 支持多种 Linux 功能及工具的提示和状态栏
4. 通过 JSON 保存配置和颜色方案
5. 快速、轻量级，具有后台守护进程支持，提供更佳的性能

### Powerline 效果截图

[
 ![Powerline Vim Statuslines](http://www.tecmint.com/wp-content/uploads/2015/10/Powerline-Vim-Statuslines.png) 
][3]

*Vim 中 Powerline 状态行效果*

在本文中，我会介绍如何安装 Powerline 及其字体，以及如何在 RedHat 和 Debian 类的系统中使 Bash 和 Vim 支持 Powerline。

### 第一步：准备好安装 Powerline 所需的软件

由于和其它无关项目之间存在命名冲突，因此 powerline 只能放在 PyPI（Python Package Index）中的 `powerline-status` 包下.

为了从 PyPI 中安装该包，需要先准备好 `pip`（该工具专门用于 Python 包的管理）工具。所以首先要在 Linux 系统下安装好 `pip` 工具。

#### 在 Debian、Ubuntu 和 Linux Mint 中安装 pip

```
# apt-get install python-pip
```
**示例输出：**

```
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Recommended packages:
python-dev-all python-wheel
The following NEW packages will be installed:
python-pip
0 upgraded, 1 newly installed, 0 to remove and 533 not upgraded.
Need to get 97.2 kB of archives.
After this operation, 477 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu/ trusty-updates/universe python-pip all 1.5.4-1ubuntu3 [97.2 kB]
Fetched 97.2 kB in 1s (73.0 kB/s)     
Selecting previously unselected package python-pip.
(Reading database ... 216258 files and directories currently installed.)
Preparing to unpack .../python-pip_1.5.4-1ubuntu3_all.deb ...
Unpacking python-pip (1.5.4-1ubuntu3) ...
Processing triggers for man-db (2.6.7.1-1ubuntu1) ...
Setting up python-pip (1.5.4-1ubuntu3) ...
```

#### 在 CentOS、RHEL 和 Fedora 中安装 pip

在 Fedora 类系统中，需要先打开 [epel 仓库][4]，然后按照如下方法安装 pip 包。

```
# yum install python-pip          
# dnf install python-pip                     [Fedora 22+ 以上]           
```

**示例输出：**

```
Installing:
python-pip          noarch          7.1.0-1.el7             epel          1.5 M
Transaction Summary
=================================================================================
Install  1 Package
Total download size: 1.5 M
Installed size: 6.6 M
Is this ok [y/d/N]: y
Downloading packages:
python-pip-7.1.0-1.el7.noarch.rpm                         | 1.5 MB  00:00:01     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
Installing : python-pip-7.1.0-1.el7.noarch                                 1/1 
Verifying  : python-pip-7.1.0-1.el7.noarch                                 1/1 
Installed:
python-pip.noarch 0:7.1.0-1.el7                                                
Complete!
```

### 第二步：在 Linux 中安装 Powerline

现在可以从 Git 仓库中安装 Powerline 的最新开发版。在此之前系统需要安装好 Git 工具以便可以从仓库拉下代码。

```
# apt-get install git
# yum install git
# dnf install git
```

然后你可以通过 `pip` 命令安装 Powerline。

```
# pip install git+git://github.com/Lokaltog/powerline
```

**示例输出：**

```
Cloning git://github.com/Lokaltog/powerline to /tmp/pip-WAlznH-build
Running setup.py (path:/tmp/pip-WAlznH-build/setup.py) egg_info for package from git+git://github.com/Lokaltog/powerline
warning: no previously-included files matching '*.pyc' found under directory 'powerline/bindings'
warning: no previously-included files matching '*.pyo' found under directory 'powerline/bindings'
Installing collected packages: powerline-status
Found existing installation: powerline-status 2.2
Uninstalling powerline-status:
Successfully uninstalled powerline-status
Running setup.py install for powerline-status
warning: no previously-included files matching '*.pyc' found under directory 'powerline/bindings'
warning: no previously-included files matching '*.pyo' found under directory 'powerline/bindings'
changing mode of build/scripts-2.7/powerline-lint from 644 to 755
changing mode of build/scripts-2.7/powerline-daemon from 644 to 755
changing mode of build/scripts-2.7/powerline-render from 644 to 755
changing mode of build/scripts-2.7/powerline-config from 644 to 755
changing mode of /usr/local/bin/powerline-config to 755
changing mode of /usr/local/bin/powerline-lint to 755
changing mode of /usr/local/bin/powerline-render to 755
changing mode of /usr/local/bin/powerline-daemon to 755
Successfully installed powerline-status
Cleaning up...
```

### 第三步：在 Linux 中安装 Powerline 的字体

Powerline 使用特殊的符号来为开发者显示特殊的箭头效果和符号内容。因此你的系统中必须要有符号字体或者补丁过的字体。

通过下面的 [wget][5] 命令下载最新的系统字体及字体配置文件。

```
# wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
# wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
```

然后你将下载的字体放到字体目录下 `/usr/share/fonts` 或者 `/usr/local/share/fonts`，或者你可以通过 `xset q` 命令找到一个有效的字体目录。

```
# mv PowerlineSymbols.otf /usr/share/fonts/
```

接下来你需要通过如下命令更新你系统的字体缓存。

```
# fc-cache -vf /usr/share/fonts/
```

其次安装字体配置文件。

```
# mv 10-powerline-symbols.conf /etc/fonts/conf.d/
```

注意：如果相应的符号没有出现，可以尝试关闭终端会话并重启 X window，这样就会生效了。

### 第四步：给 Bash Shell 和 Vim 状态行设置 Powerline

在这一节将介绍 bash shell 和 vim 编辑器中关于 Powerline 的配置。首先通过在 `~/.bashrc` 中添加如下内容以便设置终端为 256 色。

```
export TERM="screen-256color"
```

#### 打开 Bash Shell 中的 Powerline

如果希望在 bash shell 中默认打开 Powerline，可以在 `~/.bashrc` 中添加如下内容。

首先通过如下命令获取 powerline 的安装位置。

```
# pip show powerline-status
Name: powerline-status
Version: 2.2.dev9999-git.aa33599e3fb363ab7f2744ce95b7c6465eef7f08
Location: /usr/local/lib/python2.7/dist-packages
Requires: 
```

一旦找到 powerline 的具体位置后，根据你系统的情况替换到下列行中的 `/usr/local/lib/python2.7/dist-packages` 对应的位置。

```
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
```

然后退出后重新登录，现在 powerline 的状态行应该如下显示了。

[
 ![Bash Powerline Statuslines](http://www.tecmint.com/wp-content/uploads/2015/10/Bash-Powerline-Statuslines.gif) 
][6]

现在切换目录并注意显示你当前路径的面包屑导航提示的变化。

如果远程 Linux 服务器上安装了 powerline，你能看到后台挂起的任务，当你用 ssh 登录上去时，会看到该提示增加了主机名。

#### 在 Vim 中打开 Powerline

如果你喜欢使用 vim，正好有一个 vim 的强力插件。可以在 `~/.vimrc` 中添加如下内容打开该插件（LCTT 译注：注意同样需要根据你的系统情况修改路径）。

```
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
```

然后你打开 vim 后会看到一个新的状态行:

[
 ![Vim Powerline Statuslines](http://www.tecmint.com/wp-content/uploads/2015/10/Vim-Powerline-Statuslines.gif) 
][7]

### 总结

Powerline 可以在某些软件中提供颜色鲜艳、很优美的状态行及提示内容，这对编程环境有利。希望这篇指南对您有帮助，如果您需要帮助或者有任何好的想法，请留言给我。

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/7badddbc53297b2e8ed7011cf45df0c0?s=128&d=blank&r=g)

我是Ravi Saive，TecMint的作者。一个喜欢分享诀窍和想法的电脑极客及Linux专家。我的大部分服务都运行在开源平台Linux中。关注我的Twitter，Facebook和Google+。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/powerline-adds-powerful-statuslines-and-prompts-to-vim-and-bash/

作者：[Ravi Saive][a]
译者：[beyondworld](https://github.com/beyondworld)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/vi-editor-usage/
[2]:http://www.tecmint.com/wp-content/uploads/2015/10/Install-Powerline-Statuslines-in-Linux.png
[3]:http://www.tecmint.com/wp-content/uploads/2015/10/Powerline-Vim-Statuslines.png
[4]:https://linux.cn/article-2324-1.html
[5]:http://www.tecmint.com/10-wget-command-examples-in-linux/
[6]:http://www.tecmint.com/wp-content/uploads/2015/10/Bash-Powerline-Statuslines.gif
[7]:http://www.tecmint.com/wp-content/uploads/2015/10/Vim-Powerline-Statuslines.gif
