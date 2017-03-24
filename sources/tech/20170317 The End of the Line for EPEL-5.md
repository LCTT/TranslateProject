translating---geekpi

# [The End of the Line for EPEL-5][1]


 ![](https://cdn.fedoramagazine.org/wp-content/uploads/2017/03/epel5-eol-945x400.png) 

For the last 10 years, the Fedora Project has been building packages for the same release of another operating system. **However on March 31st, 2017, that will come to an end** when Red Hat Enterprise Linux (RHEL) version 5 moves out of production.

### A Short History of EPEL

RHEL is a downstream rebuild of a subset of Fedora releases that Red Hat feels it can adequetely support over a multi-year lifetime. While these packages make for a full operating system, there have always been a need by system administrators for ‘more’ packages. Before RHEL-5, many of these packages would be built and supplied by various rebuilders. With Fedora Extras growing to include many of the packages, and several of the rebuilders having joined Fedora, there was an idea of combining forces and creating a dedicated sub-project who would rebuild Fedora packages with specific RHEL releases and then distribute them from Fedora’s centralized servers.

After much debate and a failure to come up with a catchy name, the Extra Packages for Enterprise Linux (or EPEL) sub-project of Fedora was created. While at first rebuilding packages for RHEL-4, the main goal was to have as many packages available for RHEL-5 when it arrived. It took a lot of hard work getting the plague builders in place, but most of the work was in crafting the rules and guidelines that EPEL would use for the next 10 years. [As anyone can see from the old mail archives][2], the debates were fierce from both various Fedora contributors feeling this took away focus from moving Fedora releases forward to outside contributors worried about conflicts with existing installed packages.

In the end, EPEL-5 went live sometime in April of 2007 and over the next 10 years grew to a repository of over 5000 source packages and 200,000 unique ip addresses checking in per day at its peak of 240,000 in early 2013\. While every package built for EPEL is done with the RHEL packages, all of these packages have been useful for the various community rebuilds (CentOS, Scientific Linux, Amazon Linux) of RHEL. This meant that growth in those eco-systems brought more users into using EPEL and helping on packaging as later RHEL releases came out. However as these newer releases and rebuilds grew in usage, the number of EPEL-5 users has gradually fallen to around 160,000 unique ip addresses per day. Also over that time, the number of packages supported by developers has fallen and the repository has shrunk in size to 2000 source packages.<>

Part of the shrinkage was due to the original rules put in place back in 2007\. At that time, Red Hat Enterprise Linux releases were only thought to have an active life time of 6 years before being end of lifed. It was thought that for such a ‘limited’ lifetime, packages could be ‘frozen’ in EPEL like they were in the RHEL release. This meant that whenever possible fixes should be backported and major changes would not be allowed. Time and packaging stands still for no human, and packages would be continually pruned from EPEL-5 as packagers no longer wanted to try and backport fixes. While various rules were loosened to allow for larger changes in packages, the packaging rules that Fedora used have continually moved and improved from 2007\. This has made trying to rebuild a package from newer releases harder and harder with the older operating systems.

### What Happens on March 31st 2017

As stated before, on March 31st Red Hat will end of life and no longer put updates out for RHEL-5 for regular customers. This means that
Fedora and the various rebuild distributors will start various archive processes. For the EPEL project this means that we will follow the steps that happen every year with Fedora releases.

1.  On **March 27th**, no new builds will be allowed to be pushed for EPEL-5 so that the repository is essentially frozen. This will allow mirrors to have a clear tree of all files.
2.  All packages in EPEL-5 will be hardlinked on the master mirror from `/pub/epel/5/` and `/pub/epel/testing/5/` to `/pub/archives/epel/`. **This will start happening on the 27th** so all mirrors of archives can populate their disks.
3.  Because March 31st happens on a Friday, and system administrators do not like Friday surprises, there will be no change then. On **April 3rd**, mirrormanager will be updated to point to the archives.
4.  On **April 6th**, the /pub/epel/5/ trees will be removed and mirrors will update accordingly.

For a system administrator who has cron jobs which do yum updates, there should be minimal hassle. The systems will continue to update and even install any packages which were in the archives at that time. There will be breakage for system administrators who have scripts which directly download files from mirrors. Those scripts will need to change to the new canonical location of /pub/archive/epel/5/.

While irksome, this is a blessing in disguise for many system administrators who will still be using an older Linux. Because packages have been regularly removed from EPEL-5, the various support mailing lists and irc channels have regular requests from system administrators wondering where some package they needed has gone. After the archive is done, this won’t be a problem because no more packages will be removed :).

For system administrators who have been hit by this problem, the older EPEL packages are still available though in a much slower method. All EPEL packages are built in the Fedora Koji system, and so older builds of packages can be found using [Koji search.][3]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/the-end-of-the-line-for-epel-5/

作者：[smooge][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://smooge.id.fedoraproject.org/
[1]:https://fedoramagazine.org/the-end-of-the-line-for-epel-5/
[2]:https://www.redhat.com/archives/epel-devel-list/2007-March/thread.html
[3]:https://koji.fedoraproject.org/koji/search
