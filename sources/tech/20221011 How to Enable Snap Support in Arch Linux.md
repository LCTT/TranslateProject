 [#]: subject: "How to Enable Snap Support in Arch Linux"
[#]: via: "https://itsfoss.com/install-snap-arch-linux/"
[#]: author: "Pranav Krishna https://itsfoss.com/author/pranav/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Enable Snap Support in Arch Linux
======
Snap is a universal package format designed by Canonical, the parent company of Ubuntu. Some people do not like Snap, but it has some advantages.

Often, some applications are only available in the Snap format. This gives you a good enough reason to enable snap in Arch Linux.

I know that AUR has a vast collection of applications but the snap apps often come directly from the developers.

If you want to be able to install Snap applications in Arch Linux, you need to enable snap support first.

There are two ways to do it:

* Enable Snap support using an AUR helper (easier)
* Enable Snap support manually by getting the packages from AUR

Let’s see how to do it.

### Method 1. Use an AUR helper to enable Snap

Snap is available in the Arch User Repository as the *snapd* package. You can install it easily using an AUR helper.

There are [many AUR helpers][1] out there, but *yay* is what I prefer because it has syntax similar to the [pacman command][2].

If you don’t have an AUR installed already, install Yay using the command below (needs git beforehand):

```
git clone https://aur.archlinux.org/yay

cd yay

makepkg -si
```

![Installing yay][3]

Now that *yay* is installed, you can install snapd by:

```
yay -Sy snapd
```

![Installing snapd from AUR using yay][4]

Yay enables automatic updating of snapd whenever you [update your Arch Linux][5] system.

### Verify that snap works

To test if snap works fine, install and run the *hello-world* snap package.

```
sudo snap install hello-world

hello-world
(or)
sudo snap run hello-world
```

![The hello-world snap package executes][6]

If it runs fine, then you can install other snap packages easily.

### Method 2. Manually build the snap package from AUR

If you do not want to use an AUR helper, you can still get the snapd from the AUR. Let me show the detailed procedure.

You will need to install some build tools first.

```
sudo pacman -Sy git go go-tools python-docutils
```

![Installing Dependencies for snap][7]

Once you’re done with installing the dependencies, now you can clone the AUR directory, which goes as:

```
git clone https://aur.archlinux.org/snapd

cd snapd
```

![Cloning the repository][8]

Then make the snapd package:

```
makepkg -si
```

Enter yes when it asks to install other dependency packages.

![snapd manual install makepkg][9]

You have installed the snapd daemon. However, it needs to be enabled to auto start at boot time.

```
sudo systemctl enable snapd --now

sudo systemctl enable snapd.apparmor --now #start snap applications

sudo ln -s /var/lib/snapd/snap /snap #optional: classic snap support
```

![Enable Snap at startup][10]

The major disadvantage of manually building a package is that you have to manually build every time a new update kicks in. Using an AUR helper solves that problem for us.

### Conclusion

I prefer pacman and AUR in Arch Linux. It’s rare to see an application that is not in AUR but available in some other formats. Still, using snap could be advantageous in some conditions where you want it directly from the source, like [installing Spotify on Arch][11] for example.

I hope you find this tutorial helpful. Let me know if you have any questions.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-snap-arch-linux/

作者：[Pranav Krishna][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pranav/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/best-aur-helpers/
[2]: https://itsfoss.com/pacman-command/
[3]: https://itsfoss.com/wp-content/uploads/2022/10/yay-makepkg.png
[4]: https://itsfoss.com/wp-content/uploads/2022/10/yay-install-snapd.png
[5]: https://itsfoss.com/update-arch-linux/
[6]: https://itsfoss.com/wp-content/uploads/2022/10/snap-hello-world-1.png
[7]: https://itsfoss.com/wp-content/uploads/2022/10/snapd-manual-install-dependencies.png
[8]: https://itsfoss.com/wp-content/uploads/2022/10/snapd-manual-install-clone.png
[9]: https://itsfoss.com/wp-content/uploads/2022/10/snapd-manual-install-makepkg-800x460.png
[10]: https://itsfoss.com/wp-content/uploads/2022/10/enable-snapd-startup-2.png
[11]: https://itsfoss.com/install-spotify-arch/
