[#]: subject: "Ubuntu Touch OTA-19 Brings in Support for New Devices With Multiple Bug Fixes"
[#]: via: "https://news.itsfoss.com/ubuntu-touch-ota-19/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ubuntu Touch OTA-19 Brings in Support for New Devices With Multiple Bug Fixes
======

Ubuntu Touch is an open-source OS for mobile devices that respects user privacy, unlike Google’s Android for privacy-focused users. The UBports community has released yet another update of Ubuntu Touch that is based on Ubuntu 16.04.

This release supports many new devices and contains significant updates on certain phones, along with numerous bug fixes.

Let’s take a look at them.

![Source: UBports][1]

### What’s New?

#### Framework and Packages

The 16.04.7 Qt framework and packages like qml-module-qtwebview and libqt5webview5-dev have been added to the App framework. This improves application compatibility with other platforms.

#### Imrpovements to Halium devices

The gyroscope and magnetic field sensors can now be accessed on the Halium 5.1 and 7.1 devices. Do note that the functionality of the compass is still under development. The same applies to the magnetic field sensor for the Halium 9 and 10 devices that now use sensorfw, thus replacing the legacy platform-API.

#### Pixel 3a

You can completely shut down the device as intended. It no longer hangs in the process of the shutdown, so you should have better battery life. Additionally, the freezing of the camera app while capturing sounds when recording videos has also been fixed.

#### Messaging App Fix

The messaging app has also received a minor update. When messages arrive, the keyboard will no longer appear automatically but when needed. This is useful if the user doesn’t want to reply or access the keyboard on demand.

#### Media Hub

A bug that prevented the device from sleep when audio sounds were played in successions has been fixed. Another major bug that reduced battery life drastically, because of uncleared requested wake locks, has also been taken care of.

### Other Improvements

There are several new devices added to support Ubuntu Touch, along with fixes for the Wi-Fi, audio, and camera.

You can look at the [official release notes][2] to check the list of devices added and explore more technical details.

### Update or Installation

Ubuntu Touch users should automatically receive an update or head to the updates in the System Settings to check for available updates.

Those willing to try out Ubuntu Touch for the first time can explore the [official website][3] and check if their device is supported correctly before installation.

I am particularly looking forward to the Ubuntu Touch OS update with Ubuntu 18.04 or newer as its base after several minor updates.

_What do you think about this new update? Have you tried it yet?_

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/ubuntu-touch-ota-19/

作者：[Rishabh Moharir][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQyMiIgd2lkdGg9IjM0MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[2]: https://ubports.com/blog/ubports-news-1/post/ubuntu-touch-ota-19-release-3779
[3]: https://ubuntu-touch.io/get-ubuntu-touch
