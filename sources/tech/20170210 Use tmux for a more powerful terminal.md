# [Use tmux for a more powerful terminal][3]


 ![](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/tmux-945x400.jpg) 

Some Fedora users spend most or all their time at a [command line][4] terminal. The terminal gives you access to your whole system, as well as thousands of powerful utilities. However, it only shows you one command line session at a time by default. Even with a large terminal window, the entire window only shows one session. This wastes space, especially on large monitors and high resolution laptop screens. But what if you could break up that terminal into multiple sessions? This is precisely where  _tmux_  is handy — some say indispensable.

### Install and start  _tmux_ 

The  _tmux_  utility gets its name from being a terminal muxer, or multiplexer. In other words, it can break your single terminal session into multiple sessions. It manages both  _windows_  and  _panes_ :

*   A  _window_  is a single view — that is, an assortment of things shown in your terminal.
*   A  _pane_  is one part of that view, often a terminal session.

To get started, install the  _tmux_  utility on your system. You’ll need to have  _sudo_  setup for your user account ([check out this article][5] for instructions if needed).

```
sudo dnf -y install tmux
```

Run the utility to get started:

tmux

### The status bar

At first, it might seem like nothing happens, other than a status bar that appears at the bottom of the terminal:

 ![Start of tmux session](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/Screenshot-from-2017-02-04-12-54-41.png) 

The bottom bar shows you:

*   _[0] _ – You’re in the first session that was created by the  _tmux_  server. Numbering starts with 0\. The server tracks all sessions whether they’re still alive or not.
*   _0:username@host:~_  – Information about the first window of that session. Numbering starts with 0\. The terminal in the active pane of the window is owned by  _username_  at hostname  _host_ . The current directory is  _~ _ (the home directory).
*   _*_  – Shows that you’re currently in this window.
*   _“hostname” _ – the hostname of the  _tmux_  server you’re using.
*   Also, the date and time on that particular host is shown.

The information bar will change as you add more windows and panes to the session.

### Basics of tmux

Stretch your terminal window to make it much larger. Now let’s experiment with a few simple commands to create additional panes. All commands by default start with  _Ctrl+b_ .

*   Hit  _Ctrl+b, “_  to split the current single pane horizontally. Now you have two command line panes in the window, one on top and one on bottom. Notice that the new bottom pane is your active pane.
*   Hit  _Ctrl+b, %_  to split the current pane vertically. Now you have three command line panes in the window. The new bottom right pane is your active pane.

 ![tmux window with three panes](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/Screenshot-from-2017-02-04-12-54-59.png) 

Notice the highlighted border around your current pane. To navigate around panes, do any of the following:

*   Hit  _Ctrl+b _ and then an arrow key.
*   Hit  _Ctrl+b, q_ . Numbers appear on the panes briefly. During this time, you can hit the number for the pane you want.

Now, try using the panes to run different commands. For instance, try this:

*   Use  _ls_  to show directory contents in the top pane.
*   Start  _vi_  in the bottom left pane to edit a text file.
*   Run  _top_  in the bottom right pane to monitor processes on your system.

The display will look something like this:

 ![tmux session with three panes running different commands](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/Screenshot-from-2017-02-04-12-57-51.png) 

So far, this example has only used one window with multiple panes. You can also run multiple windows in your session.

*   To create a new window, hit  _Ctrl+b, c._  Notice that the status bar now shows two windows running. (Keen readers will see this in the screenshot above.)
*   To move to the previous window, hit  _Ctrl+b, p._ 
*   If you want to move to the next window, hit  _Ctrl+b, n_ .
*   To immediately move to a specific window (0-9), hit  _Ctrl+b_  followed by the window number.

If you’re wondering how to close a pane, simply quit that specific command line shell using  _exit_ ,  _logout_ , or  _Ctrl+d._  Once you close all panes in a window, that window disappears as well.

### Detaching and attaching

One of the most powerful features of  _tmux_  is the ability to detach and reattach to a session. You can leave your windows and panes running when you detach. Moreover, you can even logout of the system entirely. Then later you can login to the same system, reattach to the  _tmux_  session, and see all your windows and panes where you left them. The commands you were running stay running while you’re detached.

To detach from a session, hit  _Ctrl+b, d._  The session disappears and you’ll be back at the standard single shell. To reattach to the session, use this command:

```
tmux attach-session
```

This function is also a lifesaver when your network connection to a host is shaky. If your connection fails, all the processes in the session will stay running. Once your connection is back up, you can resume your work as if nothing happened.

And if that weren’t enough, on top of multiple windows and panes per session, you can also run multiple sessions. You can list these and then attach to the correct one by number or name:

```
tmux list-sessions
```

### Further reading

This article only scratches the surface of  _tmux’_ s capabilities. You can manipulate your sessions in many other ways:

*   Swap one pane with another
*   Move a pane to another window (in the same or a different session!)
*   Set keybindings that perform your favorite commands automatically
*   Configure a  _~/.tmux.conf_  file with your favorite settings by default so each new session looks the way you like

For a full explanation of all commands, check out these references:

*   The official [manual page][1]
*   This [eBook][2] all about  _tmux_

--------------------------------------------------------------------------------

作者简介：

Paul W. Frields has been a Linux user and enthusiast since 1997, and joined the Fedora Project in 2003, shortly after launch. He was a founding member of the Fedora Project Board, and has worked on documentation, website publishing, advocacy, toolchain development, and maintaining software. He joined Red Hat as Fedora Project Leader from February 2008 to July 2010, and remains with Red Hat as an engineering manager. He currently lives with his wife and two children in Virginia.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-tmux-more-powerful-terminal/

作者：[Paul W. Frields][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/pfrields/
[1]:http://man.openbsd.org/OpenBSD-current/man1/tmux.1
[2]:https://pragprog.com/book/bhtmux2/tmux-2
[3]:https://fedoramagazine.org/use-tmux-more-powerful-terminal/
[4]:http://www.cryptonomicon.com/beginning.html
[5]:https://fedoramagazine.org/howto-use-sudo/
