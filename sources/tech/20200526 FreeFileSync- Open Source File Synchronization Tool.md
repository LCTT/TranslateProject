[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (FreeFileSync: Open Source File Synchronization Tool)
[#]: via: (https://itsfoss.com/freefilesync/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

FreeFileSync: Open Source File Synchronization Tool
======

_**Brief: FreeFileSync is an open-source folder comparison and sync tool with which you can back up your data to an external disk, a cloud service like Google Drive or any other storage path.**_

### FreeFileSync: A Free &amp; Open-Source Tool To Sync Files

![][1]

[FreeFileSync][2] is an impressive open-source tool that can help you back up your data to a different location.

This different location can be an external USB disk, Google Drive or to any of your cloud storage locations using **SFTP or FTP** connections.

You might have read our tutorial on [how to use Google Drive on Linux][3] before. Unfortunately, there’s no proper FOSS solution to use Google Drive natively on Linux. There is [Insync][4] but it is a premium, non open source software.

FreeFileSync can be used to sync files with your Google Drive account. In fact, I’m using it to sync my files to Google Drive and to a separate hard drive.

### Features of FreeFileSync

![][5]

Even though the UI of FreeFileSync might look old school — it offers a ton of useful features for average users and advanced users as well.

I’ll highlight all the features I can here:

  * Cross-platform support (Windows, macOS &amp; Linux)
  * Compare folders before synchronizing
  * Supports Google Drive, [SFTP][6], and FTP connections
  * Offers the ability to sync your files on a different storage path (or an external storage device)
  * Multiple synchronization options available (Update files to the target from source or Mirror the files between target and source)
  * Two-way synchronization supported (changes will be synced if there’s any modification on the target folder or the source folder)
  * Version control available for advanced users
  * Real-Time Sync option available
  * Ability to schedule batch jobs
  * Get notified via email when sync completes (paid)
  * Portable edition (paid)
  * Parallel file copy (paid)



So, if you take a look at the features it offers, it’s not just any ordinary sync tool but offers so much more for free.

Also, to give you an idea, you can also tweak how to compare the files before syncing them. For instance, you can compare the file content / file time or simply compare the file size of both source and target folder.

![][7]

You also get numerous synchronization options to mirror or update your data. Here’s how it looks like:

![][8]

However, it does give you the option to opt for a donation key which unlocks some special features like the ability to notify you via email when the sync completes and so on.

Here’s what different between the free and paid version:

![][9]

So, most of the essential features is available for free. The premium features are mostly for advanced users and of course, if you want to support them (please do if you find it useful).

Also, do note that the donation edition can be used by a single user on up to 3 devices. So, that is definitely not bad!

### Installing FreeFileSync on Linux

You can simply head on to its [official download page][10] and grab the **tar.gz** file for Linux. If you like you can download the source as well.

![][11]

Next, you just need to extract the archive and run the executable file to get started (as shown in the image above)

[Download FreeFileSync][2]

### How To Get Started With FreeFileSync?

While I haven’t tried successfully creating an automatic sync job, it is pretty easy to use.

The [official documentation][12] should be more than enough to get what you want using the software.

But, just to give you a head start, here are a few things that you should keep in mind.

![][13]

As you can see in the screenshot above, you just have to select a source folder and the target folder to sync. You can choose a local folder or a cloud storage location.

Once you do that, you need to tweak the type of folder comparison you want to do (usually the file time &amp; size) for the synchronization process and on the right-side, you get to tweak the type of sync that you want to perform.

#### Types of synchronization in FreeFileSync

When you select **“Update” method for sync**, it simply copies your new data from the source folder to the target folder. So, even if you delete something from your source folder, it won’t get deleted on your target folder.

In case you want the target folder to have the same file copies of your same folder, you can choose the **“Mirror”** **synchronization method**. So, here, if you delete something from your source, it gets deleted from your target folder as well.

There’s also a **“Two-way” sync method** which detects changes on both source and target folder (instead of monitoring just the source folder). So, if you make any changes on the source/target folder, the modification will be synchronized.

For more advanced usage, I suggest you to refer the [documentation][12] available.

### Wrapping Up

Another [open source file synchronization tool is Syncthing][14] that you might want to look at.

FreeFileSync is a pretty underrated folder comparison and sync tool available for Linux users who utilize Google Drive, SFTP, or FTP connections along with separate storage locations for backup.

And, all of that — with cross-platform support for Windows, macOS, and Linux available for free.

Isn’t that exciting? Let me know your thoughts on FreeFileSync in the comments down below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/freefilesync/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/free-file-sync.jpg?ssl=1
[2]: https://freefilesync.org/
[3]: https://itsfoss.com/use-google-drive-linux/
[4]: https://itsfoss.com/recommends/insync/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/FreeFileSync.jpg?ssl=1
[6]: https://en.wikipedia.org/wiki/SSH_File_Transfer_Protocol
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/freefilesync-comparison.png?ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/freefilesync-synchronization.png?ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/free-file-sync-donation-edition.jpg?ssl=1
[10]: https://freefilesync.org/download.php
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/freefilesync-run.jpg?ssl=1
[12]: https://freefilesync.org/manual.php
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/freefilesync-tips.jpg?ssl=1
[14]: https://itsfoss.com/syncthing/
