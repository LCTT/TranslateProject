Linux ln Command Tutorial for Beginners (5 Examples)
======

Sometimes, while working on the command line, you need to create links between files. This can be achieved using a dedicated command, dubbed **ln**. In this tutorial, we will discuss the basics of this tool using some easy to understand examples. But before we do that, it's worth mentioning that all examples here have been tested on an Ubuntu 16.04 machine.

### Linux ln command

As you'd have understood by now, the ln command lets you make links between files. Following is the syntax (or rather different syntax available) for this tool:

```
ln [OPTION]... [-T] TARGET LINK_NAME (1st form)
ln [OPTION]... TARGET (2nd form)
ln [OPTION]... TARGET... DIRECTORY (3rd form)
ln [OPTION]... -t DIRECTORY TARGET... (4th form)
```

And here's how the tool's man page explains it:
```
In  the  1st form, create a link to TARGET with the name LINK_NAME. In the 2nd form, create a link
to TARGET in the current directory. In the 3rd and 4th forms, create links to each TARGET in
DIRECTORY. Create hard links by default, symbolic links with --symbolic. By default, each
destination (name of new link) should not already exist. When creating hard links, each TARGET
must exist. Symbolic links can hold arbitrary text; if later resolved, a relative link is
interpreted in relation to its parent directory.
```

The following Q&A-styled examples will give you a better idea on how the ln command works. But before that, it's good you get a understanding of what's the [difference between hard links and soft links][1].

### Q1. How to create a hard link using ln?

That's pretty straightforward - all you have to do is to use the ln command in the following way:

```
ln [file] [hard-link-to-file]
```

For example:

```
ln test.txt test_hard_link.txt
```

[![How to create a hard link using ln][2]][3]

So you can see a hard link was created with the name test_hard_link.txt.

### Q2. How to create soft/symbolic link using ln?

For this, use the -s command line option.

```
ln -s [file] [soft-link-to-file]
```

For example:

```
ln -s test.txt test_soft_link.txt
```

[![How to create soft/symbolic link using ln][4]][5]

The test_soft_link.txt file is a soft/symbolic link, as [confirmed][6] by its sky blue text color.

### Q3. How to make ln remove existing destination files of same name?

By default, ln won't let you create a link if a file of the same name already exists in the destination directory.

[![ln command example][7]][8]

However, if you want, you can make ln override this behavior by using the **-f** command line option.

[![How to make ln remove existing destination files of same name][9]][10]

**Note** : You can use the **-i** command line option if you want to make all this deletion process interactive.

### Q4. How to make ln create backup of existing files with same name?

If you don't want ln to delete existing files of same name, you can make it create backup of these files. This can be achieved using the **-b** command line option. Backup files created this way will contain a tilde (~) towards the end of their name.

[![How to make ln create backup of existing files with same name][11]][12]

A particular destination directory (other than the current one) can be specified using the **-t** command line option. For example:

```
ls test* | xargs ln -s -t /home/himanshu/Desktop/
```

The aforementioned command will create links to all test* files (present in the current directory) and put them in the Desktop directory.

### Conclusion

Agreed, **ln** isn't something that you'll require on daily basis, especially if you're a newbie. But it's a helpful command to know about, as you never know when it'd save your day. We've discussed some useful command line options the tool offers. Once you're done with these, you can learn more about ln by heading to its [man page][13].


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-ln-command/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://medium.com/meatandmachines/explaining-the-difference-between-hard-links-symbolic-links-using-bruce-lee-32828832e8d3
[2]:https://www.howtoforge.com/images/command-tutorial/ln-hard-link.png
[3]:https://www.howtoforge.com/images/command-tutorial/big/ln-hard-link.png
[4]:https://www.howtoforge.com/images/command-tutorial/ln-soft-link.png
[5]:https://www.howtoforge.com/images/command-tutorial/big/ln-soft-link.png
[6]:https://askubuntu.com/questions/17299/what-do-the-different-colors-mean-in-ls
[7]:https://www.howtoforge.com/images/command-tutorial/ln-file-exists.png
[8]:https://www.howtoforge.com/images/command-tutorial/big/ln-file-exists.png
[9]:https://www.howtoforge.com/images/command-tutorial/ln-f-option.png
[10]:https://www.howtoforge.com/images/command-tutorial/big/ln-f-option.png
[11]:https://www.howtoforge.com/images/command-tutorial/ln-b-option.png
[12]:https://www.howtoforge.com/images/command-tutorial/big/ln-b-option.png
[13]:https://linux.die.net/man/1/ln
