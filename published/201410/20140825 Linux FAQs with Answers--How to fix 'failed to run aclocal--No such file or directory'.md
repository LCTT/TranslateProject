Linux有问必答:如何修复“运行aclocal失败：没有该文件或目录”
================================================================================
> **问题**：我试着在Linux上构建一个程序，该程序的开发版本是使用“autogen.sh”脚本进行的。当我运行它来创建配置脚本时，却发生了下面的错误：
>
>     Can't exec "aclocal": No such file or directory at /usr/share/autoconf/Autom4te/FileUtils.pm line 326.
>     autoreconf: failed to run aclocal: No such file or directory
> 
> 我怎样才能修复这个程序？

开发版本常常是通过autogen.sh使用程序源代码生成的，构建过程包括验证程序功能和生成配置脚本。autogen.sh脚本依赖于autoreconf来调用autoconf，automake，aclocal和其它相关工具。

丢失的aclocal是automake包的一部分，因此，要修复该错误，请安装以下包。

在Debian，Ubuntu或Linux Mint上：

    $ sudo apt-get install automake

在CentOS，Fedora或RHEL上：

    $ sudo yum install automake 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fix-failed-to-run-aclocal.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

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
