[#]: collector: (lujun9972)
[#]: translator: (zero-MK)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Ampersands and File Descriptors in Bash)
[#]: via: (https://www.linux.com/blog/learn/2019/2/ampersands-and-file-descriptors-bash)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

Ampersands and File Descriptors in Bash
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ampersand-coffee.png?itok=yChaT-47)

In our quest to examine all the clutter (`&`, `|`, `;`, `>`, `<`, `{`, `[`, `(`, ), `]`, `}`, etc.) that is peppered throughout most chained Bash commands, [we have been taking a closer look at the ampersand symbol (`&`)][1].

[Last time, we saw how you can use `&` to push processes that may take a long time to complete into the background][1]. But, the &, in combination with angle brackets, can also be used to pipe output and input elsewhere.

In the [previous tutorials on][2] [angle brackets][3], you saw how to use `>` like this:

```
ls > list.txt
```

to pipe the output from `ls` to the _list.txt_ file.

Now we see that this is really shorthand for

```
ls 1> list.txt
```

And that `1`, in this context, is a file descriptor that points to the standard output (`stdout`).

In a similar fashion `2` points to standard error (`stderr`), and in the following command:

```
ls 2> error.log
```

all error messages are piped to the _error.log_ file.

To recap: `1>` is the standard output (`stdout`) and `2>` the standard error output (`stderr`).

There is a third standard file descriptor, `0<`, the standard input (`stdin`). You can see it is an input because the arrow (`<`) is pointing into the `0`, while for `1` and `2`, the arrows (`>`) are pointing outwards.

### What are the standard file descriptors good for?

If you are following this series in order, you have already used the standard output (`1>`) several times in its shorthand form: `>`.

Things like `stderr` (`2`) are also handy when, for example, you know that your command is going to throw an error, but what Bash informs you of is not useful and you don't need to see it. If you want to make a directory in your _home/_ directory, for example:

```
mkdir newdir
```

and if _newdir/_ already exists, `mkdir` will show an error. But why would you care? (Ok, there some circumstances in which you may care, but not always.) At the end of the day, _newdir_ will be there one way or another for you to fill up with stuff. You can supress the error message by pushing it into the void, which is _/dev/null_ :

```
mkdir newdir 2> /dev/null
```

This is not just a matter of " _let's not show ugly and irrelevant error messages because they are annoying,_ " as there may be circumstances in which an error message may cause a cascade of errors elsewhere. Say, for example, you want to find all the _.service_ files under _/etc_. You could do this:

```
find /etc -iname "*.service"
```

But it turns out that on most systems, many of the lines spat out by `find` show errors because a regular user does not have read access rights to some of the folders under _/etc_. It makes reading the correct output cumbersome and, if `find` is part of a larger script, it could cause the next command in line to bork.

Instead, you can do this:

```
find /etc -iname "*.service" 2> /dev/null
```

And you get only the results you are looking for.

### A Primer on File Descriptors

There are some caveats to having separate file descriptors for `stdout` and `stderr`, though. If you want to store the output in a file, doing this:

```
find /etc -iname "*.service" 1> services.txt
```

would work fine because `1>` means " _send standard output, and only standard output (NOT standard error) somewhere_ ".

But herein lies a problem: what if you *do* want to keep a record within the file of the errors along with the non-erroneous results? The instruction above won't do that because it ONLY writes the correct results from `find`, and

```
find /etc -iname "*.service" 2> services.txt
```

will ONLY write the errors.

How do we get both? Try the following command:

```
find /etc -iname "*.service" &> services.txt
```

... and say hello to `&` again!

We have been saying all along that `stdin` (`0`), `stdout` (`1`), and `stderr` (`2`) are _file descriptors_. A file descriptor is a special construct that points to a channel to a file, either for reading, or writing, or both. This comes from the old UNIX philosophy of treating everything as a file. Want to write to a device? Treat it as a file. Want to write to a socket and send data over a network? Treat it as a file. Want to read from and write to a file? Well, obviously, treat it as a file.

So, when managing where the output and errors from a command goes, treat the destination as a file. Hence, when you open them to read and write to them, they all get file descriptors.

This has interesting effects. You can, for example, pipe contents from one file descriptor to another:

```
find /etc -iname "*.service" 1> services.txt 2>&1
```

This pipes `stderr` to `stdout` and `stdout` is piped to a file, _services.txt_.

And there it is again: the `&`, signaling to Bash that `1` is the destination file descriptor.

Another thing with the standard file descriptors is that, when you pipe from one to another, the order in which you do this is a bit counterintuitive. Take the command above, for example. It looks like it has been written the wrong way around. You may be reading it like this: " _pipe the output to a file and then pipe errors to the standard output._ " It would seem the error output comes to late and is sent when `1` is already done.

But that is not how file descriptors work. A file descriptor is not a placeholder for the file, but for the _input and/or output channel_ to the file. In this case, when you do `1> services.txt`, you are saying " _open a write channel to services.txt and leave it open_ ". `1` is the name of the channel you are going to use, and it remains open until the end of the line.

If you still think it is the wrong way around, try this:

```
find /etc -iname "*.service" 2>&1 1>services.txt
```

And notice how it doesn't work; notice how errors get piped to the terminal and only the non-erroneous output (that is `stdout`) gets pushed to `services.txt`.

That is because Bash processes every result from `find` from left to right. Think about it like this: when Bash gets to `2>&1`, `stdout` (`1`) is still a channel that points to the terminal. If the result that `find` feeds Bash contains an error, it is popped into `2`, transferred to `1`, and, away it goes, off to the terminal!

Then at the end of the command, Bash sees you want to open `stdout` as a channel to the _services.txt_ file. If no error has occurred, the result goes through `1` into the file.

By contrast, in

```
find /etc -iname "*.service" 1>services.txt 2>&1
```

`1` is pointing at `services.txt` right from the beginning, so anything that pops into `2` gets piped through `1`, which is already pointing to the final resting place in `services.txt`, and that is why it works.

In any case, as mentioned above `&>` is shorthand for " _both standard output and standard error_ ", that is, `2>&1`.

This is probably all a bit much, but don't worry about it. Re-routing file descriptors here and there is commonplace in Bash command lines and scripts. And, you'll be learning more about file descriptors as we progress through this series. See you next week!

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/2/ampersands-and-file-descriptors-bash

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/learn/2019/2/and-ampersand-and-linux
[2]: https://www.linux.com/blog/learn/2019/1/understanding-angle-brackets-bash
[3]: https://www.linux.com/blog/learn/2019/1/more-about-angle-brackets-bash
