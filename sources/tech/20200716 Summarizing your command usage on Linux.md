[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Summarizing your command usage on Linux)
[#]: via: (https://www.networkworld.com/article/3567050/summarizing-your-command-usage-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Summarizing your command usage on Linux
======
With a modest string of commands, you can get a quick look at what commands you're using on your Linux system and how often.
Getty Images

Getting a summary of the commands you use on a Linux system requires only a relatively modest string of commands along with a couple pipes to tie them all together. When your history buffer preserves the most recent 1,000 or 2,000 commands, summarizing command activity can get rather tedious. This post provides a handy way to summarize command usage and highlight those commands used most frequently.

To start, keep in mind that a typical entry in a command history might look like this. Note that command is displayed after the command sequence number and followed by its arguments.

```
91  sudo apt-get install ccrypt
     ^
     +-- command
```

Note that the history command, adhering to the HISTSIZE setting, will determine how many commands will be preserved. This could be 500, 1,000 or more. If you don't like how many commands are preserved for you, you can add or change the HISTSIZE setting in your .bashrc or other start-up file.

```
$ echo $HISTSIZE
1000
$ history | wc -l
1000
$ grep HISTSIZE ~/.bashrc
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
```

One of the primary benefits of remembering a significant number of commands is that it makes it easy for you to rerun commands you've used in the past without having to retype or remember them. It also allows you to easily review how far you've moved through some series of tasks that you might be working on. When you use the **history** command by itself, you'll see something like this with your oldest commands listed first:

```
$ history
    7  vi tasks
    8  alias
    9  echo $HISTTIMEFORMAT
   10  history
   11  date
   …
```

Viewing the most recent commands requires looking at the bottom of the recorded commands:

```
$ history | tail -4
 1007  echo $HISTSIZE
 1008  history | wc -l
 1009  history
 1010  history | tail -4
```

Alternately, you could use the **tail** command to view the bottom of your **.bash_history** file, but the numbers shown by the **history** command allow you to rerun the commands by typing things like **!1010** and are generally more useful.

To prepare a summary of the commands used (such as **vi** and **echo**), you can start by using **awk** to separate that information from the rest of each command saved in our history:

```
$ history | awk '{print $2}'
vi
alias
echo
history
date
…
```

If you then pass the list of commands in your history to the **sort** command to group the commands in alphabetical order, you'll get something like this:

```
$ history | awk '{print $2}' | sort
7z
7z
alias
apropos
cd
cd
…
```

Next, passing the output of that **sort** command to **uniq -c** will count how many of each command were used.

```
$ history | awk '{print $2}' | sort | uniq -c
      2 7z
      1 alias
      2 apropos
     38 cd
     21 chmod
…
```

Last, adding a second **sort** command to sort the command group counts in reverse numeric order will list your most heavily used commands first.

```
$ history | awk '{print $2}' | sort | uniq -c | sort -nr
    178 ls
     95 vi
     63 cd
     53 sudo
     41 more
…
```

This gives you an idea which commands you use the most, but won't include any commands that you may be intentionally omitting from your history file with a setting like this one:

```
HISTIGNORE="pwd:clear:man:history"
```

### When history changes

For the default history format, the first field in **history** command output will be the sequence number for each command, and the second will be the command that was used. For this reason, all of the **awk** commands shown above were set to display **$2**.

```
$ alias cmds='history | awk '\''{print $2}'\'' | sort | uniq -c | sort -nr'
```

If you've modified the format of your history entries with a setting like the one shown below that adds date and time settings to your command history, you will also have to modify the alias that you're setting up.

```
$ echo $HISTTIMEFORMAT
%d/%m/%y %T
```

This date/time information can be very helpful at times, but means that you have to pick out the 4th field instead of the 2nd in your command history to summarize your command usage because your history entries will look like this:

```
91  05/07/20 16:37:39 sudo apt-get install ccrypt
                       ^
                       +-- command
```

The alias for examining your command history would, therefore, look like this instead after changing the $2 to $4.

```
$ alias cmds='history | awk '\''{print $4}'\'' | sort | uniq -c | sort -nr'
```

To store either alias in your **.bashrc** or other startup file, make sure you insert a backslash in front of the **$** sign so that bash doesn't try to interpret **$4**.

```
alias cmds='history | awk '\''{print \$2}'\'' | uniq -c | sort -nr'
alias cmds='history | awk '\''{print \$4}'\'' | uniq -c | sort -nr'
```

Note that the date and time information is stored on separate lines in your history file from the command themselves. So, when this information is added, the bash history file will have twice as many lines, though your history command output will not:

```
$ wc -l .bash_history
2000 .bash_history
$ history | wc -l
1000
```

### Wrap-up

You can always decide how much command history you want to preserve and what commands are not worth recording to make your command summaries most useful.

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3567050/summarizing-your-command-usage-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world
