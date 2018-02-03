#Being translated by YPBlib
======

Why you should use named pipes on Linux
======

![](https://images.techhive.com/images/article/2017/05/blue-1845806_1280-100722976-large.jpg)

Just about every Linux user is familiar with the process of piping data from one process to another using | signs. It provides an easy way to send output from one command to another and end up with only the data you want to see without having to write scripts to do all of the selecting and reformatting.

There is another type of pipe, however, one that warrants the name "pipe" but has a very different personality. It's one that you may have never tried or even thought about -- the named pipe.

 **Also read:[11 pointless but awesome Linux terminal tricks][1]**

One of the key differences between regular pipes and named pipes is that named pipes have a presense in the file system. That is, they show up as files. But unlike most files, they never appear to have contents. Even if you write a lot of data to a named pipe, the file appears to be empty.

### How to set up a named pipe on Linux

Before we look at one of these empty named pipes, let's step back and see how a named pipe is set up. You would use a command called **mkfifo**. Why the reference to "FIFO"? Because a named pipe is also known as a FIFO special file. The term "FIFO" refers to its first-in, first-out character. If you fill a dish with ice cream and then start eating it, you'd be doing a LIFO (last-in, first-out) maneuver. If you suck a milkshake through a straw, you'd be doing a FIFO one. So, here's an example of creating a named pipe.
```
$ mkfifo mypipe
$ ls -l mypipe
prw-r-----. 1 shs staff 0 Jan 31 13:59 mypipe

```

Notice the special file type designation of "p" and the file length of zero. You can write to a named pipe by redirecting output to it and the length will still be zero.
```
$ echo "Can you read this?" > mypipe
$ ls -l mypipe
prw-r-----. 1 shs staff 0 Jan 31 13:59 mypipe

```

So far, so good, but hit return and nothing much happens.
```
$ echo "Can you read this?" > mypipe


```

While it might not be obvious, your text has entered into the pipe, but you're still peeking into the _input_ end of it. You or someone else may be sitting at the _output_ end and be ready to read the data that's being poured into the pipe, now waiting for it to be read.
```
$ cat mypipe
Can you read this?

```

Once read, the contents of the pipe are gone.

Another way to see how a named pipe works is to perform both operations (pouring the data into the pipe and retrieving it at the other end) yourself by putting the pouring part into the background.
```
$ echo "Can you read this?" > mypipe &
[1] 79302
$ cat mypipe
Can you read this?
[1]+ Done echo "Can you read this?" > mypipe

```

Once the pipe has been read or "drained," it's empty, though it still will be visible as an empty file ready to be used again. Of course, this brings us to the "why bother?" stage.

### Why use named pipes?

Named pipes are used infrequently for a good reason. On Unix systems, there are almost always many ways to do pretty much the same thing. There are many ways to write to a file, read from a file, and empty a file, though named pipes have a certain efficiency going for them.

For one thing, named pipe content resides in memory rather than being written to disk. It is passed only when both ends of the pipe have been opened. And you can write to a pipe multiple times before it is opened at the other end and read. By using named pipes, you can establish a process in which one process writes to a pipe and another reads from a pipe without much concern about trying to time or carefully orchestrate their interaction.

You can set up a process that simply waits for data to appear at the output end of the pipe and then works with it when it does. In the command below, we use the tail command to wait for data to appear.
```
$ tail -f mypipe

```

Once the process that will be feeding the pipe has finished, we will see some output.
```
$ tail -f mypipe
Uranus replicated to WCDC7
Saturn replicated to WCDC8
Pluto replicated to WCDC9
Server replication operation completed

```

If you look at the process writing to a named pipe, you might be surprised by how little resources it uses. In the ps output below, the only significant resource use is virtual memory (the VSZ column).
```
ps u -P 80038
USER PID %CPU %MEM VSZ RSS TTY STAT START TIME COMMAND
shs 80038 0.0 0.0 108488 764 pts/4 S 15:25 0:00 -bash

```

Named pipes are different enough from the more commonly used Unix/Linux pipes to warrant a different name, but "pipe" really invokes a good image of how they move data between processes, so "named pipe" fits pretty well. Maybe you'll come across a task that will benefit significantly from this very clever Unix/Linux feature.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3251853/linux/why-use-named-pipes-on-linux.html

作者：[Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:http://www.networkworld.com/article/2926630/linux/11-pointless-but-awesome-linux-terminal-tricks.html#tk.nww-fsb
