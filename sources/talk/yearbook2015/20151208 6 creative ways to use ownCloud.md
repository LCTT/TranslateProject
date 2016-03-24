6 creative ways to use ownCloud
================================================================================
![Yearbook cover 2015](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/osdc-open-source-yearbook-lead1-inc0335020sw-201511-01.png)

Image by : Opensource.com

[ownCloud][1] is a self-hosted open source file sync and share server. Like "big boys" Dropbox, Google Drive, Box, and others, ownCloud lets you access your files, calendar, contacts, and other data. You can synchronize everything (or part of it) between your devices and share files with others. But ownCloud can do much more than its proprietary, [hosted-on-somebody-else's-computer competitors][2].

Let's look at six creative things ownCloud can do. Some of these are possible because ownCloud is open source, whereas others are just unique features it offers.

### 1. A scalable ownCloud Pi cluster ###

Because ownCloud is open source, you can choose between self-hosting on your own server or renting space from a provider you trust—no need to put your files at a big company that stores it who knows where. [Find some ownCloud providers here][3] or grab packages or a virtual machine for [your own server here][4].

![](https://opensource.com/sites/default/files/images/life-uploads/banana-pi-owncloud-cluster.jpg)

Photo by Jörn Friedrich Dreyer. [CC BY-SA 4.0.][5]

The most creative things we've seen are a [Banana Pi cluster][6] and a [Raspberry Pi cluster][7]. Although ownCloud's scalability is often used to deploy to hundreds of thousands of users, some folks out there take it in a different direction, bringing multiple tiny systems together to make a super-fast ownCloud. Kudos!

### 2. Keep your passwords synced ###

To make ownCloud easier to extend, we have made it extremely modular and have an [ownCloud app store][8]. There you can find things like music and video players, calendars, contacts, productivity apps, games, a sketching app, and much more.

Picking only one app from the almost 200 available is hard, but managing passwords is certainly a unique feature. There are no less than three apps providing this functionality: [Passwords][9], [Secure Container][10], and [Passman][11].

![](https://opensource.com/sites/default/files/images/life-uploads/password.png)

### 3. Store your files where you want ###

External storage allows you to hook your existing data storage into ownCloud, letting you to access files stored on FTP, WebDAV, Amazon S3, and even Dropbox and Google Drive through one interface.

注：youtube 视频
<iframe width="520" height="315" frameborder="0" allowfullscreen="" src="https://www.youtube.com/embed/uezzFDRnoPY"></iframe>

The "big boys" like to create their own little walled gardens—Box user can only collaborate with other Box users; and if you want to share your files from Google Drive, your mate needs a Google account or they can't do much. With ownCloud's external storage, you can break these barriers.

A very creative solution is adding Google Drive and Dropbox as external storage. You can work with files on both seamlessly and share them with others through a simple link—no account needed to work with you!

### 4. Get files uploaded ###

Because ownCloud is open source, people contribute interesting features without being limited by corporate requirements. Our contributors have always cared about security and privacy, so ownCloud introduced features such as protecting a public link with a password and setting an expire date [years before anybody else did][12].

Today, ownCloud has the ability to configure a shared link as read-write, which means visitors can seamlessly edit the files you share with them (protected with a password or not) or upload new files to your server without being forced to sign up to another web service that wants their private data.

注：youtube 视频
<iframe width="520" height="315" frameborder="0" allowfullscreen="" src="https://www.youtube.com/embed/3GSppxEhmZY"></iframe>

This is great for when people want to share a large file with you. Rather than having to upload it to a third-party site, send you a link, and make you go there and download it (often requiring a login), they can just upload it to a shared folder you provide, and you can get to work right away.

### 5. Get free secure storage ###

We already talked about how many of our contributors care about security and privacy. That's why ownCloud has an app that can encrypt and decrypt stored data.

Using ownCloud to store your files on Dropbox or Google Drive defeats the whole idea of retaking control of your data and keeping it private. The Encryption app changes that. By encrypting data before sending it to these providers and decrypting it upon retrieval, your data is safe as kittens.

### 6. Share your files and stay in control ###

As an open source project, ownCloud has no stake in building walled gardens. Enter Federated Cloud Sharing: a protocol [developed and published by ownCloud][13] that enables different file sync and share servers to talk to one another and exchange files securely. Federated Cloud Sharing has an interesting history. [Twenty-two German universities][14] decided to build a huge cloud for their 500,000 students. But as each university wanted to stay in control of the data of their own students, a creative solution was needed: Federated Cloud Sharing. The solution now connects all these universities so the students can seamlessly work together. At the same time, the system administrators at each university stay in control of the files their students have created and can apply policies, such as storage restrictions, or limitations on what, with whom, and how files can be shared.

注：youtube 视频
<iframe width="520" height="315" frameborder="0" allowfullscreen="" src="https://www.youtube.com/embed/9-JEmlH2DEg"></iframe>

And this awesome technology isn't limited to German universities: Every ownCloud user can find their [Federated Cloud ID][15] in their user settings and share it with others.

So there you have it. Six ways ownCloud enables people to do special and unique things, all made possible because it is open source and designed to help you liberate your data.


--------------------------------------------------------------------------------

via: https://opensource.com/life/15/12/6-creative-ways-use-owncloud

作者：[Jos Poortvliet][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jospoortvliet
[1]:https://owncloud.com/
[2]:https://blogs.fsfe.org/mk/new-stickers-and-leaflets-no-cloud-and-e-mail-self-defense/
[3]:https://owncloud.org/providers
[4]:https://owncloud.org/install/#instructions-server
[5]:https://creativecommons.org/licenses/by-sa/4.0/
[6]:http://www.owncluster.de/
[7]:https://christopherjcoleman.wordpress.com/2013/01/05/host-your-owncloud-on-a-raspberry-pi-cluster/
[8]:https://apps.owncloud.com/
[9]:https://apps.owncloud.com/content/show.php/Passwords?content=170480
[10]:https://apps.owncloud.com/content/show.php/Secure+Container?content=167268
[11]:https://apps.owncloud.com/content/show.php/Passman?content=166285
[12]:https://owncloud.com/owncloud45-community/
[13]:http://karlitschek.de/2015/08/announcing-the-draft-federated-cloud-sharing-api/
[14]:https://owncloud.com/customer/sciebo/
[15]:https://owncloud.org/federation/