Linux有问必答——如何修复Linux上的“ImportError: No module named wxversion”错误
================================================================================

> **问题** 我试着在[你的Linux发行版]上运行一个Python应用，但是我得到了这个错误"ImportError: No module named wxversion."。我怎样才能解决Python程序中的这个错误呢？

    Looking for python... 2.7.9 - Traceback (most recent call last):
      File "/home/dev/playonlinux/python/check_python.py", line 1, in 
        import os, wxversion
    ImportError: No module named wxversion
    failed tests

该错误表明，你的Python应用是基于GUI的，依赖于一个名为wxPython的缺失模块。[wxPython][1]是一个用于wxWidgets GUI库的Python扩展模块，普遍被C++程序员用来设计GUI应用。该wxPython扩展允许Python开发者在任何Python应用中方便地设计和整合GUI。
To solve this import error, you need to install wxPython on your Linux, as described below.

### 安装wxPython到Debian，Ubuntu或Linux Mint ###

    $ sudo apt-get install python-wxgtk2.8

### 安装wxPython到Fedora ###

    $ sudo yum install wxPython

### 安装wxPython到CentOS/RHEL ###

wxPython可以在CentOS/RHEL的EPEL仓库中获取到，而基本仓库中则没有。因此，首先要在你的系统中[启用EPEL仓库][2]，然后使用yum命令来安装。

    $ sudo yum install wxPython 

### 安装wxPython到Arch Linux ###

    $ sudo pacman -S wxpython 

### 安装wxPython到Gentoo ###

    $ emerge wxPython 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/importerror-no-module-named-wxversion.html

作者：[Dan Nanni][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://wxpython.org/
[2]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
