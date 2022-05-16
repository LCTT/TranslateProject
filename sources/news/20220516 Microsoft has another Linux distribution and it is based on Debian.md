[#]: subject: "Microsoft has another Linux distribution and it is based on Debian"
[#]: via: "https://news.itsfoss.com/microsoft-debian-distro/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Microsoft has another Linux distribution and it is based on Debian
======
Microsoft has been using a Debian-based Linux distro for Azure Cloud. We’re getting to know about it now!

![microsoft debian][1]

Microsoft utilizes Linux for a wide range of its projects. In recent years, you must have read a lot about WSL (or WSL2) and a Linux distribution made by Microsoft, i.e., **CBL (Common Base Linux) Mariner**.

Even with Windows 11, Microsoft keeps improving the experience with [WSL][2].

While CBL Mariner is used to power WSLg (the GUI part of WSL 2) and Azure, some recent press coverage (via [ZDNet][3]) uncovered another Linux distribution that Microsoft uses internally.

Microsoft sure loves Linux, right?

### CBL-Delridge: A Debian-based Linux distro

![][4]

Microsoft maintains a Debian-based distro, which is used to power Azure’s Cloud Shell. And it goes by the name “**CBL-Delridge**“.

Thanks to [Hayden Barnes][5], a senior engineering manager responsible for Windows containers at SUSE.

In one of his [older blog posts][6] in February 2022. He revealed more details about it while helping you build it and import it into WSL if required.

CBL-Delridge (CBL-D) is based on Debian 10 (Buster), unlike CBL-Mariner, built from scratch.

Not a surprise to see Debian being favored here. Even [Google ditched Ubuntu for Debian][7] for its in-house Linux distro gLinux.

Interestingly, Microsoft published the distro in 2020 for internal use (as per an [unofficial timeline of Microsoft’s open-source interactions][8] maintained by Hayden), and we’re getting to know about it in 2022.

![][9]

The CBL-Delridge also utilizes the same version number 10 (coincidentally) with the codename “Quinault.” Breaking down the name, ZDNet notes that Delridge is a district in West Seattle, and Quinault refers to a valley in the Olympic National Park in Washington State.

### Building CBL-Delridge

Unlike normal Linux distributions, you won’t find an image file to download publicly.

Considering the apt package repositories for CBL-D are public, you can build your image of CBL-D if you need to test it for any of your relevant requirements.

You can also import it into WSL. [Hayden’s blog post][10] explains using debootstrap to get started building the image and then importing it to WSL.

Note that the CBL-D is not exactly a replacement for Debian. So, you may not be able to find all your favorite packages. To know more about it, you can explore Hayden’s blog post.

What do you think about Microsoft’s Linux distributions for internal use? Have you tried any of them yet? Let me know your thoughts in the comments.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/microsoft-debian-distro/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/05/microsoft-new-debian-based-linux-distro.jpg
[2]: https://news.itsfoss.com/windows-11-wsl/
[3]: https://www.zdnet.com/article/surprise-theres-yet-another-microsoft-linux-distro-cbl-delridge/
[4]: https://news.itsfoss.com/wp-content/uploads/2022/05/azure-delridge.png
[5]: https://twitter.com/unixterminal
[6]: https://boxofcables.dev/building-cbl-d-microsofts-other-linux-distro/
[7]: https://itsfoss.com/goobuntu-glinux-google/
[8]: https://github.com/sirredbeard/microsoft-opensource
[9]: https://news.itsfoss.com/wp-content/uploads/2022/05/wsl-cbl-delridge-1024x600.png
[10]: https://boxofcables.dev/building-cbl-d-microsofts-other-linux-distro/
