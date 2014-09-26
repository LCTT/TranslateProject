Linux FAQs with Answers--How to detect a Linux distribution in Perl
================================================================================
> **Question**: I need to write a Perl program which contains Linux distro-dependent code. For that, the Perl program needs to be able to automatically detect what Linux distribution (e.g., Ubuntu, CentOS, Debian, Fedora, etc) it is running on, and what version number it is. How can I identify Linux distribution in Perl? 

If you want to detect Linux distribution within a Perl script, you can use a Perl module named [Linux::Distribution][1]. This module guesses the underlying Linux operating system by examining /etc/lsb-release, and other distro-specific files under /etc directory. It supports detecting all major Linux distributions, including Fedora, CentOS, Arch Linux, Debian, Ubuntu, SuSe, Red Hat, Gentoo, Slackware, Knoppix, and Mandrake.

To use this module in a Perl program, you need to install it first.

### Install Linux::Distribution on Debian or Ubuntu ###

Installation on Debian-based system is straightforward with apt-get:

    $ sudo apt-get install liblinux-distribution-packages-perl 

### Install Linux::Distribution on Fedora, CentOS or RHEL ###

If Linux::Distribution module is not available as a package in your Linux (such as on Red Hat based systems), you can use CPAN to build it.

First, make sure that you have CPAN installed on your Linux system:

    $ sudo yum -y install perl-CPAN 

Then use this command to build and install the module:

    $ sudo perl -MCPAN -e 'install Linux::Distribution' 

### Identify a Linux Distribution in Perl ###

Once Linux::Distribution module is installed, you can use the following code snippet to identify on which Linux distribution you are running.

    use Linux::Distribution qw(distribution_name distribution_version);
     
    my $linux = Linux::Distribution->new;
     
    if ($linux) {
      my $distro = $linux->distribution_name();
      my $version = $linux->distribution_version();
      print "Distro: $distro $version\n";
    }
    else {
      print "Distro: unknown\n";
    }

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/detect-linux-distribution-in-perl.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://metacpan.org/pod/Linux::Distribution