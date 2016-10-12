A Look At The Most Promising Next-Gen Linux Software Update Mechanisms
====

 ![OPERATING SYSTEMS -- ](http://phoronix.com/assets/categories/operatingsystems.jpg)

With traditional software package management solutions like APT and Yum showing their age and not adapting well to the embedded world and the slew of new areas for Linux like IoT, a new generation of atomic-based Linux software update solutions continue to be worked on. Matt Porter of the Konsulko Group is presenting at this week's Embedded Linux Conference Europe 2016 with a comparison of these update technologies.

Incremental atomic updates have been what's being pursued by multiple Linux software vendors for delivering more reliable distribution updates, smaller sized updates via binary deltas, and generally allow rollbacks in case of problems. Some of the new distribution update mechanisms covered included SWUpdate, Mender, OSTree, and swupd. Interestingly, not mentioned in the slide deck is Ubuntu's Snappy.

SWUpdate is a single/dual image update framework that's modular, supports signed images, makes use of Kconfig for configurations, can handle local or remote updates, etc. [SWUpdate](https://github.com/sbabic/swupdate) is particularly designed for embedded systems.

[Mender](https://github.com/mendersoftware/mender) meanwhile is a solution aimed at over-the-air software updates. Mender is written in the Go programming language and is a dual-image update framework.

One of the most well known talked about in this presentation is [OSTree](https://github.com/ostreedev/ostree) for incremental atomic upgrades. OSTree is Git-like and is used by Fedora / Red Hat and GNOME's container system Flatpak also makes use of OSTree.

Talked about lastly was swupd, the update system spearheaded by Intel's Clear Linux distribution. Swupd is hosted on [GitHub](https://github.com/clearlinux/swupd-client) with its client and server portions hosted by Clear Linux. Swupd is similar to OSTree but does not require reboots to activate bundles.

For those not in Berlin for the Embedded Linux Conference Europe, you can learn more about these different software update mechanisms with a focus on embedded Linux via [these PDF slides](http://events.linuxfoundation.org/sites/events/files/slides/Comparison%20of%20Linux%20Software%20Update%20Technologies.pdf).

--------------------------------------------------------------------------------

via: http://phoronix.com/scan.php?page=news_item&px=ELC2016-Software-Updates

作者：[Michael Larabel][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.michaellarabel.com/
