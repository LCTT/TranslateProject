[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 command line games for learning Bash the fun way)
[#]: via: (https://opensource.com/article/19/10/learn-bash-command-line-games)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

3 command line games for learning Bash the fun way
======
Learning useful Bash skills can be fun with these command line games.
![connecting yellow dots in a maze][1]

Learning is hard work, and nobody likes work. That means no matter how easy it is to learn Bash, it still might feel like work to you. Unless, of course, you learn through gaming.

You wouldn't think there would be many games out there to teach you how to use a Bash terminal, and you'd be right. Serious PC gamers know that the Fallout series features terminal-based computers in the vaults, which helps normalize the idea of interfacing with a computer through text, but in spite of featuring applications more or less like [Alpine][2] or [Emacs][3], playing Fallout doesn't teach you commands or applications you can use in real life. The Fallout series was never ported to Linux directly (although it is playable through Steam's open source [Proton][4]. The modern entries into the [Wasteland series][5] that served as predecessors to Fallout, however, do target Linux, so if you want to experience in-game terminals, you can play [Wasteland 2][6] and [Wasteland 3][7] on your Linux gaming PC. The [Shadowrun][8] series also targets Linux, and it features a lot of terminal-based interactions, although it's admittedly often overshadowed by blazing [hot sim][9] sequences. 

While those games take a fun approach to computer terminals, and they run on open source systems, none are open source themselves. There are, however, at least two games that take a serious, and seriously fun, approach to teaching people how to interact with systems through text commands. And best of all, they're open source.

### Bashcrawl

You may have heard of [Colossal Cave Adventure][10], an old text-based, interactive game in the style of "choose your own adventure" books. Early computerists played these obsessively at the DOS or ProDOS command line, struggling to find the right combination of valid syntax and zany fantasy logic (as interpreted by a sardonic hacker) to beat the game. Imagine how productive such a struggle could be if the challenge, aside from exploring a virtual medieval dungeon, was to recall valid Bash commands. That's the pitch for **[Bashcrawl][11]**, a Bash-based dungeon crawl you play by learning and using Bash commands.

In Bashcrawl, a "dungeon" is created in the form of directories and files on your computer. You explore the dungeon by using the **cd** command to change directory into each room of the dungeon. As you [proceed through directories][12], you examine files with **[ls -F][13]**, read files with **[cat][14]**, [set variables][15] to collect treasure, and run scripts to fight monsters. Everything you do in the game is a valid Bash command that you can use later in real life, and playing the game provides Bash practice because the "game" is made out of actual directories and files on your computer.


```
$ cd entrance/
$ ls
cellar  scroll
$ cat scroll

It is pitch black in these catacombs.
You have a magical spell that lists all items in a room.

To see in the dark, type:     ls
To move around, type:         cd &lt;directory&gt;

Try looking around this room.
Then move into one of the next rooms.

EXAMPLE:

$ ls
$ cd cellar

Remember to cast ``ls`` when you get into the next room!
$
```

#### Install Bashcrawl

Before you can play Bashcrawl, you must have Bash or [Zsh][16] on your system. Linux, BSD, and MacOS ship with Bash included. Windows users can download and install [Cygwin][17] or [WSL][18] or [try Linux][19].

To install Bashcrawl, navigate to [GitLab][11] in Firefox or your web browser of choice. On the right side of the page, click the **Download** icon (to the right of the **Find file** button).
In the **Download** pop-up menu, click the **Zip** button to download the latest version of the game.

* * *

* * *

* * *

**![Download a zip from Gitlab][20]**

Once it's downloaded, unzip the archive.

Alternatively, if you want to start working in the terminal right away, you can use [Git][21]:


```
`$ git clone https://gitlab.com/slackermedia/bashcrawl.git bashcrawl`
```

#### Getting started

As with almost any new software package you download, the first thing you must do is read the README file. You can do this by double-clicking on the **README.md** file in the **bashcrawl** directory. On a Mac, your computer may not know what application to use to open the file; you can use any text editor or LibreOffice. **README.md** tells you exactly how to start playing the game, including how to get to the game in your terminal and the first command you must issue to start the game. If you fail to read the README file, the game wins by default (although it can't tell you that because you won't have played it).

Bashcrawl isn't meant to be overly clever or advanced. On the contrary, it's as simple as it possibly can be in the interest of being transparent to new users. Ideally, a new Bash user can learn some of the basics of Bash from the game, and then stumble upon the mechanics of the game, including the simple scripts that make it run, and learn still more Bash. Additionally, new Bash users can design their own dungeon by following the examples of Bashcrawl's existing content, and there's no better way to learn to code than to make a game.

### Command Line Heroes: BASH

Bashcrawl is meant for absolute beginners. If you use Bash on a regular basis, you'll very likely try to outsmart Bashcrawl by looking at files in ways that a beginner doesn't know yet. If you're an intermediate or advanced Bash user, then you should try **[Command Line Heroes: BASH][22]**.

The game is simple: Type in as many valid commands you can think of during a given amount of time. It sounds simple. As a Bash user, you use lots of commands every day. As a Linux user, you know where to find lists of commands; the **util-linux** package alone contains over 100 commands! The question is, are any of those commands available at your fingertips under the pressure of a countdown?

![Command Line Heroes: BASH][23]

This game sounds simple because it is! In principle, it's similar to flashcards, only in reverse. In practice, it's a fun way to test your knowledge and recall. And of course, it's open source, having been developed by the creators of [Open Jam][24].

#### Installing

You can play Command Line Heroes: Bash [online][25], or you can download the source code from [GitHub][26].

The game is written in Node.js, so unless you want to help develop the game, it makes sense to just play it online.

### Minesweeper in Bash

If you're an advanced Bash user, and you've written several Bash scripts, then you're probably beyond just learning Bash. For a real challenge, you might try programming a game instead of playing one. With a little thought and an afternoon or three of work, the popular game **Minesweeper** can be implemented entirely in Bash. You can try writing the game yourself first, then refer to [Abhishek Tamrakar's][27] article for an overview of how he accomplished it.

![][28]

Sometimes programming doesn't have a purpose but to educate. Programming a game in Bash may not be the project you'll stake your online reputation on, but the process can be fun and enlightening. And facing a problem you never expected to face is a great way to learn new tricks.

### Learn Bash; have fun

Regardless of how you approach learning it, Bash is a powerful interface because it gives you the ability to direct your computer to do what you want without going through the "middleman" interface of a GUI application. Sometimes a GUI is very helpful, but other times you want to graduate from something you know all too well and move to something you can do quickly or through automation. Because Bash is text-based, it's easy to script, making it a great starting point for automated jobs.

Learn Bash to start becoming a power user. But make sure you have fun doing it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/learn-bash-command-line-games

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW_maze.png?itok=mZ5LP4-X (connecting yellow dots in a maze)
[2]: https://opensource.com/article/17/10/alpine-email-client
[3]: http://www.gnu.org/software/emacs
[4]: https://github.com/ValveSoftware/Proton/
[5]: https://www.gog.com/game/wasteland_the_classic_original
[6]: https://www.inxile-entertainment.com/wasteland2
[7]: https://www.inxile-entertainment.com/wasteland3
[8]: http://harebrained-schemes.com/games/
[9]: https://forums.shadowruntabletop.com/index.php?topic=21804.0
[10]: https://opensource.com/article/18/12/linux-toy-adventure
[11]: https://gitlab.com/slackermedia/bashcrawl
[12]: https://opensource.com/article/19/8/understanding-file-paths-linux
[13]: https://opensource.com/article/19/7/master-ls-command
[14]: https://opensource.com/article/19/2/getting-started-cat-command
[15]: https://opensource.com/article/19/8/using-variables-bash
[16]: https://opensource.com/article/19/9/getting-started-zsh
[17]: https://www.cygwin.com/
[18]: https://docs.microsoft.com/en-us/windows/wsl/wsl2-about
[19]: https://opensource.com/article/19/7/ways-get-started-linux
[20]: https://opensource.com/sites/default/files/images/education/screenshot_from_2019-09-28_10-49-49.png (Download a zip from Gitlab)
[21]: https://opensource.com/life/16/7/stumbling-git
[22]: https://www.redhat.com/en/command-line-heroes/bash/index.html?extIdCarryOver=true&sc_cid=701f2000001OH79AAG
[23]: https://opensource.com/sites/default/files/uploads/commandlineheroes-bash.jpg (Command Line Heroes: BASH)
[24]: http://openjam.io/
[25]: https://www.redhat.com/en/command-line-heroes/bash/index.html
[26]: https://github.com/CommandLineHeroes/clh-bash/
[27]: https://opensource.com/article/19/9/advanced-bash-building-minesweeper
[28]: https://opensource.com/sites/default/files/uploads/extractmines.png
