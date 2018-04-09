The fc Command Tutorial With Examples For Beginners
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/fc-command-720x340.png)
The **fc** command, short for **f** ix **c** ommands, is a shell built-in command used to list, edit and re-execute the most recently entered commands in to an interactive shell. You can edit the recently entered commands in your favorite editor and run them without having to retype the entire commands. This command can be helpful to correct the spelling mistakes in the previously entered commands and avoids the repetition of long and complicated commands. Since it is shell-builtin, it is available in most shells, including Bash, Zsh, Ksh etc. In this brief tutorial, we are going to learn to use fc command in Linux.

### The fc Command Tutorial With Examples

**List the recently executed commands**

If you run “fc -l” command with no arguments, it will display the last **16** commands.
```
$ fc -l
507 fish
508 fc -l
509 sudo netctl restart wlp9s0sktab
510 ls -l
511 pwd
512 uname -r
513 uname -a
514 touch ostechnix.txt
515 vi ostechnix.txt
516 echo "Welcome to OSTechNix"
517 sudo apcman -Syu
518 sudo pacman -Syu
519 more ostechnix.txt
520 wc -l ostechnix.txt
521 cat ostechnix.txt
522 clear

```

To reverse the order of the commands, use **-r** flag.
```
$ fc -l

```

You can suppress the line numbers using “-n” parameter.
```
$ fc -ln
 nano ~/.profile
 source ~/.profile
 source ~/.profile
 fc -ln
 fc -l
 sudo netctl restart wlp9s0sktab
 ls -l
 pwd
 uname -r
 uname -a
 echo "Welcome to OSTechNix"
 sudo apcman -Syu
 cat ostechnix.txt
 wc -l ostechnix.txt
 more ostechnix.txt
 clear

```

Now you won’t see the line numbers.

To list the result staring from a specific command, simply use the line number along with **-l** option. For instance, to display the commands starting from line number 520 up to the present, we do:
```
$ fc -l 520
520 ls -l
521 pwd
522 uname -r
523 uname -a
524 echo "Welcome to OSTechNix"
525 sudo apcman -Syu
526 cat ostechnix.txt
527 wc -l ostechnix.txt
528 more ostechnix.txt
529 clear
530 fc -ln
531 fc -l

```

To list a commands within a specific range, for example 520 to 525, do:
```
$ fc -l 520 525
520 ls -l
521 pwd
522 uname -r
523 uname -a
524 echo "Welcome to OSTechNix"
525 sudo apcman -Syu

```

Instead of using the line numbers, we can also use strings. For example, list the commands starting from “pwd” command up to the resent, just use the staring letter of that command (i.e **p** ) like below.
```
$ fc -l p
521 pwd
522 uname -r
523 uname -a
524 echo "Welcome to OSTechNix"
525 sudo apcman -Syu
526 cat ostechnix.txt
527 wc -l ostechnix.txt
528 more ostechnix.txt
529 clear
530 fc -ln
531 fc -l
532 fc -l 520
533 fc -l 520 525
534 fc -l 520
535 fc -l 522
536 fc -l l

```

To see everything between “pwd” to “more” command, you could use either:
```
$ fc -l p m

```

Or, use combination of first letter of the starting command command and line number of the ending command:
```
$ fc -l p 528

```

Or, just line numbers of starting and ending commands:
```
$ fc -l 521 528

```

All of these three commands will display the same result.

**Edit and re-run the last command automatically**

At times, you might misspelled a previous command. In such situations, you can easily edit the spelling mistakes of the command using your default editor and execute it without having to retype again.

To edit the last command and re-run it again, do:
```
$ fc

```

This will open your last command in the default editor.

![][2]

As you see in the above screenshot, my last command was “fc -l”. You can make any changes in the command and re-run it automatically again once you save and quit the editor. This can be useful when you use long and complicated commands or arguments. Please be mindful that this also can be a **destructive**. For example, if the previous command was a deadly command like “rm -fr  <some-path>”, it will automatically execute and you may lost your important data. So, be very careful before using command.

**Change the default editor to edit commands**

Another notable option of fc is **“e”** to choose a different editor to edit the commands. For example, we can use “nano” editor to edit the last command like below.
```
$ fc -e nano

```

This command will open the nano editor(instead of the default editor) to edit last command.

![][3]

You may find it time consuming to use **-e** option for each command. To make the new editor as your default, just set the environment variable **FCEDIT** to the name of the editor you want **fc** to use.

For example, to set “nano” as the new default editor, edit your **~/.profile** or environment file:
```
$ vi ~/.profile

```

Add the following line:
```
FCEDIT=nano

```

You can also use the full path of the editor like below.
```
FCEDIT=/usr/local/bin/emacs

```

Type **:wq** to save and close the file. To update the changes, run:
```
$ source ~/.profile

```

Now, you can just type to “fc” to edit the last command using “nano” editor.

**Re-run the last command without editing it**

We already knew if we run “fc” without any arguments, it loads the editor with the most recent command. At times, you may not want to edit, but simply execute the last command. To do so, use hyphen (-) symbol at the end as shown below.
```
$ echo "Welcome to OSTechNix"
Welcome to OSTechNix

$ fc -e -
echo "Welcome to OSTechNix"
Welcome to OSTechNix

```

As you see, fc didn’t edit the last command (i.e echo “Welcome to OSTechNix”) even if I used **-e** option.

Please note that some of the options are shell-specific. They may not work in other shells. For example the following options can be used in **zsh** shell. It won’t work in Bash or Ksh shells.

**Display when the commands were executed**

To view when the commands were run, use **-d** like below.
```
fc -ld
1 18:41 exit
2 18:41 clear
3 18:42 fc -l
4 18:42 sudo netctl restart wlp9s0sktab
5 18:42 ls -l
6 18:42 pwd
7 18:42 uname -r
8 18:43 uname -a
9 18:43 cat ostechnix.txt
10 18:43 echo "Welcome to OSTechNix"
11 18:43 more ostechnix.txt
12 18:43 wc -l ostechnix.txt
13 18:43 cat ostechnix.txt
14 18:43 clear
15 18:43 fc -l

```

Now you see the execution time of most recently executed commands.

We can also display the full timestamp of each command using **-f** option.
```
 fc -lf
 1 4/5/2018 18:41 exit
 2 4/5/2018 18:41 clear
 3 4/5/2018 18:42 fc -l
 4 4/5/2018 18:42 sudo netctl restart wlp9s0sktab
 5 4/5/2018 18:42 ls -l
 6 4/5/2018 18:42 pwd
 7 4/5/2018 18:42 uname -r
 8 4/5/2018 18:43 uname -a
 9 4/5/2018 18:43 cat ostechnix.txt
 10 4/5/2018 18:43 echo "Welcome to OSTechNix"
 11 4/5/2018 18:43 more ostechnix.txt
 12 4/5/2018 18:43 wc -l ostechnix.txt
 13 4/5/2018 18:43 cat ostechnix.txt
 14 4/5/2018 18:43 clear
 15 4/5/2018 18:43 fc -l
 16 4/5/2018 18:43 fc -ld

```

Of course, the European folks can use european date format using **-E** option.
```
 fc -lE
 2 5.4.2018 18:41 clear
 3 5.4.2018 18:42 fc -l
 4 5.4.2018 18:42 sudo netctl restart wlp9s0sktab
 5 5.4.2018 18:42 ls -l
 6 5.4.2018 18:42 pwd
 7 5.4.2018 18:42 uname -r
 8 5.4.2018 18:43 uname -a
 9 5.4.2018 18:43 cat ostechnix.txt
 10 5.4.2018 18:43 echo "Welcome to OSTechNix"
 11 5.4.2018 18:43 more ostechnix.txt
 12 5.4.2018 18:43 wc -l ostechnix.txt
 13 5.4.2018 18:43 cat ostechnix.txt
 14 5.4.2018 18:43 clear
 15 5.4.2018 18:43 fc -l
 16 5.4.2018 18:43 fc -ld
 17 5.4.2018 18:49 fc -lf

```

### TL;DR

  * When running without any arguments, fc will load the most recent command in the default text editor.
  * When running with a numeric argument, fc loads the editor with the command with that specified number.
  * When running with a string argument, fc loads the most recent command starting with that specified string.
  * When running with two arguments to fc , the arguments specify the beginning and end of a range of commands.



For more details, refer man pages.
```
$ man fc

```

And, that’s all for today. Hope you find this article useful. More good stuffs to come. Stay tuned!

Cheers!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/the-fc-command-tutorial-with-examples-for-beginners/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[2]:http://www.ostechnix.com/wp-content/uploads/2018/04/fc-command-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/04/fc-command-2.png
