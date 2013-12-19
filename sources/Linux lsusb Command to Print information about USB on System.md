Translating----------------------geekpi


Linux lsusb Command to Print information about USB on System
================================================================================
**Universal Serial Bus** or **USB** was designed to standardize the connection of computer peripherals such as keyboards, pointing devices, printers, digital cameras, portable media players, disk drives and network adapters) – Source : [Wikipedia][1]

![lsusb linux command](http://linoxide.com/wp-content/uploads/2013/12/lsusb-linux-command.jpg)

Since it becoming a industry standard, now it’s hard to see a computer without USB port on it. The usage of USB Flashdisk makes it more popular. On Linux, we have **lsusb** to list the USB devices and its properties.

### What is lsusb ###

From it’s manual page, lsusb is defined as :

A utility for displaying information about USB buses in the system and the devices connected to them.

How to run lsusb

To run lsusb, you can type lsusb directly from console.

    $ lsusb

    Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
    Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
    Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
    Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
    Bus 005 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
    Bus 006 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
    Bus 007 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
    Bus 008 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
    Bus 002 Device 003: ID 17ef:4811 Lenovo Integrated Webcam [R5U877]
    Bus 008 Device 002: ID 0a5c:217f Broadcom Corp. Bluetooth Controller

**lsusb** will show you the drivers and device which is internally attach on your system.

This is how to read the output. I grab the last line from above output :

#### Bus 008 Device 002 : ID 0a5c:217f Broadcom Corp. Bluetooth Controller ####

- **Bus 008** : means where the device is attached
- **Device 002** : means this is the second device that attach
- **ID** : means the ID number of this device
- **Broadcom Corp**. Bluetooth Controller : means its manufacture name and device name

We also see that we also have USB 2.0 root hub drivers and USB 1.1 root hub drivers attach in our system.

This is also shown using [dmesg][2] command. Here’s an example of it.

    $ dmesg |grep -i usb

    [ 0.353138] usbcore: registered new interface driver usbfs
    [ 0.353150] usbcore: registered new interface driver hub
    [ 0.353182] usbcore: registered new device driver usb
    [ 0.730026] ehci_hcd: USB 2.0 ‘Enhanced’ Host Controller (EHCI) Driver
    [ 0.730116] ehci_hcd 0000:00:1a.7: new USB bus registered, assigned bus number 1
    [ 0.748019] ehci_hcd 0000:00:1a.7: USB 2.0 started, EHCI 1.00
    [ 0.748169] hub 1-0:1.0: USB hub found
    [ 0.748336] ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 2
    [ 0.768019] ehci_hcd 0000:00:1d.7: USB 2.0 started, EHCI 1.00
    [ 0.768147] hub 2-0:1.0: USB hub found
    [ 0.768236] ohci_hcd: USB 1.1 ‘Open’ Host Controller (OHCI) Driver
    [ 0.768251] uhci_hcd: USB Universal Host Controller Interface driver 

### How to list USB details ###

Use **-v** paramater to do it. Here’s a sample of it.

    $ lsusb -v

    Interface Descriptor:
    bLength 9
    bDescriptorType 4
    bInterfaceNumber 1
    bAlternateSetting 5
    bNumEndpoints 2
    bInterfaceClass 224 Wireless
    bInterfaceSubClass 1 Radio Frequency
    bInterfaceProtocol 1 Bluetooth
    iInterface 0
    Endpoint Descriptor:
    bLength 7
    bDescriptorType 5
    bEndpointAddress 0×83 EP 3 IN
    bmAttributes 1
    Transfer Type Isochronous
    Synch Type None
    Usage Type Data
    wMaxPacketSize 0×0040 1x 64 bytes
    bInterval 1
    Endpoint Descriptor:
    bLength 7
    bDescriptorType 5
    bEndpointAddress 0×03 EP 3 OUT
    bmAttributes 1
    Transfer Type Isochronous
    Synch Type None
    Usage Type Data
    wMaxPacketSize 0×0040 1x 64 bytes
    bInterval 1

### Find how many USB devices are connected ###

To find it use this command

    $ find /dev/bus

Then you will have an output like this :

    /dev/bus
    /dev/bus/usb
    /dev/bus/usb/008
    /dev/bus/usb/008/002
    /dev/bus/usb/008/001
    /dev/bus/usb/007
    /dev/bus/usb/007/001
    /dev/bus/usb/006
    /dev/bus/usb/006/001
    /dev/bus/usb/005
    /dev/bus/usb/005/001
    /dev/bus/usb/004
    /dev/bus/usb/004/001
    /dev/bus/usb/003
    /dev/bus/usb/003/001
    /dev/bus/usb/002
    /dev/bus/usb/002/004
    /dev/bus/usb/002/003
    /dev/bus/usb/002/001
    /dev/bus/usb/001
    /dev/bus/usb/001/001

Using **lsusb** command **combine with -D** parameter, you can print the detail of specific device. Here’s a sample to view Broadcom Bluetooth device.

    $ lsusb -D /dev/bus/usb/008/002

    Device: ID 0a5c:217f Broadcom Corp. Bluetooth Controller
    Couldn’t open device, some information will be missing
    Device Descriptor:
    bLength 18
    bDescriptorType 1
    bcdUSB 2.00
    bDeviceClass 224 Wireless
    bDeviceSubClass 1 Radio Frequency
    bDeviceProtocol 1 Bluetooth
    bMaxPacketSize0 64
    idVendor 0x0a5c Broadcom Corp.
    idProduct 0x217f Bluetooth Controller
    bcdDevice 3.60
    iManufacturer 1
    iProduct 2
    iSerial 3
    bNumConfigurations 1
    Configuration Descriptor:
    bLength 9
    bDescriptorType 2
    wTotalLength 216
    bNumInterfaces 4
    bConfigurationValue 1
    iConfiguration 0
    bmAttributes 0xe0
    Self Powered
    Remote Wakeup
    MaxPower 0mA
    Interface Descriptor:
    bLength 9
    bDescriptorType 4
    bInterfaceNumber 0
    bAlternateSetting 0
    bNumEndpoints 3
    bInterfaceClass 224 Wireless
    bInterfaceSubClass 1 Radio Frequency
    bInterfaceProtocol 1 Bluetooth
    iInterface 0
    Endpoint Descriptor:
    bLength 7
    bDescriptorType 5
    bEndpointAddress 0×81 EP 1 IN
    bmAttributes 3
    Transfer Type Interrupt
    Synch Type None
    Usage Type Data
    wMaxPacketSize 0×0010 1x 16 bytes
    bInterval 1
    Endpoint Descriptor:
    bLength 7
    bDescriptorType 5
    bEndpointAddress 0×82 EP 2 IN
    bmAttributes 2
    Transfer Type Bulk
    Synch Type None
    Usage Type Data
    wMaxPacketSize 0×0040 1x 64 bytes
    bInterval 1
    Endpoint Descriptor:
    bLength 7
    bDescriptorType 5
    bEndpointAddress 0×02 EP 2 OUT
    bmAttributes 2
    Transfer Type Bulk
    Synch Type None
    Usage Type Data
    wMaxPacketSize 0×0040 1x 64 bytes
    bInterval 1 

### Find your Mass Storage ###

Since **lsusb -v** give us a very detail information, you may miss something to read. We can focus to specific information using grep command. Here are some samples.

Mass storage will have a vendor name and ID. We can use it as a starting point.

    $ lsusb -v |grep -Ei ‘(idVendor|Mass\ Storage)’

    idVendor 0×1005 Apacer Technology, Inc.
    bInterfaceClass 8 Mass Storage

You can see, that we have one USB Mass Storage attached on our system from Apacer Technology, Inc.

### Dump the physical USB device hierarchy as a tree ###

Use **-t** parameter to fulfill this purpose.

    $ lsusb -t

    /: Bus 08.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
    /: Bus 07.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
    /: Bus 06.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
    /: Bus 05.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
    /: Bus 04.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
    /: Bus 03.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
    /: Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci_hcd/6p, 480M
    |__ Port 1: Dev 4, If 0, Class=stor., Driver=usb-storage, 480M
    |__ Port 6: Dev 3, If 0, Class=’bInterfaceClass 0x0e not yet handled’, Driver=uvcvideo, 480M
    |__ Port 6: Dev 3, If 1, Class=’bInterfaceClass 0x0e not yet handled’, Driver=uvcvideo, 480M
    /: Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci_hcd/6p, 480M

The number **12M and 480M** is **indicate the transfer rate speed** of USB type.

- 12M means 12Mbit/s which is a USB 1.0 / 1.1 type
- 480M means 480Mbit/s which is a USB 2.0 type

If you found 5.0G, it means that you have USB 3.0 type. It has 5.0Gbit/s transfer rate. Linux recognize the detail of USB devices from **/var/lib/usbutils/usb.ids** . Or you can visit to [Linux-USB.org][3] to get the newest list of USB ID’s.

That’s all about lsusb command on daily basis. You can use lsusb command to do a diagnostic activity about your USB devices on your system. As usual, you can explore more detail by reading lsusb manual page. Just type **man lsusb** to see its manual page.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-lsusb-command-print-usb/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://en.wikipedia.org/wiki/USB
[2]:http://linoxide.com/linux-command/linux-dmesg-command/
[3]:http://www.linux-usb.org/usb.ids