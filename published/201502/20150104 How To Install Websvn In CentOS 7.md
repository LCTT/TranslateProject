在 CentOS 7中安装Websvn
================================================================================
**WebSVN**为你的Subversion提供了一个视图，其设计用来对应Subversion的各种功能。你可以检查任何文件或目录的日志，以及查看任何指定版本中所修改、添加或删除过的文件列表。你也可以检查同一文件两个版本的不同之处，以便确切地查看某个特定的修订版本的变化。

### 特性 ###

WebSVN提供了以下这些特性：

- 易于使用的界面；
- 可自定义的模板系统；
- 彩色文件列表；
- 过错视图；
- 日志信息搜索；
- 支持RSS订阅；

### 安装 ###

我按以下链接来将Subversion安装到CentOS 7。

- [CentOS 7上如何安装Subversion][1]

**1 – 下载websvn到/var/www/html。**

    cd /var/www/html
    wget http://websvn.tigris.org/files/documents/1380/49057/websvn-2.3.3.zip

**2 – 解压zip包。**

    unzip websvn-2.3.3.zip
    mv websvn-2.3.3 websvn

**3 – 安装php到你的系统。**

    yum install php

**4 – 编辑web svn配置。**

    cd /var/www/html/websvn/include
    cp distconfig.php config.php
    vi config.php

----------

    // Configure these lines if your commands aren't on your path.
    //
     $config->setSVNCommandPath('/usr/bin'); // e.g. c:\\program files\\subversion\\bin
     $config->setDiffPath('/usr/bin');
----------
    // For syntax colouring, if option enabled...
     $config->setEnscriptPath('/usr/bin');
     $config->setSedPath('/bin');
----------
    // For delivered tarballs, if option enabled...
     $config->setTarPath('/bin');
----------
    // For delivered GZIP'd files and tarballs, if option enabled...
     $config->setGZipPath('/bin');
----------
    //
     $config->parentPath('/svn/');
----------
    $extEnscript[".pl"] = "perl";
    $extEnscript[".py"] = "python";
    $extEnscript[".sql"] = "sql";
    $extEnscript[".java"] = "java";
    $extEnscript[".html"] = "html";
    $extEnscript[".xml"] = "html";
    $extEnscript[".thtml"] = "html";
    $extEnscript[".tpl"] = "html";
    $extEnscript[".sh"] = "bash";
    ~

保存并退出。

**6 – 重新加载apache并启动websvn链接http://ip/websvn。**

![websvn](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/websvn.png)

一切搞定。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-websvn-centos-7/

作者：[M.el Khamlichi][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/pirat9/
[1]:http://www.unixmen.com/install-subversion-centos-7/
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
