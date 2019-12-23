[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Command line quick tips: Using pipes to connect tools)
[#]: via: (https://fedoramagazine.org/command-line-quick-tips-using-pipes-to-connect-tools/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

Command line quick tips: Using pipes to connect tools
======

![][1]

One of the most powerful concepts of Linux is carried on from its predecessor, UNIX. Your Fedora system has a bunch of useful, single-purpose utilities available for all sorts of simple operations. Like building blocks, you can attach them in creative and complex ways. _Pipes_ are key to this concept.

Before you hear about pipes, though, it’s helpful to know the basic concept of input and output. Many utilities in your Fedora system can operate against files. But they can often take input not stored on a disk. You can think of input flowing freely into a process such as a utility as its _standard input_ (also sometimes called _stdin_).

Similarly, a tool or process can display information to the screen by default. This is often because its default output is connected to the terminal. You can think of the free-flowing output of a process as its _standard output_ (or _stdout_ — go figure!).

### Examples of standard input and output

Often when you run a tool, it outputs to the terminal. Take for instance this simple sequence command using the _seq_ tool:

```
$ seq 1 6
1
2
3
4
5
6
```

The output, which is simply to count integers up from 1 to 6, one number per line, comes to the screen. But you could also send it to a file using the **&gt;** character. The shell interpreter uses this character to mean “redirect _standard output_ to a file whose name follows.” So as you can guess, this command puts the output into a file called _six.txt:_

```
$ seq 1 6 > six.txt
```

Notice nothing comes to the screen. You’ve sent the ouptut into a file instead. If you run the command _cat six.txt_ you can verify that.

You probably remember the simple use of the _grep_ command [from a previous article][2]. You could ask _grep_ to search for a pattern in a file by simply declaring the file name. But that’s simply a convenience feature in _grep_. Technically it’s built to take _standard input_, and search that.

The shell uses the **&lt;** character similarly to mean “redirect _standard input_ from a file whose name follows.” So you could just as well search for the number **4** in the file _six.txt_ this way:

```
$ grep 4 < six.txt
4
```

Of course the output here is, by default, the content of any line with a match. So _grep_ finds the digit **4** in the file and outputs that line to _standard output_.

### Introducing pipes

Now imagine: what if you took the standard output of one tool, and instead of sending it to the terminal, you sent it into another tool’s standard input? This is the essence of the pipe.

Your shell uses the vertical bar character **|** to represent a pipe between two commands. You can find it on most keyboard above the backslash **\** character. It’s used like this:

```
$ command1 | command2
```

For most simple utilities, you wouldn’t use an output filename option on _command1_, nor an input file option on _command2_. (You might use other options, though.) Instead of using files, you’re sending the output of _command1_ directly into _command2_. You can use as many pipes in a row as needed, creating complex pipelines of several commands in a row.

This (relatively useless) example combines the commands above:

```
$ seq 1 6 | grep 4
4
```

What happened here? The _seq_ command outputs the integers 1 through 6, one line at a time. The _grep_ command processes that output line by line, searching for a match on the digit **4**, and outputs any matching line.

Here’s a slightly more useful example. Let’s say you want to find out if TCP port 22, the _ssh_ port, is open on your system. You could find this out using the _ss_ command* by looking through its copious output. Or you could figure out its filter language and use that. Or you could use pipes. For example, pipe it through _grep_ looking for the _ssh_ port label:

```
$ ss -tl | grep ssh
LISTEN  0    128     0.0.0.0:ssh       0.0.0.0:*
LISTEN  0    128     [::]:ssh          [::]:*
```

_* Those readers familiar with the venerable_ netstat _command may note it is mostly obsolete, as stated in its [man page][3]._

That’s a lot easier than reading through many lines of output. And of course, you can combine redirectors and pipes, for instance:

```
$ ss -tl | grep ssh > ssh-listening.txt
```

This is barely scratching the surface of pipes. Let your imagination run wild. Have fun piping!

* * *

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/command-line-quick-tips-using-pipes-to-connect-tools/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/10/commandlinequicktips-816x345.jpg
[2]: https://fedoramagazine.org/command-line-quick-tips-searching-with-grep/
[3]: https://linux.die.net/man/8/netstat
