解决 Arch Linux 中出现的 “error：failed to commit transaction (conflicting files)”
======

![](https://www.ostechnix.com/wp-content/uploads/2018/06/arch_linux_wallpaper-720x340.png)

自我更新 Arch Linux 桌面以来已经有一个月了。今天我试着更新我的 Arch Linux 系统，然后遇到一个错误 “error：failed to commit transaction (conflicting files) stfl：/usr/lib/libstfl.so.0 exists in filesystem”。看起来是 pacman 无法更新一个已经存在于文件系统上的库 (/usr/lib/libstfl.so.0)。如果你也遇到了同样的问题，下面是一个快速解决方案。

### 解决 Arch Linux 中出现的 “error：failed to commit transaction (conflicting files)”

有三种方法。

1。简单在升级时忽略导致问题的 stfl 库并尝试再次更新系统。请参阅此指南以了解 [如何在更新时忽略软件包][1]。

2。使用命令覆盖这个包：

```
$ sudo pacman -Syu --overwrite /usr/lib/libstfl.so.0
```

3。手工删掉 stfl 库然后再次升级系统。请确保目标包不被其他任何重要的包所依赖。可以通过去 archlinux.org 查看是否有这种冲突。

```
$ sudo rm /usr/lib/libstfl.so.0
```

现在，尝试更新系统：

```
$ sudo pacman -Syu
```

我选择第三种方法，直接删除该文件然后升级 Arch Linux 系统。很有效！

希望本文对你有所帮助。还有更多好东西。敬请期待！

干杯！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-solve-error-failed-to-commit-transaction-conflicting-files-in-arch-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/safely-ignore-package-upgraded-arch-linux/
