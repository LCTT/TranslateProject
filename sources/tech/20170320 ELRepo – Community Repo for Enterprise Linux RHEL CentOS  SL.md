ELRepo – Community Repo for Enterprise Linux (RHEL, CentOS & SL)
============================================================


If you are using an Enterprise Linux distribution (Red Hat Enterprise Linux or one of its derivatives, such as CentOS or Scientific Linux) and need support for specific or new hardware, you are in the right place.

In this article we will discuss how to enable the ELRepo repository, a software source that includes everything from filesystem drivers to webcam drivers with everything in between (support for graphics, network cards, sound devices, and even [new kernels][1]).

### Enabling ELRepo in Enterprise Linux

Although ELRepo is a third-party repository, it is well supported by an active community on Freenode (#elrepo) and a mailing list for users.

If you are still apprehensive about adding an independent repository to your software sources, note that the CentOS project lists it as trustworthy in its wiki ([see here][2]). If you still have concerns, feel free to ask away in the comments!

It is important to note that ELRepo not only provides support for Enterprise Linux 7, but also for previous versions. Considering that CentOS 5 is reaching its end of life (EOL) at the end of this month (March 2017) that may not seem like a big deal, but keep in mind that CentOS 6 won’t reach its EOL until March 2020.

Regardless of the EL version, you will need to import the repository’s GPG key before actually enabling it:

```
# rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
```

#### Enable ELRepo in EL5

```
# rpm -Uvh http://www.elrepo.org/elrepo-release-5-5.el5.elrepo.noarch.rpm
```

#### Enable ELRepo in EL6

```
# rpm -Uvh http://www.elrepo.org/elrepo-release-6-6.el6.elrepo.noarch.rpm
```

#### Enable ELRepo in EL7

```
# rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
```

In this article we will only deal with EL7, and share a few examples in the next section.

### Understand ELRepo Channels

To better organize the software contained in this repository, ELRepo is divided into 4 separate channels:

*   elrepo is the main channel and is enabled by default. It does not contain packages present in the official distribution.
*   elrepo-extras contains packages that replace some provided by the distribution. It is not enabled by default. To avoid confusion, when a package needs to be installed or updated from this repository, it can be temporarily enabled via yum as follows (replace package with an actual package name):

```
# yum --enablerepo=elrepo-extras install package
```

*   elrepo-testing provides packages that will at one point be part of the main channel but are still under testing.
*   elrepo-kernel provides long term and stable mainline kernels that have been specially configured for EL.

Both elrepo-testing and elrepo-kernel are disabled by default and can be enabled as in the case of elrepo-extras if we [need to install or update a package][3] from them.

To list the available packages in each channel, run one of the following commands:

```
# yum --disablerepo="*" --enablerepo="elrepo" list available
# yum --disablerepo="*" --enablerepo="elrepo-extras" list available
# yum --disablerepo="*" --enablerepo="elrepo-testing" list available
# yum --disablerepo="*" --enablerepo="elrepo-kernel" list available
```

The following images illustrates the first example:

[
 ![List ELRepo Available Packages](http://www.tecmint.com/wp-content/uploads/2017/03/List-ELRepo-Available-Packages.png) 
][4]

List ELRepo Available Packages

##### Summary

In this post we have explained what is ELRepo and what are the circumstances where you may want to add it to your software sources.

If you have any questions or comments about this article, feel free to use the form below to reach us. We look forward to hearing from you!

--------------------------------------------------------------------------------

作者简介：

Gabriel Cánepa is a GNU/Linux sysadmin and web developer from Villa Mercedes, San Luis, Argentina. He works for a worldwide leading consumer product company and takes great pleasure in using FOSS tools to increase productivity in all areas of his daily work.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/enable-elrepo-in-rhel-centos-scientific-linux/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/

[1]:http://www.tecmint.com/install-upgrade-kernel-version-in-centos-7/
[2]:https://wiki.centos.org/AdditionalResources/Repositories
[3]:http://www.tecmint.com/auto-install-security-patches-updates-on-centos-rhel/
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/List-ELRepo-Available-Packages.png
[5]:http://www.tecmint.com/author/gacanepa/
[6]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[7]:http://www.tecmint.com/free-linux-shell-scripting-books/
