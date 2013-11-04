翻译中 by小眼儿

12 Practical Examples of Linux grep Command
================================================================================
Have you ever been confronted with the task of looking for a particular string or pattern in a file, yet have no idea where to start looking? Well then, here is **grep** to the rescue!

![](http://www.tecmint.com/wp-content/uploads/2013/11/Grep-Command-Examples.png)

*12 Grep Command Examples*

**grep** is a powerful file pattern searcher that comes equipped on every distribution of **Linux**. If, for whatever reason, it is not installed on your system, you can easily install it via your package manager (**apt-get** on **Debian/Ubuntu** and **yum** on **RHEL/CentOS/Fedora**).

    $ sudo apt-get install grep           #Debian/Ubuntu


    $ sudo yum install grep               #RHEL/CentOS/Fedora

I have found that the easiest way to get your feet wet with **grep** is to just dive right in and use some real world examples.

### 1. Search and Find Files ###

Let’s say that you have just installed a fresh copy of the new **Ubuntu** on your machine, and that you are going to give **Python** scripting a shot. You have been scouring the web looking for tutorials, but you see that there are two different versions of **Python** in use, and you don’t know which one was installed on your system by the **Ubuntu** installer, or if it installed any modules. Simply run this command:

    $ sudo dpkg –l | grep –i python

#### Sample Output ####

    ii  python2.7                        2.7.3-0ubuntu3.4                    Interactive high-level object-oriented language (version 2.7)
    ii  python2.7-minimal                2.7.3-0ubuntu3.4                    Minimal subset of the Python language (version 2.7)
    ii  python-openssl                   0.12-1ubuntu2.1                     Python wrapper around the OpenSSL library
    ii  python-pam                       0.4.2-12.2ubuntu4                   A Python interface to the PAM library

First, we ran **dpkg –l**, which lists installed ***.deb** packages on your system. Second, we piped that output to **grep –i** python, which simple states “go to grep and filter out and return everything with ‘python’ in it.” The **–i** option is there to ignore-case, as **grep** is case-sensitive. Using the **–i** option is a good habit of getting into, unless of course you are trying to nail down a more specific search.

### 2. Search and Filter Files ###

The grep can also be used to search and filter within individual files or multiple files. Lets take this scenario:

You are having some trouble with your **Apache Web Server**, and you have reached out to one of the many awesome forums on the net asking for some help. The kind soul who replies to you has asked you to post the contents of your **/etc/apache2/sites-available/default-ssl** file. Wouldn’t it be easier for you, the guy helping you, and everyone reading it, if you could remove all of the commented lines? Well you can! Just run this:

    $ sudo grep –v “#”  /etc/apache2/sites-available/default-ssl

The **–v** option tells **grep** to invert its output, meaning that instead of printing matching lines, do the opposite and print all of the lines that don’t match the expression, in this case, the **#** commented lines.

### 3. Find all .mp3 Files Only ###

The **grep** can be very useful for filtering from **stdout**. For example, let’s say that you have an entire folder full of music files in a bunch of different formats. You want to find all of the ***.mp3** files from the artist **JayZ**, but you don’t want any of the remixed tracks. Using a **find command** with a couple of **grep** pipes will do the trick:

    $ sudo find . –name “*.mp3” | grep –i JayZ | grep –vi “remix”

In this example, we are using find to print all of the files with a ***.mp3 extension**, piping it to **grep –i** to filter out and prints all files with the name “**JayZ**” and then another pipe to **grep –vi** which filters out and does not print all filenames with the string (in any case) “**remix**”.

- [35 Practical Examples of Linux Find Command][1]

### 4. Display Number of Lines Before or After Search String ###

Another couple of options are the –A and –B switches, which displays the matched line and number of lines either that come before or after the search string. While the man page gives a more detailed explanation, I find it easiest to remember the options as –A = after, and –B = before:

    $ sudo ifconfig | grep –A 4 eth0
    $ sudo ifconfig | grep  -B 2 UP

### 5. Prints Number of Lines Around Match ###

The grep’s **–C** option is similar, but instead of printing the lines that come either before or after the string, it prints the lines in either direction:

    $ sudo ifconfig | grep –C 2 lo

### 6. Count Number of Matches ###

Similar to piping a **grep** string to word count (**wc** program) grep’s built-in option can perform the same for you:

    $ sudo ifconfig | grep –c inet6

### 7. Search Files by Given String ###

The **–n** option for **grep** is very useful when debugging files during compile errors. It displays the line number in the file of the given search string:

    $ sudo grep –n “main” setup..py

### 8. Search a string Recursively in all Directories ###

If you would like to search for a string in the current directory along with all of the subdirectories, you can specify the **–r** option to search recursively:

    $ sudo grep –r “function” *

### 9. Searches for the entire pattern ###

Passing the **–w** option to grep searches for the entire pattern that is in the string. For example, using:

    $ sudo ifconfig | grep –w “RUNNING”

Will print out the line containing the pattern in quotes. On the other hand, if you try:

    $ sudo ifconfig | grep –w “RUN”

Nothing will be returned as we are not searching for a pattern, but an entire word.

### 10. Search a string in Gzipped Files ###

Deserving some mention are grep’s derivatives. The first is **zgrep**, which, similar to **zcat**, is for use on **gzipped** files. It takes the same options as **grep** and is used in the same way:

    $ sudo zgrep –i error /var/log/syslog.2.gz

### 11. Match Regular Expression in Files ###

The **egrep** is another derivative that stands for “**Extended Global Regular Expression**”. It recognizes additional expression meta-characters such **at + ?** | and **()**. egrep is very useful for searching source files, and other pieces of code, should the need arise. It can be invoked from regular grep by specifying the **–E** option.

    $ sudo grep –E

### 12. Search a Fixed Pattern String ###

The **fgrep** searches a file or list of files for a fixed pattern string. It is the same as **grep –F**. A common way of using **fgrep** is to pass a file of patterns to it:

    $ sudo fgrep –f file_full_of_patterns.txt file_to_search.txt

This is just a starting point with **grep**, but as you are probably able to see, it is invaluable for a variety of purposes. Aside from the simple one line commands we have implemented, **grep** can be used to write powerful **cron** jobs, and robust **shell scripts**, for a start. Be creative, experiment with the options in the **man page**, and come up with **grep expressions** that serve your own purposes!

--------------------------------------------------------------------------------

via: http://www.tecmint.com/12-practical-examples-of-linux-grep-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/35-practical-examples-of-linux-find-command/
