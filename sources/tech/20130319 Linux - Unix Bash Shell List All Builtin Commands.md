Linux / Unix Bash Shell List All Builtin Commands
======

Builtin commands contained within the bash shell itself. How do I list all built-in bash commands on Linux / Apple OS X / *BSD / Unix like operating systems without reading large size bash man page?

A shell builtin is nothing but command or a function, called from a shell, that is executed directly in the shell itself. The bash shell executes the command directly, without invoking another program. You can view information for Bash built-ins with help command. There are different types of built-in commands.


### built-in command types

  1. Bourne Shell Builtins: Builtin commands inherited from the Bourne Shell.
  2. Bash Builtins: Table of builtins specific to Bash.
  3. Modifying Shell Behavior: Builtins to modify shell attributes and optional behavior.
  4. Special Builtins: Builtin commands classified specially by POSIX.



### How to see all bash builtins

Type the following command:
```
$ help
$ help | less
$ help | grep read 
```

Sample outputs:
```
GNU bash, version 4.1.5(1)-release (x86_64-pc-linux-gnu)
These shell commands are defined internally.  Type `help' to see this list.
Type `help name' to find out more about the function `name'.
Use `info bash' to find out more about the shell in general.
Use `man -k' or `info' to find out more about commands not in this list.
 
A star (*) next to a name means that the command is disabled.
 
 job_spec [&]                            history [-c] [-d offset] [n] or hist>
 (( expression ))                        if COMMANDS; then COMMANDS; [ elif C>
 . filename [arguments]                  jobs [-lnprs] [jobspec ...] or jobs >
 :                                       kill [-s sigspec | -n signum | -sigs>
 [ arg... ]                              let arg [arg ...]
 [[ expression ]]                        local [option] name[=value] ...
 alias [-p] [name[=value] ... ]          logout [n]
 bg [job_spec ...]                       mapfile [-n count] [-O origin] [-s c>
 bind [-lpvsPVS] [-m keymap] [-f filen>  popd [-n] [+N | -N]
 break [n]                               printf [-v var] format [arguments]
 builtin [shell-builtin [arg ...]]       pushd [-n] [+N | -N | dir]
 caller [expr]                           pwd [-LP]
 case WORD in [PATTERN [| PATTERN]...)>  read [-ers] [-a array] [-d delim] [->
 cd [-L|-P] [dir]                        readarray [-n count] [-O origin] [-s>
 command [-pVv] command [arg ...]        readonly [-af] [name[=value] ...] or>
 compgen [-abcdefgjksuv] [-o option]  >  return [n]
 complete [-abcdefgjksuv] [-pr] [-DE] >  select NAME [in WORDS ... ;] do COMM>
 compopt [-o|+o option] [-DE] [name ..>  set [--abefhkmnptuvxBCHP] [-o option>
 continue [n]                            shift [n]
 coproc [NAME] command [redirections]    shopt [-pqsu] [-o] [optname ...]
 declare [-aAfFilrtux] [-p] [name[=val>  source filename [arguments]
 dirs [-clpv] [+N] [-N]                  suspend [-f]
 disown [-h] [-ar] [jobspec ...]         test [expr]
 echo [-neE] [arg ...]                   time [-p] pipeline
 enable [-a] [-dnps] [-f filename] [na>  times
 eval [arg ...]                          trap [-lp] [[arg] signal_spec ...]
 exec [-cl] [-a name] [command [argume>  true
 exit [n]                                type [-afptP] name [name ...]
 export [-fn] [name[=value] ...] or ex>  typeset [-aAfFilrtux] [-p] name[=val>
 false                                   ulimit [-SHacdefilmnpqrstuvx] [limit>
 fc [-e ename] [-lnr] [first] [last] o>  umask [-p] [-S] [mode]
 fg [job_spec]                           unalias [-a] name [name ...]
 for NAME [in WORDS ... ] ; do COMMAND>  unset [-f] [-v] [name ...]
 for (( exp1; exp2; exp3 )); do COMMAN>  until COMMANDS; do COMMANDS; done
 function name { COMMANDS ; } or name >  variables - Names and meanings of so>
 getopts optstring name [arg]            wait [id]
 hash [-lr] [-p pathname] [-dt] [name >  while COMMANDS; do COMMANDS; done
 help [-dms] [pattern ...]               { COMMANDS ; }
```

### Viewing information for Bash built-ins

To get detailed info run:
```
help command
help read
```
To just get a list of all built-ins with a short description, execute:

`$ help -d`

### Find syntax and other options for builtins

Use the following syntax ' to find out more about the builtins commands:
```
help name 
help cd 
help fg 
help for 
help read 
help :
```

Sample outputs:
```
:: :
 Null command.
 
 No effect; the command does nothing.
 
 Exit Status:
 Always succeeds
```

### Find out if a command is internal (builtin) or external

Use the type command or command command:
```
type -a command-name-here 
type -a cd 
type -a uname 
type -a : 
type -a ls
```


OR
```
type -a cd uname : ls uname
```

Sample outputs:
```
cd is a shell builtin
uname is /bin/uname
: is a shell builtin
ls is aliased to `ls --color=auto'
ls is /bin/ls
l is a function
l ()
{
 ls --color=auto
}

```

OR
```
command -V ls 
command -V cd 
command -V foo
```

[![View list bash built-ins command info on Linux or Unix][1]][1]

### about the author

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][2], [Facebook][3], [Google+][4].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/linux-unix-bash-shell-list-all-builtin-commands/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2013/03/View-list-bash-built-ins-command-info-on-Linux-or-Unix.jpg
[2]:https://twitter.com/nixcraft
[3]:https://facebook.com/nixcraft
[4]:https://plus.google.com/+CybercitiBiz
