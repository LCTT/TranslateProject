Using the Linux find command with caution
======
![](https://images.idgesg.net/images/article/2017/10/caution-sign-100738884-large.jpg)
A friend recently reminded me of a useful option that can add a little caution to the commands that I run with the Linux find command. It's called -ok and it works like the -exec option except for one important difference -- it makes the find command ask for permission before taking the specified action.

Here's an example. If you were looking for files that you intended to remove from the system using find, you might run a command like this:
```
$ find . -name runme -exec rm {} \;

```

Anywhere within the current directory and its subdirectories, any files named "runme" would be summarily removed -- provided, of course, you have permission to remove them. Use the -ok command instead, and you'll see something like this. The find command will ask for approval before removing the files. Answering **y** for  "yes" would allow the find command to go ahead and remove the files one by one.
```
$ find . -name runme -ok rm {} \;
< rm ... ./bin/runme > ?

```

### The -exedir command is also an option

Another option that can be used to modify the behavior of the find command and potentially make it more controllable is the -execdir command. Where -exec runs whatever command is specified, -execdir runs the specified command from the directory in which the located file resides rather than from the directory in which the find command is run. Here's an example of how it works:
```
$ pwd
/home/shs
$ find . -name runme -execdir pwd \;
/home/shs/bin

```
```
$ find . -name runme -execdir ls \;
ls rm runme

```

So far, so good. One important thing to keep in mind, however, is that the -execdir option will also run commands from the directories in which the located files reside. If you run the command shown below and the directory contains a file named "ls", it will run that file and it will run it even if the file does _not_ have execute permissions set. Using **-exec** or **-execdir** is similar to running a command by sourcing it.
```
$ find . -name runme -execdir ls \;
Running the /home/shs/bin/ls file

```
```
$ find . -name runme -execdir rm {} \;
This is an imposter rm command

```
```
$ ls -l bin
total 12
-r-x------ 1 shs shs 25 Oct 13 18:12 ls
-rwxr-x--- 1 shs shs 36 Oct 13 18:29 rm
-rw-rw-r-- 1 shs shs 28 Oct 13 18:55 runme

```
```
$ cat bin/ls
echo Running the $0 file
$ cat bin/rm
echo This is an imposter rm command

```

### The -okdir option also asks for permission

To be more cautious, you can use the **-okdir** option. Like **-ok** , this option will prompt for permission to run the command.
```
$ find . -name runme -okdir rm {} \;
< rm ... ./bin/runme > ?

```

You can also be careful to specify the commands you want to run with full paths to avoid any problems with imposter commands like those shown above.
```
$ find . -name runme -execdir /bin/rm {} \;

```

The find command has a lot of options besides the default print. Some can make your file searching more precise, but a little caution is always a good idea.

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3233305/linux/using-the-linux-find-command-with-caution.html

作者：[Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.facebook.com/NetworkWorld/
[2]:https://www.linkedin.com/company/network-world
