Command line fun: Insult the user when typing wrong bash command
======
You can configure sudo command to insult user when they type the wrong password. Now, it is possible to abuse insult the user when they enter the wrong command at the shell prompt.


## Say hello bash-insulter

From the Github page:

> Randomly insults the user when typing wrong command. It use a new builtin error-handling function named command_not_found_handle in bash 4.x.

## Installation

Type the following git command to clone repo:
`git clone https://github.com/hkbakke/bash-insulter.git bash-insulter`
Sample outputs:
```
Cloning into 'bash-insulter'...
remote: Counting objects: 52, done.
remote: Compressing objects: 100% (49/49), done.
remote: Total 52 (delta 12), reused 12 (delta 2), pack-reused 0
Unpacking objects: 100% (52/52), done.

```

Edit your ~/.bashrc or /etc/bash.bashrc using a text editor such as vi command:
`$ vi ~/.bashrc`
Append the following lines (see [if..else..fi statement][1] and [source command][2]):
```
if [ -f $HOME/bash-insulter/src/bash.command-not-found ]; then
    source $HOME/bash-insulter/src/bash.command-not-found
fi
```

Save and close the file. Login again or just run it manually if you do not want to logout:
```
$ . $HOME/bash-insulter/src/bash.command-not-found
```

## How do I use it?

Just type some invalid commands:
```
$ ifconfigs
$ dates
```
Sample outputs:
[![An interesting bash hook feature to insult you when you type an invalid command. ][3]][3]

## Customization

You need to edit $HOME/bash-insulter/src/bash.command-not-found:
`$ vi $HOME/bash-insulter/src/bash.command-not-found`
Sample code:
```
command_not_found_handle () {
    local INSULTS=(
        "Boooo!"
        "Don't you know anything?"
        "RTFM!"
        "Hahaha, n00b!"
        "Wow! That was impressively wrong!"
        "What are you doing??"
        "Pathetic"
        "...and this is the best you can do??"
        "The worst one today!"
        "n00b alert!"
        "Your application for reduced salary has been sent!"
        "lol"
        "u suk"
        "lol... plz"
        "plz uninstall"
        "And the Darwin Award goes to.... ${USER}!"
        "ERROR_INCOMPETENT_USER"
        "Incompetence is also competence"
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
    )
 
    # Seed "random" generator
    RANDOM=$(date +%s%N)
    VALUE=$((${RANDOM}%2))
 
    if [[ ${VALUE} -lt 1 ]]; then
        printf "\n  $(tput bold)$(tput setaf 1)$(shuf -n 1 -e "${INSULTS[@]}")$(tput sgr0)\n\n"
    fi
 
    echo "-bash: $1: command not found"
 
    # Return the exit code normally returned on invalid command
    return 127
}
```

## sudo insults

Edit the sudoers file:
`$ sudo visudo`
Append the following line:
`Defaults insults`
Or update as follows i.e. add insults at the end of line:
`Defaults !lecture,tty_tickets,!fqdn,insults`
Here is my file:
```
Defaults	env_reset
Defaults	mail_badpass
Defaults    secure_path = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
## If set, sudo will insult users when they enter an incorrect password. ##
Defaults	insults

# Host alias specification

# User alias specification

# Cmnd alias specification

# User privilege specification
root ALL = (ALL:ALL) ALL

# Members of the admin group may gain root privileges
% admin ALL = (ALL) ALL   

# Allow members of group sudo to execute any command
% sudo ALL = (ALL:ALL) ALL   

# See sudoers(5) for more information on "#include" directives:

#includedir /etc/sudoers.d
```

Try it out:
```
$ sudo -k # clear old stuff so that we get a fresh prompt
$ sudo ls /root/
$ sudo -i
```
Sample session:
[![An interesting sudo feature to insult you when you type an invalid password.][4]][4]

## Say hello to sl

[sl is a joke software or classic UNIX][5] game. It is a steam locomotive runs across your screen if you type "sl" (Steam Locomotive) instead of "ls" by mistake.
`$ sl`
[![Linux / UNIX Desktop Fun: Steam Locomotive][6]][5]

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/howto/insult-linux-unix-bash-user-when-typing-wrong-command/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://bash.cyberciti.biz/guide/If..else..fi
[2]:https://bash.cyberciti.biz/guide/Source_command
[3]:https://www.cyberciti.biz/media/new/cms/2017/11/bash-insulter-Insults-the-user-when-typing-wrong-command.jpg
[4]:https://www.cyberciti.biz/media/new/cms/2017/11/sudo-insults.jpg
[5]:https://www.cyberciti.biz/tips/displays-animations-when-accidentally-you-type-sl-instead-of-ls.html
[6]:https://www.cyberciti.biz/media/new/tips/2011/05/sl_command_steam_locomotive.png
