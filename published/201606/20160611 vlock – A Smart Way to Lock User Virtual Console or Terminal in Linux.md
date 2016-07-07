vlock – 一个锁定 Linux 用户虚拟控制台或终端的好方法
=======================================================================

虚拟控制台是 Linux 上非常重要的功能，它们给系统用户提供了 shell 提示符，以保证用户在登录和远程登录一个未安装图形界面的系统时仍能使用。

一个用户可以同时操作多个虚拟控制台会话，只需在虚拟控制台间来回切换即可。

![](http://www.tecmint.com/wp-content/uploads/2016/05/vlock-Lock-User-Terminal-in-Linux.png)

*用 vlock 锁定 Linux 用户控制台或终端*

这篇使用指导旨在教会大家如何使用 vlock 来锁定用户虚拟控制台和终端。

### vlock 是什么？

vlock 是一个用于锁定一个或多个用户虚拟控制台用户会话的工具。在多用户系统中 vlock 扮演着重要的角色，它让用户可以在锁住自己会话的同时不影响其他用户通过其他虚拟控制台操作同一个系统。必要时，还可以锁定所有的控制台，同时禁止在虚拟控制台间切换。

vlock 的主要功能面向控制台会话方面，同时也支持非控制台会话的锁定，但该功能的测试还不完全。

### 在 Linux 上安装 vlock

根据你的 Linux 系统选择 vlock 安装指令：

```
# yum install vlock           [On RHEL / CentOS / Fedora]
$ sudo apt-get install vlock  [On Ubuntu / Debian / Mint]
```

### 在 Linux 上使用 vlock

vlock 操作选项的常规语法：

```
# vlock option
# vlock option plugin
# vlock option -t <timeout> plugin
```

#### vlock 常用选项及用法：

1、 锁定用户的当前虚拟控制台或终端会话，如下：

```
# vlock --current
```
  
![](http://www.tecmint.com/wp-content/uploads/2016/05/Lock-User-Terminal-Session-in-Linux.png)

*锁定 Linux 用户终端会话*
  
选项 -c 或 --current，用于锁定当前的会话，该参数为运行 vlock 时的默认行为。

2、 锁定所有你的虚拟控制台会话，并禁用虚拟控制台间切换，命令如下：

```
# vlock --all
```
  
![](http://www.tecmint.com/wp-content/uploads/2016/05/Lock-All-Linux-Terminal-Sessions.png)

*锁定所有 Linux 终端会话*
  
选项 -a 或 --all，用于锁定所有用户的控制台会话，并禁用虚拟控制台间切换。

其他的选项只有在编译 vlock 时编入了相关插件支持和引用后，才能发挥作用：

3、 选项 -n 或 --new，调用时后，会在锁定用户的控制台会话前切换到一个新的虚拟控制台。
  
```
# vlock --new
```

4、 选项 -s 或 --disable-sysrq，在禁用虚拟控制台的同时禁用 SysRq 功能，只有在与 -a 或 --all 同时使用时才起作用。

```
# vlock -sa
```

5、 选项 -t 或 --timeout <time_in_seconds>，用以设定屏幕保护插件的 timeout 值。
  
```
# vlock --timeout 5
```

你可以使用 `-h`  或 `--help` 和 `-v` 或 `--version`  分别查看帮助消息和版本信息。

我们的介绍就到这了，提示一点，你可以将 vlock 的 `~/.vlockrc` 文件包含到系统启动中，并参考入门手册[添加环境变量][1]，特别是 Debian 系的用户。

想要找到更多或是补充一些这里没有提及的信息，可以直接在写在下方评论区。
  
--------------------------------------------------------------------------------

via: http://www.tecmint.com/vlock-lock-user-virtual-console-terminal-linux/

作者：[Aaron Kili][a]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/set-path-variable-linux-permanently/
