[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Add Third-Party Repositories in Fedora and Get Access to a Huge Number of Additional Software)
[#]: via: (https://itsfoss.com/fedora-third-party-repos/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

How to Add Third-Party Repositories in Fedora and Get Access to a Huge Number of Additional Software
======

After you install Fedora, you may discover that some of the software that you want to install and use is not available in the software store. These packages may not be in the Fedora repos for several reasons.

Don’t worry, I’ll tell you how to make them available by adding third party repos for Fedora.

### What are the third party repositories in Fedora?

Operating system devs often make decisions on what packages can and cannot be available in their repos. Fedora is no different. According to the [Fedora docs][1], third party repos contain packages that “have more liberal licensing policies and provide software packages that Fedora excludes for various reasons”.

Fedora enforces the following [guidelines][2] when it comes to packages:

  * If it is proprietary, it cannot be included in Fedora
  * If it is legally encumbered, it cannot be included in Fedora
  * If it violates United States laws (specifically, Federal or applicable state laws), it cannot be included in Fedora



For this reason, there exists a couple of repositories that a user can add. This enables the user to get access to the additional software packages.

### Enabling RPM Fusion Repositories in Fedora

[RPM Fusion][3] is the main source for third party applications for Fedora. RPM Fusion is the result of three projects (Dribble, Freshrpms, and Livna) merging. RPM Fusion offers two different software repos.

  * The free repo contains open-source software.
  * The nonfree repo contains software that does not have an open-source license, but the source code is freely available.



There are two ways to enable RPM Fusion: from the terminal or by clicking a couple of buttons. We’ll take a look at each.

#### Method 1: Command line method

This is the easiest method to enable the RPM Fusion repos. Just enter the following command to enable both repos:

```
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

You will be asked to enter your password. You will then be asked to verify that you want to install these repos. Once you approve it, the installation will be completed in a few seconds or minutes.

![Install RPM Fusion via command line][4]

#### Method 2: Graphical method

To enable the RPM Fusion repos using this method, you need to visit the [RPM Fusion Website][5]. You will see links for both repos for different Fedora versions.

RPM Fusion recommends installing the free repo first. So, click the link for the free repo for your version of Fedora. This will open a window asking if you want to install the repo. Click install.

![Install RPM Fusion via GUI][6]

Once the installation is completed, go back and install the nonfree repo using the same steps.

### Enable Fedora’s Third Party repositories

Fedora recently started offering its own [repo of third party apps][7]. The [number of applications available][8] in this repo is very small. You can [install Chrome browser on Fedora with it][9]. Apart from Chrome, it also includes Adobe Brackets, Atom, Steam, Vivaldi, Opera, and more.

Just like RPM Fusion, you can enable this repo via the terminal or graphically.

#### Method 1: Command line method

To enable Fedora’s third-party repo, enter the following command into your terminal:

```
sudo dnf install fedora-workstation-repositories
```

Be sure to ensure your password when prompted and type Y to approve the installation.

#### Method 1: Graphical method

If you are not comfortable using the terminal, you can use the graphical method.

First, you need to open Gnome Software. Next, you need to click on the hamburger menu in the top right corner and select “Software Repositories” from the menu.

![Gnome Software Menu][10]

In the Software Repositories window, you will see a section at the top that says “Third Party Repositories”. Click the Install button. Enter your password when you are prompted and you are done.

![Fedora Third Party Repo installation][11]

With these additional repositories enabled, you can install software to your heart’s content. You can easily install them from the software center or using the DNF package manager.

If you found this article interesting, please take a minute to share it on social media, Hacker News, or [Re][12][d][12][dit][12].

--------------------------------------------------------------------------------

via: https://itsfoss.com/fedora-third-party-repos/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/#third-party-repositories
[2]: https://fedoraproject.org/wiki/Forbidden_items
[3]: https://rpmfusion.org/RPM%20Fusion
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/install-rpmfusion-cli.png?resize=800%2C604&ssl=1
[5]: https://rpmfusion.org/Configuration
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/install-rpmfusion-gui.png?resize=800%2C582&ssl=1
[7]: https://fedoraproject.org/wiki/Workstation/Third_Party_Software_Repositories
[8]: https://fedoraproject.org/wiki/Workstation/Third_party_software_list
[9]: https://itsfoss.com/install-google-chrome-fedora/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/software-meni.png?resize=800%2C672&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/fedora-third-party-repo-gui.png?resize=746%2C800&ssl=1
[12]: https://%0Areddit.com/r/linuxusersgroup
