theo-l translating

10 Useful ‘ls’ Command Interview Questions – Part 2
================================================================================
Continuing the legacy of ls command here is the second interview article on Listing command. The first article of the series was highly appreciated by the Tecmint Community. If you’ve missed the first part of this series you may like to visit at:

- [15 Interview Questions on “ls” Command – Part 1][1]

This article is well presented in the manner that it gives deep insight of ls command with examples. We have taken extra care in the making of article so that it remains simple to understand yet serve the purpose to the fullest.

![10 Interview Questions on ls Command](http://www.tecmint.com/wp-content/uploads/2015/03/ls-Command-Interview-Questions.jpg)
10 Interview Questions on ls Command

### 1. You are supposed to list the content of a directory in long list format, but not print the name of the author and group the file belongs. Also show the difference in output. ###

a. ls command listing the name of the files in long listing format when used with switch (-l).

    # ls -l

![List Files in- Long List Format](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-inLong-List-Format.gif)
List Files in- Long List Format

b. ls command listing the name of the files in long listing format along with the name of the author file belongs, when used with switch (–author) along with switch (-l).

    # ls -l --author

![List Files By Author](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-By-Author.gif)
List Files By Author

c. ls command listing the name of the files without the name of its owner, when used with switch (-g).

    # ls -g

![List Files Without Printing Owner Name](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-Without-Printing-Author.gif)
List Files Without Printing Owner Name

d. ls command listing the name of files in long listing format without the name of group it belongs, when used with switch (-G) along with switch (-l).

    # ls -Gl

![List Files Without Printing Group](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-Without-Printing-Group.gif)
List Files Without Printing Group

### 2. Print the size of files and folders in the current directory, in human readable format. How will you do this? ###

Well we need to use switch -h (human-readable) along with switch (-l) and/or (-s) with the command ls to get the desired output.

    # ls -hl

![List Files in Human Readable Format](http://www.tecmint.com/wp-content/uploads/2015/03/List-Size-of-Files-with-ls.gif)
List Files in Human Readable Format

    # ls -hs

![List File Sizes in Long List Format](http://www.tecmint.com/wp-content/uploads/2015/03/List-File-Sizes-in-Readable-Format.gif)
List File Sizes in Long List Format

**Note**: The option -h uses the power of 1024 (standard in computation) and output the size of files and folders in the units of K, M and G.

### 3. Well if switch (-h) output size in power of 1024, that is standard, What else power values are supported in ls command? ###

There exist a switch -si which is similar to switch -h. The only difference is switch -si uses power of 1000 unlike switch -h which uses the power of 1024.

    # ls -si

![Supported Power Values of ls Command](http://www.tecmint.com/wp-content/uploads/2015/03/ls-supported-power-values.gif)
Supported Power Values of ls Command

It can also be used with switch -l to output the size of folder in the power of 1000, in long listing format.

    # ls -si -l

![List Files by Power Values](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-by-Power-Values.gif)
List Files by Power Values

### 4. You are supposed to print the contents of a directory separated with comma. Is it possible? Can it be done in long listing format? ###

Yup! Linux ls command can output the contents of a directory separated by comma when used with the switch (-m). Since this comma separated entries are filled horizontally, ls command can’t separate contents with comma when listing contents vertically.

    # ls -m

![Print Contents of Directory by Comma](http://www.tecmint.com/wp-content/uploads/2015/03/Print-Contents-of-Directory-by-Comma.gif)
Print Contents of Directory by Comma

When used in long listing format, switch -m gets useless.

    # ls -ml

![Listing Content Horizontally](http://www.tecmint.com/wp-content/uploads/2015/03/Listing-Content-Horizentally.gif)
Listing Content Horizontally

### 5. If there any way to print the contents of a directory upside down? i.e., in reverse order. ###

Yeah! The above situation can easily be achieved using the switch -r. The switch ‘-r‘ reverse the order of output. It can also be used with switch -l (long listing format).

    # ls -r

![List Content in Reverse Order](http://www.tecmint.com/wp-content/uploads/2015/03/List-Content-in-Reverse-Order.gif)
List Content in Reverse Order

    # ls -rl

![Long List Content in Reverse Order](http://www.tecmint.com/wp-content/uploads/2015/03/Long-List-Content-in-Reverse-Order.gif)
Long List Content in Reverse Order

### 6. You are given a situation to print the sub-directories recursively. How will you achieve this situation? Mind it only sub directories and no files. ###

Okay! That is pretty easy with the switch -R when used with command ls. It can further be grouped with other options like -l (long list) and -m (comma separated), etc.

    # ls -R

![Print Sub Directories in Recursively](http://www.tecmint.com/wp-content/uploads/2015/03/Print-Sub-Directories-in-Recursively.gif)
Print Sub Directories in Recursively

### 7. How to sort the files based upon the size? ###

The Linux command line option -S when used with ls gives the desired output. To sort the files based upon size in descending order with the largest file listed at first and smallest at last.

    # ls -S

![Sort Files with ls Command](http://www.tecmint.com/wp-content/uploads/2015/03/Sort-Files-in-Linux.gif)
Sort Files with ls Command

To sort the files based upon size in descending order with the smallest file listed at first and largest at last.

    # ls -Sr

![Sort Files in Descending Order](http://www.tecmint.com/wp-content/uploads/2015/03/Sort-Files-in-Descending-Order.gif)
Sort Files in Descending Order

### 8. List the contents of a directory with no additional information appearing one file per line. ###

The switch -1 comes to rescue here. ls command with switch -1 output the contents of the directory with one file per line and no additional information.

    # ls -1

![List Files Without Information](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-Without-Information.gif)
List Files Without Information

### 9. You are given a situation in which you have to print the contents of a directory on standard output enclosed by double quotes. How will you do this? ###

There exist an option -Q (quote-name) which output the content of ls enclosed in double quotes.

    # ls -Q

![Print Files with Double Quotes](http://www.tecmint.com/wp-content/uploads/2015/03/Print-Files-with-Double-Quotes.gif)
Print Files with Double Quotes

### 10. You are working in a directory which contains lots of files and folders. You need to print the name of folders before directories. How will you get this? ###

    # ls --group-directories-first

![Print Directories First](http://www.tecmint.com/wp-content/uploads/2015/03/Print-Directories-First.gif)
Print Directories First

That’s all for now. We will be coming up with the next part of this article series very soon. Till then stay tuned and connected to Tecmint. Do not forget to provide us with valuable feedback in the comment section below. Like and share us and help us get spread!

--------------------------------------------------------------------------------

via: http://www.tecmint.com/ls-interview-questions/

作者：[Ravi Saive][a]
译者：[theo-l](https://github.com/theo-l)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/ls-command-interview-questions/
