Your Computer's Clipboard is a Security Problem - Fix it in Linux with xsel and cron
============================================================



 ![](https://irp-cdn.multiscreensite.com/58a25abc/dms3rep/multi/desktop/clip2-630x520.png) 


**EDIT: The original article recommended xsel, but a couple of users reported that it disabled their sound. This wasn't a problem for me, but I found another way (using [xclip][1] ) to achieve the same goal that should sidestep the issue. The article has been updated to reflect the switch to xclip.** 

The ability to copy/paste around your OS is essential. Whether you're writing code or comedy, these two functions are central to working with text on a computer. When you copy text, it goes into the memory-residing clipboard. Unless you install a clipboard manager that can hold multiple entries, the clipboard by default holds one _copy_ event, and the moment you _copy_ something else, the entry before it vanishes. In the standard Linux setup, the clipboard contents are stored in the memory of the program controlling it (most often Xorg).

The clipboard should be hobbled because any program can read its contents, and if left alone, it doesn't forget what it knows. Furthermore, modern browsers enable multiple ways for malicious websites to read from (and write to) your clipboard.

Although never the default, browsers have settings to disallow clipboard access. Add-ons for both browser and OS are available to manage your clipboard, as well, but it's easier and more reliable to fix the problem at the top of the chain and secure the clipboard system-wide. There are plenty of reasons to have a functional clipboard, but not one good reason contents should linger there for more than a minute or two.

Password managers have become popular lately, and if you use one, you've seen how they copy your password to the clipboard so you can paste it over in your browser and log into your accounts. Then what? Your password stays on the clipboard till another copy event or a reboot is what.

Even if you use a separate browser for things like banking, if you copy your password, you bring it back to your other browsers via the clipboard and expose it to web-based clipboard harvesting techniques.

My fix handles the problem for you in the background, clearing the clipboard contents automatically every minute. It does this with the xclip command line tool, a tiny script and [cron][2] . The one minute cron interval gives you enough time to get your copied passwords pasted, then it empties the clipboard. This repeats every minute, providing worry-free copying.

We need the [xclip][3] utility to clear the clipboard in the terminal. In apt-based distros, enter:

**sudo apt-get install xclip** 

Lets test the utility in the terminal.  First copy some text from anywhere, paste it somewhere else, then enter these two commands:

**touch blank
xclip -selection clipboard blank** 

then try pasting the text again - it should be gone. Now let's put the commands into a script. Create a script by entering (replacing leafpad with your text editor):

**leafpad nukeclipboard.sh** 

and enter the following into the new file:

**#!/bin/sh
touch blank && xclip -selection clipboard blank** 

Save and close the file, then make it executable with:

**chmod +x nukeclipboard.sh** 

Now to make the job run itself every minute. First beware, cron options differ from distro to distro. The following settings are for Ubuntu(based) distros and the process might be different in your distro, so [rtm][4] .

To setup the cron job, go to the terminal and enter:

**crontab -e** 

Scroll down past the #commented-out lines and enter the following line (replacing /home/user/ with the location of your script):

*** * * * * export DISPLAY=:0 && /home/user/nukeclipboard.sh** 

Now hit ctrl-o to bring up the save function, then hit enter to save your crontab. Finally, hit ctrl-x to exit the program. From now on your clipboard has a life-span of one minute.

About the cron entry above... cron has limitations regarding environment variables and when it fails, you can spend all day trying a hundred ways to fix it that don't work. After finding [this easy fix][5] advising to set the DISPLAY, there's been no more trouble. Thanks [Mike Q][6] for this gem.

Now, you might go to paste something you've copied the very moment the clipboard's being emptied and find nothing there, but it's is a small price to pay for the security bump it gives you. If it's a problem, you can configure cron to run the job at any interval that works for you. Instructions for Ubuntu and kin are on [this][7] page.

I hope this tutorial helps you get your clipboard locked down - comment below if you got the script working or have an even better way to do this.

--------------------------------------------------------------------------------

via: https://www.darrentoback.com/your-computer-s-clipboard-is-a-security-problem-fix-it-in-linux-with-xsel-and-cron

作者：[dmt][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.darrentoback.com/about-me
[1]:https://github.com/astrand/xclip
[2]:https://en.wikipedia.org/wiki/Cron
[3]:https://github.com/astrand/xclip
[4]:https://en.wikipedia.org/wiki/Cron
[5]:https://stackoverflow.com/questions/14296911/when-linux-system-calls-scripts-some-commands-dont-work-cron-if-up-d/24070707#24070707
[6]:https://stackoverflow.com/users/1618630/mike-q
[7]:https://help.ubuntu.com/community/CronHowto
