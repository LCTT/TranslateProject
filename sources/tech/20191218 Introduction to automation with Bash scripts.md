[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Introduction to automation with Bash scripts)
[#]: via: (https://opensource.com/article/19/12/automation-bash-scripts)
[#]: author: (David Both https://opensource.com/users/dboth)

Introduction to automation with Bash scripts
======
In the first article in this four-part series, learn how to create a
simple shell script and why they are the best way to automate tasks.
![Person using a laptop][1]

Sysadmins, those of us who run and manage Linux computers most closely, have direct access to tools that help us work more efficiently. To help you use these tools to their maximum benefit to make your life easier, this series of articles explores using automation in the form of Bash shell scripts. It covers:

  * The advantages of automation with Bash shell scripts
  * Why using shell scripts is a better choice for sysadmins than compiled languages like C or C++
  * Creating a set of requirements for new scripts
  * Creating simple Bash shell scripts from command-line interface (CLI) programs
  * Enhancing security through using the user ID (UID) running the script
  * Using logical comparison tools to provide execution flow control for command-line programs and scripts
  * Using command-line options to control script functionality
  * Creating Bash functions that can be called from one or more locations within a script
  * Why and how to license your code as open source
  * Creating and implementing a simple test plan



I previously wrote a series of articles about Bash commands and syntax and creating Bash programs at the command line, which you can find in the references section at the end of this article. But this series of four articles is as much about creating scripts (and some techniques that I find useful) as it is about Bash commands and syntax.

### Why I use shell scripts

In Chapter 9 of [_The Linux Philosophy for Sysadmins_][2], I write:

> "A sysadmin is most productive when thinking—thinking about how to solve existing problems and about how to avoid future problems; thinking about how to monitor Linux computers in order to find clues that anticipate and foreshadow those future problems; thinking about how to make [their] job more efficient; thinking about how to automate all of those tasks that need to be performed whether every day or once a year.
>
> "Sysadmins are next most productive when creating the shell programs that automate the solutions that they have conceived while appearing to be unproductive. The more automation we have in place, the more time we have available to fix real problems when they occur and to contemplate how to automate even more than we already have."

This first article explores why shell scripts are an important tool for the sysadmin and the basics of creating a very simple Bash script.

### Why automate?

Have you ever performed a long and complex task at the command line and thought, "Glad that's done. Now I never have to worry about it again!"? I have—frequently. I ultimately figured out that almost everything that I ever need to do on a computer (whether mine or one that belongs to an employer or a consulting customer) will need to be done again sometime in the future.

Of course, I always think that I will remember how I did the task. But, often, the next time is far enough into the future that I forget that I have _ever_ done it, let alone _how_ to do it. I started writing down the steps required for some tasks on bits of paper, then thought, "How stupid of me!" So I transferred those scribbles to a simple notepad application on my computer, until one day, I thought again, "How stupid of me!" If I am going to store this data on my computer, I might as well create a shell script and store it in a standard location, like **/usr/local/bin** or **~/bin**, so I can just type the name of the shell program and let it do all the tasks I used to do manually.

For me, automation also means that I don't have to remember or recreate the details of how I performed the task in order to do it again. It takes time to remember how to do things and time to type in all the commands. This can become a significant time sink for tasks that require typing large numbers of long commands. Automating tasks by creating shell scripts reduces the typing necessary to perform routine tasks.

### Shell scripts

Writing shell programs—also known as scripts—is the best strategy for leveraging my time. Once I write a shell program, I can rerun it as many times as I need to. I can also update my shell scripts to compensate for changes from one release of Linux to the next, installing new hardware and software, changing what I want or need to accomplish with the script, adding new functions, removing functions that are no longer needed, and fixing the not-so-rare bugs in my scripts. These kinds of changes are just part of the maintenance cycle for any type of code.

Every task performed via the keyboard in a terminal session by entering and executing shell commands can and should be automated. Sysadmins should automate everything we are asked to do or decide needs to be done. Many times, doing the automation upfront saves me time the first time.

One Bash script can contain anywhere from a few commands to many thousands. I have written Bash scripts with only one or two commands, and I have written a script with over 2,700 lines, more than half of which are comments.

### Getting started

Here's a trivial example of a shell script and how to create it. In my earlier series on Bash command-line programming, I used the example from every book on programming I have ever read: "Hello world." From the command line, it looks like this:


```
[student@testvm1 ~]$ echo "Hello world"
Hello world
```

By definition, a program or shell script is a sequence of instructions for the computer to execute. But typing them into the command line every time is quite tedious, especially when the programs are long and complex. Storing them in a file that can be executed with a single command saves time and reduces the possibility for errors to creep in.

I recommend trying the following examples as a non-root user on a test system or virtual machine (VM). Although the examples are harmless, mistakes do happen, and being safe is always wise.

The first task is to create a file to contain your program. Use the **touch** command to create the empty file, **hello**, then make it executable:


```
[student@testvm1 ~]$ touch hello
[student@testvm1 ~]$ chmod 774 hello
```

Now, use your favorite editor to add the following line to the file:


```
`echo "Hello world"`
```

Save the file and run it from the command line. You can use a separate shell session to execute the scripts in this series:


```
[student@testvm1 ~]$ ./hello
Hello world!
```

This is the simplest Bash program you may ever create—a single statement in a file. For this exercise, your complete shell script will be built around this simple Bash statement. The function of the program is irrelevant for this purpose, and this simple statement allows you to build a program structure—a template for other programs—without being concerned about the logic of a functional purpose. You can concentrate on the basic program structure and creating your template in a very simple way, and you can create and test the template itself rather than a complex functional program.

### Shebang

The single statement works fine as long as you use Bash or a shell compatible with the commands used in the script. If no shell is specified in the script, the default shell will be used to execute the script commands.

The next task is to ensure that the script will run using the Bash shell, even if another shell is the default. This is accomplished with the shebang line. Shebang is the geeky way to describe the **#!** characters that explicitly specify which shell to use when running the script. In this case, that is Bash, but it could be any other shell. If the specified shell is not installed, the script will not run.

Add the shebang line as the first line of the script, so now it looks like this:


```
#!/usr/bin/bash
echo "Hello world!"
```

Run the script again—you should see no difference in the result. If you have other shells installed (such as ksh, csh, tcsh, zsh, etc.), start one and run the script again.

### Scripts vs. compiled programs

When writing programs to automate—well, everything—sysadmins should always use shell scripts. Because shell scripts are stored in ASCII text format, they can be viewed and modified by humans just as easily as they can by computers. You can examine a shell program and see exactly what it does and whether there are any obvious errors in the syntax or logic. This is a powerful example of what it means to be _open_.

I know some developers consider shell scripts something less than "true" programming. This marginalization of shell scripts and those who write them seems to be predicated on the idea that the only "true" programming language is one that must be compiled from source code to produce executable code. I can tell you from experience that this is categorically untrue.

I have used many languages, including BASIC, C, C++, Pascal, Perl, Tcl/Expect, REXX (and some of its variations, including Object REXX), many shell languages (including Korn, csh and Bash), and even some assembly language. Every computer language ever devised has had one purpose: to allow humans to tell computers what to do. When you write a program, regardless of the language you choose, you are giving the computer instructions to perform specific tasks in a specific sequence.

Scripts can be written and tested far more quickly than compiled languages. Programs usually must be written quickly to meet time constraints imposed by circumstances or the pointy-haired boss. Most scripts that sysadmins write are to fix a problem, to clean up the aftermath of a problem, or to deliver a program that must be operational long before a compiled program could be written and tested.

Writing a program quickly requires shell programming because it enables a quick response to the needs of the customer—whether that is you or someone else. If there are problems with the logic or bugs in the code, they can be corrected and retested almost immediately. If the original set of requirements is flawed or incomplete, shell scripts can be altered very quickly to meet the new requirements. In general, the need for speed of development in the sysadmin's job overrides the need to make the program run as fast as possible or to use as little as possible in the way of system resources like RAM.

Most things sysadmins do take longer to figure out how to do than to execute. Thus, it might seem counterproductive to create shell scripts for everything you do. It takes some time to write the scripts and make them into tools that produce reproducible results and can be used as many times as necessary. The time savings come every time you can run the script without having to figure out (again) how to do the task.

### Final thoughts

This article didn't get very far with creating a shell script, but it did create a very small one. It also explored the reasons for creating shell scripts and why they are the most efficient option for the system administrator (rather than compiled programs).

In the next article, you will begin creating a Bash script template that can be used as a starting point for other Bash scripts. The template will ultimately contain a Help facility, a GNU licensing statement, a number of simple functions, and some logic to deal with those options, as well as others that might be needed for the scripts that will be based on this template.

### Resources 

  * [How to program with Bash: Syntax and tools][3]
  * [How to program with Bash: Logical operators and shell expansions][4]
  * [How to program with Bash: Loops][5]



* * *

_This series of articles is partially based on Volume 2, Chapter 10 of David Both's three-part Linux self-study course, [Using and Administering Linux—Zero to SysAdmin][6]._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/automation-bash-scripts

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: http://www.both.org/?page_id=903
[3]: https://opensource.com/article/19/10/programming-bash-syntax-tools
[4]: https://opensource.com/article/19/10/programming-bash-logical-operators-shell-expansions
[5]: https://opensource.com/article/19/10/programming-bash-loops
[6]: http://www.both.org/?page_id=1183
