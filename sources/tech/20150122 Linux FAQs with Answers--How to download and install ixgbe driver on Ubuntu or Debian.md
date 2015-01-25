Translating----geekpi

Linux FAQs with Answers--How to download and install ixgbe driver on Ubuntu or Debian
================================================================================
> **Question**: I want to download and install the latest ixgbe driver for my Intel 10 Gigabit Ethernet card. How can I install ixgbe driver on Ubuntu (or Debian)?

Intel's PCI Express 10 Gigabit (10G) network inerface cards (e.g., 82598, 82599, x540) are supported by ixgbe driver. The stock kernel of the modern Linux distributions already comes with ixgbe driver as a loadable module. However, there are cases where you may want to compile and install ixgbe driver on your own. For example, you may want to try the new features of the latest ixgbe driver. Also, the problem of the default ixgbe driver in the stock kernel is that it does not allow you to customize many of its driver parameters. If you want to fully customize ixgbe device driver (e.g., RSS, multi-queue, interrupt throttling, etc), you need to manually compile ixgbe driver from the source.

Here is how to download and install ixgbe driver on Ubuntu, Debian or their derivatives.

### Step One: Install Prerequites ###

As prerequisites, install matching kernel headers and development packages.

    $ sudo apt-get install linux-headers-$(uname -r)
    $ sudo apt-get install gcc make

### Step Two: Compile Ixgbe Driver ###

Download the source code of the [latest ixgbe driver][1].

    $ wget http://sourceforge.net/projects/e1000/files/ixgbe%20stable/3.23.2/ixgbe-3.23.2.tar.gz

Compile ixgbe driver as follows.

    $ tar xvfvz ixgbe-3.23.2.tar.gz
    $ cd ixgbe-3.23.2/src
    $ make

### Step Three: Check Ixgbe Driver ###

After compilation, you will see **ixgbe.ko** created in ixgbe-3.23.2/src directory. This is the ixgbe device driver which will be loaded into the kernel.

Check the information of this kernel module with modinfo command. Note that you need to specify an absolute path to the module (e.g., ./ixgbe.ko or /home/xmodulo/ixgbe/ixgbe-3.23.2/src/ixgbe.ko). The output will show the version of ixgbe driver.

    $ modinfo ./ixgbe.ko

----------

    filename:       /home/xmodulo/ixgbe/ixgbe-3.23.2/src/ixgbe.ko
    version:        3.23.2
    license:        GPL
    description:    Intel(R) 10 Gigabit PCI Express Network Driver
    author:         Intel Corporation, 
    srcversion:     2ADA5E537923E983FA9DAE2
    alias:          pci:v00008086d00001560sv*sd*bc*sc*i*
    alias:          pci:v00008086d00001558sv*sd*bc*sc*i*
    alias:          pci:v00008086d0000154Asv*sd*bc*sc*i*
    alias:          pci:v00008086d00001557sv*sd*bc*sc*i*
    alias:          pci:v00008086d0000154Fsv*sd*bc*sc*i*
    alias:          pci:v00008086d0000154Dsv*sd*bc*sc*i*
    alias:          pci:v00008086d00001528sv*sd*bc*sc*i*
    alias:          pci:v00008086d000010F8sv*sd*bc*sc*i*
    alias:          pci:v00008086d0000151Csv*sd*bc*sc*i*
    alias:          pci:v00008086d00001529sv*sd*bc*sc*i*
    alias:          pci:v00008086d0000152Asv*sd*bc*sc*i*
    alias:          pci:v00008086d000010F9sv*sd*bc*sc*i*
    alias:          pci:v00008086d00001514sv*sd*bc*sc*i*
    alias:          pci:v00008086d00001507sv*sd*bc*sc*i*
    alias:          pci:v00008086d000010FBsv*sd*bc*sc*i*
    alias:          pci:v00008086d00001517sv*sd*bc*sc*i*
    alias:          pci:v00008086d000010FCsv*sd*bc*sc*i*
    alias:          pci:v00008086d000010F7sv*sd*bc*sc*i*
    alias:          pci:v00008086d00001508sv*sd*bc*sc*i*
    alias:          pci:v00008086d000010DBsv*sd*bc*sc*i*
    alias:          pci:v00008086d000010F4sv*sd*bc*sc*i*
    alias:          pci:v00008086d000010E1sv*sd*bc*sc*i*
    alias:          pci:v00008086d000010F1sv*sd*bc*sc*i*
    alias:          pci:v00008086d000010ECsv*sd*bc*sc*i*
    alias:          pci:v00008086d000010DDsv*sd*bc*sc*i*
    alias:          pci:v00008086d0000150Bsv*sd*bc*sc*i*
    alias:          pci:v00008086d000010C8sv*sd*bc*sc*i*
    alias:          pci:v00008086d000010C7sv*sd*bc*sc*i*
    alias:          pci:v00008086d000010C6sv*sd*bc*sc*i*
    alias:          pci:v00008086d000010B6sv*sd*bc*sc*i*
    depends:        ptp,dca
    vermagic:       3.11.0-19-generic SMP mod_unload modversions 
    parm:           InterruptType:Change Interrupt Mode (0=Legacy, 1=MSI, 2=MSI-X), default IntMode (deprecated) (array of int)
    parm:           IntMode:Change Interrupt Mode (0=Legacy, 1=MSI, 2=MSI-X), default 2 (array of int)
    parm:           MQ:Disable or enable Multiple Queues, default 1 (array of int)
    parm:           DCA:Disable or enable Direct Cache Access, 0=disabled, 1=descriptor only, 2=descriptor and data (array of int)
    parm:           RSS:Number of Receive-Side Scaling Descriptor Queues, default 0=number of cpus (array of int)
    parm:           VMDQ:Number of Virtual Machine Device Queues: 0/1 = disable, 2-16 enable (default=8) (array of int)
    parm:           max_vfs:Number of Virtual Functions: 0 = disable (default), 1-63 = enable this many VFs (array of int)
    parm:           VEPA:VEPA Bridge Mode: 0 = VEB (default), 1 = VEPA (array of int)
    parm:           InterruptThrottleRate:Maximum interrupts per second, per vector, (0,1,956-488281), default 1 (array of int)
    parm:           LLIPort:Low Latency Interrupt TCP Port (0-65535) (array of int)
    parm:           LLIPush:Low Latency Interrupt on TCP Push flag (0,1) (array of int)
    parm:           LLISize:Low Latency Interrupt on Packet Size (0-1500) (array of int)
    parm:           LLIEType:Low Latency Interrupt Ethernet Protocol Type (array of int)
    parm:           LLIVLANP:Low Latency Interrupt on VLAN priority threshold (array of int)
    parm:           FdirPballoc:Flow Director packet buffer allocation level:
    			1 = 8k hash filters or 2k perfect filters
    			2 = 16k hash filters or 4k perfect filters
    			3 = 32k hash filters or 8k perfect filters (array of int)
    parm:           AtrSampleRate:Software ATR Tx packet sample rate (array of int)
    parm:           FCoE:Disable or enable FCoE Offload, default 1 (array of int)
    parm:           LRO:Large Receive Offload (0,1), default 1 = on (array of int)
    parm:           allow_unsupported_sfp:Allow unsupported and untested SFP+ modules on 82599 based adapters, default 0 = Disable (array of int)

### Step Four: Test Ixgbe Driver ###

Before testing the new module, you need to remove an old ersion of ixgbe module if it exists in the kernel:

    $ sudo rmmod ixgbe

Go ahead and insert the newly built ixgbe module into the kernel with insmod command. Make sure to specify an absolute path to the module.

    $ sudo insmod ./ixgbe.ko

If the above command runs successfully, it will not show any message.

If you want, you can try passing additional prameter(s). For example, to set the number of RSS queues to 16:

    $ sudo insmod ./ixgbe.ko RSS=16

Check out **/var/log/kern.log** to see if ixgbe driver is successfully activated. Look for "Intel(R) 10 Gigabit PCI Express Network Driver" in the log. The ixgbe version should be matched with the output of modinfo shown earlier.

    Sep 18 14:48:52 spongebob kernel: [684717.906254] Intel(R) 10 Gigabit PCI Express Network Driver - version 3.22.3

![](https://farm8.staticflickr.com/7583/16056721867_f06e152076_c.jpg)

### Step Five: Install Ixgbe Driver ###

Once you verify that a new ixgbe driver is successfully loaded, the last step is to install the driver on your system.

    $ sudo make install

**ixgbe.ko** will then be installed under /lib/modules/<kernel-version>/kernel/drivers/net/ethernet/intel/ixgbe.

From this point on, you can load ixgbe driver with modprobe command as follows. Note that you no longer need to specify an absolute path.

    $ sudo modprobe ixgbe

If you want ixgbe driver to be loaded automatically upon boot, you can add "ixgbe" to the end of /etc/modules.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/download-install-ixgbe-driver-ubuntu-debian.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://sourceforge.net/projects/e1000/files/ixgbe%20stable/