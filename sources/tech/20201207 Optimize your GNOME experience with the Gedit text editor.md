[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Optimize your GNOME experience with the Gedit text editor)
[#]: via: (https://opensource.com/article/20/12/gedit)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Optimize your GNOME experience with the Gedit text editor
======
It's a minimalistic editor that gets the job done, enhanced with great
hidden features to make things easier.
![Working from home at a laptop][1]

Being the default text editor is a thankless job. People usually regard a default text editor almost as a demo app—a slightly elevated "hello world" example of how an application on that platform is meant to run. Users resort to the default text editor in the rare occasions they need to dump some text into a file they’ll probably never look at again. For "serious" work, they turn to a word processor or an IDE, or an editor in the terminal, or at least a different text editor that has to be downloaded and installed like a "real" application.

It’s strangely difficult for a default text editor to be taken seriously, and yet the GNOME desktop’s editor, Gedit, is widely regarded as a truly valuable text editor beyond its parent desktop. It’s used as the required text editor in web design classes, a recommended tool for new developers and sysadmins, and a favorite reliable companion to many a desktop Linux user.

### Installing gedit

If you’re running the GNOME desktop, you probably already have gedit installed, although it may come up only as "Text Editor" in your application menu. If you’re not sure, just type **gedit** into your Activities screen, and then navigate to the **About** menu item in the text editor that opens.

![gedit terminal box with black background and white letters][2]

On Windows, you can download and [install gedit from the Microsoft Store][3].

On Mac, you can install gedit [using Homebrew][4] or [MacPorts][5].

### Using gedit

When you first launch gedit, you’ll get a minimalistic interface consisting of a text entry pane, a title bar, and a status panel at the bottom of the window. The bottom status panel provides quick access to a few common settings—what syntax highlighting schema you’d like to use, what tab width you prefer, and a few popular preferences such as line numbering, text wrapping, and so on. Most of these options can also be set globally in the Preferences menu, which is found in the "hamburger" menu in the top right corner of the application.

### Hidden features of gedit

On the surface, gedit is exactly what it advertises itself to be: a humble text editor that stays out of your way so you can type letters into a box on your screen. But this simple text editor is hiding several exciting features you may not know about, even if you’ve been using it for years.

These keyboard functions aren’t documented anywhere within gedit:

  * **Ctrl+D** deletes the current line. This is especially useful for coders or those who write in a markdown format (such as Asciidoc, reST, or CommonMark).
  * **Ctrl+I** brings up the **Go to Line** drop-down field. Type in a number, and you’re taken immediately to that line number.
  * **Alt+Up-Arrow** or **Alt+Down-Arrow** grabs the current line and moves it up or down in your document.
  * **Alt-Left-Arrow** or **Alt+Right-Arrow** grabs the nearest word (to the left of the cursor) and moves it left or right.
  * To type a special Unicode character, press and release **Shift+Ctrl+U** and then type the Unicode character code. You usually have to look up the character code (unless you have some memorized, but who has available memory for character codes?) For instance, to render a penguin, press, and release **Shift+Ctrl+U**. After you’ve released the keys, you’re left with an underlined U, so type **1F427** followed by a space, and your Unicode entry is transformed into a friendly 🐧. Admittedly, this isn’t entirely unique to gedit, but it’s a useful trick to know, and it does work in gedit.



### Robust simplicity

Gedit is a lot like GNOME itself. It is objectively simpler than many of its peers (such as Kate from KDE), and yet it still manages to meet 80% or 90% of your daily expectations.

Of course, there probably will be a task for which gedit isn’t the best tool. You might find yourself delving deep into some unique log files or in need of a precise parser or linter, and you’ll move to a specialized application. That’s alright. Gedit isn’t meant to be everything to all users. But it is a great text editor for those in need of one, and sometimes that’s all that's required. Give gedit a try on Linux, or on whatever platform you’re using, because the chances are good that it’s a better choice than the default.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/gedit

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://opensource.com/sites/default/files/uploads/gedit-31_days_gedit-opensource.jpg (gedit terminal box with black background and white letters)
[3]: https://www.microsoft.com/en-nz/p/gedit
[4]: https://opensource.com/article/20/6/homebrew-mac
[5]: https://opensource.com/article/20/11/macports
