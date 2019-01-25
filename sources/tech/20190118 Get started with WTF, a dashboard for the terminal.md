[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with WTF, a dashboard for the terminal)
[#]: via: (https://opensource.com/article/19/1/wtf-information-dashboard)
[#]: author: (Kevein Sonney https://opensource.com/users/ksonney)

Get started with WTF, a dashboard for the terminal
======
Keep key information in view with WTF, the sixth in our series on open source tools that will make you more productive in 2019.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr)

There seems to be a mad rush at the beginning of every year to find ways to be more productive. New Year's resolutions, the itch to start the year off right, and of course, an "out with the old, in with the new" attitude all contribute to this. And the usual round of recommendations is heavily biased towards closed source and proprietary software. It doesn't have to be that way.

Here's the sixth of my picks for 19 new (or new-to-you) open source tools to help you be more productive in 2019.

### WTF

Once upon a time, I was doing some consulting at a firm that used [Bloomberg Terminals][1] . My reaction was, "Wow, that's WAY too much information on one screen." These days, however, it seems like I can't get enough information on a screen when I'm working and have multiple web pages, dashboards, and console apps open to try to keep track of things.

While [tmux][2] and [Screen][3] can do split screens and multiple windows, they are a pain to set up, and the keybindings can take a while to learn (and often conflict with other applications).

[WTF][4] is a simple, easily configured information dashboard for the terminal. It is written in [Go][5], uses a YAML configuration file, and can pull data from several different sources. All the data sources are contained in [modules][6] and include things like weather, issue trackers, date and time, Google Sheets, and a whole lot more. Some panes are interactive, and some just update with the most recent information available.

Setup is as easy as downloading the latest release for your operating system and running the command. Since it is written in Go, it is very portable and should run anywhere you can compile it (although the developer only builds for Linux and MacOS at this time).

![](https://opensource.com/sites/default/files/uploads/wtf-1.png)

When you run WTF for the first time, you'll get the default screen, identical to the image above.

![](https://opensource.com/sites/default/files/uploads/wtf-2.png)

You also get the default configuration file in **~/.wtf/config.yml** , and you can edit the file to suit your needs. The grid layout is configured in the top part of the file.

```
grid:
  columns: [45, 45]
  rows: [7, 7, 7, 4]
```

The numbers in the grid settings represent the character dimensions of each block. The default configuration is two columns of 40 characters, two rows 13 characters tall, and one row 4 characters tall. In the code above, I made the columns wider (45, 45), the rows smaller, and added a fourth row so I can have more widgets.

![](https://opensource.com/sites/default/files/uploads/wtf-3.png)

I like to see the day's weather on my dashboard. There are two weather modules to chose from: [Weather][7], which shows just the text information, and [Pretty Weather][8], which is colorful and uses text-based graphics in the display.

```
prettyweather:
  enabled: true
  position:
    top: 0
    left: 1
    height: 2
    width: 1
```

This code creates a pane two blocks tall (height: 2) and one block wide (height: 1), positioned on the second column (left: 1) on the top row (top: 0) containing the Pretty Weather module.

Some modules, like Jira, GitHub, and Todo, are interactive, and you can scroll, update, and save information in them. You can move between the interactive panes using the Tab key. The \ key brings up a help screen for the active pane so you can see what you can do and how. The Todo module lets you add, edit, and delete to-do items, as well as check them off as you complete them.

![](https://opensource.com/sites/default/files/uploads/wtf-4.png)

There are also modules to execute commands and present the output, watch a text file, and monitor build and integration server output. All the documentation is very well done.

WTF is a valuable tool for anyone who needs to see a lot of data on one screen from different sources.


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/wtf-information-dashboard

作者：[Kevein Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Bloomberg_Terminal
[2]: https://github.com/tmux/tmux
[3]: https://www.gnu.org/software/screen/
[4]: https://wtfutil.com/
[5]: https://golang.org/
[6]: https://wtfutil.com/posts/modules/
[7]: https://wtfutil.com/posts/modules/weather/
[8]: https://wtfutil.com/posts/modules/prettyweather/
