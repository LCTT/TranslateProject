translating by Flowsnow

How To Count The Number Of Files And Folders/Directories In Linux
======

Hi folks, today again we came with set of tricky commands that help you in many ways. It's kind of manipulation commands which help you to count files and directories in the current directory, recursive count, list of files created by particular user, etc,.

In this tutorial, we are going to show you, how to use more than one command like, all together to perform some advanced actions using ls, egrep, wc and find command. The below set of commands which helps you in many ways.

To experiment this, i'm going to create totally 7 files and 2 folders (5 regular files & 2 hidden files). See the below tree command output which clearly shows the files and folder lists.

**Suggested Read :** [File Manipulation Commands][1]
```
# tree -a /opt
/opt
├── magi
│   └── 2g
│   ├── test5.txt
│   └── .test6.txt
├── test1.txt
├── test2.txt
├── test3.txt
├── .test4.txt
└── test.txt

2 directories, 7 files

```

**Example-1 :** To count current directory files (excluded hidden files). Run the following command to determine how many files there are in the current directory and it doesn't count dotfiles.
```
# ls -l . | egrep -c '^-'
4

```

**Details :**

  * `ls` : list directory contents
  * `-l` : Use a long listing format
  * `.` : List information about the FILEs (the current directory by default).
  * `|` : control operator that send the output of one program to another program for further processing.
  * `egrep` : print lines matching a pattern
  * `-c` : General Output Control
  * `'^-'` : This respectively match the empty string at the beginning and end of a line.



**Example-2 :** To count current directory files which includes hidden files. This will include dotfiles as well in the current directory.
```
# ls -la . | egrep -c '^-'
5

```

**Example-3 :** Run the following command to count current directory files & folders. It will count all together at once.
```
# ls -1 | wc -l
5

```

**Details :**

  * `ls` : list directory contents
  * `-l` : Use a long listing format
  * `|` : control operator that send the output of one program to another program for further processing.
  * `wc` : It's a command to print newline, word, and byte counts for each file
  * `-l` : print the newline counts



**Example-4 :** To count current directory files & folders which includes hidden files & directory.
```
# ls -1a | wc -l
8

```

**Example-5 :** To count current directory files recursively which includes hidden files.
```
# find . -type f | wc -l
7

```

**Details :**

  * `find` : search for files in a directory hierarchy
  * `-type` : File is of type
  * `f` : regular file
  * `wc` : It's a command to print newline, word, and byte counts for each file
  * `-l` : print the newline counts



**Example-6 :** To print directories & files count using tree command (excluded hidden files).
```
# tree | tail -1
2 directories, 5 files

```

**Example-7 :** To print directories & files count using tree command which includes hidden files.
```
# tree -a | tail -1
2 directories, 7 files

```

**Example-8 :** Run the below command to count directory recursively which includes hidden directory.
```
# find . -type d | wc -l
3

```

**Example-9 :** To count the number of files based on file extension. Here we are going to count `.txt` files.
```
# find . -name "*.txt" | wc -l
7

```

**Example-10 :** Count all files in the current directory by using the echo command in combination with the wc command. `4` indicates the amount of files in the current directory.
```
# echo * | wc
1 4 39

```

**Example-11 :** Count all directories in the current directory by using the echo command in combination with the wc command. `1` indicates the amount of directories in the current directory.
```
# echo comic/ published/ sources/ translated/ | wc
1 1 6

```

**Example-12 :** Count all files and directories in the current directory by using the echo command in combination with the wc command. `5` indicates the amount of directories and files in the current directory.
```
# echo * | wc
1 5 44

```

**Example-13 :** To count number of files in the system (Entire system)
```
# find / -type f | wc -l
69769

```

**Example-14 :** To count number of folders in the system (Entire system)
```
# find / -type d | wc -l
8819

```

**Example-15 :** Run the following command to count number of files, folders, hardlinks, and symlinks in the system (Entire system)
```
# find / -type d -exec echo dirs \; -o -type l -exec echo symlinks \; -o -type f -links +1 -exec echo hardlinks \; -o -type f -exec echo files \; | sort | uniq -c
 8779 dirs
 69343 files
 20 hardlinks
 11646 symlinks

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-count-the-number-of-files-and-folders-directories-in-linux/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/empty-a-file-delete-contents-lines-from-a-file-remove-matching-string-from-a-file-remove-empty-blank-lines-from-a-file/
