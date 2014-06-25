Keep an eye on these 5 new features in RHEL 7
================================================================================
> RHEL 7 supports Docker containers, systemd, Microsoft-compatible ID management, and XFS for 500TB filesystems

![](http://www.infoworld.com/sites/infoworld.com/files/media/image/140.jpg)

After six-plus months of [public beta testing][1] and more than three years after its previous major point release, RHEL (Red Hat Enterprise Linux) version 7 is out. The update speaks to Red Hat's interests in outfitting RHEL with many of the latest enterprise and data center features. Here are the five top-of-the-line new additions to RHEL 7 that caught our eyes.

### 1. Docker ###

The biggest new addition to RHEL 7 is [tight integration][2] of [Docker][3], the explosively popular application-virtualization technology. With Docker itself [hitting 1.0 status][4], the timing on RHEL 7 couldn't be more fitting.

Apps packaged by Docker are isolated from the system and from each other, so they can be moved between systems and still run as expected. RHEL 7 is meant to be able to use Docker as efficiently as possible so that apps don't contend for resources or get confused about which edition of a runtime to use.

Long-term plans on the road map for Docker in RHEL involve possibly breaking the OS itself into a series of Docker containers, allowing as little or as much of a system to be deployed as needed with minimal overhead. Dubbed "[Project Atomic][5]," the initiative is still in the early stages, with Red Hat planning to deploy it first via its Fedora Linux distribution, nominally used as a testing ground for cutting-edge technologies.

### 2. Systemd ###

The inclusion of the systemd process manager may spark controversy among system administrators and Linux mavens. Systemd was developed to replace the init system in use since the days of proprietary Unix, and it allows, for example, more efficient loading of services during the boot process.

With systemd as a potential sore spot, Red Hat has not rushed in to add it. Fedora has included systemd as a default since version 15, released in 2010, giving Red Hat good experience with how systemd behaves in the real world. Also, systemd isn't joining RHEL 7 arbitrarily, but as part of larger plans for the OS. Red Hat wants to enhance the way Docker containers are supported in RHEL 7 by using systemd, for example.

### 3. XFS by default ###

A third major change, though not likely to raise nearly as many eyebrows, applies to the default file system used by RHEL to XFS.

Originally created by Silicon Graphics International, XFS has long been in production use with Linux systems, and on RHEL 7 it'll support file systems of up to 500TB in size. RHEL 6 used ext4 as the default, although it shipped with XFS as an option. Red Hat competitor Suse Linux [also supports XFS][6], although it [defaults to ext3][7] on installation.

Unfortunately, there's no real way to migrate from other file systems currently in use on RHEL -- such as ext4 or btrfs-- other than backing up and restoring.

### 4. Microsoft-compatible identity management ###

Even admins who aren't fans of Microsoft Windows have a grudging respect for Microsoft Active Directory. RHEL 7 improves the way RHEL deals with AD by adding two key new features. Cross-realm trusts can now be established between RHEL 7 and AD, so AD users can access resources on the Linux side without having to go through another sign-on step. The other big AD-related addition to RHEL 7, realmd, automates both the discovery of AD (or other Red Hat identity services) based on DNS information and the process of joining to it.

### 5. Performance Co-Pilot ###

Performance tuning without live statistics is like driving with the windshield painted over, so RHEL 7 introduces a new performance-monitoring system PCP ([Performance Co-Pilot][8]), [originally created][9] by Silicon Graphics International but now available as part of RHEL 7. In addition to monitoring and recording system stats, PCP sports APIs and a tool set for making that data available to other subsystems, such as -- you guessed it -- the newly introduced systemd.

Another minor addition in this vein: new performance profiles. RHEL 6 already had performance profiles, which are ways to tune RHEL overall to meet specific usage scenarios. RHEL 7 not only defaults to a new profile that emphasizes maximum throughput performance, but includes another new default profile for balancing performance against energy savings.

--------------------------------------------------------------------------------

via:http://www.infoworld.com/t/linux/keep-eye-these-5-new-features-in-rhel-7-244023 

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.infoworld.com/t/linux/red-hat-enterprise-linux-7-beta-now-available-232520
[2]:http://www.infoworld.com/t/application-virtualization/red-hat-fast-tracks-docker-apps-enterprise-linux-238122
[3]:http://www.infoworld.com/t/application-virtualization/docker-unleashed-app-portability-gets-boost-231716
[4]:http://www.infoworld.com/d/application-development/review-docker-10-ready-prime-time-243935
[5]:http://www.projectatomic.io/
[6]:https://www.suse.com/products/server/technical-information/
[7]:https://www.suse.com/products/server/technical-information/
[8]:http://developerblog.redhat.com/2013/11/19/exploratory-performance-pcp/
[9]:http://oss.sgi.com/projects/pcp/index.html