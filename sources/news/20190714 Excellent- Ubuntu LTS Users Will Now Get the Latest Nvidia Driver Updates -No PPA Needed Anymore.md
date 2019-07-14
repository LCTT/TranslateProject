[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Excellent! Ubuntu LTS Users Will Now Get the Latest Nvidia Driver Updates [No PPA Needed Anymore])
[#]: via: (https://itsfoss.com/ubuntu-lts-latest-nvidia-drivers/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Excellent! Ubuntu LTS Users Will Now Get the Latest Nvidia Driver Updates [No PPA Needed Anymore]
======

_**Brief: To get the latest Nvidia drivers in Ubuntu LTS versions, you don’t have to use PPA anymore. The latest drivers will now be available in the repositories of the Ubuntu LTS versions.**_

![][1]

You might be aware of the troubles to install the latest and greatest Nvidia binary driver updates on Ubuntu.

By default, Ubuntu provides the open source [Nvidia Nouveau drivers][2] that some time result in Ubuntu being stuck at boot screen.

You can also [install the proprietary Nvidia driver in Ubuntu][3] easily. The problem is that the Nvidia drivers in the default [Ubuntu repositories][4] are not the latest one. To solve this problem, [Ubuntu introduced a dedicated PPA][5] a few years back.

[Using the official PPA][6] is still a decent workaround for installing the closed source graphics driver. However, it is definitely not the most convenient option.

But, now, Ubuntu agreed to include the latest Nvidia driver update as part of the SRU ([StableReleaseUpdates][7]). So, you will have Nvidia drivers baked in with Ubuntu LTS versions.

Well, this means that you no longer have to separately download/install the Nvidia graphics drivers on Ubuntu LTS versions.

Just like you get an update for your browser or the core OS updates (or the security updates), similarly, you will get the required Nvidia binary driver update packages.

### Can We Rely on the Latest Nvidia Graphics Driver?

SRU literally refers to stable updates for Ubuntu (or Ubuntu-based distros). So, instead of opting for the pre-released updates in order to get the latest graphics driver, you should wait for it to drop as a stable update.

Of course, no one can guarantee that it will work 100% of the time – but it will be way more safe to install than the pre-released ones.

### How Can I Get the latest Nvidia drivers?

![Software Updates Nvidia][8]

You just have to enable “Using NVIDIA driver meta package….” from the additional drivers section in the software update option.

[][9]

Suggested read  Ubuntu 17.04 Release Date, Features And Upgrade Procedure

Originally, [The Linux Experiment][10] shared this news through a video – which then Ubuntu’s official Twitter handle re-tweeted as an announcement. You can watch the video below to get more details on it:

### Which Ubuntu LTS Versions are Supported?

For now, Ubuntu 18.04 LTS supports this out of the box. It will soon be available for Ubuntu 16.04 LTS (and later LTS versions will follow).

**Wrapping Up**

Now that you can install the latest Nvidia binary driver updates, how do you think will it help you?

If you have tested a pre-released package, let us know your thoughts on that in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-lts-latest-nvidia-drivers/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/nvidia-ubuntu-logo.png?resize=800%2C450&ssl=1
[2]: https://nouveau.freedesktop.org/wiki/
[3]: https://itsfoss.com/install-additional-drivers-ubuntu/
[4]: https://itsfoss.com/ubuntu-repositories/
[5]: https://itsfoss.com/ubuntu-official-ppa-graphics/
[6]: https://itsfoss.com/ppa-guide/
[7]: https://wiki.ubuntu.com/StableReleaseUpdates
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/software-updates-nvidia.jpg?fit=800%2C542&ssl=1
[9]: https://itsfoss.com/ubuntu-17-04-release-features/
[10]: https://twitter.com/thelinuxEXP
