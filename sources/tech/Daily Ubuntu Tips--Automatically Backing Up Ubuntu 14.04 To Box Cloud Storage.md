Translating-----------geekpi



Daily Ubuntu Tips – Automatically Backing Up Ubuntu 14.04 To Box Cloud Storage
================================================================================
Now that you’ve upgraded or installed Ubuntu 14.04, here’s another thing you might want to do to protect your new system: Back it up!

Ubuntu comes with a built-in backup tool called **Déjà Dup Backup Tool**. It is a tool that allows you to backup your system and save the backups either locally or to a remote server via different protocols.

There are many other ways to backup your Ubuntu computer and files. You can backup your important document automatically via [Dropbox client][1] and other cloud services. It was also possible to use UbuntuOne to backup your machine, but that’s no longer an option.

Another cloud storage to use to backup your machine is Box. Box is a great service, and it’s an alternative to DropBox. The one downside with Box cloud storage is that it doesn’t have a Linux client like Dropbox.

The one good thing it offers that Dropbox doesn’t is the ability to backup your data via WebDAV protocol.

This brief tutorial is going to show you how to use Box cloud service to automatically backup your Ubuntu machine.

Before you can start, you’ll want to make sure you already have an account with Box. If not, go and register.

When  you’re ready, open **Dash** and search for Backup. Or go to **Option (Gear) –> System Settings –> Backups**

![ubuntu1404-backup](http://www.liberiangeek.net/wp-content/uploads/2014/04/ubuntu1404backup.png)

Next, select the folders to backup (save), folders to ignore and where to store the backup. The location is what we want to set first. For the storage location, select **WebDAV**. Then enter the server address (as shown below), folder should be /dav, and your username for Box.

![ubuntu1404-backup-1](http://www.liberiangeek.net/wp-content/uploads/2014/04/ubuntu1404backup11.png)

Back to Overview, select **Back Up Now**.

![ubuntu1404-backup-2](http://www.liberiangeek.net/wp-content/uploads/2014/04/ubuntu1404backup2.png)

You’ll be prompted for your password. Enter it to continue.

![ubuntu1404-backup-3](http://www.liberiangeek.net/wp-content/uploads/2014/04/ubuntu1404backup3.png)

On the next screen, you can choose to encrypt the backup with password or not. I would recommend not to, since forgetting the password may be dangerous as well.

After the first backup, go and turn on the automatic setting. Then go to Scheduling and choose the best schedule for your backups.

To turn on auto backup, move the slider to the right at the top right-corner.

![ubuntu1404-backup-4](http://www.liberiangeek.net/wp-content/uploads/2014/04/ubuntu1404backup4.png)

That’s it! You can now go back to ‘Folder to save’ and begin adding more folders to backup.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/04/daily-ubuntu-tips-automatically-backing-up-ubuntu-14-04-to-box-cloud-storage/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.liberiangeek.net/2014/04/daily-ubuntu-tips-get-dropbox-installed-in-ubuntu-14-04-trusty-tahr/
