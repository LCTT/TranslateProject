在 Linux 启动或重启时执行命令与脚本
======

有时可能会需要在重启时或者每次系统启动时运行某些命令或者脚本。我们要怎样做呢？本文中我们就对此进行讨论。 我们会用两种方法来描述如何在 CentOS/RHEL 以及 Ubuntu 系统上做到重启或者系统启动时执行命令和脚本。 两种方法都通过了测试。

### 方法 1 – 使用 rc.local

这种方法会利用 `/etc/` 中的 `rc.local` 文件来在启动时执行脚本与命令。我们在文件中加上一行来执行脚本，这样每次启动系统时，都会执行该脚本。

不过我们首先需要为 `/etc/rc.local` 添加执行权限，

```
$ sudo chmod +x /etc/rc.local
```

然后将要执行的脚本加入其中：

```
$ sudo vi /etc/rc.local
```

在文件最后加上：

```
sh /root/script.sh &
```

然后保存文件并退出。使用 `rc.local` 文件来执行命令也是一样的，但是一定要记得填写命令的完整路径。 想知道命令的完整路径可以运行：

```
$ which command
```

比如：

```
$ which shutter
/usr/bin/shutter
```

如果是 CentOS，我们修改的是文件 `/etc/rc.d/rc.local` 而不是 `/etc/rc.local`。 不过我们也需要先为该文件添加可执行权限。

注意:- 启动时执行的脚本，请一定保证是以 `exit 0` 结尾的。

### 方法 2 – 使用 Crontab

该方法最简单了。我们创建一个 cron 任务，这个任务在系统启动后等待 90 秒，然后执行命令和脚本。

要创建 cron 任务，打开终端并执行

```
$ crontab -e
```

然后输入下行内容，

```
@reboot ( sleep 90 ; sh \location\script.sh )
```

这里 `\location\script.sh` 就是待执行脚本的地址。

我们的文章至此就完了。如有疑问，欢迎留言。

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/executing-commands-scripts-at-reboot/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
