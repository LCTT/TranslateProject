[#]: subject: (FreeDOS commands for Linux fans)
[#]: via: (https://opensource.com/article/21/6/freedos-linux-users)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( shipsw )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

FreeDOS commands for Linux fans
======
If you're already familiar with the Linux command line, try these
commands to help ease into FreeDOS.
![FreeDOS fish logo and command prompt on computer][1]

If you've tried FreeDOS, you might have been stymied by the command line. The DOS commands are slightly different from how you might use the Linux command line, so getting around on the command line requires learning a few new commands.

But it doesn't have to be an "all new" experience for Linux users. We've always included some standard Unix commands in FreeDOS, in addition to the DOS commands that are already similar to Linux. So if you're already familiar with the Linux command line, try these commands to help ease into FreeDOS:

### Getting Around

Use the `cd` command to _change directory_ in the FreeDOS filesystem. The usage is basically the same on FreeDOS as it is on Linux. To change into a subdirectory called `apps`, type `cd apps`. To go back to the previous directory, type `cd ..`.

The only difference when navigating through directories and paths is that on FreeDOS, the directory separator is `\` ("backslash") instead of `/` ("forward slash") that you use on Linux. For example, let's say you were in the `\devel` directory and you wanted to move to the `\fdos` directory. Both of those are at the same "level" relative to the _root_ directory. So you could type `cd ..\fdos` to "back up" one directory level (with `..`) and then "go into" the `fdos` directory.

To change to a new directory, you could instead give the full path with the leading backslash. This is handy if you are already deep into another path, and just want to switch immediately to the new location. For example, to change to the `\temp` directory, you can type `cd \temp`.
 


```
C:\&gt;cd apps
C:\APPS&gt;cd ..
C:\&gt;cd devel
C:\DEVEL&gt;cd ..\fdos
C:\FDOS&gt;cd \temp
C:\TEMP&gt;_
```

In FreeDOS, like most DOS systems, you can see your current path as part of the DOS prompt. On Linux, your prompt is probably something like `$`. On FreeDOS, the prompt lists the current drive, the current path within that drive, then `>` as the prompt (taking the place of `$` on Linux).

### Listing and Displaying Files

On Linux, the standard command to list files in the current directory is the `ls` command. On FreeDOS, it's a different command: `dir`. But you can get a similar behavior as `ls` by creating an _alias_.

To create an alias to another command, use the built-in `alias` command. For example, use this command to define an alias for `ls` that will display a directory listing in a similar way to using `ls` on Linux:
 


```
C:\&gt;alias ls=dir /one /w /b /l
C:\&gt;ls
[apps]    command.com   [devel]  fdauto.bat   fdconfig.sys
[fdos]    kernel.sys    [src]    [temp]
C:\&gt;
```

The command option format is slightly different on FreeDOS than on Linux. On Linux, you start options with a hyphen character (`-`). But on FreeDOS, options start with a forward slash. The `alias` command above uses the slash character—those are options to `dir`. The `/one` option tells `dir` to order (o) in a certain way: sort any files and directories by name (n) and then by extension (e). Using `/w` says to use a "wide" directory listing, `/b` uses a "bare" display without the other information `dir` usually provides, and `/l` instructs `dir` to display files and directories in lowercase.

Note that the command-line options for the FreeDOS `dir` command are quite different from the options to Linux `ls`, so you can't use this `ls` alias exactly like you would on Linux. For example, typing `ls -l` with this alias on FreeDOS will result in a "File not found" error, because the underlying FreeDOS `dir` command will be unable to find a file called `-l`. But for basic "see what files I have on my system," this `ls` alias is good enough to help Linux users get started with FreeDOS.

Similarly, you can create an alias for the FreeDOS `type` command, to act like the Linux `cat` command. Both programs display the contents of a text file. While `type` doesn't support the command-line options you might use under Linux, the basic usage to display a single file will be the same.


```
C:\FDOS&gt;alias cat=type
C:\FDOS&gt;cat version.fdi
PLATFORM=FreeDOS
VERSION=1.3-RC4
RELEASE=2021-04-30
C:\FDOS&gt;
```

### Other Unix-like Commands

FreeDOS includes a selection of other common Unix-like commands, so Linux users will feel more at home. To use these Linux commands on FreeDOS, you may need to install the **Unix Like Tools** package from the **FreeDOS Installer - My Package List Editor Software** (FDIMPLES) package manager.

![Installing the Unix-like package set][2]

Jim Hall, CC-BY SA 4.0

Not all of the Unix-like utilities work _exactly_ like their Linux counterparts. That's why we call them _Unix-like_. You might want to check the compatibility if you're using some esoteric command-line options, but typical usage should be fine. Start with these common Unix-like commands on FreeDOS:

The `cal` command is the standard Unix calendar program. For example, to display the calendar for the current month, just type `cal`. To view a specific month, give the month and year as arguments:


```
C:\&gt;cal 6 1994

      June 1994    
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30      
```

View your disk usage with the `du` command. This is a simple version of the Linux _disk usage_ command and doesn't support any command-line options other than a path.


```
C:\&gt;du -s apps
usage: du (start path)
C:\&gt;du apps
    158784 C:\APPS\FED
         0 C:\APPS
Total from C:\APPS is 158784
C:\&gt;
```

The `head` command displays the first few lines of a file. For example, this is a handy way to determine if a file contains the correct data.


```
C:\&gt;head fdauto.bat
@ECHO OFF
set DOSDIR=C"\FDOS
set LANG=EN
set TZ=UTC
set PATH=%dosdir%\BIN
if exist %dosdir%\LINKS\NUL set PATH=%path%;%dosdir%\LINKS
set NLSPATH=%dosdir%\NLS
set HELPPATH=%dosdir%\HELP
set TEMP=%dosdir%\TEMP
set TMP=%TEMP%
C:\&gt;
```

To view an entire file, use the `more` command, the default file viewer on FreeDOS. This displays a file one screenful at a time, then prints a prompt to press a key before displaying the next screenful of information. The `more` command is a very simple file viewer; for a more full-featured viewer like you might use on Linux, try the `less` command. The `less` command provides the ability to scroll "backwards" through a file, in case you missed something. You can also search for specific text.


```
C:\&gt;less fdauto.bat
@ECHO OFF
set DOSDIR=C"\FDOS
set LANG=EN
set TZ=UTC
set PATH=%dosdir%\BIN
if exist %dosdir%\LINKS\NUL set PATH=%path%;%dosdir%\LINKS
set NLSPATH=%dosdir%\NLS
set HELPPATH=%dosdir%\HELP
set TEMP=%dosdir%\TEMP
set TMP=%TEMP%
[...]
```

If you have a lot of directories in your program path variable (`PATH`) and aren't sure where a certain program is running from, you can use the `which` command. This scans the program path variable, and prints the full location of the program you are looking for.


```
C:\&gt;which less
less    C:\&gt;FDOS\BIN\LESS.EXE
C:\&gt;_
```

FreeDOS 1.3 RC4 includes other Unix-like commands that you might use in other, more specific situations. These include: 

  * **bc**: Arbitrary precision numeric processing language
  * **sed**: Stream editor
  * **grep** and **xgrep**: Search a text file using regular expression
  * **md5sum**: Generate an MD5 signature of a file
  * **nro**: Simple typesetting using nroff macros
  * **sleep**: Pause the system for a few seconds
  * **tee**: Save a copy of a command-line stream
  * **touch**: Modify a file's timestamp
  * **trch**: Translate single characters (like Linux tr)
  * **uptime**: Report how long your FreeDOS system has been running



### FreeDOS at your command

FreeDOS, like Linux and BSD, is open source. Whether you want to challenge yourself by learning a new style of command-line interaction, or you want to fall back on the comfort of familiar Unix-like tools, FreeDOS is a fun and fresh operating system to explore. Give it a try!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-linux-users

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos-fish-laptop-color.png?itok=vfv_Lpph (FreeDOS fish logo and command prompt on computer)
[2]: https://opensource.com/sites/default/files/uploads/unix-like.png (Installing the Unix-like package set)
