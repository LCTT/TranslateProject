[#]: subject: "A guide to the Linux terminal for beginners"
[#]: via: "https://opensource.com/article/21/8/linux-terminal"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A guide to the Linux terminal for beginners
======
Learn the differences between Linux terminal commands, arguments, and
options, and how to use them to control your computer.
![Terminal command prompt on orange background][1]

There's a café a few streets away from where I live, and I go there every Sunday for a regularly scheduled game of D&amp;D. They have a menu, and the first few times I ordered, I looked over the menu for several minutes to see what my choices were. Being a creature of habit, I eventually stopped referring to the menu because I knew exactly what they have for sale, and I know exactly what I want. Ordering food for the table is now as easy as saying "the usual" and waiting for the cups of coffee and bowls of chips and scones to be delivered (usually inconveniently at just the moment we've rolled for initiative, but that's hardly the staff's fault or problem).

Similar to a restaurant menu, graphical interfaces for computers offer users a choice of actions. There are icons and windows and buttons, and you hunt for the one you're looking for, click on items, drag other items, and manipulate graphical representations until a task is complete. After a while, though, this can become cumbersome and, worse yet, inefficient. You know exactly what needs to be done, so wouldn't it be nice to just tell the computer exactly what you want to happen, rather than going through the physical and mental motions of hunting for components and repeating a mouse-based dance routine?

### What is the Linux terminal?

The Linux terminal is a text-based interface used to control a Linux computer. It's just one of the many tools provided to Linux users for accomplishing any given task, but it's widely considered the most efficient method available. Outside of writing code, it's certainly the most direct method possible. It's so popular, in fact, that Apple changed its foundation to Unix and has gained the [Bash and Z shell][2], and Microsoft developed [PowerShell][3], its very own open source command line.

### What is a Linux command?

A **command** is a special keyword you can use in a terminal to tell your computer to perform an action. Most commands are tiny little applications that get installed with the rest of your operating system. You may not realize they're on your computer because they're generally kept in relatively obscure directories like `/bin`, `/sbin`, `/usr/bin`, and `/usr/sbin`, but your terminal knows where to find them (thanks to something called the [PATH][4]). Other commands are built into your terminal. You don't have to worry about whether a command was installed or comes built-in because your terminal knows the commands either way. Better yet, on most Linux distributions, when your terminal can't find a command, it searches the internet for a package to provide that command and then offers to install and run it for you!

Here's a simple command:


```
`$ ls`
```

The `ls` command is short for "list," and it lists the contents of your current directory. Open a terminal and try it out. Then open a file manager window (_Files_ on Linux, _Finder_ on macOS, _Windows Explorer_ on Windows) and compare. It's two different views of the same data.

### What is an argument in a Linux command?

An **argument** is any part of a command that isn't the command. For instance, to list the contents of a specific directory, you can provide the name of that directory as an argument:


```
`$ ls Documents`
```

In this example, `ls` is the command and `Documents` is the argument. This would render a list of your `Documents` directory's contents.

### What are options in Linux?

Command **options**, also called **flags** or **switches**, are part of command arguments. A command argument is anything that follows a command, and an option is usually (but not always) demarcated by a dash or double dashes. For instance:


```
`$ ls --classify Documents`
```

In this example, `--classify` is an option. It also has a short version because terminal users tend to prefer the efficiency of less typing:


```
`$ ls -F Documents`
```

Short options can usually be combined. Here's an `ls` command combining the `-l` option with the `--human-readable`, `--classify`, and `--ignore-backups` options:


```
`$ ls -lhFB`
```

Some options can take arguments themselves. For instance, the `--format` option for `ls` lets you change how information is presented. By default, the contents of directories are provided to you in columns, but if you need them to be listed in a comma-delimited list, you can set `format` to `comma`:


```
$ ls --format=comma Documents
alluvial, android-info.txt, arduinoIntro, dmschema,
headers.snippet, twine, workshop.odt
```

The equal sign (`=`) is optional, so this works just as well:


```
$ ls --format comma Documents
alluvial, android-info.txt, arduinoIntro, dmschema,
headers.snippet, twine, workshop.odt
```

### Learning to use the Linux terminal

Learning how to use a terminal can increase efficiency and productivity—and can also make computing a lot of fun. There are few times when I run a carefully crafted command and don't sit back marveling at what I've managed to make happen with just a few words typed into an otherwise blank screen. A terminal is many things—programming, poetry, puzzle, and pragmatism—but no matter how you see it, it's a lasting innovation that's worth learning.

  * [Use the Linux terminal to see what files are on your computer][5]
  * [How to open and close directories in the Linux terminal][6]
  * [Navigating in the Linux terminal][7]
  * [Move a file in the Linux terminal][8]
  * [Rename a file in the Linux terminal][9]
  * [Copy files and folders in the Linux terminal][10]
  * [Remove files and folders in the Linux Terminal][11]



After reading and practicing the lessons in these articles, download our free ebook, [Sysadmin's guide to Bash scripting][12] for even more fun in the terminal.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/linux-terminal

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://opensource.com/business/16/3/top-linux-shells
[3]: https://opensource.com/article/18/2/powershell-people
[4]: https://opensource.com/article/17/6/set-path-linux
[5]: https://opensource.com/article/21/7/linux-terminal-basics-see-what-files-are-your-computer
[6]: https://opensource.com/article/21/7/linux-terminal-basics-opening-and-closing-directories
[7]: https://opensource.com/article/21/7/terminal-basics-moving-around-your-computer
[8]: https://opensource.com/article/21/7/terminal-basics-moving-files-linux-terminal
[9]: https://opensource.com/article/21/7/terminal-basics-rename-file-linux-terminal
[10]: https://opensource.com/article/21/7/terminal-basics-copying-files-linux-terminal
[11]: https://opensource.com/article/21/7/terminal-basics-removing-files-and-folders-linux-terminal
[12]: https://opensource.com/downloads/bash-scripting-ebook