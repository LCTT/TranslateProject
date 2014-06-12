Command Line Tuesdays – Part One
================================================================================
Here we are geekos, back in action! Sorry it’s been a while, but let me just assure you we’re back on track, raging to meet the deadlines and to, well, have some fun :)

Now, the whole idea was pretty much completely summed up in the introductory text posted a fortnight ago, so we may get down to business. As the book by Mr. Shotts instructs, we need to know what a shell is, as we’ll be operating withing it, and what a terminal emulator is.

A shell, Mr Shotts states, is actually what we’re talking about when we’re talking about command-line. The shell is basically a program that passes the strokes of your keyboard to your computer, a translator of some sort, so your computer knows what you’re saying. There are many shells in existence, but the most widespread shell used in GNU/Linux distributions is called **bash**, or Bourne Again Shell. It’s a clever wordplay, as Mr Bourne created the bash’s predecessor, **sh**, and Brian Fox wrote it as a free alternative for sh. Ahhh, GNU people and their humor, very clever :)

![](http://paste.opensuse.org/images/54535272.jpg)

Next thing we need so we can interact with the shell is a terminal emulator. Every Linux distribution comes with one, depending on the desktop environment you use, so it should be **Konsole** from KDE, **Gnome terminal** in Gnome etc. Mr. Shotts says you probably develop a preference for one, but I use what the desktop environment provides me, most of the time.

Now, fire up your terminal. You get a line, stating your user name and the machine’s host name. This is called the shell prompt. It means it’s ready for you to enter a command. Let’s try something random. Type in anything, and press enter.

Hehe, remember the introductory saying we need to learn the commands as a poem? There we go, random doesn’t work.

Now, press the up arrow, and you’ll see the command reappear. What’s this sorcery? The up arrow key on your keyboard is for accessing the command history. The terminal saves up to 500 commands you entered, so to not type them over and over, you can look for them with the up/down arrow. The left and right arrows are for moving the cursor within a specific line, so you can edit the text in between. Now there’s another thing – **ctrl+v** for pasting text doesn’t work. You can set it up as a shortcut somewhere, but it’s usually something else. Check your terminal emulator’s shortcuts! (in Konsole, it’s Settings > Configure shortcuts)

Now, for us not to get the ‘command not found’ slap to the face, let’s try something simple. Type **date**. (Yes, I didn’t know there’s a command for this, so it’s exciting for me also) :) 

![](http://paste.opensuse.org/images/7123365.png)

There you go. Why bother looking at your built in calendar in the clock, when you can fire up your terminal and type date, and see what day it is :) Just kidding, as Mr Shotts states, it’s a simple command, the more useful/difficult ones are coming next time. The related command to date is cal – it will display the current month’s calendar.

You may also try **df**, and it will list free space on your drives.

![](http://paste.opensuse.org/images/44662534.png)

Or **free**, to display the amount of free memory:

![](http://paste.opensuse.org/images/44548116.png)

If you’re already in the type-only mood, you can enter the command **exit** to get out of the terminal emulator instead of pressing the x button.

…and we’ll stop to a halt for this week so it won’t be too much to ingest on your already tight schedule. Too sum it up (you can write this conclusion down, for repetition), in part one, we learned:

- what is a shell
- what do we need to communicate with the shell (terminal emulator)
- navigating the terminal commands with cursor buttons and exiting the terminal

Four simple commands:

- **date** – displays the current date
- **cal** – displays the current month’s calendar
- **df** – shows the amount of free space on your hard drives
- **free** – amount of free memory

### What will we do next Tuesday? ###

We learn navigation through the file system (what are all those bin etc etc. folders, what are they used for, how to navigate through them via the terminal). Until then…

### …have a lot of fun! ###

![](http://paste.opensuse.org/images/40949666.jpg)

--------------------------------------------------------------------------------

via: https://news.opensuse.org/2014/06/10/command-line-tuesdays-part-one/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出