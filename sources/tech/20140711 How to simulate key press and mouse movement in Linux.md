How to simulate key press and mouse movement in Linux
================================================================================
Have you ever dreamed of your computer doing stuff automatically for you? Probably not if you just watched Terminator. But except for that, scripting and task automation are every power user's dreams. If a lot of solutions exist today to fit such goal, it is sometimes hard to pick the simple, smart, and efficient one out of the lot. I cannot pretend to have found it myself, but in the mean time, my preference goes to neat software called xdotool. Its approach is intuitive as it stands as an X11 automation tool. In other words, xdotool can simulate key presses and even mouse events from reading a text file.

### Installation of Xdotool on Linux ###

For Ubuntu, Debian or Linux Mint, you can just do:

    $ sudo apt-get install xdotool 

For Fedora, use yum command:

    $ sudo yum install xdotool 

For CentOS user, the package is available in [EPEL repo][1]. After enabling EPEL repo, simply use yum command as above.

For Arch user, the package is available in the Community repo:

    $ sudo pacman -S xdotool 

If you cannot find xdotool for your distribution, you can always download it from the [official website][2].

### Basic Usage of Xdotool ###

As intuitive as it is, xdotool remains a scripting application. Hence you have to know the syntax in order to use it properly. Rest assured though, the syntax is very simple and quick to pick up, relative to the extent of the program's features.

First, it is very easy to simulate key press. From the terminal, you can type the command:

    $ xdotool key [name of the key] 

If you want to chain two keys, use the "+" operator between them. So:

    $ xdotool key alt+Tab 

will switch window for you.

To have xdotool type for you, use the type command:

    $ xdotool type '' 

That's already enough for basic key pressing. But one of the many strengths of xdotool is its ability to put the focus on a particular window. It can fetch the right window, and then type in it, preventing all your recorded keystrokes to just vaporize in thin air. For this, the simplest command is:

    $ xdotool search --name [name of the window] key [keys to press]

This will search through the opened window for one with the name matching the search, give it the focus, and then simulate the key pressing.

A bit more advanced, but very useful, xdotool can simulate mouse movement and click. With:

    $ xdotool mousemove x y 

you can place the cursor at coordinates (x,y) of your screen (in pixels). You can also combine it with the "click" argument:

    $ xdotool mousemove x y click 1 

This will move the mouse to (x,y), and click with the left button. The "1" represents the left button of the mouse, "2" would be the scroll wheel, "3" the right button, etc.

Finally, once you have your commands in mind, you might want to actually dump it in a file to edit and play. For that, there is more than one syntax. You can write is a bash script:

    #!/bin/bash
    
    xdotool [command 1]
    xdotool [command 2]
    etc

Or you can use:

    $ xdotool [filename] 

where you write your commands in a separate file and plug its name as the argument.

### Bonus ###

As a bonus to this post, here is a concrete example of xdotool in action. You may or may not have heard of Bing, the Microsoft's search engine. In the latter case, you have then never heard of Bing Rewards: a program that allows you to trade Bing points for Amazon's and other gift cards. To earn those points, you can do up to 30 searches a day on Bing, each search giving you 0.5 point. In other words, you have to make Bing your default search engine, and use it every day.

Or, you can use this xdotool script, which will automatically give focus to Firefox (replace it with your favorite navigator), and perform a search using the fortune command to generate some random words. In about 30 seconds, all your daily searches will be done.

    #!/bin/bash
     
    for i in {1..30}
    do
      WID=`xdotool search --title "Mozilla Firefox" | head -1`
      xdotool windowfocus $WID
      xdotool key ctrl+l
      xdotool key Tab
      SENTENCE="$(fortune | cut -d' ' -f1-3 | head -1)"
      xdotool type $SENTENCE
      xdotool key "Return"
      sleep 4
    done

To conclude, I really like xdotool even if its full capabilities extend way beyond the scope of this post. It is a really approachable way to scripting and task automation. The downside is that it probably is not the most efficient one. But again, it does the job, and isn't too much of a bother to learn.

What are your thoughts on xdotool? Do you prefer another automation tool to it? And why? Let us know in the comments.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/simulate-key-press-mouse-movement-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2013/03/how-to-set-up-epel-repository-on-centos.html
[2]:http://www.semicomplete.com/projects/xdotool/