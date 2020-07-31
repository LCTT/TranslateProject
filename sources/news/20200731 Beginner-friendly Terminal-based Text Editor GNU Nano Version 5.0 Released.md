[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Beginner-friendly Terminal-based Text Editor GNU Nano Version 5.0 Released)
[#]: via: (https://itsfoss.com/nano-5-release/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Beginner-friendly Terminal-based Text Editor GNU Nano Version 5.0 Released
======

_**Open source text editor GNU nano has reached the milestone of version 5.0. Take a look at what features this new release brings.**_

There are plenty [terminal-based text editors available for Linux][1]. While editors like Emacs and Vim require a steep learning curve with bunch of unusual keyboard shortcuts, GNU nano is considered easier to use.

Perhaps that’s the reason why Nano is the default terminal-based text editor in Ubuntu and many other distributions. Upcoming [Fedora 33 release][2] is also going to set Nano as the default text editor in terminal.

GNU nano 5.0 has just been released. Here are the new features it brings.

### New features in GNU nano 5.0

![][3]

Some of the main highlights of GNU nano 5.0 as mentioned in its [changelog][4] are:

  * The –indicator option will show a kind of scroll bar on the right-hand side of the screen to indicate where in the buffer the viewport is located and how much it covers.
  * Lines can be tagged with Alt+Insert keys and you can jump to these tags with Alt+PageUp and Alt+PageDown keys.
  * The Execute Command prompt is now directly accessible from the main menu.
  * On terminals supporting at least 256 colors, there are new colors available.
  * New –bookstyle mode in which any line that begins with whitespace is considered as the start of a paragraph.
  * Refreshing the screen with ^L now works in every menu. It also centers the line with the cursor.
  * Bindable function ‘curpos’ has been renamed to ‘location’, long option –tempfile has been renamed to –saveonexit and short option -S is now a synonym of –softwrap.
  * Backup files will retain their group ownership (when possible).
  * Data is synced to disk before “… lines written” is shown.
  * Syntaxes for Markdown, Haskell, and Ada were added.



### Getting GNU nano 5.0

The current version of nano in Ubuntu 20.04 is 4.8 and it’s less likely that you’ll be getting the new version anytime soon in this LTS release. When and if it is available from Ubuntu, you should get it via the system updates.

Arch users should be getting it before everyone else, as always. Other distributions should also provide the new version, sooner or later.

If you are one of the few who likes [installing software from its source code][5], you can get it from its [download page][6].

If you are new to it, I highly recommend this [beginner’s guide to Nano editor][1].

How do you like the new release? Are you looking forward to using Nano 5?

--------------------------------------------------------------------------------

via: https://itsfoss.com/nano-5-release/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/nano-editor-guide/
[2]: https://itsfoss.com/fedora-33/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/09/Nano.png?ssl=1
[4]: https://www.nano-editor.org/news.php
[5]: https://itsfoss.com/install-software-from-source-code/
[6]: https://www.nano-editor.org/download.php
