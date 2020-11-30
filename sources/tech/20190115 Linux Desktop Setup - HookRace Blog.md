[#]: collector: (lujun9972)
[#]: translator: (chenmu-kk)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Desktop Setup · HookRace Blog)
[#]: via: (https://hookrace.net/blog/linux-desktop-setup/)
[#]: author: (Dennis Felsing http://felsin9.de/nnis/)

Linux桌面设置
======


从 2006 年开始转战 Linux 系统后，经过几年的实践，我的软件设置在过去十年内出人意料的固定。再过十年回顾一下，看看发生了什么，也许会非常有趣。在写这篇推文时，我迅速回顾了正在运行的内容：

[![htop overview][1]][2]

### 契机

我的软件介绍排序不分先后：

  * 程序应该运行在本地系统中以便我可以控制它，这其中并不包括云解决方案。
  * 程序应在终端中运行，以便于在任何地方连贯地使用它们，包括性能稍差的电脑或手机。
  * 通过使用终端软件，可以实现自动聚焦键盘。只有在一些有意义的地方，我会更喜欢使用鼠标，因为在打字期间一直伸手去拿鼠标感觉像在浪费时间。有时候过了一个小时我才注意到甚至还没有插鼠标。
  * 最好使用快速高效的软件，我不喜欢听到风扇的声音和感到房间在变热。我还可以继续长久地运行旧硬件，已经使用了 10 年的 Thinkpad x200s 还能很好地支持我所使用的软件。
  * 组合。我不想手动执行每个步骤，而是在需要时自动执行更多操作，这时自然是支持 shell。



### 操作系统

十二年前移除 Windows 系统后，我在 Linux 系统上经历了一个艰难的开始，当时我手上只有 [Gentoo Linux][3] 系统的安装光盘和一本打印的说明书，要用它们来实现一个可运行的 Linux 系统。虽然花费了几天的时间去编辑和修整，但最终还是觉得自己受益颇多。

自此我再也没有转回 Windows 系统，但在持续的编译压力导致风扇失灵后，我将我的电脑系统切换到 [Arch Linux][4]。之后我将其他的电脑和私人服务器也切换到了 Arch Linux。作为一个滚动发布发行版，你可以随时升级软件包，但 [Arch Linux News][5] 已经详细报道了其中最主要的漏洞。

不过，令人烦恼的事一旦你更新了旧的内核模组， Arch Linux 就会移除旧版的相关信息。我经常注意到一旦我试着插入一个 USB 闪存驱动，内核就无法加载相关组件。相反，每次内核升级后都应该进行重启。有一些 [方法][6] 可以解决这个问题，但我还没有实际地使用它们。

其他程序也会出现类似的情况，通常 Firefox 、 cron 或者 Samba 在升级后都需要重启，但恼人的是，它们没有警告你存在这种情况不是提醒你这件事本身。我在工作中使用的 [SUSE][7] 很好地提醒了这种情况。

对于 [DDNet][8] ，我更喜欢使用 Arch Linux 的 [Debian][9] 系统，这样在每次升级时出现故障的几率更低。我的防火墙和路由器使用了拥有干净系统、文件和强大的 [OpenBSD][10] 的 [pf firewall][11]。

### 视窗管理

从我开始使用 Gentoo 后，我很快注意到 KDE 的编译时间非常长，这让我没办法继续使用它。我四处寻找更简单的解决方案，最初使用了 [Openbox][12] 和 [Fluxbox][13]。某次，为了能更多进行纯键盘操作，我开始转入平铺窗口管理器训练，并在研究其初始版本的时候学习了 [dwm][14] 和 [awesome][15]。

最终，由于 [xmonad][16]的灵活性，可扩展性以及使用纯 [Haskell][17] 一种出色的功能编程语言）编写和配置，最终选择了它。一个例子是，我在家中运行一个 40" 4K 的屏幕，但经常会将它分为四个虚拟屏幕，每个虚拟屏幕显示一个工作区，每个工作区自动排列在我的窗口上。 当然， xmonad 有一个对应的 [模块][18]。

[dzen][19] 和 [conky][20] 对我来说是一个非常简单的状态栏。我的整体conky配置看起来是这样的：

```
out_to_console yes
update_interval 1
total_run_times 0

TEXT
${downspeed eth0} ${upspeed eth0} | $cpu% ${loadavg 1} ${loadavg 2} ${loadavg 3} $mem/$memmax | ${time %F %T}
```

输入命令直接通过管道输入dzen2 `conky | dzen2 -fn '-xos4-terminus-medium-r-normal-*-12-*-*-*-*-*-*-*' -bg '#000000' -fg '#ffffff' -p -e '' -x 1000 -w 920 -xs 1 -ta r`.

对我而言，一项重要功能是在完成工作后使终端发出蜂鸣声。只需要简单地在 zsh 中的 `PR_TITLEBAR` 变量中添加一个 `\a` 字符就可以做到，只要工作完成就可以发出蜂鸣声。当然，我使用了 `echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf` 命令，将 `pcspkr` 内核模块列入黑名单来禁用实际的蜂鸣声。相反 urxvt 的`URxvt.urgentOnBell: true` 设置会将声音变为尖锐。之后 xmonad 有一个 urgency hook 来捕捉这类信号，并且我可以使用组合键自动聚焦到当前紧急窗口。在 dzen 中我可以看到一个漂亮且明亮的 `#ff0000`紧急窗口。

在我笔记本上所得到的最终成品是：

[![Laptop screenshot][21]][22]

我听说前几年 [i3][23] 变得非常流行，但它要求更多的手动窗口对齐而不是自动对齐。

我意识到也有像 [tmux][24] 那样的终端多路复用器，但我仍想要一些图形化应用程序，因此最终我没有有效地使用它们。

### 终端连续性

为了使终端保持活跃状态，我使用了 [dtach][25] ，它只是模拟屏幕分离功能。 为了使计算机上的每个终端都可连接和断开，我编写了一个小的封装脚本。 这意味着，即使必须重新启动 X 服务器，我也可以使所有终端都运行良好，包括本地和远程终端。

### Shell & Programming

Instead of [bash][27] I use [zsh][28] as my shell for its huge number of features.

As a terminal emulator I found [urxvt][29] to be simple enough, support Unicode and 256 colors and has great performance. Another great feature is being able to run the urxvt client and daemon separately, so that even a large number of terminals barely takes up any memory (except for the scrollback buffer).

There is only one font that looks absolutely clean and perfect to me: [Terminus][30]. Since i’s a bitmap font everything is pixel perfect and renders extremely fast and at low CPU usage. In order to switch fonts on-demand in each terminal with `CTRL-WIN-[1-7]` my ~/.Xdefaults contains:

```
URxvt.font: -xos4-terminus-medium-r-normal-*-14-*-*-*-*-*-*-*
dzen2.font: -xos4-terminus-medium-r-normal-*-14-*-*-*-*-*-*-*

URxvt.keysym.C-M-1: command:\033]50;-xos4-terminus-medium-r-normal-*-12-*-*-*-*-*-*-*\007
URxvt.keysym.C-M-2: command:\033]50;-xos4-terminus-medium-r-normal-*-14-*-*-*-*-*-*-*\007
URxvt.keysym.C-M-3: command:\033]50;-xos4-terminus-medium-r-normal-*-18-*-*-*-*-*-*-*\007
URxvt.keysym.C-M-4: command:\033]50;-xos4-terminus-medium-r-normal-*-22-*-*-*-*-*-*-*\007
URxvt.keysym.C-M-5: command:\033]50;-xos4-terminus-medium-r-normal-*-24-*-*-*-*-*-*-*\007
URxvt.keysym.C-M-6: command:\033]50;-xos4-terminus-medium-r-normal-*-28-*-*-*-*-*-*-*\007
URxvt.keysym.C-M-7: command:\033]50;-xos4-terminus-medium-r-normal-*-32-*-*-*-*-*-*-*\007

URxvt.keysym.C-M-n: command:\033]10;#ffffff\007\033]11;#000000\007\033]12;#ffffff\007\033]706;#00ffff\007\033]707;#ffff00\007
URxvt.keysym.C-M-b: command:\033]10;#000000\007\033]11;#ffffff\007\033]12;#000000\007\033]706;#0000ff\007\033]707;#ff0000\007
```

For programming and writing I use [Vim][31] with syntax highlighting and [ctags][32] for indexing, as well as a few terminal windows with grep, sed and the other usual suspects for search and manipulation. This is probably not at the same level of comfort as an IDE, but allows me more automation.

One problem with Vim is that you get so used to its key mappings that you’ll want to use them everywhere.

[Python][33] and [Nim][34] do well as scripting languages where the shell is not powerful enough.

### System Monitoring

[htop][35] (look at the background of that site, it’s a live view of the server that’s hosting it) works great for getting a quick overview of what the software is currently doing. [lm_sensors][36] allows monitoring the hardware temperatures, fans and voltages. [powertop][37] is a great little tool by Intel to find power savings. [ncdu][38] lets you analyze disk usage interactively.

[nmap][39], iptraf-ng, [tcpdump][40] and [Wireshark][41] are essential tools for analyzing network problems.

There are of course many more great tools.

### Mails & Synchronization

On my home server I have a [fetchmail][42] daemon running for each email acccount that I have. Fetchmail just retrieves the incoming emails and invokes [procmail][43]:

```
#!/bin/sh
for i in /home/deen/.fetchmail/*; do
 FETCHMAILHOME=$i /usr/bin/fetchmail -m 'procmail -d %T' -d 60
done
```

The configuration is as simple as it could be and waits for the server to inform us of fresh emails:

```
poll imap.1und1.de protocol imap timeout 120 user "dennis@felsin9.de" password "XXX" folders INBOX keep ssl idle
```

My `.procmailrc` config contains a few rules to backup all mails and sort them into the correct directories, for example based on the mailing list id or from field in the mail header:

```
MAILDIR=/home/deen/shared/Maildir
LOGFILE=$HOME/.procmaillog
LOGABSTRACT=no
VERBOSE=off
FORMAIL=/usr/bin/formail
NL="
"

:0wc
* ! ? test -d /media/mailarchive/`date +%Y`
| mkdir -p /media/mailarchive/`date +%Y`

# Make backups of all mail received in format YYYY/YYYY-MM
:0c
/media/mailarchive/`date +%Y`/`date +%Y-%m`

:0
* ^From: .*(.*@.*.kit.edu|.*@.*.uka.de|.*@.*.uni-karlsruhe.de)
$MAILDIR/.uni/

:0
* ^list-Id:.*lists.kit.edu
$MAILDIR/.uni-ml/

[...]
```

To send emails I use [msmtp][44], which is also great to configure:

```
account default
host smtp.1und1.de
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
auth on
from dennis@felsin9.de
user dennis@felsin9.de
password XXX

[...]
```

But so far the emails are still on the server. My documents are all stored in a directory that I synchronize between all computers using [Unison][45]. Think of Unison as a bidirectional interactive [rsync][46]. My emails are part of this documents directory and thus they end up on my desktop computers.

This also means that while the emails reach my server immediately, I only fetch them on deman instead of getting instant notifications when an email comes in.

From there I read the mails with [mutt][47], using the sidebar plugin to display my mail directories. The `/etc/mailcap` file is essential to display non-plaintext mails containing HTML, Word or PDF:

```
text/html;w3m -I %{charset} -T text/html; copiousoutput
application/msword; antiword %s; copiousoutput
application/pdf; pdftotext -layout /dev/stdin -; copiousoutput
```

### News & Communication

[Newsboat][48] is a nice little RSS/Atom feed reader in the terminal. I have it running on the server in a `tach` session with about 150 feeds. Filtering feeds locally is also possible, for example:

```
ignore-article "https://forum.ddnet.tw/feed.php" "title =~ \"Map Testing •\" or title =~ \"Old maps •\" or title =~ \"Map Bugs •\" or title =~ \"Archive •\" or title =~ \"Waiting for mapper •\" or title =~ \"Other mods •\" or title =~ \"Fixes •\""
```

I use [Irssi][49] the same way for communication via IRC.

### Calendar

[remind][50] is a calendar that can be used from the command line. Setting new reminders is done by editing the `rem` files:

```
# One time events
REM 2019-01-20 +90 Flight to China %b

# Recurring Holidays
REM 1 May +90 Holiday "Tag der Arbeit" %b
REM [trigger(easterdate(year(today()))-2)] +90 Holiday "Karfreitag" %b

# Time Change
REM Nov Sunday 1 --7 +90 Time Change (03:00 -> 02:00) %b
REM Apr Sunday 1 --7 +90 Time Change (02:00 -> 03:00) %b

# Birthdays
FSET birthday(x) "'s " + ord(year(trigdate())-x) + " birthday is %b"
REM 16 Apr +90 MSG Andreas[birthday(1994)]

# Sun
SET $LatDeg 49
SET $LatMin 19
SET $LatSec 49
SET $LongDeg -8
SET $LongMin -40
SET $LongSec -24

MSG Sun from [sunrise(trigdate())] to [sunset(trigdate())]
[...]
```

Unfortunately there is no Chinese Lunar calendar function in remind yet, so Chinese holidays can’t be calculated easily.

I use two aliases for remind:

```
rem -m -b1 -q -g
```

to see a list of the next events in chronological order and

```
rem -m -b1 -q -cuc12 -w$(($(tput cols)+1)) | sed -e "s/\f//g" | less
```

to show a calendar fitting just the width of my terminal:

![remcal][51]

### Dictionary

[rdictcc][52] is a little known dictionary tool that uses the excellent dictionary files from [dict.cc][53] and turns them into a local database:

```
$ rdictcc rasch
====================[ A => B ]====================
rasch:
 - apace
 - brisk [speedy]
 - cursory
 - in a timely manner
 - quick
 - quickly
 - rapid
 - rapidly
 - sharpish [Br.] [coll.]
 - speedily
 - speedy
 - swift
 - swiftly
rasch [gehen]:
 - smartly [quickly]
Rasch {n} [Zittergras-Segge]:
 - Alpine grass [Carex brizoides]
 - quaking grass sedge [Carex brizoides]
Rasch {m} [regional] [Putzrasch]:
 - scouring pad
====================[ B => A ]====================
Rasch model:
 - Rasch-Modell {n}
```

### Writing and Reading

I have a simple todo file containing my tasks, that is basically always sitting open in a Vim session. For work I also use the todo file as a “done” file so that I can later check what tasks I finished on each day.

For writing documents, letters and presentations I use [LaTeX][54] for its superior typesetting. A simple letter in German format can be set like this for example:

```
\documentclass[paper = a4, fromalign = right]{scrlttr2}
\usepackage{german}
\usepackage{eurosym}
\usepackage[utf8]{inputenc}
\setlength{\parskip}{6pt}
\setlength{\parindent}{0pt}

\setkomavar{fromname}{Dennis Felsing}
\setkomavar{fromaddress}{Meine Str. 1\\69181 Leimen}
\setkomavar{subject}{Titel}

\setkomavar*{enclseparator}{Anlagen}

\makeatletter
\@setplength{refvpos}{89mm}
\makeatother

\begin{document}
\begin{letter} {Herr Soundso\\Deine Str. 2\\69121 Heidelberg}
\opening{Sehr geehrter Herr Soundso,}

Sie haben bei mir seit dem Bla Bla Bla.

Ich fordere Sie hiermit zu Bla Bla Bla auf.

\closing{Mit freundlichen Grüßen}

\end{letter}
\end{document}
```

Further example documents and presentations can be found over at [my private site][55].

To read PDFs [Zathura][56] is fast, has Vim-like controls and even supports two different PDF backends: Poppler and MuPDF. [Evince][57] on the other hand is more full-featured for the cases where I encounter documents that Zathura doesn’t like.

### Graphical Editing

[GIMP][58] and [Inkscape][59] are easy choices for photo editing and interactive vector graphics respectively.

In some cases [Imagemagick][60] is good enough though and can be used straight from the command line and thus automated to edit images. Similarly [Graphviz][61] and [TikZ][62] can be used to draw graphs and other diagrams.

### Web Browsing

As a web browser I’ve always used [Firefox][63] for its extensibility and low resource usage compared to Chrome.

Unfortunately the [Pentadactyl][64] extension development stopped after Firefox switched to Chrome-style extensions entirely, so I don’t have satisfying Vim-like controls in my browser anymore.

### Media Players

[mpv][65] with hardware decoding allows watching videos at 5% CPU load using the `vo=gpu` and `hwdec=vaapi` config settings. `audio-channels=2` in mpv seems to give me clearer downmixing to my stereo speakers / headphones than what PulseAudio does by default. A great little feature is exiting with `Shift-Q` instead of just `Q` to save the playback location. When watching with someone with another native tongue you can use `--secondary-sid=` to show two subtitles at once, the primary at the bottom, the secondary at the top of the screen

My wirelss mouse can easily be made into a remote control with mpv with a small `~/.config/mpv/input.conf`:

```
MOUSE_BTN5 run "mixer" "pcm" "-2"
MOUSE_BTN6 run "mixer" "pcm" "+2"
MOUSE_BTN1 cycle sub-visibility
MOUSE_BTN7 add chapter -1
MOUSE_BTN8 add chapter 1
```

[youtube-dl][66] works great for watching videos hosted online, best quality can be achieved with `-f bestvideo+bestaudio/best --all-subs --embed-subs`.

As a music player [MOC][67] hasn’t been actively developed for a while, but it’s still a simple player that plays every format conceivable, including the strangest Chiptune formats. In the AUR there is a [patch][68] adding PulseAudio support as well. Even with the CPU clocked down to 800 MHz MOC barely uses 1-2% of a single CPU core.

![moc][69]

My music collection sits on my home server so that I can access it from anywhere. It is mounted using [SSHFS][70] and automount in the `/etc/fstab/`:

```
root@server:/media/media /mnt/media fuse.sshfs noauto,x-systemd.automount,idmap=user,IdentityFile=/root/.ssh/id_rsa,allow_other,reconnect 0 0
```

### Cross-Platform Building

Linux is great to build packages for any major operating system except Linux itself! In the beginning I used [QEMU][71] to with an old Debian, Windows and Mac OS X VM to build for these platforms.

Nowadays I switched to using chroot for the old Debian distribution (for maximum Linux compatibility), [MinGW][72] to cross-compile for Windows and [OSXCross][73] to cross-compile for Mac OS X.

The script used to [build DDNet][74] as well as the [instructions for updating library builds][75] are based on this.

### Backups

As usual, we nearly forgot about backups. Even if this is the last chapter, it should not be an afterthought.

I wrote [rrb][76] (reverse rsync backup) 10 years ago to wrap rsync so that I only need to give the backup server root SSH rights to the computers that it is backing up. Surprisingly rrb needed 0 changes in the last 10 years, even though I kept using it the entire time.

The backups are stored straight on the filesystem. Incremental backups are implemented using hard links (`--link-dest`). A simple [config][77] defines how long backups are kept, which defaults to:

```
KEEP_RULES=( \
 7 7 \ # One backup a day for the last 7 days
 31 8 \ # 8 more backups for the last month
 365 11 \ # 11 more backups for the last year
1825 4 \ # 4 more backups for the last 5 years
)
```

Since some of my computers don’t have a static IP / DNS entry and I still want to back them up using rrb I use a reverse SSH tunnel (as a systemd service) for them:

```
[Unit]
Description=Reverse SSH Tunnel
After=network.target

[Service]
ExecStart=/usr/bin/ssh -N -R 27276:localhost:22 -o "ExitOnForwardFailure yes" server
KillMode=process
Restart=always

[Install]
WantedBy=multi-user.target
```

Now the server can reach the client through `ssh -p 27276 localhost` while the tunnel is running to perform the backup, or in `.ssh/config` format:

```
Host cr-remote
 HostName localhost
 Port 27276
```

While talking about SSH hacks, sometimes a server is not easily reachable thanks to some bad routing. In that case you can route the SSH connection through another server to get better routing, in this case going through the USA to reach my Chinese server which had not been reliably reachable from Germany for a few weeks:

```
Host chn.ddnet.tw
 ProxyCommand ssh -q usa.ddnet.tw nc -q0 chn.ddnet.tw 22
 Port 22
```

### Final Remarks

Thanks for reading my random collection of tools. I probably forgot many programs that I use so naturally every day that I don’t even think about them anymore. Let’s see how stable my software setup stays in the next years. If you have any questions, feel free to get in touch with me at [dennis@felsin9.de][78].

Comments on [Hacker News][79].

--------------------------------------------------------------------------------

via: https://hookrace.net/blog/linux-desktop-setup/

作者：[Dennis Felsing][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://felsin9.de/nnis/
[b]: https://github.com/lujun9972
[1]: https://hookrace.net/public/linux-desktop/htop_small.png
[2]: https://hookrace.net/public/linux-desktop/htop.png
[3]: https://gentoo.org/
[4]: https://www.archlinux.org/
[5]: https://www.archlinux.org/news/
[6]: https://www.reddit.com/r/archlinux/comments/4zrsc3/keep_your_system_fully_functional_after_a_kernel/
[7]: https://www.suse.com/
[8]: https://ddnet.tw/
[9]: https://www.debian.org/
[10]: https://www.openbsd.org/
[11]: https://www.openbsd.org/faq/pf/
[12]: http://openbox.org/wiki/Main_Page
[13]: http://fluxbox.org/
[14]: https://dwm.suckless.org/
[15]: https://awesomewm.org/
[16]: https://xmonad.org/
[17]: https://www.haskell.org/
[18]: http://hackage.haskell.org/package/xmonad-contrib-0.15/docs/XMonad-Layout-LayoutScreens.html
[19]: http://robm.github.io/dzen/
[20]: https://github.com/brndnmtthws/conky
[21]: https://hookrace.net/public/linux-desktop/laptop_small.png
[22]: https://hookrace.net/public/linux-desktop/laptop.png
[23]: https://i3wm.org/
[24]: https://github.com/tmux/tmux/wiki
[25]: http://dtach.sourceforge.net/
[26]: https://github.com/def-/tach/blob/master/tach
[27]: https://www.gnu.org/software/bash/
[28]: http://www.zsh.org/
[29]: http://software.schmorp.de/pkg/rxvt-unicode.html
[30]: http://terminus-font.sourceforge.net/
[31]: https://www.vim.org/
[32]: http://ctags.sourceforge.net/
[33]: https://www.python.org/
[34]: https://nim-lang.org/
[35]: https://hisham.hm/htop/
[36]: http://lm-sensors.org/
[37]: https://01.org/powertop/
[38]: https://dev.yorhel.nl/ncdu
[39]: https://nmap.org/
[40]: https://www.tcpdump.org/
[41]: https://www.wireshark.org/
[42]: http://www.fetchmail.info/
[43]: http://www.procmail.org/
[44]: https://marlam.de/msmtp/
[45]: https://www.cis.upenn.edu/~bcpierce/unison/
[46]: https://rsync.samba.org/
[47]: http://www.mutt.org/
[48]: https://newsboat.org/
[49]: https://irssi.org/
[50]: https://www.roaringpenguin.com/products/remind
[51]: https://hookrace.net/public/linux-desktop/remcal.png
[52]: https://github.com/tsdh/rdictcc
[53]: https://www.dict.cc/
[54]: https://www.latex-project.org/
[55]: http://felsin9.de/nnis/research/
[56]: https://pwmt.org/projects/zathura/
[57]: https://wiki.gnome.org/Apps/Evince
[58]: https://www.gimp.org/
[59]: https://inkscape.org/
[60]: https://imagemagick.org/Usage/
[61]: https://www.graphviz.org/
[62]: https://sourceforge.net/projects/pgf/
[63]: https://www.mozilla.org/en-US/firefox/new/
[64]: https://github.com/5digits/dactyl
[65]: https://mpv.io/
[66]: https://rg3.github.io/youtube-dl/
[67]: http://moc.daper.net/
[68]: https://aur.archlinux.org/packages/moc-pulse/
[69]: https://hookrace.net/public/linux-desktop/moc.png
[70]: https://github.com/libfuse/sshfs
[71]: https://www.qemu.org/
[72]: http://www.mingw.org/
[73]: https://github.com/tpoechtrager/osxcross
[74]: https://github.com/ddnet/ddnet-scripts/blob/master/ddnet-release.sh
[75]: https://github.com/ddnet/ddnet-scripts/blob/master/ddnet-lib-update.sh
[76]: https://github.com/def-/rrb/blob/master/rrb
[77]: https://github.com/def-/rrb/blob/master/config.example
[78]: mailto:dennis@felsin9.de
[79]: https://news.ycombinator.com/item?id=18979731
