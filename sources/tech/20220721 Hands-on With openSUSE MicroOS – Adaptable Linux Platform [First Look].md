[#]: subject: "Hands-on With openSUSE MicroOS – Adaptable Linux Platform [First Look]"
[#]: via: "https://www.debugpoint.com/opensuse-microos-alp-first-look/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Hands-on With openSUSE MicroOS – Adaptable Linux Platform [First Look]
======
We tried the openSUSE MicroOS in a virtual machine. Here’s how it looks.

![][0]

![openSUSE MicroOS – ALP – KDE Plasma Desktop][1]

### Context

A while back, I [wrote][2] about the Adaptable Linux Platform (ALP) from openSUSE, which may replace the current long-term-support version of openSUSE Leap.

During that time, little information was available on what exactly ALP is? How does it look?

That said, we now have a test ISO to try additional detail about openSUSE MicroOS. And I did a quick spin and listed down the findings.

Read on.

### What is an Adaptable Linux Platform?

By definition, openSUSE Micro OS via ALP introduces an atomic and transactional-based Linux operating system with a read-only root partition (via the [btrfs file system][3]). Targeted to host container workloads, it gives several advantages over traditional Linux Operating systems.

Your root file system remains intact in every boot over your installation’s life cycle. The OS updates happen via HTTPS, and it’s atomic in nature. Via btrfs, the MicroOS creates multiple subvolumes – read-only and writable. This is one of the great advantages of btrfs, which Fedora Linux adopted as a default file system last year.

You might be wondering, what about the software or apps you install. Well, when you install applications in MicroOS, it gets installed in a container completely separate from the root file system. It gives you advantages of early rollback, safe for harmful scripts and easy recovery for a failed system.

To compare, it’s more like [Fedora Silverblue][4] or [Fedora Kinoite][5], which have the same atomic concept.

### What is the future of openSUSE Leap?

Although it is not clear about the future of openSUSE Leap but looks like the final release of openSUSE Leap would be 15.5, which is due on 2023. And after that, MicroOS gets the “Leap” version of openSUSE.

“SUSE Linux Enterprise 15 is using the tick-tock model, where 15 SP4 would be the feature release while 15 SP5 would be more of a bug fix or perhaps it better to say *maintenance* release” says Lubos Kocman in an earlier [email][6].

### openSUSE MicroOS – Test Drive

#### Download and Installation

Almost all the necessary types of MicroOS images are available, classified by CPU architecture and platforms. So, you have the traditional 64-bit ISO image with Desktop Environments for desktops, laptops, and then the other container, cloud and VM images.

For Laptops and desktops, the available options at the moment are GNOME & KDE Plasma. And it supports only KVM for virtual machines (such as [virt-manager][7]).

I downloaded the KDE Plasma edition with a full DVD image of around 3+ GB in size. You can find the download links [here][8].

The installer is the same as the openSUSE installer. However, there are specific settings for the type of MicroOS installation you want to perform. For example, before installation, you need to choose whether the installation is for desktops, containers, remote attestations and others.

![openSUSE MicroOS Installation options][9]

Thus, a default installation, for example, KDE Plasma, takes approx 2 GB of disk space.

The installation went fine, with no problem whatsoever.

Let’s explore.

#### Inner Workings of openSUSE MicroOS

From an average user standpoint, you may not find any difference between a normal openSUSE install and a MicroOS installation. The same Login screens, desktops and apps.

But there are differences in how it is configured.

Firstly, the installation partition has several subvolumes. As you can see in the below image, it has several volumes, including a .snapshot directory. This directory stores snapshots of your system, as mentioned above. It’s a complete file system copy.

![Subvolume structure in MicroOS][10]

The .snapshot directory is further expanded with the snapshot#, which increments by 1 starting with 1. As you can see in the image below, the first snapshot 1 has a complete filesystem copy.

![Snapshot contents][11]

Since the system is read-only, you can’t do much. That’s the idea of an atomic system. But it is difficult for an average user to try it out if they don’t have a concept of a container or usage of the Toolbox. For example, there are no browser or Yast packages to install. Since I have used KDE Plasma, Discover won’t let me install any apps.

And Zypper is also not allowing it to.

But the [Toolbox][12] worked as it was supposed to. Initially, I thought it was not installed by default.

The default installation of the Toolbox worked perfectly; it created a container by default with the username.

![Toolbox creating a container in MicroOS][13]

I managed to install a sample package to test the container in MicroOS.

![Installing apps in a container in MicroOS][14]

### Wrapping Up

I hope this helps you to understand and get an idea about the openSUSE MicroOS and its inner workings. Since it is still under development, many changes may arrive in the future.

If you are an openSUSE Leap user, you must try it and see how it’s falling into your current workflow. Because at a certain point in future, Leap shall not be available anymore. So, you may want to adopt MicroOS or Tumbleweed.

Hence, the team is also looking for your feedback, comments or suggestions while you try this dev build and help to steer its development and decisions. You can create a post on the [official mailing list][15] with your feedback and questions.

Finally, what do you think about MicroOS and Leap’s future? Does it beneficial for the sysadmins and average users? Let me know in the comment box below.

*[Via openSUSE Blog][16]*

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/opensuse-microos-alp-first-look/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[0]: https://www.debugpoint.com/wp-content/uploads/2022/07/opensusehead1.jpg
[1]: https://www.debugpoint.com/wp-content/uploads/2022/07/openSUSE-MicroOS-ALP-KDE-Plasma-Desktop.jpg
[2]: https://debugpointnews.com/alp-opensuse-announcement/
[3]: https://btrfs.wiki.kernel.org/index.php/Main_Page
[4]: https://silverblue.fedoraproject.org/
[5]: https://kinoite.fedoraproject.org/
[6]: https://lists.opensuse.org/archives/list/project@lists.opensuse.org/thread/SHINA373OTC7M4CVICCKXDUXN5C3MYX3/
[7]: https://www.debugpoint.com/virt-manager/
[8]: https://get.opensuse.org/microos/
[9]: https://www.debugpoint.com/wp-content/uploads/2022/07/openSUSE-MicroOS-Installation-options.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/07/Subvolume-structure-in-MicroOS.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/07/Snapshot-contents.jpg
[12]: https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/
[13]: https://www.debugpoint.com/wp-content/uploads/2022/07/Toolbox-creating-a-container-in-MicroOS1.jpg
[14]: https://www.debugpoint.com/wp-content/uploads/2022/07/Installing-apps-in-container-in-MicroOS.jpg
[15]: https://lists.opensuse.org/archives/list/alp-community-wg@lists.opensuse.org/
[16]: https://news.opensuse.org/2022/07/19/microos-desktop-use-to-help-with-alp-feedback/
