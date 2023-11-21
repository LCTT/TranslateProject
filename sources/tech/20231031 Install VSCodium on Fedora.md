[#]: subject: "Install VSCodium on Fedora"
[#]: via: "https://itsfoss.com/install-vscodium-fedora/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install VSCodium on Fedora
======

Visual Studio Code (VS Code) is a popular cross-platform text editor developed by Microsoft. It's built on the Electron framework and is widely used by developers for coding and text editing tasks. The core of VS Code, known as "Code - OSS," is open source and distributed under the MIT License. However, Microsoft adds specific customizations and releases its branded version of the editor under a proprietary license.

To address concerns about [telemetry][1] and licensing, there's an alternative called "[VSCodium][2]," which is a community-driven, telemetry-disabled, and MIT-licensed version of VS Code.

![VSCodium running on Fedora 39.][3]

In this tutorial, I will guide you through the process of installing and running VSCodium on a Fedora Linux system.

There are three ways to do that:

  1. Installing by downloading the rpm file from the release page. But, you need to repeat the process to get the package updated (which can get frustrating).
  2. Adding [paulcarroty][4] repo (as mentioned on [VSCodium][5] website). So, that when you [update your Fedora system][6] VScodium will also get updated (which is quite seamless).
  3. Using the flatpak version which you probably have tried by installing it from Gnome software already (I had a bad experience with the same so mileage may vary).



The first one is very straightforward i.e. downloading and [installing the rpm file][7] from the [release page][8]. So, let's cut to the chase and follow the other two methods.

### Method 1: Installing VSCodium by adding the repository

Open a terminal: You can open a terminal by searching for "Terminal" in the application menu.

Add the GPG key: So that the package manager trusts the packager of the repo.

```

    sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg

```

Add the VSCodium repository: The following command will add the repo to your Fedora system.

```

    printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo

```

Install VSCodium: Now that you've added the VSCodium repository, you can install it using the following command (ones who love bleeding edge software can replace the package name to **codium-insiders** for installing the insiders version):

```

    sudo dnf install codium

```

Launch VSCodium: You can now launch VSCodium either from the application menu or by running the following command in the terminal:

```

    codium

```

#### Removing VSCodium

If you did not like VSCodium and the fact that it's based on Electron or maybe you switched to Neovim for good. You can remove it using this command:

```

    sudo dnf remove codium

```

You may keep the repository and signature added to your system or maybe not (why not).
So, let's get rid of that repo:

```

    sudo rm /etc/yum.repos.d/vscodium.repo

```

### Method 2: Install VSCodium using flatpak

You can install the flatpak also. So, here are the steps to install VSCodium using Flatpak on Fedora:

You can Install it straight away on Fedora by having flathub enabled which is probably enabled if you are using one of the latest iterations and have 3rd party repos enabled for Fedora. Just search for VSCodium in Gnome Software and click Install.

![Installing the flatpak from Gnome Software][9]

But, for the folks running older versions for some reason or they might have a fork with flatpak not enabled can follow suit.

Install Flatpak and enable Flathub: Fedora usually comes with Flatpak pre-installed. If it's not installed, you can install it using the following command:

```

    sudo dnf install flatpak

```

To enable the Flathub repository, use the following command:

```

    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

```

Now that you have Flatpak set up, you can install VSCodium using the Flathub repository. Run the following command:

```

    flatpak install flathub com.vscodium.codium

```

Launch VSCodium: You can launch VSCodium via Flatpak using the following command:

```

    flatpak run com.vscodium.codium

```

Alternatively, you can also search for "VSCodium" in your application menu and launch it from there.

That's it! You should now have VSCodium installed and running on your Fedora system using Flatpak.

To remove it use the command below:

```

    sudo flatpak uninstall com.vscodium.codium

```

### Here comes the Bottomline

If you have used VS Code then you will not find any difference whatsoever between both the software. It is just for the sake of openness and freedom from the evil telemetry of Microsoft's version.

Coming to Fedora I installed the flatpak version first but VSCodium did not show any window decorations in the Wayland session (which is default obviously). Making it difficult to navigate using mouse.

![VSCodium flatpak showing no window decorations.][10]

I tried some methods to fix it but had no luck due to flatpak's weird locations for config files. If someone has or can figure out the workaround for above issue can comment down below. But using the rpm version was seamless (Maybe the skeptics were right about alternative package management systems).

Extensions and Plugins were fine for most of the part. You can also follow this tutorial to install on any distro from The Enterprise Linux family e.g. Alma Linux, Rocky Linux etc.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-vscodium-fedora/

作者：[Anuj Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lujun9972
[1]: https://code.visualstudio.com/docs/getstarted/telemetry
[2]: https://itsfoss.com/vscodium/
[3]: https://itsfoss.com/content/images/2023/10/codium-on-fedora.png
[4]: https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo
[5]: https://vscodium.com/
[6]: https://itsfoss.com/update-fedora/
[7]: https://itsfoss.com/install-rpm-files-fedora/
[8]: https://github.com/VSCodium/vscodium/releases
[9]: https://itsfoss.com/content/images/2023/10/codium-flatpak-fedora.png
[10]: https://itsfoss.com/content/images/2023/10/codium-flatpak-no-decorations.png
