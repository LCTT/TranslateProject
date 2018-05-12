translating---geekpi

Easily Run And Integrate AppImage Files With AppImageLauncher
======
Did you ever download an AppImage file and you didn't know how to use it? Or maybe you know how to use it but you have to navigate to the folder where you downloaded the .AppImage file every time you want to run it, or manually create a launcher for it.

With AppImageLauncher, these are problems of the past. The application lets you **easily run AppImage files, without having to make them executable**. But its most interesting feature is easily integrating AppImages with your system: **AppImageLauncher can automatically add an AppImage application shortcut to your desktop environment's application launcher / menu (including the app icon and proper description).**

Without making the downloaded Kdenline AppImage executable manually, the first time I double click it (having AppImageLauncher installed), AppImageLauncher presents two options:

`Run once` or `Integrate and run`.

Clicking on Integrate and run, the AppImage is copied to the `~/.bin/` folder (hidden folder in the home directory) and is added to the menu, then the app is launched.

**Removing it is just as simple** , as long as the desktop environment you're using has support for desktop actions. For example, in Gnome Shell, simply **right click the application icon in the Activities Overview and select** `Remove from system` :

The AppImageLauncher GitHub page says that the application only supports Debian-based systems for now (this includes Ubuntu and Linux Mint) because it integrates deeply with the system. The application is currently in heavy development, and there are already issues opened by its developer to build RPM packages, so Fedora / openSUSE support might be added in the not too distant future.

### Download AppImageLauncher

The AppImageLauncher download page provides binaries for Debian, Ubuntu or Linux Mint (64bit), as well as a 64bit AppImage. The source is also available.

[Download AppImageLauncher][1]


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/04/easily-run-and-integrate-appimage-files.html

作者：[Logix][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://github.com/TheAssassin/AppImageLauncher/releases
[2]:https://kdenlive.org/download/
