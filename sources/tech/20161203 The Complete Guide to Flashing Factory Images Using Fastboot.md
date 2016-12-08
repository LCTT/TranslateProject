The Complete Guide to Flashing Factory Images Using Fastboot
==========

![](http://img.wonderhowto.com/img/61/91/63616209761213/0/complete-guide-flashing-factory-images-using-fastboot.1280x600.jpg)

If your phone has an unlocked [bootloader][31], you can use [Fastboot][32] commands to flash factory images. That may sound like a bunch of technical jargon, but when it comes down to it, this is the best method for updating a [rooted][33] device, fixing a [bricked][34] phone, reverting to stock, or even getting new Android updates before everyone else.

Much like [ADB][35], Fastboot is a very powerful Android utility that accepts commands through a terminal shell. But if that sounds intimidating, don't worry—because once you've learned your way around things, you'll know so much more about the inner workings of Android, as well as how to fix most common problems.

### A Note About Samsung Devices

The process outlined below will work for most Nexus, Pixel, HTC, and Motorola devices, as well as phones and tablets from many other manufacturers. However, Samsung devices use their own firmware-flashing software, so Fastboot isn't the way to go if you own a Galaxy. Instead, it's best to use [Odin][36] to flash firmware on a Samsung device, and we've covered that process at the following link.


### Step 1Install ADB & Fastboot on Your Computer

First, you'll have to install ADB and Fastboot on your computer, which are the utilities that let you flash images using Fastboot commands. There are several "one-click" and "light" versions of ADB and Fastboot, but I wouldn't recommend using these because they're not updated as frequently as the official utilities, so they might not be fully compatible with newer devices.

Instead, your best bet is to install the Android SDK Tools from Google. This is the "real" ADB and Fastboot, and it may take a little longer to install, but it's well worth the initial time investment. I've outlined the install process for Windows, Mac, and Linux in _Method 1_ at the following guide, so head over there to get started.


### Step 2Enable OEM Unlocking

In order to flash images using Fastboot, your device's [bootloader][37] will need to be unlocked. If you've already done this, you can skip ahead to Step 3.

But before you can unlock your bootloader, there's [a setting that you'll need to enable][38] if your device shipped with [Android Marshmallow or higher][39] preinstalled. To access this setting, start by **[enabling the Developer options menu][18]** on your phone or tablet. Once you've done that, open the Developer options menu, then enable the switch next to "OEM unlocking," and you'll be good to go.

[
 ![](http://img.wonderhowto.com/img/95/62/63613181132511/0/complete-guide-flashing-factory-images-using-fastboot.w1456.jpg) 
][1]

If this option is not present on your device, it's likely that your device didn't ship with Android Marshmallow or higher preinstalled. However, if the option is present but grayed out, this usually means that your bootloader cannot be unlocked, which means you won't be able to flash images using Fastboot.

### Step 3Put Your Phone into Bootloader Mode

In order to run any Fastboot commands, your phone or tablet will need to be in bootloader mode. This process will vary depending on your device.

For most phones, start by powering your device completely off. When the screen goes black, press and hold the volume down and power buttons simultaneously, and keep holding them for about 10 seconds.

If that doesn't work, turn the phone off, then press and hold the volume down button. From there plug a USB data cable into your PC, then simply wait a few seconds.

If that still didn't work, try repeating the USB cable method, but this time use the volume up button.

Within moments, you should be greeted by Android's Bootloader menu, which should look something like this:

[
 ![](http://img.wonderhowto.com/img/12/37/63615501357234/0/complete-guide-flashing-factory-images-using-fastboot.w1456.jpg) 
][2]

When you see this screen, make sure your phone or tablet is plugged into your computer with a USB data cable. Aside from that, leave the device alone, as the rest of the work will be done on the computer side of things.


### Step 4 Open an ADB Shell on Your Computer

Navigate to the ADB and Fastboot installation directory on your computer. For Windows users, this can usually be found at _C:\Program Files (x86)\Android\android-sdk\platform-tools_. For Mac and Linux users, it depends on where you extracted your ADB folder when you installed the utility, so search your hard drive for the _platform-tools_ folder if you've forgotten.

From here, if you're using a Windows PC, hold down the shift button on your keyboard, then right-click any empty space and choose "Open command window here." For Mac and Linux users, simply open a Terminal window, then change directories to the _platform-tools_ folder inside of your ADB installation directory.

[
 ![](http://img.wonderhowto.com/img/42/51/63613181192903/0/complete-guide-flashing-factory-images-using-fastboot.w1456.jpg) 
][3]

### Step 5Unlock the Bootloader

This next step is something you only need to do once, so if your bootloader is already unlocked, you can skip ahead. Otherwise, you'll need to run a single Fastboot command—but note that **this will wipe all data on your device**.

Before we get into this part, note that I'll be listing the commands for Windows users. Mac users will have to add a period and a slash (**./**) before each of these commands, and Linux users will have to add a slash (**/**) to the front.

So from the ADB shell, type the following command, then hit enter.

*   **fastboot devices**

If that returns a series of letters and numbers followed by the word "fastboot," then your device is connected properly and you're good to go. Otherwise, refer back to Step 1 to check your ADB and Fastboot installation, and ensure that your device is in bootloader mode as shown in Step 3.

[
 ![](http://img.wonderhowto.com/img/06/56/63613181203998/0/complete-guide-flashing-factory-images-using-fastboot.w1456.jpg) 
][4]

Next up, it's time to unlock your bootloader. Depending on the Android version your device shipped with, this will be done in one of two ways.

So if your device shipped with Lollipop or lower pre-installed, enter the following command:

*   **fastboot oem unlock**

If your device shipped with Marshmallow or higher, type the following command, then hit enter:

*   **fastboot flashing unlock**

[
 ![](http://img.wonderhowto.com/img/53/86/63613181215032/0/complete-guide-flashing-factory-images-using-fastboot.w1456.jpg) 
][5]

>Sending the bootloader unlock command to a device that shipped with Marshmallow or higher.

At this point, you'll see a message on your Android device asking if you're sure you'd like to unlock the bootloader. Make sure the "Yes" option is highlighted, and if it's not, use your volume keys to do so. From there, press the power button, then your bootloader will unlock and your phone will reboot back into Fastboot mode.

[
 ![](http://img.wonderhowto.com/img/55/72/63613181234096/0/complete-guide-flashing-factory-images-using-fastboot.w1456.jpg) 
][6]

Bootloader-unlock screen on the Nexus 6P.Image by Dallas Thomas/Gadget Hacks

### Step 6Download the Factory Images

Now that your bootloader is unlocked, you're ready to start flashing factory images—but first, you'll have to download the actual images themselves. Below are some links to download the factory images package for common devices.

*   **[Factory images for Nexus or Pixel devices][15]**
*   **[Factory images for HTC devices][16]**
*   **[Factory images for Motorola devices][17]**

With each of the above links, simply locate your device model in the list, then download the latest available firmware on your computer. If your manufacturer is not listed here, try Googling "factory images for `<phone name>`."


### Step 7Flash the Factory Images

Now it's time to flash the images. The first thing you'll want to do here is extract the factory images archive that you downloaded from your manufacturer's website. For that part, I'd recommend using **[7-Zip][19]**, as it's free and works with most archive formats.

[
 ![](http://img.wonderhowto.com/img/81/31/63616200792994/0/complete-guide-flashing-factory-images-using-fastboot.w1456.jpg) 
][7]

Extracting the factory images archive.

Next, move all of the contents of the archive to the _platform-tools_ folder inside of your ADB installation directory, then open an ADB Shell window in this folder. For more information on that, refer back to Step 4 above.

[
 ![](http://img.wonderhowto.com/img/05/92/63616201348448/0/complete-guide-flashing-factory-images-using-fastboot.w1456.jpg) 
][8]

Factory image files transferred to the platform-tools folder.

Aside from that, there are two different approaches you can take when flashing the images. I'll outline both of them in separate sections below.


### Option 1: Use the Flash-All Script

Most factory images packages will contain a "flash-all" script that applies all of the images in one fell swoop. If you're trying to recover your device from a soft brick, this is the simplest way to go. However, it will unroot your device and wipe all existing data, so if you'd rather avoid that, see Option 2 below.

But to run the flash-all script, type the following line into the command prompt, then hit enter:

*   **flash-all**

[
 ![](http://img.wonderhowto.com/img/58/38/63616206141588/0/complete-guide-flashing-factory-images-using-fastboot.w1456.jpg) 
][9]

Sending the "flash-all" command.

The process will take a few minutes, but when it's done, your phone should automatically reboot and you'll be running complete, 100% stock firmware.


### Option 2: Extract the Images & Flash Them Individually

For a second option, you can flash the system images individually. This method takes some extra work, but it can be used to un-root, update, or un-brick your device without losing existing data.

Start by extracting any additional archives from the factory images package. Sometimes, factory images packages can contain a series of three or four nested archives, so make sure to unzip all of them. From there, copy all of the image files to the main _platform-tools_ folder—in other words, don't leave them in any sub-folders.

[
 ![](http://img.wonderhowto.com/img/47/26/63616206657885/0/complete-guide-flashing-factory-images-using-fastboot.w1456.jpg) 
][10]

All images extracted from factory images package into platform-tools folder.

From here, there are two images that you can get rid of: _cache.img_ and _userdata.img_. These are the images that will overwrite your data and cache with blank space, so if you don't flash them, your existing data will remain intact.

Of the remaining images, six make up the core elements of Android: _boot_, _bootloader_, _radio_, _recovery_, _system_, and _vendor_.

The _boot_ image contains the kernel, so if you just want to get rid of a custom kernel that's causing issues with your device, you only have to flash this one. To do that, type the following command into the ADB shell window:

*   **fastboot flash boot <boot image file name>.img**

Next is the _bootloader_ image—this is the the interface that you're using to flash images with Fastboot commands. So to update your bootloader, type:

*   **fastboot flash bootloader <bootloader image file name>.img**

Once you've done that, you should reload the bootloader so that you can continue flashing images on the newer version. To do that, type:

*   **fastboot reboot-bootloader**

After that, we have the _radio_ image. This one controls connectivity on your device, so if you're having problems with Wi-Fi or mobile data, or if you just want to update your radio, type:

*   **fastboot flash radio <radio image file name>.img**

Then there's _recovery_. This is something you may or may not want to flash, depending on the modifications you've made. For example, if you've installed TWRP custom recovery, flashing this image will overwrite your modification and replace it with the stock recovery interface. So if you're just updating your modded device, you should skip this one. Otherwise, if you plan to keep your phone stock and want the newer version of stock recovery, type:

*   **fastboot flash recovery <recovery file name>.img**

Next up is the big one: The _system_ image. This one contains all of the files that make up the actual Android OS. As such, it's the most essential part of any update.

However you may not be updating your phone. You may just be re-flashing the stock firmware to recover from a soft brick. If this is the case, the system image is often the only image you need to flash in order to fix everything, because it contains the entirety of Android. In other words, if you flash this image and nothing else, it will undo any changes you made with root access and put everything back the way it was.

So as a cure-all in most soft brick situations, or as a method for getting the core part of an Android update, type:

*   **fastboot flash system <system file name>.img**

Finally, there's the _vendor_ image. This is only present on newer phones, so don't worry if it's not in your factory images package. But if it's there, it contains a few important files, so type the following line to get this partition updated:

*   **fastboot flash vendor <vendor file name>.img**

After you've sent any or all of the above commands, you'll be ready to restart your device and boot into Android. To do that, type:

*   **fastboot reboot**

[
 ![](http://img.wonderhowto.com/img/31/31/63616269700533/0/complete-guide-flashing-factory-images-using-fastboot.w1456.jpg) 
][11]

Flashing the factory images individually.

At this point, your device should be fully updated, or if you were trying to recover from a soft brick, it should be running flawlessly. And since you now know what each of the core system images actually _does_, you'll have a better sense of how Android works going forward.

Flashing factory images individually has helped me understand more about Android than any other mod or process. If you think about it, Android is just a series of images written to flash storage, and now that you've dealt with each of them individually, you should be able to identify and resolve root-related issues a lot easier.

*   Follow Gadget Hacks on [Facebook][20], [Twitter][21], [Google+][22], and [YouTube][23]
*   Follow Android Hacks on [Facebook][24], [Twitter][25], and [Pinterest][26]
*   Follow WonderHowTo on [Facebook][27], [Twitter][28], [Pinterest][29], and [Google+][30]



--------------------------------------------------------------------------------

via: http://android.wonderhowto.com/how-to/complete-guide-flashing-factory-images-using-fastboot-0175277/

作者：[ Dallas Thomas][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://creator.wonderhowto.com/dallasthomas/
[1]:http://img.wonderhowto.com/img/original/95/62/63613181132511/0/636131811325119562.jpg
[2]:http://img.wonderhowto.com/img/original/12/37/63615501357234/0/636155013572341237.jpg
[3]:http://img.wonderhowto.com/img/original/42/51/63613181192903/0/636131811929034251.jpg
[4]:http://img.wonderhowto.com/img/original/06/56/63613181203998/0/636131812039980656.jpg
[5]:http://img.wonderhowto.com/img/original/53/86/63613181215032/0/636131812150325386.jpg
[6]:http://img.wonderhowto.com/img/original/55/72/63613181234096/0/636131812340965572.jpg
[7]:http://img.wonderhowto.com/img/original/81/31/63616200792994/0/636162007929948131.jpg
[8]:http://img.wonderhowto.com/img/original/05/92/63616201348448/0/636162013484480592.jpg
[9]:http://img.wonderhowto.com/img/original/58/38/63616206141588/0/636162061415885838.jpg
[10]:http://img.wonderhowto.com/img/original/47/26/63616206657885/0/636162066578854726.jpg
[11]:http://img.wonderhowto.com/img/original/31/31/63616269700533/0/636162697005333131.jpg
[12]:http://android.wonderhowto.com/how-to/know-your-android-tools-what-is-fastboot-do-you-use-it-0155640/
[13]:http://gs6.wonderhowto.com/how-to/unroot-restore-samsung-galaxy-s6-back-stock-0162155/
[14]:http://android.wonderhowto.com/how-to/android-basics-install-adb-fastboot-mac-linux-windows-0164225/
[15]:https://developers.google.com/android/images
[16]:http://www.htc.com/us/support/rom-downloads.html
[17]:https://motorola-global-portal.custhelp.com/cc/cas/sso/redirect/standalone%2Fbootloader%2Frecovery-images
[18]:http://android.wonderhowto.com/how-to/android-basics-enable-developer-options-usb-debugging-0161948/
[19]:http://www.7-zip.org/download.html
[20]:http://facebook.com/gadgethacks/
[21]:http://twitter.com/gadgethax
[22]:https://plus.google.com/+gadgethacks
[23]:https://www.youtube.com/user/OfficialSoftModder/
[24]:http://facebook.com/androidhacksdotcom/
[25]:http://twitter.com/androidhackscom
[26]:https://www.pinterest.com/wonderhowto/android-hacks-mods-tips/
[27]:http://facebook.com/wonderhowto/
[28]:http://twitter.com/wonderhowto/
[29]:http://pinterest.com/wonderhowto/
[30]:https://plus.google.com/+wonderhowto
[31]:http://android.wonderhowto.com/news/big-android-dictionary-glossary-terms-you-should-know-0165594/
[32]:http://android.wonderhowto.com/news/big-android-dictionary-glossary-terms-you-should-know-0165594/
[33]:http://android.wonderhowto.com/how-to/android-basics-what-is-root-0167400/
[34]:http://android.wonderhowto.com/news/big-android-dictionary-glossary-terms-you-should-know-0165594/
[35]:http://android.wonderhowto.com/how-to/know-your-android-tools-what-is-adb-do-you-use-it-0155456/
[36]:http://tag.wonderhowto.com/odin/
[37]:http://android.wonderhowto.com/news/big-android-dictionary-glossary-terms-you-should-know-0165594/
[38]:http://android.wonderhowto.com/news/psa-enable-hidden-setting-before-modding-anything-android-0167840/
[39]:http://android.wonderhowto.com/how-to/android-basics-tell-what-android-version-build-number-you-have-0168050/
