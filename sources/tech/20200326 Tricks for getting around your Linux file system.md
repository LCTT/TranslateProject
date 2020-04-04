[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tricks for getting around your Linux file system)
[#]: via: (https://www.networkworld.com/article/3533421/tricks-for-getting-around-your-linux-file-system.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Tricks for getting around your Linux file system
======
The cd command is probably one of the first 10 that any Linux user learns, but it's not the only way to navigate the Linux file system.Here are some other ways.
Thinkstock

Whether you're moving around the file system, looking for files or trying to move into important directories, Linux can provide a lot of help. In this post, we'll look at a number of tricks to make moving around the file system and both finding and using commands that you need a little easier.

### Adding to your $PATH

One of the easiest and most useful ways to ensure that you don't have to invest a lot of time into finding commands on a Linux system is to add the proper directories to your $PATH variable. The order of directories that you add to your $PATH variable is, however, very important. They determine the order in which the system will look through the directories to find the command to run -- stopping when it finds the first match.

You might, for example, want to put your home directory first so that, if you create a script that has the same name as some other executable, it will be the one that you end up running whenever you type its name.

[RELATED: Linux hardening: a 15-step checklist for a secure Linux server][1]

To add your home directory to your $PATH variable, you could do this:

```
$ export PATH=~:$PATH
```

The **~** character represents your home directory.

If you keep your scripts in your bin directory, this would work for you:

```
$ export PATH=~/bin:$PATH
```

You can then run a script located in your home directory like this:

[][2]

```
$ myscript
Good morning, you just ran /home/myacct/bin/myscript
```

**IMPORTANT:** The commands shown above _add_ to your search path because $PATH (the current path) is included. They don't override it. Your search path should be configured in your **.bashrc** file, and any changes you intend to be permanent should be added there as well.

### Using symbolic links

Symbolic links provide an easy and obvious way to record the location of directories that you might need to use often. If you manage content for a web site, for example, you might want to get your account to "remember" where the web files are located by creating a link like this:

```
ln -s /var/www/html www
```

The order of the arguments is critical. The first (/var/www/html) is the target and the second is the name of the link that you will be creating. If you're not currently located in your home directory, the following command would do the same thing:

```
ln -s /var/www/html ~/www
```

After setting this up, you can use "cd www" to get to **/var/www/html**.

### Using shopt

The **shopt** command also provides a way to make moving to a different directory a bit easier. When you employ **shopt'**s **autocd** option, you can go to a directory simply by typing its name. For example:

```
$ shopt -s autocd
$ www
cd -- www
/home/myacct/www
$ pwd -P
/var/www/html

$ ~/bin
cd -- /home/myacct/bin
$ pwd
/home/myacct/bin
```

In the first set of commands above, the **shopt** command's **autocd** option is enabled. Typing **www** then invokes a "cd www" command. Because this symbolic link was created in one of the **ln** command examples above, this moves us to **/var/www/html**. The **pwd -P** command displays the actual location.

In the second set, typing **~/bin** invokes a **cd** into the **bin** directory in the user's home.

Note that the **autocd** behavior will _not_ kick in when what you type is a command –  even if it's also the name of a directory.

The **shopt** command is a bash builtin and has a lot of options. This one just means that you don't have to type "cd" before the name of each directory you want to move into.

To see **shopt**'s other options, just type "shopt".

### Using $CDPATH

Probably one of the most useful tricks for moving into particular directories is adding the paths that you want to be able to move into easily to your **$CDPATH**. This creates a list of directories that will be moved into by typing only a portion of the full path names.

There is one aspect of this that may be just a little tricky. Your **$CDPATH** needs to include the directories that _contain_ the directories that you want to move into, not the directories themselves.

For example, say that you want to be able to move into the **/var/www/html** directory simply by typing "cd html" and into subdirectories in /var/log using only "cd" and the simple directory names. In this case, this **$CDPATH** would work:

```
$ CDPATH=.:/var/log:/var/www
```

Here's what you would see:

```
$ cd journal
/var/log/journal
$ cd html
/var/www/html
```

Your **$CDPATH** kicks in when what you type is _not_ a full path. Then it looks down its list of directories in order to see if the directory you identified exists in one of them. Once it finds a match, it takes you there.

Keeping the "." at the beginning of your **$CDPATH** means that you can move into local directories without having to have them defined in the **$CDPATH**.

```
$ export CDPATH=".:$CDPATH"
$ Videos
cd -- Videos
/home/myacct/Videos
```

It's not hard to move around the Linux file system, but you can save a few brain cells if you use some handy tricks for getting to various locations easily.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3533421/tricks-for-getting-around-your-linux-file-system.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3143050/linux/linux-hardening-a-15-step-checklist-for-a-secure-linux-server.html#tk.nww-fsb
[2]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
