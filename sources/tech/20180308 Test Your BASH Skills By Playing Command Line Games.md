Test Your BASH Skills By Playing Command Line Games
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/Test-your-bash-skills-1-720x340.png)
We tend to learn and remember Linux commands more effectively if we use them regularly in a live scenario. You may forget the Linux commands over a period of time, unless you use them often. Whether you’re newbie, intermediate user, there are always some exciting methods to test your BASH skills. In this tutorial, I am going to explain how to test your BASH skills by playing command line games. Well, technically these are not actual games like Super TuxKart, NFS, or Counterstrike etc. These are just gamified versions of Linux command training lessons. You will be given a task to complete by follow certain instructions in the game itself.

Now, we will see few games that will help you to learn and practice Linux commands in real-time. These are not a time-passing or mind-boggling games. These games will help you to get a hands-on experience of terminal commands. Read on.

### Test BASH Skills with “Wargames”

It is an online game, so you must have an active Internet connection. These games helps you to learn and practice Linux commands in the form of fun-filled games. Wargames are collection of shell games and each game has many levels. You can access the next levels only by solving previous levels. Not to be worried! Each game provides clear and concise instructions about how to access the next levels.

To play the Wargames, go the following link:

![][2]

As you can see, there many shell games listed on the left side. Each shell game has its own SSH port. So, you will have to connect to the game via SSH from your local system. You can find the information about how to connect to each game using SSH in the top left corner of the Wargames website.

For instance, let us play the **Bandit** game. To do so, click on the Bandit link on the Wargames homepage. On the top left corner, you will see SSH information of the Bandit game.

![][3]

As you see in the above screenshot, there are many levels. To go to each level, click on the respective link on the left column. Also, there are instructions for the beginners on the right side. Read them if you have any questions about how to play this game.

Now, let us go to the level 0 by clicking on it. In the next screen, you will SSH information of this level.

![][4]

As you can see on the above screenshot, you need to connect is **bandit.labs.overthewire.org** , on port 2220 via SSH. The username is **bandit0** and the password is **bandit0**.

Let us connect to Bandit game level 0.

Enter the password i.e **bandit0**

Sample output will be:

![][5]

Once logged in, type **ls** command to see what’s in their or go to the **Level 1 page** to find out how to beat Level 1 and so on. The list of suggested command have been provided in every level. So, you can pick and use any suitable command to solve the each level.

I must admit that Wargames are addictive and really fun to solve each level. However some levels are really challenging, so you may need to google to know how to solve it. Give it a try, you will really like it.

### Test BASH Skills with “Terminus” game

This is a yet another browser-based online CLI game which can be used to improve or test your Linux command skills. To play this game, open up your web browser and navigate to the following URL.

Once you entered in the game, you see the instructions to learn how to play it. Unlike Wargames, you don’t need to connect to their game server to play the games. Terminus has a built-in CLI where you can find the instructions about how to play it.

You can look at your surroundings with the command **“ls”** , move to a new location with the command **“cd LOCATION”** , go back with the command **“cd ..”** , interact with things in the world with the command **“less ITEM”** and so on. To know your current location, just type **“pwd”**.

![][6]

### Test BASH Skills with “clmystery” game

Unlike the above games, you can play this game locally. You don’t need to be connected with any remote system. This is completely offline game.

Trust me, this is an interesting game folks. You are going to play a detective role to solve a mystery case by following the given instructions.

First, clone the repository:
```
$ git clone https://github.com/veltman/clmystery.git

```

Or, download it as a zip file from [**here**][7]. Extract it and go to the location where you have the files. Finally, solve the mystery case by reading the “instructions” file.
```
[sk@sk]: clmystery-master>$ ls
cheatsheet.md cheatsheet.pdf encoded hint1 hint2 hint3 hint4 hint5 hint6 hint7 hint8 instructions LICENSE.md mystery README.md solution

```

Here is the instructions to play this game:

There’s been a murder in Terminal City, and TCPD needs your help. You need to help them to figure out who did the crime.

To find out who did it, you need to go to the **‘mystery’** subdirectory and start working from there. You might need to look into all clues at the crime scene (the **‘crimescene’** file). The officers on the scene are pretty meticulous, so they’ve written down EVERYTHING in their officer reports. Fortunately the sergeant went through and marked the real clues with the word “CLUE” in all caps.

If you get stuck at anywhere, open one of the hint files such as hint1, hint2 etc. You can open the hint files using cat command like below.
```
$ cat hint1

$ cat hint2

```

To check your answer or find out the solution, open the file ‘solution’ in the clmystery directory.
```
$ cat solution

```

To get started on how to use the command line, refer **cheatsheet.md** or **cheatsheet.pdf** (from the command line, you can type ‘nano cheatsheet.md’). Don’t use a text editor to view any files except these instructions, the cheatsheet, and hints.

For more details, refer the [**clmystery GitHub**][8] page.

**Recommended read:**

And, that’s all I can remember now. I will keep adding more games if I came across anything in future. Bookmark this link and do visit from time to time. If you know any other similar games, please let me know in the comment section below. I will test and update this guide.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/test-your-bash-skills-by-playing-command-line-games/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/03/Wargames-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/03/Bandit-game.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/03/Bandit-level-0.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/03/Bandit-level-0-ssh-1.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/03/Terminus.png
[7]:https://github.com/veltman/clmystery/archive/master.zip
[8]:https://github.com/veltman/clmystery
