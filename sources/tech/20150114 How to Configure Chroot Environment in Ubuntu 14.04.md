[bazz2222222]
How to Configure Chroot Environment in Ubuntu 14.04
================================================================================
There are many instances when you may wish to isolate certain applications, user, or environments within a Linux system. Different operating systems have different methods of achieving isolation, and in Linux, a classic way is through a `chroot` environment.

In this guide, we'll show you step wise on how to setup an isolated environment using chroot in order to create a barrier between your regular operating system and a contained environment. This is mainly useful for testing purposes. We will teach you the steps on an **Ubuntu 14.04** VPS instance.

Most system administrators will benefit from knowing how to accomplish a quick and easy chroot environment and it is a valuable skill to have.

### The chroot environment ###

A chroot environment is an operating system call that will change the root location temporarily to a new folder. Typically, the operating system's conception of the root directory is the actual root located at "/". However, with `chroot`, you can specify another directory to serve as the top-level directory for the duration of a chroot.

Any applications that are run from within the `chroot` will be unable to see the rest of the operating system in principle.

#### Advantages of Chroot Environment ####

> - Test applications without the risk of compromising the entire host system.
> 
> -  From the security point of view, whatever happens in the chroot environment won't affect the host system (not even under root user).
> 
> -  A different operating system running in the same hardware.

For instance, it allows you to build, install, and test software in an environment that is separated from your normal operating system. It could also be used as a method of **running 32-bit applications in a 64-bit environment**.

But while chroot environments will certainly make additional work for an unprivileged user, they should be considered a hardening feature instead of a security feature, meaning that they attempt to reduce the number of attack vectors instead of creating a full solution. If you need full isolation, consider a more complete solution, such as Linux containers, Docker, vservers, etc.

### Debootstrap and Schroot ###

The necessary packages to setup the chroot environment are **debootstrap** and **schroot**, which are available in the ubuntu repository. The schroot command is used to setup the chroot environment.

**Debootstrap** allows you to install a new fresh copy of any Debian (or debian-based) system from a repository in a directory with all the basic commands and binaries needed to run a basic instance of the operating system.

The **schroot** allows access to chroots for normal users using the same mechanism,  but  with  permissions  checking  and allowing additional automated setup of the chroot environment, such as mounting additional filesystems and other configuration tasks.

These are the steps to implement this functionality in Ubuntu 14.04 LTS:

### 1. Installing the Packages ###

Firstly, We're gonna install debootstrap and schroot in our host Ubuntu 14.04 LTS.

    $ sudo apt-get install debootstrap 
    $ sudo apt-get install schroot

### 2. Configuring Schroot ###

Now that we have the appropriate tools, we just need to specify a directory that we want to use as our chroot environment. We will create a directory called linoxide in our root directory to setup chroot there:

    sudo mkdir /linoxide

We have to configure schroot to suit our needs in the configuration file .we will modify the schroot configuration file with the information we require to get configured.

    sudo nano /etc/schroot/schroot.conf

We are on an Ubuntu 14.04 LTS (Trusty Tahr) system currently, but let's say that we want to test out some packages available on Ubuntu 13.10, code named "Saucy Salamander". We can do that by creating an entry that looks like this:

    [saucy]
    description=Ubuntu Saucy
    location=/linoxide
    priority=3
    users=arun
    root-groups=root

![](http://blog.linoxide.com/wp-content/uploads/2014/12/schroot-config.png)

Modify the values of the configuration parameters in the above example to fit your system:

### 3. Installing 32 bit Ubuntu with debootstrap ###

Debootstrap downloads and installs a minimal operating system inside your **chroot environment**. You can install any debian-based distro of your choice, as long as you have a repository available.

Above, we placed the chroot environment under the directory **/linoxide** and this is the root directory of the chroot environment. So we'll need to run debootstrap inside that directory which we have already created:

    cd /linoxide
    sudo debootstrap --variant=buildd --arch amd64 saucy /linoxide/ http://archive.ubuntu.com/ubuntu/
    sudo chroot /linoxide /debootstrap/debootstrap --second-stage

You can replace amd64 in --arch as i386 or other bit OS you wanna setup available in the repository. You can replace the mirror http://archive.ubuntu.com/ubuntu/ above as the one closest, you can get the closest one from the official [Ubuntu Mirror Page][1].

**Note: You will need to add --foreign above 3rd line command  if you choose to setup i386 bit OS choot in your 64 bit Host Ubuntu as:**

    sudo debootstrap --variant=buildd --foreign --arch i386 saucy /linoxide/ http://archive.ubuntu.com/ubuntu/

It takes some time (depending on your bandwidth) to download, install and configure the complete system. It takes about 500 MBs for a minimal installation.

### 4. Finallizing the chroot environment ###

After the system is installed, we'll need to do some final configurations to make sure the system functions correctly. First, we'll want to make sure our host `fstab` is aware of some pseudo-systems in our guest.

    sudo nano /etc/fstab

Add the below lines like these to the bottom of your fstab:

    proc /linoxide/proc proc defaults 0 0
    sysfs /linoxide/sys sysfs defaults 0 0

Save and close the file.

Now, we're going to need to mount these filesystems within our guest:

    $ sudo mount proc /linoxide/proc -t proc
    $sudo mount sysfs /linoxide/sys -t sysfs

We'll also want to copy our /etc/hosts file so that we will have access to the correct network information:

    $ sudo cp /etc/hosts /linoxide/etc/hosts

Finally, You can list the available chroot environments using the schroot command.

    $ schroot -l

We can enter the chroot environment through a command like this:

    $ sudo chroot /linoxide/ /bin/bash

You can test the chroot environment by checking the version of distributions installed.

    # lsb_release -a
    # uname -a

To finish this tutorial, in order to run a graphic application from the chroot, you have to export the DISPLAY environment variable.

    $ DISPLAY=:0.0 ./apps

Here, we have successfully installed Chrooted Ubuntu 13.10(Saucy Salamander) in your host Ubuntu 14.04 LTS (Trusty Tahr).

You can exit chroot environment successfully by running the commands below:

    # exit

Afterwards, we need to unmount our proc and sys filesystems:

    $ sudo umount /test/proc
    $ sudo umount /test/sys

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/configure-chroot-environment-ubuntu-14-04/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://launchpad.net/ubuntu/+archivemirrors
