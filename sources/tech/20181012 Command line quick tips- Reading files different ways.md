Command line quick tips: Reading files different ways
======

![](https://fedoramagazine.org/wp-content/uploads/2018/10/commandlinequicktips-816x345.jpg)

Fedora is delightful to use as a graphical operating system. You can point and click your way through just about any task easily. But you’ve probably seen there is a powerful command line under the hood. To try it out in a shell, just open the Terminal application in your Fedora system. This article is one in a series that will show you some common command line utilities.

In this installment you’ll learn how to read files in different ways. If you open a Terminal to do some work on your system, chances are good that you’ll need to read a file or two.

### The whole enchilada

The **cat** command is well known to terminal users. When you **cat** a file, you’re simply displaying the whole file to the screen. Really what’s happening under the hood is the file is read one line at a time, then each line is written to the screen.

Imagine you have a file with one word per line, called myfile. To make this clear, the file will contain the word equivalent for a number on each line, like this:

```

    one
    two
    three
    four
    five

```

So if you **cat** that file, you’ll see this output:

```

    $ cat myfile
    one
    two
    three
    four
    five

```

Nothing too surprising there, right? But here’s an interesting twist. You can also **cat** that file backward. For this, use the **tac** command. (Note that Fedora takes no blame for this debatable humor!)

```

    $ tac myfile
    five
    four
    three
    two
    one

```

The **cat** file also lets you ornament the file in different ways, in case that’s helpful. For instance, you can number lines:

```

    $ cat -n myfile
     1 one
     2 two
     3 three
     4 four
     5 five

```

There are additional options that will show special characters and other features. To learn more, run the command **man cat** , and when done just hit **q** to exit back to the shell.

### Picking over your food

Often a file is too long to fit on a screen, and you may want to be able to go through it like a document. In that case, try the **less** command:

```

    $ less myfile

```

You can use your arrow keys as well as **PgUp/PgDn** to move around the file. Again, you can use the **q** key to quit back to the shell.

There’s actually a **more** command too, based on an older UNIX command. If it’s important to you to still see the file when you’re done, you might want to use it. The **less** command brings you back to the shell the way you left it, and clears the display of any sign of the file you looked at.

### Just the appetizer (or dessert)

Sometimes the output you want is just the beginning of a file. For instance, the file might be so long that when you **cat** the whole thing, the first few lines scroll past before you can see them. The **head** command will help you grab just those lines:

```

    $ head -n 2 myfile
    one
    two

```

In the same way, you can use **tail** to just grab the end of a file:

```

    $ tail -n 3 myfile
    three
    four
    five

```

Of course these are only a few simple commands in this area. But they’ll get you started when it comes to reading files.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/commandline-quick-tips-reading-files-different-ways/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
