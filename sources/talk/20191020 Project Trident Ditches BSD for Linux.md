[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Project Trident Ditches BSD for Linux)
[#]: via: (https://itsfoss.com/bsd-project-trident-linux/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Project Trident Ditches BSD for Linux
======

Recently a BSD distribution announced that it was going to rebase on Linux. Yep, you heard me correctly. Project Trident is moving to Void Linux.

### What is Going on with Project Trident?

Recently, Project Trident [announced][1] that they had been working behind the scenes to move away from FreeBSD. This is quite a surprising move (and an unprecedented one).

According to a [later post][2], the move was motivated by long-standing issues with FreeBSD. These issues include “hardware compatibility, communications standards, or package availability continue to limit Project Trident users”. According to a conversation on [Telegram][3], FreeBSD has just updated its build of the Telegram client and it was nine release behind everyone else.

The lead dev of Project Trident, [Ken Moore][4], is also the main developer of the Lumina Desktop. The [Lumina Desktop][5] has been on hold for a while because the [Project Trident][6] team had to do so much work just to keep their packages updated. (Once they complete the transition to Void Linux, Ken will start working on Lumina again.)

After much searching and testing, the Project Trident team decided to use [Void Linux][7] as their new base.

According to the Project Trident team, the move to Void Linux will have the [following benefits][2]:

  * Better GPU support
  * Better sound card and streaming support
  * Better wireless support
  * Bluetooth support for the first time
  * Up to date versions of applications
  * Faster boot times
  * Hybrid EFI/Legacy installation and boot support



### Moving Plans

![][8]

Project Trident currently has two different versions available: Trident-stable and Trident-release. Trident-stable is based on FreeBSD 12 and will continue to get updates until January of 2020 with the ports repo being deleted in April of 2020. On the other hand, Trident-release (which is based on FreeBSD 13) will receive no further updates. That ports repo will be deleted in January of 2020.

The first Void Linux-based releases should be available in January of 2020. Ken said that they might issue an alpha iso or two to show off their progress, but they would be for testing purposes only.

Currently, Ken said that they are working to port all of their “in-house utilities over to work natively on Void Linux”. Void Linux does not support ZFS-on-root, which is a big part of the BSDs. However, Project Trident is planning to use their knowledge of ZFS to add support for it to Void.

There will not be a migration path from the FreeBSD-based version to the Void-based version. If you are currently using Project Trident, you will need to backup your `/home/*` directory before performing a clean install of the new version.

### Final Thoughts

I’m looking forward to trying out the new Void Linux-based Project Trident. I have installed and used Void Linux in the past. I have also tried out [TrueOS][9] (the precursor of Project Trident). However, I could never get Project Trident to work on my laptop.

When I was using Void Linux, I ran into two main issues: installing a desktop environment was a pain and the GUI package manager wasn’t that great. Project Trident plans to address these issues. Their original goal was to find an operating system that didn’t come with a desktop environment as default and their distro would add desktop support out-of-the-box. They won’t be able to port the AppCafe package manager to Void because it is a part of TrueOS’ SysAdm utility. They do plan to “develop a new graphical front-end to the XBPS package manager for Void Linux”.

Interestingly, Void Linux was created by a former NetBSD developer. I asked Ken if that fact influenced their decision. He said, “Actually none! I liked the way that Void Linux was set up and that most/all of the utilities were either MIT or BSD licensed, but I never guessed that it was created by a former NetBSD developer. That definitely helps to explain why Void Linux “feels” more comfortable to me since I have been using FreeBSD exclusively for the last 7 or more years.”

I’ve seen some people on the web speaking disparagingly of the move to Void Linux. They mentioned that the name changes (from PC-BSD to TrueOS to Project Trident) and the changes in architecture (from FreeBSD to TrueOS/FreeBSD to Void Linux) show that the developers don’t know what they are doing. On the other hand, I believe that Project Trident has finally found its niche where it will be able to grow and blossom. I will be watching the future of Project Trident with much anticipation. You will probably be reading a review of the new version when it is released.

Have you ever used Project Trident? What is your favorite BSD? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][10].

--------------------------------------------------------------------------------

via: https://itsfoss.com/bsd-project-trident-linux/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://project-trident.org/post/train_changes/
[2]: https://project-trident.org/post/os_migration/
[3]: https://t.me/ProjectTrident
[4]: https://github.com/beanpole135
[5]: https://lumina-desktop.org/
[6]: https://itsfoss.com/project-trident-interview/
[7]: https://voidlinux.org/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/bsd-linux.jpg?resize=800%2C450&ssl=1
[9]: https://itsfoss.com/trueos-bsd-review/
[10]: https://reddit.com/r/linuxusersgroup
