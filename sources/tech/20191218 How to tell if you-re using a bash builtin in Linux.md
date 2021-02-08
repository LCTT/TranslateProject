[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to tell if you’re using a bash builtin in Linux)
[#]: via: (https://www.networkworld.com/article/3505818/how-to-tell-if-youre-using-a-bash-builtin-in-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to tell if you’re using a bash builtin in Linux
======
A built-in is a Linux command that's part of whatever shell you're using. Can you tell what commands are built-ins and which are not?
Guenter Guni / Getty Images

If you’re not sure if you’re running a Linux command or you’re using a bash builtin, don’t stress, it isn’t all that obvious. In fact, you can get very used to commands like **cd** without realizing that they’re part of your shell, unlike commands like **date** and **whoami** that invoke executables (**/bin/date** and **/usr/bin/whoami**).

Builtins in general are commands that are built into shell interpreters, and bash is especially rich in them, which is a good thing because built-ins by their very nature run a bit faster than commands which have to be loaded into memory when you call them into play.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

In other words, some commands are built into the shell because they pretty much have to be. After all, a command like **cd** needs to change the shell’s view of the world – or at least its perspective on the file system. Others provide the shell with its special ability to loop and evaluate data – like **case**, **for** and **while** commands. In short, these commands make the shell what it is for all of its devoted users. Still others just make commands run a little faster.

[][2]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][2]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

To get a list of bash built-ins, all you have to type is “help”.

```
$ help
GNU bash, version 5.0.3(1)-release (x86_64-pc-linux-gnu)
These shell commands are defined internally.  Type `help' to see this list.
Type `help name' to find out more about the function `name'.
Use `info bash' to find out more about the shell in general.
Use `man -k' or `info' to find out more about commands not in this list.

A star (*) next to a name means that the command is disabled.

 job_spec [&]                                   history [-c] [-d offset] [n] or history -an>
 (( expression ))                               if COMMANDS; then COMMANDS; [ elif COMMANDS>
 . filename [arguments]                         jobs [-lnprs] [jobspec ...] or jobs -x comm>
 :                                              kill [-s sigspec | -n signum | -sigspec] pi>
 [ arg... ]                                     let arg [arg ...]
 [[ expression ]]                               local [option] name[=value] ...
 alias [-p] [name[=value] ... ]                 logout [n]
 bg [job_spec ...]                              mapfile [-d delim] [-n count] [-O origin] [>
 bind [-lpsvPSVX] [-m keymap] [-f filename] [>  popd [-n] [+N | -N]
 break [n]                                      printf [-v var] format [arguments]
 builtin [shell-builtin [arg ...]]              pushd [-n] [+N | -N | dir]
 caller [expr]                                  pwd [-LP]
 case WORD in [PATTERN [| PATTERN]...) COMMAN>  read [-ers] [-a array] [-d delim] [-i text]>
 cd [-L|[-P [-e]] [-@]] [dir]                   readarray [-d delim] [-n count] [-O origin]>
 command [-pVv] command [arg ...]               readonly [-aAf] [name[=value] ...] or reado>
 compgen [-abcdefgjksuv] [-o option] [-A acti>  return [n]
 complete [-abcdefgjksuv] [-pr] [-DEI] [-o op>  select NAME [in WORDS ... ;] do COMMANDS; d>
 compopt [-o|+o option] [-DEI] [name ...]       set [-abefhkmnptuvxBCHP] [-o option-name] [>
 continue [n]                                   shift [n]
 coproc [NAME] command [redirections]           shopt [-pqsu] [-o] [optname ...]
 declare [-aAfFgilnrtux] [-p] [name[=value] .>  source filename [arguments]
 dirs [-clpv] [+N] [-N]                         suspend [-f]
 disown [-h] [-ar] [jobspec ... | pid ...]      test [expr]
 echo [-neE] [arg ...]                          time [-p] pipeline
 enable [-a] [-dnps] [-f filename] [name ...>   times
 eval [arg ...]                                 trap [-lp] [[arg] signal_spec ...]
 exec [-cl] [-a name] [command [arguments ...>  true
 exit [n]                                       type [-afptP] name [name ...]
 export [-fn] [name[=value] ...] or export ->   typeset [-aAfFgilnrtux] [-p] name[=value] .>
 false                                          ulimit [-SHabcdefiklmnpqrstuvxPT] [limit]
 fc [-e ename] [-lnr] [first] [last] or fc -s>  umask [-p] [-S] [mode]
 fg [job_spec]                                  unalias [-a] name [name ...]
 for NAME [in WORDS ... ] ; do COMMANDS; don>   unset [-f] [-v] [-n] [name ...]
 for (( exp1; exp2; exp3 )); do COMMANDS; don>  until COMMANDS; do COMMANDS; done
 function name { COMMANDS ; } or name () { CO>  variables - Names and meanings of some shel>
 getopts optstring name [arg]                   wait [-fn] [id ...]
 hash [-lr] [-p pathname] [-dt] [name ...]      while COMMANDS; do COMMANDS; done
 help [-dms] [pattern ...]                      { COMMANDS ; }
```

You might notice that some of these built-ins (e.g., **echo** and **kill**) also exist as executables.

```
$ ls -l /bin/echo /bin/kill
-rwxr-xr-x 1 root root 39256 Sep  5 06:38 /bin/echo
-rwxr-xr-x 1 root root 30952 Aug  8 12:46 /bin/kill
```

One quick way to determine whether the command you are using is a bash built-in or not is to use the command “command”. Yes, the command is called “command”. Try it with a **-V** (capital V) option like this:

```
$ command -V command
command is a shell builtin
$ command -V echo
echo is a shell builtin
$ command -V date
date is hashed (/bin/date)
```

When you see a “command is hashed” message like the one above, that means that the command has been put into a hash table for quicker lookup.

### **Looking for help in other shells**

If you switch shells and try running “help”, you’ll notice that some support this command and others do not. You can run a command like this in bash to see what each of the shells on your system will tell you:

```
for shell in `ls /bin/*sh`
do
    echo $shell
    $shell -c "help"
    echo ===============
done
```

This loop will try running the help command in each of the shells in /bin. The $shell -c (e.g., zsh -c) syntax will run just the single help command in that shell and then exit.

### How to tell what shell you're currently using

If you switch shells you can’t depend on $SHELL to tell you what shell you’re currently using because $SHELL is just an environment variable that is set when you log in and doesn't necessarily reflect your current shell. Try **ps -p $$** instead as shown in these examples:

```
$ ps -p $$
  PID TTY          TIME CMD
18340 pts/0    00:00:00 bash    <==
$ /bin/dash
$ ps -p $$
  PID TTY          TIME CMD
19517 pts/0    00:00:00 dash    <==
```

Built-ins are extremely useful and give each shell a lot of its character. If you use some particular shell all of the time, it’s easy to lose track of which commands are part of your shell and which are not. Differentiating a shell built-in from a Linux executable requires only a little extra effort.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3505818/how-to-tell-if-youre-using-a-bash-builtin-in-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
