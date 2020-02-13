[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use byobu to multiplex SSH sessions)
[#]: via: (https://opensource.com/article/20/2/byobu-ssh)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

How to use byobu to multiplex SSH sessions
======
Byobu allows you to maintain multiple terminal windows, connect via SSH,
disconnect, reconnect, and share access, all while keeping the session
alive.
![Person drinking a hat drink at the computer][1]

[Byobu][2] is a text-based window manager and terminal multiplexer. It's similar to [GNU Screen][3] but more modern and more intuitive. It also works on most Linux, BSD, and Mac distributions.

Byobu allows you to maintain multiple terminal windows, connect via SSH (secure shell), disconnect, reconnect, and even let other people access it, all while keeping the session alive.

For example, if you are SSH'd into a Raspberry Pi or server and run (for example) **sudo apt update &amp;&amp; sudo apt upgrade**—and lose your internet connection while it is running, your command will be lost to the void. However, if you start a byobu session first, it will continue running and, when you reconnect, you will find it's been running happily without your eyes on it.

![The byobu logo is a fun play on screens.][4]

Byobu is named for a Japanese term for decorative, multi-panel screens that serve as folding room dividers, which I think is quite fitting.

To install byobu on Debian/Raspbian/Ubuntu:

**sudo apt install byobu**

Then enable it:

**byobu-enable**

Now drop out of your SSH session and log back in—you'll land in a byobu session. Run a command like **sudo apt update** and close the window (or enter the escape sequence ([**Enter**+**~**+**.**][5]) and log back in. You'll see the update running just as you left it.

There are a _lot_ of features I don't use regularly or at all. The most common ones I use are:

  * **F2** – New window
  * **F3/F4** – Navigate between windows
  * **Ctrl**+**F2** – Split pane vertically
  * **Shift**+**F2** – Split pane horizontally
  * **Shift**+**Left arrow/Shift**+**Right arrow** – Navigate between splits
  * **Shift**+**F11** – Zoom in (or out) on a split



You can learn more by watching this video:

### How we're using byobu

Byobu has been great for the maintenance of [piwheels][6], the convenient, pre-compiled Python packages for Raspberry Pi. We have a horizontal split showing the piwheels monitor in the top half and the syslog entries scrolled in real time on the bottom half. Then, if we want to do something else, we switch to another window. It's particularly handy when we're investigating something collaboratively, as I can see what my colleague Dave types (and correct his typos) while we chat in IRC.

I have byobu enabled on my home and work servers, so when I log into either machine, everything is as I left it—multiple jobs running, a window left in a particular directory, running a process as another user, that kind of thing.

![byobu screenshot][7]

Byobu is handy for development on Raspberry Pis, too. You can launch it on the desktop, run a command, then SSH in and attach yourself to the session where that command is running. Just note that enabling byobu won't change what the terminal launcher does. Just run **byobu** to launch it.

* * *

_This article originally appeared on Ben Nuttall's [Tooling blog][8] and is reused with permission._

Enter the black raspberry. Rubus occidentalis . It's an ominous name for an ominous fruit: the...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/byobu-ssh

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hat drink at the computer)
[2]: https://byobu.org/
[3]: http://www.gnu.org/software/screen/
[4]: https://opensource.com/sites/default/files/uploads/byobu.png (byobu screen)
[5]: https://www.google.com/search?client=ubuntu&channel=fs&q=Enter-tilde-dot&ie=utf-8&oe=utf-8
[6]: https://opensource.com/article/20/1/piwheels
[7]: https://opensource.com/sites/default/files/uploads/byobu-screenshot.png (byobu screenshot)
[8]: https://tooling.bennuttall.com/byobu/
