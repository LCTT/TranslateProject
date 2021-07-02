[#]: subject: (Creating a PKGBUILD to Make Packages for Arch Linux)
[#]: via: (https://itsfoss.com/create-pkgbuild/)
[#]: author: (Hunter Wittenborn https://itsfoss.com/author/hunter/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Creating a PKGBUILD to Make Packages for Arch Linux
======

PKGBUILD files are how packages are built and created for Arch Linux and its derivatives such as Manjaro.

You may have even come across them a bit yourself if you’ve ever used the [AUR][1], Arch Linux’s user-curated repository of PKGBUILDs.

But how exactly do you go from a PKGBUILD to an installable package? What exactly is going on between the two, and how can you make them for your own packages? You’ll learn them in this article.

### PKGBUILD basics

For those who are familiar with Bash or other shells, you’ll be delighted to know, if you didn’t already, that a PKGBUILD is pretty much just a shell script with some variables.

PKGBUILD files consist of variables and functions, all of which are used to define the package itself, and how to build it.

To create a package from a PKGBUILD, the makepkg command line utility is used. After obtaining a PKGBUILD, you simply run `makepkg` inside the directory containing the PKGBUILD, and voila, you have an installable package!

![][2]

In this tutorial, you’ll be going over the package I just made, which prints “Hello World!” when run:

![][3]

### Getting set up

To follow along with this tutorial, you need to create a couple of files.

First, you need to make a file called **PKGBUILD**. If it wasn’t already made clear, this will serve as the “recipe” for building your package.

The other file you’ll need to make is a file called **hello-world.sh**. I’ll explain its purpose a bit later.

You can create both of these files with a single command as well.

```
touch PKGBUILD hello-world.sh
```

You can check that the files were created with the ls command:

![][4]

And you’re ready to go!

### Setting up your PKGBUILD file

**Instead of having you copy paste the whole file, I’ll be going over entering every line with you, so you can better understand the purpose of everything that’s happening. If you don’t prefer to learn this way, I’d highly recommend the** [Arch Wiki article][5] _**on creating packages for Arch Linux.**_

_**This article also doesn’t go over every single option you can set in a PKGBUILD, but rather some commonly used ones so you can get going as quickly as possible.**_

With that out of the way, open up your text editor, and let’s get straight into it!

#### pkgname

First things first, the pkgname variable. This is what defines the name of your package when installing, and how [Arch Linux’s package manager pacman][6] keeps track of the package.

The format of this variable (and some others) takes the form of variable=value, with the variable name on the left, the value of the variable on the right, separated by an equals sign.

To set the package name, enter the following into the PKGBUILD:

```
pkgname="hello-world"
```

  * To set a different package name, replace `hello-world` with the name of the package.
  * This doesn’t set the command used to run the program. That’s handled a bit below in the `package()` section.



#### pkgver

As is stated in the variable name itself, this sets the version of your package (i.e. 1.0.0). This is useful when a user updates their system, as setting a higher version will result in the user being prompted for an upgrade.

To set, enter the following into the PKGBUILD (after the previous line):

```
pkgver="1.0.0"
```

#### pkgrel

This is related to the pkgver variable, and isn’t normally important to know about. Like the pkgver variable though, it will notify users for upgrades if it’s moved to a higher number.

It serves for any changes that require the pkgver to remain the same, such as any changes to the PKGBUILD itself. This would be useful if you’ve created a PKGBUILD for a program you use (and want to keep the version the same as the package’s), and you need to fix a bug in the PKGBUILD itself.

To set the variable, enter the following in the PKGBUILD:

```
pkgver="1"
```

This variable should **always** start at 1, and then move up one at a time. When the **pkgver** itself moves up, this can (and should) be reset to 1, as the pkgver itself will notify users that upgrades are available.

#### pkgdesc

This will set the description of the package, which is used to help better identify the package.

To set it, just put the description inside of quotation marks:

```
pkgdesc="Hello world in your terminal!"
```

#### arch

This variable sets the [architecture][7] the package is compatible with. It’s fine if you don’t understand what an architecture is, as it’s pretty much useless in most cases.

Regardless, makepkg still needs it to be set so it knows the package is compatible with our system.

This variable supports setting multiple values, so makepkg requires a different syntax as shown below.

To set it, enter the following in the PKGBUILD:

```
arch=("x86_64")
```

If you were to set multiple values for this, you would separate each value with a space and quotation marks like so: **arch=(“x86_x64” “arm”)**

#### depends

This lists all of the packages that our package needs to function. Like **arch**, it can also contain multiple values, and thus must use the parenthesis syntax.

Since our package won’t have any dependencies, we don’t have to enter this field in the PKGBUILD. If our package did have dependencies however, we’d just use the same syntax as **arch**.

#### optdepends

This lists packages that aren’t required to function, but that are needed for extra functionality.

This follows the same syntax as **depends**.

#### conflicts

This tells pacman what packages would cause our package to act up or behave in a way we wouldn’t want.

Any package listed here would be uninstalled before ours is installed.

This follows the same syntax as **depends** as well.

#### license

This defines the [software license][8] that your program is licensed under. The [Arch Wiki][9] has some info if you need help choosing a license. Setting this to `custom` will work if you don’t know what to set this to.

This takes the same syntax as **arch** and **depends**:

```
license=("custom")
```

#### source

This is how makepkg knows what files to use to build our package. This can contain a variety of different kinds of sources, including local files and URLs.

When adding local files, enter the file’s name relative to the PKGBUILD i.e. consider the following directory layout:

```
PKGBUILD
file.txt
src/file.sh
```

If you wanted to include **file.sh** in our PKGBUILD, you would enter **src/file.sh** as its name.

When entering URLs, you simply enter the full URL, i.e. <https://mirrors.creativecommons.org/presskit/logos/cc.logo.large.png>.

Your package only needs the hello-world.sh file, and since it’s in the same directory as the PKGBUILD, you just type its name as the value for **source**.

This variable also uses the same syntax as **arch** and **depends**:

```
source=("hello-world.sh")
```

#### sha512sums

This is used to verify that the files in **source** haven’t been modified or downloaded incorrectly. Information on obtaining the values for this can be found in the [Arch Wiki article on PKGBUILDs][10].

If you’d rather just not set this (or you just don’t need to, i.e. for local files), you can just enter SKIP for every file in the **source** variable:

```
sha512sums=("SKIP")
```

#### package()

This is the last, and most important part to actually making our package. It’s important to know two variables when working with this:

  * **${srcdir}**: This is where makepkg puts the files in the **source** variable. This is the directory where you can interact with the files, and do any other needed modification to the files.


  * ${pkgdir}: This is where we place the files that will be installed on our system.
The folder structure for ${pkgdir} is set up as if it was on an actual system (i.e. ${pkgdir}/usr/bin/hello-world would create the file /usr/bin/hello-world when installing with pacman.



package() contains a list of commands used create a package.

So, if (hypothetically) you needed to have a file that reads Linux is superior to Windows at /usr/share/motto.txt, you would run something like this:

```
package() {
  mkdir -p "${pkgdir}/usr/share"
  echo "Linux is superior to Windows" | tee "${pkgdir}/usr/share/motto.txt"
}
```

A few notes on the above command:

  * ${pkgdir} contains **no** directories inside it at first. If you skipped the [mkdir command][11], tee would output an error saying the directory doesn’t exist.


  * When specifying directories, **always** prepend them with the **${pkgdir}** or **${srcdir}** variable. Entering something like /usr/share/motto.txt without such would point to the literal directory /usr/share/motto.txt on your currently running system.



For your PKGBUILD, you’re going to place the file hello-world.sh at /usr/bin/hello-world on your target system. You’ll also be making the file say “Hello to you!” when ran.

To do so, enter the following into your PKGBUILD:

```
package() {
  echo 'Hello to you!' > "${srcdir}/hello-world.sh"
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/hello-world.sh" "${pkgdir}/usr/bin/hello-world"
  chmod +x "${pkgdir}/usr/bin/hello-world"
}
```

And you’re done! **Build and install the package with makepkg -si**, and then run hello-world in your terminal to see its output.

![][12]

### Wrapping Up

And just like that, you have made your first PKGBUILD! You’re on your way to making actual packages for yourself, and maybe even the AUR.

Got any questions, or something just not working right? Feel free to post it in the comment section below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/create-pkgbuild/

作者：[Hunter Wittenborn][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/hunter/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/aur-arch-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/image.png?resize=748%2C689&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/image-2.png?resize=682%2C260&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/image-3.png?resize=682%2C265&ssl=1
[5]: https://wiki.archlinux.org/title/Creating_packages
[6]: https://itsfoss.com/pacman-command/
[7]: https://www.quora.com/What-is-CPU-architecture
[8]: https://en.wikipedia.org/wiki/Software_license
[9]: https://wiki.archlinux.org/title/PKGBUILD#license
[10]: https://wiki.archlinux.org/title/PKGBUILD#Integrity
[11]: https://linuxhandbook.com/mkdir-command/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/image-1.png?resize=561%2C281&ssl=1
