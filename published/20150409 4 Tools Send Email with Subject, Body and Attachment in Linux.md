4个可以发送完整电子邮件的命令行工具
================================================================================
今天的文章里我们会讲到一些使用Linux命令行工具来发送带附件的电子邮件的方法。它有很多用处，比如在应用程序所在服务器上，使用电子邮件发送一个文件过来，或者你可以在脚本中使用这些命令来做一些自动化操作。在本文的例子中，我们会使用foo.tar.gz文件作为附件。

有不同的命令行工具可以发送邮件，这里我分享几个多数用户会使用的工具，如`mailx`、`mutt`和`swaks`。

我们即将呈现的这些工具都是非常有名的，并且存在于多数Linux发行版默认的软件仓库中，你可以使用如下命令安装：

在 **Debian / Ubuntu** 系统

    apt-get install mutt
    apt-get install swaks
    apt-get install mailx
    apt-get install sharutils

在基于Red Hat的系统，如 **CentOS** 或者 **Fedora**

    yum install mutt
    yum install swaks
    yum install mailx
    yum install sharutils

### 1) 使用 mail / mailx ###

`mailx`工具在多数Linux发行版中是默认的邮件程序，现在已经支持发送附件了。如果它不在你的系统中，你可以使用上边的命令安装。有一点需要注意，老版本的mailx可能不支持发送附件，运行如下命令查看是否支持。

    $ man mail

第一行看起来是这样的：

    mailx [-BDdEFintv~] [-s subject] [-a attachment ] [-c cc-addr] [-b bcc-addr] [-r from-addr] [-h hops] [-A account] [-S variable[=value]] to-addr . . .

如果你看到它支持`-a`的选项（-a 文件名，将文件作为附件添加到邮件）和`-s`选项（-s 主题，指定邮件的主题），那就是支持的。可以使用如下的几个例子发送邮件。

**a) 简单的邮件**

运行`mail`命令，然后`mailx`会等待你输入邮件内容。你可以按回车来换行。当输入完成后，按Ctrl + D，`mailx`会显示EOT表示结束。

然后`mailx`会自动将邮件发送给收件人。

    $ mail user@example.com

    HI,
    Good Morning
    How are you
    EOT

**b) 发送有主题的邮件**

    $ echo "Email text" | mail -s "Test Subject" user@example.com

`-s`的用处是指定邮件的主题。

**c) 从文件中读取邮件内容并发送**

    $ mail -s "message send from file" user@example.com < /path/to/file

**d) 将从管道获取到的`echo`命令输出作为邮件内容发送**

    $ echo "This is message body" | mail -s "This is Subject" user@example.com

**e) 发送带附件的邮件**

    $ echo “Body with attachment "| mail -a foo.tar.gz -s "attached file" user@example.com

`-a`选项用于指定附件。

### 2) mutt ###

Mutt是类Unix系统上的一个文本界面邮件客户端。它有20多年的历史，在Linux历史中也是一个很重要的部分，它是最早支持进程打分和多线程处理的客户端程序之一。按照如下的例子来发送邮件。

**a) 带有主题，从文件中读取邮件的正文，并发送**

    $ mutt -s "Testing from mutt" user@example.com < /tmp/message.txt

**b) 通过管道获取`echo`命令输出作为邮件内容发送**

    $ echo "This is the body" | mutt -s "Testing mutt" user@example.com

**c) 发送带附件的邮件**

    $ echo "This is the body" | mutt -s "Testing mutt" user@example.com -a /tmp/foo.tar.gz

**d) 发送带有多个附件的邮件**

    $ echo "This is the body" | mutt -s "Testing" user@example.com -a foo.tar.gz –a bar.tar.gz

### 3) swaks ###

Swaks（Swiss Army Knife，瑞士军刀）是SMTP服务上的瑞士军刀，它是一个功能强大、灵活、可编程、面向事务的SMTP测试工具，由John Jetmore开发和维护。你可以使用如下语法发送带附件的邮件：

    $ swaks -t "foo@bar.com" --header "Subject: Subject" --body "Email Text" --attach foo.tar.gz

关于Swaks一个重要的地方是，它会为你显示整个邮件发送过程，所以如果你想调试邮件发送过程，它是一个非常有用的工具。

它会给你提供了邮件发送过程的所有细节，包括邮件接收服务器的功能支持、两个服务器之间的每一步交互。

### 4) uuencode ###

邮件传输系统最初是被设计来传送7位编码（类似ASCII）的内容的。这就意味这它是用来发送文本内容，而不能发会使用8位的二进制内容（如程序文件或者图片）。`uuencode`（“UNIX to UNIX encoding”，UNIX之间使用的编码方式）程序用来解决这个限制。使用`uuencode`，发送端将二进制格式的转换成文本格式来传输，接收端再转换回去。

我们可以简单地使用`uuencode`和`mailx`或者`mutt`配合，来发送二进制内容，类似这样：

    $ uuencode example.jpeg example.jpeg | mail user@example.com

### Shell脚本：解释如何发送邮件 ###

    #!/bin/bash

    FROM=""
    SUBJECT=""
    ATTACHMENTS=""
    TO=""
    BODY=""

    # 检查文件名对应的文件是否存在
    function check_files()
    {
    output_files=""
    for file in $1
    do
    if [ -s $file ]
    then
    output_files="${output_files}${file} "
    fi
    done
    echo $output_files
    }

    echo "*********************"
    echo "E-mail sending script."
    echo "*********************"
    echo

    # 读取用户输入的邮件地址
    while [ 1 ]
    do
    if [ ! $FROM ]
    then
    echo -n -e "Enter the e-mail address you wish to send mail from:\n[Enter] "
    else
    echo -n -e "The address you provided is not valid:\n[Enter] "
    fi

    read FROM
    echo $FROM | grep -E '^.+@.+$' > /dev/null
    if [ $? -eq 0 ]
    then
    break
    fi
    done

    echo

    # 读取用户输入的收件人地址
    while [ 1 ]
    do
    if [ ! $TO ]
    then
    echo -n -e "Enter the e-mail address you wish to send mail to:\n[Enter] "
    else
    echo -n -e "The address you provided is not valid:\n[Enter] "
    fi

    read TO
    echo $TO | grep -E '^.+@.+$' > /dev/null
    if [ $? -eq 0 ]
    then
    break
    fi
    done

    echo

    # 读取用户输入的邮件主题
    echo -n -e "Enter e-mail subject:\n[Enter] "
    read SUBJECT

    echo

    if [ "$SUBJECT" == "" ]
    then
    echo "Proceeding without the subject..."
    fi

    # 读取作为附件的文件名
    echo -e "Provide the list of attachments. Separate names by space.
    If there are spaces in file name, quote file name with \"."
    read att

    echo

    # 确保文件名指向真实文件
    attachments=$(check_files "$att")
    echo "Attachments: $attachments"

    for attachment in $attachments
    do
    ATTACHMENTS="$ATTACHMENTS-a $attachment "
    done

    echo

    # 读取完整的邮件正文
    echo "Enter message. To mark the end of message type ;; in new line."
    read line

    while [ "$line" != ";;" ]
    do
    BODY="$BODY$line\n"
    read line
    done

    SENDMAILCMD="mutt -e \"set from=$FROM\" -s \"$SUBJECT\" \
    $ATTACHMENTS -- \"$TO\" <<< \"$BODY\""
    echo $SENDMAILCMD

    mutt -e "set from=$FROM" -s "$SUBJECT" $ATTACHMENTS -- $TO <<< $BODY

** 脚本输出 **

    $ bash send_mail.sh
    *********************
    E-mail sending script.
    *********************

    Enter the e-mail address you wish to send mail from:
    [Enter] test@gmail.com

    Enter the e-mail address you wish to send mail to:
    [Enter] test@gmail.com

    Enter e-mail subject:
    [Enter] Message subject

    Provide the list of attachments. Separate names by space.
    If there are spaces in file name, quote file name with ".
    send_mail.sh

    Attachments: send_mail.sh

    Enter message. To mark the end of message type ;; in new line.
    This is a message
    text
    ;;

### 总结 ###

有很多方法可以使用命令行/Shell脚本来发送邮件，这里我们只分享了其中4个类Unix系统可用的工具。希望你喜欢我们的文章，并且提供您的宝贵意见，让我们知道您想了解哪些新工具。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-shell-script/send-email-subject-body-attachment-linux/

作者：[Bobbin Zachariah][a]
译者：[goreliu](https://github.com/goreliu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bobbin/