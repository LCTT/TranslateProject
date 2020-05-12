[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Can’t Install Deb File on Ubuntu 20.04? Here’s What You Need to do!)
[#]: via: (https://itsfoss.com/cant-install-deb-file-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Can’t Install Deb File on Ubuntu 20.04? Here’s What You Need to do!
======

_**Brief: Double clicking on the deb file doesn’t install it via the software center in Ubuntu 20.04? You are not the only one facing this issue. This tutorial shows how to fix it.**_

On the “[things to do after installing Ubuntu 20.04][1]” article, a few readers mentioned that they had trouble [installing software from the Deb file][2].

I found that strange because installing a program using the deb file is one of the simplest methods. All you have to do is to double click the downloaded file and it opens (by default) with the Software Center program. You click on install, it asks for your password and within a few seconds/minute, the software is installed.

I had [upgraded to Ubuntu 20.04 from 19.10][3] and hadn’t faced this issue with it until today.

I downloaded the .deb file for installing [Rocket Chat messenger][4] and when I double clicked on it to install this software, the file was opened with the archive manager. This is not what I expected.

![DEB files opened with Archive Manager instead of Software Center][5]

The “fix” is simple and I am going to show it to you in this quick tutorial.

### Installing deb files in Ubuntu 20.04

For some reasons, the default software to open the deb file has been set to Archive Manager tool in Ubuntu 20.04. The Archive Manager tool is used for [extract zip][6] and other compressed files.

The solution for this problem is pretty simple. You [change the default application in Ubuntu][7] for opening DEB files from Archive Manager to Software Install. Let me show you the steps.

**Step 1:** Right click on the downloaded DEB file and select **Properties**:

![][8]

**Step 2:** Go to “**Open With**” tab, select “**Software Install**” app and click on “**Set as default**“.

![][9]

This way, all the deb files in the future will be opened with Software Install i.e. the software center applications.

Confirm it by double clicking the DEB file and see if it open with the software center application or not.

#### Ignorant bug or stupid feature?

Why is deb files are supposed to be opened with Archive Manager is beyond comprehension. I do hope that this is a bug, not a weird feature like [not allowing drag and drop files on the desktop in Ubuntu 20.04][10].

Since we are discussing deb file installation, let me tell you about a nifty tool [gdebi][11]. It’s a lightweight application with the sole purpose of installing DEB file. Not always but some times, it can also handle the dependencies.

You can learn more about [using gdebi and making it default for installing deb files here][12].

--------------------------------------------------------------------------------

via: https://itsfoss.com/cant-install-deb-file-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/things-to-do-after-installing-ubuntu-20-04/
[2]: https://itsfoss.com/install-deb-files-ubuntu/
[3]: https://itsfoss.com/upgrade-ubuntu-version/
[4]: https://rocket.chat/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/error-opening-deb-file.png?ssl=1
[6]: https://itsfoss.com/unzip-linux/
[7]: https://itsfoss.com/change-default-applications-ubuntu/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/open-deb-files.png?ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/deb-file-install-fix-ubuntu.png?fit=800%2C454&ssl=1
[10]: https://itsfoss.com/add-files-on-desktop-ubuntu/
[11]: https://launchpad.net/gdebi
[12]: https://itsfoss.com/gdebi-default-ubuntu-software-center/
