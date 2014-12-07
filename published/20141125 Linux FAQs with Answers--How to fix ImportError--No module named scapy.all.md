Linux有问必答：如何修复“ImportError: No module named scapy.all”
================================================================================
> **问题**：当我运行一个Python应用程序时，出现了这个提示消息“ImportError: No module named scapy.all”。我怎样才能修复这个导入错误呢？

[Scapy][1]是一个用Python写的灵活的数据包生成及嗅探程序。使用Scapy，你可以完成创建任意数据包并发送到网络上、从网络上或转储文件中读取数据包、转换数据包等工作。使用Scapy的通用包处理能力，你可以很容易地完成像SYN扫描、TCP路由跟踪以及OS指纹检测之类的工作。你也可以通过导入，将Scapy整合到其它工具中。

该导入错误表明：你还没有在你的Linux系统上安装Scapy。下面介绍安装方法。

### 安装Scapy到Debian, Ubuntu或Linux Mint ###

     $ sudo apt-get install python-scapy 

### 安装Scapy到Fedora或CentOS/RHEL ###

在CentOS/RHEL上，你首先需要[启用EPEL仓库][2]。

     $ sudo yum install scapy 

### 源码安装Scapy ###

如果你的Linux版本没有提供Scapy包，或者你想要试试最新的Scapy，你可以手工使用源码包安装。

下载[最新版的Scapy][3]，然后按照以下步骤安装。

    $ unzip scapy-latest.zip
    $ cd scapy-2.*
    $ sudo python setup.py install 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/importerror-no-module-named-scapy-all.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.secdev.org/projects/scapy/
[2]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
[3]:http://scapy.net/
