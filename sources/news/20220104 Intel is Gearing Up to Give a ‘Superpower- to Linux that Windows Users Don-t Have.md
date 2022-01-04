[#]: subject: "Intel is Gearing Up to Give a ‘Superpower’ to Linux that Windows Users Don’t Have"
[#]: via: "https://news.itsfoss.com/intel-linux-kernel/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Intel is Gearing Up to Give a ‘Superpower’ to Linux that Windows Users Don’t Have
======

Last year, several security vulnerabilities were discovered, making it difficult for system administrators to patch the systems without downtime quickly.

What if some improvements can be made to update some critical components for security/performance improvements without rebooting a system?

Intel aims to achieve that with its new PFRUT (Platform Firmware Runtime Update and Telemetry) driver.

### Intel Plans to Make PFRUT Available With Linux Kernel 5.17

While Linux Kernel 5.16 is due later this weekend, Intel aims to merge this new addition with the upcoming Linux Kernel 5.17 stable release.

But, what exactly is it?

With PFRUT driver, specific components (or the system firmware) can be updated while the system is running without needing to reboot.

Initially, Intel preferred to call it a “Seamless Update” solution. However, with the recent commit for Linux Kernel added to the Linux power management’s “linux-next” branch, they might be sticking to a vendor-neutral name, **pfrut_driver**.

If you are curious, the “linux-next” branch means that those changes will make their way to the next Linux Kernel 5.17 stable release.

In technical terms, the [commit][1] explains the change as follows:

> The user is expected to provide the EFI capsule, and pass it to the driver by writing the capsule to a device special file. The capsule is transferred by the driver to the platform firmware with the help of an ACPI _DSM method under the special ACPI Platform Firmware Runtime Update device (INTC1080), and the actual firmware update is carried out by the low-level Management Mode code in the platform firmware

This should eliminate any downtime, as one would typically expect with an essential update to firmware addressing any security and performance improvements. And, system firmware updates can be easily applied directly through the operating system (Linux, here).

The telemetry part of the driver exists to “_retrieve log messages from MM for monitoring
and the root cause of issues_,” as highlighted in one of the [PDFs detailing how this works][2].

Note that this is only possible with a Linux system and an Intel chip on board.

The addition of this ability should come in incredibly handy, considering it is not ideal to wait for a task to complete when you need to patch the system firmware to defend against a security issue.

### Is This for Linux Desktop or Server?

Primarily, the improvement is tailored to benefit server-specific hardware.

The official Intel documentation states it is meant for systems with high service level agreements (SLAs) requiring a minimal number of reboots.

However, this should be useful for a specific group of desktop users with enterprise-grade systems.

While this may not be something essential for desktop Linux distros, it could be an exciting start to something that improves the user experience. Specifically for users keen to keep their system firmware updated without severe interruptions to their active work.

This should also introduce the possibility of more types of updates that can be handled by the operating system instead of the motherboard when it comes to BIOS or UEFI.

Not just limited to the support for Linux desktop users, one would need to have server-grade hardware configured for your desktop.

This is limited to Linux systems, but this should also be possible for Windows and other operating systems soon.

_What do you think about this change introduced by Intel? Do you think it is a significant improvement to how system firmware updates are being handled?_

Feel free to share your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/intel-linux-kernel/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=0db89fa243e5edc5de38c88b369e4c3755c5fb74
[2]: https://uefi.org/sites/default/files/resources/Intel_MM_OS_Interface_Spec_Rev100.pdf
