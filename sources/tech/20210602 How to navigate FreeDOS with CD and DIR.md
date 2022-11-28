[#]: subject: (How to navigate FreeDOS with CD and DIR)
[#]: via: (https://opensource.com/article/21/6/navigate-freedos-cd-dir)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to navigate FreeDOS with CD and DIR
======
Armed with just two commands DIR and CD, you can navigate your FreeDOS
system from the command line.
![4 different color terminal windows with code][1]

FreeDOS is an open source DOS-compatible operating system that you can use to play classic DOS games, run legacy business software, or develop embedded systems. Any program that works on MS-DOS should also run on FreeDOS.

But if you've never used DOS, you might be confused about how to navigate the system. FreeDOS is primarily a command-line interface; there is no default graphical user interface (GUI) in FreeDOS. You need to type every command at the command line.

Two commands that help you find your way around FreeDOS: `CD` and `DIR`. I've written those commands in all uppercase, but DOS is actually _case insensitive_, so you can type your commands using either uppercase or lowercase letters. DOS doesn't care.

Let's start with the `DIR` command. This command name is short for _directory_ and is similar to the `ls` command on Linux systems. You can run `DIR` anywhere on your system to see what files you have. Just type the command `DIR` to get a list of files and directories:

![DIR listing of the D: drive][2]

Jim Hall, CC-BY SA 4.0

The output from `DIR` is very utilitarian. At the top, `DIR` prints the "volume name" of the current drive. Then `DIR` shows all the files and directories. In the screenshot, you can see the directory listing of the FreeDOS 1.3 RC4 LiveCD. It contains several directories, including the `FREEDOS` directory which contains all of the core FreeDOS programs and utilities. You can also see several files, starting with the `COMMAND.COM` shell, which is similar to Bash on Linux—except much simpler. The FreeDOS kernel itself is the `KERNEL.SYS `file further down the list.

At the top level of any drive, before you go into a directory, you are at the _root directory_. DOS uses the `\` ("back slash") character to separate directories in a path, which is slightly different from the `/` ("slash") character in Linux systems.

To navigate into a directory, you can use the `CD` command. Like `cd` on Linux, this stands for _change directory_. The `CD` command sets the new _working directory_ to wherever you want to go. For example, you might go into the `GAMES` directory and use `DIR` to list its contents:

![Use CD to change your working directory][3]

Jim Hall, CC-BY SA 4.0

You can also specify a path to `CD`, to jump to a specific directory elsewhere on your system. If I wanted to change to the `FREEDOS` directory, I could simply specify the full path relative to the root directory. In this case, that's the `\FREEDOS` directory. From there, I can run another `DIR` command to see the files and directories stored there:

![Specify a full path to change to another working directory][4]

Jim Hall, CC-BY SA 4.0

Like Linux, DOS also uses `.` and `..` to represent a _relative path_. The `.` directory is the current directory, and `..` is the directory that's one level before it, or the _parent_ directory. Using `..` allows you to "back up" one directory with the `CD` command, so you don't need to specify a full path.

From the first `DIR` screenshot, we can see the root directory also contains a `DEVEL` directory. If we're already in the `\FREEDOS` directory, we can navigate to `DEVEL` by "backing up" one directory level, and "going into" the `..\DEVEL` directory via a relative path:

![Use .. to navigate using a relative path][5]

Jim Hall, CC-BY SA 4.0

Armed with just two commands `DIR` and `CD`, you can navigate your FreeDOS system from the command line. Try it on your FreeDOS system to locate files and execute programs.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/navigate-freedos-cd-dir

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos.png?itok=aOBLy7Ky (4 different color terminal windows with code)
[2]: https://opensource.com/sites/default/files/uploads/dir1.png (DIR listing of the D: drive)
[3]: https://opensource.com/sites/default/files/uploads/cd-games2.png (Use CD to change your working directory)
[4]: https://opensource.com/sites/default/files/uploads/cd-freedos3.png (Specify a full path to change to another working directory)
[5]: https://opensource.com/sites/default/files/uploads/cd-devel4.png (Use .. to navigate using a relative path)
