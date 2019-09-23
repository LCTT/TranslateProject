[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with Zsh)
[#]: via: (https://opensource.com/article/19/9/getting-started-zsh)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/falm)

Getting started with Zsh
======
Improve your shell game by upgrading from Bash to Z-shell.
![bash logo on green background][1]

Z-shell (or Zsh) is an interactive Bourne-like POSIX shell known for its abundance of innovative features. Z-Shell users often cite its many conveniences and credit it for increased efficiency and extensive customization.

If you're relatively new to Linux or Unix but experienced enough to have opened a terminal and run a few commands, you have probably used the Bash shell. Bash is arguably the definitive free software shell, partly because of its progressive features and partly because it ships as the default shell on most of the popular Linux and Unix operating systems. However, the more you use a shell, the more you start to find small things that might be better for the way you want to use it. If there's one thing open source is famous for, it's _choice_. Many people choose to "graduate" from Bash to Z.

### What is Zsh?

A shell is just an interface to your operating system. An interactive shell allows you to type in commands through what is called _standard input_, or **stdin**, and get output through _standard output_ and _standard error_, or **stdout** and **stderr**. There are many shells, including Bash, Csh, Ksh, Tcsh, Dash, and Zsh. Each has features based on what its programmers thought would be best for a shell. Whether those features are good or bad is up to you, the end user.

Zsh has features like interactive Tab completion, automated file searching, regex integration, advanced shorthand for defining command scope, and a rich theme engine. These features are included in an otherwise familiar Bourne-like shell environment, meaning that if you already know and love Bash, you'll find Zsh familiar—except with more features. You might think of it as a kind of Bash++.

### Installing Zsh

Install Zsh with your package manager.

On Fedora, RHEL, and CentOS:


```
`$ sudo dnf install zsh`
```

On Ubuntu and Debian:


```
`$ sudo apt install zsh`
```

On MacOS, you can install it using MacPorts:


```
`$ sudo port install zsh`
```

Or with Homebrew:


```
`$ brew install zsh`
```

It's possible to run Zsh on Windows, but only on top of a Linux or Linux-like layer such as [Windows Subsystem for Linux][2] (WSL) or [Cygwin][3]. That installation is out of scope for this article, so refer to Microsoft documentation.

### Setting up Zsh

Zsh is not a terminal emulator; it's a shell that runs inside a terminal emulator. So, to launch Zsh, you must first launch a terminal window such as GNOME Terminal, Konsole, Terminal, iTerm2, rxvt, or another terminal of your preference. Then you can launch Zsh by typing:


```
`$ zsh`
```

The first time you launch Zsh, you're asked to choose some configuration options. These can all be changed later, so press **1** to continue.


```
This is the Z Shell configuration function for new users, zsh-newuser-install.

(q)  Quit and do nothing.

(0)  Exit, creating the file ~/.zshrc

(1)  Continue to the main menu.
```

There are four categories of preferences, so just start at the top.

  1. The first category lets you choose how many commands are retained in your shell history file. By default, it's set to 1,000 lines.
  2. Zsh completion is one of its most exciting features. To keep things simple, consider activating it with its default options until you get used to how it works. Press **1** for default options, **2** to set options manually.
  3. Choose Emacs or Vi key bindings. Bash uses Emacs bindings, so you may be used to that already.
  4. Finally, you can learn about (and set or unset) some of Zsh's subtle features. For instance, you can stop using the **cd** command by allowing Zsh to initiate a directory change when you provide a non-executable path with no command. To activate one of these extra options, type the option number and enter **s** to _set_ it. Try turning on all options to get the full Zsh experience. You can unset them later by editing **~/.zshrc**.



To complete configuration, press **0**.

### Using Zsh

At first, Zsh feels a lot like using Bash, which is unmistakably one of its many features. There are serious differences between, for instance, Bash and Tcsh, so being able to switch between Bash and Zsh is a convenience that makes Zsh easy to try and easy to use at home if you have to use Bash at work or on your server.

#### Change directory with Zsh

It's the small differences that make Zsh nice. First, try changing the directory to your Documents folder _without the **cd** command_. It seems too good to be true; but if you enter a directory path with no further instruction, Zsh changes to that directory:


```
% Documents
% pwd
/home/seth/Documents
```

That renders an error in Bash or any other normal shell. But Zsh is far from normal, and this is just the beginning.

#### Search with Zsh

When you want to find a file using a normal shell, you probably resort to the **find** or **locate** command. At the very least, you may have used **ls -R** for a recursive listing of a set of directories. Zsh has a built-in feature allowing it to find a file in the current or any other subdirectory.

For instance, assume you have two files called **foo.txt**. One is located in your current directory, and the other is in a subdirectory called **foo**. In a Bash shell, you can list the file in the current directory with:


```
$ ls
foo.txt
```

and you can list the other one by stating the subdirectory's path explicitly:


```
$ ls foo
foo.txt
```

To list both, you must use the **-R** switch, maybe combined with **grep**:


```
$ ls -R | grep foo.txt
foo.txt
foo.txt
```

But in Zsh, you can use the ****** shorthand:


```
% ls **/foo.txt
foo.txt
foo.txt
```

And you can use this syntax with any command, not just with **ls**. Imagine your increased efficiency when moving specific file types from one collection of directories to a single location, or concatenating snippets of text into a file, or grepping through logs.

### Using Zsh Tab completion

Tab completion is a power-user feature in Bash and some other shells, and it took the Unix world by storm when it became commonplace. No longer did Unix users have to resort to wildcards when typing long and tedious paths (such as **/h*/s*h/V*/SCS/sc*/comp*/t*/a*/*9/04/LS*boat*v**, which is a lot easier than typing **/home/seth/Videos/SCS/scenes/composite/takes/approved/109/04/LS_boat-port-cargo-mover.mkv**). Instead, they could just press the Tab key when they entered enough of a unique string. For example, if you know there's only one directory starting with an **h** at the root level of your system, you might type **/h** and then hit Tab. It's fast, it's simple, it's efficient. It also confirms a path exists; if Tab doesn't complete anything, you know you're looking in the wrong place or you mistyped part of the path.

However, if you have many directories that share five or more of the same first letters, Tab staunchly refuses to complete. While in most modern terminals it will (at least) reveal the files blocking it from guessing what you mean, it usually takes two Tab presses to reveal them; therefore, Tab completion often becomes such an interplay of letters and Tabs across your keyboard that you feel like you're training for a piano recital.

Zsh solves this minor annoyance by cycling through possible completions. If you type **ls ~/D** and press Tab, Zsh completes your command with **Documents** first; if you press Tab again, it offers **Downloads**, and so on until you find the one you want.

### Wildcards in Zsh

Wildcards behave differently in Zsh than what Bash users are used to. First of all, they can be modified. For example, if you want to list all folders in your current directory, you can use a modified wildcard:


```
% ls
dir0   dir1   dir2   file0   file1
% ls *(/)
dir0   dir1   dir2
```

In this example, the **(/)** qualifies the results of the wildcard so Zsh will display only directories. To list just the files, use **(.)**. To list symlinks, use **(@)**. To list executable files, use **(*)**.


```
% ls ~/bin/*(*)
fop  exify  tt
```

Zsh isn't aware of file types only. It can also list according to modification time, using the same wildcard modifier convention. For example, if you want to find a file that was modified within the past eight hours, use the **mh** modifier (for **modified** and **hours**) and the negative integer of hours:


```
% ls ~/Documents/*(mh-8)
cal.org   game.org   home.org
```

To find a file modified more than (for instance) two days ago, the modifiers change to **md** (for **modified** and **day**) with a positive integer:


```
% ls ~/Documents/*(+2)
holiday.org
```

There's a lot more you can do with wildcard modifiers and qualifiers, so read the [Zsh man page][4] for full details.

#### The wildcard side effect

To use wildcards the way you would use them in Bash, sometimes they must be escaped in Zsh. For instance, if you're copying some files to your server in Bash, you might use a wildcard like this:


```
`$ scp IMG_*.JPG seth@example.com:~/www/ph*/*19/09/14`
```

That works in Bash, but Zsh returns an error because it tries to expand the variables on the remote side before issuing the **scp** command. To avoid this, you must escape the remote variables:


```
`% scp IMG_*.JPG seth@example.com:~/www/ph\*/\*19/09/14`
```

It's these types of little exceptions that can frustrate you when you're switching to a new shell. There aren't many when using Zsh (there are probably more when switching back to Bash after experiencing Zsh) but when they happen, remain calm and be explicit. Rarely will you go wrong to adhere strictly to POSIX—but if that fails, look up the problem to solve it and move on. [Hyperpolyglot.org][5] has proven invaluable to many users stuck on one shell at work and another at home.

In my next Zsh article, I'll show you how to install themes and plugins to make your Z-Shell even Z-ier.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/getting-started-zsh

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/falm
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://devblogs.microsoft.com/commandline/category/bash-on-ubuntu-on-windows/
[3]: https://www.cygwin.com/
[4]: https://linux.die.net/man/1/zsh
[5]: http://hyperpolyglot.org/unix-shells
