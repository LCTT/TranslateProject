[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Expand And Unexpand Commands Tutorial With Examples)
[#]: via: (https://www.ostechnix.com/expand-and-unexpand-commands-tutorial-with-examples/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Expand And Unexpand Commands Tutorial With Examples
======

![Expand And Unexpand Commands Explained][1]

This guide explains two Linux commands namely **Expand** and **Unexpand** with practical examples. For those wondering, the Expand and Unexpand commands are used to replace TAB characters in files with SPACE characters and vice versa. There is also a command called “Expand” in MS-DOS, which is used to expand a compressed file. But the Linux Expand command simply converts the tabs to spaces. These two commands are part of **GNU coreutils** and written by **David MacKenzie**.

For the demonstration purpose, I will be using a text file named “ostechnix.txt” throughout this guide. All commands given below are tested in Arch Linux.

### Expand command examples

Like I already mentioned, the Expand command replaces TAB characters in a file with SPACE characters.

Now, let us convert tabs to spaces in the ostechnix.txt file and write the result to standard output using command:

```
$ expand ostechnix.txt
```

If you don’t want to display the result in standard output, just upload it to another file like below.

```
$ expand ostechnix.txt>output.txt
```

We can also convert tabs to spaces, reading from standard input. To do so, just run “expand” command without mentioning the source file name:

```
$ expand
```

Just type the text and hit ENTER to convert tabs to spaces. Press **CTRL+C** to quit.

If you do not want to convert tabs after non blanks, use **-i** flag like below.

```
$ expand -i ostechnix.txt
```

We can also have tabs a certain number of characters apart, not 8 (the default value):

```
$ expand -t=5 ostechnix.txt
```

You can even mention multiple tab positions with comma separated like below.

```
$ expand -t 5,10,15 ostechnix.txt
```

Or,

```
$ expand -t "5 10 15" ostechnix.txt
```

For more details, refer man pages.

```
$ man expand
```

### Unexpand Command Examples

As you may have already guessed, the **Unexpand** command will do the opposite of the Expand command. I.e It will convert SPACE charatcers to TAB characters. Let me show you a few examples to learn how to use Unexpand command.

To convert blanks (spaces, of course) in a file to tabs and write the output to stdout, do:

```
$ unexpand ostechnix.txt
```

If you want to write the output in a file instead of just displaying it to stdout, use this command:

```
$ unexpand ostechnix.txt>output.txt
```

Convert blanks to tabs, reading from standard output:

```
$ unexpand
```

By default, Unexpand command will only convert the initial blanks. If you want to convert all blanks, instead of just initial blanks, use **-a** flag:

```
$ unexpand -a ostechnix.txt
```

To convert only leading sequences of blanks (Please note that it overrides **-a** ):

```
$ unexpand --first-only ostechnix.txt
```

Have tabs a certain number of characters apart, not **8** (enables **-a** ):

```
$ unexpand -t 5 ostechnix.txt
```

Similarly, we can mention multiple tab positions with comma separated like below.

```
$ unexpand -t 5,10,15 ostechnix.txt
```

Or,

```
$ unexpand -t "5 10 15" ostechnix.txt
```

For more details, refer man pages.

```
$ man unexpand
```

* * *

**Suggested read:**

  * [**The Fold Command Tutorial With Examples For Beginners**][2]



* * *

When you working on large number of files, the Expand and Unexpand commands could be very helpful to replace unwanted TAB characters with SPACE characters and vice versa.

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/expand-and-unexpand-commands-tutorial-with-examples/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/05/Expand-And-Unexpand-Commands-720x340.png
[2]: https://www.ostechnix.com/fold-command-tutorial-examples-beginners/
