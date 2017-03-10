### Introduction
This section provides a quick guide to
* Build Yocto image with meta-xilinx provided by Digilent

# Prepare build sources and configuration
This section provides the basic steps to setup build system and configurations

####  Prerequisites
* Internet access
* required tools
  * git
  * repo
* Vivado tools for JTAG boot
* SD card for SD Boot + SD Card reader for programing the SD card.
* Linux workstation - currently tested with 64bit Ubuntu 14.04.4

##### Install git
Ubuntu:

    $ sudo apt-get install git-core

##### Install repo
Repo is a tool that makes it easier to work with Git in the context of Android.
We use it to simplify the process of preparing yocto layers.

    $ mkdir ~/bin
    $ PATH=~/bin:$PATH
    $ curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
    $ chmod a+x ~/bin/repo

[repo command reference](https://source.android.com/source/using-repo.html)

#### Notes
* Ensure Yocto build is not over NFS/CIFD
* Only support jethro release at this point

#### Preparation
Fetch/clone the required layer repos and assume the layer repos are store in
"~/tmp/layers" folder.

    $ export branch=jethro
    $ export layer_root=${HOME}/tmp/layers
    $ mkdir -p $layer_root
    $ cd $layer_root

Fetch required layers and hardware project with 'repo'

    $ repo init -u https://github.com/Digilent/meta-manifest.git -b ${branch}
    $ repo sync

#### Initialize build directory
This section provides the general step to create and config the build directory

Follow the commands to create a build directory "${HOME}/tmp/zybo-linux-bd-zynq7"

    $ cd ${HOME}/tmp
    $ export target_machine="zybo-linux-bd-zynq7"
    $ . ${layer_root}/poky/oe-init-build-env ${target_machine}
    $ tree .
        .
        └── conf
            ├── bblayers.conf
            ├── local.conf
            └── templateconf.cfg
oe-init-build-env generates some generic configuration files in the build/conf
directory.
* The "bblayer.conf" file defines layers that are include in the build
* The "local.conf" file defines the configuration of the build.

##### Add required layers
Add meta-oe and meta-xilinx layer to the BBLAYERS variable

    $ cd ${HOME}/tmp/${target_machine}
    $ sed -i "/meta-yocto-bsp/a \  ${layer_root}/meta-openembedded/meta-oe \\\ " conf/bblayers.conf
    $ sed -i "/meta-yocto-bsp/a \  ${layer_root}/meta-xilinx \\\ " conf/bblayers.conf
you can also use vim/nano/other editor to add the layer to conf/bblayers.conf

If you check the conf/bblayers.conf, you should see similar output to the follows:

        LCONF_VERSION = "6"
        BBPATH = "${TOPDIR}"
        BBFILES ?= ""

        BBLAYERS ?= " \
          ${HOME}/tmp/layers/poky/meta \
          ${HOME}/tmp/layers/poky/meta-yocto \
          ${HOME}/tmp/layers/poky/meta-yocto-bsp \
          ${HOME}/tmp/layers/meta-xilinx \
          ${HOME}/tmp/layers/meta-openembedded/meta-oe \
          "
        BBLAYERS_NON_REMOVABLE ?= " \
          ${HOME}/tmp/layers/poky/meta \
          ${HOME}/tmp/layers/poky/meta-yocto \
          "
Where the ${HOME} is the path to your home directory.

##### Customize the build configuration
The variables you need to customize:
* MACHINE

[MACHINE]:
Defines the target build machine. In our case, it is zynq-hdmi_out-zynq7.
Modify the conf/local.conf to correct MACHINE with the following commands.

    $ sed -i "s/MACHINE ??= \"qemux86\"/MACHINE ?= \"${target_machine}\"/" conf/local.conf

or you can use text editor replacing the following

        MACHINE ?= "qemux86"

with

        MACHINE ?= "zybo-linux-bd-zynq7"

Optional variables you may want to customize:
* DL_DIR
* SSTATE_DIR
* TMPDIR
* PACKAGE_CLASSES

[DL_DIR]:
Defines where the upstream source code tarballs are stored. This allows multiple
builds without re-download the source code again.

[SSTATE_DIR]:
Defines where to store the shared state files. It also allows multiple build
share the same state files and speed up the build processes.

[TMPDIR]:
Define where to store the build outputs. Not recommended to share with other
builds.

[PACKAGE_CLASSES]
Defines which packing formats to enable and used in the system.

[Useful link](http://www.yoctoproject.org/docs/2.0/ref-manual/ref-manual.html#speeding-up-the-build) to speed up the build.

##### Set up preferred kernel and u-boot
Since there are multiple u-boot/kernel recipes can be use for zynq-linux-bd-zynq7
machine. We will need to define the preferred provider by adding the following
lines to conf/local.conf file

    PREFERRED_PROVIDER_virtual/bootloader = "u-boot-digilent"
    PREFERRED_PROVIDER_u-boot = "u-boot-digilent"
    PREFERRED_PROVIDER_virtual/kernel = "linux-digilent"
    PREFERRED_PROVIDER_virtual/boot-bin = "u-boot-digilent"

or

    $ echo 'PREFERRED_PROVIDER_virtual/bootloader = "u-boot-digilent"' >> conf/local.conf
    $ echo 'PREFERRED_PROVIDER_u-boot = "u-boot-digilent"' >> conf/local.conf
    $ echo 'PREFERRED_PROVIDER_virtual/kernel = "linux-digilent"' >> conf/local.conf
    $ echo 'PREFERRED_PROVIDER_virtual/boot-bin = "u-boot-digilent"' >> conf/local.conf

Note: currently supported kernel and u-boot recipe are as follows table:

recipe name| Description
--- | ---
linux-digilent | Stable kernel that has been tested - fixed commit id
linux-digilent-dev | base on latest commit of [linux-digilent](https://github.com/Digilent/u-boot-digilent) master branch
u-boot-digilent | Stable U-Boot that has been tested - fixed commit id
u-boot-digilent-dev | base on latest commit of [u-boot-digilent](https://github.com/Digilent/u-boot-digilent) master branch

##### Including additional pacakges
An example of adding mtd-utils to the image. Add the following line to
conf/local.conf file

    IMAGE_INSTALL_append = " mtd-utils"

Another example of adding kernel modules to the rootfs. Add the following line to
conf/local.conf file

    IMAGE_INSTALL_append = " kernel-modules"

##### Kernel configuration
Enter kernel menuconfig for the preferred kernel.

    $ bitbake virtual/kernel -c menuconfig

or specific kernel receipt

    $ bitbake linux-digilent-dev -c menuconfig

### Build
This section provides the basic yocto build

#### Yocto default images types
Yocto poky distribution provides a set of reference image recipe to create
your own distribution. You can find them under poky directory. In here, we
only try to build **core-imiage-minimal** and **core-imiage-sato**

##### minimal image
A image provides a console based Linux OS. Build core-image-minimal run:

    $ bitbake core-image-minimal

Intall alsa-utils to test the audio on the zybo-linux-bd-zynq7 machine
(still issues, please refer to the known issue section for detail) by adding
"alsa-utils" to IMAGE_INSTALL_append variable in the conf/local.conf file

    IMAGE_INSTALL_append = " mtd-utils alsa-utils"

##### sato image
Image with Sato, a mobile environment and visual style for mobile devices.
The image supports X11 with a Sato theme, Pimlico applications, and contains
terminal, editor, and file manager. To build it run:

    $ bitbake core-image-sato

You can also append xterm to the image by adding the "xterm" to
IMAGE_INSTALL_append variable in conf/local.conf file. e.g.

    IMAGE_INSTALL_append = " mtd-utils xterm"

#### build products
if you did not specify your own TMPDIR in local.conf, the default TMPDIR is under the
build directory, in this case, it should ${HOME}/tmp/${target_machine}/tmp. Image stores
at {HOME}/tmp/${target_machine}/tmp/deploy/images/zybo-linux-bd-zynq7. You can find a
list of build images in the directory.

    ${IMG_TYPE} refers to the build image, for example, core-image-minimal.
    ${target_machine} refers to zybo-linux-bd-zynq7 in this example.

File | Description
--- | ---
boot.bin | Zynq Boot Image that only contents the U-Boot SPL
download.bit | FPGA bitstream if applicable
fit.itb | fitImage with kernel + dtb + rootfs
sdroot-fitImage | fitImage with modified dtb which use use SD root (second partition of SD)
uImage | U-Boot image format of kernel image
linux.bin | Linux kernel in binary format
modules-${target_machine}.tgz | Kernel modules
sdimg | SD card image that can be used to program SD with dd (Linux/MAC) or Win32DiskImage(Windows)
system.dtb | Device Tree Binary (DTB)
uImage-its-${target_machine}.its | its that used to create the fitImage
u-boot.bin | U-Boot binary file
u-boot-dtb.bin | U-Boot binary file with DTB
u-boot-dtb.img | U-Boot image format of u-boot-dtb.bin
u-boot-spl.bin | SPL Preloader Binary
${IMG_TYPE}-${target_machine}.cpio | Root filesystem in cpio archive format
${IMG_TYPE}-${target_machine}.cpio.gz.uboot | Root filesystem in U-Boot image format with compression
${IMG_TYPE}-${target_machine}.ext4 | Root filesystem as ext4 image



### Useful commands
Show list of package available in the yocto recipes

    $ bitbake -s
or

    $ bitbake-layers show-recipes

Removes all output files and shared state cache for a target. Becareful
of using this command. This will force everything to be rebuild from scratch.

    $ bitbake cleansstate

Removes all output files and shared state cache for a recipe

    $ bitbake -c cleansstate <recipe name>

Build specific pkg, linux-digilent-dev as an example:

    $ bitbake linux-digilent-dev


List out the task available for a recipe, linux-digilent-dev as an example:

    $ bitbake -c listtasks linux-digilent-dev

Run specific task for a recipe, linux-digilent-dev as an example:

    $ bitbake -c deploy linux-digilent-dev
