How to setup Remi repository on CentOS 5/6 and Fedora 18/19/20
================================================================================
Remi repository

The [Remi (Les RPM de Remi) repository][1] provides the latest version of various software packages related to php and mysql for redhat based linux distros like centos, fedora and RHEL. It provides php, mysql, pecl packages, pear packages any many other open source/free php applications and libraries and many other php related packages. So its designed to assist in setting up apache+php based web servers with various kinds of open source applications. The default centos/fedora distros do no have the latest versions of these packages so repositories like Remi do the job.

The repository can be easily setup on CentOS/Fedora through the installer rpm which will setup the repository configuration.

### Setup on CentOS 5.x/6.x ###

The Remi installer rpm file is available for both 5.x and 6.x versions of CentOS. The urls are as follows

CentOS 5.x - [http://rpms.famillecollet.com/enterprise/remi-release-5.rpm][2]
CentOS 6.x - [http://rpms.famillecollet.com/enterprise/remi-release-6.rpm][3]

On CentOS The Remi repository depends on the Epel repository which must be installed along with it, for it to work. If you already have epel repository setup then execute the following command

    $ wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
    $ rpm -Uvh remi-release-6*.rpm

If you do not already have Epel setup then run the following command. It will download the Epel installer file and install it along with Remi

    $ wget http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
    $ wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
    $ rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm

For CentOS 5.x

    $ wget http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm
    $ wget http://rpms.famillecollet.com/enterprise/remi-release-5.rpm
   $ rpm -Uvh remi-release-5*.rpm epel-release-5*.rpm

Thats it. Now the remi repository should be setup on your CentOS system.

### Setup on Fedora 18/19 ###

On Fedora, Remi depends on the [Rpmfusion][4] repository. So first setup the rpmfusion repository.

    ## Remi Dependency on Fedora 19 / 18 / 17 ##
    rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm 
    rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm

The rpm file and configuration instructions for rpmfusion can be found here.

After rpmfusion is setup, move ahead to setting up Remi.

    $ wget http://rpms.famillecollet.com/remi-release-19.rpm
    $ yum install remi-release-19.rpm

Or directly

    ## Fedora 20 ##
    rpm -Uvh http://rpms.famillecollet.com/remi-release-20.rpm

    ## Fedora 19 ##
    rpm -Uvh http://rpms.famillecollet.com/remi-release-19.rpm
 
    ## Fedora 18 ##
    rpm -Uvh http://rpms.famillecollet.com/remi-release-18.rpm
 
    ## Fedora 17 ##
    rpm -Uvh http://rpms.famillecollet.com/remi-release-17.rpm

Make sure to use the correct url for your Fedora version. That should finish setting up the Remi repository on Fedora.

### Verify Remi ###

After setting up the Remi repository, its time to check if its properly done. The Remi repository is disabled by default. If you want to enable it permanently then edit the file /etc/yum.repos.d/remi.repo

    $ sudo nano /etc/yum.repos.d/remi.repo

> [remi]
> name=Les RPM de remi pour Enterprise Linux 6 - $basearch
> #baseurl=http://rpms.famillecollet.com/enterprise/6/remi/$basearch/
> mirrorlist=http://rpms.famillecollet.com/enterprise/6/remi/mirror
> enabled=0
> gpgcheck=1
> gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi

The very first section that starts with [remi] is the main repository. Change the value of enabled from 0 to 1 to enable it.

Otherwise it can be enabled via yum when needed using the enablerepo option.

    # yum repolist --enablerepo=remi
    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: virror.hanoilug.org
     * epel: mirror.unej.ac.id
     * extras: mirrors.fibo.vn
     * remi: mirror.smartmedia.net.id
     * updates: mirrors.fibo.vn
    repo id       repo name                                               status
    base          CentOS-6 - Base                                          6,381
    epel          Extra Packages for Enterprise Linux 6 - x86_64          10,031
    extras        CentOS-6 - Extras                                           13
    nginx         nginx repo                                                  47
    remi          Les RPM de remi pour Enterprise Linux 6 - x86_64         1,320
    updates       CentOS-6 - Updates                                       1,555
    repolist: 19,347
    #

Using the enablerepo option is sufficient when needed. As can be seen, the remi repository provides around 1320 packages. There are 2 more repos, namely remi-php55 and remi-test that provide even more packages.

### List all packages ###

To list out all the packages provided by the Remi repo, use the following command.

    # yum --disablerepo=* --enablerepo=remi,remi-php55,remi-test list available | less

### Install packages from Remi repository ###

To install packages from Remi repo, use the enablerepo option again

    # yum --enablerepo=remi,remi-php55 install php

### Resources ###

Remi repository official site
[http://rpms.famillecollet.com/][5]

Remi FAQ
[http://blog.famillecollet.com/pages/English-FAQ][6]

Remi repository configuration instructions
[http://blog.famillecollet.com/pages/Config-en][7]

--------------------------------------------------------------------------------

via: http://www.binarytides.com/setup-remi-repository-centos-fedora/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://rpms.famillecollet.com/
[2]:http://rpms.famillecollet.com/enterprise/remi-release-5.rpm
[3]:http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
[4]:http://rpmfusion.org/
[5]:http://rpms.famillecollet.com/
[6]:http://blog.famillecollet.com/pages/English-FAQ
[7]:http://blog.famillecollet.com/pages/Config-en