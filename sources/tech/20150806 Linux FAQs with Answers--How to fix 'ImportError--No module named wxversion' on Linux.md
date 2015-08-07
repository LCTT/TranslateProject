Linux FAQs with Answers--How to fix “ImportError: No module named wxversion” on Linux
================================================================================
> **Question:** I was trying to run a Python application on [insert your Linux distro], but I got an error "ImportError: No module named wxversion." How can I solve this error in the Python program? 

    Looking for python... 2.7.9 - Traceback (most recent call last):
      File "/home/dev/playonlinux/python/check_python.py", line 1, in 
        import os, wxversion
    ImportError: No module named wxversion
    failed tests

This error indicates that your Python application is GUI-based, relying on a missing Python module called wxPython. [wxPython][1] is a Python extension module for the wxWidgets GUI library, popularly used by C++ programmers to design GUI applications. The wxPython extension allows Python developers to easily design and integrate GUI within any Python application.

To solve this import error, you need to install wxPython on your Linux, as described below.

### Install wxPython on Debian, Ubuntu or Linux Mint ###

    $ sudo apt-get install python-wxgtk2.8

### Install wxPython on Fedora ###

    $ sudo yum install wxPython

### Install wxPython on CentOS/RHEL ###

wxPython is available on the EPEL repository of CentOS/RHEL, not on base repositories. Thus, first [enable EPEL repository][2] on your system, and then use yum command.

    $ sudo yum install wxPython 

### Install wxPython on Arch Linux ###

    $ sudo pacman -S wxpython 

### Install wxPython on Gentoo ###

    $ emerge wxPython 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/importerror-no-module-named-wxversion.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://wxpython.org/
[2]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html