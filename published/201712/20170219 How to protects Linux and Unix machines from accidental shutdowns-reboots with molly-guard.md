使用 molly-guard 保护你的 Linux/Unix 机器不会被错误地关机/重启
======

我去！又是这样。 我还以为我登录到家里的服务器呢。 结果 [重启的居然是数据库服务器][1]。 另外我也有时会在错误终端内输入 "[shutdown -h 0][2]" 命令。 我知道有些人 [经常会犯这个错误 ][3]。

![我的愤怒无从容忍][4]

有办法解决这个问题吗？我真的只能忍受这种随机重启和关机的痛苦吗？ 虽说人总是要犯错的，但总不能一错再错吧。

最新我在 tweet 上发了一通牢骚：

> 我总是一遍又一遍地犯下同样的错误 :( 本来应该输入：
> `sudo virsh reboot d1`
>
> 却总是输错重启了自己的电脑
> `sudo reboot d1`
>
> -- nixCraft (@nixcraft) [February 19，2017][5]

结果收到了一些建议。我们来试一下。

### 向你引荐 molly guard

Molly-Guard **尝试阻止你不小心关闭或重启 Linux 服务器**。它在 Debian/Ubuntu 中的包描述为：

> 这个包会安装一个 shell 脚本来屏蔽现有的 `shutdown`/`reboot`/`halt`/`poweroff`/`coldreboot`/`pm-hibernate`/`pm-suspend*` 命令。 `molly-gurad` 会首先运行一系列的脚本，只有在所有的脚本都返回成功的条件下， 才会调用真正的命令。 其中一个脚本会检查是否存在 SSH 会话。 如果是通过 SSH 会话调用的命令， shell 脚本会提示你输入相关闭主机的名称。 这应该足够防止你发生意外的关机或重启了。

貌似 [molly-guard][6] 还是个<ruby>专有名词<rt>Jargon File</rt></ruby>：

> 一种用于防止由于笨拙或者不小心触碰道大红开关的屏障。最初指的临时盖在 IBM 4341 的大红按钮上的有机玻璃，因为有一个程序员蹒跚学步的女儿（名叫 Molly）一天之内重启了它两次。 后来这个东西也被用来盖住磁盘和网络设备上的停止/重启按钮。在硬件目录中，你很少会看到 “guarded button” 这样无趣的描述"。

### 如何安装 molly guard

使用 [`apt-get` 命令][7] 或者 [`apt` 命令][8] 来搜索并安装 molly-guard：

```
$ apt search molly-guard
$ sudo apt-get install molly-guard
```

结果为：

[![Fig.01： Installing molly guard on Linux][9]][10]

### 测试一下

输入 [`reboot` 命令 ][11] 和 `shutdown` 命令：

```
$ sudo reboot
# reboot
$ shutdown -h 0
# sudo shutdown -h 0
### running wrong command such as follows instead of
### sudo virsh reboot vm_name_here
$ sudo reboot vm_name_here
```

结果为：

![Fig.02： Molly guard saved my butt ;\)][12]

我超级喜欢 molly-guard。因此我将下行内容加入到 `apt-debian-ubuntu-common.yml` 文件中了：

```
 - apt：
 name： molly-guard

```

是的。我使用 Ansible 在所有的 Debian 和 Ubuntu 服务器上都自动安装上它了。

**相关** ： [我的 10 大 UNIX 命令行错误][13]

### 如果我的 Linux 发行版或者 Unix 系统（比如 FreeBSD） 没有 molly-guard 怎么办呢？

不用怕，[设置 shell 别名 ][14]：
```
## bash shell example ###
alias reboot = "echo 'Are you sure？' If so， run /sbin/reboot"
alias shutdown = "echo 'Are you sure？' If so， run /sbin/shutdown"
```

你也可以 [临时取消别名机制运行真正的命令][15]。比如要运行 reboot 可以这样：

```
# \reboot
```

或者

```
# /sbin/reboot
```

另外你也可以写一个 [shell/perl/python 脚本来调用这些命令并要求][16] 确认 `reboot`/`halt`/`shutdown` 的选项。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/hardware/how-to-protects-linux-and-unix-machines-from-accidental-shutdownsreboots-with-molly-guard/

作者：[Vivek Gite][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/howto-reboot-linux/
[2]:https://www.cyberciti.biz/faq/shutdown-linux-server/
[3]:https://www.cyberciti.biz/tips/my-10-unix-command-line-mistakes.html (My 10 UNIX Command Line Mistakes)
[4]:https://www.cyberciti.biz/media/new/cms/2017/02/anger.gif
[5]:https://twitter.com/nixcraft/status/833320792880320513
[6]:http://catb.org/~esr/jargon/html/M/molly-guard.html
[7]://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[8]://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[9]:https://www.cyberciti.biz/media/new/cms/2017/02/install-molly-guard-on-linux.jpg
[10]:https://www.cyberciti.biz/hardware/how-to-protects-linux-and-unix-machines-from-accidental-shutdownsreboots-with-molly-guard/attachment/install-molly-guard-on-linux/
[11]:https://www.cyberciti.biz/faq/linux-reboot-command/ (See Linux/Unix reboot command examples for more info)
[12]:https://www.cyberciti.biz/media/new/cms/2017/02/saved-my-butt.jpg
[13]:https://www.cyberciti.biz/tips/my-10-unix-command-line-mistakes.html
[14]:https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
[15]:https://www.cyberciti.biz/faq/bash-shell-temporarily-disable-an-alias/
[16]:https://github.com/kjetilho/clumsy_protect
[17]:https://twitter.com/nixcraft
[18]:https://facebook.com/nixcraft
[19]:https://plus.google.com/+CybercitiBiz
