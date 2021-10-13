[#]: subject: "How to Install Google Chrome on Debian and Kali Linux"
[#]: via: "https://itsfoss.com/install-chrome-debian-kali-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Google Chrome on Debian and Kali Linux
======

Debian and Debian-based Kali Linux come with Firefox as the default web browser. But this does not mean that you cannot install other web browsers in it.

Google Chrome is hugely popular and you probably already use it on other systems. If you want to install Chrome on Debian, you can surely do so.

You won’t find Google Chrome in the repositories of Debian because it is not open source software but you can download and install it from Chrome website.

In this tutorial, I’ll show you two methods of installing Chrome on Debian:

  * GUI method
  * Command line method



Let’s start with the GUI method first.

_**Note: I am using Debian in the examples here but since Kali Linux is based on Debian, the same methods are also applicable to Kali Linux.**_

### Method 1: Installing Chrome on Debian Graphically

This is a no-brainer. You go to the Google Chrome website, download the deb file and double lick on it to install it. I am going to show the steps in detail so that it is easy for you to follow it.

Go to Google Chrome’s website.

[Get Google Chrome][1]

You’ll see the option to download Google Chrome.

![Click on the Download Chrome button][2]

When you click on the download button, it gives you two options for downloading the installer file. Go with the one that says Debian/Ubuntu.

![Download the Chrome installer file for Debian][3]

**Please note that Google Chrome is NOT available for 32-bit systems.**

In the next screen, you should opt for saving the file to the computer instead of opening it in software center for installation. This way, the downloaded file will be saved in the Downloads folder instead of the temp directory.

![Save the downloaded DEB file for Google Chrome][4]

Go to the Download folders and right click on the downloaded deb file and choose to open it with Software Install.

![Right click on the downloaded DEB file and open with Software Install][5]

It will then open the software center and you should see the option to install Chrome now. Click on the install button.

![Click on the install button][6]

You’ll be asked to enter your account’s password. This is the same password you use to log into your system.

![Enter your account’s password][7]

In less than a minute, Google Chrome will be installed. You should see a remove option now which indicates that the software is installed.

![Chrome is now installed][8]

Once Chrome is installed on Debian, search for it in the system menu and start it.

![Start Google Chrome][9]

It will ask to be your default browser and send the crash reports to Google. You can uncheck either or both options. And then you can see Google Chrome browser window.

![][10]

If you log into your Google account, you should be able to sync your passwords, bookmarks and other browsing data here. Enjoy it!

Another thing, after installing Chrome, you can delete the downloaded DEB file from your system. It is not needed anymore, not even for uninstalling Chrome.

### Method 2: Install Google Chrome on Debian from the terminal

What you just saw above can be easily achieved in the terminal.

First, make sure that your package cache is refreshed and you have wget installed for [downloading files from the web in the terminal][11].

```
sudo apt update && sudo apt install wget
```

The next option is to download the .deb file of Google Chrome:

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```

Once downloaded, you can [install the deb file in the terminal][12] with apt command like this:

```
sudo apt install ./google-chrome-stable_current_amd64.deb
```

Once the installation completes, you can start using Chrome.

### Bonus tip: Updating Google Chrome

Both methods add Google’s repository to your system. You can see it in your sources.lis.d directory:

```
cat /etc/apt/sources.list.d/google-chrome.list
```

This means that Google Chrome will be updated with other system updates in Debian and Kali Linux. You know [how to update your Kali Linux][13] or Debian system in command line? Just use this command:

```
sudo apt update && sudo apt upgrade -y
```

### Uninstall Google Chrome from your system

Even if you chose to install Chrome on Debian using the GUI method, you’ll have to use the terminal to remove it.

Don’t worry. It’s really just one command:

```
sudo apt purge google-chrome-stable
```

Enter your account password when asked. Nothing is displayed on the screen when you type the password. That’s okay. Type it and press enter and confirm the deletion.

![][14]

Well, that’s about it. I hope you find this tutorial helpful.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-chrome-debian-kali-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.google.com/chrome/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/download-chrome-on-debian.webp?resize=800%2C344&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/downloading-google-chrome.webp?resize=800%2C512&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/save-downloaded-chrome-installer-file-debian.webp?resize=800%2C430&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/open-deb-file-with-software-install.webp?resize=800%2C419&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/installing-chrome-debian.webp?resize=800%2C408&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/enter-account-password-while-installing-deb-file.webp?resize=800%2C420&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/chrome-installed-debian.webp?resize=800%2C384&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/start-chrome-debian.webp?resize=800%2C276&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/Chrom-in-Debian.webp?resize=800%2C450&ssl=1
[11]: https://itsfoss.com/download-files-from-linux-terminal/
[12]: https://itsfoss.com/install-deb-files-ubuntu/
[13]: https://linuxhandbook.com/update-kali-linux/
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/remove-google-chrome-ubuntu.webp?resize=800%2C450&ssl=1
