linuhap 翻译中
CoreOS Linux ending the upgrade cycle
================================================================================
> CoreOS launches commercially supported version of its Linux distribution and vows to do away with manual upgrading

IDG News Service - Hoping to simplify life for system administrators, CoreOS has launched a commercial Linux distribution that continually updates itself, eliminating the need to perform major upgrades.

CoreOS is offering its namesake Linux distribution as a commercial service, [starting][1] at $100 a month.

"Businesses today can begin to think of CoreOS as an extension of their OS team, and for enterprise Linux customers this is the last migration they will ever need," said Alex Polvi, founder and CEO of CoreOS, in a statement.

Commercial Linux subscriptions are nothing new: Both [Red Hat][2] and [Suse][3] offer commercial subscriptions for their respective distributions.

Because the applications and libraries these Linux-based companies use are open source and freely available, the cost of the subscriptions doesn't cover the software itself, but rather pays for the updates, bug fixes, integration and technical support for when issues occur.

CoreOS will be different from these distributions, the company asserted, in that there will be no major updates, which typically require updating all the packages in the distribution at once. Instead, updates and new features will be streamed automatically to the copy of the OS and applied as soon as they are ready.

The service offers a dashboard, called CoreUpdate, that provides controls for designating which software packages should get updated, should the administrator not want all the packages to be updated automatically.

CoreUpdate can manage multiple machines at once, and offers a roll-back capability should an update cause issues.

Launched last December, CoreOS was designed to [focus][4] on an emerging use of the open-source OS kernel -- that of powering lots of cloud-based virtual servers.

The average CoreOS instance was designed to consume only less than half of what other Linux distributions typically consume. All applications that run on the distribution run in Docker virtualized containers, so they can be started almost instantaneously.

The distribution can be updated more easily [due to its novel use of two partitions][5]. One can contain the current version of the OS while the OS is being updated in the other, smoothing the process of upgrading a package, or the entire distribution.

The CoreOS service can be run on-premises, or through Amazon, Google and Rackspace cloud services.

CoreOS also announced Monday that it received $8 million in backing from the Kleiner Perkins Caulfield and Byers venture capital firm. The company has previously gotten investment from Sequoia Capital and Fuel Capital.

----------

Joab Jackson covers enterprise software and general technology breaking news for The IDG News Service. Follow Joab on Twitter at [@Joab_Jackson][6]. Joab's e-mail address is [Joab_Jackson@idg.com][7]

--------------------------------------------------------------------------------

via: http://www.computerworld.com/s/article/9249460/CoreOS_Linux_ending_the_upgrade_cycle?taxonomyId=122

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://coreos.com/products/managed-linux/plans/
[2]:http://www.redhat.com/about/subscription/
[3]:https://www.suse.com/support/programs/subscriptions/
[4]:http://www.networkworld.com/article/2177120/cloud-computing/coreos-linux-distro-lands-on-the-google-cloud-platform.html
[5]:https://coreos.com/using-coreos/updates/
[6]:http://twitter.com/Joab_Jackson
[7]:Joab_Jackson@idg.com
