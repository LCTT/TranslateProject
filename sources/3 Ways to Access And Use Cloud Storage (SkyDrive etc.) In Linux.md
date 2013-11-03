翻译中 by Linux-pdz
3 Ways to Access And Use Cloud Storage (SkyDrive etc.) In Linux
================================================================================
![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2013/10/linux-cloud-840x420.jpg)

Personal cloud storage has become so useful as you never have to worry where your stuff is: it’s easily accessible, and it’s always up-to-date. On Linux you can access your personal cloud storage in multiple ways. This is great, because you can use whatever method works the best – even if you’re a terminal junkie!

### Use The Official Client ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2013/10/linux_accessing_cloud_ubuntu_one.jpg)

Getting the obvious out of the way, you can access your various personal cloud storage via their respective official applications. Currently, services such as [SpiderOak][1], [Dropbox][2], [Ubuntu One][3], which is an [unknown but worthy cloud storage contender][4], and [Copy][5], a [Dropbox alternative with more storage][6], offer official Linux clients which can facilitate communications between your computer and their servers, as well as set up special features such as selective synchronization.

For any regular ol’ desktop user, using the official clients is the best way to go as they offer the most functionality and the highest level of compatibility. Getting these to work is as simple as downloading the respective package for your distribution, installing it, and running it for the first time. The client should guide you through the easy setup process.

### Dropbox: Use A Command Line Script ###

If you’re a Dropbox user, you can also access your cloud storage via the terminal command line. This method is especially useful for power user terminal junkies, as they can their own scripts that can make use of the commands offered by the Dropbox script in order to perform automated tasks. To install it, you’ll need to run these commands (for Debian, Ubuntu, or their derivatives – other distributions should use equivalent commands instead):

    sudo apt-get install curl
    curl "https://raw.github.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o /tmp/dropbox_uploader.sh
    sudo install /tmp/dropbox_uploader.sh /usr/local/bin/dropbox_uploader
    dropbox_uploader

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2013/10/linux_accessing_cloud_terminal_dropbox.jpg)

When you run that last command, the script will notice that it’s your first time running the script. It’ll tell you to visit a certain Dropbox website to allow the script access to your account. It’ll also give you all the information you need to put into the website, which will allow Dropbox to return an App Key, App Secret, and Access Level that you give to the script. Now the script will have the correct authorization to your Dropbox account.

Once that is completed, you can use the script to perform various tasks such as upload, download, delete, move, copy, mkdir, list, share, info, and unlink. For full syntax explanations, you can check out this page.

### [Storage Made Easy][7] Brings SkyDrive To Linux ###

Microsoft, unsurprisingly, does not offer an official SkyDrive client for Linux. That doesn’t mean you can’t access that cloud service, however: the web version works fine.

But if you want to consolidate multiple personal clouds, or you would like easy (and sane) access to your SkyDrive account from Linux, you can also try out Storage Made Easy. This third party service consolidates its own storage offerings with up to three other personal cloud services. Even better: it offers an official client for Linux, and SkyDrive is one of the supported external cloud services!

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2013/10/linux_accessing_cloud_configure_skydrive.jpg)

In order to get Storage Made Simple to work, you’ll first need to create an account with them. Once you do, you have to go into the Dashboard and choose “Add a Cloud Provider”. Here you can choose the SkyDrive API and log in with those credentials. When you’ve added the credentials, you’ll need to hit the authorize button to create the authorization necessary. Then, download the client for Linux and install it.

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2013/10/linux_accessing_cloud_storagemadeeasy.jpg)

Upon first launch, it’ll ask you to log in, as well as where you’d like to mount the cloud to. After you’ve done all this, you should be able to navigate to the folder you’ve chosen and you should be able to access your Storage Made Easy space as well as your SkyDrive space! While this method is great for getting SkyDrive to work on Linux, it’s also great for all other services to simply combine them into a single location. The downside to this method is that you won’t be able to use the special features found in the official clients for each service.

Since it’s now possible to access SkyDrive from your Linux desktop, you may want to read my [comparison between SkyDrive and Google Drive][8] to figure out what works best for you.

### Conclusion ###

As you can see, there is more than one way to access your personal cloud storage. Of course, if you feel like your current setup is best for you, then there’s no reason to change. However, as an example, if you’ve always been a lover of the terminal and have wanted a way to interact with your Dropbox account using the terminal, you can do so! The beauty is that you can choose what works best for you. Also, keep your mind open – while I’ve highlighted certain tools and examples, there may be other tools for other cloud services in the future which can make you more flexible.

What’s your favorite way of accessing your personal cloud storage? What would be your most ideal solution? Let us know in the comments!

--------------------------------------------------------------------------------

via: http://www.makeuseof.com/tag/3-ways-to-access-and-use-cloud-storage-skydrive-etc-in-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://spideroak.com/opendownload/
[2]:https://www.dropbox.com/install?os=lnx
[3]:http://one.ubuntu.com/
[4]:http://www.makeuseof.com/tag/ubuntu-unknown-worthy-contender-cloud-storage/
[5]:http://www.copy.com/
[6]:http://www.makeuseof.com/tag/copy-a-dropbox-alternative-with-more-storage-mac-linux-windows-ios-android/
[7]:http://storagemadeeasy.com/
[8]:http://www.makeuseof.com/tag/skydrive-vs-google-drive-which-is-best-for-office-productivity/