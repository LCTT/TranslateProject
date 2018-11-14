The alias And unalias Commands Explained With Examples
======
![](https://www.ostechnix.com/wp-content/uploads/2018/11/alias-command-720x340.png)

You may forget the complex and lengthy Linux commands after certain period of time unless you’re a heavy command line user. Sure, there are a few ways to [**recall the forgotten commands**][1]. You could simply [**save the frequently used commands**][2] and use them on demand. Also, you can [**bookmark the important commands**][3] in your Terminal and use whenever you want. And, of course there is already a built-in **“history”** command available to help you to remember the commands. Another easiest way to remember such long commands is to simply create an alias (shortcut) to them. Not just long commands, you can create alias to any frequently used Linux commands for easier repeated invocation. By this approach, you don’t need to memorize those commands anymore. In this guide, we are going to learn about **alias** and **unalias** commands with examples in Linux.

### The alias command

The **alias** command is used to run any command or set of commands (inclusive of many options, arguments) with a user-defined string. The string could be a simple name or abbreviations for the commands regardless of how complex the original commands are. You can use the aliases as the way you use the normal Linux commands. The alias command comes preinstalled in shells, including BASH, Csh, Ksh and Zsh etc.

The general syntax of alias command is:

```
alias [alias-name[=string]...]
```

Let us go ahead and see some examples.

**List aliases**

You might already have aliases in your system. Some applications may create the aliases automatically when you install them. To view the list of existing aliases, run:

```
$ alias
```

or,

```
$ alias -p
```

I have the following aliases in my Arch Linux system.

```
alias betty='/home/sk/betty/main.rb'
alias ls='ls --color=auto'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias update='newsbeuter -r && sudo pacman -Syu'
```

**Create a new alias**

Like I already said, you don’t need to memorize the lengthy and complex commands. You don’t even need to run long commands over and over. Just create an alias to the command with easily recognizable name and run it whenever you want. Let us say, you want to use this command often.

```
$ du -h --max-depth=1 | sort -hr
```

This command finds which sub-directories consume how much disk size in the current working directory. This command is bit long. Instead of remembering the whole command, we can easily create an alias like below:

```
$ alias du='du -h --max-depth=1 | sort -hr'
```

Here, **du** is the alias name. You can use any name to the alias to easily remember it later.

You can either use single or double quotes when creating an alias. It makes no difference.

Now you can just run the alias (i.e **du** in our case) instead of the full command. Both will produce the same result.

The aliases will expire with the current shell session. They will be gone once you log out of the current session. In order to make the aliases permanent, you need to add them in your shell’s configuration file.

On BASH shell, edit **~/.bashrc** file:

```
$ nano ~/.bashrc
```

Add the aliases one by one:
![](https://www.ostechnix.com/wp-content/uploads/2018/11/alias.png)

Save and quit the file. Then, update the changes by running the following command:

```
$ source ~/.bashrc
```

Now, the aliases are persistent across sessions.

On ZSH, you need to add the aliases in **~/.zshrc** file. Similarly, add your aliases in **~/.config/fish/config.fish** file if you use Fish shell.

**Viewing a specific aliased command**

As I mentioned earlier, you can view the list of all aliases in your system using ‘alias’ command. If you want to view the command associated with a given alias, for example ‘du’, just run:

```
$ alias du
alias du='du -h --max-depth=1 | sort -hr'
```

As you can see, the above command display the command associated with the word ‘du’.

For more details about alias command, refer the man pages:

```
$ man alias
```

### The unalias command

As the name says, the **unalias** command simply removes the aliases in your system. The typical syntax of unalias command is:

```
unalias <alias-name>
```

To remove an aliased command, for example ‘du’ which we created earlier, simply run:

```
$ unalias du
```

The unalias command not only removes the alias from the current session, but also remove them permanently from your shell’s configuration file.

Another way to remove an alias is to create a new alias with same name.

To remove all aliases from the current session, use **-a** flag:

```
$ unalias -a
```

For more details, refer man pages.

```
$ man unalias
```

Creating aliases to complex and lengthy commands will save you some time if you run those commands over and over. Now it is your time to create aliases the frequently used commands.

And, that’s all for now. Hope this helps. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/the-alias-and-unalias-commands-explained-with-examples/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/easily-recall-forgotten-linux-commands/
[2]: https://www.ostechnix.com/save-commands-terminal-use-demand/
[3]: https://www.ostechnix.com/bookmark-linux-commands-easier-repeated-invocation/
