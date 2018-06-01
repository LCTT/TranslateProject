Copying and renaming files on Linux
======
![](https://images.idgesg.net/images/article/2018/05/trees-100759415-large.jpg)
Linux users have for many decades been using simple cp and mv commands to copy and rename files. These commands are some of the first that most of us learned and are used every day by possibly millions of people. But there are other techniques, handy variations, and another command for renaming files that offers some unique options.

First, let’s think about why might you want to copy a file. You might need the same file in another location or you might want a copy because you’re going to edit the file and want to be sure you have a handy backup just in case you need to revert to the original file. The obvious way to do that is to use a command like “cp myfile myfile-orig”.

If you want to copy a large number of files, however, that strategy might get old real fast. Better alternatives are to:

  * Use tar to create an archive of all of the files you want to back up before you start editing them.
  * Use a for loop to make the backup copies easier.



The tar option is very straightforward. For all files in the current directory, you’d use a command like:
```
$ tar cf myfiles.tar *

```

For a group of files that you can identify with a pattern, you’d use a command like this:
```
$ tar cf myfiles.tar *.txt

```

In each case, you end up with a myfiles.tar file that contains all the files in the directory or all files with the .txt extension.

An easy loop would allow you to make backup copies with modified names:
```
$ for file in *
> do
> cp $file $file-orig
> done

```

When you’re backing up a single file and that file just happens to have a long name, you can rely on using the tab command to use filename completion (hit the tab key after entering enough letters to uniquely identify the file) and use syntax like this to append “-orig” to the copy.
```
$ cp file-with-a-very-long-name{,-orig}

```

You then have a file-with-a-very-long-name and a file-with-a-very-long-name file-with-a-very-long-name-orig.

### Renaming files on Linux

The traditional way to rename a file is to use the mv command. This command will move a file to a different directory, change its name and leave it in place, or do both.
```
$ mv myfile /tmp
$ mv myfile notmyfile
$ mv myfile /tmp/notmyfile

```

But we now also have the rename command to do some serious renaming for us. The trick to using the rename command is to get used to its syntax, but if you know some perl, you might not find it tricky at all.

Here’s a very useful example. Say you wanted to rename the files in a directory to replace all of the uppercase letters with lowercase ones. In general, you don’t find a lot of file with capital letters on Unix or Linux systems, but you could. Here’s an easy way to rename them without having to use the mv command for each one of them. The /A-Z/a-z/ specification tells the rename command to change any letters in the range A-Z to the corresponding letters in a-z.
```
$ ls
Agenda Group.JPG MyFile
$ rename 'y/A-Z/a-z/' *
$ ls
agenda group.jpg myfile

```

You can also use rename to remove file extensions. Maybe you’re tired of seeing text files with .txt extensions. Simply remove them — and in one command.
```
$ ls
agenda.txt notes.txt weekly.txt
$ rename 's/.txt//' *
$ ls
agenda notes weekly

```

Now let’s imagine you have a change of heart and want to put those extensions back. No problem. Just change the command. The trick is understanding that the “s” before the first slash means “substitute”. What’s in between the first two slashes is what we want to change, and what’s in between the second and third slashes is what we want to change it to. So, $ represents the end of the filename, and we’re changing it to “.txt”.
```
$ ls
agenda notes weekly
$ rename 's/$/.txt/' *
$ ls
agenda.txt notes.txt weekly.txt

```

You can change other parts of filenames, as well. Keep the **s/old/new/** rule in mind.
```
$ ls
draft-minutes-2018-03 draft-minutes-2018-04 draft-minutes-2018-05
$ rename 's/draft/approved/' *minutes*
$ ls
approved-minutes-2018-03 approved-minutes-2018-04 approved-minutes-2018-05

```

Note in the examples above that when we use an **s** as in  " **s** /old/new/", we are substituting one part of the name with another. When we use **y** , we are transliterating (substituting characters from one range to another).

### Wrap-up

There are a lot of options for copying and renaming files. I hope some of them will make your time on the command line more enjoyable.

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3276349/linux/copying-and-renaming-files-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.facebook.com/NetworkWorld/
[2]:https://www.linkedin.com/company/network-world
