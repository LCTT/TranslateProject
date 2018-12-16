[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Aliases: DIY Shell Commands)
[#]: via: (https://www.linux.com/blog/learn/2018/12/aliases-diy-shell-commands)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

Aliases: DIY Shell Commands
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/jodi-mucha-540841-unsplash.jpg?itok=n1d1VDUV)

Aliases, in the context of the Linux shell, are **commands you build yourself** by packing them with combinations of other instructions that are too long or too hard to remember.

You create an alias by using the word `alias`, then the name of the command you want to create, an equal sign (`=`), and then the Bash command(s) you want your alias to run. For example, `ls` in its base form does not colorize its output, making it difficult to distinguish between directories, files, and links. You can build a new command that shows colors by making an alias like this:

```
alias lc='ls --color=auto'
```

where `lc` is the name you have picked for your new command. When creating aliases, be sure to check that the name you picked isn't already in use, or you may override an existing command. In this case, `lc` stands for "list (with) color". Notice there is no space in front of or behind the `=`. Finally, you have the regular Bash command(s) you want to run when `lc` is executed. In this case, the `ls` command with the `--color` option.

After defining your alias, every time you type `lc`, the contents of the current directory will be shown in color.

But, you may think, "my `ls` command already lists files in different colors!" That is because most Linux distros come with some aliases already set up for you.

### Aliases you (probably) already have

Indeed, you can use the `alias` instruction without any options to see what aliases you already have. These will vary by distro, but some typical preset aliases are:

  * `alias ls='ls --color=auto'`: You already saw this one above. The `auto` modifier of the `--color` option tells `ls` to use color when standard output is connected to a terminal. That is, the output of `ls` is going to show up in a terminal window or a text screen, instead of, say, being piped to a file. Other alternatives for `--color` are `always` and `never`.
  * `alias cp='cp -i'`: The `-i` option stands for _interactive_. Sometimes, when you use `cp` you may inadvertently overwrite an existing file. By using the `-i`, `cp` will ask you before clobbering anything.
  * `alias free='free -m'`: Using `-m` with `free`you can see how much free memory you have and how much your applications are using in megabytes instead of the default bytes. This makes the output of `free` easier to read for a human.



There may be more (or less, or even none), but regardless of what your distribution comes with, you can always use the base form (vs. the aliased form) of a command with the `\` modifier. For example:

```
\free
```

will execute `free` without the `-m` option, and

```
\ls
```

will execute `ls` without the `--color=auto` option.

If you want to get rid or modify the preset aliases forever, note that they live in the global _.bashrc_ file which hangs out in [our old haunt, the _/etc/skel_ directory][1].

### Aliases for muscle memory

Distro designers try their best to predict which aliases are going to be useful for you. But every user is different and comes from a different background. If you are new to GNU+Linux, it may be because you are coming from another system, and the basic commands vary from shell to shell. If you come from a Windows/MS-DOS background, you may want to define an alias like

```
alias dir='ls'
```

to list files or directories.

Likewise,

```
alias copy='cp'
alias move='mv'
```

may also come in handy, at least until you get used to Linux's new lexicon.

The other problem occurs when mistakes become ingrained in your muscle memory, so you always mistype some words the same way. I, for instance, have great difficulty typing _admnis-_... _adminsi-_... _A-D-M-I-N-I-S-T-R-A-T-I-ON_ ( _phew!_ ) at speed. That is why some users create aliases like

```
alias sl='ls'
```

and

```
alias gerp='echo "You did it *again*!"; grep'
```

Although we haven't formally introduced `grep` yet, in its most basic form, it looks for a string of characters in a file or a set of files. It's one of those commands that you will tend to use A LOT once you get to grips with it, as those ingrained mistyping habits that force you to type the instruction twice every time get annoying really quickly.

Another thing to note in the `gerp` example is that it is not a single instruction, but two. The first one (`echo "You did it *again*!"`) prints out a message reminding you that you misspelled the grep command, then there is a semicolon (`;`) that separates one instruction from the other. Finally, you've got the second command (`grep`) that does the actual grepping.

Using `gerp` on my system to search for the lines containing the word " _alias_ " in _/etc/skel/.bashrc_ , the output looks like this:

```
$ gerp -R alias /etc/skel/.bashrc
You did it *again*!
 alias ls='ls --color=auto'
 alias grep='grep --colour=auto'
 alias egrep='egrep --colour=auto'
 alias fgrep='fgrep --colour=auto'
alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias np='nano -w PKGBUILD'
alias more=less
shopt -s expand_aliases
```

Running commands sequentially as part of an alias, or, even better, chaining commands so that one command can use the results coughed up by another, is getting us perilously close to Bash scripting. This has been in the making of this series for quite some time, and we'll start covering it in the very next article.

For the time being, if you want to get rid of an alias you temporarily set up in a running terminal, use the `unalias` command:

```
unalias gerp
```

If you want to make your aliases permanent, you can drop them into the _.bashrc_ file you have in your home directory. This is the same thing we did with custom environment variables in [last week's article][2].

See you next time!

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/12/aliases-diy-shell-commands

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/learn/intro-to-linux/2018/7/users-groups-and-other-linux-beasts
[2]: https://www.linux.com/blog/learn/2018/12/bash-variables-environmental-and-otherwise
