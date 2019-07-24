[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting help for Linux shell built-ins)
[#]: via: (https://www.networkworld.com/article/3410350/getting-help-for-linux-shell-built-ins.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Getting help for Linux shell built-ins
======
Linux built-ins are commands that are part of a user’s shell. Here's an explanation on how to recognize them and get help on their use.
![Sandra Henry-Stocker][1]

Linux built-ins are commands that are built into the shell, much like shelves that are built into a wall. You won’t find them as stand-alone files the way standard Linux commands are stored in /usr/bin and you probably use quite a few of them without ever questioning how they’re different from commands such as **ls** and **pwd**.

Built-ins are used just like other Linux commands. They are likely to run a bit faster than similar commands that are not part of your shell. Bash built-ins include commands such as **alias**, **export** and **bg**.

**[ Two-Minute Linux Tips: [Learn how to master a host of Linux commands in these 2-minute video tutorials][2] ]**

As you might suspect, because built-ins are shell-specific, they won't be supplied with man pages. Ask **man** to help with **bg** and you'll see something like this:

```
$ man bg
No manual entry for bg
```

Another tip-off that a command is a built-in is when you use the **which** command to identify the source of the command. Bash's non-response will remind you that there is no file associated with the built-in:

```
$ which bg
$
```

If your shell is **/bin/zsh**, on the other hand, you might get a slightly more illuminating response:

```
% which bg
bg: shell built-in command
```

Additional help is available with bash, but it comes through the use of the **help** command:

```
$ help bg
bg: bg [job_spec ...]
    Move jobs to the background.

    Place the jobs identified by each JOB_SPEC in the background, as if they
    had been started with `&'.  If JOB_SPEC is not present, the shell's notion
    of the current job is used.

    Exit Status:
    Returns success unless job control is not enabled or an error occurs.
```

If you want to see a list of all of the built-ins that bash provides, use the **compgen -b**  command. Pipe the output to column for a nicely formatted listing.

```
$ compgen -b | column
.              compgen        exit           let            return         typeset
:              complete       export         local          set            ulimit
[              compopt        false          logout         shift          umask
alias          continue       fc             mapfile        shopt          unalias
bg             declare        fg             popd           source         unset
bind           dirs           getopts        printf         suspend        wait
break          disown         hash           pushd          test
builtin        echo           help           pwd            times
caller         enable         history        read           trap
cd             eval           jobs           readarray      true
command        exec           kill           readonly       type
```

If you use the **help** command, you’ll see a list of built-ins along with short descriptions. This list is, however, truncated (ending with the **help** command):

```
$ help
GNU bash, version 5.0.3(1)-release (x86_64-pc-linux-gnu)
These shell commands are defined internally.  Type `help' to see this list.
Type `help name' to find out more about the function `name'.
Use `info bash' to find out more about the shell in general.
Use `man -k' or `info' to find out more about commands not in this list.

A star (*) next to a name means that the command is disabled.

 job_spec [&]                             history [-c] [-d offset] [n] or histo>
 (( expression ))                         if COMMANDS; then COMMANDS; [ elif CO>
 . filename [arguments]                   jobs [-lnprs] [jobspec ...] or jobs ->
 :                                        kill [-s sigspec | -n signum | -sigsp>
 [ arg... ]                               let arg [arg ...]
 [[ expression ]]                         local [option] name[=value] ...
 alias [-p] [name[=value] ... ]           logout [n]
 bg [job_spec ...]                        mapfile [-d delim] [-n count] [-O ori>
 bind [-lpsvPSVX] [-m keymap] [-f filen>  popd [-n] [+N | -N]
 break [n]                                printf [-v var] format [arguments]
 builtin [shell-builtin [arg ...]]        pushd [-n] [+N | -N | dir]
 caller [expr]                            pwd [-LP]
 case WORD in [PATTERN [| PATTERN]...) >  read [-ers] [-a array] [-d delim] [-i>
 cd [-L|[-P [-e]] [-@]] [dir]             readarray [-d delim] [-n count] [-O o>
 command [-pVv] command [arg ...]         readonly [-aAf] [name[=value] ...] or>
 compgen [-abcdefgjksuv] [-o option] [->  return [n]
 complete [-abcdefgjksuv] [-pr] [-DEI] >  select NAME [in WORDS ... ;] do COMMA>
 compopt [-o|+o option] [-DEI] [name ..>  set [-abefhkmnptuvxBCHP] [-o option-n>
 continue [n]                             shift [n]
 coproc [NAME] command [redirections]     shopt [-pqsu] [-o] [optname ...]
 declare [-aAfFgilnrtux] [-p] [name[=va>  source filename [arguments]
 dirs [-clpv] [+N] [-N]                   suspend [-f]
 disown [-h] [-ar] [jobspec ... | pid . &lt;p&gt'&gt;  test [expr]
 echo [-neE] [arg ...]                    time [-p] pipeline
 enable [-a] [-dnps] [-f filename] [nam>  times
 eval [arg ...]                           trap [-lp] [[arg] signal_spec ...]
 exec [-cl] [-a name] [command [argumen>  true
 exit [n]                                 type [-afptP] name [name ...]
 export [-fn] [name[=value] ...] or exp>  typeset [-aAfFgilnrtux] [-p] name[=va>
 false                                    ulimit [-SHabcdefiklmnpqrstuvxPT] [li>
 fc [-e ename] [-lnr] [first] [last] or>  umask [-p] [-S] [mode]
 fg [job_spec]                            unalias [-a] name [name ...]
 for NAME [in WORDS ... ] ; do COMMANDS>  unset [-f] [-v] [-n] [name ...]
 for (( exp1; exp2; exp3 )); do COMMAND>  until COMMANDS; do COMMANDS; done
 function name { COMMANDS ; } or name (>  variables - Names and meanings of som>
 getopts optstring name [arg]             wait [-fn] [id ...]
 hash [-lr] [-p pathname] [-dt] [name .>  while COMMANDS; do COMMANDS; done
 help [-dms] [pattern ...]                { COMMANDS ; }
```

As you can see from the listings above, the **help** command is itself a built-in.

You can get more information on any of these built-ins by providing the **help** command with the name of the built-in you're curious about — as in **help dirs**.

```
$ help dirs
dirs: dirs [-clpv] [+N] [-N]
    Display directory stack.

    Display the list of currently remembered directories.  Directories
    find their way onto the list with the `pushd' command; you can get
    back up through the list with the `popd' command.

    Options:
      -c        clear the directory stack by deleting all of the elements
      -l        do not print tilde-prefixed versions of directories relative
                to your home directory
      -p        print the directory stack with one entry per line
      -v        print the directory stack with one entry per line prefixed
                with its position in the stack

    Arguments:
      +N        Displays the Nth entry counting from the left of the list
                shown by dirs when invoked without options, starting with
                zero.

      -N        Displays the Nth entry counting from the right of the list
                shown by dirs when invoked without options, starting with
                zero.

    Exit Status:
    Returns success unless an invalid option is supplied or an error occurs.
```

Built-ins provide much of the functionality of each shell. Any shell you use will have some built-ins, though how to get information on these built-ins may differ from shell to shell. For **zsh**, for example, you can get a description of built-in commands by using the **man zshbuiltins** command.

```
$ man zshbuiltins

ZSHBUILTINS(1)               General Commands Manual              ZSHBUILTINS(1)

NAME
       zshbuiltins - zsh built-in commands

SHELL BUILTIN COMMANDS
       Some  shell  builtin commands take options as described in individual en‐
       tries; these are often referred to in the list below as `flags' to  avoid
       confusion with shell options, which may also have an effect on the behav‐
       iour of builtin commands.  In this introductory section, `option'  always
       has the meaning of an option to a command that should be familiar to most
       command line users.
…
```

Within this lengthy man page, you will find a list of built-ins with useful descriptions as in this excerpt.

```
bg [ job ... ]
job ... &
       Put  each  specified  job in the background, or the current job if
       none is specified.

bindkey
       See the section `Zle Builtins' in zshzle(1).

break [ n ]
       Exit from an enclosing for, while, until, select or  repeat  loop.
       If  an  arithmetic  expression n is specified, then break n levels
       instead of just one.
```

### Wrap-up

Linux built-ins are essential to each shell and operate like shell-specific commands. If you use a different shell from time to time and notice that some command you often use doesn’t seem to exist or doesn’t work as you were expecting, it just might be that it's one of your normal shell's built-ins.

**[ Also see: [Invaluable tips and tricks for troubleshooting Linux][3] ]**

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3410350/getting-help-for-linux-shell-built-ins.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/07/linux_penguin-100802549-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
