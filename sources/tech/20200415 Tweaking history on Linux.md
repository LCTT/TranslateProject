[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tweaking history on Linux)
[#]: via: (https://www.networkworld.com/article/3537214/tweaking-history-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Tweaking history on Linux
======
The bash shell's history command in Linux makes it easy to review and reuse commands, but there's a lot you do to control how much it remembers and how much forgets.
[Claudio Testa][1] [(CC0)][2]

The bash **history** command on Linux systems helps with remembering commands you’ve previously run and repeating those commands without having to retype them.

You could decide, however, that you’d be just as happy to forget that you referenced a dozen man pages, listed your files every 10 minutes or viewed previously run commands by typing “history”. In this post, we’re going to look at how you can get the history command to remember just what you want it to remember and forget commands that are likely to be of little "historic value".

### Viewing your command history

To view previously run commands, you simply type “history”. You’ll probably see a long list of commands. The number of commands remembered depends on an environment variable called **$HISTSIZE** that is set up in your **~/.bashrc** file, but there’s nothing stopping you from changing this setting if you want to save more or fewer commands.

To view history, use the **history** command:

```
$ history
209 uname -v
210 date
211 man chage
...
```

To see the maximum number of commands that will be displayed:

```
$ echo $HISTSIZE
500
```

You can change **$HISTSIZE** and make the change permanent by running commands like these:

```
$ export HISTSIZE=1000
$ echo “HISTSIZE=1000” >> ~/.bashrc
```

There’s also a difference between how much history is preserved for you and how much is displayed when you type “history”. The **$HISTSIZE** variable controls how much history is displayed while the **$HISTFILESIZE** variable controls how many commands are retained in your **.bash_history** file.

[][3]

```
$ echo $HISTSIZE
1000
$ echo $HISTFILESIZE
2000
```

You can verify the second variable by counting the lines in your history file:

```
$ wc -l .bash_history
2000 .bash_history
```

One thing to keep in mind is that commands that you enter during a login session aren’t added to your **.bash_history** file until you log off, even though they show up in the **history** command output right away.

### Using history

There are three ways to reissue commands that you find in your history. The simplest way, especially if the command you want to reuse was run recently, is often to type a ! followed by enough of the first letters in the command's name to uniquely identify it.

```
$ !u
uname -v
#37-Ubuntu SMP Thu Mar 26 20:41:27 UTC 2020
```

Another easy way to repeat a command is to simply press your up-arrow key until the command is displayed and then press enter.

Alternately, if you run the history command and see the command you want to rerun listed, you can type an ! followed by the sequence number shown to the left of the command.

```
$ !209
uname -v
#37-Ubuntu SMP Thu Mar 26 20:41:27 UTC 2020
```

### Hiding history

If you want to stop recording commands for some period of time, you can use this command:

```
$ set +o history
```

Commands will not show up when you type "history" nor will they be added to your **.bash_history** file when you exit the session by logging off or exiting the terminal.

To reverse this setting, use **set -o history**. To make it permanent, you can add it to your **.bashrc** file, though failing to make use of command history altogether is generally not a good idea.

```
$ echo 'set +o history' >> ~/.bashrc
```

To temporarily clear history, so that only commands that you enter afterwards show up when you type "history", use the **history -c** (clear) command:

```
$ history | tail -3
209 uname -v
210 date
211 man chage
$ history -c
$ history
1  history
```

NOTE: The commands entered after typing "history -c" will not be added to your .bash_history file.

### Controlling history

The command history settings on many systems will default to including one called **$HISTCONTROL** that ensures that, even if you run the same command seven times in a row, it will only be remembered once. It also ensures that commands that you type after first entering one or more blanks will be omitted from your command history.

```
$ grep HISTCONTROL .bashrc
HISTCONTROL=ignoreboth
```

The "ignoreboth" means "ignore both duplicate commands and command starting with blanks". For example, if you type these commands:

```
$ echo try this
$ date
$ date
$ date
$   pwd
$ history
```

your history command should report something like this:

```
$ history
$ echo try this
$ date
$ history
```

Notice that the sequential date commands were reduced to one and the indented command was omitted.

### Overlooking history

To ignore certain commands so that they never show up when you type "history" and are never added to your **.bash_history** file, use the **$HISTIGNORE** setting. For example:

```
$ export HISTIGNORE=”history:cd:exit:ls:pwd:man”
```

This setting will cause all **history**, **cd**, **exit**, **ls**, **pwd** and **man** commands to be omitted from your **history** output and your **.bash_history** file.

If you want to make this setting permanent, you have to add it to your **.bashrc** file.

```
$ echo 'HISTIGNORE="history:cd:exit:ls:pwd:man"' >> .bashrc
```

This setting just means that when you look back through previously run commands, the list won’t be cluttered by commands that you're unlikely to be looking for when you are looking through your command history.

### Remembering, ignoring and forgetting the past

Command history is useful because it helps you remember what commands you’ve recently used and reminds you about changes you’ve recently made. It also makes it easier to rerun commands, especially those with a string of arguments that you don't necessarily want to recreate. Tailoring your history settings can make your use of command history a little easier and more efficient.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3537214/tweaking-history-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://unsplash.com/photos/iqeG5xA96M4
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
