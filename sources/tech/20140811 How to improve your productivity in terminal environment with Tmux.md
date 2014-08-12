[su-kaiyao]翻译中

How to improve your productivity in terminal environment with Tmux
================================================================================
The introduction of the mouse was a wonderful innovation in making computers more accessible to average people. But for programmers and sysadmins, moving our hands off the keyboard while working on a computer can be distracting.

As a sysadmin, I spend most of the time working in the terminal environment. Opening tabs and moving around windows through multiple terminals slows me down, and I just can't waste any second when something is going really wrong with my server.

![](https://farm6.staticflickr.com/5563/14853747084_e14cf18e8f_z.jpg)

[Tmux][1] is one of those tools that are essential for my daily work. With Tmux, I can create complex development environments, and have SSH connections side by side. I can create multiple windows, split panes, attach and detach sessions, etc. After mastering Tmux, you will throw out your mouse away ( just kidding don't do it :D ).

Tmux (short for "Terminal Multiplexer") lets us launch multiple terminals in a flexible layout on a single screen, so that we can work with them side by side. For example, on one pane we can edit some config files with Vim, while on the other we are using irssi to chat and on other pane, tailing some logs. Then open another window to update your system, and another to SSH to some servers. Navigating through them is just as easy as creating all these windows and panes. It is perfectly configurable and customizable so it can become an extension of your mind.

### Install Tmux on Linux/OSX ###

You can install Tmux by compiling it from sources or via your operating system package manager. I recommend you to use a package manager. It's faster and easier than compiling.

#### OSX: ####

    # sudo brew install tmux
    # sudo port install tmux 

#### Debian/Ubuntu: ####

    $ sudo apt-get install tmux 

RHEL/CentOS/Fedora (RHEL/CentOS require [EPEL repo][2]):

    $ sudo yum install tmux 

Archlinux:

    $ sudo pacman -S tmux 

### Working with Different Sessions ###

The best way to use Tmux is working with sessions, so that you can organize your tasks and applications into different sessions the way you want. If you need to change a session, whatever runs inside the session won't stop or get killed. Let's see how it works.

Let's start a new session named "session", and run top command in it.

    $ tmux new -s new session
    $ top 

then type **CTRL-b d** to detach from this session. To re-attach to it:

    $ tmux attach-session -t session 

And you will see top still running in the re-attached session.

Some commands to manage sessions:

    $ tmux list-session
    $ tmux new-session <session-name>
    $ tmux attach-session -t <session-name>
    $ tmux rename-session -t <session-name>
    $ tmux choose-session -t <session-name>
    $ tmux kill-session -t <session-name> 

### Working with Different Windows ###

Often you will need to run multiple commands and perform different tasks in a session. We can organize all of them on multiple windows in one session. A window can be seen as a tab on modern GUI terminal (such iTerm, or Konsole). After configuring our default environment in a session, we will be able to create as many windows as we would need within the same session. Windows, like our apps running in sessions, persist when we detach from the current session. Let's check out an example:

    $ tmux new -s my_session 

![](https://farm6.staticflickr.com/5583/14853747014_442b3742fa_z.jpg)

Press **CTRL-b c**

This will create a new window and move focus into it. Now you can start up another application in the new window. You can write down the name of your current window. In this case I was running top so that's the window's name.

To rename it just type:
**CTRL-b** ,

The status bar changes to let you rename the current window.

![](https://farm6.staticflickr.com/5579/14855868482_d52516a357_z.jpg)

Once we create multiple windows in a session, we need a way to move through them. Windows are organized as an array, so every window has a number starting at 0. To jump quickly to other windows:

**CTRL-b <window number>**

If we have named our windows, we can look for them with:

**CTRL-b f**

and to list all windows:

**CTRL-b w**

and to move to a different window one by one:

**CTRL-b n** (go to the next window)
**CTRL-b p** (go to the previous window)

To leave a window, just type exit or:

**CTRL-b &**

You have to confirm if you want to kill off the window.

### Splitting a Window into Panes ###

Sometimes you need to type in your editor and check a log at the same time, and having your editor and tail side by side is really useful. With Tmux, we can divide a window into multiple panes. So for example, we can create a dashboard to monitor our servers and a complex development environment with the editor, the compiler and debugger running together side by side.

Let's create another Tmux session to work with panes. First let's detach from any Tmux session in case we are in a running session.

**CTRL-b d**

Start a new session named "panes".

    $ tmux new -s panes 

You can split a window horizontally or vertically. Let's start horizontally by pressing:

**CTRL-b** "

Now you have two new panes. Now vertically by pressing:

**CTRL-b** %

and now two more:

![](https://farm4.staticflickr.com/3881/14669677417_bc1bdce255_z.jpg)

To move through them:

**CTRL-b <Arrow keys>**

### Conclusion ###

I hope this tutorial has been helpful to you. As a bonus, tools such as [Tmuxinator][3] or [Tmuxifier][4] can streamline the process of creating and loading Tmux sessions, windows and panes, so that you can configure Tmux easily. Check them out if you haven't.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/improve-productivity-terminal-environment-tmux.html

作者：[Christopher Valerio][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/valerio
[1]:http://tmux.sourceforge.net/
[2]:http://xmodulo.com/2013/03/how-to-set-up-epel-repository-on-centos.html
[3]:https://github.com/tmuxinator/tmuxinator
[4]:https://github.com/jimeh/tmuxifier
