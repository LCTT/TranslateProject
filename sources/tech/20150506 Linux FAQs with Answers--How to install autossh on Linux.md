Linux FAQs with Answers--How to install autossh on Linux
================================================================================
> **Question**: I would like to install autossh on [insert your Linux distro]. How can I do that? 

[autossh][1] is an open-source tool that allows you to monitor an SSH session and restart it automatically should it gets disconnected or stops forwarding traffic. autossh assumes that [passwordless SSH login][2] for a destination host is already setup, so that it can restart a broken SSH session without user's involvement.

autossh comes in handy when you want to set up [reverse SSH tunnels][3] or [mount remote folders over SSH][4]. Essentially in any situation where persistent SSH sessions are required, autossh can be useful.

![](https://farm8.staticflickr.com/7786/17150854870_63966e78bc_c.jpg)

Here is how to install autossh on various Linux distributions.

### Install Autossh on Debian or Ubuntu ###

autossh is available in base repositories of Debian based systems, so installation is easy.

    $ sudo apt-get install autossh 

### Install Autossh on Fedora ###

Fedora repositories also carry autossh package. So simply use yum command.

    $ sudo yum install autossh 

### Install Autossh on CentOS or RHEL ###

For CentOS/RHEL 6 or earlier, enable [Repoforge repository][5] first, and then use yum command.

    $ sudo yum install autossh 

For CentOS/RHEL 7, autossh is no longer available in Repoforge repository. You will need to build it from the source (explained below).

### Install Autossh on Arch Linux ###

    $ sudo pacman -S autossh 

### Compile Autossh from the Source on Debian or Ubuntu ###

If you would like to try the latest version of autossh, you can build it from the source as follows.

    $ sudo apt-get install gcc make
    $ wget http://www.harding.motd.ca/autossh/autossh-1.4e.tgz
    $ tar -xf autossh-1.4e.tgz
    $ cd autossh-1.4e
    $ ./configure
    $ make
    $ sudo make install 

### Compile Autossh from the Source on CentOS, Fedora or RHEL ###

On CentOS/RHEL 7, autossh is not available as a pre-built package. So you'll need to compile it from the source as follows.

    $ sudo yum install wget gcc make
    $ wget http://www.harding.motd.ca/autossh/autossh-1.4e.tgz
    $ tar -xf autossh-1.4e.tgz
    $ cd autossh-1.4e
    $ ./configure
    $ make
    $ sudo make install 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-autossh-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://www.harding.motd.ca/autossh/
[2]:http://xmodulo.com/how-to-enable-ssh-login-without.html
[3]:http://xmodulo.com/access-linux-server-behind-nat-reverse-ssh-tunnel.html
[4]:http://xmodulo.com/how-to-mount-remote-directory-over-ssh-on-linux.html
[5]:http://xmodulo.com/how-to-set-up-rpmforge-repoforge-repository-on-centos.html