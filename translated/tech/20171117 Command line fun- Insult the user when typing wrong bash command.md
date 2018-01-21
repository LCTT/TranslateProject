命令行乐趣：恶搞输错 Bash 命令的用户
======
你可以通过配置 sudo 命令去恶搞输入错误密码的用户。但是之后，shell 的恶搞提示语可能会滥用于输入错误命令的用户。


## 你好 bash-insulter

来自 Github 页面：

> 当用户键入错误命令，随机嘲讽。它使用了一个 bash4.x. 版本的全新内置错误处理函数，叫 command_not_found_handle。

## 安装

键入下列 git 命令克隆一个仓库：
`git clone https://github.com/hkbakke/bash-insulter.git bash-insulter`
示例输出：
```
Cloning into 'bash-insulter'...
remote: Counting objects: 52, done.
remote: Compressing objects: 100% (49/49), done.
remote: Total 52 (delta 12), reused 12 (delta 2), pack-reused 0
Unpacking objects: 100% (52/52), done.

```

用文本编辑器，编辑你的 ~/.bashrc 或者 /etc/bash.bashrc 文件，比如说使用 vi： 
`$ vi ~/.bashrc`
在其后追加这一行（具体了解请查看 [if..else..fi 声明][1] 和 [命令源码][2]）：
```
if [ -f $HOME/bash-insulter/src/bash.command-not-found ]; then
    source $HOME/bash-insulter/src/bash.command-not-found
fi
```

保存并关闭文件。重新登陆，如果不想退出账号也可以手动运行它：
```
$ . $HOME/bash-insulter/src/bash.command-not-found
```

## 如何使用它？

尝试键入一些无效命令：
```
$ ifconfigs
$ dates
```
示例输出:
[![一个有趣的 bash 钩子功能，嘲讽输入了错误命令的你。][3]][3]

## 自定义

你需要编辑 $HOME/bash-insulter/src/bash.command-not-found：
`$ vi $HOME/bash-insulter/src/bash.command-not-found`
示例代码：
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
 
    # 设置“随机”种子发生器 
    RANDOM=$(date +%s%N)
    VALUE=$((${RANDOM}%2))
 
    if [[ ${VALUE} -lt 1 ]]; then
        printf "\n  $(tput bold)$(tput setaf 1)$(shuf -n 1 -e "${INSULTS[@]}")$(tput sgr0)\n\n"
    fi
 
    echo "-bash: $1: command not found"
 
    # 无效命令，常规返回已存在的代码
    return 127
}
```

## sudo 嘲讽

编辑 sudoers 文件：
`$ sudo visudo`
追加下面这一行：
`Defaults insults`
或者像下面尾行增加一句嘲讽语：
`Defaults !lecture,tty_tickets,!fqdn,insults`
这是我的文件：
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
样例对话:
[![当输入错误密码时，你会被一个有趣的的 sudo 嘲讽语戏弄。][4]][4]

## 你好 sl

[sl 或是 UNIX 经典捣蛋软件][5] 游戏。当你错误的把 “ls” 输入成 “sl”，将会有一辆蒸汽机车穿过你的屏幕。
`$ sl`
[![Linux / UNIX 桌面乐趣: 蒸汽机车][6]][5]

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/howto/insult-linux-unix-bash-user-when-typing-wrong-command/

作者：[Vivek Gite][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://bash.cyberciti.biz/guide/If..else..fi
[2]:https://bash.cyberciti.biz/guide/Source_command
[3]:https://www.cyberciti.biz/media/new/cms/2017/11/bash-insulter-Insults-the-user-when-typing-wrong-command.jpg
[4]:https://www.cyberciti.biz/media/new/cms/2017/11/sudo-insults.jpg
[5]:https://www.cyberciti.biz/tips/displays-animations-when-accidentally-you-type-sl-instead-of-ls.html
[6]:https://www.cyberciti.biz/media/new/tips/2011/05/sl_command_steam_locomotive.png
