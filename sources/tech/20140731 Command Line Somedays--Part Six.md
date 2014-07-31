Command Line “Somedays” – Part Six
================================================================================
Hey guys. Yes, it’s Wednesday, and yes, we’re a day late. Reason? [This awesome announcement][1], that had to take the whole glory of Tuesday. Also, in the future, if there’s an important announcement/release announcement from the project, the CLT series will be postponed.

Anyway, let’s move on to our today’s agenda: The input/output redirection.

Most commands we have used, post their results in the terminal display. But, we can also make them display it in a file, device or input of other commands by **redirecting them**.

### Standard output ###

So, how it basically works is that command line programs usually send the results of commands to a facility called standard output. The standard output then usually sends it to your display, so you can read off of it. But, you can also make it display the results in a text file, like this, using the ‘>’ character (my case):

    man zypper > man.txt

What I did here, is I wanted a man page for zypper. But I wanted it in a text file, so I can easily access the results in case I need them (asking for help on the forums, IRC, f.ex.). So what this command did is that it saved the output of man zypper to man.txt in my home folder, which you can see here, opened in gedit (click to enlarge):

![](https://news.opensuse.org/wp-content/uploads/2014/07/Zaslonska-slika-2014-07-30-103144.png)

If I should repeat the command, or use different commands with the same file name output, it would rewrite the file over and over again. So, in that case, if I’d like to have the output redirection append the next results to the existing file, the only thing I have to do is use ‘>>’ instead of ‘>’ the next time.

### Standard input ###

Many commands can also accept input from a facility called standard input. By default, it comes from a keyboard, but it can also come from a file. To redirect it, use the inverted character from the one before: ‘**<**’

The example given is the following:

    sort < man.txt

### Pipeline ###

To connect multiple commands together, you use pipelines. What pipelines do, is feed the standard output of one command into the standard input of the other command. Mr Shotts’ favorite:

    ls – l | less

By using this'| less' trick, you can make any command have scrolling output.
Filters

### Filters ###

Filters is a commonly used program in pipelines. Filters take a standard input, perform an operation on it, and send the results to the standard output. They can process information in a very powerful way. Here’s a list of the programs, most commonly used as filters. For exercise, look up, or redirect man pages to them to a file!

Filters: sort, uniq, grep (we’ve all seen this one appear all over forums, so I suggest we look into it more), fmt, pr, head, tail, tr, sed, awk.

### Finito ###

Once again, halting to a stop for this week. We have only a couple of lessons left, to cover the basics of the CLI, and by the time autumn comes, I hope you’ll be all interested in CLI a little more and continue with some winter explorations! And while doing it, I hope you’ll…

**…have a lot of fun!**

--------------------------------------------------------------------------------

via: https://news.opensuse.org/2014/07/30/command-line-somedays-part-six/

作者：[Nenad Latinović][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://news.opensuse.org/author/holden87/
[1]:https://news.opensuse.org/2014/07/29/factory-rolling-release/