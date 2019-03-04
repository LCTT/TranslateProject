[#]: collector: (lujun9972)
[#]: translator: (zero-mk)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bash-Insulter : A Script That Insults An User When Typing A Wrong Command)
[#]: via: (https://www.2daygeek.com/bash-insulter-insults-the-user-when-typing-wrong-command/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Bash-Insulter : A Script That Insults An User When Typing A Wrong Command
======

This is such a nice and funny script that insult an user whenever they are typing a wrong command in terminal.

It’s make you to feel happy when you are working on some issues.

But somebody feel bad when the get an insult. However, i really feel happy when i get an insulted on terminal.

It’s a funny CLI tool that insults you with random phrases if you do mistake.

Also, it allows you to update your own phrases.

### How To Install Bash-Insulter In Linux?

Make sure, git package were installed on your system before performing Bash-Insulter installation. If no, use the following command to install it.

For **`Fedora`** system, use **[DNF Command][1]** to install git.

```
$ sudo dnf install git
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][2]** or **[APT Command][3]** to install git.

```
$ sudo apt install git
```

For **`Arch Linux`** based systems, use **[Pacman Command][4]** to install git.

```
$ sudo pacman -S git
```

For **`RHEL/CentOS`** systems, use **[YUM Command][5]** to install git.

```
$ sudo yum install git
```

For **`openSUSE Leap`** system, use **[Zypper Command][6]** to install git.

```
$ sudo zypper install git
```

We can easily install it by cloning the developer github repository.

First clone the Bash-insulter repository.

```
$ git clone https://github.com/hkbakke/bash-insulter.git bash-insulter
```

Move the downloaded file under `/etc` folder.

```
$ sudo cp bash-insulter/src/bash.command-not-found /etc/
```

Append the following lines into `/etc/bash.bashrc` file.

```
$ vi /etc/bash.bashrc

#Bash Insulter
if [ -f /etc/bash.command-not-found ]; then
 . /etc/bash.command-not-found
fi
```

Run the following command to take the changes to effect.

```
$ sudo source /etc/bash.bashrc
```

Do you want to test this? if so, type some wrong command in terminal and see how it insult you.

```
$ unam -a

$ pin 2daygeek.com
```

![][8]

If you would like to append your own phrases then navigate to the following file and update it.

You can add your phrases within `messages` section.

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
校对：[校对者ID](https://github.com/校对者ID)

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
