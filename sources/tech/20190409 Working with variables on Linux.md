[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Working with variables on Linux)
[#]: via: (https://www.networkworld.com/article/3387154/working-with-variables-on-linux.html#tk.rss_all)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Working with variables on Linux
======
Variables often look like $var, but they also look like $1, $*, $? and $$. Let's take a look at what all these $ values can tell you.
![Mike Lawrence \(CC BY 2.0\)][1]

A lot of important values are stored on Linux systems in what we call “variables,” but there are actually several types of variables and some interesting commands that can help you work with them. In a previous post, we looked at [environment variables][2] and where they are defined. In this post, we're going to look at variables that are used on the command line and within scripts.

### User variables

While it's quite easy to set up a variable on the command line, there are a few interesting tricks. To set up a variable, all you need to do is something like this:

```
$ myvar=11
$ myvar2="eleven"
```

To display the values, you simply do this:

```
$ echo $myvar
11
$ echo $myvar2
eleven
```

You can also work with your variables. For example, to increment a numeric variable, you could use any of these commands:

```
$ myvar=$((myvar+1))
$ echo $myvar
12
$ ((myvar=myvar+1))
$ echo $myvar
13
$ ((myvar+=1))
$ echo $myvar
14
$ ((myvar++))
$ echo $myvar
15
$ let "myvar=myvar+1"
$ echo $myvar
16
$ let "myvar+=1"
$ echo $myvar
17
$ let "myvar++"
$ echo $myvar
18
```

With some of these, you can add more than 1 to a variable's value. For example:

```
$ myvar0=0
$ ((myvar0++))
$ echo $myvar0
1
$ ((myvar0+=10))
$ echo $myvar0
11
```

With all these choices, you'll probably find at least one that is easy to remember and convenient to use.

You can also _unset_ a variable — basically undefining it.

```
$ unset myvar
$ echo $myvar
```

Another interesting option is that you can set up a variable and make it **read-only**. In other words, once set to read-only, its value cannot be changed (at least not without some very tricky command line wizardry). That means you can't unset it either.

```
$ readonly myvar3=1
$ echo $myvar3
1
$ ((myvar3++))
-bash: myvar3: readonly variable
$ unset myvar3
-bash: unset: myvar3: cannot unset: readonly variable
```

You can use any of those setting and incrementing options for assigning and manipulating variables within scripts, but there are also some very useful _internal variables_ for working within scripts. Note that you can't reassign their values or increment them.

### Internal variables

There are quite a few variables that can be used within scripts to evaluate arguments and display information about the script itself.

  * $1, $2, $3 etc. represent the first, second, third, etc. arguments to the script.
  * $# represents the number of arguments.
  * $* represents the string of arguments.
  * $0 represents the name of the script itself.
  * $? represents the return code of the previously run command (0=success).
  * $$ shows the process ID for the script.
  * $PPID shows the process ID for your shell (the parent process for the script).



Some of these variables also work on the command line but show related information:

  * $0 shows the name of the shell you're using (e.g., -bash).
  * $$ shows the process ID for your shell.
  * $PPID shows the process ID for your shell's parent process (for me, this is sshd).



If we throw all of these variables into a script just to see the results, we might do this:

```
#!/bin/bash

echo $0
echo $1
echo $2
echo $#
echo $*
echo $?
echo $$
echo $PPID
```

When we call this script, we'll see something like this:

```
$ tryme one two three
/home/shs/bin/tryme     <== script name
one             <== first argument
two             <== second argument
3               <== number of arguments
one two three           <== all arguments
0               <== return code from previous echo command
10410               <== script's process ID
10109               <== parent process's ID
```

If we check the process ID of the shell once the script is done running, we can see that it matches the PPID displayed within the script:

```
$ echo $$
10109               <== shell's process ID
```

Of course, we're more likely to use these variables in considerably more useful ways than simply displaying their values. Let's check out some ways we might do this.

Checking to see if arguments have been provided:

```
if [ $# == 0 ]; then
    echo "$0 filename"
    exit 1
fi
```

Checking to see if a particular process is running:

```
ps -ef | grep apache2 > /dev/null
if [ $? != 0 ]; then
    echo Apache is not running
    exit
fi
```

Verifying that a file exists before trying to access it:

```
if [ $# -lt 2 ]; then
    echo "Usage: $0 lines filename"
    exit 1
fi

if [ ! -f $2 ]; then
    echo "Error: File $2 not found"
    exit 2
else
    head -$1 $2
fi
```

And in this little script, we check if the correct number of arguments have been provided, if the first argument is numeric, and if the second argument is an existing file.

```
#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 lines filename"
    exit 1
fi

if [[ $1 != [0-9]* ]]; then
    echo "Error: $1 is not numeric"
    exit 2
fi

if [ ! -f $2 ]; then
    echo "Error: File $2 not found"
    exit 3
else
    echo top of file
    head -$1 $2
fi
```

### Renaming variables

When writing a complicated script, it's often useful to assign names to the script's arguments rather than continuing to refer to them as $1, $2, and so on. By the 35th line, someone reading your script might have forgotten what $2 represents. It will be a lot easier on that person if you assign an important parameter's value to $filename or $numlines.

```
#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 lines filename"
    exit 1
else
    numlines=$1
    filename=$2
fi

if [[ $numlines != [0-9]* ]]; then
    echo "Error: $numlines is not numeric"
    exit 2
fi

if [ ! -f $ filename]; then
    echo "Error: File $filename not found"
    exit 3
else
    echo top of file
    head -$numlines $filename
fi
```

Of course, this example script does nothing more than run the head command to show the top X lines in a file, but it is meant to show how internal parameters can be used within scripts to help ensure the script runs well or fails with at least some clarity.

**[ Watch Sandra Henry-Stocker's Two-Minute Linux Tips[to learn how to master a host of Linux commands][3] ]**

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3387154/working-with-variables-on-linux.html#tk.rss_all

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/04/variable-key-keyboard-100793080-large.jpg
[2]: https://www.networkworld.com/article/3385516/how-to-manage-your-linux-environment.html
[3]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
