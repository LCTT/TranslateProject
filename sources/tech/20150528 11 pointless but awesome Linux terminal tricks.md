Translating by goreliu ...

11 pointless but awesome Linux terminal tricks
================================================================================
Here are some great Linux terminal tips and tricks, each one as pointless as it is awesome. 

![](http://images.techhive.com/images/article/2015/05/slide_01-100587352-orig.png)

### All work and no play... ###

Linux is one of the most astoundingly functional and utilitarian Operating Systems around when it comes to working from the command line. Need to perform a particular task? Odds are there is an application or script you can use to get it done. Right from the terminal. But, as they say in the good book, "All work and no play make Jack really bored or something." So here is a collection of my favorite pointless, stupid, annoying or amusing things that you can do right in your Linux Terminal.

![](http://images.techhive.com/images/article/2015/05/slide_02-100587353-orig.png)

### Give the terminal an attitude ###

Step 1) Type "sudo visudo".

Step 2) At the bottom of the "Defaults" (near the top of the file) add, on a new line, "Defaults insults".

Step 3) Save the file.

"What did I just do to my computer?" you may be asking yourself. Something wonderful. Now, whenever you issue a sudo command and misstype your password, your computer will call you names. My favorite: "Listen, burrito brains, I don't have time to listen to this trash."

![](http://images.techhive.com/images/article/2015/05/slide_03-100587354-orig.png)

### apt-get moo ###

That screenshot you see? That's what typing "apt-get moo" (on a Debian-based system) does. That's it. Don't go looking for this to do something fancy. It won't. That, I kid you not, is it. But it's one of the most commonly known little Easter eggs on Linux. So I include it here, right near the beginning, so I won't get 5,000 emails telling me I missed it in this list.

![](http://images.techhive.com/images/article/2015/05/slide_04-100587355-orig.png)

### aptitude moo ###

A bit more entertaining is aptitude's take on "moo." Type "aptitude moo" (on Ubuntu and the like) and you'll be corrected about thinking "moo" would do anything. But you know better. Try the same command again, this time with an optional "-v" attribute. Don't stop there. Add v's, one at a time, until aptitude gives you what you want.

![](http://images.techhive.com/images/article/2015/05/slide_05-100587356-orig.png)

### Arch: Put Pac-Man in pacman ###

This is one just for the Arch-lovers out there. The de facto package manager, pacman, is pretty fantastic already. Let's make it even better.

Step 1) Open "/etc/pacman.conf".

Step 2) In the "# Misc options", remove the "#" from in front of "Color".

Step 3) Add "ILoveCandy".

Now the progress for installing new packages, in pacman, will include a little tiny Pac-Man. Which should really just be the default anyway.

![](http://images.techhive.com/images/article/2015/05/slide_06-100587358-orig.png)

### Cowsay! ###

Making aptitude moo is neat, I guess, but you really can't use it for much. Enter "cowsay." It does what you think. You make a cow say things. Anything you like. And it's not even limited to cows. Calvin, Beavis, and the Ghostbusters logo are all available in full ASCII art glory – type "cowsay -l" for a full list of what's available in this, Linux's most powerful tool. Remember that, like most great terminal applications, you can pipe the output from other applications straight into cowsay (ala "fortune | cowsay").

![](http://images.techhive.com/images/article/2015/05/slide_07-100587359-orig.png)

### Become an 3l33t h@x0r ###

Typing "nmap" isn't something one typically needs to do on a day-to-day basis. But when one does need to "whip out the nmap," one wants to look as l33t as humanly possible. Add a "-oS" to any nmap command (such as "nmap -oS - google.com"). Bam. You're now in what is officially known as "[Script Kiddie Mode][1]." Angelina Jolie and Keanu Reeves would be proud.

![](http://images.techhive.com/images/article/2015/05/slide_08-100587360-orig.png)

### Getting all Discordian ddate ###

If you've ever been sitting around thinking, "Hey! I want today's date to be written in an essentially useless, but whimsical, way"…try typing "ddate". Results like "Today is Setting Orange, the 72nd day of Discord in the YOLD 3181," can really spice up your server logs.

Note: Technically, this is a real thing called the [Discordian Calendar][2], used (in theory) by the followers of [Discordianism][3]. Which means I probably offended somebody. Or maybe not. I'm not really sure. Either way, ddate is a handy tool in any office.

![](http://images.techhive.com/images/article/2015/05/slide_09-100587361-orig.png)

### I See Colors Everywhere! ###

Tired of boring old text? Looking to spruce things up and show the world your true style? lolcat. Install it. Use it. Everywhere. It takes any text input and turns it into a rainbow of wonder and enchantment. Piping text into lolcat (ala "fortune | lolcat") is sure to liven up any party.

![](http://images.techhive.com/images/article/2015/05/slide_10-100587362-orig.png)

### The Steam Locomotive ###

Animated ASCII art steam locomotive in your terminal. You want this. You need this. Install and run "sl". Use "sl -l" for a tiny version. Or, if you want to really spend some time on this, "sl-h". This is the full train, including passenger cars.

![](http://images.techhive.com/images/article/2015/05/slide_11-100587364-orig.png)

### Reverse any text ###

Pipe the output of any text into "rev" and it will reverse the text. "fortune | rev" gives you a fortune. In reverse. Which is, as odd as it may seem, not a misfortune.

![](http://images.techhive.com/images/article/2015/05/slide_12-100587366-orig.png)

### The Matrix is still cool, right? ###

Want your terminal to do that scrolling text, l33t, Matrix-y thing? "cmatrix" is your friend. You can even have it output different colors, which is snazzy. Learn how by typing "man cmatrix". Or, better yet, "man cmatrix | lolcat". Which, really, is the most pointless (but wonderful) thing you can do in the Linux Terminal. So that's where I leave you.

--------------------------------------------------------------------------------

via: http://www.networkworld.com/article/2926630/linux/11-pointless-but-awesome-linux-terminal-tricks.html

作者：[Bryan Lunduke][a]
译者：[goreliu](https://github.com/goreliu)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.networkworld.com/author/Bryan-Lunduke/
[1]:http://nmap.org/book/output-formats-script-kiddie.html
[2]:http://en.wikipedia.org/wiki/Discordian_calendar
[3]:http://en.wikipedia.org/wiki/Discordianism