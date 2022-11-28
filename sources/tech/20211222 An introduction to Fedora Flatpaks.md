[#]: subject: "An introduction to Fedora Flatpaks"
[#]: via: "https://fedoramagazine.org/an-introduction-to-fedora-flatpaks/"
[#]: author: "TheEvilSkeleton https://fedoramagazine.org/author/theevilskeleton/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

An introduction to Fedora Flatpaks
======

![][1]

Fedora Linux 35 Background; Fedora logo; and Flatpak logo by [Matthias Clasen][2], [CC BY-SA 4.0][3], via Wikimedia Commons

Flatpak is a distribution agnostic universal package manager leveraging [bubblewrap][4] to separate applications from the system, and [OSTree][5] to manage applications. There are multiple Flatpak repositories (remotes in Flatpak terminology), such as [Flathub][6] (the de-facto standard), [GNOME Nightly][7], [KDE][8] and finally Fedora Flatpaks, Fedora Project’s Flatpak remote.

This article explains the motivation behind Fedora Flatpaks, how to add the remote, how to use it and where to find resources.

### What is Fedora Flatpaks?

Fedora Flatpaks is a Flatpak remote by the Fedora Project for Fedora Linux. However, thanks to the universality of Flatpak, most other distributions can utilize it without a problem. Fedora Flatpaks builds from existing Fedora packages to ensure that everything remains free and open source and complies with Fedora’s standards.

Technically speaking, Fedora Flatpaks reuses existing RPMs from the Fedora Linux repositories and converts them to Flatpak applications using several tools.

### Adding the Fedora Flatpaks remote

On Fedora Linux, Fedora Flatpaks is already added and ready to go.

If you are using a distribution other than Fedora Linux, then you will have to manually add the desired remotes. At the moment, there are two different remotes: the stable remote for stable applications and the testing remote for testing applications. To add the stable remote, run the following command:

```

    flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org

```

To add the testing remote, run the following command:

```

    flatpak remote-add --if-not-exists fedora-testing oci+https://registry.fedoraproject.org#testing

```

These commands may need elevated privileges, thus needing an administrator password. If you do not have access to root or an administrator password, then you can still add the remote by using the --user flag to add per-user. If you have used --user, then you will have to use it in the later examples too.

### Using Fedora Flatpaks

#### Software center

Flatpak is built with the Linux desktop in mind. Application stores such as GNOME Software have the ability to install and remove Flatpak applications after you add a Flatpak remote, making it easy to manage applications.

On GNOME Software, visiting an application’s page and pressing on the _Source_ button at the top right hand side opens the list of available of sources. By default, on Fedora Linux, GNOME Software selects _Fedora Linux (RPM)_. _Fedora Linux (Flatpak)_, provided by Fedora Flatpaks, is available as an available source, but is not used by default. Simply select it, and then press on the “Install” button.

For example, to install Firefox from Fedora Flatpaks, head over to the Firefox page on GNOME Software. Then, press on the _Source_ button at the top right hand side. Once the menu pops up, press _Fedora Linux (Flatpak)_. Lastly, press _Install_. Here is a visual example:

![Firefox on GNOME Software, with Fedora Linux \(RPM\) as the default option and Fedora Linux \(Flatpak\) as the second option][9]

![Fedora Linux \(Flatpak\) source ticked][10]

Afterwards, GNOME Software will install Firefox on your system. You can use the application launcher to launch Firefox, just like any application.

To remove the application, simply press on the trash button next to the blue _Open_ button in GNOME Software.

#### Command-line interface

Flatpak uses standard package management terminologies when it comes to commands. Some examples include:

```

    # Installing a package
    flatpak install fedora $APPLICATION
    # Removing a package
    flatpak remove $APPLICATION
    # Updating packages
    flatpak update

```

Substitute $APPLICATIONS with the desired application. Firefox for example is _org.mozilla.firefox_, or _firefox_ for short. For more information on the commands, refer to the [Using Flatpak documentation][11].

### Finding resources

#### Source code

For curious people, source codes of container and Flatpak manifests are available on the _flatpaks_ namespace at [src.fedoraproject.org/flatpaks][12].

#### Filing a bug

Experiencing a bug with an application? Consider filing an bug! The Fedora Project treats applications from Fedora Flatpaks the same as their RPM counterparts, therefore the process of filing bugs for specific apps is the same as filing a bug for any package on Fedora Linux. To file an bug, head over to [docs.fedoraproject.org][13] and carefully read the instructions.

### Conclusion

In conclusion, Fedora Flatpaks is a remote by the Fedora Project wherein Fedora Linux packages are converted to Flatpak. The vast majority of applications are free and open source. They are tested and verified by the Fedora Project. On Fedora Linux, the Fedora Project includes Fedora Flatpaks for you. On other distributions, you can easily add the remote by simply running a command.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/an-introduction-to-fedora-flatpaks/

作者：[TheEvilSkeleton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/theevilskeleton/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/12/An-introduction-to-Fedora-Flatpaks-816x345.jpg
[2]: https://commons.wikimedia.org/wiki/File:Flatpak_logo.png
[3]: https://creativecommons.org/licenses/by-sa/4.0
[4]: https://github.com/containers/bubblewrap
[5]: https://ostreedev.github.io/ostree/
[6]: https://flathub.org/home
[7]: https://wiki.gnome.org/Apps/Nightly
[8]: https://community.kde.org/Guidelines_and_HOWTOs/Flatpak#Applications
[9]: https://fedoramagazine.org/wp-content/uploads/2021/12/gnome-software1-1024x697.png
[10]: https://fedoramagazine.org/wp-content/uploads/2021/12/gnome-software2.png
[11]: https://docs.flatpak.org/en/latest/using-flatpak.html
[12]: https://src.fedoraproject.org/projects/flatpaks/%2A
[13]: https://docs.fedoraproject.org/en-US/quick-docs/howto-file-a-bug/
