[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10673-1.html)
[#]: subject: (How To Navigate Inside A Directory/Folder In Linux Without CD Command?)
[#]: via: (https://www.2daygeek.com/navigate-switch-directory-without-using-cd-command-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 中不使用 CD 命令进入目录/文件夹？
======

众所周知，如果没有 `cd` 命令，我们无法 Linux 中切换目录。这个没错，但我们有一个名为 `shopt` 的 Linux 内置命令能帮助我们解决这个问题。

[shopt][1] 是一个 shell 内置命令，用于设置和取消设置各种 bash shell 选项，由于它已安装，因此我们不需要再次安装它。

是的，我们可以在启用此选项后，可以不使用 `cd` 命令切换目录。

我们将在本文中向你展示如何操作。这是一个小的调整，但对于那些从 Windows 迁移到 Linux 的新手来说非常有用。

这对 Linux 管理员没用，因为我们不会在没有 `cd` 命令的情况下切换到该目录，因为我们对此有经验。

如果你尝试在没有 `cd` 命令的情况下切换 Linux 的目录/文件夹，你将看到以下错误消息。这在 Linux 中很常见。

```
$ Documents/
bash: Documents/: Is a directory
```

为此，我们需要在用户 `.bashrc` 中追加以下值。

### 什么是 .bashrc ？

`.bashrc` 是一个 shell 脚本，每次用户以交互模式打开新 shell 时都会运行该脚本。

你可以在该文件中添加要在命令提示符下输入的任何命令。

`.bashrc` 文件本身包含终端会话的一系列配置。包括设置和启用：着色、补全，shell 历史，命令别名等。

```
$ vi ~/.bashrc
```

加入这一行：

```
shopt -s autocd
```

运行以下命令使更改生效。

```
$ source ~/.bashrc
```

我们已完成所有配置。简单地对此进行测试以确认这是否有效。

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

是的，它正如预期的那样正常工作。

而且，它在 fish shell 中工作正常，而无需对 `.bashrc` 进行任何更改。

![][4]

如果要暂时执行此操作，请使用以下命令（`set`/`unset`）。重启系统时，它将消失。

```
# shopt -s autocd

# shopt | grep autocd
autocd  on

# shopt -u autocd

# shopt | grep autocd
autocd  off
```

`shopt` 命令提供了许多其他选项，如果要验证这些选项，请运行以下命令。

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

此外，我找到了一些其他程序，它们可以帮助我们在 Linux 中比 `cd` 命令更快地切换目录。

它们是 `pushd`、`popd`、`up` shell 脚本和 `bd` 工具。我们将在接下来的文章中介绍这些主题。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/navigate-switch-directory-without-using-cd-command-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.2daygeek.com/wp-content/uploads/2019/03/navigate-switch-directory-without-using-cd-command-in-linux-1.jpg
[4]: https://www.2daygeek.com/wp-content/uploads/2019/03/navigate-switch-directory-without-using-cd-command-in-linux-2.jpg
