How to Hide Linux Command Line History by Going Incognito
================================================================

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/06/commandline-history-featured.jpg)

If you’re a Linux command line user, you’ll agree that there are times when you do not want certain commands you run to be recorded in the command line history. There could be many reasons for this. For example, you’re at a certain position in your company, and you have some privileges that you don’t want others to abuse. Or, there are some critical commands that you don’t want to run accidentally while you’re browsing the history list.

But is there a way to control what goes into the history list and what doesn’t? Or, in other words, can we turn on a web browser-like incognito mode in the Linux command line? The answer is yes, and there are many ways to achieve this, depending on what exactly you want. In this article we will discuss some of the popular solutions available.

Note: all the commands presented in this article have been tested on Ubuntu.

### Different ways available

The first two ways we’ll describe here have already been covered in [one of our previous articles][1]. If you are already aware of them, you can skip over these. However, if you aren’t aware, you’re advised to go through them carefully.

#### 1. Insert space before command

Yes, you read it correctly. Insert a space in the beginning of a command, and it will be ignored by the shell, meaning the command won’t be recorded in history. However, there’s a dependency – the said solution will only work if the HISTCONTROL environment variable is set to “ignorespace” or “ignoreboth,” which is by default in most cases.

So, a command like the following:

```
[space]echo "this is a top secret"
```

Won’t appear in the history if you’ve already done this command:

```
export HISTCONTROL = ignorespace
```

The below screenshot is an example of this behavior.

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/06/commandline-history-bash-command-space.png)

The fourth “echo” command was not recorded in the history as it was run with a space in the beginning.

#### 2. Disable the entire history for the current session

If you want to disable the entire history for a session, you can easily do that by unsetting the HISTSIZE environment variable before you start with your command line work. To unset the variable run the following command:

```
export HISTFILE=0
```

HISTFILE is the number of lines (or commands) that can be stored in the history list for an ongoing bash session. By default, this variable has a set value – for example, 1000 in my case.

So, the command mentioned above will set the environment variable’s value to zero, and consequently nothing will be stored in the history list until you close the terminal. Keep in mind that you’ll also not be able to see the previously run commands by pressing the up arrow key or running the history command.

#### 3. Erase the entire history after you’re done

This can be seen as an alternative to the solution mentioned in the previous section. The only difference is that in this case you run a command AFTER you’re done with all your work. Thh following is the command in question:

```
history -cw
```

As already mentioned, this will have the same effect as the HISTFILE solution mentioned above.

#### 4. Turn off history only for the work you do

While the solutions (2 and 3) described above do the trick, they erase the entire history, something which might be undesired in many situations. There might be cases in which you want to retain the history list up until the point you start your command line work. For situations like these you need to run the following command before starting with your work:

```
[space]set +o history
```

Note: [space] represents a blank space.

The above command will disable the history temporarily, meaning whatever you do after running this command will not be recorded in history, although all the stuff executed prior to the above command will be there as it is in the history list.

To re-enable the history, run the following command:

```
[Space]set -o history
```

This brings things back to normal again, meaning any command line work done after the above command will show up in the history.

#### 5. Delete specific commands from history

Now suppose the history list already contains some commands that you didn’t want to be recorded. What can be done in this case? It’s simple. You can go ahead and remove them. The following is how to accomplish this:

```
[space]history | grep "part of command you want to remove"
```

The above command will output a list of matching commands (that are there in the history list) with a number [num] preceding each of them.

Once you’ve identified the command you want to remove, just run the following command to remove that particular entry from the history list:

```
history -d [num]
```

The following screenshot is an example of this.

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/06/commandline-history-delete-specific-commands.png)

The second ‘echo’ command was removed successfully.

Alternatively, you can just press the up arrow key to take a walk back through the history list, and once the command of your interest appears on the terminal, just press “Ctrl + U” to totally blank the line, effectively removing it from the list.

### Conclusion

There are multiple ways in which you can manipulate the Linux command line history to suit your needs. Keep in mind, however, that it’s usually not a good practice to hide or remove a command from history, although it’s also not wrong, per se, but you should be aware of what you’re doing and what effects it might have.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/linux-command-line-history-incognito/?utm_medium=feed&utm_source=feedpress.me&utm_campaign=Feed%3A+maketecheasier

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.maketecheasier.com/author/himanshu/
[1]: https://www.maketecheasier.com/command-line-history-linux/





