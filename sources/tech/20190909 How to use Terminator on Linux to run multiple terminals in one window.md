[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use Terminator on Linux to run multiple terminals in one window)
[#]: via: (https://www.networkworld.com/article/3436784/how-to-use-terminator-on-linux-to-run-multiple-terminals-in-one-window.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to use Terminator on Linux to run multiple terminals in one window
======
Providing an option for multiple GNOME terminals within a single window frame, Terminator lets you flexibly align your workspace to suit your needs.
Sandra Henry-Stocker

If you’ve ever wished that you could line up multiple terminal windows and organize them in a single window frame, we may have some good news for you. The Linux **Terminator** can do this for you. No problemo!

### Splitting windows

Terminator will initially open like a terminal window with a single window. Once you mouse click within that window, however, it will bring up an options menu that gives you the flexibility to make changes. You can choose “**split horizontally**” or “**split vertically**” to split the window you are currently position in into two smaller windows. In fact, with these menu choices, complete with tiny illustrations of the resultant split (resembling **=** and **||**), you can split windows repeatedly if you like. Of course, if you split the overall window into more than six or nine sections, you might just find that they're too small to be used effectively.

**[ Two-Minute Linux Tips: [Learn how to master a host of Linux commands in these 2-minute video tutorials][1] ]**

Using ASCII art to illustrate the process of splitting windows, you might see something like this:

```
+-------------------+     +-------------------+     +-------------------+
|                   |     |                   |     |                   |
|                   |     |                   |     |                   |
|                   | ==> |-------------------| ==> |-------------------|
|                   |     |                   |     |         |         |
|                   |     |                   |     |         |         |
+-------------------+     +-------------------+     +-------------------+
  Original terminal         Split horizontally        Split vertically
```

Another option for splitting windows is to use control sequences like **Ctrl+Shift+e** to split a window vertically and **Ctrl+Shift+o** (“o" as in “open”) to split the screen horizontally.

Once Terminator has split into smaller windows for you, you can click in any window to use it and move from window to window as your work dictates.

### Maximizing a window

If you want to ignore all but one of your windows for a while and focus on just one, you can click in that window and select the "**Maximize**" option from the menu. That window will then grow to claim all of the space. Click again and select "**Restore all terminals**" to return to the multi-window display. **Ctrl+Shift+x** will toggle between the normal and maximized settings.

The window size indicators (e.g., 80x15) on window labels display the number of characters per line and the number of lines per window that each window provides.

### Closing windows

To close any window, bring up the Terminator menu and select **Close**. Other windows will adjust themselves to take up the space until you close the last remaining window.

### Saving your customized setup(s)

Setting up your customized terminator settings as your default once you've split your overall window into multiple segments is quite easy. Select **Preferences** from the pop-up menu and then **Layouts** from the tab along the top of the window that opens. You should then see **New Layout** listed. Just click on the **Save** option at the bottom and **Close** on the bottom right. Terminator will save your settings in  **~/.config/terminator/config** and will then use this file every time you use it.

You can also enlarge your overall window by stretching it with your mouse. Again, if you want to retain the changes, select **Preferences** from the menu, **Layouts** and then **Save** and **Close** again.

### Choosing between saved configurations

If you like, you can set up multiple options for your Terminator window arrangements by maintaining a number of config files, renaming each afterwards (e.g., config-1, config-2) and then moving your choice into place as **~/.config/terminator/config** when you want to use that layout. Here's an example script for doing something like this script. It lets you choose between three pre-configured window arrangements:

```
#!/bin/bash

PS3='Terminator options: '
options=("Split 1" "Split 2" "Split 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Split 1")
            config=config-1
            break
            ;;
        "Split 2")
            config=config-2
            break
            ;;
        "Split 3")
            config=config-3
            break
            ;;
        *)
            exit
            ;;
    esac
done

cd ~/.config/terminator
cp config config-
cp $config config
cd
terminator &
```

You could give the options more meaningful names than "config-1" if that helps.

### Wrap-up

Terminator is a good choice for setting up multiple windows to work on related tasks. If you've never used it, you'll probably need to install it first with a command such as "sudo apt install terminator" or "sudo yum install -y terminator".

Hopefully, you will enjoy using Terminator. And, as another character of the same name might say, "I'll be back!"

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3436784/how-to-use-terminator-on-linux-to-run-multiple-terminals-in-one-window.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
