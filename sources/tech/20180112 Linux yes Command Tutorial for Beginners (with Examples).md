Linux yes Command Tutorial for Beginners (with Examples)
======

Most of the Linux commands you encounter do not depend on other operations for users to unlock their full potential, but there exists a small subset of command line tool which you can say are useless when used independently, but become a must-have or must-know when used with other command line operations. One such tool is **yes** , and in this tutorial, we will discuss this command with some easy to understand examples.

But before we do that, it's worth mentioning that all examples provided in this tutorial have been tested on Ubuntu 16.04 LTS.

### Linux yes command

The yes command in Linux outputs a string repeatedly until killed. Following is the syntax of the command:

```
yes [STRING]...
yes OPTION
```

And here's what the man page says about this tool:
```
Repeatedly output a line with all specified STRING(s), or 'y'.
```

The following Q&A-type examples should give you a better idea about the usage of yes.

### Q1. How yes command works?

As the man page says, the yes command produces continuous output - 'y' by default, or any other string if specified by user. Here's a screenshot that shows the yes command in action:

[![How yes command works][1]][2]

I could only capture the last part of the output as the output frequency was so fast, but the screenshot should give you a good idea about what kind of output the tool produces.

You can also provide a custom string for the yes command to use in output. For example:

```
yes HTF
```

[![Repeat word with yes command][3]][4]

### Q2. Where yes command helps the user?

That's a valid question. Reason being, from what yes does, it's difficult to imagine the usefulness of the tool. But you'll be surprised to know that yes can not only save your time, but also automate some mundane tasks.

For example, consider the following scenario:

[![Where yes command helps the user][5]][6]

You can see that user has to type 'y' for each query. It's in situation like these where yes can help. For the above scenario specifically, you can use yes in the following way:

```
yes | rm -ri test
```

[![yes command in action][7]][8]

So the command made sure user doesn't have to write 'y' each time when rm asked for it. Of course, one would argue that we could have simply removed the '-i' option from the rm command. That's right, I took this example as it's simple enough to make people understand the situations in which yes can be helpful.

Another - and probably more relevant - scenario would be when you're using the fsck command, and don't want to enter 'y' each time system asks your permission before fixing errors.

### Q3. Is there any use of yes when it's used alone?

Yes, there's at-least one use: to tell how well a computer system handles high amount of loads. Reason being, the tool utilizes 100% processor for systems that have a single processor. In case you want to apply this test on a system with multiple processors, you need to run a yes process for each processor.

### Q4. What command line options yes offers?

The tool only offers generic command line options: --help and --version. As the names suggests. the former displays help information related to the command, while the latter one outputs version related information.

[![What command line options yes offers][9]][10]

### Conclusion

So now you'd agree that there could be several scenarios where the yes command would be of help. There are no command line options unique to yes, so effectively, there's no learning curve associated with the tool. Just in case you need, here's the command's [man page][11].


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-yes-command/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/command-tutorial/yes-def-output.png
[2]:https://www.howtoforge.com/images/command-tutorial/big/yes-def-output.png
[3]:https://www.howtoforge.com/images/command-tutorial/yes-custom-string.png
[4]:https://www.howtoforge.com/images/command-tutorial/big/yes-custom-string.png
[5]:https://www.howtoforge.com/images/command-tutorial/rm-ri-output.png
[6]:https://www.howtoforge.com/images/command-tutorial/big/rm-ri-output.png
[7]:https://www.howtoforge.com/images/command-tutorial/yes-in-action.png
[8]:https://www.howtoforge.com/images/command-tutorial/big/yes-in-action.png
[9]:https://www.howtoforge.com/images/command-tutorial/yes-help-version1.png
[10]:https://www.howtoforge.com/images/command-tutorial/big/yes-help-version1.png
[11]:https://linux.die.net/man/1/yes
