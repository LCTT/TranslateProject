translating by wwy-hust

Linux Humor on the Command-line
================================================================================
The desktop is full of eye candy. It enhances the visual experience and, in some cases, can also increase functionality of software. But it also makes software fun. Working on the command-line does not have to be always serious. If you want some fun on the command-line, there are lots of commands to raise a smile.

Linux is a fun operating system. Linux offers a vast collection of small open source utilities that perform functions ranging from the obvious to the bizarre. It is the quality and selection of these tools that help Linux stand out. Check out these 7 small utilities.

### lolcat ###

![lolcat](http://www.linuxlinks.com/portal/content/reviews/Misc/Screenshot-lolcat.png)

lolcat is a program that concatenates files, or standard input, to standard output (like the generic cat), and adds rainbow coloring to it.

lolcat is often combined with other tools such as toilet or figlet to generate text. This software should not be confused with a lolcat; an image macro of one or more cats.

lolcat was written by Moe.

Website: [github.com][1]

### cowsay ###

![cowsay](http://www.linuxlinks.com/portal/content/reviews/Misc/Screenshot-cowsay.png)

cowsay is a configurable open source program which generates ASCII pictures of a cow with a message in a speech bubble. cowsay is written in Perl.

cowsay is not limited to generating pictures of cows. It can generate pre-made images of other animals including a duck, elephant, koala, moose, pony, sheep, stegosaurus, and turkey, as well as cheese, snowman, and a skeleton.

There is a related program called cowthink, which generates cows with thought bubbles, as opposed to speech bubbles.

Features include:

- Make scripts more interesting
- Borg mode
- Ways to alter the way the cow looks, for example making the cow look greedy, paranoid, stoned, tired, wired, youthful and more
- xcowsay variant available

Website: [nog.net][2]

### doge ###

![doge](http://www.linuxlinks.com/portal/content/reviews/Misc/Screenshot-doge.png)

doge is a simple motd script based on the slightly stupid but very funny doge meme. It prints random grammatically incorrect statements that are sometimes based on things from your computer.

Doge is an Internet meme that became popular in 2013. The meme typically consists of a picture of a Shiba Inu accompanied by multicolored text in Comic Sans font in the foreground. The text, representing a kind of internal monologue, is deliberately written in a form of broken English.

- Randomly placed and colored random strings, complete with broken english
- Awesome Shibe in the terminal
- Fetching of system data, such as hostname, running processes, current user and $EDITOR
- If you have lolcat, you can do this gem: while true; do doge | lolcat -a -d 100 -s 100 -p 1; done
- stdin support: ls /usr/bin | doge will doge-print some of the executables found in /usr/bin. wow. There are also multiple command line switches that control filtering and statistical frequency of words

Website: [github.com/thiderman/doge][3]

### ASCIIQuarium ###

![Asciiquarium](http://www.linuxlinks.com/portal/content/reviews/Misc/Screenshot-Asciiquarium.png)

ASCIIQuarium is an aquarium/sea animation in ASCII art. Enjoy the fascinating creatures that live in the water from your computer.

To run ASCIIQuarium you need to have installed Perl's curses package, and the Term::Animation module. To install the former, type sudo apt-get install libcurses-perl. To install the latter, type sudo cpan Term::Animation, both at the command line.

Features include:

- Multicolored fish
- Amusing animations, including a fish hook
- There are swans, ducks, dolphins, and ships too

Website: [www.robobunny.com][4]

### sl - Steam Locomotive ###

![sl](http://www.linuxlinks.com/portal/content/reviews/Misc/Screenshot-sl.png)

sl is an amusing command line tool that displays animations to correct users who accidentally type sl instead of ls.

I'm rather sloppy at typing, preferring speed to accuracy. But typos can be a tad dangerous on the command line. So sl can serve as a practical reminder of curing a bad habit of mistyping. It always raises a chuckle too.

Features include:

- With -F, train flies
- With -l, it shows a small train
- With -a, an accident seems to happen

Website: [github.com/mtoyoda/sl][5]

### aafire ###

![aafire](http://www.linuxlinks.com/portal/content/reviews/Misc/Screenshot-aafire.png)

aafire displays burning ASCII art flames in the terminal. It demonstrates the the capabilities of the aalib library, an ascii art library.

Website: [aa-project.sourceforge.net/aalib][6]

### CMatrix ###

![CMatrix](http://www.linuxlinks.com/portal/content/reviews/Misc/Screenshot-CMatrix.png)

CMatrix is an ncurses program that simulates the display from "The Matrix". If you have been living in a cave for the past 15 years, you might not know The Matrix is a 1999 American science fiction acting film starring Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss, Hugo Weaving, and Joe Pantoliano.

It works with terminal settings up to 132x300 and can scroll lines all at the same rate or asynchronously and at a user-defined speed.

Features include:

- Change the text colour
- Turn on bold characters
- Asynchronous scroll
- Use old-style scrolling
- "Screensaver" mode

Website: [www.asty.org/cmatrix][7]

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20150614112018846/Humor.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://github.com/busyloop/lolcat
[2]:https://web.archive.org/web/20120225123719/http://www.nog.net/%7Etony/warez/cowsay.shtml
[3]:https://github.com/thiderman/doge
[4]:http://www.robobunny.com/projects/asciiquarium/html/
[5]:https://github.com/mtoyoda/sl
[6]:http://aa-project.sourceforge.net/aalib/
[7]:http://www.asty.org/cmatrix/
