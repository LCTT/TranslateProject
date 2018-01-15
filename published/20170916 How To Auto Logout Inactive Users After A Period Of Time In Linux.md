如何在 Linux 上让一段时间不活动的用户自动登出
======

![](https://www.ostechnix.com/wp-content/uploads/2017/09/logout-720x340.jpg)

让我们想象这么一个场景。你有一台服务器经常被网络中各系统的很多个用户访问。有可能出现某些用户忘记登出会话让会话保持会话处于连接状态。我们都知道留下一个处于连接状态的用户会话是一件多么危险的事情。有些用户可能会借此故意做一些损坏系统的事情。而你，作为一名系统管理员，会去每个系统上都检查一遍用户是否有登出吗？其实这完全没必要的。而且若网络中有成百上千台机器，这也太耗时了。不过，你可以让用户在本机或 SSH 会话上超过一定时间不活跃的情况下自动登出。本教程就将教你如何在类 Unix 系统上实现这一点。一点都不难。跟我做。

### 在 Linux 上实现一段时间后自动登出非活动用户

有三种实现方法。让我们先来看第一种方法。

#### 方法 1：

编辑 `~/.bashrc` 或 `~/.bash_profile` 文件：

```
$ vi ~/.bashrc
```

或，

```
$ vi ~/.bash_profile
```

将下面行加入其中：

```
TMOUT=100
```

这会让用户在停止动作 100 秒后自动登出。你可以根据需要定义这个值。保存并关闭文件。

运行下面命令让更改生效：

```
$ source ~/.bashrc
```

或，

```
$ source ~/.bash_profile
```

现在让会话闲置 100 秒。100 秒不活动后，你会看到下面这段信息，并且用户会自动退出会话。

```
timed out waiting for input: auto-logout
Connection to 192.168.43.2 closed.
```

该设置可以轻易地被用户所修改。因为，`~/.bashrc` 文件被用户自己所拥有。

要修改或者删除超时设置，只需要删掉上面添加的行然后执行 `source ~/.bashrc` 命令让修改生效。

此外，用户也可以运行下面命令来禁止超时：

```
$ export TMOUT=0
```

或，

```
$ unset TMOUT
```

若你想阻止用户修改该设置，使用下面方法代替。

#### 方法 2：

以 root 用户登录。

创建一个名为 `autologout.sh` 的新文件。

```
# vi /etc/profile.d/autologout.sh
```

加入下面内容：

```
TMOUT=100
readonly TMOUT
export TMOUT
```

保存并退出该文件。

为它添加可执行权限：

```
# chmod +x /etc/profile.d/autologout.sh
```

现在，登出或者重启系统。非活动用户就会在 100 秒后自动登出了。普通用户即使想保留会话连接但也无法修改该配置了。他们会在 100 秒后强制退出。

这两种方法对本地会话和远程会话都适用（即本地登录的用户和远程系统上通过 SSH 登录的用户）。下面让我们来看看如何实现只自动登出非活动的 SSH 会话，而不自动登出本地会话。

#### 方法 3：

这种方法，我们只会让 SSH 会话用户在一段时间不活动后自动登出。

编辑 `/etc/ssh/sshd_config` 文件：

```
$ sudo vi /etc/ssh/sshd_config
```

添加/修改下面行：

```
ClientAliveInterval 100
ClientAliveCountMax 0
```

保存并退出该文件。重启 sshd 服务让改动生效。

```
$ sudo systemctl restart sshd
```

现在，在远程系统通过 ssh 登录该系统。100 秒后，ssh 会话就会自动关闭了，你也会看到下面消息：

```
$ Connection to 192.168.43.2 closed by remote host.
Connection to 192.168.43.2 closed.
```

现在，任何人从远程系统通过 SSH 登录本系统，都会在 100 秒不活动后自动登出了。

希望本文能对你有所帮助。我马上还会写另一篇实用指南。如果你觉得我们的指南有用，请在您的社交网络上分享，支持 我们！

祝您好运！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/auto-logout-inactive-users-period-time-linux/

作者：[SK][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
