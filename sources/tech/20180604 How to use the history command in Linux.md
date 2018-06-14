translating-----geekpi

How to use the history command in Linux
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux-penguins.png?itok=yKOpaJM_)

As I spend more and more time in terminal sessions, it feels like I'm continually finding new commands that make my daily tasks more efficient. The GNU `history` command is one that really changed my work day.

The GNU `history` command keeps a list of all the other commands that have been run from that terminal session, then allows you to replay or reuse those commands instead of retyping them. If you are an old greybeard, you know about the power of `history`, but for us dabblers or new sysadmin folks, `history` is an immediate productivity gain.

### History 101

To see `history` in action, open a terminal program on your Linux installation and type:
```
$ history

```

Here's the response I got:
```
1  clear



2  ls -al



3  sudo dnf update -y



4  history

```

The `history` command shows a list of the commands entered since you started the session. The joy of `history` is that now you can replay any of them by using a command such as:
```
$ !3

```

The `!3` command at the prompt tells the shell to rerun the command on line 3 of the history list. I could also access that command by entering:
```
linuser@my_linux_box: !sudo dnf

```

`history` will search for the last command that matches the pattern you provided and run it.

### Searching history

You can also use `history` to rerun the last command you entered by typing `!!`. And, by pairing it with `grep`, you can search for commands that match a text pattern or, by using it with `tail`, you can find the last few commands you executed. For example:
```
$ history | grep dnf



3  sudo dnf update -y



5  history | grep dnf



$ history | tail -n 3



4  history



5  history | grep dnf



6  history | tail -n 3

```

Another way to get to this search functionality is by typing `Ctrl-R` to invoke a recursive search of your command history. After typing this, the prompt changes to:
```
(reverse-i-search)`':

```

Now you can start typing a command, and matching commands will be displayed for you to execute by pressing Return or Enter.

### Changing an executed command

`history` also allows you to rerun a command with different syntax. For example, if I wanted to change my previous command `history | grep dnf` to `history | grep ssh`, I can execute the following at the prompt:
```
$ ^dnf^ssh^

```

`history` will rerun the command, but replace `dnf` with `ssh`, and execute it.

### Removing history

There may come a time that you want to remove some or all the commands in your history file. If you want to delete a particular command, enter `history -d <line number>`. To clear the entire contents of the history file, execute `history -c`.

The history file is stored in a file that you can modify, as well. Bash shell users will find it in their Home directory as `.bash_history`.

### Next steps

There are a number of other things that you can do with `history`:

  * Set the size of your history buffer to a certain number of commands
  * Record the date and time for each line in history
  * Prevent certain commands from being recorded in history



For more information about the `history` command and other interesting things you can do with it, take a look at the [GNU Bash Manual][1].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/history-command

作者：[Steve Morris][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/smorris12
[1]:https://www.gnu.org/software/bash/manual/
