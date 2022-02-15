[#]: subject: "KDE’s Dolphin File Manager Finally Brings Root File Operations. Here’s How to Use"
[#]: via: "https://www.debugpoint.com/2022/02/dolphin-root-access/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

KDE’s Dolphin File Manager Finally Brings Root File Operations. Here’s How to Use
======
AFTER FIVE YEARS OF MAKING, ROOT FILE OPERATION FINALLY LANDS IN THE
DOLPHIN FILE MANAGER OF KDE PLASMA DESKTOP. HERE’S HOW TO USE DOLPHIN
WITH ROOT ACCESS.
The reason was apparent. Unless you know, the root file operation was the only critical feature not available in the famous Dolphin file manager. The developers didn’t want new users to play around in the file system with root privileges. That is not good for a stable system. 

You get a prompt below if you try to open Dolphin today with superuser. It is permanently disabled in the Dolphin code for uid=0.

```

    Executing Dolphin with sudo is not possible due to unfixable security vulnerabilities.

```

![Dolphin root access – how it behaves today \(before polkit+KIO\)][1]

### A Little History on Dolphin with superuser privileges

You may need to access specific removable drives, files, and network shares via file manager at any given workflow, which requires admin privileges. But without the Dolphin built-in support, it is difficult today unless you are experienced enough to try out specific hacks (like below), which have been popular until now. 

The following famous command executes polkit to give necessary privileges to Dolphin.

```

    pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY KDE_SESSION_VERSION=5 KDE_FULL_SESSION=true dolphin

```

The users request the feature [many times][2] via bug reports in [forums][3]. And several controversial extensions are created, such as Open Dolphin as Root (<https://store.kde.org/p/1384645/>) or Root action service menu (<https://store.kde.org/p/998469/>). One of them was even reported by users for review. They are very unstable and risky to use because you don’t know what they will do to your system.

 Do not download or use the above two extensions. You may end up with an unstable system.

### How to use Dolphin as Root

Now you can forget all these hacks and get to run Dolphin as root out-of-the-box with KDE Framework 5.91. The long-pending feature of implementing Polkit support in the KDE Input/Output library (KIO) is finally implemented and merged. 

And now, Dolphin and other KDE applications can use KIO to give necessary privileges to perform several non-admin actions. 

[][4]

SEE ALSO:   KDE Plasma 5.20 Bringing this Stunning Taskbar Feature in Next Release

#### Steps

As of writing this post, this feature is currently in only [Neon Unstable Edition][5] and [openSUSE Krypton][6] due to its nature and [require more testing][7] before being pushed as stable.

If you are using [KDE Plasma][8] using a privileged account already, you are already running Dolphin as admin. But if you are using an account with limited access to the file system, open or use Dolphin as you used to do.

Once you try to modify or access any resources or files via Dolphin that you do not have access to, Dolphin will prompt you for an administrator password via KIO.

To try the code, I tried to modify a file (not admin user) in another user’s (admin) home directory. See the below image. The file opened file. When I am trying to save by the logged-on user (not admin), it prompts for the password which is nothing but the polkit daemon working via KIO and Dolphin.

![Dolphin root access after KIO with Polkit implementation][9]

Once you provide the password, you will continue to perform the actions.

I believe this is a very straightforward approach instead of letting users open Dolphin via root separately. Because this limits users to a specific action via admin privileges. It also minimizes the risk of accidentally changing the file system if the entire Dolphin executable is open as root. And opening Dolphin as sudo would give you the same message as earlier with additional instructions below.

![Dolphin gives a message while trying to run as a root user][10]

So, that’s about it.

### Closing Notes

Dolphin is undoubtedly the famous and best file manager, but this was the missing piece until today. Resolving the “Open Dolphin as the root” problem is significant because it impacts many users system administrators. Thanks to the entire KDE team to pull this through.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][11], [Twitter][12], [YouTube][13], and [Facebook][14] and never miss an update!

##### Also Read

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/02/dolphin-root-access/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/wp-content/uploads/2022/02/Dolphin-root-access-how-it-behaves-today-before-polkitKIO.jpg
[2]: https://forum.kde.org/viewtopic.php?f=224&t=160993
[3]: https://askubuntu.com/questions/990611/how-to-run-dolphin-as-root
[4]: https://www.debugpoint.com/2020/06/kde-plasma-5-20-new-taskbar/
[5]: https://neon.kde.org/download
[6]: http://download.opensuse.org/repositories/KDE:/Medias/images/iso/
[7]: https://invent.kde.org/frameworks/kio/-/merge_requests/143
[8]: https://www.debugpoint.com/tag/kde-plasma
[9]: https://www.debugpoint.com/wp-content/uploads/2022/02/Dolphin-root-access-after-KIO-with-Polkit-implementation.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/02/Dolphin-gives-a-message-while-trying-to-run-as-root-user.jpg
[11]: https://t.me/debugpoint
[12]: https://twitter.com/DebugPoint
[13]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[14]: https://facebook.com/DebugPoint
