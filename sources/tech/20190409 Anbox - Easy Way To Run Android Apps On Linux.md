[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Anbox – Easy Way To Run Android Apps On Linux)
[#]: via: (https://www.2daygeek.com/anbox-best-android-emulator-for-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Anbox – Easy Way To Run Android Apps On Linux
======

Android emulator applications are allow us to run our favorite Android apps or games directly from Linux system.

There are many android emulators were available for Linux and we had covered few applications in the past.

You can review those by navigating to the following URLs.

  * [How To Install Official Android Emulator (SDK) On Linux][1]
  * [How To Install GenyMotion (Android Emulator) On Linux][2]



Today we are going to discuss about the Anbox Android emulator.

### What Is Anbox?

Anbox stands for Android in a box. Anbox is a container-based approach to boot a full Android system on a regular GNU/Linux system.

It’s new and modern emulator among others.

Since Anbox places the core Android OS into a container using Linux namespaces (LXE) so, there is no slowness while accessing the installed applications.

Anbox will let you run Android on your Linux system without the slowness of virtualization because the core Android OS has placed into a container using Linux namespaces (LXE).

There is no direct access to any hardware from the Android container. All hardware access are going through the anbox daemon on the host.

Each applications will be open in a separate window, just like other native system applications, and it can be showing up in the launcher.

### How To Install Anbox In Linux?

Anbox application is available as snap package so, make sure you have enabled snap support on your system.

Anbox package is recently added to the Ubuntu (Cosmic) and Debian (Buster) repositories. If you are running these version then you can easily install with help of official distribution package manager. Other wise go with snap package installation.

Make sure the necessary kernel modules should be installed in your system in order to work Anbox. For Ubuntu based users, use the following PPA to install it.

```
$ sudo add-apt-repository ppa:morphis/anbox-support
$ sudo apt update
$ sudo apt install linux-headers-generic anbox-modules-dkms
```

After you installed the `anbox-modules-dkms` package you have to manually reload the kernel modules or system reboot is required.

```
$ sudo modprobe ashmem_linux
$ sudo modprobe binder_linux
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][3]** or **[APT Command][4]** to install anbox.

```
$ sudo apt install anbox
```

We always used to get package for Arch Linux based systems from AUR repository. So, use any of the **[AUR helper][5]** to install it. I prefer to go with **[Yay utility][6]**.

```
$ yuk -S anbox-git
```

If no, you can **[install and configure snaps in Linux][7]** by navigating to the following article. Others can ignore if you have already installed snaps on your system.

```
$ sudo snap install --devmode --beta anbox
```

### Prerequisites For Anbox

By default, Anbox doesn’t ship with the Google Play Store.

Hence, we need to manually download each application (APK) and install it using Android Debug Bridge (ADB).

The ADB tool is readily available in most of the distributions repository so, we can easily install it.

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][3]** or **[APT Command][4]** to install ADB.

```
$ sudo apt install android-tools-adb
```

For **`Fedora`** system, use **[DNF Command][8]** to install ADB.

```
$ sudo dnf install android-tools
```

For **`Arch Linux`** based systems, use **[Pacman Command][9]** to install ADB.

```
$ sudo pacman -S android-tools
```

For **`openSUSE Leap`** system, use **[Zypper Command][10]** to install ADB.

```
$ sudo zypper install android-tools
```

### Where To Download The Android Apps?

Since you can’t use the Play Store so, you have to download the APK packages from trusted sites like [APKMirror][11] then manually install it.

### How To Launch Anbox?

Anbox can be launched from the Dash. This is how the default Anbox looks.
![][13]

### How To Push The Apps Into Anbox?

As i told previously, we need to manually install it. For testing purpose, we are going to install `YouTube` and `Firefox` apps.

First, you need to start ADB server. To do so, run the following command.

```
$ adb devices
```

We have already downloaded the `YouTube` and `Firefox` apps and the same we will install now.

**Common Syntax:**

```
$ adb install Name-Of-Your-Application.apk
```

Installing YouTube and Firefox app.

```
$ adb install 'com.google.android.youtube_14.13.54-1413542800_minAPI19(x86_64)(nodpi)_apkmirror.com.apk'
Success

$ adb install 'org.mozilla.focus_9.0-330191219_minAPI21(x86)(nodpi)_apkmirror.com.apk'
Success
```

I have installed `YouTube` and `Firefox` in my Anbox. See the screenshot below.
![][14]

As we told in the beginning of the article, it will open any app as a new tab. Here, I’m going to open Firefox and accessing the **[2daygeek.com][15]** website.
![][16]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/anbox-best-android-emulator-for-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/install-configure-sdk-android-emulator-on-linux/
[2]: https://www.2daygeek.com/install-genymotion-android-emulator-on-ubuntu-debian-fedora-arch-linux/
[3]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/category/aur-helper/
[6]: https://www.2daygeek.com/install-yay-yet-another-yogurt-aur-helper-on-arch-linux/
[7]: https://www.2daygeek.com/linux-snap-package-manager-ubuntu/
[8]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[9]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[10]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[11]: https://www.apkmirror.com/
[12]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[13]: https://www.2daygeek.com/wp-content/uploads/2019/04/anbox-best-android-emulator-for-linux-1.jpg
[14]: https://www.2daygeek.com/wp-content/uploads/2019/04/anbox-best-android-emulator-for-linux-2.jpg
[15]: https://www.2daygeek.com/
[16]: https://www.2daygeek.com/wp-content/uploads/2019/04/anbox-best-android-emulator-for-linux-3.jpg
