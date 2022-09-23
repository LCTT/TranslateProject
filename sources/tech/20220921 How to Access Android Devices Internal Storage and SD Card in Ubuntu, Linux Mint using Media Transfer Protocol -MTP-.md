[#]: subject: "How to Access Android Devices Internal Storage and SD Card in Ubuntu, Linux Mint using Media Transfer Protocol (MTP)"
[#]: via: "https://www.debugpoint.com/how-to-access-android-devices-internal-storage-and-sd-card-in-ubuntu-linux-mint-using-media-transfer-protocol-mtp/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Access Android Devices Internal Storage and SD Card in Ubuntu, Linux Mint using Media Transfer Protocol (MTP)
======
This tutorial will show how to access android devices using MTP in Ubuntu and how to access SD card contents.

**This tutorial will show how to access android devices using MTP in Ubuntu and how to access SD card contents.**

MTP, or [media transfer protocol][1], is an extension of the Picture transfer protocol and is implemented in the Android marshmallow version. After the marshmallow update, you can’t use the android devices as typical mass storage devices you can just plug in and see the internal storage contents and the SD card contents in a file manager such as in Thunar or GNOME Files. This is due to the OS being unable to determine the MTP devices, and also, a list of supported devices is not yet implemented.

### Steps to access Android Devices in Ubuntu, Linux Mint

* Install [libmtp][2], FUSE file system for MTP enabled devices [mtpfs][3] using below commands

```
sudo apt install go-mtpfs
sudo apt install libmtp
sudo apt install mtpfs mtp-tools
```

* Create a directory in `/media` using the below command and changing the permission to write

```
sudo mkdir /media/MTPdevice
sudo chmod 775 /media/MTPdevice
sudo mtpfs -o allow_other /media/MTPdevice
```

* Plug in your Android device using a USB cable in Ubuntu.
* On your Android device, swipe down from above on the home screen and click Touch for more options.
* In the following menu, select the option “Transfer File (MTP)“.

![MTP Option1][4]

![MTP Option2][5]

* Run the below command in the terminal to find out the device ID etc. You can see the VID and PID in the command output for your device. Note down these two numbers (highlighted in below image).

```
mtp-detect
```

![mtp-detect Command Output][6]

* Open the android rules file using the text editor using the below command.

```
sudo gedit /etc/udev/rules.d/51-android.rules
```

* If you are using the latest Ubuntu, where gedit is not installed, use the below command.

```
sudo gnome-text-editor /etc/udev/rules.d/51-android.rules
```

* Type the below line using your device’s VID and PID in the `51-android.rules` file (which you note down in above step).
* Save and close the file.

```
SUBSYSTEM=="usb", ATTR{idVendor}=="22b8", ATTR{idProduct}=="2e82", MODE="0666"
```

* Run the below command to restart the device manager via [systemd][7].

```
sudo service udev restart
```

### Next steps to access contents

* The next steps are mainly needed to access the contents of the external SD card memory of your android device.
* I had to do these because the file manager was NOT showing the contents of the SD card. This is not a solution, though, but it is a workaround which works for most of the users as per this [Google forum post][8] and worked for my Motorola G 2nd Gen with SanDisk SD card.   * Safely remove your connected device in Ubuntu.  * Turn off the device. Remove the SD card from the device.  * Turn on the device without the SD card.  * Turn off the device again.  * Put the SD card back in and turn on the device again.
* Reboot your Ubuntu machine and plug in your android device.
* Now you can see the contents of your android device’s internal storage and the SD card contents.

![MTP Device Contents in Ubuntu][9]

### Conclusion

The above tutorial to access Android device contents in Ubuntu worked on older and new Ubuntu releases with Android devices (Samsung, OnePlus & Motorolla). Try these steps and it might work if you are facing difficulties to access the contents. In my opinion, MTP is very slow compared to good old plug and play options.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/how-to-access-android-devices-internal-storage-and-sd-card-in-ubuntu-linux-mint-using-media-transfer-protocol-mtp/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://en.wikipedia.org/wiki/Media_Transfer_Protocol
[2]: https://sourceforge.net/projects/libmtp/
[3]: https://launchpad.net/ubuntu/+source/mtpfs
[4]: https://www.debugpoint.com/wp-content/uploads/2016/03/MTP-Option1.png
[5]: https://www.debugpoint.com/wp-content/uploads/2016/03/MTP-Option2.png
[6]: https://www.debugpoint.com/wp-content/uploads/2016/03/mtp-detect.png
[7]: https://www.debugpoint.com/systemd-systemctl-service/
[8]: https://productforums.google.com/forum/#!topic/nexus/11d21gbWyQo;context-place=topicsearchin/nexus/category$3Aconnecting-to-networks-and-devices%7Csort:relevance%7Cspell:false
[9]: https://www.debugpoint.com/wp-content/uploads/2016/03/MTP-Device-Contents-in-Ubuntu.png
