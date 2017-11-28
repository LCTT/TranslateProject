translating by darksun
# How to Easily Remember Linux Commands

![](https://www.maketecheasier.com/assets/uploads/2017/10/rc-feat.jpg)


The command line can be daunting for new Linux users. Part of that is
remembering the multitude of commands available. After all, in order to use
the command line effectively, you need to know the commands.

Unfortunately, there's no getting around the fact that you need to learn the
commands, but there are some tools that can help you out when you're getting
started.

## History

![Linux Bash History Commands](https://www.maketecheasier.com/assets/uploads/2017/10/rc-bash-history.jpg)

The first thing you can use to remember commands that you've already used is
your own command line history. Most [Linux shells](https://www.maketecheasier.com/remember-linux-commands/<https:/www.maketecheasier.com/alternative-linux-shells/>), including
the most common default, Bash, create a history file that lists your past
commands. For Bash, you can find it at "/home/<username>/.bash_history."

It's a plain text file, so you can open it in any text editor and loop back
through or even search.

## Apropos

There's actually a command that helps you find _other_ commands. It 's called
"apropos," and it helps you find the appropriate command to complete the
action you search or. For example, if you need to know the command to list the
contents of a directory, you can run the following command:

[code]

    apropos "list directory"
[/code]

![Linux Apropos](https://www.maketecheasier.com/assets/uploads/2017/10/rc-apropos.jpg)

There's a catch, though. It's very literal. Add an "s" to "directory," and try
again.

[code]

    apropos "list directories"
[/code]

It doesn't work. What `apropos` does is search through a list of commands and
the accompanying descriptions. If your search doesn't match the description,
it won't pick up the command as a result.

There is something else you can do. By using the `-a` flag, you can add
together search terms in a more flexible way. Try this command:

[code]

    apropos "match pattern"
[/code]

![Linux Apropos -a Flag](https://www.maketecheasier.com/assets/uploads/2017/10/rc-apropos-a.jpg)

You'd think it'd turn up something, like
[grep](https://www.maketecheasier.com/remember-linux-commands/<https:/www.maketecheasier.com/what-is-grep-and-uses/>)? Instead, you
get nothing. Again, apropos is being too literal. Now, try separating the
words and using the `-a` flag.

[code]

    apropos "match" -a "pattern"
[/code]

Suddenly, you have many of the results that you'd expect.

apropos is a great tool, but you always need to be aware of its quirks.

## ZSH

![Linux ZSH
Autocomplete](https://www.maketecheasier.com/assets/uploads/2017/10/rc-
zsh.jpg)![Linux ZSH
Autocomplete](https://www.maketecheasier.com/assets/uploads/2017/10/rc-
zsh.jpg)

ZSH isn't really a tool for remembering commands. It's actually an alternative
shell. You can substitute [ZSH](https://www.maketecheasier.com/remember-linux-
commands/<https:/www.maketecheasier.com/understanding-the-different-shell-in-
linux-zsh-shell/>) for Bash and use it as your command line shell. ZSH
includes an autocorrect feature that catches you if you enter in a command
wrong or misspell something. If you enable it, it'll ask you if you meant
something close. You can continue to use the command line as you normally
would with ZSH, but you get an extra safety net and some other really nice
features, too. The easiest way to get the most of ZSH is with [Oh-My-
ZSH](https://www.maketecheasier.com/remember-linux-commands/<https:/github.com/robbyrussell/oh-my-zsh>).

## Cheat Sheet

The last, and probably simplest, option is to use a [cheat sheet](https://www.maketecheasier.com/remember-linux-commands/<https:/www.maketecheasier.com/premium/cheatsheet/linux-command-line/>). There are plenty available online like [this
one](https://www.maketecheasier.com/remember-linux-commands/<https:/www.cheatography.com/davechild/cheat-sheets/linux-command-line/>) that you can use to look up commands quickly.

![linux-commandline-cheatsheet](https://www.maketecheasier.com/assets/uploads/2013/10/linux-commandline-cheatsheet.gif)

You can actually even find them in image form and set one as your desktop
wallpaper for quick reference.

This isn't the best solution for actually remembering the commands, but when
you're starting out, it can save you from doing a search online every time you
don't remember a command.

Rely on these methods when you're learning, and eventually you'll find
yourself referring to them less and less. No one remembers everything, so
don't feel bad if you occasionally forget or run into something you haven't
seen before. That's what these resources and, of course, the Internet are
there for.


--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/remember-linux-commands/

作者：[Nick Congleton][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

