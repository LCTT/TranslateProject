[#]: subject: "The Blue Screen of Death Comes to Linux, Thanks to Systemd"
[#]: via: "https://news.itsfoss.com/bsod-linux/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

The Blue Screen of Death Comes to Linux, Thanks to Systemd
======
Now, Linux folks get to experience the horror of a blue screen.
Over the years, the Blue-Screen-Of-Death has become synonymous with the popular Windows operating system that uses a blue-colored page to show users when any major error has occurred.

On many occasions, I have also run into seemingly random issues that would cause a BSOD on Windows, sometimes the shown error codes are helpful, and more often than not, these codes just leave me more confused.

With the release of systemd v255, we now have that on Linux. Let me take you through it:

![A dummy BSOD screen \(not a representation for how it might look on linux\)][1]

**What is happening:** systemd now features **a new experimental component** called “ _systemd-bsod_ ”, according to the [commit][2], it **will be used to display a blue screen with an error message** related to what caused a boot failure.

Similar to what Windows does, **it will also display a QR code** that users can scan with their phone to get relevant information related to the failure.

📋

Error messages will only be shown if the error is of the “ _ _LOG_EMERG__ ” log level.

**Does it matter?**

It does, you see, **the conventional way** that error codes are shown when a systemd-equipped Linux distro crashes, or refuses to boot is **quite unintuitive** , **especially for beginners**.

Users will no longer need to trundle around countless forums and articles. With the BSOD system in place, their troubleshooting will be more in line with what many are already used to.

Considering most of the [popular Linux distributions][3] are based on systemd, it should be a good thing for many users.

As for the **other changes with the systemd 255 release** , here are some key highlights:

  * **Complete overhaul** of the way services are spawned.
  * _seccomp_ now supports the **LoongArch64** microprocessor architecture.
  * Support for **System V service scripts** has been dropped, with complete removal in a future release.
  * _systemctl_ will now automatically _soft-reboot_ if a new root file system is found under " _/run/nextroot/_ " when a reboot action is done.
  * And plenty of improvements for the **TPM2 support** on systemd.



I highly suggest you to go through the [official changelog][4] to learn more about the new systemd release. You can expect this to be featured on many Linux distributions set to be released **in the first half of 2024**.

Even though many of us are familiar with the [systemd controversy][5] that has been around for quite a few years now. I wonder what kind of reaction will this BSOD implementation get when it is rolled out in the near future.

One thing is for sure, we will be showered with a barrage of Linux BSOD memes 😆

**Suggested Read** 📖

![][6]

_💬 I can't wait to see some Linux BSOD memes, what about you?_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/bsod-linux/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/content/images/2023/12/Linux_BSOD.png
[2]: https://github.com/systemd/systemd/commit/fc7eb1325bd297634568528fb934698a68855121
[3]: https://itsfoss.com/best-linux-distributions/
[4]: https://github.com/systemd/systemd/releases/tag/v255
[5]: https://itsfoss.com/systemd-init/
[6]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
