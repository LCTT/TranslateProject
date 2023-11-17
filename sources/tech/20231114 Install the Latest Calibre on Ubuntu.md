[#]: subject: "Install the Latest Calibre on Ubuntu"
[#]: via: "https://itsfoss.com/install-calibre-ubuntu/"
[#]: author: "Community https://itsfoss.com/author/community/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install the Latest Calibre on Ubuntu
======

Calibre, the Swiss Army knife of e-book management, has long been a beloved tool for bibliophiles and digital bookworms alike.

While there are better (lighter) [e-Book readers][1], Calibre is a lot better at creating eBooks, converting their format and managing your eBook library. Basically, it's a complete solution for all your eBook needs.

In this tutorial, I'll discuss:

  * Installing Calibre from Ubuntu's repository (easy but may not be the latest version)
  * Installing Calibre using official binaries (slightly complicated but gives you the latest version)



### Method 1: Installing Calibre from Ubuntu's repositories

This method is easy to use but it may not give you the latest Calibre version. Which should be fine in most cases.

A stable version of Calibre is available from Ubuntu's universe repository. This repository is usually already enabled on most systems so all you have to do is to look for it in the software center or use the following command to install it:

```

    sudo apt install calibre

```

![][2]

Once installed, look for it in the system menu and start from there.

#### Removing Calibre

If you do not want to use it anymore, you can remove Calibre using the command below:

```

    sudo apt remove calibre

```

### Method 2: Get the latest Calibre version

[Calibre recommends][3] installing the official binary provided. This is to prevent users from using buggy/outdated packages. It includes private versions of all its dependencies. It supports 32-bit and 64-bit machines.

First, let's check if you have the required dependencies installed on our system:

```

    apt -qq list xdg-utils wget xz-utils python3

```

![][4]

If any of the above package is missing, install them.

Now, to install or upgrade, simply copy and paste the following command into a terminal and press Enter:

```

    sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

```

![][5]

**Possible Troubleshooting** : If you get an error about an untrusted certificate, that means your computer does not have any root certificates installed and so cannot download the installer securely. If you still want to proceed, pass the `--no-check-certificate` option to `wget`, like the command below:

```

    sudo -v && wget --no-check-certificate -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

```

#### Removing Calibre

If you followed the above binary installation method, you can uninstall Calibre by running `sudo calibre-uninstall`. Alternately, simply deleting the installation folder will remove 99% of the installed files.

![][6]

### Conclusion

In a world where digital reading is becoming increasingly prevalent, this open-source software stands as a testament to the power of community-driven innovation. Whether you're a seasoned e-book enthusiast or just dipping your toes into the world of digital literature, Calibre has something to offer to you.

While there is [extensive documentation available][7], we have a simple one that [teaches you to create an eBook in Calibre][8].

![][9]

_Enjoy Calibre on Ubuntu._

Written by Ishaan Bhimwal and edited by Abhishek Prakash.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-calibre-ubuntu/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/community/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-ebook-readers-linux/
[2]: https://itsfoss.com/content/images/2023/09/QPemD12.png
[3]: https://calibre-ebook.com/download_linux
[4]: https://itsfoss.com/content/images/2023/09/XnFwJIX.png
[5]: https://itsfoss.com/content/images/2023/09/UrBF54u.png
[6]: https://itsfoss.com/content/images/2023/09/i9KwV8E.png
[7]: https://calibre-ebook.com/help
[8]: https://itsfoss.com/create-ebook-calibre-linux/
[9]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
