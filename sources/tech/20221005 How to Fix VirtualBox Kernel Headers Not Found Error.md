[#]: subject: "How to Fix VirtualBox Kernel Headers Not Found Error"
[#]: via: "https://www.debugpoint.com/virtualbox-kernel-headers-not-found-error/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Fix VirtualBox Kernel Headers Not Found Error
======
This quick guide would help you to fix the “VirtualBox Kernel Headers Not Found” error.

### Reason for the error

When you run Fedora or any related distro (such as RHEL, CentOS, etc.) in [VirtualBox][1] as a guest, you get this error while [installing the VirtualBox guest additions][2].

The primary reason is the difference in Kernel versions between the guest and the host system.

For example, if your host system has Linux Kernel 5.19 for example and you are installing any distribution with a different version, say 5.14, then you may run into this error while running the setup script for the virtual box guest additions.

The VirtualBox guest addition set-up requires the necessary Kernel modules to be built inside the guest system. Then it checks whether the Kernel modules match; otherwise, it throws this error.

![error][3]

### Fix the Kernel Headers Not found error in VirtualBox

To solve this, open a terminal **inside the guest system.**

And install the necessary Kernel packages as mentioned below.

```
sudo dnf install kernel-headers kernel-devel
```

And then reboot.

```
reboot
```

After reboot, try to re-run the VirtualBox guest addition installation script. And the error should be fixed.

If not, drop a note below.

![After fixing the Kernel headers not found error][4]

Note: Although its mentioned that only for Fedora and related distros. But the same applies to Ubuntu and related distros as well. The idea is the same to install the necessary packages in the guest system.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/virtualbox-kernel-headers-not-found-error/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.virtualbox.org/
[2]: https://www.debugpoint.com/virtualbox-guest-additions-fedora/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/10/Kernel-Headers-not-found-error.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/10/After-fixing-the-Kernel-headers-not-found-error.jpg
