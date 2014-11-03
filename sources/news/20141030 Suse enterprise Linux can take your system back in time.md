Suse enterprise Linux can take your system back in time
================================================================================
> Suse Linux Enterprise Server 12 features a new system snapshot and rollback capability

The newest enterprise edition of the Suse Linux distribution allows administrators to go back in time, for instance, to immediately before they made that fatal system-crippling mistake. 

Suse Linux Enterprise Server 12 (SLES 12) features a system snapshot and rollback capability that allows the user to boot the system to an earlier configuration, should the latest one unexpectedly fail.

Such a capability can be handy for undoing a system configuration change that did not turn out as expected. For instance, an administrator might have the SLES computer in a perfectly fine running state, but then install a botched software update, or make a change that destroys the kernel. Typically, Unix systems have been unforgiving about such mistakes, forcing the administrator to reinstall the system software from scratch, should they not know how to undo the unfortunate change.

"This stuff happens, for whatever reason," said Matthias Eckermann, Suse senior product manager. "So the admin has an emergency exit, so to speak."

Users of Microsoft Windows and Apple Macintosh systems have long enjoyed rollback functionality within their respective OSes, but this capability had been missing in Unix-based systems such as Linux, at least as a native function of the OS. 

For this functionality, the Suse team used the [Btrfs][1] file system (B-tree file system, often pronounced as "Butter FS"), an open-source file system developed by Oracle engineer Chris Mason ([now at Facebook][2]). Mason created Btrfs to address emerging enterprise requirements such as the ability to make snapshots and to scale across multiple storage nodes. 

Although Btrfs is supported in the mainline Linux kernel, SLES is the first major Linux distribution to use Btrfs as the default file system. "Over the last five years, we specifically focused on making Btrfs enterprise-ready," Eckermann said.

The rollback capability also relies on the open-source tool [Snapper][3], first developed by Suse, to manage the snapshots. 

The Suse team integrated Snapper with SLES so that users now have the ability, when the OS is first being loaded, to boot into an earlier snapshot of the system. "Whoever installs SLES 12 gets this capability by default," Eckermann said. 

SLES also integrated Btrfs with the [Samba Windows file server][4], which makes Linux files accessible to Windows machines. For Windows users, SLES can now make multiple snapshots of a file appear as different versions of a file, which are all accessible. 

Initially, Enterprise Suse supports rollbacks for only system changes, though users can also deploy it to handle changes in a user's home directory, in which data is typically kept. "We already have it running, but it is not supported," Eckermann said. Users can continue to use ext3, ext4 or some other traditional Linux file system as their default.

SLES 12, released Monday, comes with a number of other features as well. Like other distributions, SLES has [caught the fever for Docker containers][5] and now comes with a built-in framework to run this virtualization technology. For the first time, the package also provides geo-clustering, which allows the user to build replicate clusters across different geographic regions. 

An organization could use geo-clustering, for instance, to set up multiple copies of a single cluster in data centers around the world, so if one or more regions go offline, the others can continue operations unabated, Eckermann said. 

Suse [is among the world's most widely used distributions][6] of Linux, along with Ubuntu/Debian, and Red Hat Enterprise Linux. A free version is available under OpenSuse and Suse Linux offers a commercial edition packaged for enterprise usage. 

Suse Linux's parent company, Attachmate, is in the process of merging with Micro Focus. Eckermann expects no major changes in the operations of Suse Linux resulting from the new ownership. 

SLES 12 is [offered at an annual subscription][7] of US$349 per server. A free 60-day trial is also available. 

![](http://images.techhive.com/images/article/2014/10/sle_12_installed_system_08_snapper_gui-2-100527225-large.idge.png)

Through the combined powers of the Btrfs file system and the Snapper utility, SUSE Enterprise Linux can now take snapshots of the system, and roll back to an earlier configuration if necessary.

--------------------------------------------------------------------------------

via: http://www.computerworld.com/article/2838950/suse-enterprise-linux-can-take-your-system-back-in-time.html

作者：[Joab Jackson][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.computerworld.com/author/Joab-Jackson/
[1]:https://btrfs.wiki.kernel.org/index.php/Main_Page
[2]:http://www.phoronix.com/scan.php?page=news_item&px=MTUzNTE
[3]:http://snapper.io/
[4]:http://www.samba.org/
[5]:http://www.pcworld.com/article/2838452/canonical-celebrates-cloud-freedoms-with-new-ubuntu.html
[6]:http://distrowatch.com/table.php?distribution=suse
[7]:https://www.suse.com/products/server/how-to-buy/