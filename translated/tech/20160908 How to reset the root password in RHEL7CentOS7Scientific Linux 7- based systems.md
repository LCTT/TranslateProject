### 如何重置基于 RHEL7/CentOS7/Scientific Linux 7 系统的密码

内容

*   *   [1. 目的][9]
    *   [2. 要求][10]
    *   [3. 难易度][11]
    *   [4. 指导][12]
        *   [4.1. 启动进入最小模式][1]
        *   [4.2. 中断启动进程][2]
        *   [4.3. 重新挂载可以读写的系统][3]
        *   [4.4. 使 /sysroot 成为根目录][4]
        *   [4.5. 修改 root 密码][5]
        *   [4.6. 加载 SELinux 策略][6]
        *   [4.7. 在 /etc/shadow 中设置上下文类型][7]
        *   [4.8. 退出并重启][8]

### 目的

在 RHEL7/CentOS7/Scientific Linux 7 中重设 root 密码。

### 要求

RHEL7 / CentOS7 / Scientific Linux 7

### 难易度

中等

### 指导

RHEL7 的世界发生了变化，重置 root 密码的方式也一样。虽然中断引导过程（init=/bin/bash）的旧方法仍然有效，但它不再是推荐的。“Systemd” 使用 “rd.break” 来中断引导。让我们快速浏览下整个过程。 

### 启动进入最小模式

重启系统并在内核列表页面在系统启动之前按下 `e`。你会进入编辑模式。

### 中断启动进程

在内核字符串中 - 在以 “linux 16 /vmlinuz- ect” 结尾的行中输入 “rd.break”。接着 Ctrl+X 重启。系统启动进入初始化内存磁盘，并挂载在 /sysroot。在此模式中你不需要输入密码。

### 重新挂载可以读写的系统

```
 switch_root:/# mount -o remount,rw /sysroot/
```

### 使 /sysroot 成为根目录

```
 switch_root:/# chroot /sysroot 
```
命令行会稍微改变。

### 修改 root 密码

```
sh-4.2# passwd 
```

### 加载 SELinux 策略

```
sh-4.2# load_policy -i 
```

###  在 /etc/shadow 中设置上下文类型

```
sh-4.2# chcon -t shadow_t /etc/shadow 
```

注意：你可以通过创建 autorelabel 文件略过最后两步，但是 autorelabel 会花费很长时间。

```
sh-4.2# touch /.autorelabel 
```

因为这个原因，尽管它更简单，它应该作为“懒人选择”，而不是建议。

### 退出并重启

退出并重启并用新的 root 密码登录。

--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems

作者：[Rado Folwarczny][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems
[1]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-1-boot-into-the-minimal-mode
[2]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-2-interrupt-the-boot-process
[3]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-3-remount-the-system-so-that-it-can-read-and-write
[4]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-4-make-sysroot-your-root
[5]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-5-change-the-root-password
[6]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-6-load-selinux-policy
[7]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-7-set-context-type-on-etc-shadow-file
[8]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-8-exit-reboot
[9]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h1-objective
[10]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h2-requirements
[11]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h3-difficulty
[12]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-instructions
