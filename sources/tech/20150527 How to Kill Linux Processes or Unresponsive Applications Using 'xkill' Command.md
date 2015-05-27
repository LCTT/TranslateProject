How to Kill Linux Processes/Unresponsive Applications Using ‘xkill’ Command
================================================================================
How do we kill a resource/process in Linux? Obviously we find the PID of the resource and then pass the PID to the kill command.

Speaking more accurately, we can find PID of a resource (say terminal) as:

    $ ps -A | grep -i terminal
    
    6228 ?        00:00:00 gnome-terminal

In the above output, the number ‘6228‘ is the PID of process (gnome-terminal), use the kill command to kill the process as shown below.

    $ kill 6228

The kill command sends a signal to a process, whose PID is passed along with the command.

Alternatively, we can use pkill command, which kills a process based upon name and other attributes of a process. To kill a process say whose name is terminal, we need to execute:

    $ pkill terminal

**Note**: The process name length in pkill is limited to 15 characters.

pkill seems more handy as you can kill a process without have to find out its PID. But if you want to have a better control on your system nothing beats ‘kill‘ command. Using kill you will have better insight of what process you are killing.

We have already covered a detailed guide on [kill, pkill and killall commands][1].

For those who are running X server there is another tool called xkill which can kill a process from its X window without passing process name or its PID.

xkill utility forces X server to close communications to its client which results into killing of client by its X resource. xkill which is a part of X11 utilities is very handy in killing unnecessary windows.

It support options like connect to specific X Server (-display displayname) using display number when multiple X Servers are running on a host simultaneously and kill all the client (-all, not recommended) with top-level windows on the screen as well as take frame (-frame) into account.

To get a list of all the clients you may run:

    $ xlsclients

#### Sample Output ####

    '  ' /usr/lib/libreoffice/program/soffice
    deb  gnome-shell
    deb  Docky
    deb  google-chrome-stable
    deb  soffice
    deb  gnome-settings-daemon
    deb  gnome-terminal-server

If no resource identifier is passed with id, xkill turns the mouse Pointer into special Symbol, similar to ‘X‘. Just click on the window you want to kill and this will kill its communication with server or say the program gets killed.

    $ xkill

![Xkill Command](http://www.tecmint.com/wp-content/uploads/2015/05/Xkill.png)

Kill Process Using xkill

It is important to notice that xkill do not guarantee that closing its communication will kill/abort it successfully. Most of the application will get killed when it’s communication to server is closed. However a few may still be running.

Points Needed to be mentioned here:

- This tool works only when X11 server is running, as xkill is a part of X11 utility.
- Don’t confuse with Closing and killing a resource. While killing a resource you may expect it not to exit cleanly.
- This is not a replacement of kill utility.

**Do I need to go to Linux command line to invoke xkill?**

No, you don’t need to fire xkill from Linux Command Line. You may set a keyboard shortcut and call xkill just by punching same key combination.

Here is how to setup a keyboard shortcut on a typical gnome3 Desktop Environment.

Go to Settings –> Select Keyboard, click on ‘+’ and add name and command. Click on the new entry and press the key you want to use as shortcut key combination. I did Ctrl+Alt+Shift+x.

![Gnome Settings](http://www.tecmint.com/wp-content/uploads/2015/05/22.png)

Gnome Settings

![Add Shortcut Key](http://www.tecmint.com/wp-content/uploads/2015/05/31.png)

Add Shortcut Key

The next time you want to kill a X resource just call the key combination (Ctrl+Alt+Shift+x), and you will notice your mouse pointer changed into x. Click on x resource you want to kill and all done!

--------------------------------------------------------------------------------

via: http://www.tecmint.com/kill-processes-unresponsive-programs-in-ubuntu/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/how-to-kill-a-process-in-linux/