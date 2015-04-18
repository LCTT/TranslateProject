How to Install Linux Kernel 4.0 from Elrepo / Source on Ubuntu / CentOs
================================================================================
Hi everyone, today we'll learn how to install the latest Linux Kernel 4.0 from Elrepo and compiling using Source. Linux Kernel 4.0 is the latest Mainline Kernel codenamed ‘Hurr durr I’m a sheep’ till date. It is the kernel released after the stable released of 3.19.4 . April 12 is considered as a big day for all fans of the Open Source movement, as Linus Torvalds announced the release of Linux Kernel 4.0 and its immediate availability. It is considered as a big release as it consists of some awesome features which includes no-reboot patching (Live Patching), New and Updated Drivers, New and Latest Hardware Support and more interesting features with a new version change. But Kernel 4.0 is not considered as a huge release as expected but Linus announced that 4.1 is expected for a bigger release. The Live Patching feature was already integrated with the SUSE Enterprise Linux operating system. Here is the [release announcement][1] you can check for more details about the release.

> **WARNING**: Installing a new kernel may render your system unusable or unstable. If you proceed with the installation using the instructions below, make sure you back up any important data you have to an external hard drive.

### Installing Linux Kernel 4.0 on Ubuntu 15.04 ###

If you are running an Ubuntu 15.04 Distribution of Linux. You can simply install it straight from Ubuntu Kernel site. To install the latest Linux Kernel 4.0 in your Ubuntu 15.04, you'll need to run the following commands under root access in a shell or a terminal.

#### On a 64-bit Ubuntu 15.04 ####

    $ wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/linux-headers-4.0.0-040000-generic_4.0.0-040000.201504121935_amd64.deb

    $ sudo dpkg -i linux-headers-4.0.0*.deb linux-image-4.0.0*.deb

#### On a 32-bit Ubuntu 15.04 ####

    $ wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/linux-headers-4.0.0-040000-generic_4.0.0-040000.201504121935_i386.deb

    $ sudo dpkg -i linux-headers-4.0.0*.deb linux-image-4.0.0*.deb

### Installing Linux Kernel 4.0 on CentOS 7 ###

We can easily install Linux Kernel 4.0 using two ways in CentOS 7 .

1. Installing from Elrepo Repository
1. Compiling and installing from the Source Code

First we'll gonna go for installing using ELRepo as its the easiest way to do.

#### Installing using Elrepo ####

**1. Downloading and Installing ELRepo**

We'll first gonna download the GPG key of ELRepo and install the relrepo-release package. As we're running CentOS 7, we'll gonna install elrepo-release-7.0-2.el7.elrepo.noarch.rpm using the command below.

Note: If you have a secure boot enabled please see [this page for more information][2].

    # rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
    # rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm

![Adding Elrepo Source](http://blog.linoxide.com/wp-content/uploads/2015/04/adding-elrepo.png)

**2. Updating Linux Kernel to version 4.0**

Now, we'll gonna install the latest stable kernel 4.0 from the ELRepo repository. To do so, we'll need to enter the following commands in a shell or terminal of the CentOS 7.

    # yum --enablerepo=elrepo-kernel install kernel-ml

![Installing Linux Kernel 4.0 from ELRepo](http://blog.linoxide.com/wp-content/uploads/2015/04/installing-kernel-4-0-elrepo.png)

The above command will automatically install the Linux Kernel 4.0 build for CentOS 7.

Now, here below is the another way of installing the latest kernel 4.0 by compiling from the source.

#### Compiling and Installing from the Source ####

**1. Installing the Dependencies**

So, first of all we'll need to install the dependencies required to compile the linux kernel. To do so, we'll need to run the following command in a terminal or a shell.

    # yum groupinstall "Development Tools"

    # yum install gcc ncurses ncurses-devel

![Installing Kernel Dependencies](http://blog.linoxide.com/wp-content/uploads/2015/04/installing-dependencies.png)

Then, we'll gonna update our whole system.

    # yum update

**2. Downloading the source**

We'll now download the latest release linux kernel 4.0 source using wget command from the official repository of Linux Kernel. You can also download the kernel directly from the site [kernel.org][3] using your web browser also.

    #  cd /tmp/
    # wget https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.0.tar.xz

![Download Kernel Source](http://blog.linoxide.com/wp-content/uploads/2015/04/download-kernel-source.png)

**3. Extracting the tarball**

Once the file is downloaded we'll extract it under /usr/src/ directory by running the below command.

    # tar -xf linux-4.0.tar.xz -C /usr/src/
    # cd /usr/src/linux-4.0/

![Extracting Kernel Tarball](http://blog.linoxide.com/wp-content/uploads/2015/04/extracting-kernel-tarball.png)

**4. Configuring**

We have two options to configure the Linux Kernel. We can either create a new custom configuration or use the old configuration to build and install the Linux Kernel. It all depends on what you really want.

**For New Kernel Configuration**

Now we'll run the make menuconfig command in the shell or terminal to configure the Linux kernel. Once we've executed the below command a pop up window with all the menus appears. Here we can select our new kernel configuration. If you unfamiliar with these menus, just hit double ESC key to exit.

    # make menuconfig

![Configuring New Kernel Config](http://blog.linoxide.com/wp-content/uploads/2015/04/configuring-new-kernel-config.png)

**For Old Configuration**

If you like to configure your latest kernel with your old configuration then simple type the below command. If you were asked any stuff, you can choose with Y or N or you can simply press Enter to continue.

    # make oldconfig

#### Step 5. Compiling the Linux Kernel ####

Next, we'll execute the make command to compile the Kernel 4.0 . The compilation would take at least 20-30 minutes depends on your system configuration.

Note: If you got an error while compiling the kernel saying bc command not found. You can fix that by installing bc using the command **yum install bc** .

    # make
![Make Kernel](http://blog.linoxide.com/wp-content/uploads/2015/04/make-kernel.png)

#### 6. Installing Linux Kernel 4.0 ####

Once the compilation is completed, we'll now finally install the **Kernel** in our Linux System. The below command will create files under /boot directory and also makes a new kernel entry in the Grub Menu.

    # make modules_install install

#### 7. Verifying Kernel ####

After installing our latest kernel 4.0 we'll want to verify it. To do so we'll just type the following command on the terminal. If everything went fine, we'll get the kernel version ie. 4.0 enlisted in the output below.

    # uname -r

#### Conclusion ####

Hurray, we have successfully installed the latest version of linux kernel ie 4.0 in our CentOS 7 Operating System. Upgrading a linux kernel is always not necessary cause the hardware you got working with the previous version of it may not get working with the newer version. We should make sure that the it includes the features and stuffs that are necessary to make your hardware working. But mostly, the newer stable versions of kernel makes your hardware performance better. So, if you have any questions, comments, feedback please do write on the comment box below and let us know what stuffs needs to be added or improved. Thank You! Enjoy the latest stable version of Linux Kernel 4.0 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/install-linux-kernel-4-0-elrepo-source/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://lkml.iu.edu/hypermail/linux/kernel/1504.1/03198.html
[2]:http://elrepo.org/tiki/SecureBootKey
[3]:http://kernel.org/