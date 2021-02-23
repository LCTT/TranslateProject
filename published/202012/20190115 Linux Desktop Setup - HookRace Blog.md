[#]: collector: (lujun9972)
[#]: translator: (chenmu-kk)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12883-1.html)
[#]: subject: (Linux Desktop Setup · HookRace Blog)
[#]: via: (https://hookrace.net/blog/linux-desktop-setup/)
[#]: author: (Dennis Felsing http://felsin9.de/nnis/)

十年 Linux 桌面生存指南
======

![](https://img.linux.net.cn/data/attachment/album/202012/03/223817smrej5qwsbqjb3vs.jpg)

从 2006 年开始转战 Linux 系统后，经过几年的实践，我的软件设置在过去十年内出人意料的固定。再过十年回顾一下，看看发生了什么，也许会非常有趣。在写这篇推文时，我迅速回顾了正在运行的内容：

![htop overview][2]

### 动机

我的软件介绍排序不分先后：

  * 程序应该运行在本地系统中以便我可以控制它，这其中并不包括云解决方案。
  * 程序应在终端中运行，以便于在任何地方连贯地使用它们，包括性能稍差的电脑或手机。
  * 通过使用终端软件，可以实现自动聚焦键盘。只有在一些有意义的地方，我会更喜欢使用鼠标，因为在打字期间一直伸手去拿鼠标感觉像在浪费时间。有时候过了一个小时我才注意到甚至还没有插鼠标。
  * 最好使用快速高效的软件，我不喜欢听到风扇的声音和感到房间在变热。我还可以继续长久地运行旧硬件，已经使用了 10 年的 Thinkpad x200s 还能很好地支持我所使用的软件。
  * 组合。我不想手动执行每个步骤，而是在需要时自动执行更多操作，这时自然是支持 shell。

### 操作系统

十二年前移除 Windows 系统后，我在 Linux 系统上经历了一个艰难的开始，当时我手上只有 [Gentoo Linux][3] 系统的安装光盘和一本打印的说明书，要用它们来实现一个可运行的 Linux 系统。虽然花费了几天的时间去编译和修整，但最终还是觉得自己受益颇多。

自此我再也没有转回 Windows 系统，但在持续的编译压力导致风扇失灵后，我将我的电脑系统切换到 [Arch Linux][4]。之后我将其他的电脑和私人服务器也切换到了 Arch Linux。作为一个滚动发布发行版，你可以随时升级软件包，但 [Arch Linux News][5] 已经详细报道了其中最主要的漏洞。

不过，令人烦恼的是一旦你更新了旧的内核模组，Arch Linux 就会移除旧版的相关信息。我经常注意到一旦我试着插入一个 USB 闪存盘，内核就无法加载相关组件。相反，每次内核升级后都应该进行重启。有一些 [方法][6] 可以解决这个问题，但我还没有实际地使用它们。

其他程序也会出现类似的情况，通常 Firefox 、 cron 或者 Samba 在升级后都需要重启，但恼人的是，它们没有警告你存在这种情况。我在工作中使用的 [SUSE][7] 很好地提醒了这种情况。

对于 [DDNet][8] 产品服务器，相较于 Arch Linux ，我更倾向于 [Debian][9] 系统，这样在每次升级时出现故障的几率更低。我的防火墙和路由器使用了 [OpenBSD][10] ，它拥有干净系统、文档和强大的 [pf 防火墙][11]，而我现在不需要一个单独的路由器。

### 窗口管理器

从我开始使用 Gentoo 后，我很快注意到 KDE 的编译时间非常长，这让我没办法继续使用它。我四处寻找更简单的解决方案，最初使用了 [Openbox][12] 和 [Fluxbox][13]。某次，为了能更多进行纯键盘操作，我开始尝试转入平铺窗口管理器，并在研究其初始版本的时候学习了 [dwm][14] 和 [awesome][15]。

最终，由于 [xmonad][16]的灵活性、可扩展性以及使用纯 [Haskell][17]（一种出色的函数编程语言）编写和配置，最终选择了它。一个例子是，我在家中运行一个 40" 4K 的屏幕，但经常会将它分为四个虚拟屏幕，每个虚拟屏幕显示一个工作区，每个工作区自动排列在我的窗口上。当然， xmonad 有一个对应的 [模块][18]。

[dzen][19] 和 [conky][20] 对我来说是一个非常简单的状态栏。我的整体 conky 配置看起来是这样的：

```
out_to_console yes
update_interval 1
total_run_times 0

TEXT
${downspeed eth0} ${upspeed eth0} | $cpu% ${loadavg 1} ${loadavg 2} ${loadavg 3} $mem/$memmax | ${time %F %T}
```

输入命令直接通过管道输入 dzen2：

```
conky | dzen2 -fn '-xos4-terminus-medium-r-normal-*-12-*-*-*-*-*-*-*' -bg '#000000' -fg '#ffffff' -p -e '' -x 1000 -w 920 -xs 1 -ta r
```

对我而言，一项重要功能是在完成工作后使终端发出蜂鸣声。只需要简单地在 zsh 中的 `PR_TITLEBAR` 变量中添加一个 `\a` 字符就可以做到，只要工作完成就可以发出蜂鸣声。当然，我使用了命令： 

```
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
```

将 `pcspkr` 内核模块列入黑名单来禁用实际的蜂鸣声。相反 urxvt 的 `URxvt.urgentOnBell: true` 设置会将声音变为尖锐。之后 xmonad 有一个 urgency 钩子来捕捉这类信号，并且我可以使用组合键自动聚焦到当前的发出紧急信号的窗口。在 dzen 中我可以看到一个漂亮且明亮的 `#ff0000` 紧急窗口。

在我笔记本上所得到的最终成品是：

![Laptop screenshot][22]

我听说前几年 [i3][23] 变得非常流行，但它要求更多的手动窗口对齐而不是自动对齐。

我意识到也有像 [tmux][24] 那样的终端多路复用器，但我仍想要一些图形化应用程序，因此最终我没有有效地使用它们。

### 终端连续性

为了使终端保持活跃状态，我使用了 [dtach][25] ，它只是模拟屏幕分离功能。为了使计算机上的每个终端都可连接和断开，我编写了一个小的封装脚本。 这意味着，即使必须重新启动 X 服务器，我也可以使所有终端都运行良好，包括本地和远程终端。

### Shell & 编程

对于 shell，我使用 [zsh][28] 而不是 [bash][27]，因为它有众多的功能。

作为终端模拟，我发现 [urxvt][29] 足够轻巧，支持 Unicode 编码和 256 色，具有出色的性能。另一个重要的功能是可以分别运行 urxvt 客户端和守护进程。因此，即使大量终端也几乎不占用任何内存（回滚缓冲区除外）。

对我而言，只有一种字体看起来绝对干净和完美： [Terminus][30]。 由于它是位图字体，因此所有内容都是完美像素，渲染速度极快且 CPU 使用率低。为了能使用 `CTRL-WIN-[1-7]` 在每个终端按需切换字体，我的 `~/.Xdefaults` 包含:

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

对于编程和书写，我使用 [Vim][31] 语法高亮显示和 [ctags][32] 进行索引，以及一些带有 `grep` 、`sed` 和其他用于搜索和操作的常用终端窗口。这可能不像 IDE 那样舒适，但可以实现更多的自动化。

Vim 的一个问题是你已经习惯了它的键映射，因此希望在任何地方都使用它们。

在 shell 功能不够强大时，[Python][33] 和 [Nim][34] 作为脚本语言也不错。

### 系统监控

[htop][35] （查看当前站点的后台运行，是托管服务器的实时视图）非常适合快速了解软件的当前运行状态。 [lm_sensors][36] 可以监控硬件温度、风扇和电压。 [powertop][37] 是一款由 Intel 发布的优秀省电小工具。 [ncdu][38] 可以交互式分析磁盘使用情况。

[nmap][39]、 iptraf-ng、 [tcpdump][40] 和 [Wireshark][41] 都是分析网络问题的基本工具。

当然还有很多更优秀的工具。

### 邮件 & 同步

在我的家庭服务器上，我为自己所有的邮箱账号运行了 [fetchmail][42] 守护进程。fetchmail 只是检索收到的邮件并调用 [procmail][43]：

```
#!/bin/sh
for i in /home/deen/.fetchmail/*; do
 FETCHMAILHOME=$i /usr/bin/fetchmail -m 'procmail -d %T' -d 60
done
```

配置非常简单，然后等待服务器通知我们有新的邮件：

```
poll imap.1und1.de protocol imap timeout 120 user "dennis@felsin9.de" password "XXX" folders INBOX keep ssl idle
```

我的 `.procmailrc` 配置包含一些备份全部邮件的规则，并将邮件整理在对应的目录下面。例如，基于邮件列表名或者邮件标题：

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

我使用 [msmtp][44] 来发送邮件，它也很好配置：

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

但是到目前为止，邮件还在服务器上。 我的文档全部存储在一个目录中，我使用 [Unison][45] 在所有计算机之间进行同步。Unison 可以视为双向交互式 [rsync][46]，我的邮件是这个文件目录下的一部分，因此它们最终存储在我的电脑上。

这也意味着，尽管邮件会立即到达我的邮箱，但我只是按需拿取，而不是邮件一到达时就立即收到通知。

从此我使用 [mutt][47] 阅读邮件，使用侧边栏显示我的邮件目录。 `/etc/mailcap` 文件对于显示非纯文本邮件（ HTML, Word 或者 PDF）不可或缺：

```
text/html;w3m -I %{charset} -T text/html; copiousoutput
application/msword; antiword %s; copiousoutput
application/pdf; pdftotext -layout /dev/stdin -; copiousoutput
```

### 新闻 & 通讯

[Newsboat][48] 是一个非常棒的终端 RSS/Atom 阅读器。我在一个有约 150 个提要的 `tach` 会话服务器上运行它。也可以在本地选择提要，例如：

```
ignore-article "https://forum.ddnet.tw/feed.php" "title =~ \"Map Testing •\" or title =~ \"Old maps •\" or title =~ \"Map Bugs •\" or title =~ \"Archive •\" or title =~ \"Waiting for mapper •\" or title =~ \"Other mods •\" or title =~ \"Fixes •\""
```

我以同样的方式使用 [Irssi][49] 进行 IRC 通讯。

### 日历

[remind][50] 是一个可以从命令行获取的日历。通过编辑 `rem` 文件可以设置新的提醒：

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

遗憾的是，目前 remind 中还没有中国农历的提醒功能，因此中国的节日不易计算。

我给提醒设置了两个名字：

```
rem -m -b1 -q -g
```

按时间顺序查看待办事项清单

```
rem -m -b1 -q -cuc12 -w$(($(tput cols)+1)) | sed -e "s/\f//g" | less
```

显示适应终端宽度的日历：

![remcal][51]

### 字典

[rdictcc][52] 是鲜为人知的字典工具，它可以使用 [dict.cc][53] 很棒的词典并将他们转存在本地数据库中：

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

### 记录和阅读

我有一个简单记录任务的备忘录，在 Vim 会话中基本上一直处于打开状态。我也使用备忘录作为工作中“已完成”工作的记录，这样就可以检查自己每天完成了哪些任务。

对于写文件、信件和演示文稿，我会使用 [LaTeX][54] 进行高级排版。德式的简单信件可以这样设置，例如：

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

在 [我的私人网站][55] 上可以找到更多的示例文档和演示文稿。

[Zathura][56] 读取 PDF 文件速度很快，支持 Vim 类控件，还支持两种不同的 PDF 后端： Poppler 和 MuPDF。另一方面，在偶尔遇到 Zathura 无法打开的文件时，[Evince][57] 则显得更全能一些。

### 图片编辑

简便的选择是，[GIMP][58] 和 [Inkscape][59] 分别用于照片编辑和交互式向量图形。

有时 [Imagemagick][60] 已经足够好了，它可以从命令行直接使用，从而自动编辑图片。同样 [Graphviz][61] 和 [TikZ][62] 可以用来绘制曲线图和其他图表。

### Web 浏览器

对于 Web 浏览器，我一直在使用 [Firefox][63]。相较于 Chrome，它的可扩展性更好，资源使用率更低。

不幸的是，在 Firefox 完全改用 Chrome 风格的扩展之后， [Pentadactyl][64] 扩展的开发就停止了，所以我的浏览器中再也没有令人满意的 Vim 类控件了。

### 媒体播放器

通过设置 `vo=gpu` 以及 `hwdec=vaapi`，具有硬件解码功能的 [mpv][65] 在播放期间 CPU 的占用率保持在 5%。相较于默认的 PulseAudio，mpv 中的 `audio-channels=2` 似乎可以使我的立体扬声器/耳机获得更清晰的降级混频。一个很棒的小功能是用 `Shift-Q` 退出，而不是只用 `Q` 来保存回放位置。当你与母语是其他语言的人一起看视频时，你可以使用 `--secondary-sid=` 同时显示两种字幕，主字幕位于底部，次字幕位于屏幕顶部。

我的无线鼠标可以简单地通过一个小的配置文件（ `~/.config/mpv/input.conf` ）实现远程控制 mpv ：

```
MOUSE_BTN5 run "mixer" "pcm" "-2"
MOUSE_BTN6 run "mixer" "pcm" "+2"
MOUSE_BTN1 cycle sub-visibility
MOUSE_BTN7 add chapter -1
MOUSE_BTN8 add chapter 1
```

[youtube-dl][66] 非常适合观看在线托管的视频，使用 `-f bestvideo+bestaudio/best --all-subs --embed-subs` 命令可获得最高质量的视频。

作为音乐播放器， [MOC][67] 不再活跃开发，但它仍是一个简易的播放器，可以播放各种可能的格式，包括最不常用的 Chiptune 格式。在 AUR 中有一个 [补丁][68] 增加了 PulseAudio 支持。即使在 CPU 时钟频率降到 800 MHz， MOC 也只使用了单核 CPU 的 1-2% 。

![moc][69]

我的音乐收藏夹保存在我的家庭服务器上，因此我可以从任何地方访问它。它使用 [SSHFS][70] 挂载并自动安装在 `/etc/fstab/` 目录下：

```
root@server:/media/media /mnt/media fuse.sshfs noauto,x-systemd.automount,idmap=user,IdentityFile=/root/.ssh/id_rsa,allow_other,reconnect 0 0
```

### 跨平台构建

除了 Linux 本身，它对于构建任何主流操作系统的软件包都很优秀！ 一开始，我使用 [QEMU][71] 与旧版 Debian、 Windows 以及 Mac OS X VM 一起构建这些平台。

现在我在旧版 Debian 发行版上转而使用 chroot （以获得最大的 Linux 兼容性），在 Windows 上使用 [MinGW][72] 进行交叉编译，在 Mac OS X 上则使用 [OSXCross][73]。

用于 [构建 DDNet][74] 的脚本以及 [更新库构建的说明][75] 的脚本都基于这个。

### 备份

通常，我们都会忘记备份。即使这是最后一节，它也不应该成为事后诸葛。

十年前我写了 [rrb][76] （反向 rsync 备份）重新封装了 `rsync` ，因此我只需要将备份服务器的 root SSH 权限授予正在备份的计算机。令人惊讶地是，尽管我一直在使用 rrb ，但它在过去十年里没有任何改变。

备份文件直接存储在文件系统中。使用硬链接实现增量备份（`--link-dest`）。一个简单的 [配置][77] 定义了备份保存时间，默认为：

```
KEEP_RULES=( \
   7  7 \ # One backup a day for the last 7 days
  31  8 \ # 8 more backups for the last month
 365 11 \ # 11 more backups for the last year
1825  4 \ # 4 more backups for the last 5 years
)
```

因为我的一些计算机没有静态 IP / DNS 但仍想使用 rrb 备份，那我会使用反向安全隧道（作为 systemd 服务）：

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

现在，隧道运行备份时，服务器可以通过 `ssh -p 27276 localhost` 命令或者使用 `.ssh/config` 到达服务器端。

```
Host cr-remote
 HostName localhost
 Port 27276
```

在谈及 SSH 技巧时，有时由于某些中断的路由会很难访问到服务器。在那种情况下你可以借道其他服务器的 SSH 连接，以获得更好的路由。在这种情况下，你可能通过美国连接访问到我的中国服务器，而来自德国的不可靠连接可能需要几个周：

```
Host chn.ddnet.tw
 ProxyCommand ssh -q usa.ddnet.tw nc -q0 chn.ddnet.tw 22
 Port 22
```

### 结语

感谢阅读我工具的收藏。这其中我也许遗漏了许多日常中自然成习惯的步骤。让我们来看看我的软件设置在下一年里能多稳定吧。如果你有任何问题，随时联系我 [dennis@felsin9.de][78] 。

在 [Hacker News][79] 下评论吧。

--------------------------------------------------------------------------------

via: https://hookrace.net/blog/linux-desktop-setup/

作者：[Dennis Felsing][a]
选题：[lujun9972][b]
译者：[chenmu-kk](https://github.com/chenmu-kk)
校对：[wxy](https://github.com/wxy)

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
