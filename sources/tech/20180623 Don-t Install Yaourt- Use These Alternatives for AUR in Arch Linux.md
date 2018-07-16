Don’t Install Yaourt! Use These Alternatives for AUR in Arch Linux
======
**Brief: Yaourt had been the most popular AUR helper, but it is not being developed anymore. In this article, we list out some of the best alternatives to Yaourt for Arch based Linux distributions. **

[Arch User Repository][1] popularly known as AUR is the community-driven software repository for Arch users. Debian/Ubuntu users can think of AUR as the equivalent of PPA.

It contains the packages that are not directly endorsed by [Arch Linux][2]. If someone develops a software or package for Arch Linux, it can be provided through this community repositories. This enables the end-user to access more software than what they get by default.

So, how do you use AUR then? Well, you need a different tool to install software from AUR. Arch’s package manager [pacman][3] doesn’t support it directly. These ‘special tools’ are called [AUR helpers][4].

Yaourt (Yet AnOther User Repository Tool) is/was a wrapper for pacman that helps to install AUR packages on Arch Linux. It uses the same syntax as pacman. Yaourt has great support for Arch User Repository for searching, installing, conflict resolution and dependency maintenance.

However, Yaourt development has been slow lately and is [listed][5] as “Discontinued or problematic” on Arch Wiki. [Many Arch User believe it’s not secure][6] and hence go towards a different AUR helper.

![AUR Helpers other than Yaourt][7]

In this article, we will see the best Yaourt alternatives that you can use for installing software from AUR.

### Best AUR helpers to use AUR

I am deliberating omitting some of the other popular AUR helpers like trizen or packer because they too have been flagged as ‘discontinued or problematic’.

#### 1\. aurman

[aurman][8] is one of the best AUR helpers and serves pretty well as an alternative to Yaourt. It has almost similar syntax to pacman with support for all pacman operations. You can search the AUR, resolve dependencies, check PKGBUILD content before a package build etc.

##### Features of aurman

  * aurman supports all pacman operations and incorporates reliable dependency resolving, conflict detection and split package support.
  * Threaded sudo loop runs in the background saving you from entering your password each time.
  * Provides development package support and distincts between explictily and inlicitly installed packages.
  * Support for searching of AUR packages and repositories.
  * You can see and edit the PKGBUILDs before starting AUR package build.
  * It can also be used as a standalone [dependency solver][9].



##### Installing aurman
```
git clone https://aur.archlinux.org/aurman.git
cd aurman
makepkg -si

```

##### Using aurman

Searching for an application through aurman in Arch User Repository is done in the following manner:
```
aurman -Ss <package-name>

```

Installing an application using aurman:
```
aurman -S &lt;package-name>

```

#### 2\. yay

[yay][10] is the next best AUR helper written in Go with the objective of providing an interface of pacman with minimal user input, yaourt like search and with almost no dependencies.

##### Features of yay

  * yay provides AUR table completion and download the PKGBUILD from ABS or AUR.
  * Supports search narrowing and no sourcing of PKGBUILD.
  * The binary has no additional dependencies than pacman.
  * Provides advanced dependency solver and remove make dependencies at the end of the build process.
  * Supports colored output when you enable Color option in the /etc/pacman.conf file.
  * It can be made to support only AUR package or only repo packages.



##### Installing yay

You can install yay by cloning the git repo and building it. Use the below command to install yay in Arch Linux :
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

```

##### Using yay

Searching an application through Yay in AUR:
```
yay -Ss <package-name>

```

Installing an application:
```
yay -S <package-name>

```

#### 3\. pakku

[Pakku][11] is another pacman wrapper which is still in its initial stage. However, just because its new doesn’t mean its lacking any of the features supported by other AUR helper. It does its job pretty nice and along with searching and installing applications from AUR, it removes dependencies after a build.

##### Features of pakku

  * Searching and installing packages from Arch User Repository.
  * Viewing files and changes between builds.
  * Building packages from official repositories and removing make dependencies after a build.
  * PKGBUILD retrieving and Pacman integration.
  * Pacman-like user interface and pacman options supports.
  * Pacman configuration supports and no PKGBUILD sourcing.



##### Installing pakku
```
git clone https://aur.archlinux.org/pakku.git
cd pakku
makepkg -si

```

##### Using pakku

You can search an application from AUR using below command.:
```
pakku -Ss spotify

```

And then the package can be installed similar to pacman:
```
pakku -S spotify

```

#### 4\. aurutils

[aurutils][12] is basically a collection of scripts that automates the usage of Arch User Repository. It can search AUR, check updates for different applications installed and settle up dependencies issues.

##### Features of aurutils

  * aurutils uses a local repository which gives it a benefit of pacman file support, and all packages works with –asdeps.
  * There can be multiple repos for different tasks.
  * Update local repository in one go with aursync -u
  * pkgbase, long format and raw support for aursearch
  * Ability to ignore package



##### Installing aurutils
```
git clone https://aur.archlinux.org/aurutils.git
cd aurutils
makepkg -si

```

##### Using aurutils

Searching an application via aurutils:
```
aurutils -Ss <package-name>

```

Installing a package from AUR:
```
aurutils -S <package-name>

```

All of these packages can directly be installed if you are already using Yaourt or any other AUR helper.

#### Final Words on AUR helpers

Arch Linux has some [more AUR helper][4] that can automate certain tasks for the Arch User Repository. Many users are still using Yaourt for their AUR-work and

The choice differs for each user and we would like to know which one you use for your Arch Linux. Let us know in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/best-aur-helpers/

作者：[Ambarish Kumar][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/ambarish/
[1]:https://wiki.archlinux.org/index.php/Arch_User_Repository
[2]:https://www.archlinux.org/
[3]:https://wiki.archlinux.org/index.php/pacman
[4]:https://wiki.archlinux.org/index.php/AUR_helpers
[5]:https://wiki.archlinux.org/index.php/AUR_helpers#Comparison_table
[6]:https://www.reddit.com/r/archlinux/comments/4azqyb/whats_so_bad_with_yaourt/
[7]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/06/no-yaourt-arch-800x450.jpeg
[8]:https://github.com/polygamma/aurman
[9]:https://github.com/polygamma/aurman/wiki/Using-aurman-as-dependency-solver
[10]:https://github.com/Jguer/yay
[11]:https://github.com/kitsunyan/pakku
[12]:https://github.com/AladW/aurutils
