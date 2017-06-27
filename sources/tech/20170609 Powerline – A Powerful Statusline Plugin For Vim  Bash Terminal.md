translating---geekpi

Powerline – A Powerful Statusline Plugin For Vim & Bash Terminal
============================================================


[Powerline][2] is a statusline plugin for vim, zsh, bash, tmux, IPython, Awesome, bar, fish, lemonbar, pdb, rc, shell, tcsh, wm, i3 and Qtil. It provides statuslines to applications and make all applications more beautiful. It’s written in Python.

It’s Extensible and feature rich, written in Python which is very thin and doesn’t required any third-party dependencies other than a Python interpreter.

Stable and testable code base which is throughly tested and works fine with Python 2.6+ and Python 3.

Statuslines Originally created exclusively for vim, later the project has evolved to provide statuslines in many Linux applications such as zsh, bash, tmux, IPython, Awesome, i3 and Qtil.

Configuration and colorschemes written in JSON. It’s a standard and easy file format that allows user to configure supported applications with Powerline’s.

Fast and lightweight, with daemon support for even better performance.

#### Install pre requisites

Make sure your system should have below pre requisite packages. If no, install before proceeding powerline installation.

For Debian users, use [APT Package Manager][3] or [Apt-Get Package Manager][4] to install Audit package.

```
$ sudo apt-get install python-pip git
```

For openSUSE users, use [Zypper Package Manager][5] to install Audit package.

```
$ sudo zypper install python-pip git
```

For Fedora users, use [dnf Package Manager][6] to install Audit package.

```
$ sudo dnf install python-pip git
```

For Arch Linux users, use [pacman Package Manager][7] to install Audit package.

```
$ sudo pacman -S python-pip git
```

For CentOS/RHEL user, use [yum Package Manager][8] to install Audit package.

```
$ sudo yum install python-pip git
```

#### How to install Powerline in Linux

In this article, we are going to show you how to install Powerline. Also show you how to use with Bash, tumx & Vim in Debian and RHEL based systems.

```
$ sudo pip install git+git://github.com/Lokaltog/powerline
```

Find the powerline installed location in order to configure with applications.

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

#### Add/Enable Powerline on Bash Shell

Add following lines to your `.bashrc` file which will enable powerline to base shell by default.

```
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi
```

Reload the `.bashrc` file to take immediate effect to get the powerline in the same window.

```
$ source ~/.bashrc
```

 [![](http://www.2daygeek.com/wp-content/uploads/2017/06/install-powerline-in-linux-1.png)][9] 

#### Add/Enable Powerline on tmux

Tmux is one of the best terminal emulator that offers multiple window and statusline but is not looks good compare with powerline statusline. Add following line to your `.tmux.conf` file which will enable powerline to tmux by default. If you don’t found `.tmux.conf` file then create a new one.

```
# vi ~/.tmuc.conf

source "/usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf"
```

 [![](http://www.2daygeek.com/wp-content/uploads/2017/06/install-powerline-in-linux-2.png)][10] 

#### Add/Enable Powerline on Vim

Vim is one of the favourite text editor for admins. Enable powerline to add more power to vim by adding below lines into `.vmrc`file. Make a note, in vim 7.x you may not found the .vmrc file in system so don’t worry create a new one and add below lines that’s it.

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

作者：[ 2DAYGEEK · ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
