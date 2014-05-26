#Translating by shipsw#

Ubuntu Touch and Android Dual Boot Installation
===================================

Ubuntu Dual Boot Installer is provided as a tech preview for developers who want to run Ubuntu and Android on a single device. It is not intended to be used by regular users, neither at this point nor as its ultimate goal. Those developers installing it should be familiar with the Ubuntu and Android partition layouts and should also feel at home with manually flashing partitions in case something goes wrong.

Ubuntu Dual Boot Installer was born as an internal skunkworks project some Canonical Engineers dedicated a limited amount of their time to. Seeing the good progress, it was decided to release this preview for the developer community to test, study and contribute to.

Dual boot is not part of the regular Ubuntu release.

## What to expect after installation

- A single device with the ability to switch between fully functional Android and Ubuntu images
- On Android: an Ubuntu Installer app to install Ubuntu, as well as to boot into Ubuntu
- On Android: the SuperUser app to grant permissions to the Ubuntu Installer app
- On Ubuntu: an Ubuntu Dual Boot app to boot into Android
- Ubuntu system updates are not yet supported from the Ubuntu side, but they can be done via the Android app

## Requirements

To install dual-boot, you'll need:

- **A Nexus 4 device** (other [supported Nexus devices][1] should in theory work but have not been tested at the time)
- **Android 4.4.2 or higher** running on the device, either stock firmware or based on CyanogenMod or AOSP.
- **2.7GB of free storage** on the device to install Ubuntu
- **ADB tools** running on your desktop computer
- The device needs its **bootloader to be unlocked and USB debugging enabled**. Follow steps 1 to 3 below to do this, or alternatively, if your device is already unlocked and has USB debugging enabled, you can [skip to the installation process >][2]

### Step 1 - Desktop Setup

The following steps are required on your desktop system that you'll need in order to flash and communicate with the device.

**Set up the Touch Developer Preview Tools PPA**

The PPA is a small mini repository which contains additional software required by this install process. The following section details how to enable and use it.

The PPA has the tools and dependencies to support Ubuntu releases including 12.04, 12.10, 13.04, 13.10 and 14.04. Add the Ubuntu Touch PPA by adding the following custom source list entry to your `/etc/apt/sources.list` file.

On your computer, press `Ctrl+Alt+T` to start a terminal.

	sudo add-apt-repository ppa:phablet-team/tools

On Ubuntu 12.04, you will also need to run:

	sudo add-apt-repository ppa:ubuntu-sdk-team/ppa

Then do the following:

	sudo apt-get update
	sudo apt-get install ubuntu-device-flash

### Step 1.5 - Optional Android Backup

- If not enabled, enable developer mode, by tapping `Settings -> About phone -> Build number` (x 7 times)
- If not enabled, enable usb debugging in `Settings -> Developer options -> USB debugging`
- Execute on your computer 

		$ adb backup -apk -shared -all

This should hopefully create backup.ab with all of your apps, OS, and data. Later, after reflashing with android (or rooting / unlocking) you will be able to use $ adb restore backup.ab to restore all of your data.

### Step 2 - Device unlock

If the device is already unlocked, skip to Step 3. These steps will wipe all personal data from the device.

1. With the device powered off, power on the device by holding the `Power button` + `volume up` + `volume down`.
2. The device will boot into the bootloader.
3. Plug the device into the computer via the USB cable.
4. On your computer, press `Ctrl+Alt+T` to start a terminal. Type sudo fastboot oem unlock, followed by Enter
5. On the device screen, accept the terms of unlocking.
6. Boot the device by pressing the `power button` (pointed by an arrow with Start on the screen).

**Device factory reset**

If you get stuck in a bootloop rebooting the tablet after unlocking the bootloader... Here's what you do:

1. During the bootloop.. hold the `power button` + `volume up` + `volume down` button simultaneously to get yourself back into fastboot mode as you were previously.
2. In fastboot mode.. use the volume keys to scroll to Recovery and the power button to select it.
3. In Recovery (Android robot on his back with a red triangle)... tap the volume up button and the power button simultaneously which will bring you into stock recovery. Again.. Don't hold the buttons, just tap them simultaneously. Also make sure you're holding the correct volume button. Up will be the volume key on the right.
4. Once you're in Recovery.. perform a factory reset/data wipe and then reboot your tablet... you should now be back to the Welcome Screen.

### Step 3 - Initial Device Setup

Follow these initial steps on your device:

1. If not booted, boot the device into Android
2. Enable USB debugging on the device
	- on Ice Cream Sandwich (version 4.0) go to Settings and turn on USB Debugging (`Settings > System > Developer options > USB debugging`).
	- on Jelly Bean (versions 4.1 and 4.2) you need to enter `Settings, About [Phone|Tablet]` and tap the Build number 7 times to see the Developer Options.
	- on 4.2.2, (`settings > about` > tap on build number 7 times to activate the developer options menu item).
	- On either Android version you must then enable USB debugging via `Settings > Developer options > USB debugging`. You will also need to accept a host key on the device.
		- On the workstation-> `adb kill-server; adb start-server`
3. Plug the device into the computer via the USB cable.
	- Depending on the installed Android version, a popup will show up on the device with the host key that needs to be accepted for the device to communicate with the workstation.
	- Note, 'adb devices' should not show the device as 'offline'. If it does, unplug the device, run adb under sudo on the workstation (`sudo adb kill-server; sudo adb start-server`), then plug the device back in.
	- In some cases, the device will continue to show offline, and the host key popup will not appear if the USB connection method is 'MTP' (default for some devices and versions of Android). Unchecking all options in the USB connection method (`Settings -> Storage -> Menu -> USB computer connection -> MTP, PTP`) seems to resolve this adb connection issue for some users.
4. Save the version of the current image on the device, if on Android, to use as a reference to revert back to. The version can be found by going to `Settings > About Phone > Build Number`.

Newer Nexus 10s have not booted fully after developer mode was enabled. If this occurs boot into the bootloader and do "`fastboot -w`", then proceed to the next step.


## Dual boot installation or upgrade instructions

The procedure at this point is effectively the same for both new installations and upgrades of an existing dual boot installation.

### Installing the Ubuntu Installer app in Android

Ubuntu Note: if you had installed a previous version of Ubuntu dual boot, please make sure to uninstall Ubuntu from the Android app before upgrading to the new Ubuntu dual boot. You can keep the user data, only uninstallation of the base system is recommended.

1. On your computer, download the dual boot installation script into your home directory from: http://humpolec.ubuntu.com/latest/dualboot.sh

2. Open a terminal on your computer pressing the `Ctrl+Alt+T` key combination
3. Make the installation script executable by running this command:

		chmod +x dualboot.sh

4. Ensure that your device:
	- has booted normally into the Android user interface
	- has USB debugging enabled
	- has an unlocked bootloader
5. Connect your device via USB to your computer
6. Install dual-boot by running this command on a terminal:

		./dualboot.sh

After installation, the phone will reboot several times. Once finished, it will boot into Android and you will find the dual boot app as “Ubuntu Dual Boot” in the Apps section.

Optionally, for alternative ways of using the installer script, [check out the installer reference >][3].

Now follow the instructions below to install Ubuntu from Android.

## Installing Ubuntu from Android

Note: 2.7GB of free memory space is required on your device for the Ubuntu installation.

1. Optionally, on your desktop, and while your device is still connected via USB, issue the following command on the terminal to free up space (say "Yes" if you are asked to grant permissions on the device):

		adb shell "su sh rm -rf /cache/*"

2. On the device, press the apps button in Android to bring up the list of apps
3. Browse the apps to find the **Ubuntu Dual Boot** icon and press it to start the app
4. When the app launches, press on **Choose channel to install** and choose a channel to download from (the recommended channel is **utopic**)
5. Once download is completed you need to Grant SU permissions to the application for the install to be successful. Press the **Grant** button, when prompted.
6. Press the **Reboot to Ubuntu** button to boot to Ubuntu.
7. A standard phone reboot with the hard key will always boot to Android.

Notes:

- All channels supported by the phablet-flash tool are also supported by the Ubuntu Installer on Android
- When selecting an Ubuntu channel, the **bootstrap** checkbox lets you wipe user data from Ubuntu, otherwise it is kept between installations. Since you're installing for the first time now, it won't make a difference
- When selecting an Ubuntu channel, unticking the **latest version** checkbox will let you select a particular image number. Otherwise, if checked it will default to the latest image.
- If during installation the Ubuntu download finished while the phone was locked or when the Ubuntu Installer app was not on the foreground, the installation button will change to **Resume install**. This will resume installation to the point where SuperUser permissions are requested.

## Additional notes

### Updating to a new Ubuntu image

The rule of thumb for dual boot is:

- Installation of a new Ubuntu version needs to be done from the Android side via the Dualboot app
- Download of a new Ubuntu version can happen on either the Ubuntu or Android side

This effectively means there are two possible ways to upgrade your Ubuntu image:

- **If you are running Android**, use the Dualboot app to check and install new versions of Ubuntu by selecting "Uninstall Ubuntu" from the menu options. Next you will be asked if you want to keep the user data from Ubuntu. If you do want to keep the data, contacts, installed applications, pictures, background settings and such will be kept across Ubuntu installations. Additionally, every time there is a new Ubuntu version available, you'll get an Android notification:
	- For stable channels, the app polls for new versions every 2 days
	- For proposed channels, the app polls for new versions every 10 hours
- **If you are running Ubuntu**, use the standard upgrade mechanism to download new images via System Settings, but do not choose to install the image after having downloaded it. Instead, once the dowload has finished, reboot to Android and the Dualboot app there will resume the installation. Once finished, you can then reboot to Ubuntu.

To update Ubuntu to a newer version, On the android Ubuntu dual boot application, Once Ubuntu has been uninstalled, follow the same installation step to download a newer version of Ubuntu.

### Dual boot installer command reference

For the majority of cases, running the installer script in auto mode with no arguments will suffice. For more advanced usage, additional commands can be used.

dualboot.sh

- Auto mode: it detects if the SuperUser app installation is required and instals or updates the Dualboot application on Android

dualboot.sh full

- Full mode: it installs the SuperUser and Dualboot apps on Android

dualboot.sh update

- Update mode: it installs or updates the Dualboot app on Android

dualboot.sh channel $CHANNEL

- Sideload mode: it downloads the latest from the specified Ubuntu $CHANNEL and sideloads the files to the phone. It then starts the Dualboot app on Android to resume the Ubuntu installation with the sideloaded files.

dualboot.sh push ubuntu.tar.xz device.tar.xz version.tar.xz

- Sideload push mode: it sideloads the downloaded files passed as a parameter and it starts the Dualboot app to resume installation with them on the Android side.

The script also takes a device ID in case there are more devices connected to the computer. The device ID is the first parameter passed to the script. If it is not provided first connected device is used. E.g.

	dualboot.sh <device-id> channel devel-customized

### Using a custom image server

If you need to use a custom image server that provides ported images for those devices outside of the officially supported, you can use a custom image server with the Dualboot app. To do so, open a terminal, and with your device connected over USB, issue the following command (replacing $CUSTOM\_SERVER\_URL with the URL or your custom server):

	adb shell "su sh 'cd /data/data/com.canonical.ubuntu.installer/files/ && echo $CUSTOM_SERVER_URL > custom_server &&  chmod 777 custom_server'"

The next time you start the Dualboot app on Android, it will use that server to fetch and install images instead of the official Ubuntu one.

## If something goes wrong

If something goes wrong after the dual boot installation and you cannot boot either into Ubuntu or Android, you can revert the Android installation to the status it was before dual boot by reflashing the original boot and recovery images. Only the recovery partition is actually modified by dual boot, but you can choose to reflash the boot partition just in case.

1. Download the Android firmware you are running on your device onto your PC.
2. Open a terminal with `Ctrl+Alt+T`
3. Extract the firmware tarball and cd to its directory.
4. Run the following command to reboot into the bootloader

		adb reboot bootloader

5. Once in the bootloader, run this command to reflash the boot partition:

		fastboot flash boot boot.img

6. Without exiting the bootloader, run this command to reflash the recovery partition:

		fastboot flash recovery recovery.img

7. After flashing, reboot and your phone should start into Android:

    	fastboot reboot

## Contributing

The dual boot project, as with the rest of Ubuntu is open source and open for participation, you can help making it better too!

- [Report bugs >][4]
- [Contribute code >][5]

## FAQ

### How does dual boot work?

An Android-based phone has multiple partitions which serve different purposes. Those relevant for dual booting are **/boot**, **/recovery**, **/system** and **/data**.

- The **boot** partition is loaded by the bootloader during a normal boot. The boot image in that partition is a combination of the kernel and a ramdisk. In short, the bootloader unpacks the boot image, creates a ramdisk and copies the content of the boot image's ramdisk into it. Then the kernel is started by executing the **init process** from ramdisk.
- The **recovery partition** contains the recovery image, which is just a different kind of boot image. It also includes a kernel and a ramdisk, where the init binary is replaced by a recovery binary inside the ramdisk.
- The **system partition** holds all the read-only system files (except the ones in ramdisk), and it is mounted by the init process.
- The **data partition** is then a writable partition used by the system for user data.

Ubuntu uses partitions in a slightly different way:

- The **boot** and **recovery** partitions have the same functionality as in Android
- The **system image** holds the Android part of the system which is executed inside the LXC.
- The **data partition** contains the Ubuntu system under **/data/ubuntu/**

In order to enable the user to choose their own flavour of Android, the Android boot image cannot be modified, as the original kernel needs to be preserved. **Thus the recovery partition is used to boot into Ubuntu.**

### Which versions of Android does dual-boot work with?

- Stock Android or AOSP 4.4.2 or higher.
- CyanogenMod (based on Android 4.4.2 or higher).

### Which devices does dual-boot work for?

Dual boot has been tested to work with the following devices:

- Nexus 4
- Nexus 7
- Nexus 10

### Which Ubuntu releases does dual-boot support?

Dual boot supports the same channels that phablet-flash supports.

### How is the user data partition shared between Android and Ubuntu?

The user data partition hosts also the Ubuntu system image at /data/system.img which is around 2 GB.

The Ubuntu swap file is also present in the data partition at /data/SWAP.img (around (540 MB)

The Ubuntu user and system data are also present at:

- /data/user-data
- /data/system-data

The Android data partition usage is unchanged.

### Is booting into recovery no longer possible when dual-booting?

The recovery partition when dual booting is currently used by the Ubuntu boot image. This means that when booting into recovery mode, Ubuntu will boot.

Access of the recovery will be resolved in future releases. However when the Ubuntu image is uninstalled, the original (Android stock or CWM) recovery is restored by the Ubuntu Install android app.

### If dual boot replaces the recovery partition, can I do an Android upgrade with dual boot installed?

Yes. Use the "Prepare for Android update" option in the Dual boot app menu on Android. This will recover your original Android recovery partition, ready for the Android upgrade. This will obviously delete the Ubuntu installation in the recovery partition, but you can easily reinstall it after the Android upgrade from the Dual boot app.

In any case, you can always uninstall dual boot, which will restore your original recovery partition.

### Can I uninstall dual boot?

Yes, when Ubuntu is uninstalled from the Android side via the dual boot app, the original Android recovery partition is restored to the original state before dual boot was installed.

Uninstalling Ubuntu also deletes the Ubuntu system image and swap file. Optionally, also the Ubuntu user data can be deleted.

### The dual boot app installs a copy of the the SuperUser app. Can I use another SuperUser app instead?

Yes indeed! The supplied [SuperUser][6] app is only for those who don't have it installed yet.

However, one word of caution: tests were only performed only with the SuperUser app version from the [CyanogenMod][7] build and with the one installed by dualboot.sh script. But as long as you own SuperUser app behaves in similar way of those two tested, you should be fine.

### When installing Ubuntu, can I switch channels without deleting user data?

Yes you can, but this is something that hasn't been thoroughly tested. Therefore some applications might not function properly. The same applies for switching between different versions.

### Can I make boot to Ubuntu the default and move the Android boot to the recovery partition?

Right now swapping the default boot OS is not possible. However, this is something we might look to support if there is demand for it.

### Why do you use the recovery partition to boot Ubuntu, rather than a combined boot image for Android and Ubuntu?

One of the initial principles when designing dual boot was not to tie it to a particular Android flavour and version and leave the user the flexibility to use their own choice. Thus the Android boot image and the kernel it contains are left untouched.

The choice was then to reuse the recovery partition, and instead focus on restoring it back to its original state if it's necessary to go back to single boot with Android.

### I already have CWM recovery installed and know how to use it, can I use a zip file and flash manually instead?

Absolutely, we provide dualboot.sh to make it easy to install the apps and the custom recovery. If you prefer to install the recovery manually yourself, it's also possible. Check out the source code for the dualboot.sh script to see exactly what it's doing.

### Why does the Ubuntu Installer app need to be installed to the system partition via recovery?

The Ubuntu Installer app needs to be installed as an Android (preinstalled) system app. Unlike use-installed apps, which live in the data partition, system apps always live in system partition and are granted additional privileges on top of the standard permissions set available to 3rd party applications.

The extra permissions that the Ubuntu installer app needs are just two: **cache partition write access** to store the downloaded files for Ubuntu installation and **power management** capability to reboot the system.

--------------------------------------------------------------------------------

via: https://wiki.ubuntu.com/Touch/DualBootInstallation

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://wiki.ubuntu.com/Touch/Devices#Working_with_phablet-flash
[2]:https://wiki.ubuntu.com/Touch/DualBootInstallation#Installation
[3]:https://wiki.ubuntu.com/Touch/DualBootInstallation#DualBootInstallerReference
[4]:https://bugs.launchpad.net/humpolec/+filebug
[5]:https://code.launchpad.net/humpolec
[6]:https://wiki.ubuntu.com/SuperUser
[7]:https://wiki.ubuntu.com/CyanogenMod
