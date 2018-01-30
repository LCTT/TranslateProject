Linux kill Command Tutorial for Beginners (5 Examples)
======

Sometimes, while working on a Linux machine, you'll see that an application or a command line process gets stuck (becomes unresponsive). Then in those cases, terminating it is the only way out. Linux command line offers a utility that you can use in these scenarios. It's called **kill**.

In this tutorial, we will discuss the basics of kill using some easy to understand examples. But before we do that, it's worth mentioning that all examples in the article have been tested on an Ubuntu 16.04 machine.

#### Linux kill command

The kill command is usually used to kill a process. Internally it sends a signal, and depending on what you want to do, there are different signals that you can send using this tool. Following is the command's syntax:

```
kill [options] <pid> [...]
```

And here's how the tool's man page describes it:
```
The default signal for kill is TERM. Use -l or -L to list available signals. Particularly useful
signals include HUP, INT, KILL, STOP, CONT, and 0. Alternate signals may be specified in three ways:
-9, -SIGKILL or -KILL. Negative PID values may be used to choose whole process groups; see the PGID
column in ps command output.  A PID of -1 is special; it indicates all processes except the kill
process  itself and init.
```

The following Q&A-styled examples should give you a better idea of how the kill command works.

#### Q1. How to terminate a process using kill command?

This is very easy - all you need to do is to get the pid of the process you want to kill, and then pass it to the kill command.

```
kill [pid]
```

For example, I wanted to kill the 'gthumb' process on my system. So i first used the ps command to fetch the application's pid, and then passed it to the kill command to terminate it. Here's the screenshot showing all this:

[![How to terminate a process using kill command][1]][2]

#### Q2. How to send a custom signal?

As already mentioned in the introduction section, TERM is the default signal that kill sends to the application/process in question. However, if you want, you can send any other signal that kill supports using the **-s** command line option.

```
kill -s [signal] [pid]
```

For example, if a process isn't responding to the TERM signal (which allows the process to do final cleanup before quitting), you can go for the KILL signal (which doesn't let process do any cleanup). Following is the command you need to run in that case.

```
kill -s KILL [pid]
```

#### Q3. What all signals you can send using kill?

Of course, the next logical question that'll come to your mind is how to know which all signals you can send using kill. Well, thankfully, there exists a command line option **-l** that lists all supported signals.

```
kill -l
```

Following is the output the above command produced on our system:

[![What all signals you can send using kill][3]][4]

#### Q4. What are the other ways in which signal can be sent?

In one of the previous examples, we told you if you want to send the KILL signal, you can do it in the following way:

```
kill -s KILL [pid]
```

However, there are a couple of other alternatives as well:

```
kill -s SIGKILL [pid]

kill -s 9 [pid]
```

The corresponding number can be known using the -l option we've already discussed in the previous example.

#### Q5. How to kill all running process in one go?

In case a user wants to kill all processes that they can (this depends on their privilege level), then instead of specifying a large number of process IDs, they can simply pass the -1 option to kill.

For example:

```
kill -s KILL -1
```

#### Conclusion

The kill command is pretty straightforward to understand and use. There's a slight learning curve in terms of the list of signal options it offers, but as we explained in here, there's an option to take a quick look at that list as well. Just practice whatever we've discussed and you should be good to go. For more information, head to the tool's [man page][5].


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-kill-command/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/kill-default.png
[2]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/kill-default.png
[3]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/kill-l-option.png
[4]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/kill-l-option.png
[5]:https://linux.die.net/man/1/kill
