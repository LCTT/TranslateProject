Linux有问必答：如何用Perl检测Linux的发行版本
================================================================================
> **提问**:我需要写一个Perl程序，它会包含Linux发行版相关的代码。为此，Perl程序需要能够自动检测运行中的Linux的发行版（如Ubuntu、CentOS、Debian、Fedora等等），以及它是什么版本号。如何用Perl检测Linux的发行版本？

如果要用Perl脚本检测Linux的发行版，你可以使用一个名为[Linux::Distribution][1]的Perl模块。该模块通过检查/etc/lsb-release以及其他在/etc下的发行版特定的目录来猜测底层Linux操作系统。它支持检测所有主要的Linux发行版，包括Fedora、CentOS、Arch Linux、Debian、Ubuntu、SUSE、Red Hat、Gentoo、Slackware、Knoppix和Mandrake。

要在Perl中使用这个模块，你首先需要安装它。

### 在Debian或者Ubuntu上安装 Linux::Distribution  ###

基于Debian的系统直接用apt-get安装

    $ sudo apt-get install liblinux-distribution-packages-perl 

### 在Fedora、CentOS 或者RHEL上安装 Linux::Distribution  ###

如果你的Linux没有Linux::Distribution模块的安装包（如基于红帽的系统），你可以使用CPAN来构建。

首先确保你的Linux系统安装了CPAN

    $ sudo yum -y install perl-CPAN 

然后，使用这条命令来构建并安装模块：

    $ sudo perl -MCPAN -e 'install Linux::Distribution' 

### 用Perl确定Linux发行版 ###

Linux::Distribution模块安装完成之后，你可以使用下面的代码片段来确定你运行的Linux发行版本。

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

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://metacpan.org/pod/Linux::Distribution