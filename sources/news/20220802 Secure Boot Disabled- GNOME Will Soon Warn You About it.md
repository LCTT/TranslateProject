[#]: subject: "Secure Boot Disabled? GNOME Will Soon Warn You About it!"
[#]: via: "https://news.itsfoss.com/gnome-secure-boot-warning/"
[#]: author: "Anuj Sharma https://news.itsfoss.com/author/anuj/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Secure Boot Disabled? GNOME Will Soon Warn You About it!
======

When you install Linux on your UEFI-enabled computer, you have to disable _Secure Boot_ because the live USB will refuse to boot with the option enabled.

Some mainstream Linux distributions support Secure Boot, but it is still challenging to set up for many other distributions (and with Nvidia hardware onboard).

While things may not have improved over the years, Secure Boot is an essential protection feature in general.

So, for the sake of convenience and make users aware of it, GNOME and Red Hat developers are working on notifying (or warning) the user if **Secure Boot** is disabled, as spotted by [Phoronix][1].

### How is it Useful?

UEFI/Secure boot has been criticized for the DRM as it takes away the freedom from users. Many in the open source community still disagree with the implementation of UEFI/Secure Boot and TPM as it came as an inconvenience. This has given birth to projects like [Coreboot][2], flourishing in the open-source world.

Of course, I would advise you to purchase new hardware with Coreboot support if you daily drive Linux, which is a different story.

That said, it is safe to mention that Secure Boot is the easy way out.

Secure Boot’s security is still debatable, considering the proprietary firmware bundled. But, it is a fundamental protection mechanism to secure the system’s firmware.

So, the developers are preparing to show the warnings in [Plymouth][3] (boot splash screen), **GNOME Display Manager** (GDM), and **GNOME Control Center**.

![Image Credits: GNOME Blog][4]

One of the GNOME developers shared more details on it in a [blog post][5] while sharing some of these screenshots.

![][6]

A **Red Hat developer** mentions in the [merge request][7]:

> Secure boot is used against several security threats when malware tries to infect the firmware of the system. Users may inadvertently disable or software may intentionally disable the secure boot. Consequently, the system is running on an insecure platform with incorrect configuration. If Plymouth could offer a warning to the user, the user could reboot and reconfigure their system or asks for help immediately.

So, as a GNOME user, I think it should be interesting to see the difference it makes when it gets to the final release of GNOME 43 or any future releases.

If you are curious, you can find this option under the **Device Security** section of the **Privacy** tab in GNOME Control Center, as shown in the screenshot below of my system running GNOME 43 alpha on Arch Linux:

![][8]

The menu can also show TPM, Intel BootGuard, and IOMMU protection details:

![][9]

It seems my system is not as secure as I thought… But maybe that’s the point of this feature?

If you only used UEFI mode with your Linux distribution and had the protection features disabled for convenience, _could this make you aware of it?_

Probably. But, looking at the state of Linux distributions and the issues with enabling secure boot. I’m not confident if it would be that big of a deal. We shall find out soon.

### How to Disable the Warnings?

As mentioned in the [merge request][10] on GNOME Gitlab, adding `sb-check=false` to your kernel parameters will disable all these warnings.

You do not need to worry about it as an end-user, though.

_What do you think about this upcoming feature addition to GNOME 43 or later? What is your opinion about UEFI/Secure Boot?_

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-secure-boot-warning/

作者：[Anuj Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/anuj/
[b]: https://github.com/lujun9972
[1]: https://www.phoronix.com/news/GNOME-Secure-Boot-Warning
[2]: https://www.coreboot.org/
[3]: https://gitlab.freedesktop.org/plymouth
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxOSIgd2lkdGg9IjYxMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: https://blogs.gnome.org/hughsie/2022/07/29/emulated-host-profiles-in-fwupd/
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjM1MiIgd2lkdGg9IjEwMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[7]: https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/176
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjcwOCIgd2lkdGg9IjEwMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[9]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY3MiIgd2lkdGg9IjYyMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[10]: https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/2333
