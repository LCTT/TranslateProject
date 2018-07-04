在 5 分钟内重置丢失的 root 密码
======

> 如何快速简单地在 Fedora 、 CentOS 及类似的 Linux 发行版上重置 root 密码。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum)

系统管理员可以轻松地为忘记密码的用户重置密码。但是如果系统管理员忘记 root 密码或他从公司离职了，会发生什么情况？本指南将向你介绍如何在不到 5 分钟的时间内在 Red Hat 兼容系统（包括 Fedora 和 CentOS）上重置丢失或忘记的 root 密码。

请注意，如果整个系统硬盘已用 LUKS 加密，则需要在出现提示时提供 LUKS 密码。此外，此过程适用于运行 systemd 的系统，该系统自 Fedora 15、CentOS 7.14.04 和 Red Hat Enterprise Linux 7.0 以来一直是缺省的初始系统。

首先你需要中断启动的过程，因此你需要启动或者如果已经启动就重启它。第一步可能有点棘手因为 GRUB 菜单会在屏幕上快速地闪烁过去。你可能需要尝试几次，直到你能够做到这一点。

当你看到这个屏幕时，按下键盘上的 `e` 键：

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/grub0.png?itok=cz9nk5BT)

如果你正确地做了这点，你应该看到一个类似于这个的屏幕：

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/grub1.png?itok=3ZY5uiGq)

使用箭头键移动到 `Linux16` 这行：

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/grub2_0.png?itok=8epRyqOl)

使用你的 `del` 键或你的 `backspace` 键，删除 `rhgb quiet` 并替换为以下内容：

```
rd.break enforcing=0
```

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/grub3.png?itok=JDdMXnUb)

设置 `enforcing=0` 可以避免执行完整的系统 SELinux 重标记。一旦系统重新启动，你只需要为 `/etc/shadow` 恢复正确的 SELinux 上下文。我会告诉你如何做到这一点。

按下 `Ctrl-x` 启动。

**系统现在将处于紧急模式。**

以读写权限重新挂载硬盘驱动器：

```
# mount –o remount,rw /sysroot
```

运行 `chroot` 来访问系统：

```
# chroot /sysroot
```

你现在可以更改 root 密码：

```
# passwd
```

出现提示时，输入新的 root 密码两次。如果成功，你应该看到一条消息显示 “all authentication tokens updated successfully”。

输入 `exit` 两次以重新启动系统。

以 root 身份登录并恢复 `/etc/shadow` 的 SELinux 标签。

```
# restorecon -v /etc/shadow
```

将 SELinux 回到 enforce 模式：

```
# setenforce 1
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/reset-lost-root-password

作者：[Curt Warfield][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rcurtiswarfield
