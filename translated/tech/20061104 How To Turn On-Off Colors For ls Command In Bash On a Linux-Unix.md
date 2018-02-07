如何在 Linux/Unix 的 Bash 中打开/关闭 ls 命令颜色
======

如何在 Linux或类 Unix 操作系统上的 bash shell 中打开或关闭文件名称颜色（ls 命令颜色）？

大多数现代 Linux 发行版和 Unix 系统都有定义文件名称颜色的别名。然而，ls 命令负责在屏幕上显示文件、目录和其他文件系统对象的颜色。

默认情况下，文件类型不会用颜色区分。你需要在 Linux 上将 -color 选项传递给 ls 命令。如果你正在使用基于 OS X 或 BSD 的系统，请将 -G 选项传递给 ls 命令。打开或关闭颜色的语法如下。

#### 如何关闭 ls 命令的颜色

输入以下命令
`$ ls --color=none`
或者用 unalias 命令删除别名：
`$ unalias ls`
请注意，下面的 bash shell 别名被定义为用 ls 命令显示颜色。租个组合使用[ alias 命令][1]和[ grep 命令][2]：
`$ alias | grep ls`
示例输出：
```
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
```

#### 如何打开 ls 命令的颜色

使用以下任何一个命令：
```
$ ls --color=auto
$ ls --color=tty
```
如果你想要的话，[定义 bash shell 别名][3]：
`alias ls='ls --color=auto'`
你可以在 ~/.bash_profile 或 [~/.bashrc file][4] 中添加或删除 ls 别名 。使用文本编辑器（如 vi）编辑文件：
`$ vi ~/.bashrc`
追加下面的代码：
```
# my ls command aliases #
alias ls = 'ls --color=auto'
```

[在 Vi/Vim 文本编辑器中保存并关闭文件][5]。

#### 关于 \*BSD/macOS/Apple OS X  中 ls 命令的注意点

将 -G 选项传递给 ls 命令以在 {Free、Net、Open} BSD 或 macOS 和 Apple OS X Unix 操作系统家族上启用彩色输出：
`$ ls -G`
示例输出：
[![How to enable colorized output for the ls command in Mac OS X Terminal][6]][7]
如何在 Mac OS X 终端中为 ls 命令启用彩色输出

#### 如何临时跳过 ls 命令彩色输出？

你可以使用以下任何一种语法[暂时禁用 bash shell 别名][8]：
`\ls
/bin/ls
command ls
'ls'`


#### 关于作者

作者是 nixCraft 的创建者，经验丰富的系统管理员，也是 Linux 操作系统/Unix shell 脚本的培训师。他曾与全球客户以及IT、教育、国防和太空研究以及非营利部门等多个行业合作。在 [Twitter][9]、[Facebook][10]、[Google +][11] 上关注他。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-turn-on-or-off-colors-in-bash/

作者：[Vivek Gite][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/
[1]:https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html (See Linux/Unix alias command examples for more info)
[2]:https://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/ (See Linux/Unix grep command examples for more info)
[3]:https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
[4]:https://bash.cyberciti.biz/guide/~/.bashrc
[5]:https://www.cyberciti.biz/faq/linux-unix-vim-save-and-quit-command/
[6]:https://www.cyberciti.biz/media/new/faq/2016/01/color-ls-for-Mac-OS-X.jpg
[7]:https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/
[8]:https://www.cyberciti.biz/faq/bash-shell-temporarily-disable-an-alias/
[9]:https://twitter.com/nixcraft
[10]:https://facebook.com/nixcraft
[11]:https://plus.google.com/+CybercitiBiz
