[#]: subject: "Microsoft Makes Using Windows Subsystem for Linux Easier in Windows 11"
[#]: via: "https://news.itsfoss.com/windows-11-wsl/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Microsoft Makes Using Windows Subsystem for Linux Easier in Windows 11
======

Microsoft’s WSL (Windows Subsystem for Linux) is currently a component/feature in Windows 10.

So, if you are using Windows 10, you need to enable the feature to use it as stated in [one of our tutorials][1].

However, with Windows 11, Microsoft decides to make WSL (v2.0) available as an application in the Microsoft Store. It is worth noting that the WSL app on Microsoft’s store is still a preview version.

### The Benefit of Migrating Windows Subsystem for Linux to Microsoft Store

![Source: Microsoft/YT][2]

The availability of WSL as an app in the Microsoft Store makes it easy to install for new users.

Not just limited to the ease of installation, but you no longer need to wait for a Windows update to get the latest and greatest features in WSL. Even though it requires Windows 11 (22000 build and above), any updates will be applied directly to the WSL application without affecting your Windows experience.

This also means that you do not have to opt for Windows Insider builds to get your hands on the latest WSL version. All you need to do is update the app from the app store.

So, convenience and fast updates sound great!

![][3]

### How to Install WSL in Windows 11?

You need to make sure that you fulfill the two pre-requisites required to install WSL from the Microsoft Store. They are:

  * Windows 11 (22000 build or higher)

  * Virtual machine Platform optional component enabled

Use the PowerShell with administrative access and type in the command: _dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all_




Once done, you can search for it in the Microsoft Store or head to the [store link][4] to start installing WSL.

### Do You Need to Upgrade to Windows 11 to use WSL?

As of now, Microsoft will support WSL as a component in Windows 10. So, if you need it for work, you can continue using Windows 10 and WSL.

And, if you want to use WSL from the store while getting access to the latest features like:

  * Running GUI apps with WSLg
  * Linux kernel 5.10.60.1
  * New filesystem mount support



And more. In that case, you may want to opt installing Windows 11. To learn more about this, you can refer to the [official announcement][5].

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/windows-11-wsl/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-bash-on-windows/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: https://i1.wp.com/i.ytimg.com/vi/nVxYFMa1ltM/hqdefault.jpg?w=780&ssl=1
[4]: https://aka.ms/wslstorepage
[5]: https://devblogs.microsoft.com/commandline/a-preview-of-wsl-in-the-microsoft-store-is-now-available/
