    NearTan 选题
How to setup EPEL repository on CentOS 5/6
================================================================================
What is EPEL repository

EPEL (Extra Packages for Enterprise Linux) is a project from the Fedora group that maintains a repository of software packages that are not already present on RHEL/CentOS. The repository is compatible with RHEL and all close derivates like CentOS and Scientific Linux.

By using epel we can easily install many packages (around 10,000) with yum command, that are not already present in the centos repositories. EPEL packages are usually based on their Fedora counterparts and will never conflict with or replace packages in the base Enterprise Linux distributions.

Further details about the epel project are available at

[https://fedoraproject.org/wiki/EPEL][1]

So in this tutorial I am going show you how to setup the epel repositories on CentOS

> Note - There are many different 3rd party repositories that provide software packages for RHEL/CentOS systems. Some of the most popular ones are RpmForge, RpmFusion, EPEL, Remi etc.
> 
> However it should be always kept in mind, that if multiple such third party repositories are added to a system, then it can lead of conflicts. The same package can come from multiple repositories, and some repositories can replace base packages of a system leading to unexpected troubles. Rpmforge and Epel are known to have conflicts.
> 
> There are advanced techniques to tackle this like setting up priorities, or selectively installing packages from repositories, but ofcourse these require a lot of effort and so if you are not sure about all this, it is recommended to only use 1 such external repository.

### Install EPEL on CentOS ###

To setup epel on centos, we need to download the epel installation rpm and install it.
The downloads pages for version 6.x and 5.x of CentOS/RHEL are the following

[http://download.fedoraproject.org/pub/epel/6/i386/repoview/epel-release.html][2]
[http://download.fedoraproject.org/pub/epel/5/i386/repoview/epel-release.html][3]

The above urls would probably redirect to country specific mirrors for faster download. The page would contain a download link to download the rpm directly. The direct download links are

[http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm][4]
[http://download.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm][5]

Select the correct url depending on your centos version.
Note that the EPEL installer package is architecture independant, so can be installed on both x86 and x64 systems.

### 1. Check your CentOS version ###

First check your centos version with the following command

    $ cat /etc/redhat-release 
    CentOS release 6.4 (Final)

### 2. Download EPEL rpm ###

Now download the epel rpm file for the corresponding centos version from one of the urls given above.

    $ wget http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

### 3. Install the EPEL rpm ###

Now install the epel package with the rpm command

    $ sudo rpm -ivh epel-release-6-8.noarch.rpm
    or
    $ sudo rpm -ivh epel-release*

### 5. Check EPEL repository ###

After installing the epel repository, check that it has been added to the repository list with the yum command

    # yum repolist
    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: mirrors.vonline.vn
     * epel: buaya.klas.or.id
     * extras: centos-hn.viettelidc.com.vn
     * updates: mirrors.fibo.vn
    repo id        repo name                                              status
    base           CentOS-6 - Base                                         6,381
    epel           Extra Packages for Enterprise Linux 6 - x86_64         10,023
    extras         CentOS-6 - Extras                                          13
    nginx          nginx repo                                                 47
    updates        CentOS-6 - Updates                                      1,555
    repolist: 18,019

The epel is listed after base repo and provides around 10K packages. So epel is now setup on CentOS.
The epel repository is setup in the **/etc/yum.repos.d/epel.repo** file.

Now install something from the epel repository

    $ sudo yum install htop

--------------------------------------------------------------------------------

via: http://www.binarytides.com/setup-epel-repository-centos/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://fedoraproject.org/wiki/EPEL
[2]:http://download.fedoraproject.org/pub/epel/6/i386/repoview/epel-release.html
[3]:http://download.fedoraproject.org/pub/epel/5/i386/repoview/epel-release.html
[4]:http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm