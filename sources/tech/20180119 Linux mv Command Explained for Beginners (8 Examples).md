translating by cncuckoo

Linux mv Command Explained for Beginners (8 Examples)
======

Just like [cp][1] for copying and rm for deleting, Linux also offers an in-built command for moving and renaming files. It's called **mv**. In this article, we will discuss the basics of this command line tool using easy to understand examples. Please note that all examples used in this tutorial have been tested on Ubuntu 16.04 LTS.

#### Linux mv command

As already mentioned, the mv command in Linux is used to move or rename files. Following is the syntax of the command:

```
mv [OPTION]... [-T] SOURCE DEST
mv [OPTION]... SOURCE... DIRECTORY
mv [OPTION]... -t DIRECTORY SOURCE...
```

And here's what the man page says about it:
```
Rename SOURCE to DEST, or move SOURCE(s) to DIRECTORY.
```

The following Q&A-styled examples will give you a better idea on how this tool works.

#### Q1. How to use mv command in Linux?

If you want to just rename a file, you can use the mv command in the following way:

```
mv [filename] [new_filename]
```

For example:

```
mv names.txt fullnames.txt
```

[![How to use mv command in Linux][2]][3]

Similarly, if the requirement is to move a file to a new location, use the mv command in the following way:

```
mv [filename] [dest-dir]
```

For example:

```
mv fullnames.txt /home/himanshu/Downloads
```

[![Linux mv command][4]][5]

#### Q2. How to make sure mv prompts before overwriting?

By default, the mv command doesn't prompt when the operation involves overwriting an existing file. For example, the following screenshot shows the existing full_names.txt was overwritten by mv without any warning or notification.

[![How to make sure mv prompts before overwriting][6]][7]

However, if you want, you can force mv to prompt by using the **-i** command line option.

```
mv -i [file_name] [new_file_name]
```

[![the -i command option][8]][9]

So the above screenshots clearly shows that **-i** leads to mv asking for user permission before overwriting an existing file. Please note that in case you want to explicitly specify that you don't want mv to prompt before overwriting, then use the **-f** command line option.

#### Q3. How to make mv not overwrite an existing file?

For this, you need to use the **-n** command line option.

```
mv -n [filename] [new_filename]
```

The following screenshot shows the mv operation wasn't successful as a file with name 'full_names.txt' already existed and the command had -n option in it.

[![How to make mv not overwrite an existing file][10]][11]

Note:
```
If you specify more than one of -i, -f, -n, only the final one takes effect.
```

#### Q4. How to make mv remove trailing slashes (if any) from source argument?

To remove any trailing slashes from source arguments, use the **\--strip-trailing-slashes** command line option.

```
mv --strip-trailing-slashes [source] [dest]
```

Here's how the official documentation explains the usefulness of this option:
```
This is useful when a

source

 argument may have a trailing slash and specify a symbolic link to a directory. This scenario is in fact rather common because some shells can automatically append a trailing slash when performing file name completion on such symbolic links. Without this option,

mv

, for example, (via the system's rename function) must interpret a trailing slash as a request to dereference the symbolic link and so must rename the indirectly referenced

directory

 and not the symbolic link. Although it may seem surprising that such behavior be the default, it is required by POSIX and is consistent with other parts of that standard.
```

#### Q5. How to make mv treat destination as normal file?

To be absolutely sure that the destination entity is treated as a normal file (and not a directory), use the **-T** command line option.

```
mv -T [source] [dest]
```

Here's why this command line option exists:
```
This can help avoid race conditions in programs that operate in a shared area. For example, when the command 'mv /tmp/source /tmp/dest' succeeds, there is no guarantee that /tmp/source was renamed to /tmp/dest: it could have been renamed to/tmp/dest/source instead, if some other process created /tmp/dest as a directory. However, if mv -T /tmp/source /tmp/dest succeeds, there is no question that/tmp/source was renamed to /tmp/dest.
```
```
In the opposite situation, where you want the last operand to be treated as a directory and want a diagnostic otherwise, you can use the --target-directory (-t) option.
```

#### Q6. How to make mv move file only when its newer than destination file?

Suppose there exists a file named fullnames.txt in Downloads directory of your system, and there's a file with same name in your home directory. Now, you want to update ~/Downloads/fullnames.txt with ~/fullnames.txt, but only when the latter is newer. Then in this case, you'll have to use the **-u** command line option.

```
mv -u ~/fullnames.txt ~/Downloads/fullnames.txt
```

This option is particularly useful in cases when you need to take such decisions from within a shell script.

#### Q7. How make mv emit details of what all it is doing?

If you want mv to output information explaining what exactly it's doing, then use the **-v** command line option.

```
mv -v [filename] [new_filename]
```

For example, the following screenshots shows mv emitting some helpful details of what exactly it did.

[![How make mv emit details of what all it is doing][12]][13]

#### Q8. How to force mv to create backup of existing destination files?

This you can do using the **-b** command line option. The backup file created this way will have the same name as the destination file, but with a tilde (~) appended to it. Here's an example:

[![How to force mv to create backup of existing destination files][14]][15]

#### Conclusion

As you'd have guessed by now, mv is as important as cp and rm for the functionality it offers - renaming/moving files around is also one of the basic operations after all. We've discussed a majority of command line options this tool offers. So you can just practice them and start using the command. To know more about mv, head to its [man page][16].


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-mv-command/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/linux-cp-command/
[2]:https://www.howtoforge.com/images/command-tutorial/mv-rename-ex.png
[3]:https://www.howtoforge.com/images/command-tutorial/big/mv-rename-ex.png
[4]:https://www.howtoforge.com/images/command-tutorial/mv-transfer-file.png
[5]:https://www.howtoforge.com/images/command-tutorial/big/mv-transfer-file.png
[6]:https://www.howtoforge.com/images/command-tutorial/mv-overwrite.png
[7]:https://www.howtoforge.com/images/command-tutorial/big/mv-overwrite.png
[8]:https://www.howtoforge.com/images/command-tutorial/mv-prompt-overwrite.png
[9]:https://www.howtoforge.com/images/command-tutorial/big/mv-prompt-overwrite.png
[10]:https://www.howtoforge.com/images/command-tutorial/mv-n-option.png
[11]:https://www.howtoforge.com/images/command-tutorial/big/mv-n-option.png
[12]:https://www.howtoforge.com/images/command-tutorial/mv-v-option.png
[13]:https://www.howtoforge.com/images/command-tutorial/big/mv-v-option.png
[14]:https://www.howtoforge.com/images/command-tutorial/mv-b-option.png
[15]:https://www.howtoforge.com/images/command-tutorial/big/mv-b-option.png
[16]:https://linux.die.net/man/1/mv
