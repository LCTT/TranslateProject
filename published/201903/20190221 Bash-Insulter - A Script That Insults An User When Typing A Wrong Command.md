[#]: collector: "lujun9972"
[#]: translator: "zero-mk"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-10593-1.html"
[#]: subject: "Bash-Insulter : A Script That Insults An User When Typing A Wrong Command"
[#]: via: "https://www.2daygeek.com/bash-insulter-insults-the-user-when-typing-wrong-command/"
[#]: author: "Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/"

Bash-Insulter：一个在输入错误命令时嘲讽用户的脚本
======

这是一个非常有趣的脚本，每当用户在终端输入错误的命令时，它都会嘲讽用户。

它让你在解决一些问题时会感到快乐。有的人在受到终端嘲讽的时候感到不愉快。但是，当我受到终端的批评时，我真的很开心。

这是一个有趣的 CLI 工具，在你弄错的时候，会用随机短语嘲讽你。此外，它允许你添加自己的短语。

### 如何在 Linux 上安装 Bash-Insulter?

在安装 Bash-Insulter 之前，请确保你的系统上安装了 git。如果没有，请使用以下命令安装它。

对于 Fedora 系统, 请使用 [DNF 命令][1] 安装 git。

```
$ sudo dnf install git
```

对于 Debian/Ubuntu 系统，请使用 [APT-GET 命令][2] 或者 [APT 命令][3] 安装 git。

```
$ sudo apt install git
```

对于基于 Arch Linux 的系统，请使用 [Pacman 命令][4] 安装 git。

```
$ sudo pacman -S git
```

对于 RHEL/CentOS 系统，请使用 [YUM 命令][5] 安装 git。

```
$ sudo yum install git
```

对于 openSUSE Leap 系统，请使用 [Zypper 命令][6] 安装 git。

```
$ sudo zypper install git
```

我们可以通过<ruby>克隆<rt>clone</rt></ruby>开发人员的 GitHub 存储库轻松地安装它。

首先克隆 Bash-insulter 存储库。

```
$ git clone https://github.com/hkbakke/bash-insulter.git bash-insulter
```

将下载的文件移动到文件夹 `/etc` 下。

```
$ sudo cp bash-insulter/src/bash.command-not-found /etc/
```

将下面的代码添加到 `/etc/bash.bashrc` 文件中。

```
$ vi /etc/bash.bashrc

#Bash Insulter
if [ -f /etc/bash.command-not-found ]; then
 . /etc/bash.command-not-found
fi
```

运行以下命令使更改生效。

```
$ sudo source /etc/bash.bashrc
```

你想测试一下安装是否生效吗？你可以试试在终端上输入一些错误的命令，看看它如何嘲讽你。

```
$ unam -a

$ pin 2daygeek.com
```

![][8]

如果你想附加你自己的短语，则导航到以下文件并更新它。你可以在 `messages` 部分中添加短语。

```
# vi /etc/bash.command-not-found

print_message () {

    local messages
    local message

    messages=(
        "Boooo!"
        "Don't you know anything?"
        "RTFM!"
        "Haha, n00b!"
        "Wow! That was impressively wrong!"
        "Pathetic"
        "The worst one today!"
        "n00b alert!"
        "Your application for reduced salary has been sent!"
        "lol"
        "u suk"
        "lol... plz"
        "plz uninstall"
        "And the Darwin Award goes to.... ${USER}!"
        "ERROR_INCOMPETENT_USER"
        "Incompetence is also a form of competence"
        "Bad."
        "Fake it till you make it!"
        "What is this...? Amateur hour!?"
        "Come on! You can do it!"
        "Nice try."
        "What if... you type an actual command the next time!"
        "What if I told you... it is possible to type valid commands."
        "Y u no speak computer???"
        "This is not Windows"
        "Perhaps you should leave the command line alone..."
        "Please step away from the keyboard!"
        "error code: 1D10T"
        "ACHTUNG! ALLES TURISTEN UND NONTEKNISCHEN LOOKENPEEPERS! DAS KOMPUTERMASCHINE IST NICHT FÜR DER GEFINGERPOKEN UND MITTENGRABEN! ODERWISE IST EASY TO SCHNAPPEN DER SPRINGENWERK, BLOWENFUSEN UND POPPENCORKEN MIT SPITZENSPARKEN. IST NICHT FÜR GEWERKEN BEI DUMMKOPFEN. DER RUBBERNECKEN SIGHTSEEREN KEEPEN DAS COTTONPICKEN HÄNDER IN DAS POCKETS MUSS. ZO RELAXEN UND WATSCHEN DER BLINKENLICHTEN."
        "Pro tip: type a valid command!"
        "Go outside."
        "This is not a search engine."
        "(╯°□°）╯︵ ┻━┻"
        "¯\_(ツ)_/¯"
        "So, I'm just going to go ahead and run rm -rf / for you."
        "Why are you so stupid?!"
        "Perhaps computers is not for you..."
        "Why are you doing this to me?!"
        "Don't you have anything better to do?!"
        "I am _seriously_ considering 'rm -rf /'-ing myself..."
        "This is why you get to see your children only once a month."
        "This is why nobody likes you."
        "Are you even trying?!"
        "Try using your brain the next time!"
        "My keyboard is not a touch screen!"
        "Commands, random gibberish, who cares!"
        "Typing incorrect commands, eh?"
        "Are you always this stupid or are you making a special effort today?!"
        "Dropped on your head as a baby, eh?"
        "Brains aren't everything. In your case they're nothing."
        "I don't know what makes you so stupid, but it really works."
        "You are not as bad as people say, you are much, much worse."
        "Two wrongs don't make a right, take your parents as an example."
        "You must have been born on a highway because that's where most accidents happen."
        "If what you don't know can't hurt you, you're invulnerable."
        "If ignorance is bliss, you must be the happiest person on earth."
        "You're proof that god has a sense of humor."
        "Keep trying, someday you'll do something intelligent!"
        "If shit was music, you'd be an orchestra."
        "How many times do I have to flush before you go away?"
    )
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bash-insulter-insults-the-user-when-typing-wrong-command/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[zero-mk](https://github.com/zero-mk)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[2]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[5]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[6]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[7]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[8]: https://www.2daygeek.com/wp-content/uploads/2019/02/bash-insulter-insults-the-user-when-typing-wrong-command-1.png
