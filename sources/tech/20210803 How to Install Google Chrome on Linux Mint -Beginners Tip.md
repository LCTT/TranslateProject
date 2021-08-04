[#]: subject: (How to Install Google Chrome on Linux Mint [Beginners Tip])
[#]: via: (https://itsfoss.com/install-chrome-linux-mint/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Install Google Chrome on Linux Mint [Beginners Tip]
======

This should be a really simple topic but I am writing this because I see so many websites recommending strange command line steps for installing Google Chrome on Linux Mint. That would work but that’s unnecessarily complicated, specially for beginners not familiar with the command line.

In reality, you don’t need to go terminal way at all. All you have to do is to go to Google Chrome’s website and download the installer file for Ubuntu and install it.

Let me detail the steps for your understanding.

### Installing Google Chrome on Linux Mint

Go to the website of Google Chrome.

[Google Chrome Website][1]

You’ll see a “Download Chrome” button here. Click on it.

![Download Chrome for Linux][2]

It will show you two option for downloading Chrome on Linux. Go with the Debian/Ubuntu option and hit the “Accept and Install” button.

![Select Debian/Ubuntu option for Chrome package on Mint][3]

Before starting the download, Firefox asks you if you want to open the downloaded file with Gdebi or save it. You can go with either option because ultimately, you’ll be [using Gdebi for installing the deb file][4]. However, I prefer to save the file first.

![Save the deb file][5]

Wait for the download to finish.

![Wait for Google Chrome download to finish][6]

Once the download finishes, go to the Downloads folder in File Explorer. To [install the deb file][7], either double click on it or right click on it and select ‘Open With GDebi Package Installer’.

![Double click on the downloaded deb file to install it][8]

Wait for a few seconds and it should give you the option to install.

![Hit the Install Package option in Gdebi][9]

It will ask for Linux Mint account password. In Linux, you need to provide your password for installing any application.

![Enter your password for installing an application][10]

You are almost there. It will show what additional packages will be installed with it (if any). Just hit the Continue button.

![Details on the packages to be installed][11]

It should take a few seconds or a minute at most for installation to complete.

![Installing Chrome in progress][12]

You should see a screen like this when the installation completes.

![Chrome successfully installed on Linux Mint][13]

Once installed, you can run Google Chrome by looking for it in the application menu.

![Run Google Chrome in Linux Mint][14]

And then enjoy Google Chrome on Linux Mint.

![Google Chrome running in Linux Mint][15]

### How to update Google Chrome on Linux Mint

The good thing about this method is that Google Chrome gets updated with system updates. When you install the deb file, it also adds a repository from Google to your system.

![Chrome adds a repository to the system for providing updates][16]

Thanks to this added repository, the updates on the Chrome browser will be added to the system updates. So when you update Linux Mint, it gets updated as well (if there is an update available).

### How to remove Google Chrome from Linux Mint

Don’t like Chrome? No worries. You can uninstall Google Chrome from Linux Mint. And no, you don’t need to use terminal this time as well.

Click on the menu and search for Chrome. Right click on the Chrome icon and you’ll see an ‘Uninstall’ option. Select it.

![Removing Google Chrome from Linux Mint][17]

You’ll have to enter your password, of course. It will show the package to be removed. Click OK here.

![Uninstalling Google Chrome from Linux mint][18]

You may leave the repo from Google Chrome or remove it. It’s your choice, really.

I hope you find this tutorial helpful in using Google Chrome on Linux Mint.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-chrome-linux-mint/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.google.com/chrome/index.html
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/download-chrome-linux-mint.png?resize=800%2C320&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/downloading-chrome-linux-mint.png?resize=800%2C679&ssl=1
[4]: https://itsfoss.com/gdebi-default-ubuntu-software-center/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/saving-downloaded-chrome-linux-mint.png?resize=798%2C400&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/finishing-chrome-download-linux-mint.png?resize=799%2C315&ssl=1
[7]: https://itsfoss.com/install-deb-files-ubuntu/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/installing-google-chrome-deb-file-mint.png?resize=799%2C529&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/installing-google-chrome-gdebi-mint.png?resize=801%2C548&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/enter-password-for-installing-chrome-mint.png?resize=800%2C399&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/installing-chrome-mint.png?resize=799%2C483&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/installing-chrome-mint-progress.png?resize=799%2C489&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/chrome-installed-mint.png?resize=798%2C483&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/run-google-chrome-linux-mint.png?resize=798%2C580&ssl=1
[15]: https://itsfoss.com/wp-content/uploads/2021/08/google-chrome-in-linux-mint-800x450.webp
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/google-chrome-repo-added-mint.png?resize=799%2C272&ssl=1
[17]: https://itsfoss.com/wp-content/uploads/2021/08/removing-google-chrome-from-mint.webp
[18]: https://itsfoss.com/wp-content/uploads/2021/08/uninstalling-google-chrome-from-linux-mint.webp
