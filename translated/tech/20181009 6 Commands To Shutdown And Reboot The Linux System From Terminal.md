重启和关闭 Linux 系统的 6 个终端命令
======
在 Linux 管理员的日程当中, 有很多需要执行的任务, 系统的重启和关闭就被包含其中.

对于 Linux 管理员来说, 重启和关闭系统是其诸多风险操作中的一例, 有时候, 由于某些原因, 这些操作可能无法挽回, 他们需要更多的时间来排查问题.

在 Linux 命令行模式下我们可以执行这些任务. 很多时候, 由于熟悉命令行, Linux 管理员更倾向于在命令行下完成这些任务.

重启和关闭系统的 Linux 命令并不多, 用户需要根据需要, 选择合适的命令来完成任务.

以下所有命令都有其自身特点, 并允许被 Linux 管理员使用.

**建议阅读 :**

**(#)** [查看系统/服务器正常运行时间的 11 个方法][1]

**(#)** [Tuptime 一款为 Linux 系统保存历史记录, 统计运行时间工具][2]

系统重启和关闭之始, 会通知所有已登录的用户和已注册的进程. 当然, 如果会造成冲突, 系统不会允许新的用户登入.

执行此类操作之前, 我建议您坚持复查, 因为您只能得到很少的提示来确保这一切顺利.

下面陈列了一些步骤.

  * 确保您拥有一个可以处理故障的终端, 以防之后可能会发生的问题. VMWare 可以访问物理服务器的虚拟机, IPMI, iLO 和 iDRAC.
  * 您需要通过公司的流程, 申请修改或故障的执行权直到得到许可.
  * 为安全着想, 备份重要的配置文件, 并保存到其他服务器上.
  * 验证日志文件(提前检查)
  * 和相关团队交流, 比如数据库管理团队, 应用团队等.
  * 通知数据库和应用服务人员关闭服务, 并得到确定.
  * 使用适当的命令复盘操作, 验证工作.
  * 最后, 重启系统
  * 验证日志文件, 如果一切顺利, 执行下一步操作, 如果发现任何问题, 对症排查.
  * 无论是回退版本还是运行程序, 通知相关团队提出申请.
  * 对操作做适当守候, 并将预期的一切正常的反馈给团队
  
使用下列命令执行这项任务.

  * **`shutdown 命令:`** shutdown 命令用来为中止, 重启或切断电源
  * **`halt 命令:`** halt 命令用来为中止, 重启或切断电源
  * **`poweroff 命令:`** poweroff 命令用来为中止, 重启或切断电源
  * **`reboot 命令:`** reboot 命令用来为中止, 重启或切断电源
  * **`init 命令:`** init(initialization 的简称) 是系统启动的第一个进程.
  * **`systemctl 命令:`** systemd 是 Linux 系统和服务器的管理程序.


### 方案 - 1: 如何使用 Shutdown 命令关闭和重启 Linux 系统 

shutdown 命令用户关闭或重启本地和远程的 Linux 设备. 它为高效完成作业提供多个选项. 如果使用了 time 参数, 系统关闭的 5 分钟之前, /run/nologin 文件会被创建, 以确保后续的登录会被拒绝.

通用语法如下

```
# shutdown [OPTION] [TIME] [MESSAGE]

```

运行下面的命令来立即关闭 Linux 设备. 它会立刻杀死所有进程, 并关闭系统.

```
# shutdown -h now

```

  * **`-h:`** 如果不特指 -halt 选项, 这等价于 -poweroff 选项.

另外我们可以使用带有 `poweroff` 选项的 `shutdown` 命令来立即关闭设备.

```
# shutdown --halt now
或者
# shutdown -H now

```

  * **`-H, --halt:`** 停止设备运行

另外我们可以使用带有 `poweroff` 选项的 `shutdown` 命令来立即关闭设备.

```
# shutdown --poweroff now
或者
# shutdown -P now

```

  * **`-P, --poweroff:`** 切断电源 (默认).

运行以下命令立即关闭 Linux 设备. 它将会立即杀死所有的进程并关闭系统.

```
# shutdown -h now

```

  * **`-h:`** 如果不特指 -halt 选项, 这等价于 -poweroff 选项.

如果您没有使用 time 选项运行下面的命令, 它将会在一分钟后执行给出的命令

```
# shutdown -h
Shutdown scheduled for Mon 2018-10-08 06:42:31 EDT, use 'shutdown -c' to cancel.

[email protected]#
Broadcast message from [email protected] (Mon 2018-10-08 06:41:31 EDT):

The system is going down for power-off at Mon 2018-10-08 06:42:31 EDT!

```

其他的登录用户都能在中断中看到如下的广播消息:

```
[[email protected] ~]$
Broadcast message from [email protected] (Mon 2018-10-08 06:41:31 EDT):

The system is going down for power-off at Mon 2018-10-08 06:42:31 EDT!

```

对于使用了 Halt 选项.

```
# shutdown -H
Shutdown scheduled for Mon 2018-10-08 06:37:53 EDT, use 'shutdown -c' to cancel.

[email protected]#
Broadcast message from [email protected] (Mon 2018-10-08 06:36:53 EDT):

The system is going down for system halt at Mon 2018-10-08 06:37:53 EDT!

```

对于使用了 Poweroff 选项.

```
# shutdown -P
Shutdown scheduled for Mon 2018-10-08 06:40:07 EDT, use 'shutdown -c' to cancel.

[email protected]#
Broadcast message from [email protected] (Mon 2018-10-08 06:39:07 EDT):

The system is going down for power-off at Mon 2018-10-08 06:40:07 EDT!

```

可以在您的终端上敲击 `Shutdown -c` 选项取消操作.

```
# shutdown -c

Broadcast message from [email protected] (Mon 2018-10-08 06:39:09 EDT):

The system shutdown has been cancelled at Mon 2018-10-08 06:40:09 EDT!

```

其他的登录用户都能在中断中看到如下的广播消息:

```
[[email protected] ~]$
Broadcast message from [email protected] (Mon 2018-10-08 06:41:35 EDT):

The system shutdown has been cancelled at Mon 2018-10-08 06:42:35 EDT!

```

添加 time 参数, 如果你想在 `N` 秒之后执行关闭或重启操作. 这里, 您可以为所有登录用户添加自定义广播消息. 例如, 我们将在五分钟后重启设备.

```
# shutdown -r +5 "To activate the latest Kernel"
Shutdown scheduled for Mon 2018-10-08 07:13:16 EDT, use 'shutdown -c' to cancel.

[[email protected] ~]#
Broadcast message from [email protected] (Mon 2018-10-08 07:08:16 EDT):

To activate the latest Kernel
The system is going down for reboot at Mon 2018-10-08 07:13:16 EDT!

```

运行下面的命令立即重启 Linux 设备. 它会立即杀死所有进程并且重新启动系统.

```
# shutdown -r now

```

  * **`-r, --reboot:`** 重启设备.

### 方案 - 2: 如何通过 reboot 命令关闭和重启 Linux 系统

reboot 命令用于关闭和重启本地或远程设备. Reboot 命令拥有两个实用的选项.

它能够优雅的关闭和重启设备(就好像在系统菜单中惦记重启选项一样简单).

执行不带任何参数的 `reboot` 命令来重启 Linux 设备

```
# reboot

```

执行带 `-p` 参数的 `reboot` 命令来关闭 Linux 设备或切断电源

```
# reboot -p

```

  * **`-p, --poweroff:`** 调用 halt 或 poweroff 命令, 切断设备电源.


执行带 `-f` 参数的 `reboot` 命令来强制重启 Linux 设备(这类似按压 CPU 上的电源键)

```
# reboot -f

```

  * **`-f, --force:`** 立刻强制中断, 切断电源或重启

### 方案 - 3: 如何通过 init 命令关闭和重启 Linux 系统 

init(initialization 的简写) 是系统启动的第一个进程.

他将会检查 /etc/inittab 文件并决定 linux 运行级别. 同时, 授权用户在 Linux 设备上执行关机或重启 操作. 这里存在从 0 到 6 的七个运行等级.

**建议阅读 :**
**(#)** [如何检查 Linux 上所有运行的服务][3]

执行一下 init 命令关闭系统.
```
# init 0

```

  * **`0:`** 中断 – 关闭系统.

运行下面的 init 命令重启设备
```
# init 6

```

  * **`6:`** 重启 – 重启设备.

### 方案 - 4: 如何通过 halt 命令关闭和重启 Linux 系统 

halt 命令用来切断电源或关闭远程 Linux 设备或本地主机.
中断所有进程并关闭 cpu
```
# halt

```

### 方案 - 5: 如何通过 poweroff 命令关闭和重启 Linux 系统 

poweroff 命令用来切断电源或关闭远程 Linux 设备或本地主机. Poweroff 很像 halt, 但是它可以关闭设备自身的单元(等和其他 PC 上的任何事物). 它会为 PSU 发送 ACPI 指令, 切断电源.

```
# poweroff

```

### 方案 - 6: 如何通过 systemctl 命令关闭和重启 Linux 系统

Systemd 是一款适用于所有主流 Linux 发型版的全新 init 系统和系统管理器, 而不是传统的 SysV init 系统.

systemd 兼容与 SysV 和 LSB 脚本. 它能够替代 sysvinit 系统. systemd 是内核启动的第一个进程, 并持有序号为 1 的进程 PID.

**建议阅读 :**
**(#)** [chkservice – 一款终端下系统单元管理工具][4]

它是一切进程的父进程, Fedora 15 是第一个适配安装 systemd 的发行版.
It’s a parent process for everything and Fedora 15 is the first distribution which was adapted systemd instead of upstart.

systemctl 是命令行下管理系统, 守护进程, 开启服务(如 start, restart, stop, enable, disable, reload & status)的主要工具.

systemd 使用 .service 文件而不是 bash 脚本(SysVinit 用户使用的). systemd 将所有守护进程归与自身的 Linux cgroups 用户组下, 您可以浏览 /cgroup/systemd 文件查看系统层次等级

```
# systemctl halt
# systemctl poweroff
# systemctl reboot
# systemctl suspend
# systemctl hibernate

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/6-commands-to-shutdown-halt-poweroff-reboot-the-linux-system/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[cyleft](https://github.com/cyleft)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/11-methods-to-find-check-system-server-uptime-in-linux/
[2]: https://www.2daygeek.com/tuptime-a-tool-to-report-the-historical-and-statistical-running-time-of-linux-system/
[3]: https://www.2daygeek.com/how-to-check-all-running-services-in-linux/
[4]: https://www.2daygeek.com/chkservice-a-tool-for-managing-systemd-units-from-linux-terminal/
