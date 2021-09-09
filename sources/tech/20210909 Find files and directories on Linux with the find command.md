[#]: subject: "Find files and directories on Linux with the find command"
[#]: via: "https://opensource.com/article/21/9/linux-find-command"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Find files and directories on Linux with the find command
======
There are many reasons to learn find, so download our free find cheat
sheet to help you learn more about the command.
![Magnifying glass on code][1]

Regardless of how organized I resolve to be, it seems there are always times when I just can't locate a file. Sometimes it's because I can't remember the name of the file in the first place. Other times, I know the name, but I can't recall where I decided to save it. There are even times when I need a file that I didn't create in the first place. No matter what the quandary, though, I know that on a [POSIX system][2], I always have the `find` command.

### Installing find

The `find` command is defined by the [POSIX specification][3], which creates the open standard by which POSIX systems (including Linux, BSD, and macOS) are measured. Simply put, you already have `find` installed as long as you're running Linux, BSD, or macOS.

However, not all `find` commands are exactly alike. The GNU `find` command, for instance, has features that the BSD or Busybox or Solaris `find` command might not have or does have but implements differently. This article uses GNU `find` from the [findutils][4] package because it's readily available and pretty popular. Most commands demonstrated in this article work with other implementations of `find`, but should you try a command on a platform other than Linux and get unexpected results, try downloading and installing the GNU version.

### Find a file by name

You can locate a file by its filename by providing the full file name or parts of the file name using regular expressions. The `find` command requires the path to the directory you want to search in, options to specify what attribute you're searching (for instance, -`name` for a case-sensitive file name), and then the search string. By default, your search string is treated literally: The `find` command searches for a filename that is exactly the string you enter between quotes unless you use regular expression syntax.

Assume your Documents directory contains four files: `Foo`, `foo`, `foobar.txt`, and `foo.xml`. Here's a literal search for a file with the name "foo":


```
$ find ~ -name "foo"
/home/tux/Documents/examples/foo
```

You can broaden your search by making it case-insensitive with the `-iname` option:


```
$ find ~ -iname "foo"
/home/tux/Documents/examples/foo
/home/tux/Documents/examples/Foo
```

### Wildcards

You can use basic shell wildcard characters to broaden your search. For instance, the asterisk (`*`) represents any number of characters:


```
$ find ~ -iname "foo*"
/home/tux/Documents/examples/foo
/home/tux/Documents/examples/Foo
/home/tux/Documents/examples/foo.xml
/home/tux/Documents/examples/foobar.txt
```

A question mark (`?`) represents a single character:


```
$ find ~ -iname "foo*.???"
/home/tux/Documents/examples/foo.xml
/home/tux/Documents/examples/foobar.txt
```

This isn't regular expression syntax, so the dot (`.`) represents a literal dot in this example.

### Regular expressions

You can also use regular expressions. As with `-iname` and `-name`, there's both a case-sensitive and a case-insensitive option. Unlike the `-name` and `-iname` options, though, a `-regex` and `-iregex` search is applied to the _whole path_, not just the file name. That means if you search for `foo`, you get no results because `foo` doesn't match `/home/tux/Documents/foo`. Instead, you must either search for the entire path, or else use a wildcard sequence at the beginning of your string:


```
$ find ~ -iregex ".*foo"
/home/tux/Documents/examples/foo
/home/tux/Documents/examples/Foo
```

### Find a file modified within the last week

To find a file you last modified last week, use the `-mtime` option along with a (negative) number of days in the past:


```
$ find ~ -mtime -7
/home/tux/Documents/examples/foo
/home/tux/Documents/examples/Foo
/home/tux/Documents/examples/foo.xml
/home/tux/Documents/examples/foobar.txt
```

### Find a file modified within a range of days

You can combine `-mtime` options to locate a file within a range of days. For the first `-mtime` argument, provide the most recent number of days you could have modified the file, and for the second, give the greatest number of days. For instance, this search looks for files with modification times more than one day in the past, but no more than seven:


```
`$ find ~ -mtime +1 -mtime -7`
```

### Limit a search by file type

It's common to optimize the results of `find` by specifying the file type you're looking for. You shouldn't use this option if you're not sure what you're looking for, but if you know you're looking for a file and not a directory, or a directory but not a file, then this can be a great filter to use. The option is `-type`, and its arguments are a letter code representing a few different kinds of data. The most common are:

  * `d` \- directory
  * `f` \- file
  * `l` \- symbolic link
  * `s` \- socket
  * `p` \- named pipe (used for FIFO)
  * `b` \- block special (usually a hard drive designation)



Here are some examples:


```
$ find ~ -type d -name "Doc*"
/home/tux/Documents
$ find ~ -type f -name "Doc*"
/home/tux/Downloads/10th-Doctor.gif
$ find /dev -type b -name "sda*"
/dev/sda
/dev/sda1
```

### Adjust scope

The `find` command is recursive by default, meaning that it searches for results in the directories of directories contained in directories (and so on). This can get overwhelming in a large filesystem, but you can use the `-maxdepth` option to control how deep into your folder structure you want `find` to descend:


```
$ find /usr -iname "*xml" | wc -l
15588
$ find /usr -maxdepth 2 -iname "*xml" | wc -l
15
```

You can alternately set the minimum depth of recursion with `-mindepth`:


```
$ find /usr -mindepth 8 -iname "*xml" | wc -l
9255
```

### Download the cheat sheet

This article only covers the basic functions of `find`. It's a great tool for searching through your system, but it's also a really useful front-end for the powerful [Parallel][5] command. There are many reasons to learn `find`, so **[download our free `find` cheat sheet][6]** to help you learn more about the command.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/linux-find-command

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0 (Magnifying glass on code)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/
[4]: https://www.gnu.org/software/findutils/
[5]: https://opensource.com/article/18/5/gnu-parallel
[6]: https://opensource.com/downloads/linux-find-cheat-sheet
