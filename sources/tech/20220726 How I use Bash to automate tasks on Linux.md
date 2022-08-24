[#]: subject: "How I use Bash to automate tasks on Linux"
[#]: via: "https://opensource.com/article/22/7/use-bash-automate-tasks-linux"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I use Bash to automate tasks on Linux
======
Bash has a few handy automation features that make my life easier when working with files on Linux.

![bash logo on green background][1]

Image by: Opensource.com

The Bash command line is a great way to automate tasks. Whether you are running Linux on a server and need to manipulate log files or other data, or you're a desktop user who just wants to keep files tidy, you can use a few automation features in Bash to make your work easier.

### Linux for command: Automate tasks on a files

If you have a bunch of files to work on at once, and you need to do the same thing with every file, use the `for` command. This command iterates across a list of files, and executes one or more commands. The `for` command looks like this:

```
for variable in list
do
    commands
done
```

I've added some extra spacing in there to help separate the different parts of the `for` command. That multi-line command might look difficult to run on the command line, but you can use `;` to put everything on one line, like this:

```
for variable in list ; do commands ; done
```

Let's see it in action. One way I use the `for` command is to rename a bunch of files. Most recently, I had a bunch of screenshots that I wanted to rename. The screenshots had names like `filemgr.png` or `terminal.png` and I wanted to put `screenshot` before each name instead. I ran a single `for` command to rename thirty files at once. Here's an example with just two files:

```
$ ls
filemgr.png  terminal.png
$ for f in *.png ; do mv $f screenshot-$f ; done
$ ls
screenshot-filemgr.png  screenshot-terminal.png
```

The `for` command makes it easy to perform one or more actions on a set of files. You can use a variable name that is meaningful to you, such as `image` or `screenshot`, or you can use a "shorthand" variable like `f`, as I did in my example. When I write scripts that use a `for` loop, I try to use meaningful variable names. But when I'm using `for` on the command line, I'll usually use a short variable name like `f` for files or `d` for directories.

Whatever name you choose for your variable, be sure to reference the variable using `$` in the command. This expands the variable to the name of the file you are acting on. Type `help for` at your Bash prompt to learn more about the `for` command.

### Linux conditional execution (if)

Looping across a set of files with `for` is helpful when you need to do the same thing with every file. But what if you need to do something different for certain files? For that, you need conditional execution with the `if` statement. The `if` statement looks like this:

```
if test
then
    commands
fi
```

You can also do *if/else* tests by using the `else` keyword:

```
if test
then
    commands
else
    commands
fi
```

For more complicated processing, you can use *if/else-if/else* evaluations. I might use this in a script, when I need to automate a job to process a collection of files at once:

```
if test
then
    commands
elif test2
then
    commands
elif test3
then
    commands
else
    commands
fi
```

The `if` command allows you to perform many different tests, such as *if* a file is really a file, or *if* a file is empty (zero size). Type `help test` at your Bash prompt to see the different kinds of tests you can use in an `if` statement.

For example, let's say I wanted to clean up a log directory that had several dozen files in it. A common task in log management is to delete any empty logs, and compress the other logs. The easiest way to tackle this is to just delete the empty files. There isn't an `if` test that exactly matches that, but we have `-s` file to test *if* something is a file, and *if* the file is not empty (it has a size). That's the opposite of what we want, but we can negate the test with `!` to see *if* something is not a file or is empty.

Let's look at an example to see this at work. I've created two test files: one is empty, and the other contains some data. We can use `if` to print the message "empty" *if* the file is empty:

```
$ ls
datafile  emptyfile
$ if [ ! -s datafile ] ; then echo "empty" ; fi
$ if [ ! -s emptyfile ] ; then echo "empty" ; fi
empty
```

We can combine this with for to examine a list of log files to delete the empty files for us:

```
$ ls -l
total 20
-rw-rw-r--. 1 jhall jhall 2 Jul  1 01:02 log.1
-rw-rw-r--. 1 jhall jhall 2 Jul  2 01:02 log.2
-rw-rw-r--. 1 jhall jhall 2 Jul  3 01:02 log.3
-rw-rw-r--. 1 jhall jhall 0 Jul  4 01:02 log.4
-rw-rw-r--. 1 jhall jhall 2 Jul  5 01:02 log.5
-rw-rw-r--. 1 jhall jhall 0 Jul  6 01:02 log.6
-rw-rw-r--. 1 jhall jhall 2 Jul  7 01:02 log.7
$ for f in log.* ; do if [ ! -s $f ] ; then rm -v $f ; fi ; done
removed 'log.4'
removed 'log.6'
$ ls -l
total 20
-rw-rw-r--. 1 jhall jhall 2 Jul  1 01:02 log.1
-rw-rw-r--. 1 jhall jhall 2 Jul  2 01:02 log.2
-rw-rw-r--. 1 jhall jhall 2 Jul  3 01:02 log.3
-rw-rw-r--. 1 jhall jhall 2 Jul  5 01:02 log.5
-rw-rw-r--. 1 jhall jhall 2 Jul  7 01:02 log.7
```

Using the `if` command can add some intelligence to scripts, to perform actions only when needed. I often use `if` in scripts when I need to test *if* a file does or does not exist on my system, or *if* the entry the script is examining is a file or directory. Using `if` allows my script to take different actions as needed.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/use-bash-automate-tasks-linux

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/bash_command_line.png
