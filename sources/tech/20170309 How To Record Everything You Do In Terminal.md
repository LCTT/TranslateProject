How To Record Everything You Do In Terminal
======
![](https://www.ostechnix.com/wp-content/uploads/2017/03/Record-Everything-You-Do-In-Terminal-720x340.png)

A few days ago, we published a guide that explained how to [**save commands in terminal itself and use them on demand**][1]. It is very useful for those who don’t want to memorize a lengthy Linux command. Today, in this guide, we are going to see how to record everything you do in Terminal using **‘script’** command. You might have run a command, or created a directory, or installed an application in Terminal. Script command simply saves whatever you do in the Terminal. You can then view them if you want to know what you did few hours or few days ago. I know I know, we can use UP/DOWN arrow keys or history command to view previously running commands. However, you can’t view the output of those commands. But, Script command records and displays complete terminal session activities.

The script command creates a typescript of everything you do in the Terminal. It doesn’t matter whether you install an application, create a directory/file, remove a folder. Everything will be recorded, including the commands and the respective outputs. This command will be helpful who wants a hard-copy record of an interactive session as proof of an assignment. Whether you’re a student or a tutor, you can make a copy of everything you do in the Terminal along with all outputs.

### Record Everything You Do In Terminal using script command in Linux

The script command comes pre-installed on most modern Linux operating systems. So, let us not bother about the installation.

Let us go ahead and see how to use it in real time.

Run the following command to start the Terminal session recording.
```
$ script -a my_terminal_activities

```

Where, **-a** flag is used to append the output to file or to typescript, retaining the prior contents. The above command records everything you do in the Terminal and append the output to a file called **‘my_terminal_activities’** and save it in your current working directory.

Sample output would be:
```
Script started, file is my_terminal_activities

```

Now, run some random Linux commands in your Terminal.
```
$ mkdir ostechnix

$ cd ostechnix/

$ touch hello_world.txt

$ cd ..

$ uname -r

```

After running all commands, end the ‘script’ command’s session using command:
```
$ exit

```

**Sample output:**
```
exit
Script done, file is my_terminal_activities

```

As you see, the Terminal activities have been stored in a file called **‘my_terminal_activities’** and saves it in the current working directory.

To view your Terminal activities, just open this file in any editor or simply display it using the ‘cat’ command.
```
$ cat my_terminal_activities

```

**Sample output:**

As you see in the above output, script command has recorded all my Terminal activities, including the start and end time of the script command. Awesome, isn’t it? The reason to use script command is it’s not just records the commands, but also the commands’ output as well. To put this simply, Script command will record everything you do on the Terminal.

### Conclusion

Like I said, script command would be useful for students, teachers and any Linux users who wants to keep the record of their Terminal activities. Even though there are many CLI and GUI to do this, script command is an easiest and quickest way to record the Terminal session activities.

And, that’s all. Hope this helps. If you find this guide useful, please share it on your social, professional networks and **support OSTechNix**.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/record-everything-terminal/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/save-commands-terminal-use-demand/
