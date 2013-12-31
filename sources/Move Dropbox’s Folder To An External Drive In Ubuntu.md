Move Dropbox’s Folder To An External Drive In Ubuntu
================================================================================
Few weeks ago we showed you how to [move Dropbox folder to an external drive using Microsoft Windows][1]. That tutorial was well received. The same can be done in Ubuntu for those who are using Ubuntu as their operating system.

This brief tutorial is going to show you how to easily move Dropbox folder to another location when using Ubuntu.

The reason I am writing these tutorials is couple of months ago I received a new HP EliteBook laptop with only 128GB SSD hard drive. I love the machine, it’s fast and performs well.

The downside with it is that the local storage is just too small to handle all my stuff. Besides my local applications and data, I also have online stuff in GB size, in my Dropbox account.

So, when I synchronized my Dropbox account and downloaded all the content in it to my HP EliteBook, it completely consumed the entire local disk.

The only solution was to move the Dropbox folder to an external drive so that it’s not using the local storage disk.

If you find yourself in similar situation, whether using Windows or Ubuntu, follow these posts to make room on your local disk. To get started with moving Dropbox folder in Ubuntu, first attach the external storage.

After attaching the disk, go to Unity Dash and search for Disks app. Open it and select the drive you wish to use and click **Tools –> Format**.

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/dropboxubuntumissingfolder3.png)

Next, format the drive with filesystem type **NTFS**

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/dropboxubuntumissingfolder4.png)

After formatting, select **Tools –> Mount Options**

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/dropboxubuntumissingfolder5.png)

Then specify the options as shown below… The Mount Point (location to mount Dropbox’s folder), filesystem type, and other options in the image below. Save it when you’re done.

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/dropboxubuntumissingfolder6.png)

After that, quit Dropbox service and delete the current DropBox folder at the default location (/home/username/Dropbox). When you start Dropbox service again, it will alert you of missing folder. Click the Relink button to assign the new location.

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/dropboxubuntumissingfolder.png)

When prompted to choose the setup type, select ‘**Advanced**’ and specify the location location to install Dropbox folder.

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/dropboxubuntumissingfolder1.png)

After the setup, restart and if Dropbox doesn’t prompt you of missing folder, then you’re ok.

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/dropboxubuntumissingfolder2.png)

That’s it! Enjoy!

If NTFS-3G isn’t installed, run this command to install it.

    sudo apt-get install ntfs-3g

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/12/move-dropboxs-folder-to-an-external-drive-in-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.liberiangeek.net/2013/11/daily-windows-tips-move-dropbox-folder-to-external-drive/