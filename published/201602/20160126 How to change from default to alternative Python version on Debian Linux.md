如何将 Debian Linux 中的默认的 Python 版本切换为替代版本
====================================================

当你安装 Debian Linux 时，安装过程有可能同时为你提供多个可用的 Python 版本，因此系统中会存在多个 Python 的可执行二进制文件。你可以按照以下方法使用 `ls` 命令来查看你的系统中都有那些 Python 的二进制文件可供使用。

```
$ ls /usr/bin/python*
/usr/bin/python  /usr/bin/python2  /usr/bin/python2.7  /usr/bin/python3  /usr/bin/python3.4  /usr/bin/python3.4m  /usr/bin/python3m
```

执行如下命令查看默认的 Python 版本信息:

```
$ python --version
Python 2.7.8
```

###1、基于用户修改 Python 版本：

想要为某个特定用户修改 Python 版本，只需要在其 home 目录下创建一个 `alias`(别名) 即可。打开该用户的 `~/.bashrc` 文件，添加新的别名信息来修改默认使用的 Python 版本。

```
alias python='/usr/bin/python3.4'
```

一旦完成以上操作，重新登录或者重新加载 `.bashrc` 文件，使操作生效。

```
$ . ~/.bashrc
```

检查当前的 Python 版本。

```
$ python --version
Python 3.4.2
```

###2、 在系统级修改 Python 版本

我们可以使用 `update-alternatives` 来为整个系统更改 Python 版本。以 root 身份登录，首先罗列出所有可用的 python 替代版本信息：

```
# update-alternatives --list python
update-alternatives: error: no alternatives for python
```

如果出现以上所示的错误信息，则表示 Python 的替代版本尚未被 `update-alternatives` 命令识别。想解决这个问题，我们需要更新一下替代列表，将 `python2.7` 和 `python3.4` 放入其中。

```
# update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
update-alternatives: using /usr/bin/python2.7 to provide /usr/bin/python (python) in auto mode
# update-alternatives --install /usr/bin/python python /usr/bin/python3.4 2
update-alternatives: using /usr/bin/python3.4 to provide /usr/bin/python (python) in auto mode
```

`--install` 选项使用了多个参数用于创建符号链接。最后一个参数指定了此选项的优先级，如果我们没有手动来设置替代选项，那么具有最高优先级的选项就会被选中。这个例子中，我们为 `/usr/bin/python3.4` 设置的优先级为2，所以 `update-alternatives` 命令会自动将它设置为默认 Python 版本。

```
# python --version
Python 3.4.2
```

接下来，我们再次列出可用的 Python 替代版本。

```
# update-alternatives --list python
/usr/bin/python2.7
/usr/bin/python3.4
```

现在开始，我们就可以使用下方的命令随时在列出的 Python 替代版本中任意切换了。

```
# update-alternatives --config python
```

![](http://linuxconfig.org/images/change-python-alternative-version-debian-linux.png)

```
# python --version
Python 2.7.8
```

###3、移除替代版本

一旦我们的系统中不再存在某个 Python 的替代版本时，我们可以将其从 `update-alternatives` 列表中删除掉。例如，我们可以将列表中的 python2.7 版本移除掉。

```
# update-alternatives --remove python /usr/bin/python2.7
update-alternatives: removing manually selected alternative - switching python to auto mode
update-alternatives: using /usr/bin/python3.4 to provide /usr/bin/python (python) in auto mode
```

--------------------------------------------------------------------------------

via: http://linuxconfig.org/how-to-change-from-default-to-alternative-python-version-on-debian-linux

译者：[mr-ping](https://github.com/mr-ping)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

