[#]: subject: "Fixing Cannot add PPA: ''This PPA does not support jammy'' Error"
[#]: via: "https://itsfoss.com/cannot-add-ppa-error/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fixing Cannot add PPA: ''This PPA does not support jammy'' Error
======

So, here's the scenario. You are trying to install a software in Ubuntu using a PPA.

You add the PPA repository with 'sudo add-apt-repository' and when it updates the package cache, it generates an error:

**Cannot add PPA: ''This PPA does not support xyz''**

Where XYZ is the [codename of the Ubuntu version you are using][1].

📋

****Here's why it is happening and what you can do about it**** :

\- The PPA is not available for the Ubuntu version you are using
\- You should look for other sources for installing that application
\- If desperate, you can download the .deb file from the PPA webpage

I'll discuss all the above in detail.

### Check if PPA is available for your Ubuntu version or not

First thing first, get the details of your Ubuntu version and codename using this command in the terminal:

```

    lsb_release -a

```

The output will have the details:

![Here, I am using Ubuntu version 23.04 that case codename lunar][2]

Now, go to Ubuntu's Launchpad website that hosts all the PPAs:

[Go to Launchpad PPA][3]

Here, look for the PPA that is troubling you. For that you have to use the PPA maintainer's name.

For example, if `ppa:jstaf/onedriver` is causing trouble, search for the maintainer `jstaf`.

![Enter the PPA's maintainer name and search for it][4]

A maintainer may have more than one software repository. Click on the one you wanted to install.

In here, you should **click on the "Any Series" dropdown button** besides "Published in".

![Click on Any series dropdown button to see the supported Ubuntu versions][5]

Check if you see the codename of the Ubuntu version you are using. If it's not there, the PPA is not available for your Ubuntu version.

### What should you do if the PPA does not support your Ubuntu version

You see, a developer (or maintainer) creates a repository and makes the software available for the Ubuntu version they were using.

With time, Ubuntu releases newer versions. Now, an active maintainer will release the software for the new Ubuntu version. But that's not always the case. If the maintainer is not active anymore, the repository won't be updated. People like you who were trying to follow a tutorial instruction will see this error.

Now, you have two options:

#### Option 1: Look for the software elsewhere

There are several possibilities here.

**The same software might be available for newer Ubuntu versions from another PPA. Look for it on Launchpad website or the internet.**

How does it happen? Many original software developers just release the source code so some volunteers create the Debian package and distribute it from the launchpad so that Ubuntu users like you can install the software easily. More than one volunteer can create their own personal package archive (PPA) for the same software. You should use the active ones.

For example, if I looked for `onedriver` package, I can see that it might be available in another PPA named [Ubuntu deployment][6].

![][7]

**Another option is to see if the package is available in other formats like Snap, Flatpak, AppImage.**

  * Check [Snap store][8]
  * [Check for Flatpak][9] package
  * [Check for AppImages][10]



In some rare cases, the software may already be available in the Ubuntu repository.

For this, you have to be a smart user and search the internet. If you find another package format, well and good. Otherwise, the next step is for desperation.

#### Option 2: Download the deb file from the PPA

The PPA repositories provide you the Debian package. With the repository added, you also get updates (if any), directly with the system updates.

If the PPA is not updated for your Ubuntu version and you cannot find the software elsewhere, you can try downloading the deb package from the PPA Launchpad page.

![][11]

On the package details page, click on the carrot symbol and look for the deb files. Unless you are using a Raspberry Pi like board, you should go for amd64.

![Download deb package from PPA][12]

🚧

If the software is too old, the downloaded deb package may not be installed successfully due to dependency issues. Also, you won't get updates on the installed packages (if it gets installed). Still, the method is worth giving a try.

### Conclusion

Despite all the push behind Snap packaging, PPAs still remain a favourite among users for installing third-party applications in Ubuntu.

But PPAs have their fair share of trouble, and this cannot add PPA error is one of them. The same issue also causes ['repository does not have release file][13]' error.

I hope things are more clear on the issue now. Let me know if you still have questions.

--------------------------------------------------------------------------------

via: https://itsfoss.com/cannot-add-ppa-error/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/how-to-know-ubuntu-unity-version/
[2]: https://itsfoss.com/content/images/2023/09/ubuntu-version-details.png
[3]: https://launchpad.net/ubuntu/+ppas
[4]: https://itsfoss.com/content/images/2023/09/search-for-ppa-launchpad.png
[5]: https://itsfoss.com/content/images/2023/09/check-ppa-supported-version.png
[6]: https://launchpad.net/~remiariro/+archive/ubuntu/misc
[7]: https://itsfoss.com/content/images/2023/09/search-ppa.png
[8]: https://snapcraft.io/store
[9]: https://flathub.org/
[10]: https://www.appimagehub.com/
[11]: https://itsfoss.com/content/images/2023/09/ppa-package-details.png
[12]: https://itsfoss.com/content/images/2023/09/download-deb-from-ppa.png
[13]: https://itsfoss.com/repository-does-not-have-release-file-error-ubuntu/
