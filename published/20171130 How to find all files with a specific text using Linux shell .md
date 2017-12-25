如何在 Linux shell 中找出所有包含指定文本的文件
===========

**目标：**本文提供一些关于如何搜索出指定目录或整个文件系统中那些包含指定单词或字符串的文件。

**难度：**容易

**约定：**

*   `#` - 需要使用 root 权限来执行指定命令，可以直接使用 root 用户来执行也可以使用 `sudo` 命令
*   `$` - 可以使用普通用户来执行指定命令

### 案例

#### 非递归搜索包含指定字符串的文件

第一个例子让我们来搜索 `/etc/` 目录下所有包含 `stretch` 字符串的文件，但不去搜索其中的子目录:

```shell
# grep -s stretch /etc/*
/etc/os-release:PRETTY_NAME="Debian GNU/Linux 9 (stretch)"
/etc/os-release:VERSION="9 (stretch)"
```

`grep` 的 `-s` 选项会在发现不存在或者不能读取的文件时隐藏报错信息。结果显示除了文件名之外，还有包含请求字符串的行也被一起输出了。

#### 递归地搜索包含指定字符串的文件

上面案例中忽略了所有的子目录。所谓递归搜索就是指同时搜索所有的子目录。

下面的命令会在 `/etc/` 及其子目录中搜索包含 `stretch` 字符串的文件：

```shell
# grep -R stretch /etc/*
/etc/apt/sources.list:# deb cdrom:[Debian GNU/Linux testing _Stretch_ - Official Snapshot amd64 NETINST Binary-1 20170109-05:56]/ stretch main
/etc/apt/sources.list:#deb cdrom:[Debian GNU/Linux testing _Stretch_ - Official Snapshot amd64 NETINST Binary-1 20170109-05:56]/ stretch main
/etc/apt/sources.list:deb http://ftp.au.debian.org/debian/ stretch main
/etc/apt/sources.list:deb-src http://ftp.au.debian.org/debian/ stretch main
/etc/apt/sources.list:deb http://security.debian.org/debian-security stretch/updates main
/etc/apt/sources.list:deb-src http://security.debian.org/debian-security stretch/updates main
/etc/dictionaries-common/words:backstretch
/etc/dictionaries-common/words:backstretch's
/etc/dictionaries-common/words:backstretches
/etc/dictionaries-common/words:homestretch
/etc/dictionaries-common/words:homestretch's
/etc/dictionaries-common/words:homestretches
/etc/dictionaries-common/words:outstretch
/etc/dictionaries-common/words:outstretched
/etc/dictionaries-common/words:outstretches
/etc/dictionaries-common/words:outstretching
/etc/dictionaries-common/words:stretch
/etc/dictionaries-common/words:stretch's
/etc/dictionaries-common/words:stretched
/etc/dictionaries-common/words:stretcher
/etc/dictionaries-common/words:stretcher's
/etc/dictionaries-common/words:stretchers
/etc/dictionaries-common/words:stretches
/etc/dictionaries-common/words:stretchier
/etc/dictionaries-common/words:stretchiest
/etc/dictionaries-common/words:stretching
/etc/dictionaries-common/words:stretchy
/etc/grub.d/00_header:background_image -m stretch `make_system_path_relative_to_its_root "$GRUB_BACKGROUND"`
/etc/os-release:PRETTY_NAME="Debian GNU/Linux 9 (stretch)"
/etc/os-release:VERSION="9 (stretch)"
```

#### 搜索所有包含特定单词的文件

上面 `grep` 命令的案例中列出的是所有包含字符串 `stretch` 的文件。也就是说包含 `stretches` ， `stretched` 等内容的行也会被显示。 使用 `grep` 的 `-w` 选项会只显示包含特定单词的行：

```shell
# grep -Rw stretch /etc/*
/etc/apt/sources.list:# deb cdrom:[Debian GNU/Linux testing _Stretch_ - Official Snapshot amd64 NETINST Binary-1 20170109-05:56]/ stretch main
/etc/apt/sources.list:#deb cdrom:[Debian GNU/Linux testing _Stretch_ - Official Snapshot amd64 NETINST Binary-1 20170109-05:56]/ stretch main
/etc/apt/sources.list:deb http://ftp.au.debian.org/debian/ stretch main
/etc/apt/sources.list:deb-src http://ftp.au.debian.org/debian/ stretch main
/etc/apt/sources.list:deb http://security.debian.org/debian-security stretch/updates main
/etc/apt/sources.list:deb-src http://security.debian.org/debian-security stretch/updates main
/etc/dictionaries-common/words:stretch
/etc/dictionaries-common/words:stretch's
/etc/grub.d/00_header:background_image -m stretch `make_system_path_relative_to_its_root "$GRUB_BACKGROUND"`
/etc/os-release:PRETTY_NAME="Debian GNU/Linux 9 (stretch)"
/etc/os-release:VERSION="9 (stretch)"
```

#### 显示包含特定文本的文件名

上面的命令都会产生多余的输出。下一个案例则会递归地搜索 `etc` 目录中包含 `stretch` 的文件并只输出文件名：

```shell
# grep -Rl stretch /etc/*
/etc/apt/sources.list
/etc/dictionaries-common/words
/etc/grub.d/00_header
/etc/os-release
```

#### 大小写不敏感的搜索

默认情况下搜索是大小写敏感的，也就是说当搜索字符串 `stretch` 时只会包含大小写一致内容的文件。

通过使用 `grep` 的 `-i` 选项，`grep` 命令还会列出所有包含 `Stretch` ， `STRETCH` ， `StReTcH` 等内容的文件，也就是说进行的是大小写不敏感的搜索。

```shell
# grep -Ril stretch /etc/*
/etc/apt/sources.list
/etc/dictionaries-common/default.hash
/etc/dictionaries-common/words
/etc/grub.d/00_header
/etc/os-release
```

#### 搜索时包含/排除指定文件

`grep` 命令也可以只在指定文件中进行搜索。比如，我们可以只在配置文件（扩展名为`.conf`）中搜索指定的文本/字符串。 下面这个例子就会在 `/etc` 目录中搜索带字符串 `bash` 且所有扩展名为 `.conf` 的文件：

```shell
# grep -Ril bash /etc/*.conf
OR
# grep -Ril --include=\*.conf bash /etc/*
/etc/adduser.conf
```

类似的，也可以使用 `--exclude` 来排除特定的文件：

```shell
# grep -Ril --exclude=\*.conf bash /etc/*
/etc/alternatives/view
/etc/alternatives/vim
/etc/alternatives/vi
/etc/alternatives/vimdiff
/etc/alternatives/rvim
/etc/alternatives/ex
/etc/alternatives/rview
/etc/bash.bashrc
/etc/bash_completion.d/grub
/etc/cron.daily/apt-compat
/etc/cron.daily/exim4-base
/etc/dictionaries-common/default.hash
/etc/dictionaries-common/words
/etc/inputrc
/etc/passwd
/etc/passwd-
/etc/profile
/etc/shells
/etc/skel/.profile
/etc/skel/.bashrc
/etc/skel/.bash_logout
```

#### 搜索时排除指定目录

跟文件一样，`grep` 也能在搜索时排除指定目录。 使用 `--exclude-dir` 选项就行。

下面这个例子会搜索 `/etc` 目录中搜有包含字符串 `stretch` 的文件，但不包括 `/etc/grub.d` 目录下的文件：

```shell
# grep --exclude-dir=/etc/grub.d -Rwl stretch /etc/*
/etc/apt/sources.list
/etc/dictionaries-common/words
/etc/os-release
```

#### 显示包含搜索字符串的行号

`-n` 选项还会显示指定字符串所在行的行号: 

```shell
# grep -Rni bash /etc/*.conf
/etc/adduser.conf:6:DSHELL=/bin/bash
```

#### 寻找不包含指定字符串的文件

最后这个例子使用 `-v` 来列出所有**不**包含指定字符串的文件。

例如下面命令会搜索 `/etc` 目录中不包含 `stretch` 的所有文件：

```shell
# grep -Rlv stretch /etc/*
```

--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-find-all-files-with-a-specific-text-using-linux-shell

作者：[Lubos Rendek][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org
