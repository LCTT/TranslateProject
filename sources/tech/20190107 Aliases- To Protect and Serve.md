[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Aliases: To Protect and Serve)
[#]: via: (https://www.linux.com/blog/learn/2019/1/aliases-protect-and-serve)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

Aliases: To Protect and Serve
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/prairie-path_1920.jpg?itok=wRARsM7p)

Happy 2019! Here in the new year, we’re continuing our series on aliases. By now, you’ve probably read our [first article on aliases][1], and it should be quite clear how they are the easiest way to save yourself a lot of trouble. You already saw, for example, that they helped with muscle-memory, but let's see several other cases in which aliases come in handy.

### Aliases as Shortcuts

One of the most beautiful things about Linux's shells is how you can use zillions of options and chain commands together to carry out really sophisticated operations in one fell swoop. All right, maybe beauty is in the eye of the beholder, but let's agree that this feature published practical.

The downside is that you often come up with recipes that are often hard to remember or cumbersome to type. Say space on your hard disk is at a premium and you want to do some New Year's cleaning. Your first step may be to look for stuff to get rid off in you home directory. One criteria you could apply is to look for stuff you don't use anymore. `ls` can help with that:

```
ls -lct
```

The instruction above shows the details of each file and directory (`-l`) and also shows when each item was last accessed (`-c`). It then orders the list from most recently accessed to least recently accessed (`-t`).

Is this hard to remember? You probably don’t use the `-c` and `-t` options every day, so perhaps. In any case, defining an alias like

```
alias lt='ls -lct'
```

will make it easier.

Then again, you may want to have the list show the oldest files first:

```
alias lo='lt -F | tac'
```

![aliases][3]

Figure 1: The lt and lo aliases in action.

[Used with permission][4]

There are a few interesting things going here. First, we are using an alias (`lt`) to create another alias -- which is perfectly okay. Second, we are passing a new parameter to `lt` (which, in turn gets passed to `ls` through the definition of the `lt` alias).

The `-F` option appends special symbols to the names of items to better differentiate regular files (that get no symbol) from executable files (that get an `*`), files from directories (end in `/`), and all of the above from links, symbolic and otherwise (that end in an `@` symbol). The `-F` option is throwback to the days when terminals where monochrome and there was no other way to easily see the difference between items. You use it here because, when you pipe the output from `lt` through to `tac` you lose the colors from `ls`.

The third thing to pay attention to is the use of piping. Piping happens when you pass the output from an instruction to another instruction. The second instruction can then use that output as its own input. In many shells (including Bash), you pipe something using the pipe symbol (`|`).

In this case, you are piping the output from `lt -F` into `tac`. `tac`'s name is a bit of a joke. You may have heard of `cat`, the instruction that was nominally created to con _cat_ enate files together, but that in practice is used to print out the contents of a file to the terminal. `tac` does the same, but prints out the contents it receives in reverse order. Get it? `cat` and `tac`. Developers, you so funny!

The thing is both `cat` and `tac` can also print out stuff piped over from another instruction, in this case, a list of files ordered chronologically.

So... after that digression, what comes out of the other end is the list of files and directories of the current directory in inverse order of freshness.

The final thing you have to bear in mind is that, while `lt` will work the current directory and any other directory...

```
# This will work:
lt
# And so will this:
lt /some/other/directory
```

... `lo` will only work with the current directory:

```
# This will work:
lo
# But this won't:
lo /some/other/directory
```

This is because Bash expands aliases into their components. When you type this:

```
lt /some/other/directory
```

Bash REALLY runs this:

```
ls -lct /some/other/directory
```

which is a valid Bash command.

However, if you type this:

```
lo /some/other/directory
```

Bash tries to run this:

```
ls -lct -F | tac /some/other/directory
```

which is not a valid instruction, because `tac` mainly because _/some/other/directory_ is a directory, and `cat` and `tac` don't do directories.

### More Alias Shortcuts

  * `alias lll='ls -R'` prints out the contents of a directory and then drills down and prints out the contents of its subdirectories and the subdirectories of the subdirectories, and so on and so forth. It is a way of seeing everything you have under a directory.

  * `mkdir='mkdir -pv'` let's you make directories within directories all in one go. With the base form of `mkdir`, to make a new directory containing a subdirectory you have to do this:

```
 mkdir newdir
mkdir newdir/subdir
```

Or this:

```
mkdir -p newdir/subdir
```

while with the alias you would only have to do this:

```
mkdir newdir/subdir
```

Your new `mkdir` will also tell you what it is doing while is creating new directories.




### Aliases as Safeguards

The other thing aliases are good for is as safeguards against erasing or overwriting your files accidentally. At this stage you have probably heard the legendary story about the new Linux user who ran:

```
rm -rf /
```

as root, and nuked the whole system. Then there's the user who decided that:

```
rm -rf /some/directory/ *
```

was a good idea and erased the complete contents of their home directory. Notice how easy it is to overlook that space separating the directory path and the `*`.

Both things can be avoided with the `alias rm='rm -i'` alias. The `-i` option makes `rm` ask the user whether that is what they really want to do and gives you a second chance before wreaking havoc in your file system.

The same goes for `cp`, which can overwrite a file without telling you anything. Create an alias like `alias cp='cp -i'` and stay safe!

### Next Time

We are moving more and more into scripting territory. Next time, we'll take the next logical step and see how combining instructions on the command line gives you really interesting and sophisticated solutions to everyday admin problems.


--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/1/aliases-protect-and-serve

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/learn/2019/1/aliases-protect-and-serve
[2]: https://www.linux.com/files/images/fig01png-0
[3]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig01_0.png?itok=crqTm_va (aliases)
[4]: https://www.linux.com/licenses/category/used-permission
