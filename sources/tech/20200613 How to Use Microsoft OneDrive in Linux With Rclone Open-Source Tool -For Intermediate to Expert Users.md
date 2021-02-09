[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Use Microsoft OneDrive in Linux With Rclone Open-Source Tool [For Intermediate to Expert Users])
[#]: via: (https://itsfoss.com/use-onedrive-linux-rclone/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

How to Use Microsoft OneDrive in Linux With Rclone Open-Source Tool [For Intermediate to Expert Users]
======

_**Brief: A step-by-step tutorial showing how to use the rclone command line tool to synchronize OneDrive in Linux.**_

There are [several cloud storage services available for Linux][1]. There is [Dropbox][2] that gives 2 GB of free space. You can also use [Mega][3] where you can get 15 GB of free storage.

Microsoft’s own Cloud storage service, OneDrive gives 5 GB of free storage to any Microsoft account holder. The one major problem is that unlike Dropbox and Mega, Microsoft does not provide a desktop client for Linux.

This means that you’ll have to resort to using web browser for accessing your files in OneDrive which is not very convinient.

There is a hassle-free, GUI application [Insync][4] that lets you [use OneDrive on Linux easily][5]. But it’s a premium software and not everyone would like that.

If you are not afraid of the Linux terminal, let me show you a command line tool rclone that you can use for synchronizing Microsoft OneDrive in Linux.

![][6]

### What is rclone?

Rclone is an open source command line tool that enables you to synchronize a local Linux directory with various cloud storage services.

With rclone, you can backup files to cloud storage, restore files from cloud storage, mirror cloud data, migrate data between cloud services, use multiple cloud storage as disk.

You can use it with Google Drive, OneDrive, Nextcloud, Amazon S3 and over [40 such cloud services][7].

Rclone is an extensive command line tool and using it could be confusing with so many options. This is why I wrote this tutorial to show you how to use rclone with Microsoft OneDrive.

### Sync Microsoft OneDrive in Linux with rclone

Using Rclone in Linux is not that complicated but requires some patience and familiarity with the Linux terminal. You need to tweak the configuration a little to make it work. Let’s see how to do that.

#### Step 1: Install Rclone

I am [using Ubuntu 20.04][8] in this tutorial but you should be able to follow this tutorial in pretty much any Linux distribution. Just the rclone installation instruction could be different but the rest of steps remains the same.

In Debian/Ubuntu based distributions use:

```
sudo apt install rclone
```

For Arch-based distributions, use:

```
sudo pacman -S rclone
```

For other distributions, please use your distribution’s package manager.

#### Step 2: Adding new remote

Once you have installed rclone successfully, you need to configure rclone. Enter the following command in the terminal:

```
rclone config
```

If it’s your first time using rclone, you have to add a new remote to rclone. Select ‘**n**‘ to add new remote.

![Configuring Rclone][9]

Now you have to enter the name of remote. You can enter any name here that matches the cloud service so that it is easy to identify. I am using ‘**onedrive**‘.

![Configuring Rclone ][10]

#### Step 3: Select cloud service you want to sync with rclone

After entering name and hitting enter, you will see a list of cloud services like Google cloud storage, Box, One Drive and others.

You have to enter the number of the service you want to use. In this case, it’s ‘One Drive’. Make sure you enter the correct number.

![Selecting Cloud Service][11]

As you don’t need to enter client ID or secret ID hit **Enter** twice.

Next enter **‘N’** for selecting **no** for advanced configuration. Of course, if you want to configure something very specific, you can go ahead with **Y**.

![Configuring OneDrive][12]

When you’re asked for **‘Use auto config’**, press **Y**.

#### Step 4: Login to OneDrive account

When you enter ‘y’ and hit enter, your default browser will open and here you have to log into your Microsoft account. And if it asks for permission click on **‘yes’**.

![One Drive Logging In][13]

#### Step 5: Enter account type

Now you have to select account type. For most of the users it will be the first one, **‘One drive Personal or business’**. I believe it is personal so go with 1.

![][14]

After that, you will get a list of ‘Drives’ associated with your account. So, for the most part, you need to select ‘0’ to select your drive and enter ‘**Y**‘ for yes in next step.

![][15]

It will ask for one last time if this configuration is okay? Hit **‘Y’** if it is.

![][16]

And then enter **‘q’** to exit the Rclone configuration menu.

![][17]

#### Step 5: Mounting OneDrive int file manager

Create folder in your home directory where you will mount OneDrive. I will name the folder “OneDrive”. You can name it whatever you want, but please make sure you change the name to yours in the commands.

[Create a new folder with mkdir command][18] in your home directory or wherever you want:

```
mkdir ~/OneDrive
```

Now you have to use the following command:

```
rclone --vfs-cache-mode writes mount "one drive":  ~/OneDrive
```

In above command “one drive” is the name of the “remote”, so you should use the correct name there if yours is different. You can check the name of the “remote” in step 2 of this tutorial.

![Mounting One Drive][19]

This command will mount one drive in given location and will continue to run in terminal. When you stop the process with,`ctrl + c` the one drive will be unmounted.

To mount one drive on startup, follow the next step below.

#### Step 6: Mount One Drive on startup

Every Linux distribution gives some way to manage startup application. I am using [Ubuntu’s Startup Application Preferences tool][20] here.

Open “**Startup Applications**“. And click on “**Add**“. Now, in the command field, enter the following:

```
sh -c "rclone --vfs-cache-mode writes mount onedrive: ~/OneDrive"
```

![Mounting OneDrive On Startup][21]

That’s it. Now, you can easily use OneDrive on Linux without any hiccups.

As you can see, using OneDrive in Linux with rclone takes some effort. If you want an easy way out, get a GUI tool like [Insync][4]. and use OneDrive natively in Linux.

I hope you find this tutorial helpful. If you have any questions or suggestion, we’ll be happy to help you out.

### Sumeet

Computer engineer, FOSS lover, lower level computing enthusiast. Believe in helping others and spreading knowledge. When I get off from computer (it rarely happens) I do painting, reading and watching movies/series. Love the work of Sir Arthur Conan Doyle, J. R. R. Tolkien and J. K. Rowling. BTW, I use Arch.

--------------------------------------------------------------------------------

via: https://itsfoss.com/use-onedrive-linux-rclone/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/cloud-services-linux/
[2]: https://www.dropbox.com/
[3]: https://itsfoss.com/recommends/mega/
[4]: https://itsfoss.com/recommends/insync/
[5]: https://itsfoss.com/use-onedrive-on-linux/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/sync-onedrive-in-linux-rclone.png?ssl=1
[7]: https://rclone.org/#providers
[8]: https://itsfoss.com/things-to-do-after-installing-ubuntu-20-04/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/Configuring-Rclone.png?resize=800%2C298&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/Configuring-Rclone-1.png?resize=800%2C303&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Selecting-cloud-service.png?resize=800%2C416&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/Configuring-OneDrive-1.png?resize=800%2C416&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/One-Drive-logging-in.png?resize=800%2C432&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Configuring-OneDrive-2.png?resize=800%2C430&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Configuring-OneDrive-3.png?resize=800%2C428&ssl=1
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Configuring-One-Drive.png?resize=800%2C426&ssl=1
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Exiting-Rclone-Configuration.png?resize=800%2C255&ssl=1
[18]: https://linuxhandbook.com/mkdir-command/
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/Mounting-one-drive-1.png?fit=800%2C432&ssl=1
[20]: https://itsfoss.com/manage-startup-applications-ubuntu/
[21]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/Mounting-OneDrive-on-startup.png?fit=800%2C499&ssl=1
