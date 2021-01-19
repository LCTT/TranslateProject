[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Highlighted Text Not Visible in gedit in Dark Mode? Here’s What You Can Do)
[#]: via: (https://itsfoss.com/gedit-dark-mode-problem/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Highlighted Text Not Visible in gedit in Dark Mode? Here’s What You Can Do
======

I love [using dark mode in Ubuntu][1]. It’s soothing on the eyes and makes the system look aesthetically more pleasing, in my opinion.

One minor annoyance I noticed is with [gedit][2] text editor and if you use it with the dark mode in your system, you might have encountered it too.

By default, gedit highlights the line where your cursor is. That’s a useful feature but it becomes a pain if you are using dark mode in your Linux system. Why? Because the highlighted text is not readable anymore. Have a look at it yourself:

![Text on the highlighted line is hardly visible][3]

If you select the text, it becomes readable but it’s not really a pleasant reading or editing experience.

![Selecting the text makes it better but that’s not a convenient thing to do for all lines][4]

The good thing is that you don’t have to live with it. I’ll show a couple of steps you can take to enjoy dark mode system and gedit together.

### Making gedit reader-friendly in dark mode

You basically have two options:

  1. Disable highlight the current line but then you’ll have to figure out which line you are at.
  2. Change the default color settings but then the colors of the editor will be slightly different, and it won’t switch to light mode automatically if you change the system theme.



It’s a workaround and compromise that you’ll have to make until the gedit or GNOME developers fix the issue.

#### Option 1: Disable highlighting current line

When you have gedit opened, click on the hamburger menu and select **Preferences**.

![Go to Preferences][5]

In the View tab, you should see the “Highlight current line” option under Highlighting section. Uncheck this. The effects are visible immediately.

![Disable highlighting current line][6]

Highlighting current line is a usable feature and if you want to continue using it, opt for the second option.

#### Option 2: Change the editor color theme

In the Preferences window, go to Font &amp; Colors tab and change the color scheme to Oblivion, Solarized Dark or Cobalt.

![Change the color scheme][7]

As I mentioned earlier, the drawback is that when you switch the system theme to a light theme, the editor theme isn’t switched automatically to the light theme.

### A bug that should be fixed by devs

There are [several text editors available for Linux][8] but for quick reading or editing a text file, I prefer using gedit. It’s a minor annoyance but an annoyance nonetheless. The developers should fix it in future version of this awesome text editor so that we don’t have to resort to these worarounds.

How about you? Do you use dark mode on your system or light mode? Had you noticed this trouble with gedit? Did you take any steps to fix it? Feel free to share your experience.

--------------------------------------------------------------------------------

via: https://itsfoss.com/gedit-dark-mode-problem/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/dark-mode-ubuntu/
[2]: https://wiki.gnome.org/Apps/Gedit
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/gedit-dark-mode-problem.png?resize=779%2C367&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/gedit-dark-mode-issue.png?resize=779%2C367&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/gedit-preference.jpg?resize=777%2C527&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/disable-highlight-line-gedit.jpg?resize=781%2C530&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/change-color-scheme-gedit.jpg?resize=785%2C539&ssl=1
[8]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
