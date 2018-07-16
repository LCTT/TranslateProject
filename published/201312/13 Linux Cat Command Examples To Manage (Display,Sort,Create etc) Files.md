13个Cat命令管理(显示，排序，建立)文件实例
================================================================================
![](http://linoxide.com/wp-content/uploads/2013/11/linux-cat-command.png)

在Linux系统中，大多数配置文件、日志文件，甚至shell脚本都使用文本文件格式，因此，Linux系统存在着多种文本编辑器，但当你仅仅想要查看一下这些文件的内容时，可使用一个简单的命令-cat。

cat手册里这样描述：

> cat命令读取文件内容，并输出到标准设备上面

cat是一条linux内置命令. 几乎所有linux发行版都内置（译注：或者说我从未听说过不内置cat命令的发行版）。接下来，让我们开始学习如何使用.

### 1. 显示文件内容 ###

最简单的方法是直接输入‘cat file_name’.

    # cat /etc/issue

    CentOS release 5.10 (Final)
    Kernel \r on an \m

### 2. 同时显示行号 ###

当在读取内容很多的配置文件时，如果同时显示行号将会使操作变简单，加上-n参数可以实现.

    # cat -n /etc/ntp.conf

    1 # Permit time synchronization our time resource but do not
    2 # permit the source to query or modify the service on this system
    3 restrict default kod nomodify notrap nopeer noquery
    4 restrict -6 default kod nomodify notrap nopeer noquery
    5
    6 # Permit all access over the loopback interface. This could be
    7 # tightened as well, but to do so would effect some of the
    8 # administration functions
    9 restrict 127.0.0.1
    10 restrict -6 ::1

### 3. 在非空格行首显示行号 ###

类似于-n参数，-b也可以显示行号。区别在于-b只在非空行前显示行号。

    #cat -b /etc/ntp.conf

    1 # Permit time synchronization our time resource but do not
    2 # permit the source to query or modify the service on this system
    3 restrict default kod nomodify notrap nopeer noquery
    4 restrict -6 default kod nomodify notrap nopeer noquery

    5 # Permit all access over the loopback interface. This could be
    6 # tightened as well, but to do so would effect some of the
    7 # administration functions
    8 restrict 127.0.0.1
    9 restrict -6 ::1

### 4. 显示tab制表符 ###

当你想要显示文本中的tab制表位时. 可使用-T参数. 它会在输入结果中标识为 **\^I** .

    # cat -T /etc/hosts

    # Do not remove the following line, or various programs 
    # that require network functionality will fail.
    127.0.0.1^I^Ilocalhost.localdomain localhost
    ::1^I^Ilocalhost6.localdomain6 localhost6

### 5. 显示换行符 ###

-E参数在每行结尾使用 **$** 表示换行符。如下所示 :

    # cat -E /etc/hosts

    # Do not remove the following line, or various programs$
    # that require network functionality will fail.$
    127.0.0.1 localhost.localdomain localhost$
    ::1 localhost6.localdomain6 localhost6$

### 6. 同时显示制表符及换行符 ###

当你想要同时达到-T及-E的效果, 可使用-A参数.

    # cat -A /etc/hosts

    # Do not remove the following line, or various programs$
    # that require network functionality will fail.$
    127.0.0.1^I^Ilocalhost.localdomain localhost$
    ::1^I^Ilocalhost6.localdomain6 localhost6$

### 7. 分屏显示 ###

当文件内容显示超过了你的屏幕大小, 可结合cat命令与其它命令分屏显示。使用管道符 ( | )来连接。

    # cat /proc/meminfo | less

    # cat /proc/meminfo | more

在less与more显示结果的区别在于less参数可pageup及pagedown上下翻滚。而more仅能使用空格向下翻屏。

### 8. 同时查看2个文件中的内容 ###

位于/root文件夹里有两个文件取名linux及desktop，每个文件含有以下内容 :

**Linux** : ubuntu, centos, redhat, mint and slackware

**Desktop** : gnome kde, xfce, enlightment, and cinnamon

当你想同时查看两文件中的内容时，可按如下方法 :

    # cat /root/linux /root/desktop

    ubuntu
    centos
    redhat
    mint
    slackware
    gnome
    kde
    xfce
    enlightment
    cinnamon

### 9. 排序显示 ###

类似. 你也可以结合cat命令与其它命令来进行自定义输出. 如结合 **sort** ，通过管道符对内容进行排序显示。举例 :

    # cat /root/linux | sort

    centos
    mint
    redhat
    slackware
    Ubuntu

### 10. 输入重定向 ###

你也可将显示结果输出重定向到屏幕或另一个文件。 只需要使用 > 符号（大于号）即可输出生成到另一个文件。

    # cat /root/linux > /root/linuxdistro

以上命令会生成一个与/root/linux内容一模一样的叫linuxdistro的文件.

### 11. 新建文件 ###

Linux下有多种方法新建文件。其中使用cat就是方法之一.

    # cat > operating_system

    Unix
    Linux
    Windows
    MacOS

当你输入cat > operating_system，它会生成一个operating_system的文件。然后下面会显示空行。此时你可输入内容。比如我们输入Unix, Linux, Windows 和 MacOS， 输入完成后，按**Ctrl-D**存盘退出cat。此时你会发现当前文件夹下会生成一个包含你刚才输入内容的叫 **operating_system**的文件。

### 12.向文件中追加内容 ###

当你使用两个 > 符时, 会将第一个文件中的内容追加到第二个文件的末尾。 举例 :

    # cat /root/linux >> /root/desktop

    # cat /root/desktop

它会将 /root/linux的内容追加到/root/desktop文件的末尾。

第二个文件的内容将会变成这样:
 
    gnome
    kde
    xfce
    enlightment
    cinnamon
    ubuntu
    centos
    redhat
    mint
    slackware

### 13. 重定向输入 ###

你可使用 **<**命令（小于号）将文件输入到cat中.

    # cat < /root/linux

上面命令表示 /root/linux中的内容作为cat的输入。屏幕上显示如下 :

    ubuntu
    centos
    redhat
    mint
    slackware

为了更清楚表示它的意义，我们使用以下命令 :

    # cat < /root/linux | sort > linux-sort

此命令这样理解: **从/root/linux中读取内容，然后排序，将结果输出并生成linux-sort新文件**

然后我们看看linux-sort中的内容 :

    centos
    mint
    redhat
    slackware
    ubuntu

以上是一些cat命令的日常基本应用. 更多相关你可从cat命令手册中学到并记得经常练习它们.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/13-cat-command-examples/

译者：[hongchuntang](https://github.com/译者ID) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
