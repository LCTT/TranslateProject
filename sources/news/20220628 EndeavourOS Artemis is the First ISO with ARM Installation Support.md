[#]: subject: "EndeavourOS Artemis is the First ISO with ARM Installation Support"
[#]: via: "https://news.itsfoss.com/endeavouros-artemis-release/"
[#]: author: "nikhil https://news.itsfoss.com/author/nikhil/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

EndeavourOS Artemis is the First ISO with ARM Installation Support
======
EndeavourOS includes the latest and greatest with the new release, along with beta support for ARM installations.

![endeavour os][1]

The popular Arch-based Linux distribution [EndeavourOS][2] released their latest ISO refresh called Artemis. Interestingly, the release is named after NASA’s upcoming lunar mission.

Apart from the usual improvements, the latest upgrade includes the latest [Linux Kernel 5.18.5][3] and an updated Calamares installer.

More importantly, with this release, EndeavourOS is closer to a complete ARM installation support. Let us talk more about it!

### Closing in on ARM Installation

The devs at EndeavourOS have updated the Calamares installer to handle installations to ARM devices, but it is still in beta.

Technically, you will find an integration install option on the welcome app of the main ISO. The developer also mentions that both the repos for ARM and the main ISO are more in sync from now on.

Of course, it is exciting to see the addition, nevertheless! The announcement post also mentioned:

> The new installer is a beta release and has limited device support for now, but we are going to add more devices in the future. The team currently is brainstorming to add the first step, the base install, in the Calamares installer also, so it will only take one step to install ARM

Note that only Odroid N2/N2+ and the Raspberry PI are supported right now. So, you can test it out, if you are interested to experiment.

If you are curious about the process of installation for ARM devices, here’s a quick summary:

There are two ‘stages’ to the new installation method:

![][4]

**Stage 1:**

* Boot into a live environment using the EndeavourOS Artemis ISO on your x86_64 computer.
* Connect the SD Card/SSD for your ARM computer as its primary storage.
* Launch Calamares.
* Click on the ARM install button and select the SD Card/SSD you connected and follow with the installation.

**Stage 2**

* Once the previous stage is over, unplug the SD Card/SSD, connect it to your ARM computer, and boot into it.
* You’ll be greeted with a modified Welcome app that lets you set up the device’s keyboard layout, timezone, passwords, etc.
* You’ll also be able to download other DEs/WMs from this screen.
* After this setup, Calamares will delete itself and you can use the device as usual.

For more details, you can check out their blog post on [ARM installation support][5].

### Other Improvements

It is obvious to expect the latest and greatest package updates, being an Arch-based distro.

You will find Firefox 101.0.1 out of the box, but you should be soon be able to update it to Firefox 102.

This release also comes with the latest versions of Mesa and Calamares.

Some of the other changes include:

* Wireplumber has replaced pipewire-media-session as the session and policy manager for Pipewire
* The package budgie-control-center has been added to the EndeavourOS repo for a smoother and native Budgie experience.
* Offline Xfce install received improvements.
* Xfce4 and i3 install will not autostart firewall-applet by default anymore.

Also, now EndeavourOS packages can now be downgraded with eos-downgrade.

You can check out the [official announcement][6] for more details.

### Download EndeavourOS Artemis

The latest release ISO is available on the official website. Head over to the [download page][7] and get the latest image from one of the available mirrors.

[EndeavourOS Artemis][8]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/endeavouros-artemis-release/

作者：[nikhil][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/nikhil/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/endeavour-os-artemis-iso.jpg
[2]: https://endeavouros.com
[3]: https://news.itsfoss.com/linux-kernel-5-18-release/
[4]: https://news.itsfoss.com/wp-content/uploads/2022/06/endeavour-os-arm.jpg
[5]: https://arm.endeavouros.com/2022/06/24/artemis-with-new-endeavouros-arm-install/
[6]: https://endeavouros.com/news/artemis-is-launched/
[7]: https://endeavouros.com/latest-release/
[8]: https://endeavouros.com/
