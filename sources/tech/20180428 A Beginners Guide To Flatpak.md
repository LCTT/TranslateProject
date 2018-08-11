A Beginners Guide To Flatpak
======

![](https://www.ostechnix.com/wp-content/uploads/2016/06/flatpak-720x340.jpg)

A while, we have written about [**Ubuntu’s Snaps**][1]. Snaps are introduced by Canonical for Ubuntu operating system, and later it was adopted by other Linux distributions such as Arch, Gentoo, and Fedora etc. A snap is a single binary package bundled with all required libraries and dependencies, and you can install it on any Linux distribution, regardless of its version and architecture. Similar to Snaps, there is also another tool called **Flatpak**. As you may already know, packaging distributed applications for different Linux distributions are quite time consuming and difficult process. Each distributed application has different set of libraries and dependencies for various Linux distributions. But, Flatpak, the new framework for desktop applications that completely reduces this burden. Now, you can build a single Flatpak app and install it on various operating systems. How cool, isn’t it?

Also, the users don’t have to worry about the libraries and dependencies, everything is bundled within the app itself. Most importantly, Flaptpak apps are sandboxed and isolated from the rest of the host operating system, and other applications. Another notable feature is we can install multiple versions of the same application at the same time in the same system. For example, you can install VLC player version 2.1, 2.2, and 2.3 on the same system. So, the developers can test different versions of same application at a time.

In this tutorial, we will see how to install Flatpak in GNU/Linux.

### Install Flatpak

Flatpak is available for many popular Linux distributions such as Arch Linux, Debian, Fedora, Gentoo, Red Hat, Linux Mint, openSUSE, Solus, Mageia and Ubuntu distributions.

To install Flatpak on Arch Linux, run:
```
$ sudo pacman -S flatpak

```

Flatpak is available in the default repositories of Debian Stretch and newer. To install it, run:
```
$ sudo apt install flatpak

```

On Fedora, Flatpak is installed by default. All you have to do is enable enable Flathub as described in the next section.

Just in case, it is not installed for any reason, run:
```
$ sudo dnf install flatpak

```

On RHEL 7, run:
```
$ sudo yum install flatpak

```

On Linux Mint 18.3, flatpak is installed by default. So, no setup required.

On openSUSE Tumbleweed, Flatpak can also be installed using Zypper:
```
$ sudo zypper install flatpak

```

On Ubuntu, add the following repository and install Flatpak as shown below.
```
$ sudo add-apt-repository ppa:alexlarsson/flatpak

$ sudo apt update

$ sudo apt install flatpak

```

The Flatpak plugin for the Software app makes it possible to install apps without needing the command line. To install this plugin, run:
```
$ sudo apt install gnome-software-plugin-flatpak

```

For other Linux distributions, refer the official installation [**link**][2].

### Getting Started With Flatpak

There are many popular applications such as Gimp, Kdenlive, Steam, Spotify, Visual studio code etc., available as flatpaks.

Let us now see the basic usage of flatpak command.

First of all, we need to add remote repositories.

#### Adding Remote Repositories**

**Enable Flathub Repository:**

**Flathub** is nothing but a central repository where all flatpak applications available to users. To enable it, just run:
```
$ sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

```

Flathub is enough to install most popular apps. Just in case you wanted to try some GNOME apps, add the GNOME repository.

**Enable GNOME Repository:**

The GNOME repository contains all GNOME core applications. GNOME flatpak repository itself is available as two versions, **stable** and **nightly**.

To add GNOME stable repository, run the following commands:
```
$ wget https://sdk.gnome.org/keys/gnome-sdk.gpg

$ sudo flatpak remote-add --gpg-import=gnome-sdk.gpg --if-not-exists gnome-apps https://sdk.gnome.org/repo-apps/

```

Applications in this repository require the **3.20 version of the org.gnome.Platform runtime**.

To install the stable runtimes, run:
```
$ sudo flatpak remote-add --gpg-import=gnome-sdk.gpg gnome https://sdk.gnome.org/repo/

```

To add the GNOME nightly apps repository, run:
```
$ wget https://sdk.gnome.org/nightly/keys/nightly.gpg

$ sudo flatpak remote-add --gpg-import=nightly.gpg --if-not-exists gnome-nightly-apps https://sdk.gnome.org/nightly/repo-apps/

```

Applications in this repository require the **nightly version of the org.gnome.Platform runtime**.

To install the nightly runtimes, run:
```
$ sudo flatpak remote-add --gpg-import=nightly.gpg gnome-nightly https://sdk.gnome.org/nightly/repo/

```

#### Listing Remotes

To list all configured remote repositories, run:
```
$ flatpak remotes
Name Options
flathub system
gnome system
gnome-apps system
gnome-nightly system
gnome-nightly-apps system

```

As you can see, the above command lists the remotes that you have added in your system. It also lists whether the remote has been added per-user or system-wide.

#### Removing Remotes

To remove a remote, for example flathub, simply do;
```
$ sudo flatpak remote-delete flathub

```

Here **flathub** is remote name.

#### Installing Flatpak Applications

In this section, we will see how to install flatpak apps. To install a flatpak application

To install an application, simply do:
```
$ sudo flatpak install flathub com.spotify.Client

```

All the apps in the GNOME stable repository uses the version name of “stable”.

To install any Stable GNOME applications, for example **Evince** , run:
```
$ sudo flatpak install gnome-apps org.gnome.Evince stable

```

All the apps in the GNOME nightly repository uses the version name of “master”.

For example, to install gedit, run:
```
$ sudo flatpak install gnome-nightly-apps org.gnome.gedit master

```

If you don’t want to install apps system-wide, you also can install flatpak apps per-user like below.
```
$ flatpak install --user <name-of-app>

```

All installed apps will be stored in **$HOME/.var/app/** location.
```
$ ls $HOME/.var/app/
com.spotify.Client

```

#### Running Flatpak Applications

You can launch the installed applications at any time from the application launcher. From command line, you can run it, for example Spotify, using command:
```
$ flatpak run com.spotify.Client

```

#### Listing Applications

To view the installed applications and runtimes, run:
```
$ flatpak list

```

To view only the applications, not run times, use this command instead.
```
$ flatpak list --app

```

You can also view the list of available applications and runtimes from all remotes using command:
```
$ flatpak remote-ls

```

To list only applications not runtimes, run:
```
$ flatpak remote-ls --app

```

To list applications and runtimes from a specific repository, for example **gnome-apps** , run:
```
$ flatpak remote-ls gnome-apps

```

To list only the applications from a remote repository, run:
```
$ flatpak remote-ls flathub --app

```

#### Updating Applications

To update all your flatpak applications, run:
```
$ flatpak update

```

To update a specific application, we do:
```
$ flatpak update com.spotify.Client

```

#### Getting Details Of Applications

To display the details of a installed application, run:
```
$ flatpak info io.github.mmstick.FontFinder

```

Sample output:
```
Ref: app/io.github.mmstick.FontFinder/x86_64/stable
ID: io.github.mmstick.FontFinder
Arch: x86_64
Branch: stable
Origin: flathub
Date: 2018-04-11 15:10:31 +0000
Subject: Workaround appstream issues (391ef7f5)
Commit: 07164e84148c9fc8b0a2a263c8a468a5355b89061b43e32d95008fc5dc4988f4
Parent: dbff9150fce9fdfbc53d27e82965010805f16491ec7aa1aa76bf24ec1882d683
Location: /var/lib/flatpak/app/io.github.mmstick.FontFinder/x86_64/stable/07164e84148c9fc8b0a2a263c8a468a5355b89061b43e32d95008fc5dc4988f4
Installed size: 2.5 MB
Runtime: org.gnome.Platform/x86_64/3.28

```

#### Removing Applications

To remove a flatpak application, run:
```
$ sudo flatpak uninstall com.spotify.Client

```

For details, refer flatpak help section.
```
$ flatpak --help

```

And, that’s all for now. Hope you had basic idea about Flatpak.

If you find this guide useful, please share it on your social, professional networks and support OSTechNix.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/flatpak-new-framework-desktop-applications-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:http://www.ostechnix.com/introduction-ubuntus-snap-packages/
[2]:https://flatpak.org/setup/
