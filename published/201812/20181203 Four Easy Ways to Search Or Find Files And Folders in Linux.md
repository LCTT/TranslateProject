[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10362-1.html)
[#]: subject: (Four Easy Ways to Search Or Find Files And Folders in Linux)
[#]: via: (https://www.2daygeek.com/four-easy-ways-to-search-or-find-files-and-folders-in-linux/)
[#]: author: (Prakash Subramanian https://www.2daygeek.com/author/prakash/)

搜索 Linux 中的文件和文件夹的四种简单方法
======

Linux 管理员一天都不能离开搜索文件，因为这是他们的日常活动。了解一些搜索的东西是不错的，因为这能帮助你在命令行服务器中工作。这些命令记忆起来不复杂，因为它们使用的是标准语法。

可以通过四个 Linux 命令啦执行此操作，每个命令都有自己独特的功能。

### 方法 1：使用 find 命令在 Linux 中搜索文件和文件夹

`find` 命令被广泛使用，并且是在 Linux 中搜索文件和文件夹的著名命令。它搜索当前目录中的给定文件，并根据搜索条件递归遍历其子目录。

它允许用户根据大小、名称、所有者、组、类型、权限、日期和其他条件执行所有类型的文件搜索。

运行以下命令以在系统中查找给定文件。

```
# find / -iname "sshd_config"
/etc/ssh/sshd_config
```

运行以下命令以查找系统中的给定文件夹。要在 Linux 中搜索文件夹，我们需要使用 `-type` 参数。

```
# find / -type d -iname "ssh"
/usr/lib/ssh
/usr/lib/go/src/cmd/vendor/golang.org/x/crypto/ssh
/usr/lib/go/pkg/linux_amd64/cmd/vendor/golang.org/x/crypto/ssh
/etc/ssh
```

使用通配符搜索系统上的所有文件。我们将搜索系统中所有以 `.config` 为扩展名的文件。

```
# find / -name "*.config"
/usr/lib/mono/gac/avahi-sharp/1.0.0.0__4d116c78973743f5/avahi-sharp.dll.config
/usr/lib/mono/gac/avahi-ui-sharp/0.0.0.0__4d116c78973743f5/avahi-ui-sharp.dll.config
/usr/lib/python2.7/config/Setup.config
/usr/share/git/mw-to-git/t/test.config
/var/lib/lightdm/.config
/home/daygeek/.config
/root/.config
/etc/skel/.config
```

使用以下命令格式在系统中查找空文件和文件夹。

```
# find / -empty
```

使用以下命令组合查找 Linux 上包含特定文本的所有文件。

```
# find / -type f -exec grep "Port 22" '{}' \; -print
# find / -type f -print | xargs grep "Port 22"
# find / -type f | xargs grep 'Port 22'
# find / -type f -exec grep -H 'Port 22' {} \;
```

### 方法 2：使用 locate 命令在 Linux 中搜索文件和文件夹

`locate` 命令比 `find` 命令运行得更快，因为它使用 `updatedb` 数据库，而 `find` 命令在真实系统中搜索。

它使用数据库而不是搜索单个目录路径来获取给定文件。

`locate` 命令未在大多数发行版中预安装，因此，请使用你的包管理器进行安装。

数据库通过 cron 任务定期更新，但我们可以通过运行以下命令手动更新它。

```
$ sudo updatedb
```

只需运行以下命令即可列出给定的文件或文件夹。在 `locate` 命令中不需要指定特定选项来打印文件或文件夹。

在系统中搜索 `ssh` 文件夹。

```
# locate --basename '\ssh'
/etc/ssh
/usr/bin/ssh
/usr/lib/ssh
/usr/lib/go/pkg/linux_amd64/cmd/vendor/golang.org/x/crypto/ssh
/usr/lib/go/src/cmd/go/testdata/failssh/ssh
/usr/lib/go/src/cmd/vendor/golang.org/x/crypto/ssh
```

在系统中搜索 `ssh_config` 文件。

```
# locate --basename '\sshd_config'
/etc/ssh/sshd_config
```

### 方法 3：在 Linux 中搜索文件使用 which 命令

`which` 返回在终端输入命令时执行的可执行文件的完整路径。

当你想要为可执行文件创建桌面快捷方式或符号链接时，它非常有用。

`which` 命令搜索当前用户而不是所有用户的 `$PATH` 环境变量中列出的目录。我的意思是，当你登录自己的帐户时，你无法搜索 root 用户文件或目录。

运行以下命令以打印 `vim` 可执行文件的完整路径。

```
# which vi
/usr/bin/vi
```

或者，它允许用户一次执行多个文件搜索。

```
# which -a vi sudo
/usr/bin/vi
/bin/vi
/usr/bin/sudo
/bin/sudo
```

### 方法 4：使用 whereis 命令在 Linux 中搜索文件

`whereis` 命令用于搜索给定命令的二进制、源码和手册页文件。

```
# whereis vi
vi: /usr/bin/vi /usr/share/man/man1/vi.1p.gz /usr/share/man/man1/vi.1.gz
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/four-easy-ways-to-search-or-find-files-and-folders-in-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
