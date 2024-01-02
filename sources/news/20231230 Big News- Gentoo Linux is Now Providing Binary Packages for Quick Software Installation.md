[#]: subject: "Big News! Gentoo Linux is Now Providing Binary Packages for Quick Software Installation"
[#]: via: "https://news.itsfoss.com/gentoo-binary-packages/"
[#]: author: "Abhishek https://news.itsfoss.com/author/root/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Big News! Gentoo Linux is Now Providing Binary Packages for Quick Software Installation
======
Gentoo has the year end gift for users with slow hardware.
If you don't see the big deal with it, you don't know Gentoo.

Debian has deb packages, Fedora has RPM packages. Even Arch Linux provides binary packages that are installed via the Pacman commands. Basically, these distributions build these packages from the source code and make them available to you. You use the package management system of your distro to get those binaries and install them on your system.

But enter into the Gentoo realm and things are entirely different here. Want to install any piece of software? You have to compile it from the source code.

Yes, you read that right. That's the reason so many memes exist on compiling and Gentoo.

![A blend of Gentoo and dad jokes][1]

The problem with compiling a software from its source code means it will take more computational power. Your CPU is going to be super busy when you compile software.

![][2]

And, of course, it takes some time to compile a software.

![Image source: r/linuxmemes][3]

### Now you can 'install' packages in Gentoo instead of compiling them

Gentoo's package manager, Portage, have had support for binary packages for years. It's just that there were no centralized repository with pre-compiled binary packages.

This is changing now as Gentoo is now offering binary packages for download and direct installation.

For most architectures, it will be limited to core system and weekly updates. However, for [amd64 and arm64][4], there is a huge library providing binaries for popular software like LibreOffice, Docker, Plasma, GNOME and more.

This will be really convenient for Gentoo users who are on low-end hardware or who don't want the manual compilation all the time.

I know you would rather have a lot of questions about using the binary packages in Gentoo. Check out the [official announcement from Gentoo][5] that covers things in detail.

![][6]

### Source based installation is not going anywhere

Don't outrage just yet my Gentoo comrade! You can still enjoy compiling from the source. That option is not going anywhere. You can still enjoy compiling like you used to. The binary packages are optional. They are not forced upon you.

Compiling each package has its benefits. The software is optimized for the system it runs on. That's the performance boost Gentoo users boast of.

![][7]

A low end computer takes longer to compile due to limited system resources but it also gets the performance optimization by building each software for the machine. Kind of a catch-22 scenario, if you ask me.

### Will you Gentoo?

I strongly believe that this will not only be convenient for the existing Gentoo users set but it will also help grow its user base. After all, what will a distrohopper do after installing Arch?

I used numerous memes in the news story here because it's the season to be jolly ☃️

Maybe you can spend your winter break installing (but not compiling) Gentoo 😜

Enjoy the festivities and the holidays!

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gentoo-binary-packages/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/content/images/2023/12/gentoo-ifi-it-moves-compile-it.png
[2]: https://news.itsfoss.com/content/images/2023/12/gentoo-compile-meme.png
[3]: https://news.itsfoss.com/content/images/2023/12/gentoo-compile-time-meme.webp
[4]: https://itsfoss.com/arm-aarch64-x86_64/
[5]: https://www.gentoo.org/news/2023/12/29/Gentoo-binary.html
[6]: https://www.gentoo.org/assets/img/logo/icon-192.png
[7]: https://news.itsfoss.com/content/images/2023/12/gentoo-faster-meme.png
