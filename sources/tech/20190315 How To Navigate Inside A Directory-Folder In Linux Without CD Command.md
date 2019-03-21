[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Navigate Inside A Directory/Folder In Linux Without CD Command?)
[#]: via: (https://www.2daygeek.com/navigate-switch-directory-without-using-cd-command-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Navigate Inside A Directory/Folder In Linux Without CD Command?
======

As everybody know that we can’t navigate inside a directory in Linux without CD command.

Yes that’s true but we have the Linux built-in command called `shopt` that help us to solve this issue.

[shopt][1] is a shell builtin command to set and unset various bash shell options, which is installed so, we no need to install it again.

Yes we can navigate inside a directory without CD command after enabling this option.

We will show you, how to do this in this article. This is a small tweak but it’s very useful for newbies who all are moving from Windows to Linux.

This is not useful for Linux administrator because we won’t navigate to the directory without CD command, as we had a good practices on this.

If you are trying to navigate a directory/folder in Linux without cd command, you will be getting the following error message. This is common in Linux.

```
$ Documents/
bash: Documents/: Is a directory
```

To achieve this, we need to append the following values in a user `.bashrc` file.

### What Is the .bashrc File?

The “.bashrc” file is a shell script which is run every time a user opens a new shell in interactive mode.

You can add any command in that file that you want to type at the command prompt.

The .bashrc file itself contains a series of configurations for the terminal session. This includes setting up or enabling: colouring, completion, the shell history, command aliases and more.

```
$ vi ~/.bashrc

shopt -s autocd
```

Run the following command to make the changes to take effect.

```
$ source ~/.bashrc
```

We have done all the configuration. Simple do the testing on this to confirm whether this working or not.

```
$ Documents/
cd -- Documents/

$ daygeek/
cd -- daygeek/

$ /home/daygeek/Documents/daygeek
cd -- /home/daygeek/Documents/daygeek

$ pwd
/home/daygeek/Documents/daygeek
```

![][3]
Yes, it’s working fine as expected.

However, it’s working fine in `fish shell` without making any changes in the `.bashrc` file.
![][4]

If you would like to perform this action for temporarily then use the following commands (set/unset). This will go away when you reboot the system.

```
# shopt -s autocd

# shopt | grep autocd
autocd  on

# shopt -u autocd

# shopt | grep autocd
autocd  off
```

shopt command is offering so many other options and if you want to verify those, run the following command.

```
$ shopt
autocd  on
assoc_expand_once   off
cdable_vars     off
cdspell     on
checkhash   off
checkjobs   off
checkwinsize    on
cmdhist     on
compat31    off
compat32    off
compat40    off
compat41    off
compat42    off
compat43    off
compat44    off
complete_fullquote  on
direxpand   off
dirspell    off
dotglob     off
execfail    off
expand_aliases  on
extdebug    off
extglob     off
extquote    on
failglob    off
force_fignore   on
globasciiranges on
globstar    off
gnu_errfmt  off
histappend  on
histreedit  off
histverify  off
hostcomplete    on
huponexit   off
inherit_errexit off
interactive_comments    on
lastpipe    off
lithist     off
localvar_inherit    off
localvar_unset  off
login_shell     off
mailwarn    off
no_empty_cmd_completion off
nocaseglob  off
nocasematch     off
nullglob    off
progcomp    on
progcomp_alias  off
promptvars  on
restricted_shell    off
shift_verbose   off
sourcepath  on
xpg_echo    off
```

I had found few other utilities, that are help us to navigate a directory faster in Linux compared with cd command.

Those are pushd, popd, up shell script and bd utility. We will cover these topics in the upcoming articles.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/navigate-switch-directory-without-using-cd-command-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.2daygeek.com/wp-content/uploads/2019/03/navigate-switch-directory-without-using-cd-command-in-linux-1.jpg
[4]: https://www.2daygeek.com/wp-content/uploads/2019/03/navigate-switch-directory-without-using-cd-command-in-linux-2.jpg
