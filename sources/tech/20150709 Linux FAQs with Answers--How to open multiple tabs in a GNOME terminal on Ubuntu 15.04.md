Linux FAQs with Answers--How to open multiple tabs in a GNOME terminal on Ubuntu 15.04
================================================================================
> **Question**: I used to be able to open multiple tabs inside gnome-terminal on my Ubuntu desktop. On Ubuntu 15.04, however, I can no longer open a new tab in my terminal window. How can I open tabs in gnome-terminal on Ubuntu 15.04? 

On Ubuntu 14.10 or earlier, gnome-terminal allowed you to open either a new terminal or a tab inside a terminal window. However, starting with Ubuntu 15.04, gnome-terminal has removed "New Tab" menu option. This is actually not a bug, but a feature that attempts to unify new tab and new window. GNOME 3.12 has introduced a [single "Open Terminal" option][1]. The ability to open a new terminal tab has been migrated from the terminal menu to Preferences.

![](https://farm1.staticflickr.com/562/19286510971_f0abe3e7fb_b.jpg)

### Open Tabs via Preferences ###

To be able to open a new tab in new gnome-terminal of Ubuntu 15.04, go to "Edit" -> "Preferences", and change "Open new terminals in: Window" to "Open new terminals in: Tab".

![](https://farm1.staticflickr.com/329/19256530766_ff692b83bc_b.jpg)

Now if you open a new terminal via menu, it will automatically open a new tab inside the terminal.

![](https://farm4.staticflickr.com/3820/18662051223_3296fde8e4_b.jpg)

### Open Tabs via a Keyboard Shortcut ###

If you do not want to change Preferences, you can hold down <Ctrl> to "invert" Preferences setting temporarily. For example, under the default Preferences, if you hold down <Ctrl> and click on "New Terminal", it will open a new tab, not a terminal.

Alternatively, you can simply use a keyboard shortcut <Shift+Ctrl+T> to open a new tab in a terminal.

In my view, this UI change in gnome-terminal is not quite an improvement. For example, you are no longer able to customize the name of individual terminal tabs. This feature is useful when you have many tabs open in a terminal. With the default tab name fixed to the current prompt (whose length can grow quickly), you easily cannot see the whole prompt string in the limited tab name space. Hope this feature will become available soon.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/open-multiple-tabs-gnome-terminal-ubuntu.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://worldofgnome.org/opening-a-new-terminal-tabwindow-in-gnome-3-12/