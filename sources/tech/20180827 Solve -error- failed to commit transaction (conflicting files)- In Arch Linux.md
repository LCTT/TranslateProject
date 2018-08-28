translating by lujun9972
Solve "error: failed to commit transaction (conflicting files)" In Arch Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/06/arch_linux_wallpaper-720x340.png)

It’s been a month since I upgraded my Arch Linux desktop. Today, I tried to update my Arch Linux system, and ran into an error that said **“error: failed to commit transaction (conflicting files) stfl: /usr/lib/libstfl.so.0 exists in filesystem”**. It looks like one library (/usr/lib/libstfl.so.0) that exists on my filesystem and pacman can’t upgrade it. If you’re encountered with the same error, here is a quick fix to resolve it.

### Solve “error: failed to commit transaction (conflicting files)” In Arch Linux

You have three options.

1. Simply ignore the problematic **stfl** library from being upgraded and try to update the system again. Refer this guide to know [**how to ignore package from being upgraded**][1].

2. Overwrite the package using command:
```
$ sudo pacman -Syu --overwrite /usr/lib/libstfl.so.0
```

3. Remove stfl library file manually and try to upgrade the system again. Please make sure the intended package is not a dependency to any important package. and check the archlinux.org whether are mentions of this conflict.
```
$ sudo rm /usr/lib/libstfl.so.0
```

Now, try to update the system:
```
$ sudo pacman -Syu
```

I chose the third option and just deleted the file and upgraded my Arch Linux system. It works now!

Hope this helps. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-solve-error-failed-to-commit-transaction-conflicting-files-in-arch-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/safely-ignore-package-upgraded-arch-linux/
