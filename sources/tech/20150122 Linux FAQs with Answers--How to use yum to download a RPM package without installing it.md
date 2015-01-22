Linux FAQs with Answers--How to use yum to download a RPM package without installing it
================================================================================
> **Question**: I want to download a RPM package from Red Hat's standard repositories. Can I use yum command to download a RPM package without installing it?

yum is the default package manager for Red Hat based systems, such as CentOS, Fedora or RHEL. Using yum, you can install or update a RPM package while resolving its package dependencies automatically. What if you want to download a RPM package without installing it on the system? For example, you may want to archive some RPM packages for later use or to install them on another machine.

Here is how to download a RPM package from yum repositories.

### Method One: Yum ###

The yum command itself can be used to download a RPM package. The standard yum command offers '--downloadonly' option for this purpose.

    $ sudo yum install --downloadonly <package-name>

By default, a downloaded RPM package will be saved in:

    /var/cache/yum/x86_64/[centos/fedora-version]/[repository]/packages

In the above, [repository] is the name of the repository (e.g., base, fedora, updates) from which the package is downloaded.

If you want to download a package to a specific directory (e.g., /tmp):

    $ sudo yum install --downloadonly --downloaddir=/tmp <package-name>

Note that if a package to download has any unmet dependencies, yum will download all dependent packages as well. None of them will be installed.

One important thing is that on CentOS/RHEL 6 or earlier, you will need to install a separate yum plugin (called yum-plugin-downloadonly) to be able to use '--downloadonly' command option:

    $ sudo yum install yum-plugin-downloadonly

Without this plugin, you will get the following error with yum:

    Command line error: no such option: --downloadonly

![](https://farm9.staticflickr.com/8627/15571201803_38390aae75_c.jpg)

### Method Two: Yumdownloader ###

Another method to download a RPM package is via a dedicated package downloader tool called yumdownloader. This tool is part of yum-utils package which contains a suite of helper tools for yum package manager.

    $ sudo yum install yum-utils

To download a RPM package:

    $ sudo yumdownloader <package-name>

The downloaded package will be saved in the current directory. You need to use root privilege because yumdownloader will update package index files during downloading. Unlike yum command above, none of the dependent package(s) will be downloaded.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/yum-download-rpm-package.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出