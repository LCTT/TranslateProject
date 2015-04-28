如何在linux上分享你shell命令的输出 
================================================================================
前段时间我发布了一篇关于[shelr.tv][1]这个网站的文章，它提供一个服务允许你从网站上直接分享你的[终端][2]记录。

现在shelr.tv这个网站似乎关闭了，然后我四处寻找是否有类似的网站，于是我发现了[commands.com][3]。

从它的主页上来看，它的服务和其他网站提供的服务是类似的，因此让我们来测试它。

### 步骤 1 – 在网站上注册 ###

只需要[注册][4]一个新的 用户名/密码，或者直接使用你的github账户快速登录。

### 步骤 2 – 下载安装monitor程序 ###

[Monitor][5]是一个命令行工具，它能捕获命令行的输入输出并且发送到commands.com网站上，这个程序是开源的，并托管在github上。

Monitor使得仓库的设置/安装变得更简单。通过它，你能方便地向人们展示最常见的错误与命令的输出。

简而言之，你能方便地和世界分享你的命令及其输出。

通过如下简单几步来安装它：

1) 克隆github上的这个项目的仓库，这样你能获得最新的源代码。

要完成这步，你需要在系统中已经安装了git命令，如果你得到关于这个命令的报错信息，你可以使用包管理工具来安装它，例如：

基于Debian的发布版：

    apt-get install git

Redhat/Centos/Fedora发布版：

    yum install git

现在从终端克隆这个仓库：

    git clone https://github.com/dtannen/monitor.git

2) 安装readline和curl，这些库是通过源码构建程序的先决条件：

基于Debian的发布版：

    apt-get install libreadline-dev libcurl4-openssl-dev

Redhat/Centos/Fedora发布版：

    yum install readline-devel curl-devel

3) 构建程序：

要完成这步，你必须进入刚刚用git克隆的目录，然后编译这个c程序：

    cd monitor
    make
    sudo make install

默认安装将把二进制文件放入/usr/local/bin目录下。

![](http://cdn.linuxaria.com/wp-content/uploads/2014/08/commands.png)

### 步骤 3 – 使用monitor命令###

monitor命令特别简单易用：

    monitor {-d} {-h} {-u <username>}
     
        -d : 不删除/tmp下的文件
        -h : 帮助
        -u : commands.com用户名</username>

要退出monitor程序，需要按ctrl-c。

对我来说这仅仅意味着打开一个终端然后执行这些命令：

    riccio@mint-desktop ~ $ monitor -u ricciocri
    Password: 
     
    Successfully logged in...
    AuthKey saved to /tmp/.riccio.commands.com.  Delete file to return to Anonymous posting.
    monitor$ cd /tmp
    ...

想知道在这之后我使用过的哪个命令吗？我已经把这个会话公开（默认是私有），因此你可以去这个url查看：[https://commands.com/JTNSHRLQJA][6]

在这里，你能看我已经使用过的命令以及它们的输出，一个有趣的选项是“fold/expand”你可以折叠（fold）所有的命令的输出或者仅仅展开（expand）你喜欢的那个命令的输出。

### 总结 ###

这只是一个简单的安装指南，在这个网站上你能参加更多“社会化”的活动，比如评论脚本/shell会话，派生它们或者选择你的最爱。

和github一样，你能派生任何一个公开的脚本/命令并能直接在网站上改变它，然后你也能得到一个公开（或私有）的url。你可以直接运行你脚本，就像这样：

    curl commands.io/JTNSHRLQJA | sh

在网络上储存一些你在电脑/服务器上经常使用到的脚本，这是极好的，通常不要放置任何密码或敏感信息，这样你的信息才足够安全。

--------------------------------------------------------------------------------

via: http://linuxaria.com/article/how-to-share-on-linux-the-output-of-your-shell-commands

译者：[guodongxiaren](https://github.com/guodongxiaren)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linuxaria.com/recensioni/shelr-broadcast-your-linux-shell-on-the-net
[2]:http://linuxaria.com/tag/shell
[3]:https://commands.com/
[4]:https://commands.com/Register/Index
[5]:https://github.com/dtannen/monitor
[6]:https://commands.com/JTNSHRLQJA
