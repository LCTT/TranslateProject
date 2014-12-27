Translating------geekpi


Linux FAQs with Answers--How to install kernel headers on Linux
================================================================================
> **Question**: I need to install kernel headers to install a device driver for my kernel. What is a proper way to install matching kernel headers on [insert your Linux distro]? 

When you compile a device driver a custom kernel module, you need to have kernel header files installed on your Linux system. Kernel headers are needed also when you build a userspace application which links directly against the kernel. When you install kernel headers in such cases, you must make sure to kernel headers are exactly matched with the kernel version of your system (e.g., 3.13.0-24-generic).

If your kernel is the default version that comes with the distribution, or you upgraded it using the default package manager (e.g., apt-get, aptitude or yum) from base repositories, you can install matching kernel headers using the package manager as well. On the other hand, if you downloaded the [kernel source][1] and compiled it manually, you can install matching kernel headers by using [make command][2].

Here we assume that your kernel comes from base repositories of your Linux distribution, and see how we can install matching kernel headers.

### Install Kernel Headers on Debian, Ubuntu or Linux Mint ###

Assuming that you did not manually compile the kernel, you can install matching kernel headers using apt-get command.

First, check if matching kernel headers are already available on your system using dpkg-query command.

    $ dpkg-query -s linux-headers-$(uname -r) 

----------

    dpkg-query: package 'linux-headers-3.11.0-26-generic' is not installed and no information is available

Go ahead and install matching kernel headers as follows.

    $ sudo apt-get install linux-headers-$(uname -r) 

![](https://farm9.staticflickr.com/8681/16000652415_a7c399992e_z.jpg)

Verify that matching kernel headers are successfully installed.

    $ dpkg-query -s linux-headers-$(uname -r) 

----------

    Package: linux-headers-3.11.0-26-generic
    Status: install ok installed

The default location of kernel headers on Debian, Ubuntu or Linux Mint is **/usr/src**.

### Install Kernel Headers on Fedora, CentOS or RHEL ###

If you did not manually upgrade the kernel, you can install matching kernel headers using yum command.

First, check if matching kernel headers are already installed on your system. If the following command does not produce any output, it means kernel headers are not available.

    $ rpm -qa | grep kernel-headers-$(uname -r)

Go ahead and install kernel headers with yum command. This command will automatically find a package of matching kernel headers, and install it.

    $ sudo yum install kernel-headers 

![](https://farm9.staticflickr.com/8594/15378403114_c51ff6f4ae_z.jpg)

Verify the status of the installed package.

    $ rpm -qa | grep kernel-headers-$(uname -r) 

----------

    kernel-headers-3.10.0-123.9.3.el7.x86_64

The default location of kernel headers on Fedora, CentOS or RHEL is **/usr/include/linux**.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-kernel-headers-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://www.kernel.org/pub/linux/kernel/
[2]:https://www.kernel.org/doc/Documentation/kbuild/headers_install.txt