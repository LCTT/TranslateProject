Linux rmdir Command for Beginners (with Examples)
======

So we've already discussed [the rm command][1] that's primarily used for deleting files and directories from the Linux command line. However, there's another, related command line utility that is specifically aimed at removing directories. The tool in question is **rmdir** , and in this tutorial, we will discuss the basics of it using some easy to understand examples.

#### Linux rmdir command

As the name suggests, the rmdir command is focused at removing directories, although empty-ones only. Following is its syntax:

```
rmdir [OPTION]... DIRECTORY...
```

And here's how the man page explains it:
```
Remove the DIRECTORY(ies), if they are empty.

```

The following Q&A-styled examples should give you a good idea on how this utility works.

#### Q1. How rmdir works?

That's pretty straight forward - just pass the directory name as input to the command. For example:

```
rmdir test-dir
```

[![How rmdir works][2]][3]

#### Q2. How to make rmdir ignore non-empty directories.

BY default, the rmdir command throws an error if you try deleting a non-empty directory. However, if you want, you can suppress this behavior of rmdir using the --ignore-fail-on-non-empty option.

For example:

[![How to make rmdir ignore non-empty directories][4]][5]

#### Q3. How to make rmdir remove parent directories as well?

Just like in the case of [mkdir][6], you can also ask rmdir to perform its operation on parent directories. What that means is, you can also delete parent directories of a directory in one go. This feature is accessible through the -p command line option.

For example, the following command will delete both 'test' and 'test-dir' directories.

```
rmdir -p test/test-dir/
```

**Note** : For this operation to work, all parent directories should not contain anything other than the empty-directory being deleted.

#### Q4. What is the difference between rmdir and rm -r ?

If you remember, you can also delete directories using the rm command by enabling the -r option it provides. So what's the difference between that and rmdir? Well, the answer is rmdir only works in the case of empty directories - there's no way whatsoever you can use to make rmdir delete non-empty directories.

So rmdir is a useful in tool in those situations where you otherwise need to check if a directory is empty before deleting it.

#### Conclusion

As you'll agree, rmdir isn't a complex command to understand and use. Plus, it offers only a handful command line options. We've discussed almost all of them here, so practice the examples mentioned in this article, and you should be good to go. Just in case you need, [here's the man page][7] for rmdir.


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-rmdir-command/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/linux-rm-command/
[2]:https://www.howtoforge.com/images/command-tutorial/rm-basic-usage1.png
[3]:https://www.howtoforge.com/images/command-tutorial/big/rm-basic-usage1.png
[4]:https://www.howtoforge.com/images/command-tutorial/rmdir-ignore-nonempty.png
[5]:https://www.howtoforge.com/images/command-tutorial/big/rmdir-ignore-nonempty.png
[6]:https://www.howtoforge.com/linux-mkdir-command/
[7]:https://linux.die.net/man/1/rmdir
