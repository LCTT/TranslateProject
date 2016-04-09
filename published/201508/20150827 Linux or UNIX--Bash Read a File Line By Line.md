Bash 下如何逐行读取一个文件
================================================================================

在 Linux 或类 UNIX 系统下如何使用 KSH 或 BASH shell 逐行读取一个文件？

在 Linux、OSX、 *BSD 或者类 Unix 系统下你可以使用 ​​while..do..done 的 bash 循环来逐行读取一个文件。

###在 Bash Unix 或者 Linux shell 中逐行读取一个文件的语法

对于 bash、ksh、 zsh 和其他的 shells 语法如下

	while read -r line; do COMMAND; done < input.file

通过 -r 选项传递给 read 命令以防止阻止解释其中的反斜杠转义符。

在 read 命令之前添加 `IFS=` 选项，来防止首尾的空白字符被去掉。
 
	while IFS= read -r line; do COMMAND_on $line; done < input.file

这是更适合人类阅读的语法:

    #!/bin/bash
    input="/path/to/txt/file"
    while IFS= read -r var
    do
      echo "$var"
    done < "$input"

**示例**

下面是一些例子:

    #!/bin/ksh
    file="/home/vivek/data.txt"
    while IFS= read line
    do
        # display $line or do somthing with $line
    	echo "$line"
    done <"$file"

在 bash shell 中相同的例子:

    #!/bin/bash
    file="/home/vivek/data.txt"
    while IFS= read -r line
    do
        # display $line or do somthing with $line
    	printf '%s\n' "$line"
    done <"$file"

你还可以看看这个更好的:

    #!/bin/bash
    file="/etc/passwd"
    while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
    do
        # display fields using f1, f2,..,f7
        printf 'Username: %s, Shell: %s, Home Dir: %s\n' "$f1" "$f7" "$f6"
    done <"$file"

示例输出:

![Fig.01: Bash shell scripting- read file line by line demo outputs](http://s0.cyberciti.org/uploads/faq/2011/01/Bash-Scripting-Read-File-line-by-line-demo.jpg)

*图01：Bash 脚本：读取文件并逐行输出文件*

###Bash 脚本：逐行读取文本文件并创建为 pdf 文件

我的输入文件如下（faq.txt）:

    4|http://www.cyberciti.biz/faq/mysql-user-creation/|Mysql User Creation: Setting Up a New MySQL User Account
    4096|http://www.cyberciti.biz/faq/ksh-korn-shell/|What is UNIX / Linux Korn Shell?
    4101|http://www.cyberciti.biz/faq/what-is-posix-shell/|What Is POSIX Shell?
    17267|http://www.cyberciti.biz/faq/linux-check-battery-status/|Linux: Check Battery Status Command
    17245|http://www.cyberciti.biz/faq/restarting-ntp-service-on-linux/|Linux Restart NTPD Service Command
    17183|http://www.cyberciti.biz/faq/ubuntu-linux-determine-your-ip-address/|Ubuntu Linux: Determine Your IP Address
    17172|http://www.cyberciti.biz/faq/determine-ip-address-of-linux-server/|HowTo: Determine an IP Address My Linux Server
    16510|http://www.cyberciti.biz/faq/unix-linux-restart-php-service-command/|Linux / Unix: Restart PHP Service Command
    8292|http://www.cyberciti.biz/faq/mounting-harddisks-in-freebsd-with-mount-command/|FreeBSD: Mount Hard Drive / Disk Command
    8190|http://www.cyberciti.biz/faq/rebooting-solaris-unix-server/|Reboot a Solaris UNIX System

我的 bash 脚本:

    #!/bin/bash
    # Usage: Create pdf files from input (wrapper script)
    # Author: Vivek Gite <Www.cyberciti.biz> under GPL v2.x+
    #---------------------------------------------------------
     
    #Input file
    _db="/tmp/wordpress/faq.txt"
     
    #Output location
    o="/var/www/prviate/pdf/faq"
     
    _writer="~/bin/py/pdfwriter.py"
     
    # If file exists 
    if [[ -f "$_db" ]]
    then
        # read it
    	while IFS='|' read -r pdfid pdfurl pdftitle
        do
        	local pdf="$o/$pdfid.pdf"
            echo "Creating $pdf file ..."
    	#Genrate pdf file
            $_writer --quiet --footer-spacing 2 \
            --footer-left "nixCraft is GIT UL++++ W+++ C++++ M+ e+++ d-" \
            --footer-right "Page [page] of [toPage]" --footer-line \
            --footer-font-size 7 --print-media-type "$pdfurl" "$pdf"
        done <"$_db"
    fi
 
###技巧：从 bash 变量中读取

让我们看看如何在 Debian 或者 Ubuntu Linux 下列出所有安装过的 php 包，请输入：

    # 我将输出内容赋值到一个变量名为 $list中 #

    list=$(dpkg --list php\* | awk '/ii/{print $2}')
    printf '%s\n' "$list"

示例输出:

    php-pear
    php5-cli
    php5-common
    php5-fpm
    php5-gd
    php5-json
    php5-memcache
    php5-mysql
    php5-readline
    php5-suhosin-extension

你现在可以从 $list 中看到它们，并安装这些包：

    #!/bin/bash
    # BASH can iterate over $list variable using a "here string" #
    while IFS= read -r pkg
    do
        printf 'Installing php package %s...\n' "$pkg"
        /usr/bin/apt-get -qq install $pkg
    done <<< "$list"
    printf '*** Do not forget to run php5enmod and restart the server (httpd or php5-fpm) ***\n'

示例输出:

    Installing php package php-pear...
    Installing php package php5-cli...
    Installing php package php5-common...
    Installing php package php5-fpm...
    Installing php package php5-gd...
    Installing php package php5-json...
    Installing php package php5-memcache...
    Installing php package php5-mysql...
    Installing php package php5-readline...
    Installing php package php5-suhosin-extension...

    *** Do not forget to run php5enmod and restart the server (httpd or php5-fpm) ***

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/unix-howto-read-line-by-line-from-file/

作者： VIVEK GIT
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出
