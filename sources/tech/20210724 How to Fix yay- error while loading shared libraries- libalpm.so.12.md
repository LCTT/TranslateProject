[#]: subject: (How to Fix yay: error while loading shared libraries: libalpm.so.12)
[#]: via: (https://www.debugpoint.com/2021/07/yay-error-libalpm-so-12/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Fix yay: error while loading shared libraries: libalpm.so.12
======
This quick guide is to help you to fix yay error – while loading shared
libraries: libalpm.so.12.
If you are running [Arch Linux][1] in a system for a longer time, things can break due to its rolling release nature combined with your hardware support. If you use the [AUR Helper Yay][2], then sometimes, yay can be corrupted due to several installations, upgrade of other packages.

The YAY helper itself is very stable, but sometimes it gets messed up, and you can not do any installation using it until you fix it. And one of the nagging error is this:

```
yay: error while loading shared libraries: libalpm.so.12: cannot open shared object file: No such file or directory
```

This error particularly comes after upgrading to pacman 6.0 due to incompatibility of shared libraries.

![error while loading shared libraries – yay][3]

### How to fix yay error – while loading shared libraries: libalpm.so.12

  * This error can only be fixed by uninstalling yay completely, including its dependencies.
  * Then re-installing yay.


  * There is no other way to solve this error.


  * We already have a guide [how to install Yay][4], however, here are the steps to fix.
  * Clone the yay repo from AUR and build. Run the following command in sequence from a terminal window.



```
cd /tmp
git clone 'https://aur.archlinux.org/yay.git'
cd /tmp/yay
makepkg -si
cd ~
rm -rf /tmp/yay/
```

After installation, you can try running the command which gave you this error. And you should be all set. If you’re still having error, let me know in the comment box below.

Apparently, this has been encountered by many people and [several discussions][5] happened across web. Above is the only solution to this error. And I could not find exact root cause of the problem anywhere except it starts after pacman 6.0 update.

[][6]

SEE ALSO:   How to Install Java in Arch Linux and Manjaro

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/yay-error-libalpm-so-12/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://archlinux.org/
[2]: https://aur.archlinux.org/packages/yay/
[3]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/error-while-loading-shared-libraries-yay.jpg
[4]: https://www.debugpoint.com/2021/01/install-yay-arch/
[5]: https://github.com/Jguer/yay/issues/1519
[6]: https://www.debugpoint.com/2021/02/install-java-arch/
