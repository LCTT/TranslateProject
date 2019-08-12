[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11158-1.html)
[#]: subject: (Getting help for Linux shell built-ins)
[#]: via: (https://www.networkworld.com/article/3410350/getting-help-for-linux-shell-built-ins.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

获取有关 Linux shell 内置命令的帮助
======

> Linux 内置命令属于用户 shell 的一部分，本文将告诉你如何识别它们并获取使用它们的帮助。

![](https://img.linux.net.cn/data/attachment/album/201907/28/204915bj1wmhxeargx14lt.jpg)

Linux 内置命令是内置于 shell 中的命令，很像内置于墙中的书架。与标准 Linux 命令存储在 `/usr/bin` 中的方式不同，你不会找到它们的独立文件，你可能使用过相当多的内置命令，但你不会感觉到它们与 `ls` 和 `pwd` 等命令有何不同。

内置命令与其他 Linux 命令一样使用，它们可能要比不属于 shell 的类似命令运行得快一些。Bash 内置命令包括 `alias`、`export` 和 `bg` 等。

正如你担心的那样，因为内置命令是特定于 shell 的，所以它们不会提供手册页。使用 `man` 来查看 `bg`，你会看到这样的东西：

```
$ man bg
No manual entry for bg
```

判断内置命令的另一个提示是当你使用 `which` 命令来识别命令的来源时，Bash 不会响应，表示没有与内置命令关联的文件：

```
$ which bg
$
```

另一方面，如果你的 shell 是 `/bin/zsh`，你可能会得到一个更有启发性的响应：

```
% which bg
bg: shell built-in command
```

bash 提供了额外的帮助信息，但它是通过使用 `help` 命令实现的：

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

如果你想要查看 bash 提供的所有内置命令的列表，使用 `compgen -b` 命令。通过管道将命令输出到列中，以获得较好格式的清单。

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

如果你使用 `help` 命令，你将看到一个内置命令列表以及简短描述。但是，这个列表被截断了（以 `help` 命令结尾）：

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

从上面的清单中可以看出，`help` 命令本身就是内置的。

你可以通过向 `help` 命令提供你感兴趣的内置命令名称来获取关于它们的更多信息，例如 `help dirs`：

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

内置命令提供了每个 shell 的大部分功能。你使用的任何 shell 都有一些内置命令，但是如何获取这些内置命令的信息可能因 shell 而异。例如，对于 `zsh`，你可以使用 `man zshbuiltins` 命令获得其内置命令的描述。

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

在这个冗长的手册页中，你将找到一个内置命令列表，其中包含有用的描述，如下摘录中所示：

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

### 最后

Linux 内置命令对于每个 shell 都很重要，它的操作类似特定于 shell 的命令一样。如果你经常使用不同的 shell，并注意到你经常使用的某些命令似乎不存在或者不能按预期工作，那么它可能是你使用的其他 shell 之一中的内置命令。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3410350/getting-help-for-linux-shell-built-ins.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/07/linux_penguin-100802549-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
