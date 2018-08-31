Dropbox To End Sync Support For All Filesystems Except Ext4 on Linux
======
Dropbox is thinking of limiting the synchronization support to only a handful of file system types: NTFS for Windows, HFS+/APFS for macOS and Ext4 for Linux.

![Dropbox ends support for various file system types][1]

[Dropbox][2] is one of the most popular [cloud services for Linux][3]. A lot of folks happen to utilize the Dropbox sync client for Linux. However, recently, some of the users received a warning on their Dropbox Linux desktop client that said:

> “Move Dropbox location
>  Dropbox will stop syncing in November“

### Dropbox will only support a handful of file systems

A [Reddit thread][4] highlighted the announcement where one of the users inquired about it on [Dropbox forums][5], which was addressed by a community moderator with an unexpected news. Here’s what the[reply][6] was:

> **“Hi everyone, on Nov. 7, 2018, we’re ending support for Dropbox syncing to drives with certain uncommon file systems. The supported file systems are NTFS for Windows, HFS+ or APFS for Mac, and Ext4 for Linux.**
>
> [Official Dropbox Forum][6]

![Dropbox official confirmation over limitation on supported file systems][7] 
Dropbox official confirmation over limitation on supported file systems

The move is intended to provide a stable and consistent experience. Dropbox has also updated its [desktop requirements.][8]

### So, what should you do?

If you are using Dropbox on an unsupported filesystem to sync with, you should consider changing the location.

Only Ext4 file system will be supported for Linux. And that’s not entirely a worrying news because chances are that you are already using Ext4 file system.

On Ubuntu or other Ubuntu based distributions, open the Disks application and see the file system for the partition where you have installed your Linux system.

![Check file system type on Ubuntu][9]
Check file system type on Ubuntu

If you don’t have this Disk utility installed on your system, you can always [use the command line to find out file system type][10].

If you are using Ext4 file system and still getting the warning from Dropbox, check if you have an inactive computer/device linked for which you might be getting the notification. If yes, [unlink that system from your Dropbox account][11].

### Dropbox won’t support encrypted Ext4 as well?

Some users are also reporting that they received the warning while they have an encrypted Ext4 filesystem synced with. So, does this mean that the Dropbox client for Linux will only support unencrypted Ext4 filesystem? There is no official statement from Dropbox in this regard.

What filesystem are you using? Did you receive the warning as well? If you’re still not sure what to do after receiving the warning, you should head to the [official help center page][12] which mentions the solution.

Let us know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/dropbox-linux-ext4-only/

作者：[Ankush Das][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[1]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/dropbox-filesystem-support-featured.png
[2]: https://www.dropbox.com/
[3]: https://itsfoss.com/cloud-services-linux/
[4]: https://www.reddit.com/r/linux/comments/966xt0/linux_dropbox_client_will_stop_syncing_on_any/
[5]: https://www.dropboxforum.com/t5/Syncing-and-uploads/
[6]: https://www.dropboxforum.com/t5/Syncing-and-uploads/Linux-Dropbox-client-warn-me-that-it-ll-stop-syncing-in-Nov-why/m-p/290065/highlight/true#M42255
[7]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/dropbox-stopping-file-system-supports.jpeg
[8]: https://www.dropbox.com/help/desktop-web/system-requirements#desktop
[9]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/check-file-system-type-ubuntu.jpg
[10]: https://www.thegeekstuff.com/2011/04/identify-file-system-type/
[11]: https://www.dropbox.com/help/mobile/unlink-relink-computer-mobile
[12]: https://www.dropbox.com/help/desktop-web/cant-establish-secure-connection#location
