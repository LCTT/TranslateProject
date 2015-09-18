TERMINATOR 0.98: INSTALL IN UBUNTU AND LINUX MINT
================================================================================
[Terminator][1] multiple terminals in one window. The goal of this project is to produce a useful tool for arranging terminals. It is inspired by programs such as gnome-multi-term, quadkonsole, etc. in that the main focus is arranging terminals in grids. Terminator 0.98 bringing a more polished tabs functionality, better layout saving/restoring, improved preferences UI and numerous bug fixes.

![](http://www.ewikitech.com/wp-content/uploads/2015/09/Screenshot-from-2015-09-17-094828.png)

###CHANGES/FEATURE TERMINATOR 0.98
- Alayout launcher was added which allows easily switching between layouts (use Alt + L to open the new layout switcher);
- A new manual was added (use F1 to launch it);
- When saving, a layout now remembers the following:
    - * maximised and fullscreen status
    - * window titles
    - * which tab was active
    - * which terminal was active
    - * working directory for each terminal
- Added options for enabling/disabling non-homogenous tabs and scroll arrows;
- Added shortcuts for scrolling up/down by line/half-page/page;
- Added Ctrl+MouseWheel Zoom in/out and Shift+MouseWheel page scroll up/down;
- Added shortcuts for next/prev profile;
- Improved consistency of Custom Commands menu;
- Added shortcuts/code to toggle All/Tab grouping;
- Improved watcher plugin;
- Added search bar wrap toggle;
- Major cleanup and reorganisation of the preferences window, including a complete revamp of the global tab.
- Added option to set how long ActivityWatcher plugin is quiet for;
- Many other improvements and bug fixes
- [Click Here To See Complete Changlog][2]

###INSTALL TERMINATOR 0.98:

Terminator 0.98 is available in PPA, Firstly we need to add repository in Ubuntu/Linux Mint system. Run following commands in terminal to install Terminator 0.98.

    $ sudo add-apt-repository ppa:gnome-terminator/nightly
    $ sudo apt-get update
    $ sudo apt-get install terminator
    
If you want to remove terminator, simply run following command in terminal, (Optional)

    $ sudo apt-get remove terminator
    




--------------------------------------------------------------------------------

via: http://www.ewikitech.com/articles/linux/terminator-install-ubuntu-linux-mint/

作者：[admin][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.ewikitech.com/author/admin/
[1]:https://launchpad.net/terminator
[2]:http://bazaar.launchpad.net/~gnome-terminator/terminator/trunk/view/head:/ChangeLog



