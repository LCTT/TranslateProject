[#]: subject: "Internxt is an Open Source Encrypted Cloud Service With Native Linux Client"
[#]: via: "https://itsfoss.com/internxt-cloud-service/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Internxt is an Open Source Encrypted Cloud Service With Native Linux Client
======

There are a [handful of cloud services available for Linux users][1] that provide native applications.

Dropbox is one of the oldest and most popular. Then there is Mega and pCloud. Google has shamelessly decided not to create a Google Drive client for Linux.

You may also [self-host Nextcloud][2] or Seafile, but that’s not everyone’s cup of tea.

Recently, I was approached by another cloud storage provider called [Internxt][3]. I asked if they provide a desktop application for Linux users, and the answer was yes. I also found that [they are open source][4] on both the server and client-side.

Delighted, I installed Internxt on my Ubuntu system, and here, I will share my experience.

### Internxt review: A healthy mix of privacy, security, and freedom

![][5]

Internxt is based out of Spain. Like several other EU-based companies, encryption and privacy are at its core.

It is a **[zero-knowledge encrypted][6] cloud storage service**. This means that no one except you can access your data. Your data is encrypted before it gets uploaded, and it is decrypted with your password. The server doesn’t have access to the keys that could be used to decrypt your data.

This also means that you must not lose your password with Internxt. _**If you lose the password, you lose your data completely.**_

There is more to Intenxt’s offering on privacy and security, though.

With a focus on **Web3**, it uses a **decentralized approach**. Files uploaded to Internxt Drive are fragmented, encrypted on the client-side, and distributed all over the globe. A single server never holds a complete file but just an encrypted data shard.

The icing on the cake is that **Internxt is open source**. You can check the source code for various components on their GitHub repository.

[Internxt on GitHub][4]

How cool is that! Let me share my experience with Internxt for the past couple of weeks.

### The Internxt Drive experience on Linux

Internxt’s primary offering is Drive, cloud storage for all kinds of files. They also have a product called Photos to securely store the photos and videos from your smartphone to the Internxt drive.

My focus here is on Internxt Drive. **It’s a new product, and hence several features will be added in the near future.**

#### Installation and setup

For Linux users, there are AppImage and DEB files. You can get the DEB package on their [official website][3] as well, and you can find various installer files on its GitHub repository.

[Download Internxt Drive for Linux][7]

Installing the DEB file is easy. After installation, when you start it for the first time, it shows a few screens to help you get acquainted with the Drive.

(_click to expand the images_)

![][8]

![][9]

![][10]

On the first run, it creates a new folder named Internxt in your home directory. Any files you put here get synchronized to the cloud, and you can access them on any device via a web browser. Similarly, any files you keep on the drive get added to the Internxt folder on your local disk.

Internxt adds an applet indicator to the top panel for quickly accessing the settings and preferences. It works with Ubuntu, but I am not sure how it would work with elementary OS and distros with vanilla GNOME because they prohibit applet indicators.

![][11]

That’s the default behavior. You can change the sync folder to any other folder of your choice. I went with the default options.

Now, here’s the thing. Sync doesn’t start immediately and automatically, so I had to hit the sync button manually. You can drag and drop files to the Internxt folder, but to sync it to the cloud, you have to go to the Internxt applet indicator, press the Show/Hide button, and then hit the Play button.

![Sync progress][12]

But this is by design, apparently. It was mentioned in the set-up screens. It probably does the sync automatically after a certain interval, but surely, it doesn’t happen immediately.

This was a surprise for me. But I was told by the Internxt team that _**real-time sync would be coming in the next version release along with selective sync.**_

Yes, Internxt misses the ability to choose which folders from the web drive you want to sync to your local drive for now. This should be added in the upcoming versions.

#### Sync and backup

Internxt provides two ways to store your files: sync and backup.

The backup gives you the ability to let you sync any folder on your computer to the cloud. Any changes you make in this folder(s) should be reflected on the cloud.

In this case, you don’t have to copy and paste the files in the Internxt folder to save them to the cloud.

The backup is not real-time at present. You can select the update frequency from its settings.

![Backup feature of Internxt][13]

I don’t think the backup feature supports versioning. It could be a good feature to add in the future version, though.

#### Updating Internxt

Thankfully, a new Internxt version was released soon after I installed it. I got the notification when I tried accessing the Internxt settings.

![Internxt notifies if there is a new version available][14]

The ‘Download update’ option had me confused a bit because it downloaded the DEB file for the latest version. Installing the DEB file required the removal of the existing Internxt install.

I wasn’t certain whether going with that will also remove the Internxt folder, but I proceeded and thankfully, everything remained in place.

#### Experience with Internxt Drive on the web

The web interface of Internxt is clean and simple, and it looks modern when compared to the web interface of pCloud.

![Internxt Drive on the web][15]

There are limitations to what you can do on the web interface. When writing this review, it’s not possible to read text files or Markdown files. I didn’t feel the need to check the doc files because that wouldn’t work for sure.

However, you can read PDF documents, which is surprising.

It displays the images if you click on them but not their thumbnails. This feature will be added in future versions.

And no, it cannot play videos at the moment.

You can share individual files with others but not folders, and I found it a bit weird.

![You can share files with others using Internxt Drive on web][16]

Overall, the web experience is satisfactory for file storage, but it needs some improvement on the file viewing part.

I didn’t test Internxt on mobile devices, though.

### Is Internxt worth using?

Internxt is pretty new and under heavy development, and new features are coming in future releases.

With the added features, it can be a promising alternative to popular options.

Internxt is open-source software, and you can find all the source code. You don’t have to worry about hosting it yourself, though. You can start using Internxt right away by signing up with them. With zero-knowledge encryption, your files should stay secure and private.

Internxt offers 2 GB of free cloud storage when you sign up. The free storage can be stretched up to 10 GB by ‘completing challenges’ like downloading its mobile app.

[Get up to 10 GB free cloud storage with Internxt][3]

However, you should opt for their paid plan if you can afford it. You get access to more cloud storage space, and the pricing for the individuals is as low as €12 per year for 20 GB.

![Internxt pricing for the lifetime plan \(which will be removed soon\)][17]

But if you go with my suggestion and if it is affordable for you, **you should go for their lifetime plan**. With that, you get 1 TB of cloud storage for a single payment of €99 (plus taxes).

They have a **30-day money-back guarantee, so you can get your entire amount back if you don’t like it**. What else can you ask for?

[Internxt Pricing][18]

Do note that **Internxt will stop selling its lifetime plan by the end of this month**. If you get it before the end of February, you’ll get the cloud storage for a single payment. If you are considering it, decide before the month ends.

The money-back-guarantee should have your back if you don’t like it.

[Internxt - Open Source, Encrypted Cloud Storage][3]

Encrypted by default, the EU-based Internxt is a promising cloud storage service provider. It is a good alternative to the likes of Mega and pCloud.

![Internxt - Open Source, Encrypted Cloud Storage][19]

![Internxt - Open Source, Encrypted Cloud Storage][19]

[Check it out][3]

We earn a commission if you make a purchase, at no additional cost to you.

**Internxt is also working to include Photos (for photo backup), Mail (for encrypted emails) and Send (for large file transfer) in its offering.** All this makes Internxt a value for money investment.

Internxt is one of the rare open-source projects that ticks so many boxes. It is an open-source yet easy-to-use commercial product. Like every other offering, it’s not perfect and has room for improvement.

Currently, I use [pCloud][20] for dumping all kinds of data because I have their 2 TB lifetime plan. Now, I will use the 2 TB of Internxt storage for storing photos and videos from my phone. I have a nine months old kid, and I am always running out of space because I keep on taking too many photos and videos! :)

_If you decide to use Internxt or have already been using it, share your experience in the comment section. Do you find it worth recommending to others?_

--------------------------------------------------------------------------------

via: https://itsfoss.com/internxt-cloud-service/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/cloud-services-linux/
[2]: https://linuxhandbook.com/install-nextcloud-docker/
[3]: https://itsfoss.com/go/internxt/
[4]: https://github.com/internxt
[5]: https://itsfoss.com/wp-content/uploads/2022/02/Internxt-cloud-service.png
[6]: https://help.internxt.com/en/articles/5387164-what-is-zero-knowledge-encryption
[7]: https://github.com/internxt/drive-desktop/releases/
[8]: https://itsfoss.com/wp-content/uploads/2022/02/internxt-drive-setup-screens.png
[9]: https://itsfoss.com/wp-content/uploads/2022/02/internxt-drive-setup-screens-1.png
[10]: https://itsfoss.com/wp-content/uploads/2022/02/internxt-drive-setup-screens-2.png
[11]: https://itsfoss.com/wp-content/uploads/2022/02/internxt-default-setup.png
[12]: https://itsfoss.com/wp-content/uploads/2022/02/sync-progress-internxt.png
[13]: https://itsfoss.com/wp-content/uploads/2022/02/backup-feature-internxt-drive.png
[14]: https://itsfoss.com/wp-content/uploads/2022/02/internxt-update.png
[15]: https://itsfoss.com/wp-content/uploads/2022/02/Internxt-web-drive-800x467.png
[16]: https://itsfoss.com/wp-content/uploads/2022/02/sharing-files-with-internxt-800x449.png
[17]: https://itsfoss.com/wp-content/uploads/2022/02/internxt-pricing-800x454.png
[18]: https://itsfoss.com/go/internxt-pricing/
[19]: https://itsfoss.com/wp-content/uploads/2022/02/Internxt_400x400.jpg
[20]: https://itsfoss.com/recommends/pcloud/
