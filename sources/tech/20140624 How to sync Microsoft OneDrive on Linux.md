How to sync Microsoft OneDrive on Linux
================================================================================
[OneDrive][1] (previously known as SkyDrive) is a popular cloud storage offering from Microsoft. Currently OneDrive offers 7GB free storage for every new signup. As you can imagine, OneDrive is well integrated with other Microsoft software products. Microsoft also offers a standalone OneDrive client which automatically backs up pictures and videos taken by a camera to OneDrive storage. But guess what. This client is available for all major PC/mobile platforms except Linux. "OneDrive on any device, any time"? Well, it is not there, yet.

Don't get disappointed. The open-source community already has already come up with a solution for you. [onedrive-d][2] written by a Boilermaker in Lafayette can get the job done. Running as a monitoring daemon, onedrive-d can automatic sync a local folder with OneDrive cloud storage.

In this tutorial, I will describe **how to sync Microsoft OneDrive on Linux by using onedrive-d**.

### Install onedrive-d on Linux ###

While onedrive-d was originally developed for Ubuntu/Debian, it now supports CentOS/Fedora/RHEL as well.

Installation is as easy as typing the following.

    $ git clone https://github.com/xybu92/onedrive-d.git
    $ cd onedrive-d
    $ ./inst install

### First-Time Configuration ###

After installation, you need to go through one-time configuration which involves granting onedrive-d read/write access to your OneDrive account.

First, create a local folder which will be used to sync against a remote OneDrive account.

    $ mkdir ~/onedrive

Then run the following command to start the first-time configuration.

    $ onedrive-d

It will pop up a onedrive-d's Settings window as shown below. In "Location" option, choose the local folder you created earlier. In "Authentication" option, you will see "You have not authenticated OneDrive-d yet" message. Now click on "Connect to OneDrive.com" box.

![](https://farm4.staticflickr.com/3885/14470579955_1fb92e7cfe.jpg)

It will pop up a new window asking you to sign in to OneDrive.com.

![](https://farm4.staticflickr.com/3903/14467221981_3d74140f61_z.jpg)

After logging in to OneDrive.com, you will be asked to grant access to onedrive-d. Choose "Yes".

![](https://farm3.staticflickr.com/2925/14283963819_86cf52e1fd_z.jpg)

Coming back to the Settings window, you will see that the previous status has changed to "You have connected to OneDrive.com". Click on "OK" to finish.

![](https://farm4.staticflickr.com/3896/14284004048_3e718d1e30.jpg)

### Sync a Local Folder with OneDrive ###

There are two ways to sync a local folder with your OneDrive storage by using onedrive-d.

One way is to **sync with OneDrive manually from the command line**. That is, whenever you want to sync a local folder against your OneDrive account, simply run:

    $ onedrive-d

`onedrive-d` will then scan the content of both a local folder and a OneDrive account, and make the two in sync. This means either uploading newly added files in a local folder, or downloading newly found files from a remote OneDrive account. If you remove any file from a local folder, the corresponding file will automatically be deleted from a OneDrive account after sync. The same thing will happen in the reverse direction as well.

Once sync is completed, you can kill the foreground-running onedrive-d process by pressing Ctrl+C.

![](https://farm6.staticflickr.com/5509/14283967750_b9ebf1b05d_z.jpg)

Another way is to run onedrive-d as an always-on daemon which launches automatically upon start. In that case, the background daemon will monitor both the local folder and OneDrive account, to keep them in sync. For that, simply add onedrive-d to the [auto-start program list][3] of your desktop.

When onedrive-d daemon is running in the background, you will see OneDrive icon in the desktop status bar as shown below. Whenever sync update is triggered, you will see a desktop notification.

![](https://farm4.staticflickr.com/3924/14290119448_3b1144db77.jpg)

A word of caution: According to the author, onedrive-d is still under active development. It is not meant for any kind of production environment. If you encounter any bug, feel free to file a [bug report][4]. Your contribution will be appreciated by the author.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/06/sync-microsoft-onedrive-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/go/onedrive
[2]:http://xybu.me/projects/onedrive-d/
[3]:http://xmodulo.com/2013/12/start-program-automatically-linux-desktop.html
[4]:https://github.com/xybu92/onedrive-d/issues?state=open