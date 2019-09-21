如何在 Linux 上锁定虚拟控制台会话
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/vlock-720x340.png)

当你在共享的系统上工作时，你可能不希望其他用户偷窥你的控制台中看你在做什么。如果是这样，我知道有个简单的技巧来锁定自己的会话，同时仍然允许其他用户在其他虚拟控制台上使用该系统。要感谢 **Vlock**（**V**irtual Console **lock**），这是一个命令行程序，用于锁定 Linux 控制台上的一个或多个会话。如有必要，你可以锁定整个控制台并完全禁用虚拟控制台切换功能。Vlock 对于有多个用户访问控制台的共享 Linux 系统特别有用。

### 安装 Vlock

在基于 Arch 的系统上，Vlock 软件包被替换为默认预安装的 **kpd** 包，因此你无需为安装烦恼。

在 Debian、Ubuntu、Linux Mint 上，运行以下命令来安装 Vlock：

```
$ sudo apt-get install vlock
```

在 Fedora 上：

```
$ sudo dnf install vlock
```

在 RHEL、CentOS 上：

```
$ sudo yum install vlock
```

### 在 Linux 上锁定虚拟控制台会话

Vlock 的一般语法是：

```
vlock [ -acnshv ] [ -t <timeout> ] [ plugins... ]
```

这里：

* `a` —— 锁定所有虚拟控制台会话，
* `c` —— 锁定当前虚拟控制台会话，
* `n` —— 在锁定所有会话之前切换到新的空控制台，
* `s` —— 禁用 SysRq 键机制，
* `t` —— 指定屏保插件的超时时间，
* `h` —— 显示帮助，
* `v` —— 显示版本。

让我举几个例子。

#### 1、 锁定当前控制台会话

在没有任何参数的情况下运行 Vlock 时，它默认锁定当前控制台会话 （TYY）。要解锁会话，你需要输入当前用户的密码或 root 密码。

```
$ vlock
```

![](https://www.ostechnix.com/wp-content/uploads/2018/10/vlock-1-1.gif)

你还可以使用 `-c` 标志来锁定当前的控制台会话。

```
$ vlock -c
```

请注意，此命令仅锁定当前控制台。你可以按 `ALT+F2` 切换到其他控制台。有关在 TTY 之间切换的更多详细信息，请参阅以下指南。

此外，如果系统有多个用户，则其他用户仍可以访问其各自的 TTY。

#### 2、 锁定所有控制台会话

要同时锁定所有 TTY 并禁用虚拟控制台切换功能，请运行：

```
$ vlock -a
```

同样，要解锁控制台会话，只需按下回车键并输入当前用户的密码或 root 用户密码。

请记住，**root 用户可以随时解锁任何 vlock 会话**，除非在编译时禁用。

#### 3、 在锁定所有控制台之前切换到新的虚拟控制台

在锁定所有控制台之前，还可以使 Vlock 从 X 会话切换到新的空虚拟控制台。为此，请使用 `-n` 标志。

```
$ vlock -n
```

#### 4、 禁用 SysRq 机制

你也许知道，魔术 SysRq 键机制允许用户在系统死机时执行某些操作。因此，用户可以使用 SysRq 解锁控制台。为了防止这种情况，请传递 `-s` 选项以禁用 SysRq 机制。请记住，这个选项只适用于有 `-a` 选项的时候。

```
$ vlock -sa
```

有关更多选项及其用法，请参阅帮助或手册页。

```
$ vlock -h
$ man vlock
```

Vlock 可防止未经授权的用户获得控制台访问权限。如果你在为 Linux 寻找一个简单的控制台锁定机制，那么 Vlock 值得一试！

就是这些了。希望这篇文章有用。还有更多好东西。敬请关注！

干杯!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-lock-virtual-console-sessions-on-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
