Migrating to Linux: The Command Line
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/migrate.jpg?itok=2PBkvV7s)

This is the fourth article in our series on migrating to Linux. If you missed the previous installments, we've covered [Linux for new users][1], [files and filesystems][2], and [graphical environments][3]. Linux is everywhere. It's used to run most Internet services like web servers, email servers, and others. It's also used in your cell phone, your car console, and a whole lot more. So, you might be curious to try out Linux and learn more about how it works.

Under Linux, the command line is very useful. On desktop Linux systems, although the command line is optional, you will often see people have a command line window open alongside other application windows. On Internet servers, and when Linux is running in a device, the command line is often the only way to interact directly with the system. So, it's good to know at least some command line basics.

In the command line (often called a shell in Linux), everything is done by entering commands. You can list files, move files, display the contents of files, edit files, and more, even display web pages, all from the command line.

If you are already familiar with using the command line in Windows (either CMD.EXE or PowerShell), you may want to jump down to the section titled Familiar with Windows Command Line? and read that first.

### Navigating

In the command line, there is the concept of the current working directory (Note: A folder and a directory are synonymous, and in Linux they're usually called directories). Many commands will look in this directory by default if no other directory path is specified. For example, typing ls to list files, will list files in this working directory. For example:
```
$ ls
Desktop Documents Downloads Music Pictures README.txt Videos
```

The command, ls Documents, will instead list files in the Documents directory:
```
$ ls Documents
report.txt todo.txt EmailHowTo.pdf
```

You can display the current working directory by typing pwd. For example:
```
$ pwd
/home/student
```

You can change the current directory by typing cd and then the directory you want to change to. For example:
```
$ pwd
/home/student
$ cd Downloads
$ pwd
/home/student/Downloads
```

A directory path is a list of directories separated by a / (slash) character. The directories in a path have an implied hierarchy, for example, where the path /home/student expects there to be a directory named home in the top directory, and a directory named student to be in that directory home.

Directory paths are either absolute or relative. Absolute directory paths start with the / character.

Relative paths start with either . (dot) or .. (dot dot).  In a path, a . (dot) means the current directory, and .. (dot dot) means one directory up from the current one. For example, ls ../Documents means look in the directory up one from the current one and show the contents of the directory named Documents in there:
```
$ pwd
/home/student
$ ls
Desktop Documents Downloads Music Pictures README.txt Videos
$ cd Downloads
$ pwd
/home/student/Downloads
$ ls ../Documents
report.txt todo.txt EmailHowTo.pdf
```

When you first open a command line window on a Linux system, your current working directory is set to your home directory, usually: /home/<your login name here>. Your home directory is dedicated to your login where you can store your own files.

The environment variable $HOME expands to the directory path to your home directory. For example:
```
$ echo $HOME
/home/student
```

The following table shows a summary of some of the common commands used to navigate directories and manage simple text files.

### Searching

Sometimes I forget where a file resides, or I forget the name of the file I am looking for. There are a couple of commands in the Linux command line that you can use to help you find files and search the contents of files.

The first command is find. You can use find to search for files and directories by name or other attribute. For example, if I forgot where I kept my todo.txt file, I can run the following:
```
$ find $HOME -name todo.txt
/home/student/Documents/todo.txt
```

The find program has a lot of features and options. A simple form of the command is:
find <directory to search> -name <filename>

If there is more than one file named todo.txt from the example above, it will show me all the places where it found a file by that name. The find command has many options to search by type (file, directory, or other), by date, newer than date, by size, and more. You can type:
```
man find
```

to get help on how to use the find command.

You can also use a command called grep to search inside files for specific contents. For example:
```
grep "01/02/2018" todo.txt
```

will show me all the lines that have the January 2, 2018 date in them.

### Getting Help

There are a lot of commands in Linux, and it would be too much to describe all of them here. So the next best step to show how to get help on commands.

The command apropos helps you find commands that do certain things. Maybe you want to find out all the commands that operate on directories or get a list of open files, but you don't know what command to run. So, you can try:
```
apropos directory
```

which will give a list of commands and have the word "directory" in their help text. Or, you can do:
```
apropos "list open files"
```

which will show one command, lsof, that you can use to list open files.

If you know the command you need to use but aren't sure which options to use to get it to behave the way you want, you can use the command called man, which is short for manual. You would use man <command>, for example:
```
man ls
```

You can try man ls on your own. It will give several pages of information.

The man command explains all the options and parameters you can give to a command, and often will even give an example.

Many commands often also have a help option (e.g., ls --help), which will give information on how to use a command. The man pages are usually more detailed, while the --help option is useful for a quick lookup.

### Scripts

One of the best things about the Linux command line is that the commands that are typed in can be scripted, and run over and over again. Commands can be placed as separate lines in a file. You can put #!/bin/sh as the first line in the file, followed by the commands. Then, once the file is marked as executable, you can run the script as if it were its own command. For example,
```
--- contents of get_todays_todos.sh ---
#!/bin/sh
todays_date=`date +"%m/%d/%y"`
grep $todays_date $HOME/todos.txt
```

Scripts help automate certain tasks in a set of repeatable steps. Scripts can also get very sophisticated if needed, with loops, conditional statements, routines, and more. There's not space here to go into detail, but you can find more information about Linux bash scripting online.

Familiar with Windows Command Line?

If you are familiar with the Windows CMD or PowerShell program, typing commands at a command prompt should feel familiar. However, several things work differently in Linux and if you don't understand those differences, it may be confusing.

First, under Linux, the PATH environment variable works different than it does under Windows. In Windows, the current directory is assumed to be the first directory on the path, even though it's not listed in the list of directories in PATH. Under Linux, the current directory is not assumed to be on the path, and it is not explicitly put on the path either. Putting . in the PATH environment variable is considered to be a security risk under Linux. In Linux, to run a program in the current directory, you need to prefix it with ./ (which is the file's relative path from the current directory). This trips up a lot of CMD users. For example:
```
./my_program
```

rather than
```
my_program
```

In addition, in Windows paths are separated by a ; (semicolon) character in the PATH environment variable. On Linux, in PATH, directories are separated by a : (colon) character. Also in Linux, directories in a single path are separated by a / (slash) character while under Windows directories in a single path are separated by a \ (backslash) character. So a typical PATH environment variable in Windows might look like:
```
PATH="C:\Program Files;C:\Program Files\Firefox;"
while on Linux it might look like:
PATH="/usr/bin:/opt/mozilla/firefox"
```

Also note that environment variables are expanded with a $ on Linux, so $PATH expands to the contents of the PATH environment variable whereas in Windows you need to enclose the variable in percent symbols (e.g., %PATH%).

In Linux, options are commonly passed to programs using a - (dash) character in front of the option, while under Windows options are passed by preceding options with a / (slash) character.  So, under Linux, you would do:
```
a_prog -h
```

rather than
```
a_prog /h
```

Under Linux, file extensions generally don't signify anything. For example, renaming myscript to myscript.bat doesn't make it executable. Instead to make a file executable, the file's executable permission flag needs to be set.  File permissions are covered in more detail next time.

Under Linux when file and directory names start with a . (dot) character they are hidden. So, for example, if you're told to edit the file, .bashrc, and you don't see it in your home directory, it probably really is there. It's just hidden. In the command line, you can use option -a on the command ls to see hidden files. For example:
```
ls -a
```

Under Linux, common commands are also different from those in the Windows command line. The following table that shows a mapping from common items used under CMD and the alternative used under Linux.

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/table-2_0.png?itok=NNc8TZFZ)

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/1/migrating-linux-command-line

作者：[John Bonesio][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/johnbonesio
[1]:https://www.linux.com/blog/learn/intro-to-linux/2017/10/migrating-linux-introduction
[2]:https://www.linux.com/blog/learn/intro-to-linux/2017/11/migrating-linux-disks-files-and-filesystems
[3]:https://www.linux.com/blog/learn/2017/12/migrating-linux-graphical-environments
