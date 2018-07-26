Translating by qhwdw
How to Run Windows Apps on Android with Wine
======

![](https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-featured-image.jpg)

Wine (on Linux, not the one you drink) is a free and open-source compatibility layer for running Windows programs on Unix-like operating systems. Begun in 1993, it could run a wide variety of Windows programs on Linux and macOS, although sometimes with modification. Now the Wine Project has rolled out version 3.0 which is compatible with your Android devices.

In this article we will show you how you can run Windows apps on your Android device with WINE.

**Related** : [How to Easily Install Windows Games on Linux with Winepak][1]

### What can you run on Wine?

Wine is only a compatibility layer, not a full-blown emulator, so you need an x86 Android device to take full advantage of it. However, most Androids in the hands of consumers are ARM-based.

Since most of you are using an ARM-based Android device, you will only be able to use Wine to run apps that have been adapted to run on Windows RT. There is a limited, but growing, list of software available for ARM devices. You can find a list of these apps that are compatible in this [thread][2] on XDA Developers Forums.

Some examples of apps you will be able to run on ARM are:

  * [Keepass Portable][3]: A password storage wallet
  * [Paint.NET][4]: An image manipulation program
  * [SumatraPDF][5]: A document reader for PDFs and possibly some other document types
  * [Audacity][6]: A digital audio recording and editing program



There are also some open-source retro games available like [Doom][7] and [Quake 2][8], as well as the open-source clone, [OpenTTD][9], a version of Transport Tycoon.

The list of programs that Wine can run on Android ARM devices is bound to grow as the popularity of Wine on Android expands. The Wine project is working on using QEMU to emulate x86 CPU instructions on ARM, and when that is complete, the number of apps your Android will be able to run should grow rapidly.

### Installing Wine

To install Wine you must first make sure that your device’s settings allow it to download and install APKs from other sources than the Play Store. To do this you’ll need to give your device permission to download apps from unknown sources.

1\. Open Settings on your phone and select your Security options.


![wine-android-security][10]

2\. Scroll down and click on the switch next to “Unknown Sources.”

![wine-android-unknown-sources][11]

3\. Accept the risks in the warning.

![wine-android-unknown-sources-warning][12]

4\. Open the [Wine installation site][13], and tap the first checkbox in the list. The download will automatically begin.

![wine-android-download-button][14]

5\. Once the download completes, open it from your Downloads folder, or pull down the notifications menu and click on the completed download there.

6\. Install the program. It will notify you that it needs access to recording audio and to modify, delete, and read the contents of your SD card. You may also need to give access for audio recording for some apps you will use in the program.

![wine-android-app-access][15]

7\. When the installation completes, click on the icon to open the program.

![wine-android-icon-small][16]

When you open Wine, the desktop mimics Windows 7.

![wine-android-desktop][17]

One drawback of Wine is that you have to have an external keyboard available to type. An external mouse may also be useful if you are running it on a small screen and find it difficult to tap small buttons.

You can tap the Start button to open two menus – Control Panel and Run.

![wine-android-start-button][18]

### Working with Wine

When you tap “Control panel” you will see three choices – Add/Remove Programs, Game Controllers, and Internet Settings.

Using “Run,” you can open a dialogue box to issue commands. For instance, launch Internet Explorer by entering `iexplore`.

![wine-android-run][19]

### Installing programs on Wine

1\. Download the application (or sync via the cloud) to your Android device. Take note of where you save it.

2\. Open the Wine Command Prompt window.

3\. Type the path to the location of the program. If you have saved it to the Download folder on your SD card, type:

4\. To run the file in Wine for Android, simply input the name of the EXE file.

If the ARM-ready file is compatible, it should run. If not, you’ll see a bunch of error messages. At this stage, installing Windows software on Android in Wine can be hit or miss.

There are still a lot of issues with this new version of Wine for Android. It doesn’t work on all Android devices. It worked on my Galaxy S6 Edge but not on my Galaxy Tab 4. Many games won’t work because the graphics driver doesn’t support Direct3D yet. You need an external keyboard and mouse to be able to easily manipulate the screen because touch-screen is not fully developed yet.

Even with these issues in the early stages of release, the possibilities for this technology are thought-provoking. It’s certainly likely that it will take some time yet before you can launch Windows programs on your Android smartphone using Wine without a hitch.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/run-windows-apps-android-with-wine/

作者：[Tracey Rosenberger][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/traceyrosenberger/
[1]:https://www.maketecheasier.com/winepak-install-windows-games-linux/ (How to Easily Install Windows Games on Linux with Winepak)
[2]:https://forum.xda-developers.com/showthread.php?t=2092348
[3]:http://downloads.sourceforge.net/keepass/KeePass-2.20.1.zip
[4]:http://forum.xda-developers.com/showthread.php?t=2411497
[5]:http://forum.xda-developers.com/showthread.php?t=2098594
[6]:http://forum.xda-developers.com/showthread.php?t=2103779
[7]:http://forum.xda-developers.com/showthread.php?t=2175449
[8]:http://forum.xda-developers.com/attachment.php?attachmentid=1640830&d=1358070370
[9]:http://forum.xda-developers.com/showpost.php?p=36674868&postcount=151
[10]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-security.png (wine-android-security)
[11]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-unknown-sources.jpg (wine-android-unknown-sources)
[12]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-unknown-sources-warning.png (wine-android-unknown-sources-warning)
[13]:https://dl.winehq.org/wine-builds/android/
[14]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-download-button.png (wine-android-download-button)
[15]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-app-access.jpg (wine-android-app-access)
[16]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-icon-small.jpg (wine-android-icon-small)
[17]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-desktop.png (wine-android-desktop)
[18]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-start-button.png (wine-android-start-button)
[19]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-Run.png (wine-android-run)
