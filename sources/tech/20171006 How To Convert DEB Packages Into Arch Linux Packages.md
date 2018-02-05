How To Convert DEB Packages Into Arch Linux Packages
======
![](https://www.ostechnix.com/wp-content/uploads/2017/10/Debtap-720x340.png)

We already learned how to [**build packages for multiple platforms**][1], and how to **[build packages from source][2]**. Today, we are going to learn how to convert DEB packages into Arch Linux packages. You might ask, **AUR** is the large software repository on the planet, and almost all software are available in it. Why would I need to convert a DEB package into Arch Linux package? True! However, some packages cannot be compiled (closed source packages) or cannot be built from AUR for various reasons like error during compiling or unavailable files. Or, the developer is too lazy to build a package in AUR or s/he doesn 't like to create an AUR package. In such cases, we can use this quick and dirty method to convert DEB packages into Arch Linux packages.

### Debtap - Convert DEB Packages Into Arch Linux Packages

For this purpose, we are going to use an utility called **" Debtap"**. It stands **DEB** **T** o **A** rch (Linux) **P** ackage. Debtap is available in AUR, so you can install it using the AUR helper tools such as [**Pacaur**][3], [**Packer**][4], or [**Yaourt**][5].

To unstall debtap using pacaur, run:
```
pacaur -S debtap
```

Using Packer:
```
packer -S debtap
```

Using Yaourt:
```
yaourt -S debtap
```

Also, your Arch system should have **bash,** **binutils** , **pkgfile** and **fakeroot ** packages installed.

After installing Debtap and all above mentioned dependencies, run the following command to create/update pkgfile and debtap database.
```
sudo debtap -u
```

Sample output would be:
```
==> Synchronizing pkgfile database...
:: Updating 6 repos...
 download complete: archlinuxfr [ 151.7 KiB 67.5K/s 5 remaining]
 download complete: multilib [ 319.5 KiB 36.2K/s 4 remaining]
 download complete: core [ 707.7 KiB 49.5K/s 3 remaining]
 download complete: testing [ 1716.3 KiB 58.2K/s 2 remaining]
 download complete: extra [ 7.4 MiB 109K/s 1 remaining]
 download complete: community [ 16.9 MiB 131K/s 0 remaining]
:: download complete in 131.47s < 27.1 MiB 211K/s 6 files >
:: waiting for 1 process to finish repacking repos...
==> Synchronizing debtap database...
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 34.1M 100 34.1M 0 0 206k 0 0:02:49 0:02:49 --:--:-- 180k
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 814k 100 814k 0 0 101k 0 0:00:08 0:00:08 --:--:-- 113k
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 120k 100 120k 0 0 61575 0 0:00:02 0:00:02 --:--:-- 52381
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 35.4M 100 35.4M 0 0 175k 0 0:03:27 0:03:27 --:--:-- 257k
==> Downloading latest virtual packages list...
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 149 0 149 0 0 49 0 --:--:-- 0:00:03 --:--:-- 44
100 11890 0 11890 0 0 2378 0 --:--:-- 0:00:05 --:--:-- 8456
==> Downloading latest AUR packages list...
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 264k 0 264k 0 0 30128 0 --:--:-- 0:00:09 --:--:-- 74410
==> Generating base group packages list...
==> All steps successfully completed!
```

You must run the above command at least once.

Now, it's time for package conversion.

To convert any DEB package, say **Quadrapassel** , to Arch Linux package using debtap, do:
```
debtap quadrapassel_3.22.0-1.1_arm64.deb
```

The above command will convert the given .deb file into a Arch Linux package. You will be asked to enter the name of the package maintainer and license. Just enter them and hit ENTER key to start the conversion process.

The package conversion will take from a few seconds to several minutes depending upon your CPU speed. Grab a cup of coffee.

Sample output would be:
```
==> Extracting package data...
==> Fixing possible directories structure differencies...
==> Generating .PKGINFO file...

:: Enter Packager name:
**quadrapassel**

:: Enter package license (you can enter multiple licenses comma separated):
**GPL**

*** Creation of .PKGINFO file in progress. It may take a few minutes, please wait...

Warning: These dependencies (depend = fields) could not be translated into Arch Linux packages names:
gsettings-backend

== > Checking and generating .INSTALL file (if necessary)...

:: If you want to edit .PKGINFO and .INSTALL files (in this order), press (1) For vi (2) For nano (3) For default editor (4) For a custom editor or any other key to continue:

==> Generating .MTREE file...

==> Creating final package...
==> Package successfully created!
==> Removing leftover files...
```

**Note:** Quadrapassel package is already available in the Arch Linux official repositories. I used it just for demonstration purpose.

If you don't want to answer any questions during package conversion, use **-q** flag to bypass all questions, except for editing metadata file(s).
```
debtap -q quadrapassel_3.22.0-1.1_arm64.deb
```

To bypass all questions (not recommended though), use -Q flag.
```
debtap -Q quadrapassel_3.22.0-1.1_arm64.deb
```

Once the conversion is done, you can install the newly converted package using "pacman" in your Arch system as shown below.
```
sudo pacman -U <package-name>
```

To display the help section, use **-h** flag:
```
$ debtap -h
Syntax: debtap [options] package_filename

Options:

 -h --h -help --help Prints this help message
 -u --u -update --update Update debtap database
 -q --q -quiet --quiet Bypass all questions, except for editing metadata file(s)
 -Q --Q -Quiet --Quiet Bypass all questions (not recommended)
 -s --s -pseudo --pseudo Create a pseudo-64-bit package from a 32-bit .deb package
 -w --w -wipeout --wipeout Wipeout versions from all dependencies, conflicts etc.
 -p --p -pkgbuild --pkgbuild Additionally generate a PKGBUILD file
 -P --P -Pkgbuild --Pkgbuild Generate a PKGBUILD file only
```

And, that's all for now folks. Hope this utility helps. If you find our guides useful, please spend a moment to share them on your social, professional networks and support OSTechNix!

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/convert-deb-packages-arch-linux-packages/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/build-linux-packages-multiple-platforms-easily/
[2]:https://www.ostechnix.com/build-packages-source-using-checkinstall/
[3]:https://www.ostechnix.com/install-pacaur-arch-linux/
[4]:https://www.ostechnix.com/install-packer-arch-linux-2/
[5]:https://www.ostechnix.com/install-yaourt-arch-linux/
