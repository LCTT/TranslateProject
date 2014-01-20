20 Linux ls Command Examples to Display the Entries of Directory
================================================================================
One of the basic command in Linux is ls. Without this command, we may find difficulties to explore the content if directories. This command must known by everyone who want to learn Linux.

### What is ls ###

ls command is used to list files and directories. By default, it will be list the content of current directory. With some parameters, we can do more using ls. Here are the samples of ls usage in day-to-day operation

#### 1. Run ls without parameter ####

Running ls without parameter will display a list of files and or directories only. No other information can be seen from the output

    $ ls

![](http://linoxide.com/wp-content/uploads/2014/01/ls.png)

#### 2. Use long listing format ####

Using -l character (small L letter), will display a long listing of the content of current directory. On the next examples, we will combine -l parameter (mostly) to get better result.

    $ ls -l

![](http://linoxide.com/wp-content/uploads/2014/01/ls_l.png)

Here’s how to read the output :

**1st column**
The first letter **d** does the content is directory or file. On the screenshot above, Desktop, Documents, Downloads and lynis-1.3.8 are directories. If it - (**minus sign**) it means that the content is file. While if it equal with l (**small L character**), means the content is link file.

The next 9 character is about file permission. With the **first 3 rwx** characters are for Owner of the file, **the second 3 characters** are for Group owner of the file and **the last 3 characters** are for worldwide access to the file.

**2nd column**
This tell us about how many link to this file

**3rd column**
This tell us about who is the owner of the file / directory

**4th column**
This tell us about who the group owner of the file / directory

**5th column**
This tell us about the size of the file / directory in bytes unit. Except for directories, the size will always count as 4096 bytes

**6th column**
This tell us about the last time and date the file is modified

**7th column**
This tell us the filename or directory name

#### 3. Show the size of file ####

Reading size in bytes unit can confuse us. To read 6,5 M is easier compare with reading 6727680 byte. To do this, we can use -hcombine with **-l** parameter. **-h parameter means human readable**

    $ ls -lh

![](http://linoxide.com/wp-content/uploads/2014/01/ls_lh1.png)

Another parameter that can do this is **--si** parameter. This parameter is similar with -h parameter, but **--si powers 1000 while -h powers 1024**.

    $ ls -si

![](http://linoxide.com/wp-content/uploads/2014/01/ls_si.png)

#### 4. Sort file size ####

After we can show the file size, we may want to sort it by file size. We can use -S parameter to to this. The list will be sort by the largest file size first.

    $ ls -lhS

![](http://linoxide.com/wp-content/uploads/2014/01/ls_lhS.png)

#### 5. Scaling size ####

Ls can scale size by before printing them using -**-block-size=SIZE**. Where SIZE are :

    K = Kilobyte
    M = Megabyte
    G = Gigabyte
    T = Terabyte
    P = Petabyte
    E = Exabyte
    Z = Zettabyte
    Y = Yottabyte

For example, we want to scale size using Megabyte units. So the syntax will be like this :

    $ ls -l --block-size=M

![](http://linoxide.com/wp-content/uploads/2014/01/ls_block_size.png)

#### 6. Show hidden files ####

In Linux, a file begins with “.” (**dot sign**) is a hidden file. To show it on ls command, we can use **-a** parameter.

    $ ls -a

![](http://linoxide.com/wp-content/uploads/2014/01/ls_a.png)

#### 7. List directory entries only ####

If we want to list directory entries only, we can use **-d** parameter.

    $ ls -d */

![](http://linoxide.com/wp-content/uploads/2014/01/ls_d.png)

#### 8. Print entries without owner information ####

To do this, we can use **-g** parameter.

    $ ls -g

![](http://linoxide.com/wp-content/uploads/2014/01/ls_lg.png)

#### 9. Print entries without group information ####

While -g is suppress owner information, **-G** will suppress group information

    $ ls -lG

![](http://linoxide.com/wp-content/uploads/2014/01/ls_lG2.png)

#### 10. Print UID and GID ####

If we want to know the UID and GID of owner and group owner, we can do it using ls command with **-n** parameter. Here’s a sample.

    $ ls -n

![](http://linoxide.com/wp-content/uploads/2014/01/ls_n.png)

From the example above, we know that **user pungki has UID** = 1000 and **GID = 1000**. While **root group has GID = 0**

#### 11. Print with no color ####

Some Linux distribution is enable color options to ls command. This will make ls print the list in color. If you don’t want it, you can use **--color=never** parameter.

    $ ls --color=never

![](http://linoxide.com/wp-content/uploads/2014/01/ls_color_never.png)

#### 12. Print the index number of each file ####

To print the index number or known as inode number, we can use -i parameter. The index number will appear at first column.

    $ ls -li

![](http://linoxide.com/wp-content/uploads/2014/01/ls_inode.png)

#### 13. Add / (slash sign) to mark directory ####

To do this, use **-p** parameter.

    $ ls -p

![](http://linoxide.com/wp-content/uploads/2014/01/ls_p.png)

#### 14. Reverse order while sorting ####

You may also want to list entries in reverse order. To do this, we can use **-r** parameter.

    $ ls -r

![](http://linoxide.com/wp-content/uploads/2014/01/ls_r.png)

#### 15. List subdirectories recursively ####

With **-R** parameter, you can list directory including its subdirectories.

    $ ls -R

![](http://linoxide.com/wp-content/uploads/2014/01/ls_Recursive.png)

#### 16. Sort by extension ####

You can sort the list by extension using -X parameter or --sort=extension.

    $ ls -lX

**Or**

    $ ls --sort=extension

![](http://linoxide.com/wp-content/uploads/2014/01/ls_x.png)

#### 17. List by modification time ####

Using -t parameter will sort the list by modification time which the newest first.

    $ ls -lt

![](http://linoxide.com/wp-content/uploads/2014/01/ls_lt.png)

#### 18. List your home directory ####

For listing your home directory, we can short the directory using “~” (**tilde sign**). So you don’t have to type your full directory name. Let say if the home directory name is **/home/pungki**, then **~** sign have the meaning with /home/pungki.

    $ ls ~

![](http://linoxide.com/wp-content/uploads/2014/01/ls_tilde.png)

#### 19. List parent directory ####

Whenever you are inside a directory, you can also list the parent directory without need to type directory full name. Here’s a sample.

    $ ls ../

This will list the contents of the directory **one** level above.

    $ ls ../../

This will list the contents of the directory **two** level above.

![](http://linoxide.com/wp-content/uploads/2014/01/ls_parent.png)

#### 20. Print the version of ls command ####

To print it, use --version parameter

    $ ls --version

![](http://linoxide.com/wp-content/uploads/2014/01/ls_version.png)

### Conclusion ###

That’s some parameters which can be used on day-to-day operation. Of course you can always consult with ls manual page by typing **man ls** or **ls --help** on your console to explore more detail.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-ls-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出