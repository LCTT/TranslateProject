intermerlin Translating

What Options you use for Linux killall Command ? I have 5 Options
================================================================================
Linux command line offers various commands to kill a process. For example, the ‘kill’ command can be used to kill a process by passing its PID as an argument, the ‘pkill’ command takes a pattern as an input and all the matching running processes are killed. But there exists a command ‘killall’, which exactly matches the argument name by default, and kills the matching process. In this article, we will discuss this command with some practical examples.

![](http://linoxide.com/wp-content/uploads/2014/02/killall-command.jpg)

### Linux killall Command ###

The killall command can be used to send a signal to a particular process. The signal can be specified as an argument to this command or else SIGTERM is sent by default.

Lets discuss the usage of this command through some practical examples.

#### 1. A basic example ####

In this example, we will show how killall command can be used to kill a particular process. Suppose, there are two processes that have same initial characters :

    $ ps -aef | grep “test”
    himanshu 3969 2811 0 14:14 pts/0 00:00:00 ./test
    himanshu 3970 2811 0 14:14 pts/0 00:00:00 ./test_again

Now, here is how you can use the killall command to kill ‘test_again’ :

    $ killall test_again
    [2]+ Terminated ./test_again

As you can see, the ‘killall’ command terminated the ‘test_again’ process. This can also be confirmed through the ps command :

    $ ps -aef | grep “test”
    himanshu 3969 2811 0 14:14 pts/0 00:00:00 ./test

Observe that ‘test_again’ is not displayed in the output as it is killed.

#### 2. Ignore case using -I option ####

The killall command is case-sensitive by default. Here is an example :

    $ ps -aef | grep “test”
    himanshu 4177 3161 0 14:54 pts/3 00:00:00 ./test
    himanshu 4178 3161 0 14:54 pts/3 00:00:00 ./test_again
    himanshu 4180 3161 0 14:54 pts/3 00:00:00 grep --color=auto test

    $ killall TEST
    TEST: no process found

So you can see that the killall command could not find any process named TEST, while a process named ‘test’ is already running.

To make sure that the killall command ignores the case, use the -I option. Here is an example :

    $ killall -I TEST
    [1]- Terminated ./test

Observe that now it successfully terminated the ‘test’ process.

#### 3. Kill processes interactively using -i option ####

The killall command can be used to kill more than process.

    $ killall test test_again
    [2]- Terminated ./test_again
    [3]+ Terminated ./test

But, if you want killall to terminate processes interactively, you can use the -i option.

Here is an example :

    $ killall -i test test_again
    Kill test(4201) ? (y/N) y
    Kill test_again(4202) ? (y/N) y
    [1]- Terminated ./test
    [2]+ Terminated ./test_again

So you can see that this way user can control the termination of processes using killall command.

#### 4. Disable details if no processes were killed using -q option ####

Sometimes when killall is not able to find a specified process, it complains about the same in the output.

Here is an example :

    $ killall TEST
    TEST: no process found

But, in case you want killall to carry out its work quietly, you can use the -q option :

    $ killall -q TEST
    $

So you can see that when -q was used, the output was suppressed.

#### 5. List all the supported signals in output using -l option ####

As already described in the beginning, killall sends signals to processes. You can use the -s option (followed by the signal name) to send a particular signal to a process.

To know, what all signals this command can send, use the -l option.

    $ killall -l
    HUP INT QUIT ILL TRAP ABRT IOT BUS FPE KILL USR1 SEGV USR2 PIPE ALRM TERM
    STKFLT CHLD CONT STOP TSTP TTIN TTOU URG XCPU XFSZ VTALRM PROF WINCH IO PWR SYS
    UNUSED

So killall supports all these signals.

### Something to discuss ###

The man page of the killall command says that by default, it matches complete names only if they are less than or equal to 15 characters in length.

For example, suppose there are following two processes with long names :

    $ ps -aef | grep “test”
    himanshu 4021 3161 0 14:27 pts/3 00:00:00 ./test_abcdefghij
    himanshu 4035 3161 0 14:27 pts/3 00:00:00 ./test_abcdefgh

The first process in the output above has exactly 15 characters in name. Lets try to kill it using the killall command :

    $ killall test_abcdefghij
    [1]- Terminated ./test_abcdefghij

So you can see that the killall command kills the process successfully.

Now, according to the man page, if both the names would have had more than 15 matching characters, killall would have killed both the processes. Here is an example :

    $ ps -aef | grep “test”
    himanshu 4114 3161 0 14:40 pts/3 00:00:00 ./test_abcdefghijklmnopqrstuvwx
    himanshu 4141 3161 0 14:46 pts/3 00:00:00 ./test_abcdefghijklmnopqrstuvwxyz
    himanshu 4143 3161 0 14:46 pts/3 00:00:00 grep --color=auto test

Observe that both the processes now have more than 15 matching characters in their name. Now, when I tried to kill the second process using killall :

    $ killall test_abcdefghijklmnopqrstuvwxyz
    [6]+ Terminated ./test_abcdefghijklmnopqrstuvwxyz

It killed only the specified process, and not the other one.

    $ ps -aef | grep “test”
    himanshu 4114 3161 0 14:40 pts/3 00:00:00 ./test_abcdefghijklmnopqrstuvwx
    himanshu 4146 3161 0 14:47 pts/3 00:00:00 grep --color=auto test

I am not sure if there is something incorrect on my side, or it is a bug in killall command. I’d appreciate if you put forward your views on this in comments.

BTW, here are the details of killall command on my system :

    $ killall --version
    killall (PSmisc) 22.20
    Copyright (C) 1993-2012 Werner Almesberger and Craig Small

    PSmisc comes with ABSOLUTELY NO WARRANTY.
    This is free software, and you are welcome to redistribute it under
    the terms of the GNU General Public License.
    For more information about these matters, see the files named COPYING.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-killall-my-options/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
