Translating--------geekpi

Linux FAQs with Answers--How to install REMI repository on CentOS or RHEL
================================================================================
> **Question**: How can I configure the REMI repository on CentOS or RHEL, and install packages from the REMI repository? 

The [REMI repository][1] offers updated versions of core CentOS and RHEL packages, notably the latest PHP/MySQL stack.

One thing to remember before installing the REMI repository is that it is not recommended to run yum update with the REMI repository. Since the package names of the REMI repository are the same as those used in the official RHEL/CentOS repositories, running yum update may trigger accidental upgrades of core packages. It is a good idea to keep the REMI repository disabled, and enable it only when you need to install packages that are only available in REMI.

### Prerequisite ###

Before installing REMI repository, you first need to enable the EPEL repository because some packages in REMI depend on EPEL. Follow [this guide][2] to set up EPEL repository on CentOS or RHEL.

### Install REMI Repository ###

Now go ahead and install REMI repository as follows.

On CentOS 7:

    $ sudo rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi
    $ sudo rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

On CentOS 6:

    $ sudo rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi
    $ sudo rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

By default, the REMI repository is set disabled. To check whether the REMI repository is successfully installed, use this command. You will see several REMI repositories such as remi, remi-php55 and remi-php56.

    $ yum repolist disabled | grep remi 

![](https://farm4.staticflickr.com/3956/15443851690_a1abe9eb40_z.jpg)

### Install a Package from REMI Repository ###

As clarified, it is a good idea to keep the REMI repository disabled, and use it only when necessary.

To search or install a package in the REMI repository, use these commands:

    $ sudo yum --enablerepo=remi search <keyword>
    $ sudo yum --enablerepo=remi install <package-name> 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-remi-repository-centos-rhel.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://rpms.famillecollet.com/
[2]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html