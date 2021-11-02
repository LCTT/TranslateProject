[#]: subject: "Nextcloud Backup App Available for Beta Testing"
[#]: via: "https://news.itsfoss.com/nextcloud-backup-app-beta/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Nextcloud Backup App Available for Beta Testing
======

Last year, we mentioned [Nextcloud as the swiss army knife of remote working tools][1], and rightly so.

Nextcloud offers a lot of tools to help you build the ultimate collaboration tool while taking control of your data. Of course, if you are looking for convenience without the need for self-hosting, Nextcloud may not be an immediate option for you.

However, if the lack of an easy-to-use backup tool was a deal-breaker for you, it might be a good idea to think it over.

Nextcloud announced a backup app that will let you easily create, encrypt, and automate backups for you.

### Nextcloud Peer-to-Peer Backup App Beta

![][2]

If you are an enterprise/team utilizing Nextcloud, you probably already have a server-level backup in place.

You can choose to try the app or skip it altogether. The backup app is geared towards home or private users who find the manual backup process time-consuming and unintuitive.

After all, not everyone should be expected to have the necessary technical expertise just for the sake of backups.

The lead developer for the backup app mentioned the following in the [press release][3]:

> Enterprises use powerful but complex backup solutions to provide them with the data safety and security they need for Nextcloud. For private users, such solutions are often overkill. Our new backup app provides an incredibly easy way to ensure that even in the worst case like total loss of a server, data is secure on the instance of a friend or family member, while of course preserving privacy through encryption.

So, with a peer-to-peer backup app, Nextcloud aims to offer a reliable backup solution to private users who find the manual backup process cumbersome. It should also come in handy if you do not want to rely on 3rd party cloud services to back up Nextcloud instance and its data.

### Features of Nextcloud Backup App

![][2]

With the backup app, you get a variety of abilities. Here are the key highlights:

  * Store backups on another Nextcloud server.
  * Store backups on external storage, like FTP, SMB, WebDAV or any other Nextcloud-supported protocol. You can also store them on a local drive, like an USB drive attached to your server!
  * Ability to perform manual and/or automatic, scheduled backups in specific time slots
  * Store the entire Nextcloud installation, including configuration, apps and their data.
  * Perform incremental or full backups in the background (short maintenance mode needed)
  * Ability to enable compression and encryption for backups (optional)
  * Export encryption key and other configuration information to a file or clipboard for safe-keeping
  * Give notifications in the Activities app about backup activity
  * Easily exclude folders from backup if you add a .nobackup file in the folder.
  * Can be accessed using the command line to search for and restore single files, initiate full restore, or list and create backups



It is worth noting that any non-local data in your Nextcloud instance, including external storage, will not be included in the backup as of now.

Considering that complete documentation is not available, some of the features may need some clarity before the final release for users.

For example, the GitHub page mentions:

  * By default, **your data are encrypted** meaning you **will need to export** the configuration of the App **as soon as possible** or you will **not** be able to **decrypt your backups**



Of course, you can explore more about it if you are willing to test it. However, in general, it isn’t clear if the configuration will have a timer or if you can export it anytime before generating another backup in Nextcloud.

It should be a priority to clarify this, considering the data from encrypted backups cannot be recovered if you cannot decrypt them.

In addition to that, Nextcloud recommends you to have enough free space (ideally double of your current storage space occupied) to accommodate the backup generated comfortably.

### How Does It Work?

![][2]

As of now, the backup app is only available for Nextcloud 23 beta. If you want to go ahead with the testing, feel free to explore its [GitHub page for detailed instructions][4].

The app should be available in the app store for Nextcloud 23 in the next few hours.

So, unless you want to test it separately, you should wait for the final release later this year, along with Nextcloud 23 release.

Considering you have a supported Nextcloud instance and have it enabled. You need to connect it to another Nextcloud instance (with a user account) or set up an FTP connection, WebDAV, or any supported protocols to store the backups in external storage.

For more information, you can read the [official blog post][5].

### Wrapping Up

The Nextcloud backup app should enable many users to easily create an encrypted backup of their instance along with their essential data.

Not just limited to backups, but it also gives you the ability to restore easily. So, it should come in pretty handy overall.

What do you think about Nextcloud’s new backup tool? Have you tried it yet? Or, will you be waiting for its final release? Feel free to share your thoughts in the comments below.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/nextcloud-backup-app-beta/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/nextcloud/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: https://nextcloud.com/press/pr20211101/
[4]: https://github.com/nextcloud/backup
[5]: https://nextcloud.com/blog/beta-of-peer-to-peer-nextcloud-backup-app-now-available-for-testing/
