Dotcra translating
Best Third-Party Repositories for CentOS
============================================================


 ![CentOS](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/centos.png?itok=YRMQVk7U "CentOS") 
>Get reliable up-to-date packages for CentOS from the Software Collections repository, EPEL, and Remi.[Creative Commons Attribution][1]

Red Hat Enterprise Linux, in the grand tradition of enterprise software vendors, packages and supports old mold long after it should be dead and buried. They don't do this out of laziness, but because that is what their customers want. A lot of businesses view software the same way they see furniture: you buy a desk once and keep it forever, and software is just like a desk.

CentOS, as a RHEL clone, suffers from this as well. Red Hat supports deprecated software that is no longer supported by upstream -- presumably patching security holes and keeping it working. But that is not good enough when you are running a software stack that requires newer versions. I have bumped into this numerous times running web servers on RHEL and CentOS. LAMP stacks are not forgiving, and every piece of the stack must be compatible with all of the others. For example, last year I had ongoing drama with RHEL/CentOS because version 6 shipped with PHP 5.3, and version 7 had PHP 5.4\. PHP 5.3 was end-of-life in August, 2014 and unsupported by upstream. PHP 5.4 went EOL in Sept. 2015, and 5.5 in July 2016\. MySQL, Python, and many other ancient packages that should be on display in museums as mummies also ship in these releases.

So, what's a despairing admin to do? If you run both RHEL and CentOS turn first to the [Software Collections][3], as this is only Red Hat-supported source of updated packages. There is a Software Collections repository for CentOS, and installing and managing it is similar to any third-party repository, with a couple of unique twists. (If you're running RHEL, the procedure is different, as it is for all software management; you must do it [the RHEL way][4].) Software Collections also supports Fedora and Scientific Linux.

### Installing Software Collections

Install Software Collections on CentOS 6 and 7 with this command:

```
$ sudo yum install centos-release-scl
```

Then use Yum to search for and install packages in the usual way:

```
$ yum search php7
 [...]
 rh-php70.x86_64 : Package that installs PHP 7.0
 [...]
$ sudo yum install rh-php70 
```

This may also pull in `centos-release-scl-rh` as a dependency.

There is one more step, and that is enabling your new packages:

```
$ scl enable rh-php70 bash
$ php -v
PHP 7.0.10
```

This runs a script that loads the new package and changes your environment, and you should see a change in your prompt. You must also install the appropriate connectors for the new package if necessary, for example for Python, PHP, and MySQL, and update configuration files (e.g., Apache) to use the new version.

The SCL package will not be active after reboot. SCL is designed to run your old and new versions side-by-side and not overwrite your existing configurations. You can start your new packages automatically by sourcing their `enable` scripts in `.bashrc`. SCL installs everything into `opt`, so add this line to `.bashrc` for our PHP 7 example:

```
source /opt/rh/rh-php70/enable
```

It will automatically load and be available at startup, and you can go about your business cloaked in the warm glow of fresh up-to-date software.

### Listing Available Packages

So, what exactly do you get in Software Collections on CentOS? There are some extra community-maintained packages in `centos-release-scl`. You can see package lists in the [CentOS Wiki][5], or use Yum. First, let's see all our installed repos:

```
$ yum repolist
[...]
repo id                  repo name
base/7/x86_64            CentOS-7 - Base
centos-sclo-rh/x86_64    CentOS-7 - SCLo rh
centos-sclo-sclo/x86_64  CentOS-7 - SCLo sclo
extras/7/x86_64          CentOS-7 - Extras
updates/7/x86_64         CentOS-7 - Updates
```

Yum does not have a simple command to list packages in a single repo, so you have to do this:

```
$ yum --disablerepo "*" --enablerepo centos-sclo-rh \
 list available | less
```

This use of the `--disablerepo` and `--enablerepo` options is not well documented. You're not really disabling or enabling anything, but only limiting your search query to a single repo. It spits out a giant list of packages, and that is why we pipe it through `less`.

### EPEL

The excellent Fedora peoples maintain the [EPEL, Extra Packages for Enterprise Linux][6] repository for Fedora and all RHEL-compatible distributions. This contains updated package versions and software that is not included in the stock distributions. Install software from EPEL in the usual way, without having to bother with enable scripts. Specify that you want packages from EPEL using the `--disablerepo` and `--enablerepo` options:

```
$ sudo yum --disablerepo "*" --enablerepo epel install [package]
```

### Remi Collet

Remi Collet maintains a large collection of updated and extra packages at [Remi's RPM repository][7]. Install EPEL first as Remi's repo depends on it.

The CentOS wiki has a list of [additional third-party repositories][8] to use, and some to avoid.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/2/best-third-party-repositories-centos

作者：[CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/creative-commons-attribution
[2]:https://www.linux.com/files/images/centospng
[3]:https://www.softwarecollections.org/en/
[4]:https://access.redhat.com/solutions/472793
[5]:https://wiki.centos.org/SpecialInterestGroup/SCLo/CollectionsList
[6]:https://fedoraproject.org/wiki/EPEL
[7]:http://rpms.remirepo.net/
[8]:https://wiki.centos.org/AdditionalResources/Repositories
