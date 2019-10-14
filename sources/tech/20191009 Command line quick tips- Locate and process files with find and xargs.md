[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Command line quick tips: Locate and process files with find and xargs)
[#]: via: (https://fedoramagazine.org/command-line-quick-tips-locate-and-process-files-with-find-and-xargs/)
[#]: author: (Ben Cotton https://fedoramagazine.org/author/bcotton/)

Command line quick tips: Locate and process files with find and xargs
======

![][1]

**find** is one of the more powerful and flexible command-line programs in the daily toolbox. It does what the name suggests: it finds files and directories that match the conditions you specify. And with arguments like **-exec** or **-delete**, you can have find take action on what it… finds.

In this installment of the [Command Line Quick Tips][2] series, you’ll get an introduction to the **find** command and learn how to use it to process files with built-in commands or the **xargs** command.

### Finding files

At a minimum, **find** takes a path to find things in. For example, this command will find (and print) every file on the system:

```
find /
```

And since everything is a file, you will get a lot of output to sort through. This probably doesn’t help you locate what you’re looking for. You can change the path argument to narrow things down a bit, but it’s still not really any more helpful than using the **ls** command. So you need to think about what you’re trying to locate.

Perhaps you want to find all the JPEG files in your home directory. The **-name** argument allows you to restrict your results to files that match the given pattern.

```
find ~ -name '*jpg'
```

But wait! What if some of them have an uppercase extension? **-iname** is like **-name**, but it is case-insensitive:

```
find ~ -iname '*jpg'
```

Great! But the 8.3 name scheme is so 1985. Some of the pictures might have a .jpeg extension. Fortunately, we can combine patterns with an “or,” represented by **-o**. The parentheses are escaped so that the shell doesn’t try to interpret them instead of the **find** command.

```
find ~ \( -iname 'jpeg' -o -iname 'jpg' \)
```

We’re getting closer. But what if you have some directories that end in jpg? (Why you named a directory **bucketofjpg** instead of **pictures** is beyond me.) We can modify our command with the **-type** argument to look only for files:

```
find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type f
```

Or maybe you’d like to find those oddly named directories so you can rename them later:

```
find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type d
```

It turns out you’ve been taking a lot of pictures lately, so narrow this down to files that have changed in the last week with **-mtime** (modification time). The **-7** means all files modified in 7 days or fewer.

```
find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type f -mtime -7
```

### Taking action with xargs

The **xargs** command takes arguments from the standard input stream and executes a command based on them. Sticking with the example in the previous section, let’s say you want to copy all of the JPEG files in your home directory that have been modified in the last week to a thumb drive that you’ll attach to a digital photo display. Assume you already have the thumb drive mounted as _/media/photo_display_.

```
find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type f -mtime -7 -print0 | xargs -0 cp -t /media/photo_display
```

The **find** command is slightly modified from the previous version. The **-print0** command makes a subtle change on how the output is written: instead of using a newline, it adds a null character. The **-0** (zero) option to **xargs** adjusts the parsing to expect this. This is important because otherwise actions on file names that contain spaces, quotes, or other special characters may not work as expected. You should use these options whenever you’re taking action on files.

The **-t** argument to **cp** is important because **cp** normally expects the destination to come last. You can do this without **xargs** using **find**‘s **-exec** command, but the **xargs** method will be faster, especially with a large number of files, because it will run as a single invocation of **cp**.

### Find out more

This post only scratches the surface of what **find** can do. **find** supports testing based on permissions, ownership, access time, and much more. It can even compare the files in the search path to other files. Combining tests with Boolean logic can give you incredible flexibility to find exactly the files you’re looking for. With build in commands or piping to **xargs**, you can quickly process a large set of files.

_Portions of this article were previously published on [Opensource.com][3]._ _Photo by _[_Warren Wong_][4]_ on [Unsplash][5]_.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/command-line-quick-tips-locate-and-process-files-with-find-and-xargs/

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/bcotton/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/10/commandlinequicktips-816x345.jpg
[2]: https://fedoramagazine.org/?s=command+line+quick+tips
[3]: https://opensource.com/article/18/4/how-use-find-linux
[4]: https://unsplash.com/@wflwong?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[5]: https://unsplash.com/s/photos/search?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
