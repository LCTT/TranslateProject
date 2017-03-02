How to create your own Linux Distribution with Yocto on Ubuntu
============================================================

### On this page

1.  [Prerequisites for the development machine ][1]
2.  [Yocto Compilation and Building Process][2]

In this article, our focus is the creation of a minimal Linux distribution using the Yocto project on the Ubuntu platform. The Yocto project is very famous in the embedded Linux world because of its flexibility and ease of use.  The purpose of the Yocto project is to create a Linux distro for manufacturers of embedded hardware and software. A new minimal Linux distro will be created for qemu as the (qemu is a basic software emulator) target machine and we will run it in qemu. 

### Prerequisites for the development machine 

*   At least 4 - 6 GB RAM.
*   Recent Ubuntu OS (16.04 LTS in this case).
*   At least 60-80 GB free space on the disk.
*   Installation of following packages before creation of new Linux distro.
*   Download latest Yocto (Poky which is minimal development environment) stable branch.

apt-get update

apt-get install wget git-core unzip make gcc g++ build-essential subversion sed autoconf automake texi2html texinfo coreutils diffstat python-pysqlite2 docbook-utils libsdl1.2-dev libxml-parser-perl libgl1-mesa-dev libglu1-mesa-dev xsltproc desktop-file-utils chrpath groff libtool xterm gawk fop

### [
 ![Install prerequisites for Yocto](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/1-pre_requisite_packages-1.png) 
][3]

As shown below, almost 1 GB size is required to install required development packages.

[
 ![Install the development packages](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/2-pre_requisite_packages-2.png) 
][4]

In this tutorial, the "morty" stable release of poky is cloned on the system.

 git clone -b morty git://git.yoctoproject.org/poky.git

[
 ![install poky](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/download_morty_of_yocto.png) 
][5]

Go inside the "poky" directory and run the following command to set/export some variables for yocto development.

source oe-init-build-env

As shown below, after running the open embedded (oe) build environment script, the path location in the terminal will be changed to a "build" directory for the further configuration and compilation of new distribution. 

[
 ![Prepare OE build environment](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/source_environment_script.png) 
][6]

The above screenshot shows that the "local.conf" file is created inside the "conf" directory. This is the configuration file for yocto which specifies details of the target machine and SDK for desired architecture etc.

As shown below, setting target machine "qemux86-64".

[
 ![Set the target machine type](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/selected_target.png) 
][7]

Uncomment following parameters in "local.conf" file as shown in the screenshots.

DL_DIR ?= "${TOPDIR}/downloads"

[
 ![Configure local.conf file](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/uncheck_Download_parameters.png) 
][8]

SSTATE_DIR ?= "${TOPDIR}/sstate-cache"

[
 ![Set SSTATE_DIR](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/uncheck_sstate_parametes.png) 
][9]

TMPDIR ?= "${TOPDIR}/tmp"

[
 ![Set TMPDIR](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/tempdir_uncheck_paramerter.png) 
][10]

PACKAGE_CLASSES ?= "package_rpm"

SDKMACHINE ?= "i686"

[
 ![Set PACKAGE_CLASSES and SDKMACHINE](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/sdk_and_package_selection.png) 
][11]

As shown below, set a blank password for the Yocto based Linux and include the following parameters in the local.conf file. Otherwise, the user will not be able to login in the new distro.

EXTRA_IMAGE_FEATURES ?= "debug-tweaks"

[
 ![Set debug-tweaks option](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/extra-features_for_blank_password.png) 
][12]

We are not using any GUI tool such as toaster (hob is no more supported) to create Linux OS.

### Yocto Compilation and Building Process

Now run the following command of the bitbake utility to start the download and compilation of packages for the selected target machine.

bitbake core-image-minimal

[
 ![Start bitbake](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/bitbake_coreimageminimal.png) 
][13]

It is important to run the above command as a normal Linux user and not the root user. As shown in the following sscreenshot, an error is generated when you run the bitbake command as root user.

[
 ![Do not run bitbake as root](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/dont_user_as_a_root.png) 
][14]

Again, run the export of environment variables script (oe-init-build-env) and re-run the same command to start the downloading and compilation process.

[
 ![rerun commands](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/runniing_bitbake_again-normal_user.png) 
][15]

As shown below, the first step of build script utility is to parse the recipe.

[
 ![Parse the build recipes](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/parsing-receipe.png) 
][16]

The following screenshot shows the completion of the parsing step of the build script. It also shows the details of the build system on which the new yocto based distro will be generated.

[
 ![Building proceeds](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/output_of_parsing.png) 
][17]

After downloading the SDK and necessary libraries, the next step is to download and compile the packages. The following screenshot shows the task for the new distribution. This step will take 2-3 hours because first, it downloads the required packages and then compiles for the new Linux distribution.

[
 ![Compilation will take several hours](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/task_list.png) 
][18]

The following screenshot shows the completion of the task list.

[
 ![](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/downloaded-all_packages_and_compiled.png) 
][19]

The compiled new images for the target machine type "qemux86-64" is inside the "build/tmp/deploy/images/qemux86-64" path as shown below.

[
 ![Build complete](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/new_linux_compiled_under_qemux86_64.png) 
][20]

As shown below, above command will produce an error if run in the Putty.

[
 ![command error in putty](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/error_on_putty.png) 
][21]

Above command is again run inside the terminal via rdp on Ubuntu platform.

[
 ![Command works fine in rdp](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/runqemu_command.png) 
][22]

Another screen is opened for the qemu emulator for new yocto based Linux distro.

[
 ![Open Quemu emulator](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/new_linux_inside_the_qemu_.png) 
][23]

The login screen of the new distro is shown below which also shows the reference version of the yocto project. The default username is root and a blank password.

[
 ![Linux distribution started](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/reference_distro.png) 
][24]

Finally, login in the new distro with root username and an empty password. As shown in the following screenshot, basic commands (date,ifconfig and uname) are run in the minimal version of Linux.

[
 ![Test the Linux distribution](https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/inside_new_linux_distro_running_on_qemu_3.png) 
][25]

The purpose of this article is to understand the procedure for the creation of new Linux distribution using yocto project.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-create-your-own-linux-distribution-with-yocto-on-ubuntu/

作者：[Ahmad][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-create-your-own-linux-distribution-with-yocto-on-ubuntu/
[1]:https://www.howtoforge.com/tutorial/how-to-create-your-own-linux-distribution-with-yocto-on-ubuntu/#prerequisites-for-the-development-machinenbsp
[2]:https://www.howtoforge.com/tutorial/how-to-create-your-own-linux-distribution-with-yocto-on-ubuntu/#yocto-compilation-and-building-process
[3]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/1-pre_requisite_packages-1.png
[4]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/2-pre_requisite_packages-2.png
[5]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/download_morty_of_yocto.png
[6]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/source_environment_script.png
[7]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/selected_target.png
[8]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/uncheck_Download_parameters.png
[9]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/uncheck_sstate_parametes.png
[10]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/tempdir_uncheck_paramerter.png
[11]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/sdk_and_package_selection.png
[12]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/extra-features_for_blank_password.png
[13]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/bitbake_coreimageminimal.png
[14]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/dont_user_as_a_root.png
[15]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/runniing_bitbake_again-normal_user.png
[16]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/parsing-receipe.png
[17]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/output_of_parsing.png
[18]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/task_list.png
[19]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/downloaded-all_packages_and_compiled.png
[20]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/new_linux_compiled_under_qemux86_64.png
[21]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/error_on_putty.png
[22]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/runqemu_command.png
[23]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/new_linux_inside_the_qemu_.png
[24]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/reference_distro.png
[25]:https://www.howtoforge.com/images/how-to-create-your-own-linux-distribution-with-yocto/big/inside_new_linux_distro_running_on_qemu_3.png
