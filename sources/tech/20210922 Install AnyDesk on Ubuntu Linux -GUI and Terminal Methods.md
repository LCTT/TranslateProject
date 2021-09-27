[#]: subject: "Install AnyDesk on Ubuntu Linux [GUI and Terminal Methods]"
[#]: via: "https://itsfoss.com/install-anydesk-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install AnyDesk on Ubuntu Linux [GUI and Terminal Methods]
======

_**Brief: This beginner’s tutorial discusses both GUI and terminal methods of installing AnyDesk on Ubuntu-based Linux distributions.**_

[AnyDesk][1] is a popular remote desktop software available for Linux, Windows, BSD, macOS and mobile platforms.

With this tool, you can remotely access other computer using AnyDesk or let someone else remotely access your system. Not everyone can access it just because two devices use AnyDesk. You have to accept the incoming connection and/or provide a password for secure connection.

This is helpful in providing tech support to friend, family, colleagues or even to the customers.

In this tutorial, I’ll show you both graphical and command line ways of installing AnyDesk on Ubuntu. You can use either method based on your preference. Both methods will install the same AnyDesk version on your Ubuntu system.

The same method should be applicable to Debian and other Debian and Ubuntu based distributions such as Linux Mint, Linux Lite etc.

Non-FOSS alert!

AnyDesk is not open source software. It is covered here because it is available on Linux and the article’s focus is on Linux.

### Method 1: Install AnyDesk on Ubuntu using terminal

[Open the terminal application][2] on your system. You’ll need a tool like wget to [download files in the terminal. For th][3]at, use the following command:

```
sudo apt update
sudo apt install wget
```

The next step now is to download the GPG key of AnyDesk repository and add it to your system’s trusted keys. This way, your system will trust the software coming from this [external repository][4].

```
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
```

You may ignore the deprecated warning about apt-key command for now. The next step is to add the AnyDesk repository to your system’s repository sources:

```
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
```

Update the package cache so that your system learns about the availability of new applications through the newly added repository.

```
sudo apt update
```

And now, you can install AnyDesk:

```
sudo apt install anydesk
```

Once that is done, you can start AnyDesk from the system menu or from the terminal itself:

```
anydesk
```

You can enjoy AnyDesk now.

![AnyDesk running in Ubuntu][5]

### Method 2: Install AnyDesk on Ubuntu graphically

If you are not comfortable with the command line, no worries. You can also install AnyDesk without going into the terminal.

You can download AnyDesk for Ubuntu from the official AnyDesk website:

[Download AnyDesk for Linux][6]

You’ll see a Download Now button. Click on it.

![Download AnyDesk][7]

When you click on the download button, it gives you options for various Linux distributions. Select the one for Ubuntu:

![Download the appropriate file][8]

It will download the DEB file of AnyDesk application. [Installing deb file][9] is easy. Either double click on it or right click and open with Software Install.

![Right click on deb file and open with software center][10]

Software Center application will be opened and you can install it from there.

![Installing AnyDesk in Ubuntu software center][11]

Once installed, search for it in the system menu and start from there.

![AnyDesk installed in Ubuntu][12]

That’s it. Not too hard, is it?

I am not going to show the steps for using AnyDesk. I think you already have some idea about that. If not, refer to [this article][13], please.

#### Troubleshooting tip

When I tried to run AnyDesk from the system menu, it didn’t start. So, I started it from the terminal and it showed me this error:

```
[email protected]:~$ anydesk
anydesk: error while loading shared libraries: libpangox-1.0.so.0: cannot open shared object file: No such file or directory
```

If you see the [error while loading shared libraries][14] message, you install the package it is complaining about. Here’s what I did in my case:

```
sudo apt install libpangox-1.0-0
```

That solved the issue for me and I hope it fixes for you as well.

If you have any questions related to this topic, please let me know in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-anydesk-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://anydesk.com/en
[2]: https://itsfoss.com/open-terminal-ubuntu/
[3]: https://itsfoss.com/download-files-from-linux-terminal/
[4]: https://itsfoss.com/adding-external-repositories-ubuntu/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/anydesk-running-in-ubuntu.png?resize=800%2C418&ssl=1
[6]: https://anydesk.com/en/downloads/linux
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/any-desk-ubuntu-download.webp?resize=800%2C312&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/any-desk-ubuntu-download-1.webp?resize=800%2C427&ssl=1
[9]: https://itsfoss.com/install-deb-files-ubuntu/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/install-anaydesk-ubuntu.png?resize=800%2C403&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/installing-anydesk-in-ubuntu-software-center.png?resize=781%2C405&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/anydesk-installed-in-ubuntu.png?resize=759%2C196&ssl=1
[13]: https://support.anydesk.com/Access
[14]: https://itsfoss.com/solve-open-shared-object-file-quick-tip/
