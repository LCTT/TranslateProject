[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Intro to the Linux command line)
[#]: via: (https://www.networkworld.com/article/3518440/intro-to-the-linux-command-line.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Intro to the Linux command line
======
Here are some warm-up exercises for anyone just starting to use the Linux command line. Warning: It can be addictive.
[Sandra Henry-Stocker / Linux][1] [(CC0)][2]

If you’re new to Linux or have simply never bothered to explore the command line, you may not understand why so many Linux enthusiasts get excited typing commands when they’re sitting at a comfortable desktop with plenty of tools and apps available to them. In this post, we’ll take a quick dive to explore the wonders of the command line and see if maybe we can get you hooked.

First, to use the command line, you have to open up a command tool (also referred to as a “command prompt”). How to do this will depend on which version of Linux you’re running. On RedHat, for example, you might see an Activities tab at the top of your screen which will open a list of options and a small window for entering a command (like “cmd” which will open the window for you). On Ubuntu and some others, you might see a small terminal icon along the left-hand side of your screen. On many systems, you can open a command window by pressing the **Ctrl+Alt+t** keys at the same time.

You will also find yourself on the command line if you log into a Linux system using a tool like PuTTY.

[][3]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][3]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

Once you get your command line window, you’ll find yourself sitting at a prompt. It could be just a **$** or something as elaborate as “**user@system:~$**” but it means that the system is ready to run commands for you.

Once you get this far, it will be time to start entering commands. Below are some of the commands to try first, and [here is a PDF][4] of some particularly useful commands and a two-sided command cheatsheet suitable for printing out and laminating.

```
Command          What it does
pwd             show me where I am in the file system (initially, this will be your
                home directory)
ls              list my files
ls -a           list even more of my files (including those that start with a period)
ls -al          list my files with lots of details (including dates, file sizes and
                permissions)
who             show me who is logged in (don’t be disappointed if it’s only you)
date            remind me what day today is (shows the time too)
ps              list my running processes (might just be your shell and the “ps”
                command)
```

Once you’ve gotten used to your Linux home from the command line point of view, you can begin to explore. Maybe you’ll feel ready to wander around the file system with commands like these:

```
Command            What it does
cd /tmp         move to another directory (in this case, /tmp)
ls              list files in that location
cd              go back home (with no arguments, cd always takes you back to your home
                directory)
cat .bashrc     display the contents of a file (in this case, .bashrc)
history         show your recent commands
echo hello      say “hello” to yourself
cal             show a calendar for the current month
```

To get a feeling for why more advanced Linux users like the command line so much, you will want to try some other features – like redirection and pipes. Redirection is when you take the output of a command and drop it into a file instead of displaying it on your screen. Pipes are when you take the output of one command and send it to another command that will manipulate it in some way. Here are commands to try:

[[Get regularly scheduled insights by signing up for Network World newsletters.]][5]

```
Command                           What it does
echo “echo hello” > tryme    create a new file and put the words “echo hello” into
                                it
chmod 700 tryme                 make the new file executable
tryme                           run the new file (it should run the command it
                                contains and display “hello”)
ps aux                          show all running processes
ps aux | grep $USER             show all running processes, but limit the output to
                                lines containing your username
echo $USER                      display your username using an environment variable
whoami                          display your username with a command
who | wc -l                     count how many users are currently logged in
```

### Wrap-Up

Once you get used to the basic commands, you can explore other commands and try your hand at writing scripts. You might find that Linux is a lot more powerful and nice to use than you ever imagined.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3518440/intro-to-the-linux-command-line.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://commons.wikimedia.org/wiki/File:Tux.svg
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: https://www.networkworld.com/article/3391029/must-know-linux-commands.html
[5]: https://www.networkworld.com/newsletters/signup.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
