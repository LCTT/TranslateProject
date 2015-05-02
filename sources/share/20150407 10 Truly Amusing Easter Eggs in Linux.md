KevinSJ translating
10 Truly Amusing Easter Eggs in Linux
================================================================================
![](http://en.wikipedia.org/wiki/File:Adventure_Easteregg.PNG)
The programmer working on Adventure slipped a secret feature into the game. Instead of getting upset about it, Atari decided to give these sorts of “secret features” a name -- “Easter Eggs” because… you know… you hunt for them. Image credit: Wikipedia.

Back in 1979, a video game was being developed for the Atari 2600 -- [Adventure][1].

The programmer working on Adventure slipped a secret feature into the game which, when the user moved an “invisible square” to a particular wall, allowed entry into a “secret room”. That room contained a simple phrase: “Created by [Warren Robinett][2]”. 

Atari had a policy against putting author credits in their games, so this intrepid programmer put his John Hancock on the game by being, well, sneaky. Atari only found out about the “secret room” after Warren Robinett had left the company. Instead of getting upset about it, Atari decided to give these sorts of “secret features” a name -- “Easter Eggs” because… you know… you hunt for them -- and declared that they would be putting more of these “Easter Eggs” in future games.

This wasn’t the first such “hidden feature” built into a piece of software (that distinction goes to an operating system for the [PDP-10][3] from 1966, but this was the first time it was given a name. And it was the first time it really grabbed the attention of most computer users and gamers.

Linux (and Linux related software) has not been left out. Some truly amusing Easter Eggs have been created for our beloved operating system over the years. Here are some of my personal favorites -- with how to achieve them.

You’ll notice, rather quickly, that most of these are experienced via a terminal. That’s on purpose. Because terminals are cool. [I should also take this moment to say that if you try to run an application I list, and you do not have it installed, it will not work. You should install it first. Because… computers.]

### Arch : Pac-Man in pacman ###

We’re going to start with one just for the [Arch Linux][4] fans out there. You can add a [Pac-Man][5]-esque character to your progress bars in “[pacman][6]” (the Arch package manager). Why this isn’t enabled by default is beyond me.

To do this you’ll want to edit “/etc/pacman.conf” in your favorite text editor. Under the “# Misc options” section, remove the “#” in front of “Color” and add the line “ILoveCandy”. Because Pac-Man loves candy.

That’s it! Next time you fire up a terminal and run pacman, you’ll help the little yellow guy get some lunch (or at least some candy).

### GNU Emacs : Tetris and such ###

![emacs Tetris](http://www.linux.com/images/stories/41373/emacsTetris.jpg)
I don’t like emacs. Not even a little bit. But it does play Tetris. 

I have a confession to make: I don’t like [emacs][7]. Not even a little bit.

Some things fill my heart with gladness. Some things take away all my sadness. Some things ease my troubles. That’s [not what emacs does][8].

But it does play Tetris. And that’s not nothing. Here’s how: 

Step 1) Launch emacs. (When in doubt, type “emacs”.)

Step 2) Hit Escape then X on your keyboard.

Step 3) Type “tetris” and hit Enter.

Bored of Tetris? Try “pong”, “snake” and a whole host of other little games (and novelties). Take a look in “/usr/share/emacs/*/lisp/play” for the full list.

### Animals Saying Things ###

The Linux world has a long and glorious history of animals saying things in a terminal. Here are the ones that are the most important to know by heart.

On a Debian-based distro? Try typing “apt-get moo".

![apt-get moo](http://www.linux.com/images/stories/41373/AptGetMoo.jpg)
apt-get moo

Simple, sure. But it’s a talking cow. So we like it. Then try “aptitude moo”. It will inform you that “There are no Easter Eggs in this program”.

If there’s one thing you should know about [aptitude][9], it’s that it’s a dirty, filthy liar. If aptitude were wearing pants, the fire could be seen from space. Add a “-v” option to that same command. Keep adding more v’s until you force aptitude to come clean.

![](http://www.linux.com/images/stories/41373/AptitudeMoo.jpg)
I think we can all agree, that this is probably the most important feature in aptitude.

I think we can all agree, that this is probably the most important feature in aptitude. But what if you want to put your own words into the mouth of a cow? That’s where “cowsay” comes in.

And, don’t let the name “cowsay” fool you. You can put words into so much more than just a cow. Like an elephant, Calvin, Beavis and even the Ghostbusters logo. Just do a “cowsay -l” from the terminal to get a complete list of options.

![](http://www.linux.com/images/stories/41373/cowsay.jpg)
You can put words into so much more than just a cow.

Want to get really tricky? You can pipe the output of other applications into cowsay. Try “fortune | cowsay”. Lots of fun can be had.

### Sudo Insult Me Please ###

Raise your hand if you’ve always wanted your computer to insult you when you do something wrong. Hell. I know I have. Try this:

Type “sudo visudo” to open the “sudoers” file. In the top of that file you’ll likely see a few lines that start with “Defaults”. At the bottom of that list add “Defaults insults” and save the file.

Now, whenever you mistype your sudo password, your system will lob insults at you. Confidence boosting phrases such as “Listen, burrito brains, I don’t have time to listen to this trash.”, “Are you on drugs?” and “You’re mind just hasn’t been the same since the electro-shocks, has it?”.

This one has the side-effect of being a rather fun thing to set on a co-worker's computer.

### Firefox is cheeky ###

Here’s one that isn’t done from the Terminal! Huzzah!

Open up Firefox. In the URL bar type “about:about”. That will give you a list of all of the “about” pages in Firefox. Nothing too fancy there, right?

Now try “about:mozilla” and you’ll be greeted with a quote from the “[Book of Mozilla][10]” -- the holy book of web browsing. One of my other favorites, “about:robots”, is also quite excellent.

![](http://www.linux.com/images/stories/41373/About-Mozilla550.jpg)
The “Book of Mozilla” -- the holy book of web browsing. 

### Carefully Crafted Calendar Concoctions ###

Tired of the boring old [Gregorian Calendar][11]? Ready to mix things up a little bit? Try typing “ddate”. This will print the current date on the [Discordian Calendar][12]. You will be greeted by something that looks like this:

“Today is Sweetmorn, the 18th day of Discord in the YOLD 3181”

I hear what you’re saying, “But, this isn’t an Easter Egg!” Shush. I’ll call it an Easter Egg if I want to. 

### Instant l33t Hacker Mode ###

Want to feel like you’re a super-hacker from a movie? Try setting nmap into “[Script Kiddie][13]” mode (by adding “-oS”) and all of the output will be rendered in the most 3l33t [h@x0r-y way][14] possible.

Example: “nmap -oS - google.com”

Do it. You know you want to. Angelina Jolie would be [super impressed][15]. 

### The lolcat Rainbow  ###

Having awesome Easter Eggs and goodies in your Linux terminal is fine and dandy… but what if you want it to have a little more… pizazz? Enter: lolcat. Take the text output of any program and pipe it through lolcat to super-duper-rainbow-ize it. 

![](http://www.linux.com/images/stories/41373/lolcat.jpg)
Take the text output of any program and pipe it through lolcat to super-duper-rainbow-ize it. 

### Cursor Chasing Critter ###

![oneko cat](http://www.linux.com/images/stories/41373/onekocat.jpg)
“Oneko” -- the Linux port of the classic “Neko”. 

“Oneko” -- the Linux port of the classic “[Neko][16]”.
And that brings us to “oneko” -- the Linux port of the classic “Neko”. Basically a little cat that chases your cursor around the screen.

While this may not qualify as an “Easter Egg” in the strictest sense of the word, it’s still fun. And it feels Easter Egg-y.

You can also use different options (such as “oneko -dog”) to use a little dog instead of a cat and a few other tweaks and options. Lots of possibilities for annoying co-workers with this one.

There you have it! A list of my favorite Linux Easter Eggs (and things of that ilk). Feel free to add your own favorite in the comments section below. Because this is the Internet. And you can do that sort of thing.

--------------------------------------------------------------------------------

via: http://www.linux.com/news/software/applications/820944-10-truly-amusing-linux-easter-eggs-

作者：[Bryan Lunduke][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linux.com/community/forums/person/56734
[1]:http://en.wikipedia.org/wiki/Adventure_(Atari_2600)
[2]:http://en.wikipedia.org/wiki/Warren_Robinett
[3]:http://en.wikipedia.org/wiki/PDP-10
[4]:http://en.wikipedia.org/wiki/Arch_Linux
[5]:http://en.wikipedia.org/wiki/Pac-Man
[6]:http://www.linux.com/news/software/applications/820944-10-truly-amusing-linux-easter-eggs-#Pacman
[7]:http://en.wikipedia.org/wiki/GNU_Emacs
[8]:https://www.youtube.com/watch?v=AQ4NAZPi2js
[9]:https://wiki.debian.org/Aptitude
[10]:http://en.wikipedia.org/wiki/The_Book_of_Mozilla
[11]:http://en.wikipedia.org/wiki/Gregorian_calendar
[12]:http://en.wikipedia.org/wiki/Discordian_calendar
[13]:http://nmap.org/book/output-formats-script-kiddie.html
[14]:http://nmap.org/book/output-formats-script-kiddie.html
[15]:https://www.youtube.com/watch?v=Ql1uLyuWra8
[16]:http://en.wikipedia.org/wiki/Neko_%28computer_program%29
