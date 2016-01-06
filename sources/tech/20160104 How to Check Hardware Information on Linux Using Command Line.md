sonofelice translating
How to Check Hardware Information on Linux Using Command Line
================================================================================
![](https://maketecheasier-holisticmedia.netdna-ssl.com/assets/uploads/2015/12/hdd_info_featured-1.png)

There are many commands available to check hardware information of your Linux system. Some commands report only specific hardware components like CPU or memory while the rest cover multiple hardware units.

This tutorial takes a quick look at some of the most commonly used commands to check information and configuration details about various hardware devices.

### lscpu ###

The `lscpu` command gives you information about the CPU and processing units. It does not have any other options or functionality.

    lscpu

You will see the following output by running the above command.

![hdd_info_lscpu](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lscpu.png)

### lspci ###

The lspci is another command line tool that lists all the PCI buses and details about the devices connected to them like VGA adapter, graphics card, network adapter, usb ports, SATA controller, etc.

    lspci

You will see an output similar to the following image.

![hdd_info_lspci](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lspci-1.png)

You can also filter out specific device information by running the following command:

    lspci -v | grep "VGA" -A 12

You will see graphics card information similar to the following.

![hdd_info_lspci_vga](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lspci_vga.png)

### lshw ###

The `lshw` is a general purpose utility that reports detailed and brief information about multiple hardware units like CPU, memory, usb controller, disk, etc. Lshw extracts the information from different “/proc” files.

    lshw -short

You will see the following information by running the above command.

![hdd_info_lshw](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lshw.png)

### lsscsi ###

You can list all scsi/sata devices like hard drives and optical drives by running the following command:

    lsscsi

The output wI’ll look something like this image.

![hdd_info_lsscsi](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lsscsi-1.png)

### lsusb ###

This command shows you the USB controllers and details about devices connected to them. By default, the lsusb command prints brief information. You can also use the verbose option -v to print detailed information about each usb port.

    lsusb

You will see the following output.

![hdd_info_lsusb](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lsusb.png)

### Inxi ###

`Inxi` is a bash script that fetches hardware information from multiple sources and commands on the system and gives you goodlooking reports that non-technical users can read easily.

By default, `inxi` is not installed in Ubuntu. You can install it by running the following command:

    sudo apt-get install inxi

After installing inxi, you can get hardware information by running the following command:

    inxi -Fx

You will see an output similar to the image below.

![hdd_info_inxi](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_inxi.jpg)

### df ###

This command gives you brief information about various partitions, their mount points and the used and available space on each.
You can run the `df` command with the `-H` parameter.

    df -H

You will see the following output.

![hdd_info_df](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_df-1.png)

### Free ###

You can check the amount of used, free and total amount of RAM on your system with the free command.

    free -m

You will see the following output.

![hdd_info_free](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_free.png)

### Dmidecode ###

The `dmidecode` command is different from all other commands. It extracts hardware information by reading data from the DMI tables.

To display information about the processor, run:

    sudo dmidecode -t processor

![hdd_info_dmi_processor](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_dmi_processor.jpg)

To display information about the memory, run:

    sudo dmidecode -t memory

![hdd_info_dmi_memory](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_dmi_memory.png)

To display information about the bios, run:

    sudo dmidecode -t bios

![hdd_info_dmi_bios](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_dmi_bios.png)

### Hdparm ###

The hdparm command gives you information about sata devices like hard disks.

    sudo hdparm

You will see the following output.

![hdd_info_hdparm](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_hdparm.png)

### Conclusion ###

Each of the commands has a different method of extracting hardware information. You can try more than one of them while looking for specific hardware details. All of the above tools are available in most Linux distros, and can be easily installed from the default repository.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/check-hardware-information-linux/

作者：[Hitesh Jethva][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/hiteshjethva/
