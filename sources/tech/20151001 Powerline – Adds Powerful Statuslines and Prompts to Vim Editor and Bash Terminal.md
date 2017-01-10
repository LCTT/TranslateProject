
beyondworld 翻译中


Powerline – Adds Powerful Statuslines and Prompts to Vim Editor and Bash Terminal
============================================================

Powerline is a great statusline plugin for [Vim editor][1], which is developed in Python and provides statuslines and prompts for many other applications such as bash, zsh, tmux and many more.

[
 ![Install Powerline Statuslines in Linux](http://www.tecmint.com/wp-content/uploads/2015/10/Install-Powerline-Statuslines-in-Linux-620x297.png) 
][2]

Add Power to Linux Terminal with Powerline Tool

#### Features

1.  It is written in Python, which makes it extensible and feature rich.
2.  Stable and testable code base, which works well with Python 2.6+ and Python 3.
3.  It also supports prompts and statuslines in several Linux utilities and tools.
4.  It has configurations and decorator colors developed using JSON.
5.  Fast and lightweight, with daemon support, which provides even more better performance.

#### Powerline Screenshots

[
 ![Powerline Vim Statuslines](http://www.tecmint.com/wp-content/uploads/2015/10/Powerline-Vim-Statuslines.png) 
][3]

Powerline Vim Statuslines

In this article, I will show you how to install Powerline and Powerline fonts and how to use with Bash and Vimunder RedHat and Debian based systems.

### Step 1: Installing Generic Requirements for Powerline

Due to a naming conflict with some other unrelated projects, powerline program is available on PyPI (Python Package Index) under the package name as powerline-status.

To install packages from PyPI, we need a ‘pip‘ (package management tool for installing Python packages). So, let’s first install pip tool under our Linux systems.

#### Install Pip on Debian, Ubuntu and Linux Mint

```
# apt-get install python-pip
```

##### Sample Output

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

#### Install Pip on CentOS, RHEL and Fedora

Under Fedora-based systems, you need to first [enable epel-repository][4] and then install pip package as shown.

```
# yum install python-pip          
# dnf install python-pip                     [On Fedora 22+ versions]           
```

##### Sample Output

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

### Step 2: Installing Powerline Tool in Linux

Now it’s’ time to install Powerline latest development version from the Git repository. For this, your system must have git package installed in order to fetch the packages from Git.

```
# apt-get install git
# yum install git
# dnf install git
```

Next you can install Powerline with the help of pip command as shown.

```
# pip install git+git://github.com/Lokaltog/powerline
```

##### Sample Output

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

### Step 3: Installing Powerline Fonts in Linux

Powerline uses special glyphs to show special arrow effect and symbols for developers. For this, you must have a symbol font or a patched font installed on your systems.

Download the most recent version of the symbol font and fontconfig configuration file using following [wget command][5].

```
# wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
# wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
```

Then you need to move the font to your fonts directory, /usr/share/fonts/ or /usr/local/share/fonts as follows or you can get the valid font paths by using command `xset q`.

```
# mv PowerlineSymbols.otf /usr/share/fonts/
```

Next, you need to update your system’s font cache as follows.

```
# fc-cache -vf /usr/share/fonts/
```

Now install the fontconfig file.

```
# mv 10-powerline-symbols.conf /etc/fonts/conf.d/
```

Note: If custom symbols doesn’t appear, then try to close all terminal sessions and restart X window for the changes to take effect.

### Step 4: Setting Powerline for Bash Shell and Vim Statuslines

In this section we shall look at configuring Powerline for bash shell and vim editor. First make your terminal to support 256color by adding the following line to ~/.bashrc file as follows.

```
export TERM=”screen-256color” 
```

#### Enable Powerline on Bash Shell

To enable Powerline in bash shell by default, you need to add the following snippet to your ~/.bashrc file.

First get the location of installed powerline using following command.

```
# pip show powerline-status
Name: powerline-status
Version: 2.2.dev9999-git.aa33599e3fb363ab7f2744ce95b7c6465eef7f08
Location: /usr/local/lib/python2.7/dist-packages
Requires: 
```

Once you know the actual location of powerline, make sure to replace the location in the below line as per your system suggested.

```
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
```

Now try to logout and login back again, you will see powerline statuesline as shown below.

[
 ![Bash Powerline Statuslines](http://www.tecmint.com/wp-content/uploads/2015/10/Bash-Powerline-Statuslines.gif) 
][6]

Try changing or switching to different directories and keep a eye on “breadcrumb” prompt changes to show your current location.

You will also be able to watch pending background jobs and if powerline is installed on a remote Linux machine, you can notice that the prompt adds the hostname when you connect via SSH.

#### Enable Powerline for Vim

If vim is your favorite editor, luckily there is a powerful plugin for vim, too. To enable this plugin, add these lines to `~/.vimrc` file.

```
set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
```

Now you can launch vim and see a spiffy new status line:

[
 ![Vim Powerline Statuslines](http://www.tecmint.com/wp-content/uploads/2015/10/Vim-Powerline-Statuslines.gif) 
][7]

### Summary

Powerline helps to set colorful and beautiful statuslines and prompts in several applications, good for coding environments. I hope you find this guide helpful and remember to post a comment if you need any help or have additional ideas.

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/7badddbc53297b2e8ed7011cf45df0c0?s=128&d=blank&r=g)

I am Ravi Saive, creator of TecMint. A Computer Geek and Linux Guru who loves to share tricks and tips on Internet. Most Of My Servers runs on Open Source Platform called Linux. Follow Me: Twitter, Facebook and Google+

--------------------------------------------------------------------------------

via: http://www.tecmint.com/powerline-adds-powerful-statuslines-and-prompts-to-vim-and-bash/

作者：[Ravi Saive][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/vi-editor-usage/
[2]:http://www.tecmint.com/wp-content/uploads/2015/10/Install-Powerline-Statuslines-in-Linux.png
[3]:http://www.tecmint.com/wp-content/uploads/2015/10/Powerline-Vim-Statuslines.png
[4]:http://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/
[5]:http://www.tecmint.com/10-wget-command-examples-in-linux/
[6]:http://www.tecmint.com/wp-content/uploads/2015/10/Bash-Powerline-Statuslines.gif
[7]:http://www.tecmint.com/wp-content/uploads/2015/10/Vim-Powerline-Statuslines.gif
