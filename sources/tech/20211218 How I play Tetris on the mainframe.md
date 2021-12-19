[#]: subject: "How I play Tetris on the mainframe"
[#]: via: "https://opensource.com/article/21/12/mainframe-tetris"
[#]: author: "Elizabeth K. Joseph https://opensource.com/users/pleia2"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I play Tetris on the mainframe
======
Here's how I compiled and play my favorite game on a mainframe by
accessing a virtual Linux server.
![Gaming artifacts with joystick, GameBoy, paddle][1]

The ability to [run Linux on modern mainframes][2] opens doors to doing all kinds of things on the platform. An Apache HTTP server? Easy! A database? Would you like SQL or NoSQL? Kubernetes? Sure! As I concluded in [Linux on the mainframe: Then and now][3], all of the most popular Linux distributions for servers today have versions for the mainframe.

This is great news for companies whose mission-critical infrastructures are running on a mainframe, but what if you just want to play around with one? The first time I got a bash shell on an IBM LinuxONE, I installed the irssi chat client and showed all my friends on IRC the output of `/proc/cpuinfo` to show off that it was an s390x architecture system. At first, I was at a loss as to what to do next.

Then I thought it would be fun to use this huge computer to play a game. My first thought was [NetHack][4], but it turns out I could install that with a simple `apt install nethack-console`. No, I should compile something! For every computer architecture, you need compilers and interpreters written for that. With over 20 years of Linux on the mainframe, most compilers and interpreters you'd typically expect are already ported.

Growing up, one of my all-time favorite games was Tetris, so it was the logical choice for my experimentation. I found an open source Tetris game written in C called [vitetris][5] and gave it a try. It was just like compiling a C program on any other Linux server.

First, I needed to grab some dependencies. The mainframe was running Linux, so I could use my package manager to [install the build requirements][6], and I was well on my way.

Next, it was just a matter of grabbing the code and building it:


```


curl -LO <https://github.com/vicgeralds/vitetris/archive/v0.58.0.tar.gz>
tar xvf v0.58.0.tar.gz
cd vitetris-0.58.0/
./configure
make

```

And in no time, I was playing my favorite game!

`./tetris`

![Screenshot of an open source Tetris game in progress, running on Linux][7]

(Elizabeth Joseph, [CC BY-SA 4.0][8])

As I said, it's exactly like building any other C program on a Linux server, but you're doing it on a mainframe.

Unfortunately, I don't have a mainframe in my garage (yet). Instead, I've done all of this on a virtual server hosted by Marist College through the [IBM LinuxONE Community Cloud][9] program. It gives you free access to an s390x architecture Linux server, with your choice of the most popular distributions. With this virtual server, you have access to experiment for 120 days.

If you are a representative from an open source project that is considering building your application for Linux on s390x, there's a program for you, too. When I'm not playing Tetris, my actual job at IBM is working with open source communities to do just that. You can put in a request for a permanent Linux virtual server for your community to use for development, whether that's doing manual tests to see if your application will build or formally adding it to your project's continuous integration system. I recommend starting with the Community Cloud to do some experiments, and then you can fill out [this form][10] to get the process of getting a permanent virtual server rolling.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/mainframe-tetris

作者：[Elizabeth K. Joseph][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pleia2
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_gaming_games_roundup_news.png?itok=KM0ViL0f (Gaming artifacts with joystick, GameBoy, paddle)
[2]: https://opensource.com/article/19/9/linux-mainframes-part-1
[3]: https://opensource.com/article/19/9/linux-mainframes-part-2
[4]: https://www.nethack.org/
[5]: http://victornils.net/tetris/
[6]: https://opensource.com/article/21/11/compiling-code
[7]: https://opensource.com/sites/default/files/uploads/tetris_osdotcom.png (Tetris)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://developer.ibm.com/gettingstarted/ibm-linuxone/
[10]: https://www.ibm.com/community/z/open-source/virtual-machines-request/
