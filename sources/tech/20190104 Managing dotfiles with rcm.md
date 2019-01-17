[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Managing dotfiles with rcm)
[#]: via: (https://fedoramagazine.org/managing-dotfiles-rcm/)
[#]: author: (Link Dupont https://fedoramagazine.org/author/linkdupont/)

Managing dotfiles with rcm
======

![](https://fedoramagazine.org/wp-content/uploads/2018/12/dotfiles-816x345.jpg)

A hallmark feature of many GNU/Linux programs is the easy-to-edit configuration file. Nearly all common free software programs store configuration settings inside a plain text file, often in a structured format like JSON, YAML or [“INI-like”][1]. These configuration files are frequently found hidden inside a user’s home directory. However, a basic ls won’t reveal them. UNIX standards require that any file or directory name that begins with a period (or “dot”) is considered “hidden” and will not be listed in directory listings unless requested by the user. For example, to list all files using the ls program, pass the -a command-line option.

Over time, these configuration files become highly customized, and managing them becomes increasingly more challenging as time goes on. Not only that, but keeping them synchronized between multiple computers is a common challenge in large organizations. Finally, many users find a sense of pride in their unique configuration settings and want an easy way to share them with friends. That’s where **rcm** steps in.

**rcm** is a “rc” file management suite (“rc” is another convention for naming configuration files that has been adopted by some GNU/Linux programs like screen or bash). **rcm** provides a suite of commands to manage and list files it tracks. Install **rcm** using **dnf**.

### Getting started

By default, **rcm** uses ~/.dotfiles for storing all the dotfiles it manages. A managed dotfile is actually stored inside ~/.dotfiles, and a symlink is placed in the expected file’s location. For example, if ~/.bashrc is tracked by **rcm** , a long listing would look like this.

```
[link@localhost ~]$ ls -l ~/.bashrc
lrwxrwxrwx. 1 link link 27 Dec 16 05:19 .bashrc -> /home/link/.dotfiles/bashrc
[link@localhost ~]$
```

**rcm** consists of 4 commands:

  * mkrc – convert a file into a dotfile managed by rcm
  * lsrc – list files managed by rcm
  * rcup – synchronize dotfiles managed by rcm
  * rcdn – remove all the symlinks managed by rcm



### Share bashrc across two computers

It is not uncommon today for a user to have shell accounts on more than one computer. Keeping dotfiles synchronized between those computers can be a challenge. This scenario will present one possible solution, using only **rcm** and **git**.

First, convert (or “bless”) a file into a dotfile managed by **rcm** with mkrc.

```
[link@localhost ~]$ mkrc -v ~/.bashrc
Moving...
'/home/link/.bashrc' -> '/home/link/.dotfiles/bashrc'
Linking...
'/home/link/.dotfiles/bashrc' -> '/home/link/.bashrc'
[link@localhost ~]$
```

Next, verify the listings are correct with lsrc.

```
[link@localhost ~]$ lsrc
/home/link/.bashrc:/home/link/.dotfiles/bashrc
[link@localhost ~]$
```

Now create a git repository inside ~/.dotfiles and set up an accessible remote repository using your choice of hosted git repositories. Commit the bashrc file and push a new branch.

```
[link@localhost ~]$ cd ~/.dotfiles
[link@localhost .dotfiles]$ git init
Initialized empty Git repository in /home/link/.dotfiles/.git/
[link@localhost .dotfiles]$ git remote add origin git@github.com:linkdupont/dotfiles.git
[link@localhost .dotfiles]$ git add bashrc
[link@localhost .dotfiles]$ git commit -m "initial commit"
[master (root-commit) b54406b] initial commit
1 file changed, 15 insertions(+)
create mode 100644 bashrc
[link@localhost .dotfiles]$ git push -u origin master
...
[link@localhost .dotfiles]$
```

On the second machine, clone this repository into ~/.dotfiles.

```
[link@remotehost ~]$ git clone git@github.com:linkdupont/dotfiles.git ~/.dotfiles
...
[link@remotehost ~]$
```

Now update the symlinks managed by **rcm** with rcup.

```
[link@remotehost ~]$ rcup -v
replacing identical but unlinked /home/link/.bashrc
removed '/home/link/.bashrc'
'/home/link/.dotfiles/bashrc' -> '/home/link/.bashrc'
[link@remotehost ~]$
```

Overwrite the existing ~/.bashrc (if it exists) and restart the shell.

That’s it! The host-specific option (-o) is a useful addition to the scenario above. And as always, be sure to read the manpages; they contain a wealth of example commands.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/managing-dotfiles-rcm/

作者：[Link Dupont][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/linkdupont/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/INI_file
