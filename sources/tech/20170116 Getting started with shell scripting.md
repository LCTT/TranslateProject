hkurj translating
Getting started with shell scripting
============================================================
 ![Getting started with shell scripting](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/osdc_terminals.png?itok=QmkPW7P1 "Getting started with shell scripting")

Image by : 

[ajmexico][1]. Modified by [Jason Baker][2]. [CC BY-SA 2.0][3].

The world's best conceptual introduction to shell scripting comes from an old [AT&T training video][4]. In the video, Brian W. Kernighan (the "K" in **awk**) and Lorinda L. Cherry (co-author of **bc**) demonstrate how one of the founding principles of UNIX was to empower users to leverage existing utilities to create complex and customized tools.

In the words of [Kernighan][5]: "Think of the UNIX system programs basically as [...] building blocks with which you can create things. [...] The notion of pipe-lining is the fundamental contribution of the [UNIX] system; you can take a bunch of programs...and stick them together end to end so that the data flows from the one on the left to the one on the right and the system itself looks after all the connections. The programs themselves don't know anything about the connection; as far as they're concerned, they're just talking to the terminal."

He's talking about giving everyday users the ability to program.

The POSIX operating system is, figuratively, an API for itself. If you can figure out how to complete a task in a POSIX shell, then you can automate that task. That's programming, and the main vehicle for this everyday POSIX programming method is the shell script.

True to its name, the shell _script_ is a line-by-line recipe for what you want your computer to do, just as you would have done it manually.

Because a shell script consists of common, everyday commands, familiarity with a UNIX or Linux (generically known as **POSIX**) shell is helpful. The more you practice using the shell, the easier it becomes to formulate new scripts. It's like learning a foreign language: the more vocabulary you internalize, the easier it is to form complex sentences.

When you open a terminal window, you are opening a _shell_. There are several shells out there, and this tutorial is valid for **bash**, **tcsh**, **ksh**, **zsh**, and probably others. In a few sections, I do provide some bash-specific examples, but the final script abandons those, so you can either switch to bash for the lesson about setting variables, or do some simple [syntax adjustment][6].

If you're new to all of this, just use **bash**. It's a good shell with lots of friendly features, and the default on Linux, Cygwin, WSL, Mac, and an option on BSD.

### Hello world

You can generate your own **hello world** script from a terminal window. Mind your quotation marks; single and double have different effects.

```
$ echo "#\!/bin/sh" > hello.sh
$ echo "echo 'hello world' " >> hello.sh
```

As you can see, writing a shell script consists, with the exception of the first line, of echoing or pasting commands into a text file.

To run the script as an application:

```
$ chmod +x hello.sh
$ ./hello.sh
hello world
```

And that's, more or less, all there is to it!

Now let's tackle something a little more useful.

### Despacer

If there's one thing that confuses the computer and human interaction, it's spaces in file names. You've seen it on the internet: URLs like **http: //example.com/omg%2ccutest%20cat%20photo%21%211.jpg**. Or maybe spaces have tripped you up when running a simple command:

```
$ cp llama pic.jpg ~/photos
cp: cannot stat 'llama': No such file or directory
cp: cannot stat 'pic.jpg': No such file or directory
```

The solution is to "escape" the space with a backslash, or quotation marks:

```
$ touch foo\ bar.txt
$ ls "foo bar.txt"
foo bar.txt
```

Those are important tricks to know, but it gets inconvenient, so why not write a script to remove those annoying spaces from file names?

Create a file to hold the script, starting with a "shebang" (**#!**) to let your system know that the file should run in a shell:

```
$ echo '#!/bin/sh' > despace
```

Good code starts with documentation. Defining the purpose lets us know what to aim for. Here's a good README:

```
despace is a shell script for removing spaces from file names.

Usage:
$ despace "foo bar.txt"
```

Now let's figure out how to do it manually, and build the script as we go.

Assuming you have a file called "foo bar.txt" in an otherwise empty directory, try this:

```
$ ls
hello.sh
foo bar.txt
```

Computers are all about input and output. In this case, the input has been a request to **ls** a specific directory. The output is what you would expect: the name of the file in that directory.

In UNIX, output can be sent as the input of another command through a "pipe." Whatever is on the opposite side of the pipe acts as a sort of filter. The **tr** utility happens to be designed especially to modify strings passed through it; for this task, use the **--delete** option to delete a character defined in quotes.

```
$ ls "foo bar.txt" | tr --delete ' '
foobar.txt
```

Now you have just the output you need.

In the BASH shell, you can store output as a **variable**. Think of a variable as an empty box into which you place information for storage:

```
$ NAME=foo
```

When you need the information back, you can look in the box by referencing a variable name preceded by a dollar sign (**$**).

```
$ echo $NAME
foo
```

To get the output of your despacing command and set it aside for later, use a variable. To place the _results_ of a command into a variable, use backticks:

```
$ NAME=`ls "foo bar.txt" | tr -d ' '`
$ echo $NAME
foobar.txt
```

This gets you halfway to your goal, you have a method to determine the destination filename from the source filename.

So far, the script looks like this:

```
#!/bin/sh

NAME=`ls "foo bar.txt" | tr -d ' '`
echo $NAME
```

The second part of the script must perform the renaming. You probably already now that command:

```
$ mv "foo bar.txt" foobar.txt
```

However, remember in the script that you're using a variable to hold the destination name. You do know how to reference variables:

```
#!/bin/sh

NAME=`ls "foo bar.txt" | tr -d ' '`
echo $NAME
mv "foo bar.txt" $NAME
```

You can try out your first draft by marking it executable and running it in your test directory. Make sure you have a test file called "foo bar.txt" (or whatever you use in your script).

```
$ touch "foo bar.txt"
$ chmod +x despace
$ ./despace
foobar.txt
$ ls
foobar.txt
```

### Despacer v2.0

The script works, but not exactly as your documentation describes. It's currently very specific, and only works on a file called **foo\ bar.txt**, and nothing else.

A POSIX command refers to itself as **$0** and to anything typed after it, sequentially, as **$1**, **$2**, **$3**, and so on. Your shell script counts as a POSIX command, so try swapping out **foo\ bar.txt** with **$1**.

```
#!/bin/sh

NAME=`ls $1 | tr -d ' '`
echo $NAME
mv $1 $NAME
```

Create a few new test files with spaces in the names:

```
$ touch "one two.txt"
$ touch "cat dog.txt"
```

Then test your new script:

```
$ ./despace "one two.txt"
ls: cannot access 'one': No such file or directory
ls: cannot access 'two.txt': No such file or directory
```

Looks like you've found a bug!

The bug is not actually a bug, as such; everything is working as designed, but not how you want it to work. Your script is "expanding" the **$1** variable to exactly what it is: "one two.txt", and along with that comes that bothersome space you're trying to eliminate.

The answer is to wrap the variable in quotations the same way you wrap filenames in quotes:

```
#!/bin/sh

NAME=`ls "$1" | tr -d ' '`
echo $NAME
mv "$1" $NAME
```

Another test or two:

```
$ ./despace "one two.txt"
onetwo.txt
$ ./despace c*g.txt
catdog.txt
```

This script acts the same as any other POSIX command. You can use it in conjunction with other commands just as you would expect to be able to use any POSIX utility. You can use it in conjunction with a command:

```
$ find ~/test0 -type f -exec /path/to/despace {} \;
```

Or you can use it as a part of a loop:

`$ for FILE in ~/test1/* ; do /path/to/despace $FILE ; done`

and so on.

### Despacer v2.5

The despace script is functional, but technically it could be optimized, and it could use a few usability improvements.

First of all, the variable is actually not needed. The shell can calculate the required information all in one go.

POSIX shells have an order of operations. The same way you, in math, solve for statements in brackets first, the shell resolves statements in backticks (**`**), or **$()** in BASH, before executing a command. Therefore, the statement:

```
$ mv foo\ bar.txt `ls foo\ bar.txt | tr -d ' '`
```

gets transformed into:

```
$ mv foo\ bar.txt foobar.txt
```

and then the actual **mv** command is performed, leaving us with just **foobar.txt**.

Knowing this, you can condense the shell script into:

```
#!/bin/sh

mv "$1" `ls "$1" | tr -d ' '`
```

That looks disappointingly simple. You might think that reducing it to a one-liner makes the script unnecessary, but shell scripts don't have to have lots of lines to be useful. A script that saves typing even a simple command can still save you from deadly typos, which is especially important when moving files is involved.

Besides, your script can still use improvement. Additional testing reveals a few weak points. For example, running **despace** with no argument renders an unhelpful error:

```
$ ./despace
ls: cannot access '': No such file or directory

mv: missing destination file operand after ''
Try 'mv --help' for more information.
```

These errors are confusing because they're for **ls** and **mv**, but as far as users know, it wasn't **ls** or **mv**, but **despace**, that they ran.

If you think about it, this little script shouldn't even attempt to rename a file if it didn't get a file as part of the command in the first place, so try using what you know about variables along with the **test** function.

### If and test

The **if** statement is what turns your little despace utility from a script into a program. This is serious code territory, but don't worry, it's also pretty easy to understand and use.

An **if** statement is a kind of switch; if something is true, then you'll do one thing, and if it's false, you'll do something different. This if-then instruction is exactly the kind of binary decision making computers are best at; all you have to do is define for the computer what needs to be true or false and what to do as a result.

The easiest way you test for True or False is the **test** utility. You don't call it directly, you use its syntax. Try this in a terminal:

```
$ if [ 1 == 1 ]; then echo "yes, true, affirmative"; fi
yes, true, affirmative
$ if [ 1 == 123 ]; then echo "yes, true, affirmative"; fi
$
```

That's how **test** works. You have all manner of shorthand to choose from, and the one you'll use is the **-z** option, which detects if the length of a string of characters is zero (0). The idea translates in your despace script as:

```
#!/bin/sh

if [ -z "$1" ]; then
   echo "Provide a \"file name\", using quotes to nullify the space."
   exit 1
fi

mv "$1" `ls "$1" | tr -d ' '`
```

The **if** statement is broken into separate lines for readability, but the concept remains: if the data inside the **$1** variable is empty (zero characters are present), then print an error statement.

Try it:

```
$ ./despace
Provide a "file name", using quotes to nullify the space.
$
```

Success!

Well, actually it was a failure, but it was a _pretty_ failure, and more importantly, a _helpful_ failure.

Notice the statement **exit 1**. This is a way for POSIX applications to send an alert to the system that it has encountered an error. This capability is important for yourself and for other people who may want to use despace in scripts that depend on despace succeeding in order for everything else to happen correctly.

The final improvement is to add something to protect the user from overwriting files accidentally. Ideally, you'd pass this option through to the script so that it's optional, but for the sake of simplicity, you'll hard code it. The **-i** option tells **mv** to ask for permission before overwriting a file that already exists:

```
#!/bin/sh

if [ -z "$1" ]; then
   echo "Provide a \"file name\", using quotes to nullify the space."
   exit 1
fi

mv -i "$1" `ls "$1" | tr -d ' '`
```

Now your shell script is helpful, useful, and friendly—and you're a programmer, so don't stop now. Learn new commands, use them in your terminal, take note of what you do, and then script it. Eventually, you'll put yourself out of a job, and the rest of your life will be spent relaxing while your robotic minions run shell scripts.

Happy hacking!

--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/penguinmedallion200x200.png?itok=ROQSR50J)

Seth Kenlon is an independent multimedia artist, free culture advocate, and UNIX geek. He is one of the maintainers of the Slackware-based multimedia production project, http://slackermedia.ml

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/getting-started-shell-scripting

作者：[Seth Kenlon ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/seth
[1]:https://www.flickr.com/photos/15587432@N02/3281139507/
[2]:https://opensource.com/users/jason-baker
[3]:https://creativecommons.org/licenses/by/2.0/
[4]:https://youtu.be/XvDZLjaCJuw
[5]:https://youtu.be/tc4ROCJYbm0
[6]:http://hyperpolyglot.org/unix-shells
