How to Back Up Your Android Data with ADB on Ubuntu
============================================================


![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/android-backup-ubuntu.jpg "How to Back Up Your Android Data with ADB on Ubuntus") 



Backing up app data, text messages and the like in Android can be incredibly tedious, and sometimes costly too. Many apps on the Play Store promise to back up your data but are hit and miss or cost an arm and a leg. Did you know that there’s a better way to do this and that it can all be done on your computer?

<small style="box-sizing: inherit; font-size: 16px;">[Ads by Google][9]</small>

Android comes with a set of development tools. There are many, but the main item of interest is known as ADB (or Android Debug Bridge). It allows a user to gain direct command-line access to any Android device. With this tool anything is possible – including backing up an entire Android device! Here’s how to do it on Ubuntu.

**Note**: this tutorial is done with a focus on Ubuntu Linux. However, ADB is available on Windows and macOS, and the backup process can be on those platforms as well. [Download for windows and Mac][10].

### Installing ADB and Enabling USB Debugging

Open a terminal window and enter this command to install the ADB tool that will interact with Android.

```
sudo apt install adb
```

 ![adb-install-adb-ubuntu](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/adb-install-adb-ubuntu.jpg "adb-install-adb-ubuntu") 

With the ADB tool installed on the system, debugging will need to be enabled inside of Android. Start by opening the Settings area of Android. Scroll all the way to the bottom to find “About Phone” and select it. This opens a “Phone status” page. On this page scroll to the bottom again, find “Build number’ and tap on it seven times. This will enable Developer Mode.

 ![adb-about-phone](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/adb-about-phone.jpg "adb-about-phone") 

To get to Developer Settings, press the Back button on the device to go back a page. A new option in settings will appear: “Developer options.” Tap on it to enter the developer settings area. Scroll through till you see “Android debugging” (or some variation of it), and tap it to enable the setting.

### Backing Up

Creating a backup with ADB is as simple as running one command. First, take the USB cable that corresponds with the Android device, and plug it into the PC. Then, go to a terminal and enter the following:

```
adb start-server
```

This will start the Android Debugging Bridge server. With this command running, quickly unlock the Android device, as ADB will force a confirmation window that must be accepted to continue.

 ![adb-all-usb-debugging](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/adb-all-usb-debugging.jpg "adb-all-usb-debugging") 

To start the backup process, go to the terminal and enter this backup command. It’ll take text messages and other bits of app data, and store it into an encrypted file.

```
adb backup -apk -shared -all -f backup-file.adb
```

 ![adb-full-backup](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/adb-full-backup.jpg "adb-full-backup") 

Running the backup command will prompt the user to look at Android and set a password for the file before Android will run the backup procedure. Enter a strong, memorable password. Then, select the “back up my data” button. The backup may take some time, but when it is finished, a file named “backup-file.adb” will be in “/home/username/.”

### Restoring

To restore the backup, enable the ADB server (like mentioned above) and run this command to restore the data.

```
adb restore backup-file.adb
```

 ![adb-full-restore](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/adb-full-restore.jpg "adb-full-restore") 

Once again, go to Android, as ADB will prompt the user to enter a password. This time, instead of creating a password, all that is required is entering the one created from earlier. After that select “restore my data,” and the restoration process will begin. Be patient, as this may take a bit of time.

### Conclusion

Not many Android users know this, but ADB is incredibly powerful. It can be used for more than gaining root access on a device. In fact, there are so many things that can be done with this tool, it’d take more than one article to cover all of it!

What tricks do you know with ADB? Let us know below!

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/back-up-android-data-adb-ubuntu/

作者：[Derrik Diener][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/derrikdiener/
[1]:https://www.maketecheasier.com/author/derrikdiener/
[2]:https://www.maketecheasier.com/back-up-android-data-adb-ubuntu/#comments
[3]:https://www.maketecheasier.com/category/linux-tips/
[4]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fback-up-android-data-adb-ubuntu%2F
[5]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fback-up-android-data-adb-ubuntu%2F&text=How+to+Back+Up+Your+Android+Data+with+ADB+on+Ubuntu
[6]:mailto:?subject=How%20to%20Back%20Up%20Your%20Android%20Data%20with%20ADB%20on%20Ubuntu&body=https%3A%2F%2Fwww.maketecheasier.com%2Fback-up-android-data-adb-ubuntu%2F
[7]:https://www.maketecheasier.com/download-appx-files-from-windows-store/
[8]:https://www.maketecheasier.com/airy-youtube-video-downloader-2/
[9]:https://support.google.com/adsense/troubleshooter/1631343
[10]:https://developer.android.com/studio/command-line/adb.html
