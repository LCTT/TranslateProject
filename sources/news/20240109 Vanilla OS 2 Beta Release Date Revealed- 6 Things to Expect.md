[#]: subject: "Vanilla OS 2 Beta Release Date Revealed: 6 Things to Expect"
[#]: via: "https://news.itsfoss.com/vanilla-os-2-beta-release-date/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Vanilla OS 2 Beta Release Date Revealed: 6 Things to Expect
======
Vanilla OS 2 beta is around the corner!
Vanilla OS got a great deal of attention last year for its approach with immutability and user experience.

Surely, it was one of the [lesser-known distributions to have emerged winner][1] in 2023. For its next exciting phase, we have Vanilla OS 2. And, unlike most of our guesses, it is not just another distro upgrade.

With Vanilla OS 2, there are major overhauls to the distribution that affects the user experience. I tried the latest alpha image to give you a sneak peek.

The release date for the beta build of Vanilla OS 2 is **January 30, 2024**.

So, before we get to the release, here are a few things that you should know:

### 1\. Moving to Debian Sid

![][2]

Vanilla OS originally started as an Ubuntu-based distribution, aiming to provide a "vanilla" GNOME experience.

However, with Ubuntu as its base, a lot of effort was needed to untangle the modifications done by Canonical (both for the desktop and the distribution).

So, they chose to move to Debian Sid (unstable branch) where they plan to limit the number of core packages to provide a stable experience, and give you the best "stock" GNOME experience with no wasted efforts.

![][3]

On the user-end, you should not feel a big difference because you will still be dealing with Debian packages, and all the other tools Vanilla OS has to offer.

With the switch, they also get flexibility for the updates, no longer needing to follow Ubuntu's release schedule.

### 2\. Vanilla System Operator (VSO v2) as the Default Package Manager and Shell

![New Wallpaper for Vanilla OS 2 Orchid][4]

The VSO tool in Vanilla OS served as one of the utilities to perform management tasks.

This time, VSO v2 evolves as the default package manager, and the default shell in Vanilla OS 2.

![Vanilla OS 2 Startup Wizard to help you install essential apps][5]

It aims to make installing Debian packages easy, with a double click on the files you download. Furthermore, it aims to support installing .apk files as well.

At the time of writing this, it supports Android applications via CLI only.

In one of the [development blog post][6], they explain this better:

> In VSO v2, there is a subsystem based on Vanilla OS Pico. This subsystem will be a system-integrated container which supports systemd, allowing straightforward installation, removal, and management of packages, both graphically and through the command line.

### 3\. APX Developer Tool Improves

![][7]

Apx is a developer-focused utility that lets you create isolated environments to test things and install different packages from other Linux distributions.

With Vanilla OS 2, you can do the same thing through stacks, making the isolated environment shareable with your team and restorable.

The developers also note of a benefit with this new structure, which is:

> The user can create stacks for each use case, for example, one with all the tools and libraries useful for development in various domains like 3D applications, music production, programming, etc.

### 4\. OCI Support in ABRoot

While Vanilla OS already offers immutability, and atomic updates with ABRoot utility.

Now, ABRoot v2 improves the reliability and stability of such updates with the addition of OCI support. The devs will have greater control over the updates, more time to test the image, and avoid the use of package manager to keep a copy of the system and the changes by the user.

![][8]

In a recent blog post, the devs mentioned:

> We redesigned [ABRoot][9] to manage the system from boot to the user's initial interactions, handling boot management, fstab, and initramfs.

So, with the updated ABRoot v2, advanced users get to edit kernel flags, and install drivers without worrying about anything else.

You do not have to stress about the technical details. For the end user, it means, a reliable experience.

### 5\. Ability to Create Your Custom Image

The flagship edition of Vanilla OS 2 will feature GNOME as the desktop environment.

However, if you need something different, you can just build a new custom image on top of the official image using [Vib][10] **(Vanilla Image Builder).** It uses modules to build the image, which makes it convenient for you to customize as per requirement.

### 6\. Dropping the "sudo" Command

It might sound shocking, but yes, you can't "sudo" your way in Vanilla OS when using the host system.

So, what's the alternative? And, why? Here's an excerpt from their blog post:

> By eliminating `sudo`, the risk of accidental or harmful operations performed by unauthorized entities would get reduced. Since Vanilla OS promotes a secure and stable environment, we are limiting privileged access to help preserve the system's integrity. The absence of `sudo` would encourage the adoption of a more structured approach to privilege management. Tools like Apx, VSO, and ABRoot offer specific mechanisms for system administration, allowing users to perform configuration and update operations securely and in a controlled manner.

Vanilla OS encourages you to utilize the utilities that come with it for all kinds of administrative access/changes. You can still do all the things that require admin rights, but with a different command and in a safer way.

💡

****This is only applicable when you use the host system. By default, the user ends up in a container, where you can use sudo as you normally do.****

Sure, this could be a little inconvenient for some users to adapt to. But, for the most part, this may not have an impact on the user experience.

### Wrapping Up

Vanilla OS 2 sounds impressive and intriguing. It may not be for everyone, but it sounds like it's bringing in some ambitious changes to provide a reliable user experience.

Of course, once we get a beta release, it would appropriate it judge things better.

Until then, we are excited to see what it brings to the table!

_💬 What do you think about Vanilla OS 2 Orchid? Let us know in the comments section below._

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/vanilla-os-2-beta-release-date/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/lesser-known-distros-2023/
[2]: https://news.itsfoss.com/content/images/2024/01/debian-sid.png
[3]: https://news.itsfoss.com/content/images/2024/01/vanillaos-neofetch.jpg
[4]: https://news.itsfoss.com/content/images/2024/01/orchid-light.jpg
[5]: https://news.itsfoss.com/content/images/2024/01/vanilla-os-2-apps.jpg
[6]: https://vanillaos.org/blog/article/2023-06-11/vanilla-os-orchid---devlog-11-jun#vso-as-a-system-package-manager
[7]: https://news.itsfoss.com/content/images/2024/01/apx-gui.png
[8]: https://news.itsfoss.com/content/images/2024/01/vanillaos-grub-abroot.jpg
[9]: https://github.com/Vanilla-OS/ABRoot
[10]: https://news.itsfoss.com/vanilla-os-2-beta-release-date/We%20redesigned%20ABRoot%20to%20manage%20the%20system%20from%20boot%20to%20the%20user's%20initial%20interactions,%20handling%20boot%20management,%20fstab,%20and%20initramfs
