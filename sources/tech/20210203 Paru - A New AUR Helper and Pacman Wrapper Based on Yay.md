[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Paru – A New AUR Helper and Pacman Wrapper Based on Yay)
[#]: via: (https://itsfoss.com/paru-aur-helper/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

Paru – A New AUR Helper and Pacman Wrapper Based on Yay
======

One of the [main reasons that a user chooses Arch Linux][1] or an [Arch based Linux distribution][2] is the [Arch User repository (AUR)][3].

Unfortunately, [pacman][4], the package manager of Arch, can’t access the AUR in a similar way to the official repositories. The packages in AUR are in the form of [PKGBUILD][5] and require a manual process to be built.

An AUR helper can automate this process. Without any doubt [yay][6] is one of the most popular and highly favoured AUR helper.

Recently [Morganamilo][7], one of the two developers of yay, [announced][8] that is stepping away from maintaining yay and starting his own AUR helper called [paru][9]. Paru is written in [Rust][10] compared to yay that is written in [Go][11] and its design is based on yay.

Please note that yay hasn’t reach the end of life and is still being actively maintained by [Jguer][12]. He also [commented][13] that paru may be suitable for users that looking for a feature rich AUR helper; thus I would recommend giving it a try.

### Installing Paru AUR helper

To install paru, open your terminal and type the following commands one by one.

```
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

Now that you have it installed, let’s see how to use it.

### Essential commands to use Paru AUR helper

In my opinion these are the most essential commands of paru. You can explore more on the official repository on [GitHub][9].

  * **paru &lt;userinput&gt;** : Search and install &lt;userinput&gt;.
  * **paru —** : Alias for paru -Syu
  * **paru -Sua** : Upgrade AUR packages only
  * **paru -Qua** : Print available AUR updates
  * **paru -Gc &lt;userinput&gt;** : Print the AUR comments of &lt;userinput&gt;



### Using Paru AUR helper to its full extent

You can access the [changelog][14] of paru on GitHub for the full changelog history or you can see the changes from yay at the [first release][15].

#### Enable colour in Paru

To enable colour in paru, you have to enable it first in pacman. All the [configuration files][16] are in /etc directory. In this example, I [use Nano text editor][17] but, you may use any [terminal-based text editor][18] of your choice.

```
sudo nano /etc/pacman.conf
```

Once you open the pacman configuration file, uncomment the “Color” to enable this feature.

![][19]

#### **Flip search order**

The most relevant package according to your search term is normally displayed on the top of the search result. In paru, you can flip the search order to make your search easier.

Similar to the previous example, open the paru configuration file:

```
sudo nano /etc/paru.conf
```

Uncomment the “BottomUp” term and save the file.

![][20]

As you can see the order is flipped and the first package appears on the bottom.

![][21]

#### **Edit PKGBUILDs** (For advanced user)

If you are an experienced Linux user, you can edit AUR packages through paru. To do so, you need to enable the feature from the paru configuration file and set the file manager of your choice.

In this example I will use the default in the configuration file i.e. the vifm file manager. If you haven’t used it you may need to install it.

```
sudo pacman -S vifm
sudo nano /etc/paru.conf
```

Open the configuration file and uncomment as shown below.

![][22]

Let’s go back to the [Google Calendar][23] AUR package and try to install it. You will be prompted to review the package. Type yes and click enter.

![][24]

Choose the PKGBUILD from the file manager and hit enter to view the package.

![][25]

Any change that you make will be permanent and the next time you upgrade the package, your changes will be merged with the upstream package.

![][26]

### Conclusion

Paru is another interesting addition to the [AUR helpers family][27] with a promising future. At this point I wouldn’t suggest replacing yay as it is still maintained but definitely give paru a try. You can have both of them installed to your system and come to your own conclusions.

To get the latest [Linux news][28], subscribe to our social media to be among the first to get them whilst they are fresh!

--------------------------------------------------------------------------------

via: https://itsfoss.com/paru-aur-helper/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-arch-linux/
[2]: https://itsfoss.com/arch-based-linux-distros/
[3]: https://itsfoss.com/aur-arch-linux/
[4]: https://itsfoss.com/pacman-command/
[5]: https://wiki.archlinux.org/index.php/PKGBUILD
[6]: https://news.itsfoss.com/qt-6-released/
[7]: https://github.com/Morganamilo
[8]: https://www.reddit.com/r/archlinux/comments/jjn1c1/paru_v100_and_stepping_away_from_yay/
[9]: https://github.com/Morganamilo/paru
[10]: https://www.rust-lang.org/
[11]: https://golang.org/
[12]: https://github.com/Jguer
[13]: https://aur.archlinux.org/packages/yay/#pinned-788241
[14]: https://github.com/Morganamilo/paru/releases
[15]: https://github.com/Morganamilo/paru/releases/tag/v1.0.0
[16]: https://linuxhandbook.com/linux-directory-structure/#-etc-configuration-files
[17]: https://itsfoss.com/nano-editor-guide/
[18]: https://itsfoss.com/command-line-text-editors-linux/
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/pacman.conf-color.png?resize=800%2C480&ssl=1
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/paru.conf-bottomup.png?resize=800%2C480&ssl=1
[21]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/paru.conf-bottomup-2.png?resize=800%2C480&ssl=1
[22]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/paru.conf-vifm.png?resize=732%2C439&ssl=1
[23]: https://aur.archlinux.org/packages/gcalcli/
[24]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/paru-proceed-for-review.png?resize=800%2C480&ssl=1
[25]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/paru-proceed-for-review-2.png?resize=800%2C480&ssl=1
[26]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/paru-proceed-for-review-3.png?resize=800%2C480&ssl=1
[27]: https://itsfoss.com/best-aur-helpers/
[28]: https://news.itsfoss.com/
