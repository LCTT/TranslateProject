[#]: subject: (Set your path in FreeDOS)
[#]: via: (https://opensource.com/article/21/2/path-freedos)
[#]: author: (Kevin O'Brien https://opensource.com/users/ahuka)
[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Set your path in FreeDOS
======
Learn about your FreeDOS path, how to set it, and how to use it.
![Looking at a map for career journey][1]

Everything you do in the open source [FreeDOS][2] operating system is done from the command line. The command line begins with a _prompt_, which is the computer's way of saying, "I'm ready. Give me something to do." You can configure your prompt's appearance, but by default, it's:


```
`C:\>`
```

From the command line, you can do two things: Run an internal command or run a program. External commands are programs found in separate files in your `FDOS` directory, so running programs includes running external commands. It also means running the application software you use to do things with your computer. You can also run a batch file, but in that case, all you're doing is running a series of commands or programs that are listed in the batch file.

### Executable application files

FreeDOS can run three types of application files:

  1. **COM** is a file in machine language less than 64KB in size.
  2. **EXE** is a file in machine language that can be larger than 64KB. EXE files also have information at the beginning of the file telling DOS what type of file it is and how to load and run it.
  3. **BAT** is a _batch file_ written with a text editor in ASCII text format containing FreeDOS commands that are executed in batch mode. This means each command is executed in sequence until the file ends.



If you enter an application name that FreeDOS does not recognize as either an internal command or a program, you get the error message _Bad command or filename_. If you see this error, it means one of three things:

  1. The name you gave is incorrect for some reason. Possibly you misspelled the file name, or maybe you're using the wrong command name. Check the name and the spelling and try again.
  2. Maybe the program you are trying to run is not installed on the computer. Verify that it is installed.
  3. The file does exist, but FreeDOS doesn't know where to find it.



The final item on this list is the subject of this article, and it's referred to as the `PATH`. If you're used to Linux or Unix already, you may already understand the concept of [the PATH variable][3]. If you're new to the command line, the path is an important thing to get comfortable with.

### The path

When you enter the name of an executable application file, FreeDOS has to find it. FreeDOS looks for the file in a specific hierarchy of locations:

  1. First, it looks in the active directory of the current drive (called the _working directory_). If you're in the directory `C:\FDOS`, and you type in the name `FOOBAR.EXE`, FreeDOS looks in `C:\FDOS` for a file with that name. You don't even need to type in the entire name. If you type in `FOOBAR`, FreeDOS looks for any executable file with that name, whether it's `FOOBAR.EXE`, `FOOBAR.COM`, or `FOOBAR.BAT`. Should FreeDOS find a file matching that name, it runs it.
  2. If FreeDOS does not find a file with the name you've entered, it consults something called the `PATH`. This is a list of directories that DOS has been instructed to check whenever it cannot find a file in the current active directory.



You can see your computer's path at any time by using the `PATH` command. Just type `path` at the FreeDOS prompt, and FreeDOS returns your path setting:


```
C:\&gt;path
PATH=C:\FDOS\BIN
```

The first line is the prompt and the command, and the second line is what the computer returned. You can see that the first place DOS looks is `FDOS\BIN`, which is located on the `C` drive. If you want to change your path, you can enter a path command and the new path you want to use:


```
`C:\>path=C:\HOME\BIN;C:\FDOS\BIN`
```

In this example, I set my path to my personal `BIN` folder, which I keep in a custom directory called `HOME`, and then to `FDOS\BIN`. Now when you check your path:


```
C:\&gt;path
PATH=C:\HOME\BIN;C:\FDOS\BIN
```

The path setting is processed in the order that directories are listed.

You may notice that some characters are lower case and some upper case. It really doesn't matter which you use. FreeDOS is not case-sensitive and treats everything as an upper-case letter. Internally, FreeDOS uses all upper-case letters, which is why you see the output from your commands in upper case. If you type commands and file names in lower case, a converter automatically converts them to upper case, and they are executed.

Entering a new path replaces whatever the path was set to previously.

### The autoexec.bat file

The next question you might have is where that first path, the one FreeDOS uses by default, came from. That, along with several other important settings, is defined in the `AUTOEXEC.BAT` file located at the root of your `C` drive. This is a batch file that automatically executes (hence the name) when you start FreeDOS. You can edit this file with the FreeDOS program `EDIT`. To see or edit the contents of this file, enter the following command:


```
`C:\>edit autoexec.bat`
```

This line appears near the top:


```
`SET PATH=%dosdir%\BIN`
```

This line defines the value of the default path.

After you look at `AUTOEXEC.BAT`, you can exit the EDIT application by pressing the following keys in order:

  1. Alt
  2. f
  3. x



You can also use the keyboard shortcut **Alt**+**X**.

### Using the full path

If you forget to include `C:\FDOS\BIN` in your path, you won't have immediate access to any of the applications stored there because FreeDOS won't know where to find them. For instance, imagine I set my path to my personal collection of applications:


```
`C:\>path=C:\HOME\BIN`
```

Applications built into the command line still work:


```
C:\cd HOME
C:\HOME&gt;dir
ARTICLES
BIN
CHEATSHEETS
GAMES
DND
```

However, external commands fail:


```
C:HOME\ARTICLES&gt;BZIP2 -c example.txt
Bad command or filename - "BZIP2"
```

You can always execute a command that you know is on your system but not in your path by providing the _full path_ to the file:


```
C:HOME\ARTICLES&gt;C:\FDOS\BIN\BZIP2 -c example.txt
C:HOME\ARTICLES&gt;DIR
example.txb
```

You can execute applications from external media or other directories the same way.

### FreeDOS path

Generally, you probably want to keep `C:\PDOS\BIN` in your path because it contains all the default applications distributed with FreeDOS.

Unless you change the path in `AUTOEXEC.BAT`, the default path is restored after a reboot.

Now that you know how to manage your path in FreeDOS, you can execute commands and maintain your working environment in whatever way works best for you.

* * *

_Thanks to [DOS Lesson 5: The Path][4] (published under a CC BY-SA 4.0 license) for some of the information in this article._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/path-freedos

作者：[Kevin O'Brien][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ahuka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/career_journey_road_gps_path_map_520.png?itok=PpL6jJgY (Looking at a map for career journey)
[2]: https://www.freedos.org/
[3]: https://opensource.com/article/17/6/set-path-linux
[4]: https://www.ahuka.com/dos-lessons-for-self-study-purposes/dos-lesson-5-the-path/
