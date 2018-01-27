Linux whereis Command Explained for Beginners (5 Examples)
======

Sometimes, while working on the command line, we just need to quickly find out the location of the binary file for a command. Yes, the [find][1] command is an option in this case, but it's a bit time consuming and will likely produce some non-desired results as well. There's a specific command that's designed for this purpose: **whereis**.

In this article, we will discuss the basics of this command using some easy to understand examples. But before we do that, it's worth mentioning that all examples in this tutorial have been tested on Ubuntu 16.04LTS.

### Linux whereis command

The whereis command lets users locate binary, source, and manual page files for a command. Following is its syntax:

```
whereis [options] [-BMS directory... -f] name...
```

And here's how the tool's man page explains it:
```
whereis locates the binary, source and manual files for the specified command names. The supplied
names are first stripped of leading pathname components and any (single) trailing extension of the
form .ext (for example: .c) Prefixes of s. resulting from use of source code control are also dealt
with. whereis then attempts to locate the desired program in the standard Linux places, and in the
places specified by $PATH and $MANPATH.
```

The following Q&A-styled examples should give you a good idea on how the whereis command works.

### Q1. How to find location of binary file using whereis?

Suppose you want to find the location for, let's say, the whereis command itself. Then here's how you can do that:

```
whereis whereis
```

[![How to find location of binary file using whereis][2]][3]

Note that the first path in the output is what you are looking for. The whereis command also produces paths for manual pages and source code (if available, which isn't in this case). So the second path you see in the output above is the path to the whereis manual file(s).

### Q2. How to specifically search for binaries, manuals, or source code?

If you want to search specifically for, say binary, then you can use the **-b** command line option. For example:

```
whereis -b cp
```

[![How to specifically search for binaries, manuals, or source code][4]][5]

Similarly, the **-m** and **-s** options are used in case you want to find manuals and sources.

### Q3. How to limit whereis search as per requirement?

By default whereis tries to find files from hard-coded paths, which are defined with glob patterns. However, if you want, you can limit the search using specific command line options. For example, if you want whereis to only search for binary files in /usr/bin, then you can do this using the **-B** command line option.

```
whereis -B /usr/bin/ -f cp
```

**Note** : Since you can pass multiple paths this way, the **-f** command line option terminates the directory list and signals the start of file names.

Similarly, if you want to limit manual or source searches, you can use the **-M** and **-S** command line options.

### Q4. How to see paths that whereis uses for search?

There's an option for this as well. Just run the command with **-l**.

```
whereis -l
```

Here is the list (partial) it produced for us:

[![How to see paths that whereis uses for search][6]][7]

### Q5. How to find command names with unusual entries?

For whereis, a command becomes unusual if it does not have just one entry of each explicitly requested type. For example, commands with no documentation available, or those with documentation in multiple places are considered unusual. The **-u** command line option, when used, makes whereis show the command names that have unusual entries.

For example, the following command should display files in the current directory which have no documentation file, or more than one.

```
whereis -m -u *
```

### Conclusion

Agreed, whereis is not the kind of command line tool that you'll require very frequently. But when the situation arises, it definitely makes your life easy. We've covered some of the important command line options the tool offers, so do practice them. For more info, head to its [man page][8].


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-whereis-command/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/tutorial/linux-find-command/
[2]:https://www.howtoforge.com/images/command-tutorial/whereis-basic-usage.png
[3]:https://www.howtoforge.com/images/command-tutorial/big/whereis-basic-usage.png
[4]:https://www.howtoforge.com/images/command-tutorial/whereis-b-option.png
[5]:https://www.howtoforge.com/images/command-tutorial/big/whereis-b-option.png
[6]:https://www.howtoforge.com/images/command-tutorial/whereis-l.png
[7]:https://www.howtoforge.com/images/command-tutorial/big/whereis-l.png
[8]:https://linux.die.net/man/1/whereis
