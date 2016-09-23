translating by ucasFL
Understanding Different Classifications of Shell Commands and Their Usage in Linux
理解 Linux 下不同分类的 Shell 命令及它们的用法
====

When it comes to gaining absolute control over your Linux system, then nothing comes close to the command line interface (CLI). In order to become a Linux power user, one must understand the [different types of shell commands][1] and the appropriate ways of using them from the terminal.
当你打算真正操纵好你的 Linux 系统，没有什么更接近命令行界面。为了成为一个 Linux 高手，你必须能够理解【不同种类的 Shell 命令】【１】并且会在终端下正确的使用它们。
In Linux, there are several types of commands, and for a new Linux user, knowing the meaning of different commands enables for efficient and precise usage. Therefore, in this article, we shall walk through the various classifications of shell commands inLinux.
在 Linux 下，有一些不同种类的命令，对于一个 Linux 新手来说，知道不同命令的意思才能够高效和准确的使用它们。因此，在这篇文章里，我们将会分享 Linux 下不同分类的 Shell 命令。
One important thing to note is that the command line interface is different from the shell, it only provides a means for you to access the shell. The shell, which is also programmable then makes it possible to communicate with the kernel using commands.
需要注意一件非常重要的事：命令行界面和 Shell 是不同的，它只是为你提供一个访问 Shell 的方式。Shell 是可编程的，这使得它可以通过命令与内核进行交流。
Different classifications of Linux commands fall under the following classifications:
下面列出了 Linux 下不同种类的命令：

### 1. Program Executables (File System Commands)
### 1. 程序可执行文件（文件系统命令）

When you run a command, Linux searches through the directories stored in the $PATH environmental variable from left to right for the executable of that specific command.
当你执行一条命令的时候，Linux 通过从左到右搜索存储在 $PATH 环境变量中的目录来找到这条命令的可执行文件。
You can view the directories in the $PATH as follows:
你可以像下面这样查看存储在 $PATH 中的目录
```
$ echo $PATH
/home/aaronkilik/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
```

In the above order, the directory /home/aaronkilik/bin will be searched first followed by /usr/local/sbin and so on, the order is significant in the search process.
在上面的命令中，目录 /home/aaronkilik/bin 将会被首先搜索，紧跟着是 /usr/local/sbin，然后一直接着下去。在搜索进程中，搜索顺序是至关重要的。
Examples of file system commands in /usr/bin directory:
比如在 /usr/bin 目录中的文件系统命令：

```
$ ll /bin/
```

Sample Output
样本输出

```
total 16284
drwxr-xr-x  2 root root    4096 Jul 31 16:30 ./
drwxr-xr-x 23 root root    4096 Jul 31 16:29 ../
-rwxr-xr-x  1 root root    6456 Apr 14 18:53 archdetect*
-rwxr-xr-x  1 root root 1037440 May 17 16:15 bash*
-rwxr-xr-x  1 root root  520992 Jan 20  2016 btrfs*
-rwxr-xr-x  1 root root  249464 Jan 20  2016 btrfs-calc-size*
lrwxrwxrwx  1 root root       5 Jul 31 16:19 btrfsck -> btrfs*
-rwxr-xr-x  1 root root  278376 Jan 20  2016 btrfs-convert*
-rwxr-xr-x  1 root root  249464 Jan 20  2016 btrfs-debug-tree*
-rwxr-xr-x  1 root root  245368 Jan 20  2016 btrfs-find-root*
-rwxr-xr-x  1 root root  270136 Jan 20  2016 btrfs-image*
-rwxr-xr-x  1 root root  249464 Jan 20  2016 btrfs-map-logical*
-rwxr-xr-x  1 root root  245368 Jan 20  2016 btrfs-select-super*
-rwxr-xr-x  1 root root  253816 Jan 20  2016 btrfs-show-super*
-rwxr-xr-x  1 root root  249464 Jan 20  2016 btrfstune*
-rwxr-xr-x  1 root root  245368 Jan 20  2016 btrfs-zero-log*
-rwxr-xr-x  1 root root   31288 May 20  2015 bunzip2*
-rwxr-xr-x  1 root root 1964536 Aug 19  2015 busybox*
-rwxr-xr-x  1 root root   31288 May 20  2015 bzcat*
lrwxrwxrwx  1 root root       6 Jul 31 16:19 bzcmp -> bzdiff*
-rwxr-xr-x  1 root root    2140 May 20  2015 bzdiff*
lrwxrwxrwx  1 root root       6 Jul 31 16:19 bzegrep -> bzgrep*
-rwxr-xr-x  1 root root    4877 May 20  2015 bzexe*
lrwxrwxrwx  1 root root       6 Jul 31 16:19 bzfgrep -> bzgrep*
-rwxr-xr-x  1 root root    3642 May 20  2015 bzgrep*
```

### 2. Linux Aliases
### 2. Linux 的别名

These are user defined commands, they are created using the alias shell built-in command, and contain other shell commands with some options and arguments. The ideas is to basically use new and short names for lengthy commands.
这些是命令是用户定义的，

The syntax for creating an alias is as follows:

```
$ alias newcommand='command -options'
```

To list all aliases on your system, issue the command below:

```
$ alias -p
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
```

To create a new alias in Linux, go through some below examples.

```
$ alias update='sudo apt update'
$ alias upgrade='sudo apt dist-upgrade'
$ alias -p | grep 'up'
```

![](http://www.tecmint.com/wp-content/uploads/2016/08/Create-Aliase-in-Linux.png)

However, the aliases we have created above only work temporarily, when the system is restarted, they will not work after the next boot. You can set permanent aliases in your `.bashrc` file as shown below.

![](http://www.tecmint.com/wp-content/uploads/2016/08/Set-Linux-Aliases-Permanent.png)

After adding them, run the command below to active.

```
$ source ~/.bashrc
```

### 3. Linux Shell Reserved Words

In shell programming, words such as if, then, fi, for, while, case, esac, else, until and many others are shell reserved words. As the description implies, they have specialized meaning to the shell.

You can list out all Linux shell keywords using type command as shown:

```
$ type if then fi for while case esac else until
if is a shell keyword
then is a shell keyword
fi is a shell keyword
for is a shell keyword
while is a shell keyword
case is a shell keyword
esac is a shell keyword
else is a shell keyword
until is a shell keyword
```

Suggested Read: 10 Useful Linux Chaining Operators with Practical Examples

### 4. Linux Shell Functions

A shell function is a group of commands that are executed collectively within the current shell. Functions help to carry out a specific task in a shell script. The conventional form of writing shell functions in a script is:

```
function_name() {
command1
command2
…….
}
```

Alternatively,

```
function function_name {
command1
command2
…….
}
```

Let’s take a look at how to write shell functions in a script named shell_functions.sh.

```
#!/bin/bash 
#write a shell function to update and upgrade installed packages 
upgrade_system(){
sudo apt update;
sudo apt dist-upgrade;
}
#execute function
upgrade_system
```

Instead of executing the two commands: sudo apt update and sudo apt dist-upgrade from the command line, we have written a simple shell function to execute the two commands as a single command, upgrade_system within a script.

Save the file and thereafter, make the script executable. Finally run it as below:

```
$ chmod +x shell_functions.sh
$ ./shell_functions.sh
```

![](http://www.tecmint.com/wp-content/uploads/2016/08/Linux-Shell-Functions-Script.png)

### 5. Linux Shell Built-in Commands

These are Linux commands that built into the shell, thus you cannot find them within the file system. They include pwd, cd, bg, alias, history, type, source, read, exit and many others.

You can list or check Linux built-in commands using type command as shown:

```
$ type pwd
pwd is a shell builtin
$ type cd
cd is a shell builtin
$ type bg
bg is a shell builtin
$ type alias
alias is a shell builtin
$ type history
history is a shell builtin
```

Learn about some Linux built-in Commands usage:

- [15 ‘pwd’ Command Examples in Linux][2]
- [15 ‘cd’ Command Examples in Linux][3]
- [Learn The Power of Linux ‘history’ Command][4]

### Conclusion

As a Linux user, it is always important to know the type of command you are running. I believe, with the precise and simple-to-understand explanation above including a few relevant illustrations, you probably have a good understanding of the [various categories of Linux commands][5].

You can as well get in tough through the comment section below for any questions or supplementary ideas that you would like to offer us.

--------------------------------------------------------------------------------

via: http://linoxide.com/firewall/pfsense-setup-basic-configuration/

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/different-types-of-linux-shells/
[2]: http://www.tecmint.com/pwd-command-examples/
[3]: http://www.tecmint.com/cd-command-in-linux/
[4]: http://www.tecmint.com/history-command-examples/
[5]: http://www.tecmint.com/category/linux-commands/
