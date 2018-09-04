How to Update Firmware on Ubuntu 18.04
======
Usually, the default software center in Ubuntu and other Linux handle the update of the firmware of your system. But if you encounter errors with it, you can use fwupd command line tool for updating the firmware of your system.

I use [Dell XPS 13 Ubuntu edition][1] as my main operating system. I have done a fresh [installation of Ubuntu 18.04][2] on it and I cannot be happier with the hardware compatibility. Bluetooth, external USB headsets and speakers, multi-monitor, everything works out of the box.

The one thing that troubled me was one of the [firmware][3] updates that appeared in the Software Center.

![Updating firmware in Ubuntu][4]

Clicking on the Update button resulted in an error a few seconds later.

![Updating firmware in Ubuntu][5]

The error message was:

**Unable to update “Thunderbolt NVM for Xps Notebook 9360”: could not detect device after update: timed out while waiting for device**

In this quick tip, I’ll show you how to update the firmware of your system in [Ubuntu][6].

### Updating firmware in Ubuntu 18.04

![How to update firmware in Ubuntu][7]

One thing you should know that GNOME Software i.e. the software center in Ubuntu 18.04 is also capable of updating the firmware. But in situations when it fails for some reason, you can use the command line tool fwupd.

[fwupd][8] is an open source daemon that handles firmware upgrades in Linux based systems. It is created by GNOME developer [Richard Hughes][9]. Developers from Dell also contributed to the development of this open source tool.

Basically, it utilizes the LVFS, Linux Vendor Firmware Service. Hardware vendors upload redistributable firmware to the LVFS site and thanks to fwupd, you can upgrade those firmware from inside the operating system itself. fwupd is supported by major Linux distributions like Ubuntu and Fedora.

Open a terminal and update your system first:
```
sudo apt update && sudo apt upgrade -y

```

After that you can use the following commands one by one to start the daemon, refresh the list of available firmware updates and install the firmware updates.
```
sudo service fwupd start

```

Once the daemon is running, check if there are any firmware updates available.
```
sudo fwupdmgr refresh

```

The output should look like this:

Fetching metadata <https://cdn.fwupd.org/downloads/firmware.xml.gz>
Downloading… [****************************]
Fetching signature <https://cdn.fwupd.org/downloads/firmware.xml.gz.asc>

After this, run the firmware update:
```
sudo fwupdmgr update

```

The output of the firmware update could be similar to this:

```
No upgrades for XPS 13 9360 TPM 2.0, current is 1.3.1.0: 1.3.1.0=same
No upgrades for XPS 13 9360 System Firmware, current is 0.2.8.1: 0.2.8.1=same, 0.2.7.1=older, 0.2.6.2=older, 0.2.5.1=older, 0.2.4.2=older, 0.2.3.1=older, 0.2.2.1=older, 0.2.1.0=older, 0.1.3.7=older, 0.1.3.5=older, 0.1.3.2=older, 0.1.2.3=older
Downloading 21.00 for XPS13 9360 Thunderbolt Controller…
Updating 21.00 on XPS13 9360 Thunderbolt Controller…
Decompressing… [***********]
Authenticating… [***********]
Restarting device… [***********]
```

This should handle the firmware update in Ubuntu 18.04. I hope this quick tip helped you with firmware updates in Linux.

If you have questions or suggestions, please feel free to use the comment section below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/update-firmware-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: https://itsfoss.com/dell-xps-13-ubuntu-review/
[2]: https://itsfoss.com/install-ubuntu-dual-boot-mode-windows/
[3]: https://en.wikipedia.org/wiki/Firmware
[4]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/ubuntu-firmware-update-error-1.png
[5]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/ubuntu-firmware-update-error-2.jpg
[6]: https://www.ubuntu.com/
[7]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/update-firmware-ubuntu.png
[8]: https://fwupd.org/
[9]: https://github.com/hughsie/fwupd
