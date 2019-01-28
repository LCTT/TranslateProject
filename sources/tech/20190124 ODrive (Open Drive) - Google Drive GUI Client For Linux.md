[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (ODrive (Open Drive) – Google Drive GUI Client For Linux)
[#]: via: (https://www.2daygeek.com/odrive-open-drive-google-drive-gui-client-for-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

ODrive (Open Drive) – Google Drive GUI Client For Linux
======

This we had discussed in so many times. However, i will give a small introduction about it.

As of now there is no official Google Drive Client for Linux and we need to use unofficial clients.

There are many applications available in Linux for Google Drive integration.

Each application has came out with set of features.

We had written few articles about this in our website in the past.

Those are **[DriveSync][1]** , **[Google Drive Ocamlfuse Client][2]** and **[Mount Google Drive in Linux Using Nautilus File Manager][3]**.

Today also we are going to discuss about the same topic and the utility name is ODrive.

### What’s ODrive?

ODrive stands for Open Drive. It’s a GUI client for Google Drive which was written in electron framework.

It’s simple GUI which allow users to integrate the Google Drive with few steps.

### How To Install & Setup ODrive on Linux?

Since the developer is offering the AppImage package and there is no difficulty for installing the ODrive on Linux.

Simple download the latest ODrive AppImage package from developer github page using **wget Command**.

```
$ wget https://github.com/liberodark/ODrive/releases/download/0.1.3/odrive-0.1.3-x86_64.AppImage
```

You have to set executable file permission to the ODrive AppImage file.

```
$ chmod +x odrive-0.1.3-x86_64.AppImage
```

Simple run the following ODrive AppImage file to launch the ODrive GUI for further setup.

```
$ ./odrive-0.1.3-x86_64.AppImage
```

You might get the same window like below when you ran the above command. Just hit the **`Next`** button for further setup.
![][5]

Click **`Connect`** link to add a Google drive account.
![][6]

Enter your email id which you want to setup a Google Drive account.
![][7]

Enter your password for the given email id.
![][8]

Allow ODrive (Open Drive) to access your Google account.
![][9]

By default, it will choose the folder location. You can change if you want to use the specific one.
![][10]

Finally hit **`Synchronize`** button to start download the files from Google Drive to your local system.
![][11]

Synchronizing is in progress.
![][12]

Once synchronizing is completed. It will show you all files downloaded.
Once synchronizing is completed. It’s shows you that all the files has been downloaded.
![][13]

I have seen all the files were downloaded in the mentioned directory.
![][14]

If you want to sync any new files from local system to Google Drive. Just start the `ODrive` from the application menu but it won’t actual launch the application. But it will be running in the background that we can able to see by using the ps command.

```
$ ps -df | grep odrive
```

![][15]

It will automatically sync once you add a new file into the google drive folder. The same has been checked through notification menu. Yes, i can see one file was synced to Google Drive.
![][16]

GUI is not loading after sync, and i’m not sure this functionality. I will check with developer and will add update based on his input.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/odrive-open-drive-google-drive-gui-client-for-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/drivesync-google-drive-sync-client-for-linux/
[2]: https://www.2daygeek.com/mount-access-google-drive-on-linux-with-google-drive-ocamlfuse-client/
[3]: https://www.2daygeek.com/mount-access-setup-google-drive-in-linux/
[4]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[5]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-1.png
[6]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-2.png
[7]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-3.png
[8]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-4.png
[9]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-5.png
[10]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-6.png
[11]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-7.png
[12]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-8a.png
[13]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-9.png
[14]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-11.png
[15]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-9b.png
[16]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-10.png
