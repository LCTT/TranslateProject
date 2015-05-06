Linux grep command with 14 different examples
================================================================================
### Overview : ###

Linux like operating system provides a searching tool known as **grep (global regular expression print)**. grep command is useful for searching the content of one more files based on the pattern. A pattern may be a single character, bunch of characters, single word or a sentence.

When we execute the grep command with specified pattern, if its is matched, then it will display the line of file containing the pattern without modifying the contents of existing file.

In this tutorial we will discuss 14 different examples of grep command

### Example:1 Search the pattern (word) in a file ###

Search the “linuxtechi” word in the file /etc/passwd file

    root@Linux-world:~# grep linuxtechi /etc/passwd
    linuxtechi:x:1000:1000:linuxtechi,,,:/home/linuxtechi:/bin/bash
    root@Linux-world:~#

### Example:2 Search the pattern in the multiple files. ###

    root@Linux-world:~# grep linuxtechi /etc/passwd /etc/shadow /etc/gshadow
    /etc/passwd:linuxtechi:x:1000:1000:linuxtechi,,,:/home/linuxtechi:/bin/bash
    /etc/shadow:linuxtechi:$6$DdgXjxlM$4flz4JRvefvKp0DG6re:16550:0:99999:7:::/etc/gshadow:adm:*::syslog,linuxtechi
    /etc/gshadow:cdrom:*::linuxtechi
    /etc/gshadow:sudo:*::linuxtechi
    /etc/gshadow:dip:*::linuxtechi
    /etc/gshadow:plugdev:*::linuxtechi
    /etc/gshadow:lpadmin:!::linuxtechi
    /etc/gshadow:linuxtechi:!::
    /etc/gshadow:sambashare:!::linuxtechi
    root@Linux-world:~#

### Example:3 List the name of those files which contain a specified pattern using -l option. ###

    root@Linux-world:~# grep -l linuxtechi /etc/passwd /etc/shadow /etc/fstab /etc/mtab
    /etc/passwd
    /etc/shadow
    root@Linux-world:~#

### Example:4 Search the pattern in the file along with associated line number(s) using the -n option ###

    root@Linux-world:~# grep -n linuxtechi /etc/passwd
    39:linuxtechi:x:1000:1000:linuxtechi,,,:/home/linuxtechi:/bin/bash
    root@Linux-world:~#

root@Linux-world:~# grep -n root /etc/passwd /etc/shadow

![](http://www.linuxtechi.com/wp-content/uploads/2015/05/grep-n-root.jpg)

### Example:5 Print the line excluding the pattern using -v option ###

List all the lines of the file /etc/passwd that does not contain specific word “linuxtechi”.

    root@Linux-world:~# grep -v linuxtechi /etc/passwd

![](http://www.linuxtechi.com/wp-content/uploads/2015/05/grep-v-option.jpg)

### Example:6 Display all the lines that starts with specified pattern using ^ symbol ###

Bash shell treats carrot symbol (^) as a special character which marks the beginning of line or a word. Let’s display the lines which starts with “root” word in the file /etc/passwd.

    root@Linux-world:~# grep ^root /etc/passwd
    root:x:0:0:root:/root:/bin/bash
    root@Linux-world:~#

### Example: 7 Display all the lines that ends with specified pattern using $ symbol. ###

List all the lines of /etc/passwd that ends with “bash” word.

    root@Linux-world:~# grep bash$ /etc/passwd
    root:x:0:0:root:/root:/bin/bash
    linuxtechi:x:1000:1000:linuxtechi,,,:/home/linuxtechi:/bin/bash
    root@Linux-world:~#

Bash shell treats dollar ($) symbol as a special character which marks the end of line or word.

### Example:8 Search the pattern recursively using -r option ###

    root@Linux-world:~# grep -r linuxtechi /etc/
    /etc/subuid:linuxtechi:100000:65536
    /etc/group:adm:x:4:syslog,linuxtechi
    /etc/group:cdrom:x:24:linuxtechi
    /etc/group:sudo:x:27:linuxtechi
    /etc/group:dip:x:30:linuxtechi
    /etc/group:plugdev:x:46:linuxtechi
    /etc/group:lpadmin:x:115:linuxtechi
    /etc/group:linuxtechi:x:1000:
    /etc/group:sambashare:x:131:linuxtechi
    /etc/passwd-:linuxtechi:x:1000:1000:linuxtechi,,,:/home/linuxtechi:/bin/bash
    /etc/passwd:linuxtechi:x:1000:1000:linuxtechi,,,:/home/linuxtechi:/bin/bash
    ............................................................................

Above command will search linuxtechi in the “/etc” directory recursively.

### Example:9 Search all the empty or blank lines of a file using grep ###

    root@Linux-world:~# grep ^$ /etc/shadow
    root@Linux-world:~#

As there is no empty line in /etc/shadow file , so nothing is displayed.

### Example:10 Search the pattern using ‘grep -i’ option. ###

-i option in the grep command ignores the letter case i.e it will ignore upper case or lower case letters while searching

Lets take an example , i want to search “LinuxTechi” word in the passwd file.

    nextstep4it@localhost:~$ grep -i LinuxTechi /etc/passwd
    linuxtechi:x:1001:1001::/home/linuxtechi:/bin/bash
    nextstep4it@localhost:~$

### Example:11 Search multiple patterns using -e option ###

For example i want to search ‘linuxtechi’ and ‘root’ word in a single grep command , then using -e option we can search multiple patterns .

    root@Linux-world:~# grep -e "linuxtechi" -e "root" /etc/passwd
    root:x:0:0:root:/root:/bin/bash
    linuxtechi:x:1000:1000:linuxtechi,,,:/home/linuxtechi:/bin/bash
    root@Linux-world:~#

### Example:12 Getting Search pattern from a file using “grep -f” ###

First create a search pattern file “grep_pattern” in your current working directory. In my case i have put the below contents.

    root@Linux-world:~# cat grep_pattern
    ^linuxtechi
    root
    false$
    root@Linux-world:~#

Now try to search using grep_pattern file.

    root@Linux-world:~# grep -f grep_pattern /etc/passwd

![](http://www.linuxtechi.com/wp-content/uploads/2015/05/grep-f-option.jpg)

### Example:13 Count the number of matching patterns using -c option ###

Let take the above example , we can count the number of matching patterns using -c option in grep command.

    root@Linux-world:~# grep -c -f grep_pattern /etc/passwd
    22
    root@Linux-world:~#

### Example:14 Display N number of lines before & after pattern matching ###

a) Display Four lines before patten matching using -B option

    root@Linux-world:~# grep -B 4 "games" /etc/passwd

![](http://www.linuxtechi.com/wp-content/uploads/2015/05/grep-B-option.jpg)

b) Display Four lines after pattern matching using -A option

    root@Linux-world:~# grep -A 4 "games" /etc/passwd

![](http://www.linuxtechi.com/wp-content/uploads/2015/05/grep-A-option.jpg)

c) Display Four lines around the pattern matching using -C option

    root@Linux-world:~# grep -C 4 "games" /etc/passwd

![](http://www.linuxtechi.com/wp-content/uploads/2015/05/grep-C-option.jpg)

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/linux-grep-command-with-14-different-examples/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/