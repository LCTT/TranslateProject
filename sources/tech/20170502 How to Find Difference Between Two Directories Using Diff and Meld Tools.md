hkurj translating
How to Find Difference Between Two Directories Using Diff and Meld Tools
============================================================

In an earlier article, we reviewed [9 best file comparison and difference (Diff) tools for Linux][1] and in this article, we will describe how to find the difference between two directories in Linux.

Normally, to [compare two files in Linux][2], we use the diff – a simple and original Unix command-line tool that shows you the difference between two computer files; compares files line by line and it is easy to use, comes with pre-installed on most if not all Linux distributions.

The question is how do we get the difference between two directories in Linux? Here, we want to know what files/subdirectories are common in the two directories, those that are present in one directory but not in the other.

The conventional syntax for running diff is as follows:

```
$ diff [OPTION]… FILES
$ diff options dir1 dir2 
```

By default, its output is ordered alphabetically by file/subdirectory name as shown in the screenshot below. In this command, the `-q` switch tells diff to report only when files differ.

```
$ diff -q directory-1/ directory-2/
```
[
 ![Difference Between Two Directories](http://www.tecmint.com/wp-content/uploads/2017/05/Difference-Between-Two-Directories.png) 
][3]

Difference Between Two Directories

Again diff doesn’t go into the subdirectories, but we can use the `-r` switch to read the subdirectories as well like this.

```
$ diff -qr directory-1/ directory-2/ 
```

### Using Meld Visual Diff and Merge Tool

There is a cool graphical option called meld (a visual diff and merge tool for the GNOME Desktop) for those who enjoy using the mouse, you can install it as follows.

```
$ sudo apt install meld  [Debian/Ubuntu systems]
$ sudo yum install meld  [RHEL/CentOS systems]
$ sudo dnf install meld  [Fedora 22+]
```

Once you have installed it, search for “meld” in the Ubuntu Dash or Linux Mint Menu, in Activities Overview in Fedora or CentOS desktop and launch it.

You will see the Meld interface below, where you can choose file or directory comparison as well as version control view. Click on directory comparison and move to the next interface.

[
 ![Meld Comparison Tool](http://www.tecmint.com/wp-content/uploads/2017/05/Meld-Comparison-Tool.png) 
][4]

Meld Comparison Tool

Select the directories you want to compare, note that you can add a third directory by checking the option “3-way Comparison”.

[
 ![Select Comparison Directories](http://www.tecmint.com/wp-content/uploads/2017/05/Select-Comparison-Directories.png) 
][5]

Select Comparison Directories

Once you selected the directories, click on “Compare”.

[
 ![Listing Difference Between Directories](http://www.tecmint.com/wp-content/uploads/2017/05/Listing-Difference-Between-Directories.png) 
][6]

Listing Difference Between Directories

In this article, we described how to find the difference between two directories in Linux. If you know any other commandline or gui way don’t forget to share your thoughts to this article via the comment section below.


--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.



-------------------

via: http://www.tecmint.com/compare-find-difference-between-two-directories-in-linux/

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/best-linux-file-diff-tools-comparison/
[2]:http://www.tecmint.com/freefilesync-compare-synchronize-files-in-ubuntu/
[3]:http://www.tecmint.com/wp-content/uploads/2017/05/Difference-Between-Two-Directories.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/05/Meld-Comparison-Tool.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/05/Select-Comparison-Directories.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/05/Listing-Difference-Between-Directories.png
[7]:http://www.tecmint.com/compare-find-difference-between-two-directories-in-linux/#
[8]:http://www.tecmint.com/compare-find-difference-between-two-directories-in-linux/#
[9]:http://www.tecmint.com/compare-find-difference-between-two-directories-in-linux/#
[10]:http://www.tecmint.com/compare-find-difference-between-two-directories-in-linux/#
[11]:http://www.tecmint.com/compare-find-difference-between-two-directories-in-linux/#comments
[12]:http://www.tecmint.com/author/aaronkili/
[13]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[14]:http://www.tecmint.com/free-linux-shell-scripting-books/
