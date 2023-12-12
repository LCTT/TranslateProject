[#]: subject: "Celeste: A Multi-Cloud Open-Source GUI File Sync Client in Rust"
[#]: via: "https://news.itsfoss.com/celeste/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Celeste: A Multi-Cloud Open-Source GUI File Sync Client in Rust
======
A simple and elegant GUI sync client offering two-way sync.
When it comes to file synchronization with the cloud, we have options like [Insync][1], [FreeFileSync][2], and a couple of command-line tools like [rclone][3].

In either case, you may also use the sync client of the cloud storage provider, if they have one available for Linux or any other platform. However, it is not the best way to sync things with multiple cloud storage services.

Insync is a paid tool, while FreeFileSync or rclone can be an overwhelming option for new Linux users.

Meet, Celeste, a simple GUI sync client which supports multiple cloud providers.

📋

The app is under active development. It may not have plenty of features and contributors at the moment. You are welcome to explore and help the project.

### Rust-based Sync Client for Linux

![][4]

Celeste is an app written in Rust to ensure that you get a snappy experience. It utilizes rclone under-the-hood to reliably sync the data with the cloud.

Unlike some existing options, it does not give you many options. While some users may find it lacking, others could find it as the straightforward tool they always wanted.

Celeste supports two-way sync only, and there are no other modes of synchronization at the moment.

If you want a one-way sync (cloud to local, or local to cloud), this is not for you.

The working mechanism of the tool is easy. You just add a cloud provider from the list, or add any WebDAV server.

The default options include: **Google Drive, Dropbox, Proton Drive, pCloud, ownCloud,** and **Nextcloud.**

![][5]

You can customize the name of the server for the tool, and hit " **Log in** " to start the authorization process. Here's how it looked like for pCloud:

![][6]

Once you authorize the app to access the cloud files, it prompts you to set a sync between a local folder and the cloud.

![][7]

You can just type the **forward slash (/)** symbol if you do not have it already, and it should start listing the remote folders you have in a drop-down style.

💡

This will be a two-way sync. So, your files from the cloud will be downloaded to the remote folder (if any). Once synced, anything to delete from the cloud will not disappear from your local folder. And, anything you delete from your system will be removed from the cloud.

**The synchronization process for this happens at regular intervals.** I did not find a way to forcefully initiate or the stop the sync. It should help if an option like that is made available in the future version of this app.

![][8]

For most of the time, whenever there was a file change in local/remote, the sync made sure that you were able to access the latest changes as soon as possible.

For one time, the sync did not happen for a long time, so I had to restart the app to fix it.

Unfortunately, the app is not good at handling the error, if the token for the cloud provider expires, and you have to re-authorize and resync.

![][9]

It displays the error, and no option to refresh the token using the GUI. I would rather not try the command-line way because that defeats the purpose of a GUI tool.

So, you can choose to re-add the same sync server again, re-doing all the authorization and sync. That's the solution for now.

**Suggested Read** 📖

![][10]

### Wrapping Up

Celeste seems like a really helpful and simple GUI sync client.

Even though it lacks certain features, the user experience is good for what it already offers.

Considering it is a fairly new app, with more contributors and users trying it out, Celeste could evolve into something much more with its solid foundation.

_What do you think about Celeste? Share your thoughts in the comments down below._

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/celeste/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/insync-linux-review/
[2]: https://itsfoss.com/freefilesync/
[3]: https://itsfoss.com/use-onedrive-linux-rclone/
[4]: https://news.itsfoss.com/content/images/2023/12/celeste.png
[5]: https://news.itsfoss.com/content/images/2023/12/celeste-options.png
[6]: https://news.itsfoss.com/content/images/2023/12/celeste-pcloud.png
[7]: https://news.itsfoss.com/content/images/2023/12/celeste-sync-location.png
[8]: https://news.itsfoss.com/content/images/2023/12/celeste-gui-sync-check.png
[9]: https://news.itsfoss.com/content/images/2023/12/celeste-dropbox-error.png
[10]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
