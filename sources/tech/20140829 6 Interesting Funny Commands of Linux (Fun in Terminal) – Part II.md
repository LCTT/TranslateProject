6 Interesting Funny Commands of Linux (Fun in Terminal) – Part II
================================================================================
In our past following articles, we’ve shown some useful articles on some funny commands of Linux, which shows that Linux is not as complex as it seems and can be fun if we know how to use it. Linux command line can perform any complex task very easily and with perfection and can be interesting and joyful.

- [20 Funny Commands of Linux – Part I][1]注，此篇的原文应该翻译过，文件名应该是：20 Funny Commands of Linux or Linux is Fun in Terminal
- [Fun in Linux Terminal – Play with Word and Character Counts][2]注：这篇文章刚刚补充上

![Funny Linux Commands](http://www.tecmint.com/wp-content/uploads/2014/08/Funny-Linux-Commands.png)
Funny Linux Commands

The former Post comprises of 20 funny Linux Commands/Script (and subcommands) which was highly appreciated by our readers. The other post, though not that much popular as former comprises of Commands/ Scripts and Tweaks which lets you play with text files, words and strings.

This post aims at bringing some new fun commands and one-liner scripts which is going to rejoice you.

### 1. pv Command ###

You might have seen simulating text in movies. It appears as, it is being typed in real time. Won’t it be nice, if you can have such an effect in terminal?

This can be achieved, by installing ‘**pv**‘ command in your Linux system by using ‘**apt**‘ or ‘**yum**‘ tool. Let’s install ‘**pv**‘ command as shown.

    # yum install pv			[On RedHat based Systems]

    # sudo apt-get install pv	        [On Debian based Systems]

Once, ‘**pv**‘ command installed successfully on your system, let’s try to run the following one liner command to see the real time text effect on the screen.

    $ echo "Tecmint[dot]com is a community of Linux Nerds and Geeks" | pv -qL 10 

![pv command in action](http://www.tecmint.com/wp-content/uploads/2014/08/pv-command.gif)
pv command in action

**Note**: The ‘**q**‘ option means ‘quite’, no output information and option ‘**L**‘ means the Limit of Transfer of bytes per second. The number value can be adjusted in either direction (must be integer) to get desired simulation of text.

### 2. toilet Command ###

How about printing text with border in terminal, using an one-liner script command ‘**toilet**‘. Again, you must have ‘**toilet**‘ command installed on your system, if not use apt or yum to install it.

    $ while true; do echo “$(date | toilet -f term -F border –Tecmint)”; sleep 1; done

![toilet command in action](http://www.tecmint.com/wp-content/uploads/2014/08/toilet-command.gif)
toilet command in action

**Note**: The above script needs to be suspended using **ctrl+z** key.

### 3. rig Command ###

This command generates a random identity and address, every time. To run, this command you need to install ‘**rig**‘ using apt or yum.

    # rig

![rig command in action](http://www.tecmint.com/wp-content/uploads/2014/08/rig-command.gif)
rig command in action

### 4. aview Command ###

How about viewing an image in ASCII format on the terminal? We must have a package ‘**aview**‘ installed, just apt or yum it. I’ve an image named ‘**elephant.jpg**‘ in my current working directory and I want view it on terminal as ASCII format.

    $ asciiview elephant.jpg -driver curses 

![aview command in action](http://www.tecmint.com/wp-content/uploads/2014/08/elephant.gif)
aview command in action

### 5. xeyes Command ###

In last article we introduced a command ‘**oneko**‘ which attaches jerry with mouse pointer and keeps on chasing it. A similar program ‘**xeyes**‘ which is a graphical programs and as soon as you fire the command you will see two monster eyes chasing your movement.

    $ xeyes

![xeyes command in action](http://www.tecmint.com/wp-content/uploads/2014/08/xeyes.gif)
xeyes command in action

### 6. cowsay Command ###

Do you remember last time we introduced command, which is useful in output of desired text with animated character cow. What if you want other animal in place of cow? Check a list of available animals.

    $ cowsay -l 

How about Elephant inside ASCII Snake?

    $ cowsay -f elephant-in-snake Tecmint is Best 

![cowsay command in action](http://www.tecmint.com/wp-content/uploads/2014/08/cowsay.gif)
cowsay command in action

How about Elephant inside ASCII goat?

    $ cowsay -f gnu Tecmint is Best 

![cowsay goat in action](http://www.tecmint.com/wp-content/uploads/2014/08/cowsay-goat.gif)
cowsay goat in action

That’s all for now. I’ll be here again with another interesting article. Till then stay update and connected to Tecmint. Don’t forget to provide us with your valuable feedback in the comments below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-funny-commands/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/20-funny-commands-of-linux-or-linux-is-fun-in-terminal/
[2]:http://www.tecmint.com/play-with-word-and-character-counts-in-linux/