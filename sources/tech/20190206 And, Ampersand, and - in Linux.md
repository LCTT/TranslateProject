[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (And, Ampersand, and & in Linux)
[#]: via: (https://www.linux.com/blog/learn/2019/2/and-ampersand-and-linux)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

And, Ampersand, and & in Linux
======
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ampersand.png?itok=7GdFO36Y)

Take a look at the tools covered in the [three][1] [previous][2] [articles][3], and you will see that understanding the glue that joins them together is as important as recognizing the tools themselves. Indeed, tools tend to be simple, and understanding what _mkdir_ , _touch_ , and _find_ do (make a new directory, update a file, and find a file in the directory tree, respectively) in isolation is easy.

But understanding what

```
mkdir test_dir 2>/dev/null || touch images.txt && find . -iname "*jpg" > backup/dir/images.txt &
```

does, and why we would write a command line like that is a whole different story.

It pays to look more closely at the sign and symbols that live between the commands. It will not only help you better understand how things work, but will also make you more proficient in chaining commands together to create compound instructions that will help you work more efficiently.

In this article and the next, we'll be looking at the the ampersand (`&`) and its close friend, the pipe (`|`), and see how they can mean different things in different contexts.

### Behind the Scenes

Let's start simple and see how you can use `&` as a way of pushing a command to the background. The instruction:

```
cp -R original/dir/ backup/dir/
```

Copies all the files and subdirectories in _original/dir/_ into _backup/dir/_. So far so simple. But if that turns out to be a lot of data, it could tie up your terminal for hours.

However, using:

```
cp -R original/dir/ backup/dir/ &
```

pushes the process to the background courtesy of the final `&`. This frees you to continue working on the same terminal or even to close the terminal and still let the process finish up. Do note, however, that if the process is asked to print stuff out to the standard output (like in the case of `echo` or `ls`), it will continue to do so, even though it is being executed in the background.

When you push a process into the background, Bash will print out a number. This number is the PID or the _Process' ID_. Every process running on your Linux system has a unique process ID and you can use this ID to pause, resume, and terminate the process it refers to. This will become useful later.

In the meantime, there are a few tools you can use to manage your processes as long as you remain in the terminal from which you launched them:

  * `jobs` shows you the processes running in your current terminal, whether be it in the background or foreground. It also shows you a number associated with each job (different from the PID) that you can use to refer to each process:

```
 $ jobs
[1]- Running cp -i -R original/dir/* backup/dir/ &
[2]+ Running find . -iname "*jpg" > backup/dir/images.txt &
```

  * `fg` brings a job from the background to the foreground so you can interact with it. You tell `fg` which process you want to bring to the foreground with a percentage symbol (`%`) followed by the number associated with the job that `jobs` gave you:

```
 $ fg %1 # brings the cp job to the foreground
cp -i -R original/dir/* backup/dir/
```

If the job was stopped (see below), `fg` will start it again.

  * You can stop a job in the foreground by holding down [Ctrl] and pressing [Z]. This doesn't abort the action, it pauses it. When you start it again with (`fg` or `bg`) it will continue from where it left off...

...Except for [`sleep`][4]: the time a `sleep` job is paused still counts once `sleep` is resumed. This is because `sleep` takes note of the clock time when it was started, not how long it was running. This means that if you run `sleep 30` and pause it for more than 30 seconds, once you resume, `sleep` will exit immediately.

  * The `bg` command pushes a job to the background and resumes it again if it was paused:

```
 $ bg %1
[1]+ cp -i -R original/dir/* backup/dir/ &
```




As mentioned above, you won't be able to use any of these commands if you close the terminal from which you launched the process or if you change to another terminal, even though the process will still continue working.

To manage background processes from another terminal you need another set of tools. For example, you can tell a process to stop from a a different terminal with the [`kill`][5] command:

```
kill -s STOP <PID>
```

And you know the PID because that is the number Bash gave you when you started the process with `&`, remember? Oh! You didn't write it down? No problem. You can get the PID of any running process with the `ps` (short for _processes_ ) command. So, using

```
ps | grep cp
```

will show you all the processes containing the string " _cp_ ", including the copying job we are using for our example. It will also show you the PID:

```
$ ps | grep cp
14444 pts/3 00:00:13 cp
```

In this case, the PID is _14444_. and it means you can stop the background copying with:

```
kill -s STOP 14444
```

Note that `STOP` here does the same thing as [Ctrl] + [Z] above, that is, it pauses the execution of the process.

To start the paused process again, you can use the `CONT` signal:

```
kill -s CONT 14444
```

There is a good list of many of [the main signals you can send a process here][6]. According to that, if you wanted to terminate the process, not just pause it, you could do this:

```
kill -s TERM 14444
```

If the process refuses to exit, you can force it with:

```
kill -s KILL 14444
```

This is a bit dangerous, but very useful if a process has gone crazy and is eating up all your resources.

In any case, if you are not sure you have the correct PID, add the `x` option to `ps`:

```
$ ps x| grep cp
14444 pts/3 D 0:14 cp -i -R original/dir/Hols_2014.mp4
  original/dir/Hols_2015.mp4 original/dir/Hols_2016.mp4
  original/dir/Hols_2017.mp4 original/dir/Hols_2018.mp4 backup/dir/
```

And you should be able to see what process you need.

Finally, there is nifty tool that combines `ps` and `grep` all into one:

```
$ pgrep cp
8
18
19
26
33
40
47
54
61
72
88
96
136
339
6680
13735
14444
```

Lists all the PIDs of processes that contain the string " _cp_ ".

In this case, it isn't very helpful, but this...

```
$ pgrep -lx cp
14444 cp
```

... is much better.

In this case, `-l` tells `pgrep` to show you the name of the process and `-x` tells `pgrep` you want an exact match for the name of the command. If you want even more details, try `pgrep -ax command`.

### Next time

Putting an `&` at the end of commands has helped us explain the rather useful concept of processes working in the background and foreground and how to manage them.

One last thing before we leave: processes running in the background are what are known as _daemons_ in UNIX/Linux parlance. So, if you had heard the term before and wondered what they were, there you go.

As usual, there are more ways to use the ampersand within a command line, many of which have nothing to do with pushing processes into the background. To see what those uses are, we'll be back next week with more on the matter.

Read more:

[Linux Tools: The Meaning of Dot][1]

[Understanding Angle Brackets in Bash][2]

[More About Angle Brackets in Bash][3]

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/2/and-ampersand-and-linux

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/learn/2019/1/linux-tools-meaning-dot
[2]: https://www.linux.com/blog/learn/2019/1/understanding-angle-brackets-bash
[3]: https://www.linux.com/blog/learn/2019/1/more-about-angle-brackets-bash
[4]: https://ss64.com/bash/sleep.html
[5]: https://bash.cyberciti.biz/guide/Sending_signal_to_Processes
[6]: https://www.computerhope.com/unix/signals.htm
