Linux for Beginners: Moving Things Around
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/filesystem-linux.jpg?itok=NQCoYl1f)

In previous installments of this series, [you learned about directories][1] and how [permissions to access directories work][2]. Most of what you learned in those articles can be applied to files, except how to make a file executable.

So let's deal with that before moving on.

### No _.exe_ Needed

In other operating systems, the nature of a file is often determined by its extension. If a file has a _.jpg_ extension, the OS guesses it is an image; if it ends in _.wav_ , it is an audio file; and if it has an _.exe_ tacked onto the end of the file name, it is a program you can execute.

This leads to serious problems, like trojans posing as documents. Fortunately, that is not how things work in Linux. Sure, you may see occasional executable file endings in _.sh_ that indicate they are runnable shell scripts, but this is mostly for the benefit of humans eyeballing files, the same way when you use `ls --color`, the names of executable files show up in bright green.

The fact is most applications have no extension at all. What determines whether a file is really program is the _x_ (for _executable_ ) bit. You can make any file executable by running
```
chmod a+x some_program

```

regardless of its extension or lack thereof. The `x` in the command above sets the _x_ bit and the `a` says you are setting it for _all_ users. You could also set it only for the group of users that own the file (`g+x`), or for only one user, the owner (`u+x`).

Although we will be covering creating and running scripts from the command line later in this series, know that you can run a program by writing the path to it and then tacking on the name of the program on the end:
```
path/to/directory/some_program

```

Or, if you are currently in the same directory, you can use:
```
./some_program

```

There are other ways of making your program available from anywhere in the directory tree (hint: look up the `$PATH` environment variable), but you will be reading about those when we talk about shell scripting.

### Copying, Moving, Linking

Obviously, there are more ways of modifying and handling files from the command line than just playing around with their permissions. Most applications will create a new file if you still try to open a file that doesn't exist. Both
```
nano test.txt

```

and
```
vim test.txt

```

([nano][3] and [vim][4] being to popular command line text editors) will create an empty _test.txt_ file for you to edit if _test.txt_ didn't exist beforehand.

You can also create an empty file by _touching_ it:
```
touch test.txt

```

Will create a file, but not open it in any application.

You can use `cp` to make a copy of a file in another location or under a new name:
```
cp test.txt copy_of_test.txt

```

You can also copy a whole bunch of files:
```
cp *.png /home/images

```

The instruction above copies all the PNG files in the current directory into an _images/_ directory hanging off of your home directory. The _images/_ directory has to exist before you try this, or `cp` will show an error. Also, be warned that, if you copy a file to a directory that contains another file with the same name, `cp` will silently overwrite the old file with the new one.

You can use
```
cp -i *.png /home/images

```

If you want `cp` to warn you of any dangers (the `-i` options stands for _interactive_ ).

You can also copy whole directories, but you need the `-r` option for that:
```
cp -rv directory_a/ directory_b

```

The `-r` option stands for _recursive_ , meaning that `cp` will drill down into _directory_a_ , copying over all the files and subdirectories contained within. I personally like to include the `-v` option, as it makes `cp` _verbose_ , meaning that it will show you what it is doing instead of just copying silently and then exiting.

The `mv` command moves stuff. That is, it changes files from one location to another. In its simplest form, `mv` looks a lot like `cp`:
```
mv test.txt new_test.txt

```

The command above makes _new_test.txt_ appear and _test.txt_ disappear.
```
mv *.png /home/images

```

Moves all the PNG files in the current directory to a directory called _images/_ hanging of your home directory. Again you have to be careful you do not overwrite existing files by accident. Use
```
mv -i *.png /home/images

```

the same way you would with `cp` if you want to be on the safe side.

Apart from moving versus copying, another difference between `mv` and `cp`is when you move a directory:
```
mv directory_a/ directory_b

```

No need for a recursive flag here. This is because what you are really doing is renaming the directory, the same way in the first example, you were renaming the file*. In fact, even when you "move" a file from one directory to another, as long as both directories are on the same storage device and partition, you are renaming the file.

You can do an experiment to prove it. `time` is a tool that lets you measure how long a command takes to execute. Look for a hefty file, something that weighs several hundred MBs or even some GBs (say, something like a long video) and try copying it from one directory to another like this:
```
$ time cp hefty_file.mkv another_directory/
real 0m3,868s
user 0m0,016s
sys 0m0,887s

```

In bold is what you have to type into the terminal and below what `time` outputs. The number to focus on is the one on the first line, _real_ time. It takes nearly 4 seconds to copy the 355 MBs of _hefty_file.mkv_ to _another_directory/_.

Now let's try moving it:
```
$ time mv hefty_file.mkv another_directory/
real 0m0,004s
user 0m0,000s
sys 0m0,003s

```

Moving is nearly instantaneous! This is counterintuitive, since it would seem that `mv` would have to copy the file and then delete the original. That is two things `mv` has to do versus `cp`'s one. But, somehow, `mv` is 1000 times faster.

That is because the file system's structure, with all its tree of directories, only exists for the users convenience. At the beginning of each partition there is something called a _partition table_ that tells the operating system where to find each file on the actual physical disk. On the disk, data is not split up into directories or even files. [There are tracks, sectors and clusters instead][5]. When you "move" a file within the same partition, what the operating system does is just change the entry for that file in the partition table, but it still points to the same cluster of information on the disk.

Yes! Moving is a lie! At least within the same partition that is. If you try and move a file to a different partition or a different device, `mv` is still fast, but is noticeably slower than moving stuff around within the same partition. That is because this time there is actually copying and erasing of data going on.

### Renaming

There are several distinct command line `rename` utilities around. None are fixtures like `cp` or `mv` and they can work in slightly different ways. What they all have in common is that they are used to change _parts_ of the names of files.

In Debian and Ubuntu, the default `rename` utility uses [regular expressions][6] (patterns of strings of characters) to mass change files in a directory. The instruction:
```
rename 's/\.JPEG$/.jpg/' *

```

will change all the extensions of files with the extension _JPEG_ to _jpg_. The file _IMG001.JPEG_ becomes _IMG001.jpg_ , _my_pic.JPEG_ becomes _my_pic.jpg_ , and so on.

Another version of `rename` available by default in Manjaro, a derivative of Arch, is much simpler, but arguably less powerful:
```
rename .JPEG .jpg *

```

This does the same renaming as you saw above. In this version, `.JPEG` is the string of characters you want to change, `.jpg` is what you want to change it to, and `*` represents all the files in the current directory.

The bottom line is that you are better off using `mv` if all you want to do is rename one file or directory, and that's because `mv` is realiably the same in all distributions everywhere.

### Learning more

Check out the both `mv` and `cp`'s _man_ pages to learn more. Run
```
man cp

```

or
```
man mv

```

to read about all the options these commands come with and which make them more powerful and safer to use.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/8/linux-beginners-moving-things-around

作者：[Paul Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[1]: https://www.linux.com/blog/learn/2018/5/manipulating-directories-linux
[2]: https://www.linux.com/blog/learn/intro-to-linux/2018/7/users-groups-and-other-linux-beasts-part-2
[3]: https://www.nano-editor.org/
[4]: https://www.vim.org/
[5]: https://en.wikipedia.org/wiki/Disk_sector
[6]: https://en.wikipedia.org/wiki/Regular_expression
