[Dongshuaike translating]
7 Interesting Linux ‘sort’ Command Examples – Part 2
================================================================================
In our last article we have covered various examples on sort command, if you’ve missed, you can go through it using below link. In continuation to the last post this post aims at covering remaining of sort command so that both the article together serves as complete guide to Linux ‘sort‘ command.

注：前两天做过这个原文
- [14 ‘sort’ Command Examples in Linux][1]

Before we continue further, create a text file ‘month.txt‘ and populate it with the data as given below.

    $ echo -e "mar\ndec\noct\nsep\nfeb\naug" > month.txt
    $ cat month.txt

![Populate Content](http://www.tecmint.com/wp-content/uploads/2015/04/Populate-Content.gif)

### 15. Sort the file ‘month.txt‘ on the basis of month order by using switch ‘M‘ (–month-sort). ###

    $ sort -M month.txt

**Important**: Note that ‘sort‘ command needs at least 3 characters to consider month name.

![Sort File Content by Month in Linux](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-by-Month.gif)

### 16. Sort the data that is in human readable format say 1K, 2M, 3G, 2T, where K,M,G,T represents Kilo, Mega, Giga, Tera. ###

    $ ls -l /home/$USER | sort -h -k5

![Sort Content Human Readable Format](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-Human-Readable-Format.gif)

### 17. In the last article we have created a file ‘sorted.txt‘ in example number 4 and another text file ‘lsl.txt‘ in example number 6. We know ‘sorted.txt‘ is already sorted while ‘lsl.txt‘ is not. Lets check both the files are sorted or not using sort command. ###

    $ sort -c sorted.txt

![Check File is Sorted](http://www.tecmint.com/wp-content/uploads/2015/04/Check-File-is-Sorted.gif)

If it returns 0, means that the file is sorted and there is no conflict.

    $ sort -c lsl.txt

![Check File Sorted Status](http://www.tecmint.com/wp-content/uploads/2015/04/Check-File-Sorted-Status.gif)

Reports Disorder. Conflict..

### 18. If the delimiter (separator) between words are space, sort command automatically interpret anything after horizontal space as new word. What if the delimiter is not space? ###

Consider a text file, the contents of which are separated by anything other than space such as ‘|’ or ‘\’ or ‘+’ or ‘.’ or….

Create a text file where contents are separated by +. Use ‘cat‘ to check the contents of file.

    $ echo -e "21+linux+server+production\n11+debian+RedHat+CentOS\n131+Apache+Mysql+PHP\n7+Shell Scripting+python+perl\n111+postfix+exim+sendmail" > delimiter.txt

----------

    $ cat delimiter.txt

![Check File Content by Delimiter](http://www.tecmint.com/wp-content/uploads/2015/04/Check-File-Content.gif)

Now sort this file on the basis of 1st field which is numerical.

    $ sort -t '+' -nk1 delimiter.txt

![Sort File By Fields](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-File-By-Fields.gif)

And second on the basis of 4th field which is non numeric.

![Sort Content By Non Numeric](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-By-Non-Numeric.gif)

If the delimiter is Tab you may use $’\t’ in place of ‘+’, as shown in the above example.

### 19. Sort the contents of ‘ls -l‘ command for your home directory on the basis of 5th column which represents the ‘amount of data‘ in Random order. ###

    $ ls -l /home/avi/ | sort -k5 -R 

![Sort Content by Column in Random Order](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-by-Column1.gif)

Every time you run the above piece of script you are likely to get a different result since the result is generated randomly.

As clear from the Rule number – 2 from the last article, sort command prefer line starting with lowercase characters over uppercase characters. Also check example 3 in last article, where string ‘laptop‘ appears before string ‘LAPTOP‘.

### 20. How to override the default sorting preference? before we are able to override the default sorting preference we need to export the environment variable LC_ALL to c. To do this run the below code on your Command Line Prompt. ###

    $ export LC_ALL=C

And then sort the text file ‘tecmint.txt‘ overriding the default sort preference.

    $ sort tecmint.txt

![Override Sorting Preferences](http://www.tecmint.com/wp-content/uploads/2015/04/Override-Sorting-Preferences.gif)
Override Sorting Preferences

Don’t forget to compare the output with the one you achieved in example 3 and also you can use option ‘-f‘ aka ‘–ignore-case‘ to get much organized output.

    $ sort -f tecmint.txt

![Compare Sorting Preferences](http://www.tecmint.com/wp-content/uploads/2015/04/Compare-Sorting-Preferences.gif)

### 21. How about running ‘sort‘ on two input files and join them in one go! ###

Lets create two text file namely ‘file1.txt‘ and ‘file2.txt‘ and populate it with some data. Here we are populating ‘file1.txt‘ with numbers as below. Also used ‘cat‘ command to check the content of file.

    $ echo -e “5 Reliable\n2 Fast\n3 Secure\n1 open-source\n4 customizable” > file1.txt
    $ cat file1.txt

![Populate Content with Numbers](http://www.tecmint.com/wp-content/uploads/2015/04/Populate-Content-with-Number.gif)

And populate second file ‘file2.txt‘ with some data as.

    $ echo -e “3 RedHat\n1 Debian\n5 Ubuntu\n2 Kali\n4 Fedora” > file2.txt
    $ cat file2.txt

![Populate File with Data](http://www.tecmint.com/wp-content/uploads/2015/04/Populate-File-with-Data.gif)

Now sort and join the output of both the files.

    $ join <(sort -n file1.txt) <(sort file2.txt)

![Sort Join Two Files](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Join-Two-Files.gif)

That’s all for now. Keep Connected. Keep to Tecmint. Please Provide us with your valuable feedback in the comments below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-sort-command-examples/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/sort-command-linux/
