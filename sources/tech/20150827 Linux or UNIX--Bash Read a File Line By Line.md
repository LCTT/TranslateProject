translation by strugglingyouth
Linux/UNIX: Bash Read a File Line By Line
================================================================================
How do I read a file line by line under a Linux or UNIX-like system using KSH or BASH shell?

You can use while..do..done bash loop to read file line by line on a Linux, OSX, *BSD, or Unix-like system.

**Syntax to read file line by line on a Bash Unix & Linux shell:**

1. The syntax is as follows for bash, ksh, zsh, and all other shells -
1. while read -r line; do COMMAND; done < input.file
1. The -r option passed to red command prevents backslash escapes from being interpreted.
1. Add IFS= option before read command to prevent leading/trailing whitespace from being trimmed -
1. while IFS= read -r line; do COMMAND_on $line; done < input.file

Here is more human readable syntax for you:

    #!/bin/bash
    input="/path/to/txt/file"
    while IFS= read -r var
    do
      echo "$var"
    done < "$input"

**Examples**

Here are some examples:

    #!/bin/ksh
    file="/home/vivek/data.txt"
    while IFS= read line
    do
            # display $line or do somthing with $line
    	echo "$line"
    done <"$file"

The same example using bash shell:

    #!/bin/bash
    file="/home/vivek/data.txt"
    while IFS= read -r line
    do
            # display $line or do somthing with $line
    	printf '%s\n' "$line"
    done <"$file"

You can also read field wise:

    #!/bin/bash
    file="/etc/passwd"
    while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
    do
            # display fields using f1, f2,..,f7
            printf 'Username: %s, Shell: %s, Home Dir: %s\n' "$f1" "$f7" "$f6"
    done <"$file"

Sample outputs:

![Fig.01: Bash shell scripting- read file line by line demo outputs](http://s0.cyberciti.org/uploads/faq/2011/01/Bash-Scripting-Read-File-line-by-line-demo.jpg)

Fig.01: Bash shell scripting- read file line by line demo outputs

**Bash Scripting: Read text file line-by-line to create pdf files**

My input file is as follows (faq.txt):

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

My bash script:

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
 
**Tip: Read from bash variable**

Let us say you want a list of all installed php packages on a Debian or Ubuntu Linux, enter:

    # My input source is the contents of a variable called $list #
    list=$(dpkg --list php\* | awk '/ii/{print $2}')
    printf '%s\n' "$list"

Sample outputs:

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

You can now read from $list and install the package:

    #!/bin/bash
    # BASH can iterate over $list variable using a "here string" #
    while IFS= read -r pkg
    do
        printf 'Installing php package %s...\n' "$pkg"
        /usr/bin/apt-get -qq install $pkg
    done <<< "$list"
    printf '*** Do not forget to run php5enmod and restart the server (httpd or php5-fpm) ***\n'

Sample outputs:

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

作者：[作者名][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出
