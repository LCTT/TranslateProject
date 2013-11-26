[doing]By Stduolc
13 Linux中使用cat命令来管理(显示，排序，创建等.)文件的例子
================================================================================
![](http://linoxide.com/wp-content/uploads/2013/11/linux-cat-command.png)

在linux操作系统中，大多都配置文件、日志甚至Shell脚本都是采用文本格式。这就是为什么在Linux系统中，我们有很多的文本编辑器。当你只需要查看这些文件里的内容，而不需要更改他们时，你可以使用一个简单的命令cat。

取自cat手册页，说明如下：

> cat是能够将关联的文件输出到标准输出的命令。

cat 是Linux的内建命令。我相信，linux的所有发行版都默认具有cat命令。下面我们开始学习使用cat吧！

### 1. 查看文件内容 ###

最简单的使用方式是直接输入“cat file_name”。

    # cat /etc/issue

    CentOS release 5.10 (Final)
    Kernel \r on an \m

### 2. 输入行号
### 2. Put the line number on the fly ###

When reading a configuration file it may that you have a long configuration file. It will be easier to if you can put line numbers on the fly. Use -n parameter to fulfill this purpose.

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

### 3. Number non-blank output lines ###

Similar with -n parameter, -b parameter will give you numbers **on the fly**. The difference is -b parameter will only number non-blank lines.

    #cat -n /etc/ntp.conf

    1 # Permit time synchronization our time resource but do not
    2 # permit the source to query or modify the service on this system
    3 restrict default kod nomodify notrap nopeer noquery
    4 restrict -6 default kod nomodify notrap nopeer noquery

    5 # Permit all access over the loopback interface. This could be
    6 # tightened as well, but to do so would effect some of the
    7 # administration functions
    8 restrict 127.0.0.1
    9 restrict -6 ::1

### 4. Show tabs ###

You may need to know where are the tabs on your text file. If you do, you can use -T parameter. Tab will be represented by **^I** characters.

    # cat -T /etc/hosts

    # Do not remove the following line, or various programs
    # that require network functionality will fail.
    127.0.0.1^I^Ilocalhost.localdomain localhost
    ::1^I^Ilocalhost6.localdomain6 localhost6

### 5. Show the end of lines ###

-E parameter will display **$** at end of each line. Here’s the example :

    # cat -E /etc/hosts

    # Do not remove the following line, or various programs$
    # that require network functionality will fail.$
    127.0.0.1 localhost.localdomain localhost$
    ::1 localhost6.localdomain6 localhost6$

### 6. Show All ###

If you want to combine between -T and -E, you can use -A parameter.

    # cat -A /etc/hosts

    # Do not remove the following line, or various programs$
    # that require network functionality will fail.$
    127.0.0.1^I^Ilocalhost.localdomain localhost$
    ::1^I^Ilocalhost6.localdomain6 localhost6$

### 7. View the content per page ###

When your file can not fit in your screen, you can **combine** cat with another command to make it displayed per page. Use the pipe ( | ) sign to combine it.

    # cat /proc/meminfo | less

    # cat /proc/meminfo | more

The difference between less and more is that you can do scroll up **and** scroll down **on less command** using PageUp and PageDown buttons. While you can **only** do scroll down **on more command** using spacebar.

### 8. View the contents of 2 files ###

Let’s say we have 2 text files named linux and desktop located in /root folder. Each of files contains :
**Linux** : ubuntu, centos, redhat, mint and slackware
**Desktop** : gnome kde, xfce, enlightment, and cinnamon
When you want to view more than 1 file simultaneously, you do like this :

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

### 9. Sorting file ###

Again, you can combine cat using another command to make a custom output. If you want to sort it, you can combine it with **sort** command. Here’s the example :

    # cat /root/linux | sort

    centos
    mint
    redhat
    slackware
    Ubuntu

### 10. Redirect standard output ###

You can also redirect the output to screen or to another file. Just use > sign (greater-than symbol) if you want to redirect the output into a file.

    # cat /root/linux > /root/linuxdistro

The above command will **create** a linuxdistro file that has the same content with /root/linux file.

### 11. Creating a new file ###

There are some ways to create a text file in Linux. One of them is using cat command.

    # cat > operating_system

    Unix
    Linux
    Windows
    MacOS

When you type cat > operating system, it will create a file which named operating_system. Then you will see a blank line below the cat command. You can type the content that you want. We typed Unix, Linux, Windows and MacOS for example. When you’re done, **press Ctrl-D** to save the content and exit from cat command. You will see **a file named operating_system** is created in the current folder with the content that you add before.

### 12. Append the content of file ###

If you use the > sign twice, it means that the content of the first file will be added to the second file. Let’s see the example :

    # cat /root/linux >> /root/desktop

    # cat /root/desktop

The first cat command will add the content of /root/linux to /root/desktop file
The second command will show you this output :

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

### 13. Redirect standard input ###

You can also redirect standard input using **<** sign (less-than symbol).

    # cat < /root/linux

The above command means that /root/linux will be an input for cat command. The output will be like this :

    ubuntu
    centos
    redhat
    mint
    slackware

To make it clearer, let’s see another example :

    # cat < /root/linux | sort > linux-sort

That command will be read : **sort content from /root/linux file then print the output to linux-sort file**

So the output of linux-sort file will be like this :

    centos
    mint
    redhat
    slackware
    ubuntu

That’s some examples of cat command on day-to-day operation. Of course you can explore more detail from cat manual page and experiment with Input-Output redirection operator.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/13-cat-command-examples/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出