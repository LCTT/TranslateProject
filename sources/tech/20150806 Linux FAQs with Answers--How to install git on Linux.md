Translating by Ping

Linux FAQs with Answers--How to install git on Linux
================================================================================
> **Question:** I am trying to clone a project from a public Git repository, but I am getting "git: command not found" error. How can I install git on [insert your Linux distro]? 

Git is a popular open-source version control system (VCS) originally developed for Linux environment. Contrary to other VCS tools like CVS or SVN, Git's revision control is considered "distributed" in a sense that your local Git working directory can function as a fully-working repository with complete history and version-tracking capabilities. In this model, each collaborator commits to his or her local repository (as opposed to always committing to a central repository), and optionally push to a centralized repository if need be. This brings in scalability and redundancy to the revision control system, which is a must in any kind of large-scale collaboration.

![](https://farm1.staticflickr.com/341/19433194168_c79d4570aa_b.jpg)

### Install Git with a Package Manager ###

Git is shipped with all major Linux distributions. Thus the easiest way to install Git is by using your Linux distro's package manager.

**Debian, Ubuntu, or Linux Mint**

    $ sudo apt-get install git

**Fedora, CentOS or RHEL**

    $ sudo yum install git

**Arch Linux**

    $ sudo pacman -S git

**OpenSUSE**

    $ sudo zypper install git

**Gentoo**

    $ emerge --ask --verbose dev-vcs/git

### Install Git from the Source ###

If for whatever reason you want to built Git from the source, you can follow the instructions below.

**Install Dependencies**

Before building Git, first install dependencies.

**Debian, Ubuntu or Linux**

    $ sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev asciidoc xmlto docbook2x

**Fedora, CentOS or RHEL**

    $ sudo yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel asciidoc xmlto docbook2x

#### Compile Git from the Source ####

Download the latest release of Git from [https://github.com/git/git/releases][1]. Then build and install Git under /usr as follows.

Note that if you want to install it under a different directory (e.g., /opt), replace "--prefix=/usr" in configure command with something else.

    $ cd git-x.x.x
    $ make configure
    $ ./configure --prefix=/usr
    $ make all doc info
    $ sudo make install install-doc install-html install-info

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-git-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:https://github.com/git/git/releases
