[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (install Fedora on a Raspberry Pi 3)
[#]: via: (https://fedoramagazine.org/install-fedora-on-a-raspberry-pi/)
[#]: author: (Nick Hardiman https://fedoramagazine.org/author/nickhardiman/)

install Fedora on a Raspberry Pi 3
======

![][1]

Fire up a Raspberry Pi with Fedora.

The [Raspberry Pi Foundation][2] has produced quite a few models over the years. This procedure was tested on third generation Pis – a [Model B v1.2][3], and a [Model B+][4] (the older [2][5] and the new [4][6] weren’t tested). These are the credit-card size Pis that have been around a few years.

### get hardware

You do need a few hardware items, including the Pi. You don’t need any [HaT (Hardware Attached on Top)][7] boards or USB antennas. If you have used your Pi in the past, you probably have all these items.

  * **current network**. Perhaps this is your home lab.
  * **ethernet cable**. This connects the current network to the Raspberry Pi
  * **Raspberry Pi 3**, model B or B+.
  * **power supply**
  * **micro-SD card**, 8GB or larger.
  * **keyboard** and **video monitor**.



The keyboard and video monitor together make up the local console. It’s possible – though complicated – to get by without a console, such as setting up an automated install then connecting over the network. A local console makes it easy to answer the configuration questions during Fedora’s first boot. Also, a mistake during AP configuration may break the network, locking out remote users.

### download Fedora Minimal

  * Find Fedora’s [alternate architecture images][8].
  * Download the [ARM® aarch64 Architecture image][9].



The _Fedora Minimal_ image, one of [Fedora’s alt downloads][10], has all the core packages and network packages required (well, nearly – check out _dnsmasq_ below). The image contains a ready-made file system, with over 400 packages already installed. This minimal image does not include popular packages like a development environment, Internet service or desktop. These types of software aren’t required for this work, and may well use too much memory if you install them.

The _Fedora Minimal_ raw image fits on a small SD card and runs in less than 1 GB of memory (these old Pis have 1GB RAM).

The name of the downloaded file is something like _Fedora-Minimal-32-1.6.aarch64.raw.xz_. The file is compressed and is about 700MB in size. When the file is uncompressed, it’s 5GB. It’s an ext4 file system that’s mostly empty – about 1GB is used and 4GB is empty. All that empty space is the reason the compressed download is so much smaller than the uncompressed raw image.

### copy to the micro-SD card

  * Copy the image to a micro-SD card.



This can be a more complex than it sounds, and a painful experience. Finding a [good micro-SD card][11] takes work. Then there’s the challenge of physically attaching the card to your computer.Perhaps your laptop has a full SD card slot and you need a card adapter, or perhaps you need a USB adapter. Then, when it comes to copying, the OS may either help or get in your way. You may have luck with [Fedora Media Writer][12], or with these Linux commands.

```
unxz ./Fedora-Minimal-32-1.6.aarch64.raw.xz
dd if=./Fedora-Minimal-32-1.6.aarch64.raw of=/dev/mmcblk0 bs=8M status=progress oflag=direct
```

### set up Fedora

  * Connect the Pi, power cable, network cable and micro-SD card.
  * Hit the power.
  * See the colored box as the graphics chip powers up.
  * Wait for the [anaconda installer][13] to start.
  * Answer anaconda’s setup questions.



Initial configuration of the OS takes a few minutes – a couple minutes waiting for boot-up, and a couple to fill out the spokes of anaconda’s text-based installer. In the examples below, the user is named **nick** and is an administrator (a member of the _wheel_ group).

Congratulations! Your Fedora Pi is up and operational.

### update software

  * Update packages with `dnf update`.
  * Reboot the machine with `systemctl reboot`.



Over the years, a lot of people have put a lot of work into making the Raspberry Pi devices work. Use the latest software to make sure you get the benefit of their hard work. If you skip this step, you may find some things just don’t work.

The update downloads and installs about a hundred packages. Since the storage is a micro-SD card, writing new software is a slow process. This is what using computing storage felt like in the 1990s.

### things to play with

There are a few other things that can be set up at this point, if you want to play around. It’s all optional. Try things like this.

  * Replace the _localhost_ hostname with the command `sudo hostnamectl set-hostname raspi`.
  * Find the IP address with `ip addr`.
  * Try an SSH login, or even set up key-based login with `ssh-copy-id`.
  * Power down with `systemctl poweroff`.



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/install-fedora-on-a-raspberry-pi/

作者：[Nick Hardiman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/nickhardiman/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/07/fedora-on-rpi-816x346.png
[2]: https://www.raspberrypi.org/about/
[3]: https://www.raspberrypi.org/products/raspberry-pi-3-model-b/
[4]: https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/
[5]: https://www.raspberrypi.org/products/raspberry-pi-2-model-b/
[6]: https://www.raspberrypi.org/products/raspberry-pi-4-model-b/
[7]: https://www.raspberrypi.org/blog/introducing-raspberry-pi-hats/
[8]: https://alt.fedoraproject.org/alt/
[9]: https://download.fedoraproject.org/pub/fedora-secondary/releases/32/Spins/aarch64/images/Fedora-Minimal-32-1.6.aarch64.raw.xz
[10]: https://alt.fedoraproject.org/
[11]: https://www.jeffgeerling.com/blog/2019/raspberry-pi-microsd-card-performance-comparison-2019
[12]: https://fedoramagazine.org/make-fedora-usb-stick/
[13]: https://fedoraproject.org/wiki/Anaconda
