[#]: subject: "Atoms is a GUI Tool to Let You Manage Linux Chroot Environments Easily"
[#]: via: "https://itsfoss.com/atoms-chroot-tool/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Atoms is a GUI Tool to Let You Manage Linux Chroot Environments Easily
======
A chroot environment provides you with isolation for testing in Linux. You do not need to take the hassle of creating a virtual machine. Instead, if you want to test an application or something else, create a chroot environment that allows you to select a different root directory.

So, with chroot, you get to test stuff without giving the application access to the rest of the system. Any application you install or anything you try gets confined to that directory and does not affect the functioning of your operating system.

Chroot has its perks, which is why it is a convenient way to test things for various users (especially system administrators).

Unfortunately, all of this works via the Linux terminal. What if you can have a graphical user interface to make things a little easy? That’s where “**Atoms**” comes in.

### Atoms: A GUI to Manage Linux Chroot(s)

![atoms][1]

Atoms is a GUI tool that makes it convenient to create and manage Linux chroot environments.

It also supports integration with [Distrobox][2]. So, you can also manage containers using Atoms.

However, the developers mention that this tool does not offer seamless integration with Podman, explaining its purpose: “*its purpose is only to allow the user to open a shell in a new environment, be it chroot or container.”*

If you are looking for such a thing, you might want to check out [pods][3].

### Features of Atoms

![atoms options][4]

Atoms is a straightforward GUI program that lets you create chroot environments for several supported Linux distributions.

Let me highlight the supported distros along with their functionalities offered:

* Browse files for the chroot(s) created.
* Ability to choose mount points to expose.
* Access to the console.
* Supported Linux distros include Ubuntu, Alpine Linux, Fedora, Rocky Linux, Gentoo, AlmaLinux, OpenSUSE, Debian, and CentOS.

It is incredibly easy to use. Creating an atom from within the app is a one-click process.

All you have to do is name the atom, and select the Linux distribution from the list of available options (Ubuntu as the selection in the screenshot above). It downloads the image and sets up the chroot environment for you in a few minutes as shown below.

![atom config][5]

Once its done, you can access the options to launch the console to manage the chroot environment or customize/delete it.

![atoms option][6]

To access the console, head to the other tab menu. Pretty seamless experience, and works well, at least for Ubuntu that I tested.

![atoms console][7]

Additionally, you can detach the console to access it as a separate window.

![atoms detach console][8]

### Installing Atoms on Linux

You can install Atoms on any Linux distribution with the Flatpak package available on [Flathub][9]. Follow our [Flatpak guide][10] if you are new to Linux.

**Note:** The latest stable version **1.0.2** is only available via Flathub.

To explore its source code and other details, head to its [GitHub page][11].

### Conclusion

The Linux command line is powerful and you can do almost anything with the commands. But not everyone feels comfortable with it and thus tools like Atoms make it more convenient by providing a GUI.

And Atoms is not the only one of this kind. There is [Grub Customizer][12] that makes it easier to change [Grub][13] configuration which can be done with the command line.

I believe there are many more such tools out there.

*What do you think about using a GUI program like Atom to manage Chroot environments? Share your thoughts in the comments down below.*

--------------------------------------------------------------------------------

via: https://itsfoss.com/atoms-chroot-tool/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/09/atoms.png
[2]: https://itsfoss.com/distrobox/
[3]: https://github.com/marhkb/pods
[4]: https://itsfoss.com/wp-content/uploads/2022/09/atoms-options.png
[5]: https://itsfoss.com/wp-content/uploads/2022/09/atom-config.png
[6]: https://itsfoss.com/wp-content/uploads/2022/09/atoms-option.png
[7]: https://itsfoss.com/wp-content/uploads/2022/09/atoms-console.png
[8]: https://itsfoss.com/wp-content/uploads/2022/09/atoms-detach-console.png
[9]: https://flathub.org/apps/details/pm.mirko.Atoms
[10]: https://itsfoss.com/flatpak-guide/
[11]: https://github.com/AtomsDevs/Atoms
[12]: https://itsfoss.com/grub-customizer-ubuntu/
[13]: https://itsfoss.com/what-is-grub/
