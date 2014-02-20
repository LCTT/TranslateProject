##<<Linchenguang翻译中

Moving or Rename File / Directory in Linux - 10 Practical mv Command Examples
================================================================================
After knowing about [copy command][1], the next command which is related is mv command. When you want to move files from one place to another and you don’t want to duplicate it, then **mv command** is absolutely right for this task.

### What is mv command ###

mv command is a command that similar with **cp**, but it **does not** create a copy / duplicate of files or directories. This command is installed by default on your Linux system, in any kind of Linux you are using. Please take a look of some examples using mv command in day-to-day operation.

### 1. Moving files ###

The requirement of moving file is the file source location **must be different** with the files destination location. Here’s an example. To move **file_1.txt** from current directory to another directory , for example **/home/pungki/office**, here’s the syntax :

    $ mv file_1.txt /home/pungki/office

![mv command](http://linoxide.com/wp-content/uploads/2014/01/mv.png)

As we can see, when we move the file_1.txt, the file_1.txt from previous directory **is deleted**.

### 2. Moving multiple files ###

If we want to move multiple files, we put them in one line separated by space.

    $ mv file_2.txt file_3.txt file_4.txt /home/pungki/office

![Move multiple files](http://linoxide.com/wp-content/uploads/2014/01/mv_multiple.png)

You can also use pattern if your files have it. For example, to move all files which have **.txt** extension, we can use this command :

    $ mv *.txt /home/pungki/office

![Move using pattern](http://linoxide.com/wp-content/uploads/2014/01/mv_pattern.png)

### 3. Moving directory ###

Different from the copy command, moving directory using mv command is pretty straight forward. To move a directory, you can just to use mv command without any options. Please take a look screenshot below.

![Moving directory](http://linoxide.com/wp-content/uploads/2014/01/mv_directory.png)

### 4. Renaming files or directory ###

We also use mv command to rename files and directory. But in order to do so, the destination location **must be the same** with the source location. Then the file name must be different.

Let say we are inside **/home/pungki/Documents** folder and we want to **rename file_1.txt into file_2.txt**. Then the command will be like :

    $ mv file_1.txt file_2.txt

If we mention the absolute path, then it will look like this :

    $ mv /home/pungki/Documents/file_1.txt /home/pungki/Documents/file_2.txt

![Renaming file](http://linoxide.com/wp-content/uploads/2014/01/ren_file.png)

### 5. Renaming directory ###

The above rule is also applied to directory. Take a look this example :

    $ mv directory_1/ directory_2/

![Renaming directory](http://linoxide.com/wp-content/uploads/2014/01/ren_directory.png)

### 6. Print what happen ###

When you are moving or renaming a large number of file / directory, you may want to know does your command works successfully or not without seeing to the destination location. To do this, we can use **-v** option.
For example we want to move all txt files and want to check it. Then the command will be like this.

    $ mv -v *.txt /home/pungki/office

![mv with verbose mode](http://linoxide.com/wp-content/uploads/2014/01/mv_v.png)

The same way is applied to directory.

![mv directory with verbose mode](http://linoxide.com/wp-content/uploads/2014/01/mv_v_directory.png)

### 7. Using interactive mode ###

When you are moving file into another location, and there is already exist the same file, then by default mv will overwrite it. No pop-up notification for this. To make a notification for overwriting file, we can use **-i** option.

Let say we want to move file_1.txt to /home/pungki/office. Meanwhile, file_1.txt is already exist in /home/pungki/office directory.

    $ mv -i file_1.txt /home/pungki/office

![mv with interactive mode](http://linoxide.com/wp-content/uploads/2014/01/mv_interactive.png)

This notification will aware us about the existence of file_1.txt in the destination location. If we press “**y**” then the file will be moved, otherwise, it will not.

### 8. Using update option ###

While -i are notify us about overwriting files, then -u option will perform update **only if the source is newer than destination file**. Let’s take a look example below.

![Update only newer](http://linoxide.com/wp-content/uploads/2014/01/mv_u.png)

We have file_1.txt and file_2.txt with this attributes :

    File_1.txt has 84 bytes file size and it last modified time is 12:00
    File_2.txt has 0 bytes file size and it last modified time is 11:59

We want to move them into /home/pungki/office directory. **But in the destination location**, we already have file_1.txt and file_2.txt.

We move file_1.txt and file_2.txt from current directory into /home/pungki/office using command :

    $ mv -uv *.txt /home/pungki/office

As the result, we see those files are moved. Those file is moved because their last modified time stamp is newer than the files in /home/pungki/office directory.

### 9. Do not overwrite any existing file ###

If **-i** options is asking us about overwriting files, than -n option will not allow us to overwrite any existing files.

Using example on point 8, if we change the option from **-u to -n**, combine with **-v** option, then we will see that there are no files moved into /home/pungki/office directory.

    $ mv -vn *.txt /home/pungki/office

![No overwrite](http://linoxide.com/wp-content/uploads/2014/01/mv_n.png)

### 10. Create backup when copying ###

By default, moving files will overwrite the destination files if there are already exist before. But what happen if you are moving wrong files, and the destination files are already overwritten by the new ones? **Is there a way to retrieve the old one? Yes there is**. We can use **-b** option. **-b** option will make a backup of destination file before it overwritten by the new one. Once again, we will use scenario from point 8 above.

    $ mv -bv *.txt /home/pungki/office

![Backup option](http://linoxide.com/wp-content/uploads/2014/01/mv_b.png)

As you can see on the screenshot, on the /home/pungki/office directory, we have a file named **file_1.txt~ and file_2.txt~ . The tilde sign (~) means** that those files are backup. We can see the attribute of them is older than file_1.txt and file_2.txt.

### Conclusion ###

Moving file or directory also one of the basic command in Linux system. As usual you can type **man mv** or **mv --help** to display its manual page to explore more detail.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/mv-command-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linoxide.com/linux-command/linux-cp-command/
