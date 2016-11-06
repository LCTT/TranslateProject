yangmingming translating
# 3 Ways to Delete All Files in a Directory Except One or Few Files with Extensions

Sometimes you get into a situation where you need to delete all files in a directory or simply cleanup a directory by removing all files except files of a given type (ending with a particular extension).

In this article, we will show you how to delete files in a directory except certain file extensions or types using rm, find and globignore commands.

Before we move any further, let us start by briefly having a look at one important concept in Linux – filename pattern matching, which will enable us to deal with our issue at hand.

In Linux, a shell pattern is a string that consists of the following special characters, which are referred to as wildcards or metacharacters:

1.  `*` – matches zero or more characters
2.  `?` – matches any single character
3.  `[seq]` – matches any character in seq
4.  `[!seq]` – matches any character not in seq

There are three possible methods we shall explore here, and these include:

### Delete Files Using Extended Pattern Matching Operators

The different extended pattern matching operators are listed below, where pattern-list is a list containing one or more filenames, separated using the `|` character:

1.  `*(pattern-list)` – matches zero or more occurrences of the specified patterns
2.  `?(pattern-list)` – matches zero or one occurrence of the specified patterns
3.  +(pattern-list) – matches one or more occurrences of the specified patterns
4.  `@(pattern-list)` – matches one of the specified patterns
5.  `!(pattern-list)` – matches anything except one of the given patterns

To use them, enable the extglob shell option as follows:

```
# shopt -s extglob

```

#### 1. To delete all files in a directory except filename, type the command below:

  ```
$ rm -v !("filename")

  ```
  [![Delete All Files Except One File in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/DeleteAll-Files-Except-One-File-in-Linux.png)][9]

  Delete All Files Except One File in Linux

#### 2. To delete all files with the exception of filename1 and filename2:

  ```
$ rm -v !("filename1"|"filename2") 

  ```
  [![Delete All Files Except Few Files in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Delete-All-Files-Except-Few-Files-in-Linux.png)][8]

  Delete All Files Except Few Files in Linux

#### 3. The example below shows how to remove all files other than all `.zip` files interactively:

  ```
$ rm -i !(*.zip)

  ```
  [![Delete All Files Except Zip Files in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Delete-All-Files-Except-Zip-Files-in-Linux.png)][7]

  Delete All Files Except Zip Files in Linux

#### 4. Next, you can delete all files in a directory apart from all `.zip` and `.odt` files as follows, while displaying what is being done:

  ```
$ rm -v !(*.zip|*.odt)

  ```
  [![Delete All Files Except Certain File Extensions](http://www.tecmint.com/wp-content/uploads/2016/10/Delete-All-Files-Except-Certain-File-Extensions.png)][6]

  Delete All Files Except Certain File Extensions

  Once you have all the required commands, turn off the extglob shell option like so:

  ```
$ shopt -u extglob

  ```

### Delete Files Using Linux find Command

Under this method, we can [use find command exclusively][5] with appropriate options or in conjunction with xargscommand by employing a pipeline as in the forms below:

  ```
$ find /directory/ -type f -not -name 'PATTERN' -delete
$ find /directory/ -type f -not -name 'PATTERN' -print0 | xargs -0 -I {} rm {}
$ find /directory/ -type f -not -name 'PATTERN' -print0 | xargs -0 -I {} rm [options] {}

  ```

#### 5. The following command will delete all files apart from `.gz` files in the current directory:

  ```
$ find . -type f -not -name '*.gz'-delete

  ```
  [![Command find - Remove All Files Except .gz Files](http://www.tecmint.com/wp-content/uploads/2016/10/Remove-All-Files-Except-gz-Files.png)][4]

  Command find – Remove All Files Except .gz Files

#### 6. Using a pipeline and xargs, you can modify the case above as follows:

  ```
$ find . -type f -not -name '*gz' -print0 | xargs -0  -I {} rm -v {}

  ```
  [![Remove Files Using find and xargs Commands](http://www.tecmint.com/wp-content/uploads/2016/10/Remove-Files-Using-Find-and-Xargs-Command.png)][3]

  Remove Files Using find and xargs Commands

#### 7. Let us look at one additional example, the command below will wipe out all files excluding `.gz`, `.odt`, and `.jpg` files in the current directory:

  ```
$ find . -type f -not \(-name '*gz' -or -name '*odt' -or -name '*.jpg' \) -delete

  ```
  [![Remove All Files Except File Extensions](http://www.tecmint.com/wp-content/uploads/2016/10/Remove-All-Files-Except-File-Extensions.png)][2]

  Remove All Files Except File Extensions

### Delete Files Using Bash GLOBIGNORE Variable

This last approach however, only works with bash. Here, the GLOBIGNORE variable stores a colon-separated pattern-list (filenames) to be ignored by pathname expansion.

To employ this method, move into the directory that you wish to clean up, then set the GLOBIGNORE variable as follows:

```
$ cd test
$ GLOBIGNORE=*.odt:*.iso:*.txt

```

In this instance, all files other than `.odt`, `.iso`, and `.txt` files with be removed from the current directory.

Now run the command to clean up the directory:

```
$ rm -v *

```

Afterwards, turn off GLOBIGNORE variable:

```
$ unset GLOBIGNORE

```
[![Delete Files Using Bash GLOBIGNORE Variable](http://www.tecmint.com/wp-content/uploads/2016/10/Delete-Files-Using-Bash-GlobIgnore.png)][1]

Delete Files Using Bash GLOBIGNORE Variable

Note: To understand the meaning of the flags employed in the commands above, refer to the man pages of each command we have used in the various illustrations.

Thats all! If you have any other command line techniques in mind for the same purpose, do not forget to share with us via our feedback section below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/delete-all-files-in-directory-except-one-few-file-extensions/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+tecmint+%28Tecmint%3A+Linux+Howto%27s+Guide%29

作者：[ Aaron Kili][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/wp-content/uploads/2016/10/Delete-Files-Using-Bash-GlobIgnore.png
[2]:http://www.tecmint.com/wp-content/uploads/2016/10/Remove-All-Files-Except-File-Extensions.png
[3]:http://www.tecmint.com/wp-content/uploads/2016/10/Remove-Files-Using-Find-and-Xargs-Command.png
[4]:http://www.tecmint.com/wp-content/uploads/2016/10/Remove-All-Files-Except-gz-Files.png
[5]:http://www.tecmint.com/35-practical-examples-of-linux-find-command/
[6]:http://www.tecmint.com/wp-content/uploads/2016/10/Delete-All-Files-Except-Certain-File-Extensions.png
[7]:http://www.tecmint.com/wp-content/uploads/2016/10/Delete-All-Files-Except-Zip-Files-in-Linux.png
[8]:http://www.tecmint.com/wp-content/uploads/2016/10/Delete-All-Files-Except-Few-Files-in-Linux.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/10/DeleteAll-Files-Except-One-File-in-Linux.png
