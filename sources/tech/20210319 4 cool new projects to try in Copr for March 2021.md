[#]: subject: (4 cool new projects to try in Copr for March 2021)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-march-2021/)
[#]: author: (Jakub Kadlčík https://fedoramagazine.org/author/frostyx/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

4 cool new projects to try in Copr for March 2021
======

![][1]

Copr is a [collection][2] of personal repositories for software that isn’t carried in Fedora Linux. Some software doesn’t conform to standards that allow easy packaging. Or it may not meet other Fedora standards, despite being free and open-source. Copr can offer these projects outside the Fedora set of packages. Software in Copr isn’t supported by Fedora infrastructure or signed by the project. However, it can be a neat way to try new or experimental software.

This article presents a few new and interesting projects in Copr. If you’re new to using Copr, see the [Copr User Documentation][3] for how to get started.

### [][4]

### Ytfzf

[Ytfzf][5] is a simple command-line tool for searching and watching YouTube videos. It provides a fast and intuitive interface built around fuzzy find utility [fzf][6]. It uses [youtube-dl][7] to download selected videos and opens an external video player to watch them. Because of this approach, _ytfzf_ is significantly less resource-heavy than a web browser with YouTube. It supports thumbnails (via [ueberzug][8]), history saving, queueing multiple videos or downloading them for later, channel subscriptions, and other handy features. Thanks to tools like [dmenu][9] or [rofi][10], it can even be used outside the terminal.

![][11]

#### [][12] Installation instructions

The [repo][13] currently provides Ytfzf for Fedora 33 and 34. To install it, use these commands:

```
sudo dnf copr enable bhoman/ytfzf
sudo dnf install ytfzf
```

### [][14] Gemini clients

Have you ever wondered what your internet browsing experience would be if the World Wide Web went an entirely different route and didn’t adopt CSS and client-side scripting? [Gemini][15] is a modern alternative to the HTTPS protocol, although it doesn’t intend to replace it. The [stenstorp/gemini][16] Copr project provides various clients for browsing Gemini _websites_, namely [Castor][17], [Dragonstone][18], [Kristall][19], and [Lagrange][20].

The [Gemini][21] site provides a list of some hosts that use this protocol. Using Castor to visit this site is shown here:

![][22]

#### [][23] Installation instructions

The [repo][16] currently provides Gemini clients for Fedora 32, 33, 34, and Fedora Rawhide. Also available for EPEL 7 and 8, and CentOS Stream. To install a browser, chose from the install commands shown here:

```
sudo dnf copr enable stenstorp/gemini

sudo dnf install castor
sudo dnf install dragonstone
sudo dnf install kristall
sudo dnf install lagrange
```

### [][24] Ly

[Ly][25] is a lightweight login manager for Linux and BSD. It features a ncurses-like text-based user interface. Theoretically, it should support all X desktop environments and window managers (many of them [were tested][26]). Ly also provides basic Wayland support (Sway works very well). Somewhere in the configuration, there is an easter egg option to enable the famous [PSX DOOM fire][27] animation in the background, which on its own, is worth checking out.

![][28]

#### [][29] Installation instructions

The [repo][30] currently provides Ly for Fedora 32, 33, and Fedora Rawhide. To install it, use these commands:

```
sudo dnf copr enable dhalucario/ly
sudo dnf install ly
```

Before setting up Ly to be your system login screen, run _ly_ command in the terminal to make sure it works properly. Then proceed with disabling your current login manager and enabling Ly instead.

```
sudo systemctl disable gdm
sudo systemctl enable ly
```

Finally, restart your computer for the changes to take an effect.

### [][31] AWS CLI v2

[AWS CLI v2][32] brings a steady and methodical evolution based on the community feedback, rather than a massive redesign of the original client. It introduces new mechanisms for configuring credentials and now allows the user to import credentials from the _.csv_ files generated in the AWS Console. It also provides support for AWS SSO. Other big improvements are server-side auto-completion, and interactive parameters generation. A fresh new feature is interactive wizards, which provide a higher level of abstraction and combines multiple AWS API calls to create, update, or delete AWS resources.

![][33]

#### [][34] Installation instructions

The [repo][35] currently provides AWS CLI v2 for Fedora Linux 32, 33, 34, and Fedora Rawhide. To install it, use these commands:

```
sudo dnf copr enable spot/aws-cli-2
sudo dnf install aws-cli-2
```

Naturally, access to an AWS account is necessary.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-march-2021/

作者：[Jakub Kadlčík][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/frostyx/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/10/4-copr-945x400-1-816x345.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/user_documentation.html
[4]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#droidcam
[5]: https://github.com/pystardust/ytfzf
[6]: https://github.com/junegunn/fzf
[7]: http://ytdl-org.github.io/youtube-dl/
[8]: https://github.com/seebye/ueberzug
[9]: https://tools.suckless.org/dmenu/
[10]: https://github.com/davatorium/rofi
[11]: https://fedoramagazine.org/wp-content/uploads/2021/03/ytfzf.png
[12]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#installation-instructions
[13]: https://copr.fedorainfracloud.org/coprs/bhoman/ytfzf/
[14]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#gemini-clients
[15]: https://gemini.circumlunar.space/
[16]: https://copr.fedorainfracloud.org/coprs/stenstorp/gemini/
[17]: https://git.sr.ht/~julienxx/castor
[18]: https://gitlab.com/baschdel/dragonstone
[19]: https://kristall.random-projects.net/
[20]: https://github.com/skyjake/lagrange
[21]: https://gemini.circumlunar.space/servers/
[22]: https://fedoramagazine.org/wp-content/uploads/2021/03/gemini.png
[23]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#installation-instructions-1
[24]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#ly
[25]: https://github.com/nullgemm/ly
[26]: https://github.com/nullgemm/ly#support
[27]: https://fabiensanglard.net/doom_fire_psx/index.html
[28]: https://fedoramagazine.org/wp-content/uploads/2021/03/ly.png
[29]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#installation-instructions-2
[30]: https://copr.fedorainfracloud.org/coprs/dhalucario/ly/
[31]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#aws-cli-v2
[32]: https://aws.amazon.com/blogs/developer/aws-cli-v2-is-now-generally-available/
[33]: https://fedoramagazine.org/wp-content/uploads/2021/03/aws-cli-2.png
[34]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#installation-instructions-3
[35]: https://copr.fedorainfracloud.org/coprs/spot/aws-cli-2/
