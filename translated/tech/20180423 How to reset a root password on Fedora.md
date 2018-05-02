如何重置 Fedora 上的 root 密码
======

![](https://fedoramagazine.org/wp-content/uploads/2018/04/resetrootpassword-816x345.jpg)
系统管理员可以轻松地为忘记密码的用户重置密码。但是如果系统管理员忘记 root 密码会发生什么？本指南将告诉你如何重置遗失或忘记的 root 密码。请注意，要重置 root 密码，你需要能够接触到本机以重新启动并访问 GRUB 设置。此外，如果系统已加密，你还需要知道 LUKS 密码。

### 编辑 GRUB 设置

首先你需要中断启动过程。所以你需要打开系统，如果已经打开就重新启动。第一步很棘手，因为 grub 菜单往往会在屏幕上快速闪过。

当你看到 GRUB 菜单时，请按键盘上的 **E** 键：

![][1]

按下 ‘e’ 后显示以下屏幕：

![][2]

使用箭头键移动到 **linux16** 这行。

![][3]

使用您的**删除**键或**后退**键，删除 **rhgb quiet** 并替换为以下内容。
```
rd.break enforcing=0

```

![][4]

编辑好后，按下 **Ctrl-x** 启动系统。如果系统已加密，则系统会提示你输入 LUKS 密码。

**注意：** 设置 enforcing=0，避免执行完整的系统 SELinux 重新标记。系统重启后，为 /etc/shadow 恢复正确的 SELinux 上下文。（这个会进一步解释）

### 挂载文件系统

系统现在将处于紧急模式。以读写权限重新挂载硬盘：
```
# mount –o remount,rw /sysroot

```

### 更改密码

运行 chroot 访问系统。
```
# chroot /sysroot

```

你现在可以更改 root 密码。
```
# passwd

```

出现提示时输入新的 root 密码两次。如果成功，你应该看到一条 **all authentication tokens updated successfully** 消息。

输入 **exit** 两次重新启动系统。

以 root 身份登录并将 SELinux 标签恢复到 /etc/shadow 中。
```
# restorecon -v /etc/shadow

```

将 SELinux 变回 enforce 模式。
```
# setenforce 1

```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/reset-root-password-fedora/

作者：[Curt Warfield][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/rcurtiswarfield/
[1]:https://fedoramagazine.org/wp-content/uploads/2018/04/grub.png
[2]:https://fedoramagazine.org/wp-content/uploads/2018/04/grub2.png
[3]:https://fedoramagazine.org/wp-content/uploads/2018/04/grub3.png
[4]:https://fedoramagazine.org/wp-content/uploads/2018/04/grub4.png
