[#]: subject: "Bash Shell Scripting for beginners (Part 2)"
[#]: via: "https://fedoramagazine.org/bash-shell-scripting-for-beginners-part-2/"
[#]: author: "Matthew Darnell https://fedoramagazine.org/author/zexcon/"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Bash Shell Scripting for beginners (Part 2)
======

![][1]

Photo by [N Bandaru][2] on [Unsplash][3]

Welcome to part 2 of Bash Shell Scripting at a beginner level. This article will dive into some more unique aspects of bash scripting. It will continue to use familiar commands, with an explain of anything new, and cover standard output standard input, standard error, the “pipe”, and data redirection.

### Adding comments #

As your scripts get more complicated and functional you will need to add comments to remember what you were doing. If you share your scripts with others, comments will help them understand the thought process and what you intended for your script to do. From the last article recall there were mathematical equations. Some comments have been added in the new version. Notice that in the _learnToScript.sh_ file (reproduced below) the comments are the lines with the hash sign before them. When the script runs these lines do not appear.

```

    #!/bin/bash

    #Let's pick up from our last article. We
    #learned how to use mathematical equations
    #in bash scripting.

    echo $((5+3))
    echo $((5-3))
    echo $((5*3))
    echo $((5/3))

```

```

    [zexcon ~]$ ./learnToScript.sh
    8
    2
    15
    1

```

### Pipe Operator |

We will use another tool called _grep_ to introduce the pipe operator.

> Grep searches one or more input files for lines containing a match to a specified pattern. By default, Grep outputs the matching lines.
>
> <https://www.gnu.org/software/grep/>

Paul W. Frields’ article in the Fedora Magazine provides a good background on _grep_.

> [Command line quick tips: Searching with grep][4]

You will find the pipe key above the Enter key. Enter it by pressing Shift + \\. (English Keyboard)

Now that you are all freshened up on grep, look at an example of the use of the pipe command. At the command line type in _ls -l | grep_ _learn_

```

    [zexcon ~]$ ls -l | grep learn
    -rwxrw-rw-. 1 zexcon zexcon   70 Sep 17 10:10 learnToScript.sh

```

Normally the _ls -l_ command would provide a list of the files on your screen. Here the full results of the _ls_ _-l_ command are piped into the grep command which searches for the string _learn_. Think of the pipe command like a filter. A command is run, in this case _ls -l_, and the results are limited to the files inside your directory. These results are sent via the pipe command to _grep_ which searches for the work _learn_ and only that line appears.

Look at one more example to try and nail this home. The _less_ command will allow you to see the results of a command that would extend beyond one screen size. Here is a quick description from the man pages for the _less_ command.

> Less  is a program similar to more(1), but which allows backward movement in the file as well as
>  forward movement.  Also, less does not have to read the entire input file  before  starting,  so
>  with  large input files it starts up faster than text editors like vi(1).  Less uses termcap (or
>  terminfo on some systems), so it can run on a variety of terminals.  There is even limited  sup‐
>  port  for hardcopy terminals.  (On a hardcopy terminal, lines which should be printed at the top
>  of the screen are prefixed with a caret.)
>
> Fedora 34 Manual(man) Pages

So let’s see what it looks like utilizing the pipe and the _less_ command

```

    [zexcon ~]$ ls -l /etc | less

```

```

    total 1504
    drwxr-xr-x. 1 root root       126 Jul  7 17:46 abrt
    -rw-r--r--. 1 root root        18 Jul  7 16:04 adjtime
    -rw-r--r--. 1 root root      1529 Jun 23  2020 aliases
    drwxr-xr-x. 1 root root        70 Jul  7 17:47 alsa
    drwxr-xr-x. 1 root root        14 Apr 23 05:58 cron.d
    drwxr-xr-x. 1 root root         0 Jan 25  2021 cron.daily
    :
    :

```

The results have been trimmed, here, for readability. Use the arrow keys on the keyboard to scroll up or down. Unlike the command line, where you might miss the top of the results if they scroll off screen, you can control the display. To get out of the _less_ screen tap the _q_ key.

### Standard Output (stdout), &gt;, &gt;&gt;, 1&gt;, and 1&gt;&gt;

The output of a command preceding the &gt; or &gt;&gt; is sent to a file whose name follows. Keep in mind that &gt; and 1&gt; have the same results since the 1 stands for stdout (the standard output). Stdout is assumed if it does not appear. The &gt;&gt; and 1&gt;&gt; will append the data to the end of the file. In each case (&gt; or &gt;&gt;) the file is created if it does not exist.

As an example, say you want to watch the ping command output to see if it dropped a packet. Rather than sit and watch the console, redirect the output to a file. You can come back later and see if packets were dropped. Here is a test of the redirect using _&gt;_.

```

    [zexcon ~]$ ls -l ~ > learnToScriptOutput

```

This takes the normal results you see in the terminal (recall ~ is your home directory) and redirects it to the _learnToScriptOutput_ file. Did you notice that _learnToScriptOutput_ was never created but now the file exists? Kind of cool.

```

    total 128
    drwxr-xr-x. 1 zexcon zexcon   268 Oct  1 16:02 Desktop
    drwxr-xr-x. 1 zexcon zexcon    80 Sep 16 08:53 Documents
    drwxr-xr-x. 1 zexcon zexcon     0 Oct  1 15:59 Downloads
    -rw-rw-r--. 1 zexcon zexcon   685 Oct  4 16:00 learnToScriptAllOutput
    -rw-rw-r--. 1 zexcon zexcon    23 Oct  4 12:42 learnToScriptInput
    -rw-rw-r--. 1 zexcon zexcon     0 Oct  4 16:42 learnToScriptOutput
    -rw-rw-r--. 1 zexcon zexcon    52 Oct  4 16:07 learnToScriptOutputError
    -rwxrw-rw-. 1 zexcon zexcon   477 Oct  4 15:01 learnToScript.sh
    drwxr-xr-x. 1 zexcon zexcon     0 Jul  7 16:04 Videos

```

### Standard Error (stderr), 2&gt;, and 2&gt;&gt;

The error output of a command preceding the &gt; or &gt;&gt; is sent to a file whose name follows. Keep in mind that 2&gt; and 2&gt;&gt; have the same result but the 2&gt;&gt; will append the data to the end of the file. So what is the purpose of these? What if you only want to catch an error. Then the 2&gt; or 2&gt;&gt; is here to help. The 2 indicates the output that would normally go to stderr (standard error). Now put this into practice by listing a non-existent file.

```

    [zexcon ~]$ ls -l /etc/invalidTest 2> learnToScriptOutputError

```

This takes the error results and redirects it to the _learnToScriptOutputError_ file.

```

    ls: cannot access '/etc/invalidTest': No such file or directory

```

### All Output &amp;&gt;, &amp;&gt;&gt; and |&amp;

If you are thinking, I don’t want to write both standard output (stdout) and standard error (stderr) to different files. You are in luck. In Bash 5 the preferred way to redirect both stdout and stderr to the same file is to use &amp;&gt; or, as you might guess, &amp;&gt;&gt; to append to a file.

```

    [zexcon ~]$ ls -l ~ &>> learnToScriptAllOutput
    [zexcon ~]$ ls -l /etc/invalidTest &>> learnToScriptAllOutput

```

After running these commands, the output of both appear in the same file without identifying error or a standard output.

```

    total 128
    drwxr-xr-x. 1 zexcon zexcon   268 Oct  1 16:02 Desktop
    drwxr-xr-x. 1 zexcon zexcon    80 Sep 16 08:53 Documents
    drwxr-xr-x. 1 zexcon zexcon     0 Oct  1 15:59 Downloads
    -rw-rw-r--. 1 zexcon zexcon   685 Oct  4 16:00 learnToScriptAllOutput
    -rw-rw-r--. 1 zexcon zexcon    23 Oct  4 12:42 learnToScriptInput
    -rw-rw-r--. 1 zexcon zexcon     0 Oct  4 16:42 learnToScriptOutput
    -rw-rw-r--. 1 zexcon zexcon    52 Oct  4 16:07 learnToScriptOutputError
    -rwxrw-rw-. 1 zexcon zexcon   477 Oct  4 15:01 learnToScript.sh
    drwxr-xr-x. 1 zexcon zexcon     0 Jul  7 16:04 Videos
    ls: cannot access '/etc/invalidTest': No such file or directory

```

If you are working directly from the command line and looking to pipe all results to another command, you can use |&amp; for this purpose.

```

    [zexcon ~]$ ls -l |& grep learn
    -rw-rw-r--. 1 zexcon zexcon    1197 Oct 18 09:46 learnToScriptAllOutput
    -rw-rw-r--. 1 zexcon zexcon     343 Oct 14 10:47 learnToScriptError
    -rw-rw-r--. 1 zexcon zexcon       0 Oct 14 11:11 learnToScriptOut
    -rw-rw-r--. 1 zexcon zexcon     348 Oct 14 10:27 learnToScriptOutError
    -rwxr-x---. 1 zexcon zexcon     328 Oct 18 09:46 learnToScript.sh
    [zexcon ~]$

```

### Standard Input (stdin)

You have used standard input (stdin) numerous times throughout articles 1 and 2 since your keyboard uses standard input every time you type a key. To give a bit of a change to the usual “it’s your keyboard”, let’s use the _read_ command in a script. The _read_ command, used in the script below, does what it sounds like, reads standard input.

```

    #!/bin/bash

    #Here we are asking a question to prompt the user for standard input. i.e.keyboard
    echo 'Please enter your name.'

    #Here we are reading the standard input and assigning it to the variable name with the read command.
    read name

    #We are now going back to standard output, by using echo and printing your name to the command line.
    echo "With standard input you have told me your name is: $name"

```

This example prompts for input via standard output, for information it obtains from standard input(keyboard), storing it in a variable called _name_ using _read_ and displays the value in _name_ via standard output.

```

    [zexcon@fedora ~]$ ./learnToScript.sh
    Please enter your name.
    zexcon
    With standard input you have told me your name is: zexcon
    [zexcon@fedora ~]$

```

### Into the script…

Now put what has been learned in a script to see how it can be used. The following is a new version of the previous learnToScript.sh file. There are a few added lines. It uses the append options for standard output, standard error and both into one file. It will write the standard output into learnToScriptStandardOutput, standard error into learnToScriptStandardError and both output and error into learnToScriptAllOutput

```

    #!/bin/bash

    #As we know this article is about scripting. So let's
    #use what we learned in a script.

    #Let's get some information from the user and add it to our scripts with stanard input and read

    echo "What is your name? "
    read name


    #Here standard output directed to append a file to learnToScirptStandardOutput
    echo "$name, this will take standard output with append >> and redirect to learnToScriptStandardOutput." 1>> learnToScriptStandardOutput


    #Here we are taking the standard error and appending it to learnToScriptStandardError but to see this we need to #create an error.
    eco "Standard error with append >> redirect to learnToScriptStandardError." 2>> learnToScriptStandardError

    #Here we are going to create an error and a standard output and see they go to the same place.
    echo "Standard output with append >> redirect to learnToScriptAllOutput." &>> learnToScriptAllOutput
    eco "Standard error with append >> redirect to learnToScriptAllOutput." &>> learnToScriptAllOutput

```

This example creates three files in the same directory. The command _echo_ is intentionally typed incorrectly to generate an error. If you check out all three files, you will see one message in learnToScriptStandardOutput, one in learnToScriptStandardError and two in learnToScriptAllOutput. Also notice the script prompts for a name which it writes to the learnToScriptStandardOutput.

# Conclusion

At this point it should start to be clear that anything you can do on the command line you can also do in a script. When writing a script that others might use, documentation is extremely important. Continuing the dive into scripting, the standard output will make more sense as you will be the one generating them. Inside a script you can use the same things used from the command line. The next article will get into functions, loops and things that will continue to build on this foundation.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/bash-shell-scripting-for-beginners-part-2/

作者：[Matthew Darnell][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zexcon/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/10/bash_shell_scripting_pt2-816x345.jpg
[2]: https://unsplash.com/@nbandana?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/shell-scripting?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/command-line-quick-tips-searching-with-grep/
