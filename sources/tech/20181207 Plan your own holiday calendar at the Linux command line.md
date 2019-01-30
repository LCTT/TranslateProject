[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Plan your own holiday calendar at the Linux command line)
[#]: via: (https://opensource.com/article/18/12/linux-toy-cal)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

Plan your own holiday calendar at the Linux command line
======
Link commands together to build a colorful calendar, and then whisk it away in a snowstorm.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-cal.png?itok=S0F8RY9k)

Welcome to today's installment of the Linux command-line toys advent calendar. If this is your first visit to the series, you might be asking yourself, what’s a command-line toy. Even I'm not quite sure, but generally, it could be a game or any simple diversion that helps you have fun at the terminal.

It's quite possible that some of you will have seen various selections from our calendar before, but we hope there’s at least one new thing for everyone.

We've somehow made it to the seventh day of our series without creating an actual calendar to celebrate with, so let's use a command-line tool to do that today: **cal**. By itself, **cal** is perhaps not the most amazing of tools, but we can use a few other utilities to spice it up a bit.

Chances are, **cal** is installed on your system already. To use it in this instance, just type **cal**.

```
$ cal
    December 2018  
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31          
```

We aren't going to go into advanced usage in this article, so if you want to learn more about **cal** , go check out Opensource.com Community Moderator Don Watkin's excellent [overview of the date and cal commands][1].

Now, let's spice it up with a pretty box, as we covered in our previous Linux toy article. I'll use the diamonds box, and use a little bit of padding to get it nicely aligned.

```
$ cal | boxes -d diamonds -p a1l4t2 
       /\          /\          /\
    /\//\\/\    /\//\\/\    /\//\\/\
 /\//\\\///\\/\//\\\///\\/\//\\\///\\/\
//\\\//\/\\///\\\//\/\\///\\\//\/\\///\\
\\//\/                            \/\\//
 \/                                  \/
 /\           December 2018          /\
//\\      Su Mo Tu We Th Fr Sa      //\\
\\//                         1      \\//
 \/        2  3  4  5  6  7  8       \/
 /\        9 10 11 12 13 14 15       /\
//\\      16 17 18 19 20 21 22      //\\
\\//      23 24 25 26 27 28 29      \\//
 \/       30 31                      \/
 /\                                  /\
//\\/\                            /\//\\
\\///\\/\//\\\///\\/\//\\\///\\/\//\\\//
 \/\\///\\\//\/\\///\\\//\/\\///\\\//\/
    \/\\//\/    \/\\//\/    \/\\//\/
       \/          \/          \/
```

That looks nice, but for good measure, let's put the whole thing in a second box, just for fun. We'll use the scoll design this time.

```
cal | boxes -d diamonds -p a1t2l3 | boxes -a c -d scroll        
 / ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \
|  /~~\                                              /~~\  |
|\ \   |         /\          /\          /\         |   / /|
| \   /|      /\//\\/\    /\//\\/\    /\//\\/\      |\   / |
|  ~~  |   /\//\\\///\\/\//\\\///\\/\//\\\///\\/\   |  ~~  |
|      |  //\\\//\/\\///\\\//\/\\///\\\//\/\\///\\  |      |
|      |  \\//\/                            \/\\//  |      |
|      |   \/                                  \/   |      |
|      |   /\          December 2018           /\   |      |
|      |  //\\     Su Mo Tu We Th Fr Sa       //\\  |      |
|      |  \\//                        1       \\//  |      |
|      |   \/       2  3  4  5  6  7  8        \/   |      |
|      |   /\       9 10 11 12 13 14 15        /\   |      |
|      |  //\\     16 17 18 19 20 21 22       //\\  |      |
|      |  \\//     23 24 25 26 27 28 29       \\//  |      |
|      |   \/      30 31                       \/   |      |
|      |   /\                                  /\   |      |
|      |  //\\/\                            /\//\\  |      |
|      |  \\///\\/\//\\\///\\/\//\\\///\\/\//\\\//  |      |
|      |   \/\\///\\\//\/\\///\\\//\/\\///\\\//\/   |      |
|      |      \/\\//\/    \/\\//\/    \/\\//\/      |      |
|      |         \/          \/          \/         |      |
|      |                                            |      |
 \     |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|     /
  \   /                                              \   /
   ~~~                                                ~~~
```

Perfect. Now, here's where things get a little crazy. I like our design, but, I'd like to go all out. So I'm going to colorize it. But here in the Raleigh, NC office where Opensource.com's staff are based, there's a good chance for snow this weekend. So let's enjoy our colorized advent calendar, and then wipe it out with snow.

For the snow, I'm grabbing a nifty [snippet][2] of Bash and Gawk goodness I found over on CLIMagic. If you're not familiar with CLIMagic, go check out their [website][3] and follow them on [Twitter][4]. You'll be glad you did.

So here we go. Let's clear the screen, throw up our boxy calendar, colorize it, wait a few seconds, then snowstorm it away. All here at the terminal, in one line.

```
$ clear;cal|boxes -d diamonds -p a1t2l3|boxes -a c -d scroll|lolcat;sleep 3;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS)) $(printf "\u2744\n");sleep 0.1;done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH%s \033[0;0H",a[x],x,$4;}}'
```

And there we go.

![](https://opensource.com/sites/default/files/uploads/linux-toy-cal-animated.gif)

For this to work on your system, you'll need all of the referenced utilities (boxes, lolcat, cal, gawk, etc.), and you'll need to use a terminal emulator that supports Unicode.

Do you have a favorite command-line toy that you think I ought to profile? The calendar for this series is mostly filled out but I've got a few spots left. Let me know in the comments below, and I'll check it out. If there's space, I'll try to include it. If not, but I get some good submissions, I'll do a round-up of honorable mentions at the end.

Check out yesterday's toy, [Take a break at the Linux command line with Nyan Cat][5], and check back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-cal

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/16/12/using-calendar-function-linux
[2]: http://climagic.org/coolstuff/let-it-snow.html
[3]: http://climagic.org/
[4]: https://twitter.com/climagic
[5]: https://opensource.com/article/18/12/linux-toy-nyancat
