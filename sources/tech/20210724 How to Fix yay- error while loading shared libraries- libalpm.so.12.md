[#]: subject: "How to Fix yay: error while loading shared libraries: libalpm.so.12"
[#]: via: "https://www.debugpoint.com/2021/07/yay-error-libalpm-so-12/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Fix yay: error while loading shared libraries: libalpm.so.12
======
This quick guide is to help you to fix yay error – while loading shared libraries: libalpm.so.12.

If you are running [Arch Linux][1] in a system for longer, things can break due to its rolling release nature combined with your hardware support. If you use the AUR Helper Yay, then sometimes, yay can be corrupted due to several installations upgrades of other packages.

The YAY helper is very stable, but sometimes it gets messed up, and you can not do any installation using it until you fix it. And one of the nagging errors is this:

```
yay: error while loading shared libraries: libalpm.so.12: cannot open shared object file: No such file or directory
```

This error particularly comes after upgrading to pacman 6.0 due to incompatibility of shared libraries.

![error while loading shared libraries - yay][2]

### How to fix yay error – while loading shared libraries: libalpm.so.12

* This error can only be fixed by uninstalling yay completely, including its dependencies.
* Then re-installing yay.

* There is no other way to solve this error.

* We already have a guide [how to install Yay][3], however, here are the steps to fix.
* Clone the yay repo from AUR and build. Run the following command in sequence from a terminal window.

```
cd /tmp
git clone 'https://aur.archlinux.org/yay.git'
cd /tmp/yay
makepkg -si
cd ~
rm -rf /tmp/yay/
```

After installation, you can try running the command which gave you this error. And you should be all set. If you still have this error, let me know in the comment box below.

Many people have encountered this, and [several discussions][4] happened across the web. Above is the only solution to this error. And I could not find the exact root cause of the problem anywhere except it started after pacman 6.0 update.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/yay-error-libalpm-so-12/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://archlinux.org/
[2]: https://www.debugpoint.com/wp-content/uploads/2021/07/error-while-loading-shared-libraries-yay.jpg
[3]: https://www.debugpoint.com/2021/01/install-yay-arch/
[4]: https://github.com/Jguer/yay/issues/1519
