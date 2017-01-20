Translating by Hymantin
Set Date and Time for Each Command You Execute in Bash History
============================================================

By default, all commands executed by Bash on the command line are stored in history buffer or recorded in a file called ~/.bash_history. This means that a system administrator can view a list of commands executed by users on the system or a user can view his/her command history using the [history command][1] like so.

```
$ history
```
[
 ![Linux History Command](http://www.tecmint.com/wp-content/uploads/2017/01/Linux-History-Command.png) 
][2]

Linux History Command

From the output of the [history command][3] above, the date and time when a command was executed is not shown. This is the default setting on most if not all Linux distributions.

In this article, we will explain how you can configure time stamp information when each command in the Bash history was executed to be displayed.

The date and time associated with each history entry can be written to the history file, marked with the history comment character by setting the HISTTIMEFORMAT variable.

There are two possible ways of doing this: one does it temporarily while the other makes it permanent.

To set HISTTIMEFORMAT variable temporarily, export it as below on the command line:

```
$ export HISTTIMEFORMAT='%F %T'
```

In the export command above, the time stamp format:

1.  `%F` – expands to full date same, as %Y-%m-%d (year-month-date).
2.  `%T` – expands to time; same as %H:%M:%S (hour:minute:seconds).

Read through the [date command][4] man page for additional usage information:

```
$ man date
```

Then check your command history as follows:

```
$ history 
```
[
 ![Display Linux Command History with Date and Time](http://www.tecmint.com/wp-content/uploads/2017/01/Set-Date-and-Time-on-Linux-Commands-History.png) 
][5]

Display Linux Command History with Date and Time

However, if you want to configure this variable permanently, open the file `~/.bashrc` with your favorite editor:

```
$ vi ~/.bashrc
```

And add the line below in it (you mark it with a comment as your own configuration):

```
#my config
export HISTTIMEFORMAT='%F %T'
```

Save the file and exit, afterwards, run the command below to effect the changes made to the file:

```
$ source ~/.bashrc
```

That’s all! Do share with us any interesting history command tips and tricks or your thoughts about this guide via the comment section below.

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/7badddbc53297b2e8ed7011cf45df0c0?s=128&d=blank&r=g)

I am Ravi Saive, creator of TecMint. A Computer Geek and Linux Guru who loves to share tricks and tips on Internet. Most Of My Servers runs on Open Source Platform called Linux. Follow Me: Twitter, Facebook and Google+

--------------------------------------------------------------------------------

via: http://www.tecmint.com/display-linux-command-history-with-date-and-time/

作者：[Ravi Saive][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/history-command-examples/
[2]:http://www.tecmint.com/wp-content/uploads/2017/01/Linux-History-Command.png
[3]:http://www.tecmint.com/history-command-examples/
[4]:http://www.tecmint.com/sort-ls-output-by-last-modified-date-and-time/
[5]:http://www.tecmint.com/wp-content/uploads/2017/01/Set-Date-and-Time-on-Linux-Commands-History.png
