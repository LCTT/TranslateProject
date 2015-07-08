Linux中，创建聊天服务器、移除冗余软件包的实用命令
=============================================================================
这里,我们来看Linux命令行实用技巧的下一个部分。如果你错过了Linux Tracks之前的文章，可以从这里找到。

- [5个有趣的Linux命令行技巧][1]

本篇中，我们将会介绍6个命令行小技巧，包括使用Netcat命令创建Linux命令行聊天，从某个命令的输出中对某一列做加法，移除Debian和CentOS上多余的包，从命令行中获取本地与远程的IP地址，在终端获得彩色的输出与解码各样的颜色，最后是Linux命令行里井号标签的使用。让我们来一个一个地看一下。

![Linux Commandline Chat Server](http://www.tecmint.com/wp-content/uploads/2015/04/linux-commandline-chat-server.jpg)

*6个实用的命令行技巧*

### 1. 创建Linux命令行聊天服务 ###

我们大家使用聊天服务都有很长一段时间了。对于Google Chat，Hangout，Facebook Chat，Whatsapp，Hike和其他一些应用与集成的聊天服务，我们都很熟悉了。那你知道Linux的nc命令可以使你的Linux机器变成一个聊天服务器，而仅仅只需要一行命令吗。什么是nc命令，它又是怎么工作的呢？

nc即Linux netcat命令。nc就像瑞士军刀一样，内建了大量的功能。nc可用做调式工具，调查工具，使用TCP/UDP读写网络连接，DNS正向/反向查询等等。

nc主要用在端口扫描，文件传输，后台和端口监听。nc可以使用任何闲置的端口和任何本地网络源地址。

使用nc命令（在192.168.0.7的服务器上）创建一个命令行即时信息传输服务器。

	$ nc -l -vv -p 11119

对上述命令的解释。

- -v : 显示冗余信息
- -vv : 显示更多的冗余信息
- -p : 本地端口号

你可以用任何其他的本地端口号替换11119。

接下来在客户端机器（IP地址：192.168.0.15），运行下面的命令初始化聊天会话（这里需要上面提到的信息服务器正在运行）。

	$ nc 192.168.0.7:11119

![Linux Commandline Chat with nc Command](http://www.tecmint.com/wp-content/uploads/2015/04/Chat-on-Linux-Commandline.gif)

**注意**：你可以按下ctrl+c终止会话，同时nc聊天是一个一对一的服务。

### 2. Linux中如何统计某一列的总值 ###

如何在终端里统计某个命令的输出中其中一列的数值总和，

‘ls -l’命令的输出。

	$ ls -l

![Sum Numerical Values](http://www.tecmint.com/wp-content/uploads/2015/04/Sum-Values.gif)

注意到第二列代表软连接的数量，第五列则是文件的大小。假设我们需要汇总第五列的数值。

仅仅列出第五列的内容。我们会使用‘awk’命令做到这点。‘$5’即代表第五列。

    $ ls -l | awk '{print $5}'

![List Content Column](http://www.tecmint.com/wp-content/uploads/2015/04/List-Content-Column.gif)

现在，通过管道连接，使用awk打印出第五列数值的总和。

    $ ls -l | awk '{print $5}' | awk '{total = total + $1}END{print total}'

![Sum and Print Columns](http://www.tecmint.com/wp-content/uploads/2015/04/Sum-Columns.gif)

### 在Linux里如何移除废弃包 ###

废弃包是指那些作为其他包的依赖而被安装，但是当源包被移除之后就不再需要的包。

假设我们安装了一个叫gtprogram的软件包，其依赖是gtdependency。除非我们安装了gtdependency，否则安装不了gtprogram。

当我们移除gtprogram的时候，默认并不会移除gtdependency。并且如果我们不移除gtdependency的话，它就会遗留下来成为废弃包，与其他任何包再无联系。

    # yum autoremove                [On RedHat Systems]

![Remove Orphan Packages in CentOS](http://www.tecmint.com/wp-content/uploads/2015/04/Remove-Orphan-Packages-in-CentOS1.gif)

    # apt-get autoremove                [On Debian Systems]

![Remove Orphan Packages in Debian](http://www.tecmint.com/wp-content/uploads/2015/04/Remove-Orphan-Packages-in-Debian.gif)

你应该经常移除废弃包，保持Linux机器仅仅加载一些需要的东西。

### 4. 如何获得Linux服务器本地的与公网的IP地址 ###

为了获得本地IP地址，运行下面的一行脚本。

    $ ifconfig | grep "inet addr:" | awk '{print $2}' | grep -v '127.0.0.1' | cut -f2 -d:

你必须安装了ifconfig，如果没有，使用apt或者yum工具安装需要的包。这里我们将会管道连接ifconfig的输出，并且结合grep命令找到包含“intel addr：”的字符串。

我们知道对于输出本地IP地址，ifconfig命令足够用了。但是ifconfig生成了许多的输出，而我们关注的地方仅仅是本地IP地址，不是其他的。

    # ifconfig | grep "inet addr:"

![Check Local IP Address](http://www.tecmint.com/wp-content/uploads/2015/04/Check-Local-IP-Address.gif)

尽管目前的输出好多了，但是我们需要过滤出本地的IP地址，不含其他东西。针对这个，我们将会使用awk打印出第二列输出，通过管道连接上述的脚本。

	# ifconfig | grep “inet addr:” | awk '{print $2}' 

![Filter Only IP Address](http://www.tecmint.com/wp-content/uploads/2015/04/Filter-IP-Address.gif)

上面图片清楚的表示，我们已经很大程度上自定义了输出，当仍然不是我们想要的。本地环路地址 127.0.0.1 仍然在结果中。

我们可以使用grep的-v选项，这样会打印出不匹配给定参数的其他行。每个机器都有同样的环路地址 127.0.0.1，所以使用grep -v打印出不包含127.0.0.1的行，通过管道连接前面的脚本。

    # ifconfig | grep "inet addr" | awk '{print $2}' | grep -v '127.0.0.1'

![Print IP Address](http://www.tecmint.com/wp-content/uploads/2015/04/Print-IP-Address.gif)

我们差不多得到想要的输出了，仅仅需要从开头替换掉字符串`(addr:)`。我们将会使用cut命令单独打印出第二列。一二列之间并不是用tab分割，而是`(:)`，所以我们需要使用到域分割符选项`(-d)`，通过管道连接上面的输出。

    # ifconfig | grep "inet addr:" | awk '{print $2}' | grep -v '127.0.0.1' | cut -f2 -d:

![Customized IP Address](http://www.tecmint.com/wp-content/uploads/2015/04/Custome-IP-Address.gif)

最后！期望的结果出来了。

### 5.如何在Linux终端彩色输出 ###

你可能在终端看见过彩色的输出。同时你也可能知道在终端里允许/禁用彩色输出。如果都不知道的话，你可以参考下面的步骤。

在Linux中，每个用户都有`'.bashrc'`文件，被用来管理你的终端输出。打开并且编辑该文件，用你喜欢的编辑器。注意一下，这个文件是隐藏的（文件开头为点的代表隐藏文件）。

	$ vi /home/$USER/.bashrc

确保以下的行没有被注释掉。即，行开头没有#。

    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dirc$
        alias ls='ls --color=auto'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'
    
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi

![User .bashrc File](http://www.tecmint.com/wp-content/uploads/2015/04/bashrc-file.gif)

完成后！保存并退出。为了让改动生效，需要注销账户后再次登录。

现在，你会看见列出的文件和文件夹名字有着不同的颜色，根据文件类型来决定。要了解所用的颜色代码，可以运行下面的命令。

	$ dircolors -p | less

![Linux Color Output](http://www.tecmint.com/wp-content/uploads/2015/04/Linux-Color-Output.gif)

### 6.如何用#号标记Linux命令和脚本 ###

我们一直在Twitter，Facebook和Google Plus（可能是其他我们没有提到的地方）上使用#号标签。那些#号标签使得其他人搜索一个标签更加容易。可是很少人知道，我们可以在Linux命令行使用#号标签。

我们已经知道配置文件里的`#`，在大多数的编程语言中，这个符号被用作注释行，即不被执行。

运行一个命令，然后为这个命令创建一个#号标签，这样之后我们就可以找到它。假设我们有一个很长的脚本，就上面第四点被执行的命令。现在为它创建一个#号标签。我们知道ifconfig可以被sudo或者root执行，因此用root来执行。

    # ifconfig | grep "inet addr:" | awk '{print $2}' | grep -v '127.0.0.1' | cut -f2 -d: #myip

上述脚本被’myip‘给标记了。现在在reverse-i-search（按下ctrl+r）搜索一下这个标签，在终端里，并输入’myip‘。你可以从这里开始执行。

![Create Command Hash Tags](http://www.tecmint.com/wp-content/uploads/2015/04/Create-Command-Hash-Tags.gif)

你可以为每个命令创建#号标签，之后使用reverse-i-search找到它。

目前就这么多了。我们一直在辛苦的工作，创造有趣的，有知识性的内容给你。你觉得我们是如何工作的呢？欢迎咨询任何问题。你可以在下面评论。保持联络！Kudox。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-commandline-chat-server-and-remove-unwanted-packages/

作者：[Avishek Kumar][a]
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:https://linux.cn/article-5485-1.html
