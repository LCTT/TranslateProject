nd0104 is translate
How to check RPM package dependencies on Fedora, CentOS or RHEL
================================================================================
A typical RPM package on Red Hat-based systems requires all its dependent packages be installed to function properly. For end users, the complexity of such RPM dependency is hidden by package managers (e.g., yum or DNF) during package install/upgrade/removal process. However, if you are a sysadmin or a RPM maintainer, you need to be well-versed in RPM dependencies to maintain run-time environment for the system or roll out up-to-date RPM specs.

In this tutorial, I am going to show **how to check RPM package dependencies**. Depending on whether a package is installed or not, there are several ways to identify its RPM dependencies.

### Method One ###

One way to find out RPM dependencies for a particular package is to use rpm command. The following command lists all dependent packages for a target package.

    $ rpm -qR <package-name> 

![](https://farm6.staticflickr.com/5512/14659620723_4a36970efc_o.png)

Note that this command will work only if the target package is already **installed**. If you want to check package dependencies for any **uninstalled** package, you first need to download the RPM package locally (no need to install it).

To download a RPM package without installing it, use a command-line utility called `yumdownloader`. Install yumdownloader as follows.

    $ sudo yum install yum-utils 

Now let's check RPM depenencies of a uninstalled package (e.g., tcpdump). First download the package in the current folder with yumdownloader:

    $ yumdownloader --destdir=. tcpdump 

Then use rpm command with "-qpR" options to list dependencies of the downloaded package.

    # rpm -qpR tcpdump-4.4.0-2.fc19.i686.rpm

### Method Two ###

You can also get a list of dependencies for a RPM package using repoquery tool. repoquery works whether or not a target package is installed. This tool is included in yum-utils package.

    $ sudo yum install yum-utils

To show all required packages for a particular package:

    $ repoquery --requires --resolve <package-name> 

![](https://farm3.staticflickr.com/2935/14453103778_05db349b19_o.png)

For repoquery to work, your computer needs network connectivity since repoquery pulls information from Yum repositories.

### Method Three ###

The third method to show RPM package dependencies is to use rpmreaper tool. Originally this tool is developed to clean up unnecessary packages and their dependencies on RPM-based systems. rpmreaper has an ncurses-based intuitive interface for browsing installed packages and their dependency trees.

To install rpmrepater, use yum command. On CentOS, you need to [set up EPEL repo][1] first.

    $ sudo yum install rpmreaper 

To browser RPM dependency trees, simply run:

    $ rpmreaper 

![](https://farm4.staticflickr.com/3838/14636456131_99a3c26945_z.jpg)

The rpmrepater interface will show you a list of all installed packages. You can navigate the list using up/down arrow keys. Press "r" on a highlighted package to show its dependencies. You can expand the whole dependency tree by recursively pressing "r" keys on individual dependent packages. The "L" flag indicates that a given package is a "leaf", meaning that no other package depends on this package. The "o" flag implies that a given package is in the middle of dependency chain. Pressing "b" on such a package will show you what other packages require the highlighted package.

### Method Four ###

Another way to show package dependencies on RPM-based systems is to use rpmdep which is a command-line tool for generating a full package dependency graph of any installed RPM package. The tool analyzes RPM dependencies, and produce partially ordered package lists from topological sorting. The output of this tool can be fed into dotty graph visualization tool to generate a dependency graph image.

To install rpmdep and dotty on Fedora:

    $ sudo yum install rpmorphan graphviz 

To install the same tools on CentOS:

    $ wget http://downloads.sourceforge.net/project/rpmorphan/rpmorphan/1.14/rpmorphan-1.14-1.noarch.rpm
    $ sudo rpm -ivh rpmorphan-1.14-1.noarch.rpm
    $ sudo yum install graphviz 

To generate and plot a dependency graph of a particular installed package (e.g., gzip):

    $ rpmdep.pl -dot gzip.dot gzip
    $ dot -Tpng -o output.png gzip.dot 

![](https://farm4.staticflickr.com/3918/14453050980_53de4e8277_z.jpg)

So far in this tutorial, I demonstrate several ways to check what other packages a given RPM package relies on. If you want to know more about .deb package dependencies for Debian-based systems, you can refer to [this guide][2] instead.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/check-rpm-package-dependencies-fedora-centos-rhel.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2013/03/how-to-set-up-epel-repository-on-centos.html
[2]:http://xmodulo.com/2013/07/how-to-check-package-dependencies-on-ubuntu-or-debian.html
