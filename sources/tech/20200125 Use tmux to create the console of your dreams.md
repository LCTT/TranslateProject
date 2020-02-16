[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use tmux to create the console of your dreams)
[#]: via: (https://opensource.com/article/20/1/tmux-console)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Use tmux to create the console of your dreams
======
You can do a lot with tmux, especially when you add tmuxinator to the
mix. Check them out in the fifteenth in our series on 20 ways to be more
productive with open source in 2020.
![Person drinking a hat drink at the computer][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Do it all on the console with tmux and tmuxinator

In this series so far, I've written about individual apps and tools. Starting today, I'll put them together into comprehensive setups to streamline things. Starting at the command line. Why the command line? Simply put, working at the command line allows me to access a lot of these tools and functions from anywhere I can run SSH. I can SSH into one of my personal machines and run the same setup on my work machine as I use on my personal one. And the primary tool I'm going to use for that is [tmux][2].

Most people use tmux for very basic functions, such as opening it on a remote server then starting a process, maybe opening a second session to watch log files or debug information, then disconnecting and coming back later. But you can do so much work with tmux.

![tmux][3]

First things first—if you have an existing tmux configuration file, back it up. The configuration file for tmux is **~/.tmux.conf**. Move it to another directory, like **~/tmp**. Now, clone the [Oh My Tmux][4] project with Git. Link to **.tmux.conf** from that and copy in the **.tmux.conf.local** file to make adjustments:


```
cd ~
mkdir ~/tmp
mv ~/.tmux.conf ~/tmp/
git clone <https://github.com/gpakosz/.tmux.git>
ln -s ~/.tmux/.tmux.conf ./
cp ~/.tmux.conf.local ./
```

The **.tmux.conf.local** file contains local settings and overrides. For example, I changed the default colors a bit and turned on the [Powerline][5] dividers. This snippet shows only the things I changed:


```
tmux_conf_theme_24b_colour=true
tmux_conf_theme_focused_pane_bg='default'
tmux_conf_theme_pane_border_style=fat
tmux_conf_theme_left_separator_main='\uE0B0'
tmux_conf_theme_left_separator_sub='\uE0B1'
tmux_conf_theme_right_separator_main='\uE0B2'
tmux_conf_theme_right_separator_sub='\uE0B3'
#tmux_conf_battery_bar_symbol_full='◼'
#tmux_conf_battery_bar_symbol_empty='◻'
tmux_conf_battery_bar_symbol_full='♥'
tmux_conf_battery_bar_symbol_empty='·'
tmux_conf_copy_to_os_clipboard=true
set -g mouse on
```

Note that you do not need to have Powerline installed—you just need a font that supports the Powerline symbols. I use [Hack Nerd Font][6] for almost everything console-related since it is easy for me to read and has many, many useful extra symbols. You'll also note that I turn on operating system clipboard support and mouse support.

Now, when tmux starts up, the status bar at the bottom provides a bit more information—and in exciting colors. **Ctrl**+**b** is still the "leader" key for entering commands, but some others have changed. Splitting panes horizontally (top/bottom) is now **Ctrl**+**b**+**-** and vertically is now **Ctrl**+**b**+**_**. With mouse mode turned on, you can click to switch between the panes and drag the dividers to resize them. Opening a new window is still **Ctrl**+**b**+**n**, and you can now click on the window name on the bottom bar to switch between them. Also, **Ctrl**+**b**+**e** will open up the **.tmux.conf.local** file for editing. When you exit the editor, tmux will reload the configuration without reloading anything else. Very useful.

So far, I've only made some simple changes to functionality and visual display and added mouse support. Now I'll set it up to launch the apps I want in a way that makes sense and without having to reposition and resize them every time. For that, I'll use [tmuxinator][7]. Tmuxinator is a launcher for tmux that allows you to specify and manage layouts and autostart applications with a YAML file. To use it, start tmux and create panes with the things you want running in them. Then, open a new window with **Ctrl**+**b**+**n**, and execute **tmux list-windows**. You will get detailed information about the layout.

![tmux layout information][8]

Note the first line in the code above where I set up four panes with an application in each one.** **Save the output from when you run it for later. Now, run **tmuxinator new 20days** to create a layout named **20days**. This will bring up a text editor with the default layout file. It has a lot of useful stuff in it, and I encourage you to read up on all the options. Start by putting in the layout information above and what apps you want where:


```
# /Users/ksonney/.config/tmuxinator/20days.yml
name: 20days
root: ~/
windows:
   - mail:
      layout: d9da,208x60,0,0[208x26,0,0{104x26,0,0,0,103x26,105,0,5},208x33,0,27{104x33,0,27,1,103x33,105,27,4}]] @0
      panes:
        - alot
        - abook
        - ikhal
        - todo.sh ls +20days
```

Be careful with the spaces! Like Python code, the spaces and indentation matter to how the file is interpreted. Save the file and then run **tmuxinator 20days**. You should get four panes with the [alot][9] mail program, [abook][10], ikhal (a shortcut to [khal][11] interactive), and anything in [todo.txt][12] with the tag **+20days**.

![sample layout launched by tmuxinator][13]

You'll also notice that the window on the bottom bar is labeled Mail. You can click on the name (along with other named windows) to jump to that view. Nifty, right? I set up a second window named Social with [Tuir][14], [Newsboat][15], an IRC client connected to [BitlBee][16], and [Rainbow Stream][17] in the same file.

Tmux is my productivity powerhouse for keeping track of all the things, and with tmuxinator, I don't have to worry about constantly resizing, placing, and launching my applications.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/tmux-console

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hat drink at the computer)
[2]: https://github.com/tmux/tmux
[3]: https://opensource.com/sites/default/files/uploads/productivity_15-1.png (tumux)
[4]: https://github.com/gpakosz/.tmux
[5]: https://github.com/powerline/powerline
[6]: https://www.nerdfonts.com/
[7]: https://github.com/tmuxinator/tmuxinator
[8]: https://opensource.com/sites/default/files/uploads/productivity_15-2.png (tmux layout information)
[9]: https://opensource.com/article/20/1/organize-email-notmuch
[10]: https://opensource.com/article/20/1/sync-contacts-locally
[11]: https://opensource.com/article/20/1/open-source-calendar
[12]: https://opensource.com/article/20/1/open-source-to-do-list
[13]: https://opensource.com/sites/default/files/uploads/productivity_15-3.png (sample layout launched by tmuxinator)
[14]: https://opensource.com/article/20/1/open-source-reddit-client
[15]: https://opensource.com/article/20/1/open-source-rss-feed-reader
[16]: https://opensource.com/article/20/1/open-source-chat-tool
[17]: https://opensource.com/article/20/1/tweet-terminal-rainbow-stream
