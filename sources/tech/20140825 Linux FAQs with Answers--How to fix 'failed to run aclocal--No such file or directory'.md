Linux FAQs with Answers--How to fix “failed to run aclocal: No such file or directory”
================================================================================
> **Question**: I am trying to build a program on Linux. The development release of the program comes with "autogen.sh" script. When I run it to create configure script, however, I am getting the following error:
> 
>     Can't exec "aclocal": No such file or directory at /usr/share/autoconf/Autom4te/FileUtils.pm line 326.
>     autoreconf: failed to run aclocal: No such file or directory
> 
> How can I fix this problem? 

The development release of a program source code often comes with autogen.sh which is used to prepare a build process, including verifying program functionality and generating configure script. This autogen.sh script then relies on autoreconf to invoke autoconf, automake, aclocal and other related tools.

The missing aclocal is part of automake package. Thus, to fix this error, install the following package.

On Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install automake

On CentOS, Fedora or RHEL:

    $ sudo yum install automake 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fix-failed-to-run-aclocal.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]: