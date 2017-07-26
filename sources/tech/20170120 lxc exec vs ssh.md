lxc exec vs ssh
============================================================


Recently, I’ve implemented several improvements for `lxc exec`. In case you didn’t know, `lxc exec` is [LXD][1]‘s client tool that uses the [LXD][2] [client api][3] to talk to the LXD daemon and execute any program the user might want. Here is a small example of what you can do with it:

 [![asciicast](https://asciinema.org/a/100035.png)][4] 

One of our main goals is to make `lxc exec` feel as similar to `ssh` as possible since this is the standard of running commands interactively or non-interactively remotely. Making `lxc exec` behave nicely was tricky.

### 1\. Handling background tasks

A long-standing problem was certainly how to correctly handle background tasks. Here’s an asciinema illustration of the problem with a pre [LXD][5] 2.7 instance:

 [![asciicast](https://asciinema.org/a/100040.png)][6] 

What you can see there is that putting a task in the background will lead to `lxc exec` not being able to exit. A lot of sequences of commands can trigger this problem:

```
chb@conventiont|~
> lxc exec zest1 bash
root@zest1:~# yes &
y
y
y
.
.
.
```

Nothing would save you now. `yes` will simply write to `stdout` till the end of time as quickly as it can…
The root of the problem lies with `stdout` being kept open which is necessary to ensure that any data written by the process the user has started is actually read and sent back over the websocket connection we established.
As you can imagine this becomes a major annoyance when you e.g. run a shell session in which you want to run a process in the background and then quickly want to exit. Sorry, you are out of luck. Well, you were.
The first, and naive approach is obviously to simply close `stdout` as soon as you detect that the foreground program (e.g. the shell) has exited. Not quite as good as an idea as one might think… The problem becomes obvious when you then run quickly executing programs like:

```
lxc exec -- ls -al /usr/lib
```

where the `lxc exec` process (and the associated `forkexec` process (Don’t worry about it now. Just remember that `Go` + `setns()` are not on speaking terms…)) exits before all  _buffered_  data in `stdout` was read. In this case you will cause truncated output and no one wants that. After a few approaches to the problem that involved, disabling pty buffering (Wasn’t pretty I tell you that and also didn’t work predictably.) and other weird ideas I managed to solve this by employing a few `poll()` “tricks” (In some sense of the word “trick”.). Now you can finally run background tasks and cleanly exit. To wit:
 [![asciicast](https://asciinema.org/a/100043.png)][7] 

### 2\. Reporting exit codes caused by signals

`ssh` is a wonderful tool. One thing however, I never really liked was the fact that when the command that was run by ssh received a signal `ssh` would always report `-1` aka exit code `255`. This is annoying when you’d like to have information about what signal caused the program to terminate. This is why I recently implemented the standard shell convention of reporting any signal-caused exits using the standard convention `128 + n` where `n` is defined as the signal number that caused the executing program to exit. For example, on `SIGKILL` you would see `128 + SIGKILL = 137` (Calculating the exit codes for other deadly signals is left as an exercise to the reader.). So you can do:

```
chb@conventiont|~
> lxc exec zest1 sleep 100
```


Now, send `SIGKILL` to the executing program (Not to `lxc exec` itself, as `SIGKILL`is not forwardable.):

```
kill -KILL $(pidof sleep 100)
```

and finally retrieve the exit code for your program:

```
chb@conventiont|~
> echo $?
137
```

Voila. This obviously only works nicely when a) the exit code doesn’t breach the `8`-bit wall-of-computing and b) when the executing program doesn’t use `137` to indicate success (Which would be… interesting(?).). Both arguments don’t seem too convincing to me. The former because most deadly signals  _should_  not breach the range. The latter because (i) that’s the users problem, (ii) these exit codes are actually reserved (I  _think_ .), (iii) you’d have the same problem running the program locally or otherwise.
The main advantage I see in this is the ability to report back fine-grained exit statuses for executing programs. Note, by no means can we report back  _all_ instances where the executing program was killed by a signal, e.g. when your program handles `SIGTERM` and exits cleanly there’s no easy way for [LXD][8] to detect this and report back that this program was killed by signal. You will simply receive success aka exit code `0`.

### 3\. Forwarding signals

This is probably the least interesting (or maybe it isn’t, no idea) but I found it quite useful. As you saw in the `SIGKILL` case before, I was explicit in pointing out that one must send `SIGKILL` to the executing program not to the `lxc exec`command itself. This is due to the fact that `SIGKILL` cannot be handled in a program. The only thing the program can do is die… like right now… this instance… sofort… (You get the idea…). But a lot of other signals `SIGTERM`, `SIGHUP`, and of course `SIGUSR1` and `SIGUSR2` can be handled. So when you send signals that can be handled to `lxc exec` instead of the executing program, newer versions of [LXD][9] will forward the signal to the executing process. This is pretty convenient in scripts and so on.

In any case, I hope you found this little `lxc exec` post/rant useful. Enjoy [LXD][10]it’s a crazy beautiful beast to play with. Give it a try online [https://linuxcontainers.org/lxd/try-it/][11] and for all you developers out there: Checkout [https://github.com/lxc/lxd][12] and send us patches. 


 We don’t require any `CLA` to be signed, we simply follow the kernel style of requiring a `Signed-off-by` line.

--------------------------------------------------------------------------------

via: https://cbrauner.wordpress.com/2017/01/20/lxc-exec-vs-ssh/

作者：[brauner][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://cbrauner.wordpress.com
[1]:https://github.com/lxc/lxd
[2]:https://github.com/lxc/lxd
[3]:https://github.com/lxc/lxd/blob/master/client.go
[4]:https://asciinema.org/a/100035?autoplay=1
[5]:https://github.com/lxc/lxd
[6]:https://asciinema.org/a/100040?autoplay=1
[7]:https://asciinema.org/a/100043?autoplay=1
[8]:https://github.com/lxc/lxd
[9]:https://github.com/lxc/lxd
[10]:https://github.com/lxc/lxd
[11]:https://linuxcontainers.org/lxd/try-it/
[12]:https://github.com/lxc/lxd
