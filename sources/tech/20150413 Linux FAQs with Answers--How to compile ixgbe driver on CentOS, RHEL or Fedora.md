    Vic020

Linux FAQs with Answers--How to compile ixgbe driver on CentOS, RHEL or Fedora
================================================================================
> **Question**: I want to build and install the latest ixgbe 10G NIC driver. How can I compile ixgbe driver on CentOS, Fedora or RHEL? 

To use Intel's PCI Express 10G NICs (e.g., 82598, 82599, x540) on your Linux system, you need to install ixgbe driver. While modern Linux distributions come with ixgbe driver pre-installed as a loadable module, the pre-built ixgbe driver is not fully customizable with limited parameters. If you want to enable and customize all available features of the 10G NICs (e.g., RSS, multi-queue, virtual functions, hardware offload), you will need to build the driver from the source.

Here is how to compile ixgbe driver from the source on Red Hat based platforms (e.g., CentOS, RHEL or Fedora). For Debian based systems, refer to [this guideline][1] instead.

### Step One: Install Prerequisites ###

First, set up necessary developmen environment and install matching kernel headers.

    $ sudo yum install gcc make
    $ sudo yum install kernel-devel

### Step Two: Compile Ixgbe Driver ###

Download the latest ixgbe source code from the [official site][2].

    $ wget http://downloads.sourceforge.net/project/e1000/ixgbe%20stable/3.23.2/ixgbe-3.23.2.tar.gz 

Be sure to check supported kernel versions. For example, the ixgbe driver 3.23.2 supports Linux kernel versions 2.6.18 up to 3.18.1.

Extract the tarball and compile it.

    $ tar -xvf ixgbe-3.23.2.tar.gz
    $ cd ixgbe-3.23.2/src
    $ make 

If successful, the compiled driver (ixgbe.ko) will be found in the current directory.

You can check the information of the compiled driver by running:

    $ modinfo ./ixgbe.ko 

The output will show a list of available parameters of the ixgbe driver.

![](https://farm9.staticflickr.com/8789/16429483653_b9b6e6cd7f_c.jpg)

### Step Three: Load Ixgbe Driver ###

Now you are ready to load the compiled ixgbe driver.

If the stock ixgbe driver is already loaded on your system, you need to unload it first. Otherwise, you won't be able to load the new ixgbe driver.

    $ sudo rmmod ixgbe.ko

Then insert the compiled driver in the kernel by running:

    $ sudo insmod ./ixgbe.ko

Optionally, you can supply any parameters while loading the driver.

    $ sudo insmod ./ixgbe.ko FdirPballoc=3 RSS=16

To verify that the driver is loaded successfully, check the output of dmesg command.

    $ dmesg 

----------

    Intel(R) 10 Gigabit PCI Express Network Driver - version 3.23.2
    Copyright (c) 1999-2014 Intel Corporation.
    ixgbe 0000:21:00.0: PCI INT A -> GSI 64 (level, low) -> IRQ 64
    ixgbe 0000:21:00.0: setting latency timer to 64
    ixgbe: Receive-Side Scaling (RSS) set to 16
    ixgbe: Flow Director packet buffer allocation set to 3
    ixgbe: 0000:21:00.0: ixgbe_check_options: Flow Director will be allocated 256kB of packet buffer
    ixgbe: 0000:21:00.0: ixgbe_check_options: FCoE Offload feature enabled
    ixgbe 0000:21:00.0: irq 87 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 88 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 89 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 90 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 91 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 92 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 93 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 94 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 95 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 96 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 97 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 98 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 99 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 100 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 101 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 102 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 103 for MSI/MSI-X
    ixgbe 0000:21:00.0: eth3: DCA registration failed: -1
    ixgbe 0000:21:00.0: PCI Express bandwidth of 32GT/s available
    ixgbe 0000:21:00.0: (Speed:5.0GT/s, Width: x8, Encoding Loss:20%)
    ixgbe 0000:21:00.0: eth3: MAC: 2, PHY: 9, SFP+: 3, PBA No: E68793-006
    ixgbe 0000:21:00.0: 90:e2:ba:5b:e9:1c
    ixgbe 0000:21:00.0: eth3: Enabled Features: RxQ: 16 TxQ: 16 FdirHash RSC 
    ixgbe 0000:21:00.0: eth3: Intel(R) 10 Gigabit Network Connection
    ixgbe 0000:21:00.1: PCI INT B -> GSI 68 (level, low) -> IRQ 68
    ixgbe 0000:21:00.1: setting latency timer to 64
    ixgbe: 0000:21:00.1: ixgbe_check_options: FCoE Offload feature enabled
    ixgbe 0000:21:00.0: registered PHC device on eth3
    ixgbe 0000:21:00.1: irq 104 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 105 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 106 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 107 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 108 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 109 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 110 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 111 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 112 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 113 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 114 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 115 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 116 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 117 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 118 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 119 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 120 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 121 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 122 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 123 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 124 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 125 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 126 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 127 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 128 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 129 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 130 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 131 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 132 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 133 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 134 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 135 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 136 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 137 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 138 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 139 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 140 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 141 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 142 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 143 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 144 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 145 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 146 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 147 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 148 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 149 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 150 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 151 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 152 for MSI/MSI-X
    ADDRCONF(NETDEV_UP): eth3: link is not ready
    8021q: adding VLAN 0 to HW filter on device eth3
    ixgbe 0000:21:00.1: eth4: DCA registration failed: -1
    ixgbe 0000:21:00.1: PCI Express bandwidth of 32GT/s available
    ixgbe 0000:21:00.1: (Speed:5.0GT/s, Width: x8, Encoding Loss:20%)
    ixgbe 0000:21:00.1: eth4: MAC: 2, PHY: 9, SFP+: 4, PBA No: E68793-006
    ixgbe 0000:21:00.1: 90:e2:ba:5b:e9:1e
    ixgbe 0000:21:00.1: eth4: Enabled Features: RxQ: 48 TxQ: 48 FdirHash RSC 
    ixgbe 0000:21:00.1: eth4: Intel(R) 10 Gigabit Network Connection
    ixgbe 0000:21:00.0: eth3: detected SFP+: 3
    ixgbe 0000:21:00.1: registered PHC device on eth4
    ADDRCONF(NETDEV_UP): eth4: link is not ready
    8021q: adding VLAN 0 to HW filter on device eth4
    ixgbe 0000:21:00.1: eth4: detected SFP+: 4
    ixgbe 0000:21:00.0: eth3: NIC Link is Up 10 Gbps, Flow Control: RX/TX
    ADDRCONF(NETDEV_CHANGE): eth3: link becomes ready
    ixgbe 0000:21:00.1: eth4: NIC Link is Up 10 Gbps, Flow Control: RX/TX
    ADDRCONF(NETDEV_CHANGE): eth4: link becomes ready
    eth3: no IPv6 routers present
    eth4: no IPv6 routers present

### Step Four: Install Ixgbe Driver ###

Once you have checked that the driver is loaded successfully, go ahead and install the driver on your system.

    $ sudo make install

ixgbe.ko will be installed in the following location.

    /lib/modules/<kernel-version>/kernel/drivers/net/ixgbe

At this point, the compiled driver will be loaded automatically upon boot, or you can load it by running:

    $ sudo modprobe ixgbe 

![](https://farm9.staticflickr.com/8760/16863416809_804dea1491_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/compile-ixgbe-driver-centos-rhel-fedora.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://ask.xmodulo.com/download-install-ixgbe-driver-ubuntu-debian.html
[2]:http://sourceforge.net/projects/e1000/files/ixgbe%20stable/
