如何在CentOS 7.0 安装 Websvn
================================================================================
大家好，今天我们会在CentOS 7.0 上为 subversion（SVN）安装Web 界面 WebSVN。（subverion 是 apache 的顶级项目，也称为 Apache SVN 或 SVN）

WebSVN 将 Svbverion 的操作你的仓库的各种功能通过 Web 界面提供出来。通过它，我们可以看到任何给定版本的任何文件或者目录的日志，并且可看到所有文件改动、添加、删除的列表。我们同样可以查看两个版本间的差异来知道特定版本改动了什么。

### 特性 ###

WebSVN提供了下面这些特性:

- 易于使用的用户界面
- 可定制的模板系统
- 色彩化的文件列表
- 追溯视图
- 日志信息查询
- RSS支持
- [更多][1]

由于其使用PHP写成，WebSVN同样易于移植和安装。

现在我们将为Subverison安装WebSVN。请确保你的服务器上已经安装了 SVN。如果你还没有安装，你可以按[本教程][2]安装。

安装完SVN后，你需要以下几步。

### 1. 下载 WebSVN ###

你可以从官方网站 http://www.websvn.info/download/ 中下载 WebSVN。我们首先进入 /var/www/html/ 并在这里下载安装包。

    $ sudo -s

**请在shell或者终端中执行上面的命令，因为我们需要切换到root权限来对系统限制区域有访问权。**

    # cd /var/www/html
    # wget http://websvn.tigris.org/files/documents/1380/49057/websvn-2.3.3.zip

![downloading websvn package](http://blog.linoxide.com/wp-content/uploads/2015/01/downloading-websvn.png)

这里，我下载的是最新的2.3.3版本的 websvn。你可以从上面这个网站找到下载链接，用适合你的包的链接来替换上面的链接。

### 2. 解压下载的zip ###

    # unzip websvn-2.3.3.zip

    # mv websvn-2.3.3 websvn

![extracting websvn](http://blog.linoxide.com/wp-content/uploads/2015/01/extracting-websvn.png)

### 3. 安装php ###

    # yum install php

![yum install php](http://blog.linoxide.com/wp-content/uploads/2015/01/yum-install-php.png)

### 4. 编辑WebSVN配置 ###

现在，我们需要拷贝位于 /var/www/html/websvn/include 的 distconfig.php 为 config.php，并且接着编辑该配置文件。

    # cd /var/www/html/websvn/include

    # cp distconfig.php config.php

    # nano config.php

现在我们需要按如下改变文件。完成之后，请保存并退出。

    // Configure these lines if your commands aren't on your path.
    //
     $config->setSVNCommandPath('/usr/bin'); // e.g. c:\\program files\\subversion\\bin
     $config->setDiffPath('/usr/bin');
    
    // For syntax colouring, if option enabled...
     $config->setEnscriptPath('/usr/bin');
     $config->setSedPath('/bin');
    
    // For delivered tarballs, if option enabled...
     $config->setTarPath('/bin');
    
    // For delivered GZIP'd files and tarballs, if option enabled...
     $config->setGZipPath('/bin');
    
    //
     $config->parentPath('/svn/');
    
    $extEnscript[".pl"] = "perl";
    $extEnscript[".py"] = "python";
    $extEnscript[".sql"] = "sql";
    $extEnscript[".java"] = "java";
    $extEnscript[".html"] = "html";
    $extEnscript[".xml"] = "html";
    $extEnscript[".thtml"] = "html";
    $extEnscript[".tpl"] = "html";
    $extEnscript[".sh"] = "bash";

![websvn config file](http://blog.linoxide.com/wp-content/uploads/2015/01/config-file-websvn.png)

### 5. 启动 WebSVN ###

现在，我们将近完成了。现在需要重启Apache服务。你可以用下面的命令。

    # systemctl restart httpd.service

接着我们在浏览器中打开WebSVN，输入 http:// IP地址/websvn ，或者你在本地的话，你可以输入 http://localhost/websvn 。

![websvn successfully installed](http://blog.linoxide.com/wp-content/uploads/2015/01/websvn-success.png)

**注意**: 如果你遇到一个像"Unable to find "enscript" tool at location "/usr/bin/enscript"这样的问题，那么你需要使用“yum install enscript”安装enscript来修复这个问题。

### 总结 ###

好了，我们已经在CentOS 7上完成WebSVN的安装了。这个教程同样适用于RHEL 7。WebSVN 提供了 Subverion 中的各种功能来查看你的仓库。你可以看到任何给定版本的任何文件或者目录的日志，并且看到所有文件改动、添加、删除的列表。

如果你有任何问题、评论、反馈请在下面的评论栏中留下，来让我们知道该添加什么和改进。谢谢！ 用用看吧。:-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-websvn-subversion-centos-7/

作者：[Arun Pyasi][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.websvn.info/features/
[2]:http://linoxide.com/linux-how-to/install-apache-svn-subversion-centos-7/
