Translating by goreliu ...

4 Tools Send Email with Subject, Body and Attachment in Linux
================================================================================
In today's article we will cover a few ways you can use to send emails with attachments from the command line interface on Linux. It can have quite a few uses, for example to send an archive with an application from an application server to email or you can use the commands in scripts to automate some process. For our examples,we will use the file foo.tar.gz as our attachment.

There are various ways to send emails from command line using different mail clients but here I am sharing few mail client utility used by most users like mailx, mutt and swaks.

All the tools we will present to you are very popular and present in the repositories of most Linux distributions, you can install them using the following commands:

For **Debian / Ubuntu** systems

    apt-get install mutt
    apt-get install swaks
    apt-get install mailx
    apt-get install sharutils

For Red Hat based systems like **CentOS** or **Fedora**

    yum install mutt
    yum install swaks
    yum install mailx
    yum install sharutils

### 1) Using mail / mailx ###

The mailx utility found as the default mailer application in most Linux distributions now includes the support to attach file. If it is not available you can easily install using the following commands please take note that this may not be supported in older versions, to check this you can use the command:

    $ man mail

And the first line should look like this:

mailx [-BDdEFintv~] [-s subject] [-a attachment ] [-c cc-addr] [-b bcc-addr] [-r from-addr] [-h hops] [-A account] [-S variable[=value]] to-addr . . .

As you can see it supports the -a attribute to add a file to the email and -s attribute to subject to the email. Use few of below examples to send mails.

**a) Simple Mail**

Run the mail command, and then mailx would wait for you to enter the message of the email. You can hit enter for new lines. When done typing the message, press Ctrl+D and mailx would display EOT.

After than mailx automatically delivers the email to the destination.

    $ mail user@example.com

    HI,
    Good Morning
    How are you
    EOT

**b) To send email with subject**

    $ echo "Email text" | mail -s "Test Subject" user@example.com

-s is used for defining subject for email.

**c) To send message from a file**

    $ mail -s "message send from file" user@example.com < /path/to/file

**d) To send message piped using the echo command**

    $ echo "This is message body" | mail -s "This is Subject" user@example.com

**e) To send email with attachment**

    $ echo “Body with attachment "| mail -a foo.tar.gz -s "attached file" user@example.com

-a is used for attachments

### 2) mutt ###

Mutt is a text-based email client for Unix-like systems. It was developed over 20 years ago and it's an important part of Linux history, one of the first clients to support scoring and threading capabilities. Use few of below examples to send email.

**a) Send email with subject & body message from a file**

    $ mutt -s "Testing from mutt" user@example.com < /tmp/message.txt

**b) To send body message piped using the echo command**

    $ echo "This is the body" | mutt -s "Testing mutt" user@example.com

**c) To send email with attachment**

    $ echo "This is the body" | mutt -s "Testing mutt" user@example.com -a /tmp/foo.tar.gz

**d) To send email with multiple attachments**

    $ echo "This is the body" | mutt -s "Testing" user@example.com -a foo.tar.gz –a bar.tar.gz

### 3) swaks ###

Swaks stands for Swiss Army Knife for SMTP and it is a featureful, flexible, scriptable, transaction-oriented SMTP test tool written and maintained by John Jetmore. You can use the following syntax to send an email with attachment:

    $ swaks -t "foo@bar.com" --header "Subject: Subject" --body "Email Text" --attach foo.tar.gz

The important thing about Swaks is that it will also debug the full mail transaction for you, so it is a very useful tool if you also wish to debug the mail sending process:

As you can see it gives you full details about the sending process including what capabilities the receiving mail server supports, each step of the transaction between the 2 servers.

### 4) uuencode ###

Email transport systems were originally designed to transmit characters with a seven-bit encoding -- like ASCII. This meant they could send messages with plain text but not "binary" text, such as program files or image files that used all of an eight-bit byte. The program is used to solve this limitation is “uuencode”( "UNIX to UNIX encoding") which encode the mail from binary format to text format that is safe to transmit & program is used to decode the data is called “uudecode”

We can easily send binary text such as a program files or image files using uuencode with mailx or mutt email client is shown by following example:

    $ uuencode example.jpeg example.jpeg | mail user@example.com

### Shell Script : Explain how to send email ###

    #!/bin/bash

    FROM=""
    SUBJECT=""
    ATTACHMENTS=""
    TO=""
    BODY=""

    # Function to check if entered file names are really files
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

    # Getting the From address from user
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

    # Getting the To address from user
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

    # Getting the Subject from user
    echo -n -e "Enter e-mail subject:\n[Enter] "
    read SUBJECT

    echo

    if [ "$SUBJECT" == "" ]
    then
    echo "Proceeding without the subject..."
    fi

    # Getting the file names to attach
    echo -e "Provide the list of attachments. Separate names by space.
    If there are spaces in file name, quote file name with \"."
    read att

    echo

    # Making sure file names are poiting to real files
    attachments=$(check_files "$att")
    echo "Attachments: $attachments"

    for attachment in $attachments
    do
    ATTACHMENTS="$ATTACHMENTS-a $attachment "
    done

    echo

    # Composing body of the message
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

**Script Output**

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

### Conclusion ###

There are many ways of send emails from command line / shell script but here we have shared 4 tools available for unix / linux based distros. Hope you enjoyed reading our article and please provide your valuable comments and also let us know if you know about any new tools.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-shell-script/send-email-subject-body-attachment-linux/

作者：[Bobbin Zachariah][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bobbin/