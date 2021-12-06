[#]: subject: "19 Absolute Simple Things About Linux Terminal Every Ubuntu User Should Know"
[#]: via: "https://itsfoss.com/basic-terminal-tips-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

19 Absolute Simple Things About Linux Terminal Every Ubuntu User Should Know
======

Terminal often intimidates new users. However, once you get to know it, you gradually start liking it. Well, that happens with most Linux users.

Even if you are using Ubuntu as a desktop system, you may have to enter the terminal at times. New users are often clueless about many things. Some knowledge of basic Linux commands always helps in such cases but this article is not about that.

This article focuses on explaining small, basic and often ignored things about using the terminal. This should help new Ubuntu desktop users to know the terminal and use it with slightly more efficiency.

![][1]

The terminal you see is just one of the [various terminal applications][2] available. After all terminal is just a GUI tool that gives you access to a shell where you can run the commands.

Different terminal applications (properly called terminal emulators) look different, have slightly different functions and features (like different keyboard shortcuts, color combination, fonts etc).

This article is specifically focused on the default Ubuntu terminal which is an implementation of the GNOME terminal.

### 1\. Open the terminal with keyboard shortcut

You can [open the terminal in Ubuntu][3] by looking for it in the system menu. However, my favorite way is to use the Ctrl+Alt+T [keyboard shortcut in Ubuntu][4].

```

    Ctrl+Alt+T

```

### 2\. Terminal vs shell vs prompt vs command line

Before you see anything else, you should know the difference between different terminologies that are often (incorrectly) used interchangeably.

![Terminal, prompt and command][5]

Terminal is the graphical application that runs a shell by default.

Shell is difficult to visualize separately from the terminal. The terminal is running a shell, usually Bash shell by default in Ubuntu. Like terminals, there are various shells as well. Bash is the most popular of them all and default shell on most Linux distributions.

The commands you type is interpreted by the shell. Often people think that screen they see in the terminal is the shell. That’s fine for understanding.

Prompt is what you see before the space where you type the commands. There is no set standard for the prompt. In some old terminals, you would just have a blinking cursor to the place where you can type the commands. In Ubuntu terminal, prompt gives you some information which you’ll see in detail in the later sections of this article.

Command line is not something specific to Linux. Every operating system has a command line interface. Many programming languages have command line interface. It’s a term used for the interface where you can run and execute commands.

There is this video by Luke Smith that explains it in detail with examples. I won’t go in details here anymore to keep things on the track.

[Subscribe to It’s FOSS YouTube channel for interesting Linux videos][6]

### 3\. Understanding the prompt

You know it by now. What you see before the space where you type the command is called prompt. It is configurable and looks different in different distributions, terminal applications and shells.

Ubuntu terminal has configured the prompt to show you a few things. You can get the following information at a glance:

  * User name
  * Hostname (name of the computer)
  * Current working directory



A few more things you may wonder about.

The colon (:) in the prompt is a separator to distinguish between hostname and the current location.

Tilde (~) means the home directory of the present user.

For normal users, the prompt ends with dollar ($) symbol. For the root user, it ends with pound or hash (#) symbol. And hence the joke that pound is stronger than dollar.

![][7]

Did you notice that when I switched to the root user, the command prompt looked different without any colors? This is another reminder that prompt is not a standard and is configured explicitly. For normal users, Ubuntu has a different configuration of the prompt than the root.

Simple information like this helps indirectly. In a multi-user environment, you can easily figure out which user you are using right now and if it is a root user. The displayed location is also helpful.

![][8]

### 4\. Directory and files

Two terms you hear the most in Linux are directory and files.

You probably know what a file is but you may get confused with the term ‘directory’. Directory is nothing but folder. It keeps files and folders inside it.

You can go inside the directories but you cannot enter files. You can read files of course.

![][9]

You can use the term ‘folder’ for directory and it should be fine. However, it is better to use ‘directory’ because this is what you’ll see referenced in various tutorials, documents etc. You’ll even find commands like rmdir, mkdir hinting that they deal with directories.

Additional note: Everything is a file in Linux. Even directory is a special kind of file that has the memory address of files and directories inside it. I have explained it in my [article on hard links][10]. You may refer to that if you want to know more on this topic.

### 5\. Path: Absolute and relative

The [directory structure in Linux resembles][11] the root of a tree. Everything starts at root and spreads out from there.

If you have to access a file or directory, you need to tell how to reach its location by providing its ‘path’. This path that is composed of directory names and separators (/). If a path starts with / (i.e., root), it is an absolute path otherwise it is a relative path.

![Path][12]

The absolute path starts from the root and can be easily referenced from anywhere in the system. The relative path depends upon your current location in the directory structure.

![absolute vs relative path][13]

If you are in the location /home/abhishek which has a directory named scripts containing a file my_script.sh and you want the path for this file, its absolute path will be:

```

    /home/abhishek/scripts/my_script.sh

```

Its relative path will be:

```

    scripts/my_script.sh

```

If you change the location, the absolute path of the file remains the same. However, the relative path changes because it is relative to your current path.

![Real examples of how relative path changes with location but absolute path remains the same][14]

### 6\. . and ..

You may often come across . and .. notation while using the Linux terminal.

Single dot (.) means the current directory.

Double dots (..) mean the parent directory (one directory above the current location).

You’ll often use the double dot (..) in relative path or for changing directory. Single dot (.) is also used in relative path but more importantly, you can use it in the commands for specifying the current locations.

![Use of . and ..][15]

### 7\. Understand the command structure

A typical Linux command consists of a command name followed by options and arguments.

```

    command [options] argument

```

Option, as the name suggests, are optional. When used, they might change the output based on their properties.

For example, the cat command is used for viewing files. You can add the option -n and it will display line numbers as well.

Options are not standardized. Usually, they are used as single letter with single dash (-). They may also have two dashes (–) and a word.

Same options may have different meaning in a different command. If you use -n with head command, you specify the number of lines you want to see, not the lines with numbers.

![Same option -n has different use in cat and head commands][16]

In command documentations, _**if you see something between brackets ([]), it indicates that the contents of the bracket are optional.**_

Similarly, arguments are also not standardized. Some commands expect filenames as argument and some may expect directory name or a regular expression.

### 8\. Getting help

As you start using commands, you may remember some of the options of frequently used commands but it is simply not possible for you to remember all the options of any command.

Why? Because a single command may have more than ten or twenty options.

So, what do you do when you cannot recall all the options? You take help. And with help, I do not mean asking a question in It’s FOSS [Linux forum][17]. I ask to use the help option of the command.

Every standard Linux command has a quick help page that can be accessed with -h or –help or both.

```

    command_name -h

```

It gives you a quick glimpse of the command syntax, common options with their meaning and in some cases, command examples.

![The help page of the cat command][18]

If you need more help, you can refer to the [manpage][19] i.e. manual of a command:

```

    man command_name

```

It goes in all of details and could be overwhelming to read and understand. Alternatively, you can always search on the internet for ‘examples of xyz commands in Linux’.

### 9\. Linux is case-sensitive

Linux is case-sensitive. Everything you type in the terminal is case-sensitive. If you do not take that into account, you’ll often run into [bash: command not found][20] or file not found errors.

In the home directory, you have all the folders name starting with the upper case. If you have to switch to the Documents directory, you have to keep the first letter as D and not d. Otherwise, the terminal will complain.

![Linux is case sensitive][21]

You can have two separate files named file.txt and File.txt because for Linux, file and File are not the same.

### 10\. Running shell scripts

You can [run a shell script][22] by specifying the shell:

```

    bash script.sh

```

Or you can execute the shell script like this:

```

    ./script.sh

```

The second one will only work when the file has execute permission. More on [Linux file permission here][23].

![Running bash script][24]

### 11\. Use tab completion instead of typing it all

The Ubuntu terminal is pre-configured with tab completion. This means that if you start writing something in the terminal and then hit tab, it tries to automatically complete it or provide options if there are more than one possible matches.

It works for both commands as well arguments and filenames.

![Tab completion example][25]

This saves a great ton of time because you don’t have to write everything completely.

### 12\. Ctrl+C and Ctrl+V is not for copy pasting in terminal

Ctrl+C, Ctrl+V might be the ‘universal’ keyboard shortcuts for copy paste but it doesn’t work in the Linux terminal.

Linux inherits a lot of stuff from UNIX and in UNIX, Ctrl+C was used for stopping a running process.

Since the Ctrl+C was already taken for stopping a command or process, it cannot be used for copy-paste anymore.

### 13\. You can surely copy paste in the terminal

Don’t worry. You can still [copy paste in the terminal][26]. Again, there is no fixed rule for the copy-paste keyboard shortcuts because it depends on the terminal application you are using or the configuration you have in place.

In Ubuntu terminal, the default keyboard shortcut for copy is Ctrl+Shift+C and for paste, it is Ctrl+Shift+V.

You can use Ctrl+C to copy text and commands from outside the terminal (like a web browser) and paste it using Ctrl+Shift+V. Similarly, you can highlight the text and use Ctrl+Shift+C to copy the text from the terminal and paste it to an editor or other applications using Ctrl+V.

### 14\. Avoid using Ctrl+S in the terminal

Another common mistake beginners do is to use the ‘universal’ Ctrl+S keyboard shortcut for save. If you use Ctrl+S in the terminal, your terminal ‘freezes’.

This is coming from the legacy computing where there was no scope of scrolling back up. Hence, if there were lots of output lines, Ctrl+S was used for stopping the screen so that text on the screen could be read.

You can unfreeze your terminal with Ctrl+Q. But again, avoid using Ctrl+S in the terminal.

### 15\. Pay attention to $ and &lt;&gt; in command examples

If you are referring to some online tutorial or documentation, you’ll see some command examples with text inside &lt;&gt;. This indicates that you need to replace the content along with &lt; and &gt; with a suitable value.

For example, if you see a command like this:

```

    grep -i <search_term> <file_name>

```

You should replace the &lt;search_term&gt; and &lt;file_name&gt; with the respective actual values.

It is and indication that the command is just an example and you have to complete it with actual values.

Another thing to note here is that some tutorials show command examples that start with $ like this:

![dollar symbol at the beginning of command][27]

This is a way for them to indicate that it is command (not command output). But many new Linux users copy the preceding $ along with the actual command and when they paste it in the terminal, it throws error obviously.

So, when you are copying some command, don’t copy the $ if it is there at the beginning. You should also avoid copying random commands for random websites specially when you do not understand what it does.

Since you are reading about copying commands, when you see commands in multiple lines together, you should copy one line at a time and run them on by one:

![Avoid copying multiple commands together][28]

The next section tells you how to run multiple commands in one go.

### 16\. You can run multiple commands at once

You can [run multiple commands at once][29] without user intervention. You might have seen it already as an Ubuntu user in the form of this command:

```

    sudo apt update && sudo apt upgrade

```

There are three different ways to combine commands in the terminal:

; | Command 1 ; Command 2 | Run command 1 first and then command 2
---|---|---
&amp;&amp; | Command 1 &amp;&amp; Command 2 | Run command 2 only if command 1 ends sucessfully
|  |

### 17\. Stop a running Linux command

If a Linux command is running in the foreground, i.e., it is showing output or you cannot enter any other command, you can stop it using the Ctrl+C keys.

I discussed it previously. It comes from the legacy computing days of UNIX.

So, the next time you see a command like top or ping running continuously and you want the terminal control back, just use these two keys:

```

    Ctrl+C

```

![Stop a running program in Linux with Ctrl+C][30]

### 18\. Clear the terminal

When I find that my screen is too cluttered with different kind of output, I clear the terminal screen before starting some other work. It just a habit but I find it helpful.

To clear the terminal, use the command

```

    clear

```

You may also use Ctrl+L [terminal shortcut][31].

### 19\. Exiting the terminal

In a few cases, I have seen people closing the terminal application to exit the session. You could do that but the proper way to exit a terminal is to use the exit command:

```

    exit

```

You may also use the keyboard shortcut Ctrl+D for Ubuntu terminal.

### Conclusion

There are so many additional stuff you can do in the terminal even if you are new to the entire terminal thing. You can:

  * [Run funny Linux commands][32]
  * [Browse the internet in terminal][33]
  * [Play games in terminal][34]



And if you are looking for more, [take a look at][35] [these Linux command tips and use the terminal like a pro][35].

Honestly speaking, there is way too much to talk about. It is difficult to determine what should be considered as absolute basics and what should be left out. For example, I wanted to avoid including the information about paths because it needs detailed explanation but going too much in detail on a single could be overwhelming.

I have passed the stage where small things used to baffle me in the terminal. If you are new to the Linux terminal or if you remember the struggle from your initial Linux days, feel free to suggest any additions to the list. I might update the list with your input.

And if you learned something new, please do mention it in the comments. I would like to see if this article was worth the effort :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/basic-terminal-tips-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/ubuntu-terminal-basic-tips.png?resize=800%2C450&ssl=1
[2]: https://itsfoss.com/linux-terminal-emulators/
[3]: https://itsfoss.com/open-terminal-ubuntu/
[4]: https://itsfoss.com/ubuntu-shortcuts/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/linux-terminal-introduction.png?resize=800%2C450&ssl=1
[6]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/understanding-prompt-ubuntu-terminal.png?resize=800%2C346&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/learning-prompt-ubuntu-terminal.png?resize=800%2C346&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/directory-files-linux.png?resize=800%2C346&ssl=1
[10]: https://linuxhandbook.com/hard-link/
[11]: https://linuxhandbook.com/linux-directory-structure/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/path-linux.webp?resize=800%2C250&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/absolute-vs-relative-path-linux.webp?resize=800%2C500&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/absolute-relative-path-real-examples-800x346.png?resize=800%2C346&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/use-of-single-and-double-dot-in-Linux.png?resize=732%2C272&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/command-structure-example.png?resize=732%2C462&ssl=1
[17]: https://itsfoss.community/
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/cat-command-help-page.png?resize=732%2C614&ssl=1
[19]: https://itsfoss.com/linux-man-page-guide/
[20]: https://itsfoss.com/bash-command-not-found/
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/linux-is-case-sensitive.png?resize=732%2C253&ssl=1
[22]: https://itsfoss.com/run-shell-script-linux/
[23]: https://linuxhandbook.com/linux-file-permissions/
[24]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/run-bash-script.png?resize=732%2C272&ssl=1
[25]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/tab-completion-ubuntu.png?resize=732%2C272&ssl=1
[26]: https://itsfoss.com/copy-paste-linux-terminal/
[27]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/dollar-symbol-at-the-beginning-of-command.png?resize=765%2C256&ssl=1
[28]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/avoid-copying-multiple-commands.png?resize=743%2C242&ssl=1
[29]: https://itsfoss.com/run-multiple-commands-linux/
[30]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/stop-running-program-linux.png?resize=800%2C385&ssl=1
[31]: https://linuxhandbook.com/linux-shortcuts/
[32]: https://itsfoss.com/funny-linux-commands/
[33]: https://itsfoss.com/terminal-web-browsers/
[34]: https://itsfoss.com/best-command-line-games-linux/
[35]: https://itsfoss.com/linux-command-tricks/
