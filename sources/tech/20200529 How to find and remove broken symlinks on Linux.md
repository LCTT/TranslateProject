[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to find and remove broken symlinks on Linux)
[#]: via: (https://www.networkworld.com/article/3546252/how-to-find-and-remove-broken-symlinks-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to find and remove broken symlinks on Linux
======
A symlink or "symbolic link" is a Linux file that simply points at another file. If the referenced file is removed, the symlink will remain but not indicate there's a problem until you try to use it. Here are some easy ways to find and remove symlinks that point to files that have been moved or removed.
Thinkstock

Symbolic links play a very useful role on Linux systems. They can help you remember where important files are located on a system, make it easier for you to access those files and save you a good amount of disk space and trouble by making it unnecessary for you to copy large files just to make them a little more accessible.

### What exactly is a symbolic link?

Generally referred to as a "symlink" or "soft link", symbolic links are very small files. In fact, all a symlink really contains is the name of whatever file it points to, generally along with the file system path (relative to the current location or absolute). If a file named **ref1** points to a file named **/apps/refs/ref-2020**, **ref1** will be 19 characters long even if the ref-2020 file is 2 terabytes. If it points to **./ref-2020**, it will be only 10 characters in length. If it points to **ref-2020**, only eight.

If you issue a command like "vi ref1" (where ref1 is the name of a symlink), you will end up editing whatever file ref1 points to, not the contents of the symlink itself. Linux systems know how to work with symlinks and simply do the right thing. Similarly, if you use commands like **cat**, **more**, **head** or **tail**, you'll be looking at the content of the referenced file.

If you delete a symlink, on the other hand, you will be removing the link, never the referenced file. Again, Linux does what makes sense. Symlinks were meant to make using and sharing files easier -- nothing more.

#### When symlinks get broken

When the file that a symbolic link points to is removed from the system or renamed, the symlink will no longer function as intended. Being little more than a reference stored in some particular directory, the symlink isn't going to be updated or removed with changes to the file it points to. It keeps pointing at the referenced file, even after that file is long gone.

If you try to use a symlink that points to a non-existent file, you will get an error like this:

```
$ tail whassup
tail: cannot open 'whassup' for reading: No such file or directory
```

If you try to access a symlink that points to itself (yes, stranger things have happened), you will see something like this:

```
$ cat loopy
cat: loopy: Too many levels of symbolic links
$ ls -l loopy
lrwxrwxrwx 1 shs shs 5 May 28 18:07 loopy -> loopy
```

And, just in case that first letter in the long listing didn't catch your attention, it indicates that the file is a symbolic link. The **rwxrwxrwx** permissions are standard and don't reflect the permissions on the file the symlink points at.

### Finding broken symlinks

The find command has an option that allows you to locate symlinks that point to files that no longer exist. This command lists symlinks in the current directory:

```
$ find . -type l
```

The "l" (lowercase L) tells the find command to look for symbolic links.

The command shown below, on the other hand, looks in the current directory for symlinks that point to files that don't exist:

```
$ find . -xtype l
```

To avoid running into errors when the command tries to look into files or directories that you don't have permission to examine, you can send all error output to /dev/null like this:

```
$ find . -xtype l 2>/dev/null
```

You can also find broken symlinks with a command like this one. It's longer than the earlier one, but should do the same thing:

```
$ find . -type l ! -exec test -e {} \; -print 2>/dev/null
```

### What to do with broken symlinks

Unless you know that the file a symlink references is going to be replaced, the best move is to simply remove the broken link. In fact, you can find and remove broken symlinks in a single command if you want to, with a command like this one:

```
$ find . -xtype l 2>/dev/null -exec rm {} \;
```

The **rm {}** portion of that command turns into a "remove filename" command.

If, instead, you want to associate the symlink with a different file, you will have to remove the symlink and then recreate it so that it points to the new file. Here's an example:

```
$ rm ref1
$ ln -s /apps/data/newfile ref1
```

#### Wrap-Up

Symbolic links make the referenced files easier to find and use, but they sometimes evolve into little more than road signs that advertise a diner that closed last year. Finding commands can help you get rid of the broken symlinks or alert you to the absence of files that you might still require.

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3546252/how-to-find-and-remove-broken-symlinks-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world
