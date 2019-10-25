[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to program with Bash: Syntax and tools)
[#]: via: (https://opensource.com/article/19/10/programming-bash-part-1)
[#]: author: (David Both https://opensource.com/users/dboth)

How to program with Bash: Syntax and tools
======
Learn basic Bash programming syntax and tools, as well as how to use
variables and control operators, in the first article in this three-part
series.
![bash logo on green background][1]

A shell is the command interpreter for the operating system. Bash is my favorite shell, but every Linux shell interprets the commands typed by the user or sysadmin into a form the operating system can use. When the results are returned to the shell program, it sends them to STDOUT which, by default, [displays them in the terminal][2]. All of the shells I am familiar with are also programming languages.

Features like tab completion, command-line recall and editing, and shortcuts like aliases all contribute to its value as a powerful shell. Its default command-line editing mode uses Emacs, but one of my favorite Bash features is that I can change it to Vi mode to use editing commands that are already part of my muscle memory.

However, if you think of Bash solely as a shell, you miss much of its true power. While researching my three-volume [Linux self-study course][3] (on which this series of articles is based), I learned things about Bash that I'd never known in over 20 years of working with Linux. Some of these new bits of knowledge relate to its use as a programming language. Bash is a powerful programming language, one perfectly designed for use on the command line and in shell scripts.

This three-part series explores using Bash as a command-line interface (CLI) programming language. This first article looks at some simple command-line programming with Bash, variables, and control operators. The other articles explore types of Bash files; string, numeric, and miscellaneous logical operators that provide execution-flow control logic; different types of shell expansions; and the **for**, **while**, and **until** loops that enable repetitive operations. They will also look at some commands that simplify and support the use of these tools.

### The shell

A shell is the command interpreter for the operating system. Bash is my favorite shell, but every Linux shell interprets the commands typed by the user or sysadmin into a form the operating system can use. When the results are returned to the shell program, it displays them in the terminal. All of the shells I am familiar with are also programming languages.

Bash stands for Bourne Again Shell because the Bash shell is [based upon][4] the older Bourne shell that was written by Steven Bourne in 1977. Many [other shells][5] are available, but these are the four I encounter most frequently:

  * **csh:** The C shell for programmers who like the syntax of the C language
  * **ksh:** The Korn shell, written by David Korn and popular with Unix users
  * **tcsh:** A version of csh with more ease-of-use features
  * **zsh:** The Z shell, which combines many features of other popular shells



All shells have built-in commands that supplement or replace the ones provided by the core utilities. Open the shell's man page and find the "BUILT-INS" section to see the commands it provides.

Each shell has its own personality and syntax. Some will work better for you than others. I have used the C shell, the Korn shell, and the Z shell. I still like the Bash shell more than any of them. Use the one that works best for you, although that might require you to try some of the others. Fortunately, it's quite easy to change shells.

All of these shells are programming languages, as well as command interpreters. Here's a quick tour of some programming constructs and tools that are integral parts of Bash.

### Bash as a programming language

Most sysadmins have used Bash to issue commands that are usually fairly simple and straightforward. But Bash can go beyond entering single commands, and many sysadmins create simple command-line programs to perform a series of tasks. These programs are common tools that can save time and effort.

My objective when writing CLI programs is to save time and effort (i.e., to be the lazy sysadmin). CLI programs support this by listing several commands in a specific sequence that execute one after another, so you do not need to watch the progress of one command and type in the next command when the first finishes. You can go do other things and not have to continually monitor the progress of each command.

### What is "a program"?

The Free On-line Dictionary of Computing ([FOLDOC][6]) defines a program as: "The instructions executed by a computer, as opposed to the physical device on which they run." Princeton University's [WordNet][7] defines a program as: "…a sequence of instructions that a computer can interpret and execute…" [Wikipedia][8] also has a good entry about computer programs.

Therefore, a program can consist of one or more instructions that perform a specific, related task. A computer program instruction is also called a program statement. For sysadmins, a program is usually a sequence of shell commands. All the shells available for Linux, at least the ones I am familiar with, have at least a basic form of programming capability, and Bash, the default shell for most Linux distributions, is no exception.

While this series uses Bash (because it is so ubiquitous), if you use a different shell, the general programming concepts will be the same, although the constructs and syntax may differ somewhat. Some shells may support some features that others do not, but they all provide some programming capability. Shell programs can be stored in a file for repeated use, or they may be created on the command line as needed.

### Simple CLI programs

The simplest command-line programs are one or two consecutive program statements, which may be related or not, that are entered on the command line before the **Enter** key is pressed. The second statement in a program, if there is one, might be dependent upon the actions of the first, but it does not need to be.

There is also one bit of syntactical punctuation that needs to be clearly stated. When entering a single command on the command line, pressing the **Enter** key terminates the command with an implicit semicolon (**;**). When used in a CLI shell program entered as a single line on the command line, the semicolon must be used to terminate each statement and separate it from the next one. The last statement in a CLI shell program can use an explicit or implicit semicolon.

### Some basic syntax

The following examples will clarify this syntax. This program consists of a single command with an explicit terminator:


```
[student@studentvm1 ~]$ echo "Hello world." ;
Hello world.
```

That may not seem like much of a program, but it is the first program I encounter with every new programming language I learn. The syntax may be a bit different for each language, but the result is the same.

Let's expand a little on this trivial but ubiquitous program. Your results will be different from mine because I have done other experiments, while you may have only the default directories and files that are created in the account home directory the first time you log into an account via the GUI desktop.


```
[student@studentvm1 ~]$ echo "My home directory." ; ls ;
My home directory.
chapter25   TestFile1.Linux  dmesg2.txt  Downloads  newfile.txt  softlink1  testdir6
chapter26   TestFile1.mac    dmesg3.txt  file005    Pictures     Templates  testdir
TestFile1      Desktop       dmesg.txt   link3      Public       testdir    Videos
TestFile1.dos  dmesg1.txt    Documents   Music      random.txt   testdir1
```

That makes a bit more sense. The results are related, but the individual program statements are independent of each other. Notice that I like to put spaces before and after the semicolon because it makes the code a bit easier to read. Try that little CLI program again without an explicit semicolon at the end:


```
`[student@studentvm1 ~]$ echo "My home directory." ; ls`
```

There is no difference in the output.

### Something about variables

Like all programming languages, the Bash shell can deal with variables. A variable is a symbolic name that refers to a specific location in memory that contains a value of some sort. The value of a variable is changeable, i.e., it is variable.

Bash does not type variables like C and related languages, defining them as integers, floating points, or string types. In Bash, all variables are strings. A string that is an integer can be used in integer arithmetic, which is the only type of math that Bash is capable of doing. If more complex math is required, the [**bc** command][9] can be used in CLI programs and scripts.

Variables are assigned values and can be used to refer to those values in CLI programs and scripts. The value of a variable is set using its name but not preceded by a **$** sign. The assignment **VAR=10** sets the value of the variable VAR to 10. To print the value of the variable, you can use the statement **echo $VAR**. Start with text (i.e., non-numeric) variables.

Bash variables become part of the shell environment until they are unset.

Check the initial value of a variable that has not been assigned; it should be null. Then assign a value to the variable and print it to verify its value. You can do all of this in a single CLI program:


```
[student@studentvm1 ~]$ echo $MyVar ; MyVar="Hello World" ; echo $MyVar ;

Hello World
[student@studentvm1 ~]$
```

_Note: The syntax of variable assignment is very strict. There must be no spaces on either side of the equal (**=**) sign in the assignment statement._

The empty line indicates that the initial value of **MyVar** is null. Changing and setting the value of a variable are done the same way. This example shows both the original and the new value.

As mentioned, Bash can perform integer arithmetic calculations, which is useful for calculating a reference to the location of an element in an array or doing simple math problems. It is not suitable for scientific computing or anything that requires decimals, such as financial calculations. There are much better tools for those types of calculations.

Here's a simple calculation:


```
[student@studentvm1 ~]$ Var1="7" ; Var2="9" ; echo "Result = $((Var1*Var2))"
Result = 63
```

What happens when you perform a math operation that results in a floating-point number?


```
[student@studentvm1 ~]$ Var1="7" ; Var2="9" ; echo "Result = $((Var1/Var2))"
Result = 0
[student@studentvm1 ~]$ Var1="7" ; Var2="9" ; echo "Result = $((Var2/Var1))"
Result = 1
[student@studentvm1 ~]$
```

The result is the nearest integer. Notice that the calculation was performed as part of the **echo** statement. The math is performed before the enclosing echo command due to the Bash order of precedence. For details see the Bash man page and search "precedence."

### Control operators

Shell control operators are one of the syntactical operators for easily creating some interesting command-line programs. The simplest form of CLI program is just stringing several commands together in a sequence on the command line:


```
`command1 ; command2 ; command3 ; command4 ; . . . ; etc. ;`
```

Those commands all run without a problem so long as no errors occur. But what happens when an error occurs? You can anticipate and allow for errors using the built-in **&amp;&amp;** and **||** Bash control operators. These two control operators provide some flow control and enable you to alter the sequence of code execution. The semicolon is also considered to be a Bash control operator, as is the newline character.

The **&amp;&amp;** operator simply says, "if command1 is successful, then run command2. If command1 fails for any reason, then command2 is skipped." That syntax looks like this:


```
`command1 && command2`
```

Now, look at some commands that will create a new directory and—if it's successful—make it the present working directory (PWD). Ensure that your home directory (**~**) is the PWD. Try this first in **/root**, a directory that you do not have access to:


```
[student@studentvm1 ~]$ Dir=/root/testdir ; mkdir $Dir/ &amp;&amp; cd $Dir
mkdir: cannot create directory '/root/testdir/': Permission denied
[student@studentvm1 ~]$
```

The error was emitted by the **mkdir** command. You did not receive an error indicating that the file could not be created because the creation of the directory failed. The **&amp;&amp;** control operator sensed the non-zero return code, so the **touch** command was skipped. Using the **&amp;&amp;** control operator prevents the **touch** command from running because there was an error in creating the directory. This type of command-line program flow control can prevent errors from compounding and making a real mess of things. But it's time to get a little more complicated.

The **||** control operator allows you to add another program statement that executes when the initial program statement returns a code greater than zero. The basic syntax looks like this:


```
`command1 || command2`
```

This syntax reads, "If command1 fails, execute command2." That implies that if command1 succeeds, command2 is skipped. Try this by attempting to create a new directory:


```
[student@studentvm1 ~]$ Dir=/root/testdir ; mkdir $Dir || echo "$Dir was not created."
mkdir: cannot create directory '/root/testdir': Permission denied
/root/testdir was not created.
[student@studentvm1 ~]$
```

This is exactly what you would expect. Because the new directory could not be created, the first command failed, which resulted in the execution of the second command.

Combining these two operators provides the best of both. The control operator syntax using some flow control takes this general form when the **&amp;&amp;** and **||** control operators are used:


```
`preceding commands ; command1 && command2 || command3 ; following commands`
```

This syntax can be stated like so: "If command1 exits with a return code of 0, then execute command2, otherwise execute command3." Try it:


```
[student@studentvm1 ~]$ Dir=/root/testdir ; mkdir $Dir &amp;&amp; cd $Dir || echo "$Dir was not created."
mkdir: cannot create directory '/root/testdir': Permission denied
/root/testdir was not created.
[student@studentvm1 ~]$
```

Now try the last command again using your home directory instead of the **/root** directory. You will have permission to create this directory:


```
[student@studentvm1 ~]$ Dir=~/testdir ; mkdir $Dir &amp;&amp; cd $Dir || echo "$Dir was not created."
[student@studentvm1 testdir]$
```

The control operator syntax, like **command1 &amp;&amp; command2**, works because every command sends a return code (RC) to the shell that indicates if it completed successfully or whether there was some type of failure during execution. By convention, an RC of zero (0) indicates success, and any positive number indicates some type of failure. Some of the tools sysadmins use just return a one (1) to indicate a failure, but many use other codes to indicate the type of failure that occurred.

The Bash shell variable **$?** contains the RC from the last command. This RC can be checked very easily by a script, the next command in a list of commands, or even the sysadmin directly. Start by running a simple command and immediately checking the RC. The RC will always be for the last command that ran before you looked at it.


```
[student@studentvm1 testdir]$ ll ; echo "RC = $?"
total 1264
drwxrwxr-x  2 student student   4096 Mar  2 08:21 chapter25
drwxrwxr-x  2 student student   4096 Mar 21 15:27 chapter26
-rwxr-xr-x  1 student student     92 Mar 20 15:53 TestFile1
&lt;snip&gt;
drwxrwxr-x. 2 student student 663552 Feb 21 14:12 testdir
drwxr-xr-x. 2 student student   4096 Dec 22 13:15 Videos
RC = 0
[student@studentvm1 testdir]$
```

The RC, in this case, is zero, which means the command completed successfully. Now try the same command on root's home directory, a directory you do not have permissions for:


```
[student@studentvm1 testdir]$ ll /root ; echo "RC = $?"
ls: cannot open directory '/root': Permission denied
RC = 2
[student@studentvm1 testdir]$
```

In this case, the RC is two; this means permission was denied for a non-root user to access a directory to which the user is not permitted access. The control operators use these RCs to enable you to alter the sequence of program execution.

### Summary

This article looked at Bash as a programming language and explored its basic syntax as well as some basic tools. It showed how to print data to STDOUT and how to use variables and control operators. The next article in this series looks at some of the many Bash logical operators that control the flow of instruction execution.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/programming-bash-part-1

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://opensource.com/article/18/10/linux-data-streams
[3]: http://www.both.org/?page_id=1183
[4]: https://opensource.com/19/9/command-line-heroes-bash
[5]: https://en.wikipedia.org/wiki/Comparison_of_command_shells
[6]: http://foldoc.org/program
[7]: https://wordnet.princeton.edu/
[8]: https://en.wikipedia.org/wiki/Computer_program
[9]: https://www.gnu.org/software/bc/manual/html_mono/bc.html
