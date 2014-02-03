翻译ing by Luox 

15 Linux cp Command Examples - Create a Copy of Files and Directories
================================================================================
Copying files or directories is one of basic activity in every operating system. Backup activity is basically is creating a copy of files and directories. On Linux system, we can use **cp** command to do it.

### What is copy command ###

As we mentioned above, **cp** command is a command to create copy of files and directories. Here’s some samples of cp command that might useful in day-to-day operation

#### 1. Run cp without any options ####

This is a very basic cp usage. To copy a file name myfile.txt from one location to another location, we can type like this :

    $ cp myfile.txt /home/pungki/office

![Copy without options](http://linoxide.com/wp-content/uploads/2014/01/cp_default.png)

If we don’t type absolute path, it mean that we are copying a file on current directory. From example above, **myfile.txt** is located in **/home/pungki/Documents**. We don’t have to type **/home/pungki/Documents/myfile.txt** to copy **myfile.txt** if we are in that **/home/pungki/Documents** directory. While **/home/pungki/office** is a folder where the file will be copied.

#### 2. Copy multiple files at the same time ####

To copy multiple file at the same time, we can just put the files behind the copy command which separated by space. Here’s an example :

    $ cp file_1.txt file_2.txt file_3.txt /home/pungki/office

![Copying multiple files](http://linoxide.com/wp-content/uploads/2014/01/cp_multiple_file.png)

#### 3. Copy a directory ####

Copying a directory is a little bit tricky. You need to add **-r** or **-R** option to do it. -r or -R option means recursive. **This option is a must** whether the directory is empty or not. Here’s an example :

    $ cp -r directory_1 /home/pungki/office

![Copy directory](http://linoxide.com/wp-content/uploads/2014/01/cp_directory.png)

One more thing to note is that you need to **remove the trailing slash** behind the directory name. Otherwise you will have an error message like **cp : omitting directory ‘directory_1/**’

![Copy directory error](http://linoxide.com/wp-content/uploads/2014/01/cp_directory_error.png)

If you got that error, the directory will not copied to the destination folder.

#### 4. Create hard links to files instead of copying them ####

Copying file means you must have some space on the storage to store the copied files. Sometimes for any reasons, you may want to create “shortcut” or links to the files instead of copying them. To do this, we can use **-l** option.

    $ cp -l file_4.txt /home/pungki/office

![Copy hardlinks](http://linoxide.com/wp-content/uploads/2014/01/cp_hardlinks.png)

From screenshot above, we see that a hardlink of **file_4.txt** was copied into **/home/pungki/office/file_4.txt**. It marked by the same inode, **835386**. But please note, hardlinks cannot be created into directories. Let’s take a look an example below.

*The original directory_1 has inode number 278230*
![Inode number of original directory](http://linoxide.com/wp-content/uploads/2014/01/cp_hardlinks_dir_1_ori.png)

*The original file_5.txt has inode number 279231*
![Original inode number of file](http://linoxide.com/wp-content/uploads/2014/01/cp_hardlinks_file_5_ori.png)

*Do cp command on directory_1*
![Copy using -rl options](http://linoxide.com/wp-content/uploads/2014/01/cp_hardlinks_rl_dir.png)

*The copied directory_1 has inode number 274800*
![Inode number of copied directory](http://linoxide.com/wp-content/uploads/2014/01/cp_hardlinks_dir_1_result.png)

*The copied file_5.txt had inode number 279231. Same with its original file*
![Inode number of copied file](http://linoxide.com/wp-content/uploads/2014/01/cp_hardlinks_file_5_result.png)

#### 5. Create symbolic links to files ####

There is another type of links called **softlinks** or **symbolic links**. We use **-s** option to do this. Here’s a sample command.

    $ cp -s /home/pungki/Documents/file_6.txt file_6.txt

Creating symlinks only can be done in current directory. On screenshot above, we want to create symbolic links from source directory - **/home/pungki/Documents/file_6.txt to /home/pungki/office**. But to create symbolic links, **I must inside** /home/pungki/office as a destination folder. Once I manage to be there, I can run cp **-s** command above.

Then when you list the file with detail, you will see that **/home/pungki/office/file_6.txt** is pointing to the original file. Its marked with arrow sign after the file name.

![Symbolic links](http://linoxide.com/wp-content/uploads/2014/01/cp_symlinks.png)

#### 6. Copy without following symbolic links in Source ####

To do this, we can use **-P** option. When cp command found a file with symbolic links, it will copy the as is. Take a look at the sample below.

    $ cp -P file_6.txt ./movie

![Copy using -P option](http://linoxide.com/wp-content/uploads/2014/01/cp_P.png)

As you can see, the cp command will copy **file_6.txt** as is. The file type still a symbolic link.

#### 7. Copy with following symbolic links in Source ####

Now we can do this with **-L** option. Basically, **this is an opposite** of -P option above. Here’s the sample.

    $ cp -L file_6.txt ./movie

![Copy using -L option](http://linoxide.com/wp-content/uploads/2014/01/cp_L.png)

With this option, the copied file is the same file with the source file of **file_6.txt**. This is known from the file size. The copied file has **50 bytes** file size while the **file_6.txt** as symbolic link has **33 bytes** file size.

#### 8. Archive the files ####

When we are going to copy a directory, we will use **-r** or **-R** option. But we can also use **-a** option to archive file. This will create an **exact copy** of files and directories including symbolic links if any. Here’s a sample :

    $ cp -a directory_1/ /home/pungki/office

![Copy using -a option](http://linoxide.com/wp-content/uploads/2014/01/cp_a.png)

The above command will copy a directory named directory_1 into folder **/home/pungki/office**. As you can see, the **file_6.txt** still copied as symbolic links.

#### 9. Explain what is being done ####

By default, when copying activity is success, we will see a command prompt again. If you want to know what happen during the copying file, we can use **-v** option.

    $ cp -v *.txt /home/pungki/office

![Verbose option](http://linoxide.com/wp-content/uploads/2014/01/cp_v.png)

When we copying all txt files in current directory to **/home/pungki/office/** directory, **-v** option will show what is being done. This additional information will make us more sure about the copying activity.

#### 10. Copy only when the source file is newer ####

To do this, we can use **-u** option. Take a look this example below.

    $ cp -vu *.txt /home/pungki/office

![Copy only if newer](http://linoxide.com/wp-content/uploads/2014/01/cp_u.png)

In the beginning, we see **file_1.txt has 0 bytes** file size. Then we edit it using vi, add some content and save it. Next, we see the file size has changed into 36 bytes.
Meanwhile in **/home/pungki/office** directory, we **already have all** *.txt files. When we use -u option, combine with -v option to see what is being done, cp command will only copy a file(s) which is newer from destination directory. As the result, we see that **only file_1.txt is copied into /home/pungki/office directory**.

#### 11. Use interactive mode ####

Interactive mode will ask if the destination folder have already the file. To activate interactive mode, use **-i** option.

    $ cp -ir directory_1/ /home/pungki/office/

![Interactive mode](http://linoxide.com/wp-content/uploads/2014/01/cp_i.png)

#### 12. Create backup date of each copied file ####

When the destination folder already have the file, by default cp command will overwrite the same file in the destination directory. Using **--backup** option, cp command will make a backup of each existing destination file. ../office will refer to /home/pungki/office. Here’s a sample :

    $ cp --backup=simple -v *.txt ../office

![Backup option](http://linoxide.com/wp-content/uploads/2014/01/cp_backup.png)

As we can see, **--backup=simple** option will create a backup file which **marked by a tilde sign (~)** at the end of the file. **--backup** option has some Control, which are :

- **none, off** : never backups (even if --backup is given)
- **numbered, t** : make numbered backups
- **existing, nil** : numbered if numbered backup exist, simple otherwise
- **simple, never** : always make simple backups

#### 13. Copy only file attributes ####

Cp command also provide us with **--attributes-only** option. As we can guess from its name, this option will only copy a file name and its attributes without copying any data. Here’s a sample.

    $ cp --attributes-only file_6.txt -v ../office

![Copy attributes only](http://linoxide.com/wp-content/uploads/2014/01/cp_attributes_only.png)

From screenshot above, **the original file_6.txt file has 50 bytes** file size. Using **--attributes-only** option, **the copied file will have 0 bytes** file size. This is because the content of file is not being copied.

#### 14. Force copying ####

Using **-f** option will force the copying activity. If the destination files cannot be opened, then **-f** will try again.

    $ cp -f *.txt -v ../office

![Copy with force](http://linoxide.com/wp-content/uploads/2014/01/cp_f.png)

#### 15. Remove destination before copy ####

To do this, we can use **--remove-destination option**. This option is **contrast with -f option** above. If the cp command find the same file name on the destination folder, cp command will remove destination file first, the copy the new one. Here’s an example.

    $ cp --remove-destination *.txt -v ../office

![Remove destination option](http://linoxide.com/wp-content/uploads/2014/01/cp_remove_destination.png)

### Conclusion ###

Cp command is one of basic Linux commands. For those who want to learn Linux, must know this command. Of course you can type **man cp** or cp **--help** from your console to display its manual page to explore more detail.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-cp-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
