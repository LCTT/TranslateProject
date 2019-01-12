[#]: collector: (lujun9972)
[#]: translator: (zhs852)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Termtosvg – Record Your Terminal Sessions As SVG Animations In Linux)
[#]: via: (https://www.2daygeek.com/termtosvg-record-your-terminal-sessions-as-svg-animations-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Termtosvg – Record Your Terminal Sessions As SVG Animations In Linux
======

By default everyone prefer history command to review/recall the previously entered commands in terminal.

But unfortunately, that shows only the commands that we ran and doesn’t shows the commands output which was performed previously.

There are many utilities available in Linux to record the terminal session activity.

This tool will help us to record the users terminal activity, also will help us to identify other useful information from the output.

Also, we had written about few utilities in the past and today also we are going to discuss about the same kind of topic.

If you would like to check other utilities to record your Linux terminal session activity then you can give a try to **[Script Command][1]** and **[Terminalizer Tool][2]**.

But if you are looking for **[GIF Recorder][3]** then try **[Gifine][4]** , **[Kgif][5]** and **[Peek][6]** utilities.

Script is one of the best utility to record your terminal session on headless server.

Script is a Unix command line utility that records a terminal session (in other terms, It’s record everything displayed on your terminal).

It stores the output in the current directory as a text file and the default file name is typescript.

### What is Termtosvg

Termtosvg is a Unix terminal recorder written in Python that renders your command line sessions as standalone SVG animations.

### Termtosvg Features

  * Produce lightweight and clean looking animations embeddable on a project page.
  * Custom color themes, terminal UI and animation controls via SVG templates.
  * Compatible with asciinema recording format.
  * It requires Python >= 3.5



### How to Install Termtosvg In Linux

It was written in Python and pip installation is a recommended method to install Termtosvg on Linux.

Make sure you should have installed python-pip package on your system. If no, use the following command to install it.

For Debian/Ubuntu users, use **[Apt Command][7]** or **[Apt-Get Command][8]** to install pip package.

```
$ sudo apt install python-pip
```

For Archlinux users, use **[Pacman Command][9]** to install pip package.

```
$ sudo pacman -S python-pip
```

For Fedora users, use **[DNF Command][10]** to install pip package.

```
$ sudo dnf install python-pip
```

For CentOS/RHEL users, use **[YUM Command][11]** to install pip package.

```
$ sudo yum install python-pip
```

For openSUSE users, use **[Zypper Command][12]** to install pip package.

```
$ sudo zypper install python-pip
```

Finally run the following **[pip command][13]** to install Termtosvg tool in Linux.

```
$ sudo pip3 install termtosvg pyte python-xlib svgwrite
```

### How to Record Your Terminal Session Using Termtosvg

Once you successfully installed Termtosvg. Just run the following command to start recording.

```
$ termtosvg
Recording started, enter "exit" command or Control-D to end
```

For testing purpose run few commands and see whether it’s working fine or not.

```
$ uname -a
Linux daygeek-Y700 4.19.8-2-MANJARO #1 SMP PREEMPT Sat Dec 8 14:45:36 UTC 2018 x86_64 GNU/Linux
$ hostname
daygeek-Y700
$ cat /etc/*-release
Manjaro Linux
DISTRIB_ID=ManjaroLinux
DISTRIB_RELEASE=18.0
DISTRIB_CODENAME=Illyria
DISTRIB_DESCRIPTION="Manjaro Linux"
Manjaro Linux
NAME="Manjaro Linux"
ID=manjaro
ID_LIKE=arch
PRETTY_NAME="Manjaro Linux"
ANSI_COLOR="1;32"
HOME_URL="https://www.manjaro.org/"
SUPPORT_URL="https://www.manjaro.org/"
BUG_REPORT_URL="https://bugs.manjaro.org/"
$ free -g
free: Multiple unit options doesn't make sense.
$ free -m
free: Multiple unit options doesn't make sense.
$ pip3 --version
pip 18.1 from /usr/lib/python3.7/site-packages/pip (python 3.7)
```

Once you have done, simple press `CTRL+D` or type `exit` to stop the recording. The result will be saved in `/tmp` folder with a unique name.

```
$ exit
exit
Recording ended, SVG animation is /tmp/termtosvg_5waorper.svg
```

We can open the SVG file output with help of any web browser.

```
$ firefox /tmp/termtosvg_5waorper.svg
```

![][15]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/termtosvg-record-your-terminal-sessions-as-svg-animations-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/script-command-record-save-your-terminal-session-activity-linux/
[2]: https://www.2daygeek.com/terminalizer-a-tool-to-record-your-terminal-and-generate-animated-gif-images/
[3]: https://www.2daygeek.com/category/gif-recorder/
[4]: https://www.2daygeek.com/gifine-create-animated-gif-vedio-recorder-linux-mint-debian-ubuntu/
[5]: https://www.2daygeek.com/kgif-create-animated-gif-file-active-window-screen-recorder-capture-arch-linux-mint-fedora-ubuntu-debian-opensuse-centos/
[6]: https://www.2daygeek.com/peek-create-animated-gif-screen-recorder-capture-arch-linux-mint-fedora-ubuntu/
[7]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[8]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[9]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[10]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[11]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[12]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[13]: https://www.2daygeek.com/install-pip-manage-python-packages-linux/
[14]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[15]: https://www.2daygeek.com/wp-content/uploads/2018/12/Termtosvg-Record-Your-Terminal-Sessions-As-SVG-Animations-In-Linux-1.gif
