[#]: subject: "Manual action required to update Fedora Silverblue, Kinoite and IoT (version 36)"
[#]: via: "https://fedoramagazine.org/manual-action-required-to-update-fedora-silverblue-kinoite-and-iot-version-36/"
[#]: author: "Timothée Ravier https://fedoramagazine.org/author/siosm/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Manual action required to update Fedora Silverblue, Kinoite and IoT (version 36)
======
![][1]

Pocket watch photo by [Ivan Diaz][2] on [Unsplash][3], Cracked glass photo by [Thomas Dumortier][4] on [Unsplash][5]

Due to an unfortunate combination of issues, the Fedora Silverblue, Kinoite and IoT variants that are running a version from 36.20220810.0 and later are no longer able to update to the latest version.

You can use these two commands to work around the bugs:

```
$ sudo find /boot/efi -exec touch '{}' ';'
$ sudo touch /etc/kernel/cmdline
```

Afterwards, you can update your system as usual with GNOME Software (on Silverblue) or via:

```
$ sudo rpm-ostree upgrade
```

These two issues are rooted in GRUB2 bugs that have only landed in Fedora and do not affect CentOS Stream 9 or RHEL. This also does not affect Fedora CoreOS for different reasons.

You can get more details about those issues in the tracker for Fedora Silverblue: [https://github.com/fedora-silverblue/issue-tracker/issues/322][6]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/manual-action-required-to-update-fedora-silverblue-kinoite-and-iot-version-36/

作者：[Timothée Ravier][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/siosm/
[b]: https://github.com/lkxed
[1]: https://fedoramagazine.org/wp-content/uploads/2022/09/broken-clock-816x345.jpg
[2]: https://unsplash.com/@ivvndiaz?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/clock?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://unsplash.com/es/@mimoto_photo?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[5]: https://unsplash.com/s/photos/broken-glass?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[6]: https://github.com/fedora-silverblue/issue-tracker/issues/322
