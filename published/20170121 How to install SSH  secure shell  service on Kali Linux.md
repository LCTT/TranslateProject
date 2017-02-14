如何在 Kali Linux 上安装 SSH 服务
===============

### 介绍

**目的**

我们的目的是 Kali Linux 上安装 SSH（安全 shell）。

**要求**

你需要有特权访问你的 Kali Linux 安装或者 Live 系统。

**困难程度**

很容易！

**惯例**

- `#` - 给定命令需要以 root 用户权限运行或者使用 `sudo` 命令
- `$` - 给定命令以常规权限用户运行

### 指导

**安装 SSH**

从终端使用 `apt-get` 命令安装 SSH 包：

```
# apt-get update
# apt-get install ssh
```

**启用和开始使用 SSH**

为了确保安全 shell 能够使用，在重启系统后使用 `systemctl` 命令来启用它：

```
# systemctl enable ssh
```

在当前对话执行中使用 SSH:

```
# service ssh start
```

**允许 SSH Root 访问**

默认情况下 SSH 不允许以 root 用户登录，因此将会出现下面的错误提示信息：

```
Permission denied, please try again.
```

为了通过 SSH 进入你的 Kali Linux 系统，你可以有两个不同的选择。第一个选择是创建一个新的非特权用户然后使用它的身份来登录。第二个选择，你可以以 root 用户访问 SSH 。为了实现这件事，需要在SSH 配置文件 `/etc/ssh/sshd_config` 中插入下面这些行内容或对其进行编辑：

将 

```
#PermitRootLogin prohibit-password
```

改为：

```
PermitRootLogin yes
```

![kali linux enable ssh root access](https://linuxconfig.org/images/enable-root-ssh-login-kali-linux.jpg)

对 `/etc/ssh/sshd_config` 进行更改以后，需在以 root 用户登录 SSH 前重启 SSH 服务：

```
# service ssh restart
```


--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux

作者：[Lubos Rendek][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux
[1]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h5-1-install-ssh
[2]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h5-2-enable-and-start-ssh
[3]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h5-3-allow-ssh-root-access
[4]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h1-objective
[5]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h2-requirements
[6]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h3-difficulty
[7]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h4-conventions
[8]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h5-instructions
