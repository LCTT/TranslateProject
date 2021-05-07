[#]: subject: (Running Linux Apps In Windows Is Now A Reality)
[#]: via: (https://news.itsfoss.com/linux-gui-apps-wsl/)
[#]: author: (Jacob Crume https://news.itsfoss.com/author/jacob/)
[#]: collector: (lujun9972)
[#]: translator: (Kevin3599 )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Running Linux Apps In Windows Is Now A Reality
======

When Microsoft released [Windows Subsystem for Linux][1] (WSL) in 2016, the hype was unreal. People were dreaming of running their Windows and Linux apps side-by-side, without having to reboot. But alas, WSL could only run terminal applications.

Last year, Microsoft set out again to try to revolutionize the Windows app ecosystem. This time, they replaced the old emulated kernel with a real Linux kernel. This change allowed you to run [Linux apps in Windows][2].

### Initial Preview of GUI Apps for WSL

![][3]

Technically, you did get the initial support for Linux GUI apps on WSL, but only when using a 3rd-party X server. These were often buggy, slow, hard to set up, and posed a privacy concern.

The result of this was a small group of Linux enthusiasts (that happened to run Windows) that had the skills and knowledge to set up an X server. These people were then horribly disappointed at the fact there was no hardware acceleration at all.

So, it was wise to stick to command line utilities on WSL.

**But this all changes now.** Now that Microsoft is [officially supporting][4] GUI Linux apps, we will be receiving hardware acceleration, alongside a huge range of other improvements in WSL.

### Linux GUI Apps For The Masses: WSLg

![Image Credit: Microsoft Devblogs][5]

With the new official support from Microsoft in WSL, there is a huge range of available improvements. These include:

  * GPU hardware acceleration
  * Audio and microphone support out of the box
  * Automatic starting of the X and PulseAudio servers



And, they’ve given this feature a nickname “**WSLg**“.

These features will make running Linux apps on WSL almost as easy as running native apps, with a minimal performance impact.

So, you can try running your [favorite IDE][6], Linux-specific testing use-cases, and a variety of other applications like [CAD software][7].

#### GPU Hardware Acceleration In Linux Apps

![Image Credit: Microsoft Devblogs][8]

One of the biggest issues with running GUI Linux apps on Windows previously was that they couldn’t use hardware acceleration. This left us with a slow mess when trying to move windows around and doing anything that needed some GPU horsepower.

According to the announcement post from Microsoft:

> As part of this feature, we have also enabled support for GPU accelerated 3D graphics! Thanks to work that was completed in Mesa 21.0, any applications that are doing complex 3D rendering can leverage OpenGL to accelerate these using the GPU on your Windows 10 machine.

This is a useful addition, and should help anyone wanting to run GPU intensive applications through WSL.

#### Audio And Microphone Support Out Of The Box!

One of the key elements to a good experience with Linux apps running alongside Windows apps is the audio. With the new WSL update, audio is supported out of the box. This is achieved with a PulseAudio server being started at the same time as the X server.

Microsoft explains:

> Linux GUI applications on WSL will also include out-of-the-box audio and microphone support. This exciting aspect will let your apps play audio cues and utilize the microphone, perfect for building, testing, or using movie players, telecommunication apps, and more.

If we want Linux apps to become more widespread, this is a key feature. This will also allow developers of Windows apps to better support porting their apps to Linux.

#### Automatic Starting Of All The Required Servers

![Image Credit: Microsoft Devblogs][9]

Previously, you had to start the [PulseAudio][10] and [X servers][11] manually before being able to actually run anything. Now, Microsoft has implemented a service that checks to see if a Linux app is running, and then starts the required servers automatically.

This allows much easier launching and using of Linux apps on Windows.

Microsoft claims this will improve the user experience significantly:

> With this feature, we are automatically starting a companion system distro, containing a Wayland, X server, pulse audio server, and everything else needed to make Linux GUI apps communicate with Windows. After you’re finished using GUI applications and terminate your WSL distribution the system distro will automatically end its session as well.

These components combine to make it super easy to run Linux GUI apps alongside regular Windows apps.

### Wrapping Up

With all these new features, it looks like Microsoft is giving it their best to get Linux apps working on Windows. And with more users running Linux apps on Windows, we may see more of them jump ship and move solely to Linux. Especially since the apps they’re used to would run anyway.

If this takes off (and Microsoft doesn’t kill it in a few years), it will bring an end to a 5-year quest to bring Linux apps to Windows. If you are curious to learn more about it, you can look at the [release announcement][12].

_What are your thoughts on GUI Linux apps running on Windows? Share them in the comments below!_

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

#### _Related_

  * [Linux Mint 20.1 is Available to Download Now, Here are 9 New Features in This Release][13]
  * ![][14] ![Linux Mint 20.1][15]


  * [The Progress Linux has Made in Terms of Gaming is Simply Incredible: Lutris Creator][16]
  * ![][14] ![][17]


  * [Nitrux 1.3.8 Release Packs in KDE Plasma 5.21, Linux 5.11, and More Changes][18]
  * ![][14] ![][19]



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-gui-apps-wsl/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://docs.microsoft.com/en-us/windows/wsl/
[2]: https://itsfoss.com/run-linux-apps-windows-wsl/
[3]: https://i0.wp.com/i.ytimg.com/vi/f8_nvJzuaSU/hqdefault.jpg?w=780&ssl=1
[4]: https://devblogs.microsoft.com/commandline/the-initial-preview-of-gui-app-support-is-now-available-for-the-windows-subsystem-for-linux-2/
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzQ0MScgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[6]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[7]: https://itsfoss.com/cad-software-linux/
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzQ0NScgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[9]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzQ0MCcgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[10]: https://www.freedesktop.org/wiki/Software/PulseAudio/
[11]: https://x.org/wiki/
[12]: https://blogs.windows.com/windows-insider/2021/04/21/announcing-windows-10-insider-preview-build-21364/
[13]: https://news.itsfoss.com/linux-mint-20-1-release/
[14]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzIwMCcgd2lkdGg9JzM1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[15]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/01/linux-mint-20-1.png?fit=1200%2C675&ssl=1&resize=350%2C200
[16]: https://news.itsfoss.com/lutris-creator-interview/
[17]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/03/lutris-interview-ft.png?fit=1200%2C675&ssl=1&resize=350%2C200
[18]: https://news.itsfoss.com/nitrux-1-3-8-release/
[19]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/03/nitrux-1-3-8.png?fit=1200%2C675&ssl=1&resize=350%2C200
