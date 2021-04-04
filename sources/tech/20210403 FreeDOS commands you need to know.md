[#]: subject: (FreeDOS commands you need to know)
[#]: via: (https://opensource.com/article/21/4/freedos-commands)
[#]: author: (Kevin O'Brien https://opensource.com/users/ahuka)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

FreeDOS commands you need to know
======
Learn how to make, remove, copy, and do other things with directories
and files in FreeDOS.
![woman on laptop sitting at the window][1]

[FreeDOS][2], the open source implementation of DOS, provides a lightweight operating system for running legacy applications on modern hardware (or in an emulator) and for updating hardware vendor fails with a Linux-compatible firmware flasher. Getting familiar with FreeDOS is not only a fun throwback to the computing days of the past, it's an investment into gaining useful computing skills. In this article, I'll look at some of the essential commands you need to know to work on a FreeDOS system.

### Essential directory and file commands

FreeDOS uses directories to organize files on a hard drive. That means you need to use directory commands to create a structure to store your files and find the files you've stored there. The commands you need to manage your directory structure are relatively few:

  * `MD` (or `MKDIR`) creates a new directory or subdirectory.
  * `RD` (or `RMDIR`) removes (or deletes) a directory or subdirectory.
  * `CD` (or `CHDIR`) changes from the current working directory to another directory.
  * `DELTREE` erases a directory, including any files or subdirectories it contains.
  * `DIR` lists the contents of the current working directory.



Because working with directories is central to what FreeDOS does, all of these (except DELTREE) are internal commands contained within COMMAND.COM. Therefore, they are loaded into RAM and ready for use whenever you boot (even from a boot disk). The first three commands have two versions: a two-letter short name and a long name. There is no difference in practice, so I'll use the short form in this article.

### Make a directory with MD

FreeDOS's `MD` command creates a new directory or subdirectory. (Actually, since the _root_ is the main directory, all directories are technically subdirectories, so I'll refer to _subdirectories_ in all examples.) An optional argument is the path to the directory you want to create, but if no path is included, the subdirectory is created in the current working subdirectory.

For example, to create a subdirectory called `letters` in your current location:


```
`C:\HOME\>MD LETTERS`
```

This creates the subdirectory `C:\letters`.

By including a path, you can create a subdirectory anywhere:


```
`C:\>MD C:\HOME\LETTERS\LOVE`
```

This has the same result as moving into `C:\HOME\LETTERS` first and then creating a subdirectory there:


```
C:\CD HOME\LETTERS
C:\HOME\LETTERS\&gt;MD LOVE
C:\HOME\LETTERS\&gt;DIR
LOVE
```

A path specification cannot exceed 63 characters, including backslashes.

### Remove a directory with RD

FreeDOS's `RD` command removes a subdirectory. The subdirectory must be empty. If it contains files or other subdirectories, you get an error message. This has an optional path argument with the same syntax as `MD`.

You cannot remove your current working subdirectory. To do that, you must `CD` to the parent subdirectory and then remove the undesired subdirectory.

### Delete files and directories with DELTREE

The `RD` command can be a little confusing because of safeguards FreeDOS builds into the command. That you cannot delete a subdirectory that has contents, for instance, is a safety measure. `DELTREE` is the solution.

`DELTREE` deletes an entire subdirectory "tree" (a subdirectory), plus all of the files it contains, plus all of the subdirectories those contain, and all of the files _they_ contain, and so on, all in one easy command. Sometimes it can be a little _too_ easy because it can wipe out so much data so quickly. It ignores file attributes, so you can wipe out hidden, read-only, and system files without knowing it.

You can even wipe out multiple trees by specifying them in the command. This would wipe out both of these subdirectories in one command:


```
`C:\>DELTREE C:\FOO C:\BAR`
```

This is one of those commands where you really ought to think twice before you use it. It has its place, definitely. I can still remember how tedious it was to go into each subdirectory, delete the individual files, check each subdirectory for contents, delete each subdirectory one at a time, then jump up one level and repeat the process. `DELTREE` is a great timesaver when you need it. But I would never use it for ordinary maintenance because one false move can do so much damage.

### Format a hard drive

The `FORMAT` command can also be used to prepare a blank hard drive to have files written to it. This formats the `D:` drive:


```
`C:\>FORMAT D:`
```

### Copy files

The `COPY` command, as the name implies, copies files from one place to another. The required arguments are the file to be copied and the path and file to copy it to. Switches include:

  * `/Y` prevents a prompt when a file is being overwritten.
  * `/-Y` requires a prompt when a file is being overwritten.
  * `/V` verifies the contents of the copy.



This copies the file `MYFILE.TXT` from the working directory on `C:` to the root directory of the `D:` drive and renames it `EXAMPLE.TXT`:


```
`C:\>COPY MYFILE.TXT D:\EXAMPLE.TXT`
```

This copies the file `EXAMPLE.TXT` from the working directory on `C:` to the `C:\DOCS\` directory and then verifies the contents of the file to ensure that the copy is complete:


```
`C:\>COPY EXAMPLE.TXT C:\DOCS\EXAMPLE.TXT /V`
```

You can also use the `COPY` command to combine and append files. This combines the two files `MYFILE1.TXT` and `MYFILE2.TXT` and places them in a new file called `MYFILE3.TXT`:


```
`C:\>COPY MYFILE1.TXT+MYFILE2.TXT MYFILE3.TXT`
```

### Copy directories with XCOPY

The `XCOPY` command copies entire directories, along with all of their subdirectories and all of the files contained in those subdirectories. Arguments are the files and path to be copied and the destination to copy them to. Important switches are:

  * `/S` copies all files in the current directory and any subdirectory within it.
  * `/E` copies subdirectories, even if they are empty. This option must be used with the `/S` option.
  * `/V` verifies the copies that were made.



This is a very powerful and useful command, particularly for backing up directories or an entire hard drive.

This command copies the entire contents of the directory `C:\DOCS`, including all subdirectories and their contents (except empty subdirectories) and places them on drive `D:` in the directory `D:\BACKUP\DOCS\`:


```
`C:\>XCOPY C:\DOCS D:\BACKUP\DOCS\ /S`
```

### Using FreeDOS

FreeDOS is a fun, lightweight, open source operating system. It provides lots of great utilities to enable you to get work done on it, whether you're using it to update the firmware of your motherboard or to give new life to an old computer. Learn the basics of FreeDOS. You might be surprised at how versatile it is.

* * *

_Some of the information in this article was previously published in [DOS lesson 8: Format; copy; diskcopy; Xcopy][3]; [DOS lesson 10: Directory commands][4] (both CC BY-SA 4.0); and [How to work with DOS][5]._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/freedos-commands

作者：[Kevin O'Brien][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ahuka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://www.freedos.org/
[3]: https://www.ahuka.com/dos-lessons-for-self-study-purposes/dos-lesson-8-format-copy-diskcopy-xcopy/
[4]: https://www.ahuka.com/dos-lessons-for-self-study-purposes/dos-lesson-10-directory-commands/
[5]: https://allaboutdosdirectoires.blogspot.com/
