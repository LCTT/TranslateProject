[#]: subject: "Install VSCodium on Ubuntu"
[#]: via: "https://itsfoss.com/install-vscodium-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install VSCodium on Ubuntu
======

[VSCodium][1] is the 'complete open source version' of Microsoft's VS Code.

It's basically a clone of the [VS Code][2] that removes any signs of telemetry. The [telemetry is used for collecting data][3] on the usage of the application. Many developers use it to get an insight on improving their application.

Look and feature wise, the two editors are identical.

![VSCodium is identical to VS Code][4]

There are three ways to install VSCodium on Ubuntu:

  1. Install it by downloading the deb file from the release page. The downside is that you cannot easily update it as you have to download the new deb file again.
  2. Add a third-party developer repository (recommended by [VSCodium][5]) to your system. This way, you also get regular updates for the new releases of VSCodium.
  3. Use the snap version. Perhaps the easiest way if you don't have an aversion to Snap packages.



I won't discuss the first method, as it is just downloading and [installing the deb file][6] from the [release page][7].

Let's see the other two methods.

### Method 1: Installing VSCodium by adding external repo

The official VSCodium documentation refers to a [GitLab repository by Pavlo Rudy][8] that gives you a continuous update version of VSCodium.

📋

Though I am using Ubuntu here, the steps should be applicable for Debian and other Debian and Ubuntu-based distributions.

Here are the steps.

[Open a terminal in Ubuntu][9] and use the following command to get the GPG signature key of the developer and add it to your system. This way, your Ubuntu system will trust the packages that are signed by this developer.

```

    sudo wget https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg -O /usr/share/keyrings/vscodium-archive-keyring.asc

```

![Adding the GPG signature key for VSCodium repository][10]

The next step is to add the repository to [your system's sources.list file][11]. This way, your Ubuntu system will know from where it should get the package from.

```

    echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.asc ] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list

```

![Adding the VSCodium repo to sources.list][12]

As you can see, the entry mentions that the repository is signed by the key you had added just above it.

Update the local package cache so that your system is aware of the packages from the newly added repository.

```

    sudo apt update

```

Now you are ready to install VSCodium on Ubuntu:

```

    sudo apt install codium

```

Yes, the package is called `codium`, not `vscodium`.

![][13]

Great! Now you can look for VSCodium in the menu and start the application from there:

![][14]

And now you can enjoy coding in VSCodium.

#### Updating VSCodium

The good thing is that you have added a repository to your system. When a new VSCodium is released, the repository maintainer pushes the new version to the repository and you should see the new version in the system updater.

In other words, [keep your Ubuntu system updated][15] and you should have the newer version of VSCodium.

#### Removing VSCodium

If you don't want to use it any more for some reason, you can remove it using this command:

```

    sudo apt remove codium

```

You may keep the repository and signature added to your system.

🚧

If you are picky about those things, you can remove them from the system as well. Be a little careful while [deleting file in the Linux terminal][16] with sudo.

```

    sudo rm /usr/share/keyrings/vscodium-archive-keyring.asc

```

Next, you could also remove the repository from the sources.list:

```

    sudo rm /etc/apt/sources.list.d/vscodium.list

```

There should be some local, application related files in your home directory, you may want to delete them as well:

```

    rm -r ~/.config/VSCodium

```

### Method 2: Install VSCodium using snap

💡

The snap method works on any Linux distribution, not just Ubuntu, as long as [you have snap support enabled on the system][17].

The snap installation method is rather easier and involves less steps.

Open a terminal and use the following command to install VSCodium snap package:

```

    sudo snap install codium --classic

```

Wait for some seconds as it downloads the Snap package and then installs it. You'll see the progress on the screen and

![][18]

**How do you[ **update the snap version**][19] of VSCodium**? Snap applications are updated automatically multiple times a day. However, the application won't be updated if it's running.

So, alternatively, you can close any running instance of VSCodium and run this command to force an update (if there is any new version):

```

    sudo snap refresh codium

```

If you don't like it, you can easily remove it with the command below:

```

    sudo snap remove codium

```

### VS Code VS VSCodium

The major difference is that VSCodium removes the telemetry part from the VS Code. Otherwise, it's a clone of the Microsoft's project and looks and works identical to the famous VS Code.

The telemetry could be a dealbreaker for some, and hence this project has a considerable popularity in the open source community.

Here's a good take on the [VS Code telemetry issue][20].

![][21]

If you are okay with the telemetry part, you can [install VS Code on Ubuntu as easily][22]. It's really your choice.

I hope you find this tutorial helpful in installing VSCodium on Ubuntu and other Debian-based distributions. Please leave your feedback in the comment sections.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-vscodium-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/vscodium/
[2]: https://code.visualstudio.com/
[3]: https://code.visualstudio.com/docs/getstarted/telemetry
[4]: https://itsfoss.com/content/images/2023/09/vscodium-interface.png
[5]: https://vscodium.com/
[6]: https://itsfoss.com/install-deb-files-ubuntu/
[7]: https://github.com/VSCodium/vscodium/releases
[8]: https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo
[9]: https://itsfoss.com/open-terminal-ubuntu/
[10]: https://itsfoss.com/content/images/2023/09/add-vscodium-signature-key.png
[11]: https://itsfoss.com/sources-list-ubuntu/
[12]: https://itsfoss.com/content/images/2023/09/add-vscodium-repo-ubuntu.png
[13]: https://itsfoss.com/content/images/2023/09/install-vscodium-ubuntu.png
[14]: https://itsfoss.com/content/images/2023/09/vscodium-ubuntu.png
[15]: https://itsfoss.com/update-ubuntu/
[16]: https://itsfoss.com/delete-files-folders-linux/
[17]: https://itsfoss.com/install-snap-linux/
[18]: https://itsfoss.com/content/images/2023/09/snap-install-codium.png
[19]: https://itsfoss.com/snap-update/
[20]: https://www.roboleary.net/tools/2022/04/20/vscode-telemetry.html
[21]: https://www.roboleary.net/assets/logo/prod/logo.svg
[22]: https://itsfoss.com/install-visual-studio-code-ubuntu/
