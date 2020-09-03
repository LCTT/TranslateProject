[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Rclone Browser Enables You to Sync Data With Cloud Services in Linux Graphically)
[#]: via: (https://itsfoss.com/rclone-browser/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Rclone Browser Enables You to Sync Data With Cloud Services in Linux Graphically
======

_**Brief: Rclone Browser is an effective GUI program that makes it easy to manage and sync data on cloud storage using Rclone. Here, we take a look at what it offers and how it works.**_

If you want to use One Drive or [Google Drive on Linux][1] natively and effortlessly, you can opt for a premium GUI tool like [Insync][2] ([affiliate][3] link).

If you can put some effort in the terminal, you can use [Rclone][4] to sync with many [cloud storage services on Linux][5]. We have a detailed [guide on using Rclone for syncing with OneDrive in Linux][6].

[Rclone][4] is a pretty popular and useful command-line tool. A lot of power users will need to use Rclone for its features.

However, not everyone is comfortable using it from the terminal even if it’s useful enough.

So, in this article, I’ll talk about an impressive GUI “Rclone Browser” that makes it easy to manage and sync your data on cloud storage using Rclone.

It is also worth noting that Rclone does offer an experimental web-based GUI — but we are going to focus on [Rclone Browser][7] here.

![][8]

### Rclone Browser: An Open-Source GUI for Rclone

Rclone Browser is a GUI that lets you browse, modify, upload/download, list files, and do a lot more stuff that you’d want to do when you want to make the most out of managing a remote storage location.

It offers a simple user interface and works just fine (as per my quick test). Let’s take a detailed look at the features it offers and how to get started using it.

### Features of Rclone Browser

![][9]

It offers a lot of options and control to manage remote storage locations. You may find it feature-rich or overwhelming depending on your use-case. Here they are:

  * Browse and modify rclone remote storage locations
  * Encrypted cloud storage supported
  * Custom location and encryption for configuration supported
  * No extra configuration required. It will use the same rclone configuration files (if you have any).
  * Simultaneous navigation of multiple locations in separate tabs
  * List files hierarchically (by file name, size, and modified date)
  * Rclone commands are executed asynchronously without the GUI freezing
  * You get the ability to upload, download, create new folders, rename, delete files and folders
  * Drag and drop support for dragging files while uploading
  * Streaming media files in player like VLC
  * Mount and unmount folders/cloud drives
  * Ability to calculate size of folder, export list of files, and copy rclone commands to clipboard
  * Supports portable mode
  * Supports shared drivers (if you’re using Google Drive)
  * Gives you the ability to have public link sharing option for remote storage services that offers it
  * Ability to create tasks that you can easily save to run it again or edit it later
  * Dark mode
  * Cross-platform support (Windows, macOS, and Linux)



### Installing Rclone Browser on Linux

_You need to have rclone installed on your Linux distribution before you use Rclone Browser. Follow the [official installation instructions][10] to do that._

You will find an AppImage file available for Rclone Browser from the [releases section][11] of its [GitHub page][7]. So, you shouldn’t have an issue running it on any Linux distribution.

In case you didn’t know about AppImage, I’ll recommend going through our guide to [use AppImage on Linux][12].

You can also choose to build it as well. The instructions to do that is in the GitHub page.

[Rclone Browser][7]

### Getting Started With Rclone Browser

Here, I’ll just share a few things that you should know to get started using Rclone Browser.

![][13]

If you had any existing remote locations using rclone in the terminal, it will automatically show up in the GUI. You can also hit the “**Refresh**” button to get the latest additions.

As shown in the screenshot above, when you click the “**Config**” button it launches the terminal that lets you easily add a new remote or configure it as you want. Don’t worry when the terminal pops up, Rclone browser executes the commands to do all the necessary tasks, you just have to set up or edit a few things when needed. You don’t need to execute any Rclone commands.

If you have some existing remotes, you can simply open them using the “**Open**” button and have the cloud storage accessible in a different tab as shown below.

![][14]

You can easily mount the cloud drive, upload/download files, get the details, share a public link for a folder (if supported), and directly stream media files as well.

If you want to copy, move, or sync data with a remote storage location, you can simply create a task to do it. Just to make sure that you have the right settings, you can perform a dry run or go ahead with running the task.

You can find all the running tasks under the “**Jobs**” section and you can cancel/stop them if needed.

![][15]

In addition to all the basic functionalities mentioned above, you can just head to **File-&gt;Preferences** to change the rclone location, mount option, download folder, bandwidth settings, and proxy as well.

![][16]

To learn more about its usage and features, you might want to check out the [GitHub page][7] for all the technical information.

### Wrapping Up

Rclone Browser should definitely come in handy for every Linux user looking to use Rclone for its powerful features.

Have you tried it yet? Do you prefer using the GUI or the terminal for using rclone? Let me know your thoughts in the comments below!

--------------------------------------------------------------------------------

via: https://itsfoss.com/rclone-browser/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/use-google-drive-linux/
[2]: https://itsfoss.com/recommends/insync/
[3]: https://itsfoss.com/affiliate-policy/
[4]: https://rclone.org/
[5]: https://itsfoss.com/cloud-services-linux/
[6]: https://itsfoss.com/use-onedrive-linux-rclone/
[7]: https://github.com/kapitainsky/RcloneBrowser
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/Cloud-sync.gif?resize=800%2C450&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/rclone-browser-screenshot.jpg?resize=800%2C618&ssl=1
[10]: https://rclone.org/install/
[11]: https://github.com/kapitainsky/RcloneBrowser/releases/tag/1.8.0
[12]: https://itsfoss.com/use-appimage-linux/
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/rclone-browser-howto.png?resize=800%2C412&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/rclone-browser-drive.png?resize=800%2C505&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/rclone-browser-task.jpg?resize=800%2C493&ssl=1
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/rclone-browser-preferences.jpg?resize=800%2C590&ssl=1
