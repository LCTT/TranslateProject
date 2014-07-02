乌龙茶占坑
Command Line Tuesdays – Part Two
================================================================================
Heya geekos!

Let’s refresh our memories. [Last week][1], we skimmed through some basic commands, learned what a shell is actually, and made a steady introduction into our CLI Tuesdays series.

Today’s menu offers something else: navigation through the file system.

Now, the best picture I managed to find on the www is from a site called [devopsbootcamp][2]. You can find their tutorials and the rest here. But anyway, here’s a very nice diagram of what a linux root filesystem looks like.

![Filesys](http://devopsbootcamp.readthedocs.org/en/latest/_images/hierarchy.jpg)

For example, as stated in the above picture, your user directory (where you usually store your movies, music, documents etc.) is located in the /home folder. /home folder is located under /. Then you have the /etc folder, where most of the files for configuration are located. Anyway, you can find the detailed description here, as we’ll not be getting into which folder is for what, until we start using and configuring them. Today is reserved for navigation only. And on that note, let’s get down to the first command of the day…

### pwd ###

pwd, or ‘print working directory’ is a very useful command if you think you are lost navigating through the folders. At any given moment, type pwd, and voila! What appears is a complete pathway you took to arrive to this folder. Those guys in The Cube could sure use it, losers.

![Cube](http://bloody-disgusting.com/images/news/cube2review1.gif)
注：此图原文哪里看不到，看看能通过什么途径得到

Imagine yourselves walking from room to room inside a massive apartment, loosing your way. pwd is like the breadcrumb trail leading you to your starting point, so you don’t loose your way inside the folder maze!

![pwd](http://redhat.activeventure.com/73/gettingstartedguide/figs/basics/pwd.png)

### cd ###

Now you know in which directory you’re situated thanks to your usage of the pwd command. Now you want to take the next step and move to another directory. Let’s say you have a folder/directory inside your home folder you want to relocate your top secret terminal operation to. For this, you use the ‘cd’ command. cd, or ‘change directory’, will change the location of wanted directory. How do you use it? Simple, type cd and the path to your folder. Let’s say, for example, you want to enter your Hello Kitty picture collection in your home folder. You type ‘cd /home/username/Hello\ Kitty’.

As you see, we didn’t only use the space bar in the folder name. That’s because the terminal won’t recognize it. Whenever you want to navigate to a folder containing a space in it’s name, you **replace it with the backslash character, followed by space**. You can also, without using the backslash+space option, just put the **whole folder name into quotes**, f.ex. cd /home/username/”Hello Kitty”.

![cd](http://blogote.com/wp-content/uploads/2010/06/terminal-cd-desktop.png)

Try it out yourself. Navigate to a different directory using cd, and when there, type pwd to see if everything worked as it’s supposed to.

### Mr. Shotts’ Shottcuts ###

Mr. Shotts reminds us there are also some shortcuts available.

If you type only cd, without the path following it, your terminal will change your working directory (whatever it may be) to your /home folder.

The same, if you type cd `~user_name` it will lead you to the home folder of the specific user you stated.

### Next Week ###

Next week, we’ll head over to the next chapter – we’ll learn how to list files and directories, view text files and classify file’s contents so it will be a bit more work than we’re used to, but I hope you’ll have enough time. Command by command, and if you haven’t the time to do it yourself, we’ll learn the basics together in a matter of months!

and remember…

### …have a lot of fun! ###

P.S.: Thanks to bwl’s comment, we fixed an error in the text regarding the space bar in directory names.

P.P.S.: GreatEmerald also added some fresh information about file hierarchy. You can read it in [the comments][3].

Thanks for your input/corrections.

--------------------------------------------------------------------------------

via: https://news.opensuse.org/2014/06/24/command-line-tuesdays-part-two/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://news.opensuse.org/2014/06/10/command-line-tuesdays-part-one/
[2]:http://devopsbootcamp.readthedocs.org/
[3]:https://news.opensuse.org/2014/06/24/command-line-tuesdays-part-two/comment-page-1/#comment-99186
