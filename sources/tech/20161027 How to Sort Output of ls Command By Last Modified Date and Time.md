How to Sort Output of ‘ls’ Command By Last Modified Date and Time
============================================================

One of the commonest things a Linux user will always do on the command line is [listing the contents of a directory][1]. As we may already know, [ls][2] and [dir][3] are the two commands available on Linux for listing directory content, with the former being more popular and in most cases, preferred by users.

When listing directory contents, the results can be sorted based on several criteria such as alphabetical order of filenames, modification time, access time, version and file size. Sorting using each of these file properties can be enabled by using a specific flag.

In this brief [ls command guide][4], we will look at how to [sort the output of ls command][5] by last modification time (date and time).

Let us start by executing some [basic ls commands][6].

### Linux Basic ls Commands

1. Running ls command without appending any argument will list current working directory contents.

```
$ ls 
```
[
 ![List Content of Working Directory](http://www.tecmint.com/wp-content/uploads/2016/10/List-Content-of-Working-Directory.png) 
][7]

List Content of Working Directory

2. To list contents of any directory, for example /etc directory use:

```
$ ls /etc
```
[
 ![List Contents of Directory](http://www.tecmint.com/wp-content/uploads/2016/10/List-Contents-of-Directory.png) 
][8]

List Contents of Directory

3. A directory always contains a few hidden files (at least two), therefore, to show all files in a directory, use the `-a` or `--all` flag:

```
$ ls  -a
```
[
 ![List Hidden Files in Directory](http://www.tecmint.com/wp-content/uploads/2016/10/List-Hidden-Files-in-Directory.png) 
][9]

List Hidden Files in Directory

4. You can as well print detailed information about each file in the ls output, such as the file permissions, number of links, owner’s name and group owner, file size, time of last modification and the file/directory name.

This is activated by the `-l` option, which means a long listing format as in the next screenshot:

```
$ ls -l
```
[
 ![Long List Directory Contents](http://www.tecmint.com/wp-content/uploads/2016/10/ls-Long-List-Format.png) 
][10]

Long List Directory Contents

### Sort Files Based on Time and Date

5. To list files in a directory and [sort them last modified date and time][11], make use of the `-t` option as in the command below:

```
$ ls -lt 
```
[
 ![Sort ls Output by Date and Time](http://www.tecmint.com/wp-content/uploads/2016/10/Sort-ls-Output-by-Date-and-Time.png) 
][12]

Sort ls Output by Date and Time

6. If you want a reverse sorting files based on date and time, you can use the `-r` option to work like so:

```
$ ls -ltr
```
[
 ![Sort ls Output Reverse by Date and Time](http://www.tecmint.com/wp-content/uploads/2016/10/Sort-ls-Output-Reverse-by-Date-and-Time.png) 
][13]

Sort ls Output Reverse by Date and Time

We will end here for now, however, there is more usage information and options in the [ls command][14], so make it a point to look through it or any other guides offering [ls command tricks every Linux user should know][15] or [use sort command][16]. Last but not least, you can reach us via the feedback section below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/sort-ls-output-by-last-modified-date-and-time

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/file-and-directory-management-in-linux/
[2]:http://www.tecmint.com/15-basic-ls-command-examples-in-linux/
[3]:http://www.tecmint.com/linux-dir-command-usage-with-examples/
[4]:http://www.tecmint.com/tag/linux-ls-command/
[5]:http://www.tecmint.com/sort-command-linux/
[6]:http://www.tecmint.com/15-basic-ls-command-examples-in-linux/
[7]:http://www.tecmint.com/wp-content/uploads/2016/10/List-Content-of-Working-Directory.png
[8]:http://www.tecmint.com/wp-content/uploads/2016/10/List-Contents-of-Directory.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/10/List-Hidden-Files-in-Directory.png
[10]:http://www.tecmint.com/wp-content/uploads/2016/10/ls-Long-List-Format.png
[11]:http://www.tecmint.com/find-and-sort-files-modification-date-and-time-in-linux/
[12]:http://www.tecmint.com/wp-content/uploads/2016/10/Sort-ls-Output-by-Date-and-Time.png
[13]:http://www.tecmint.com/wp-content/uploads/2016/10/Sort-ls-Output-Reverse-by-Date-and-Time.png
[14]:http://www.tecmint.com/tag/linux-ls-command/
[15]:http://www.tecmint.com/linux-ls-command-tricks/
[16]:http://www.tecmint.com/linux-sort-command-examples/
