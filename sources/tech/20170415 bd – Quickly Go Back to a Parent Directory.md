bd – Quickly Go Back to a Parent Directory Instead of Typing “cd ../../..” Redundantly
============================================================


While navigating the file system via the command line on Linux systems, in order to move back into a parent directory (in a long path), we would normally issue the [cd command][1] repeatedly (`cd ../../..`) until we land into the directory of interest.

This can be so tedious and boring much of the time, especially for experienced Linux users or system administrators who carry out so many various tasks, therefore hope to discover shortcuts to ease their jobs while operating a system.

**Suggested Read:** [Autojump – An Advanced ‘cd’ Command to Quickly Navigate Linux Filesystem][2]

In this article, we will review a simple but helpful utility for quickly moving back into a parent directory in Linux with the help of bd tool.

bd is a handy utility for navigating the filesystem, it enables you to quickly go back to a parent directory without typing `cd ../../..` repeatedly. You can reliably combine it with other Linux commands to perform a few daily operations.

### How to Install bd in Linux Systems

Run the following commands to download and install bd under `/usr/bin/` using the [wget command][3], make it executable and create the required alias in your `~/.bashrc` file:

```
$ wget --no-check-certificate -O /usr/bin/bd https://raw.github.com/vigneshwaranr/bd/master/bd
$ chmod +rx /usr/bin/bd
$ echo 'alias bd=". bd -si" >> ~/.bashrc
$ source ~/.bashrc
```

Note: To enable case-sensitive directory name matching, set the `-s` flag instead of `-si` in the alias created above.

To enable autocomplete support, run these commands:

```
$ sudo wget -O /etc/bash_completion.d/bd https://raw.github.com/vigneshwaranr/bd/master/bash_completion.d/bd
$ sudo source /etc/bash_completion.d/bd
```

#### How to Use bd in Linux Systems

Assuming your currently in the top directory in this path:

```
/media/aaronkilik/Data/Computer Science/Documents/Books/LEARN/Linux/Books/server $ 
```

and you want to go to Documents directory quickly, then simply type:

```
$ bd Documents
```

Then to go straight into the Data directory, you can type:

```
$ bd Data
```
[
 ![Switch Between Directories Quickly](http://www.tecmint.com/wp-content/uploads/2017/03/Switch-Between-Directories-Quickly.png) 
][4]

Switch Between Directories Quickly

Actually, bd makes it even more straight forward, all you need to do is just type bd <few starting letters>such as:

```
$ bd Doc
$ bd Da
```
[
 ![Quickly Switch Directories](http://www.tecmint.com/wp-content/uploads/2017/03/Quickly-Switch-Directories.png) 
][5]

Quickly Switch Directories

Important: In case there are more than one directories with the same name up in the hierarchy, bd will move you into the closest without considering the immediate parent as explained in the example below.

For instance, in the path above, there are two directories with the same name Books, if you want to move into:

```
/media/aaronkilik/Data/ComputerScience/Documents/Books/LEARN/Linux/Books
```

Typing bd books will take you into:

```
/media/aaronkilik/Data/ComputerScience/Documents/Books
```
[
 ![Move to 'Books' Directory Quickly](http://www.tecmint.com/wp-content/uploads/2017/03/Move-to-Directory-Quickly.png) 
][6]

Move to ‘Books’ Directory Quickly

Additionally, using bd within backticks in the form ``bd <letter(s)>`` prints out the path minus changing the current directory, so you can use ``bd <letter(s)>`` with other common Linux commands such as [ls][7], [echo][8] etc..

In the example below, am currently in the directory, /var/www/html/internship/assets/filetree and to print the absolute path, long-list the contents and sum up the size of all files in the directory html without moving into it, I can just type:

```
$ echo `bd ht`
$ ls -l `bd ht`
$ du -cs `bd ht`
```
[
 ![Switch Directory with Listing](http://www.tecmint.com/wp-content/uploads/2017/03/Switch-Directory-with-Listing.png) 
][9]

Switch Directory with Listing

Find out more about bd tool on Github: [https://github.com/vigneshwaranr/bd][10]

That’s all! In this article, we showed reviewed a handy way of [quickly navigating the filesystem in Linux][11]using bd utility.

Have your say via the feedback form below. Plus, do you know of any similar utilities out there, let us know in the comments as well.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

---------------

via: http://www.tecmint.com/bd-quickly-go-back-to-a-linux-parent-directory/

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/cd-command-in-linux/
[2]:http://www.tecmint.com/autojump-a-quickest-way-to-navigate-linux-filesystem/
[3]:http://www.tecmint.com/10-wget-command-examples-in-linux/
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Switch-Between-Directories-Quickly.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/03/Quickly-Switch-Directories.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/Move-to-Directory-Quickly.png
[7]:http://www.tecmint.com/tag/linux-ls-command/
[8]:http://www.tecmint.com/echo-command-in-linux/
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Switch-Directory-with-Listing.png
[10]:https://github.com/vigneshwaranr/bd
[11]:http://www.tecmint.com/autojump-a-quickest-way-to-navigate-linux-filesystem/
[12]:http://www.tecmint.com/author/aaronkili/
[13]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[14]:http://www.tecmint.com/free-linux-shell-scripting-books/
