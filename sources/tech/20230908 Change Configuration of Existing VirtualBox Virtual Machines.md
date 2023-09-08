[#]: subject: "Change Configuration of Existing VirtualBox Virtual Machines"
[#]: via: "https://itsfoss.com/virtualbox-change-vm-config/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Change Configuration of Existing VirtualBox Virtual Machines
======

One of the biggest advantages of a virtual machine is that you can always configure it later after creating it.

The configuration may include:

  * Adjusting disk size
  * Allocating more RAM or CPU
  * Tweaking display options
  * Mounting a new disc
  * Changing the connected network
  * Connecting/Disconnected peripherals/devices from host
  * Adding a shared folder



Of course, depending on the [virtualization software][1], the process of customizing things will differ. But it is more or less the same if it allows you to do that.

Here, I shall use **VirtualBox** to highlight how to customize and configure some of these options. This should also be applicable to users who want to [run virtual machines on Windows][2].

🚧

You must turn off the virtual machine for which you are changing the configuration.

### Tweaking allocated RAM and CPU

It is true that the virtual machine may not be able to provide the same performance that you expect on bare metal.

However, if you allocate enough memory (RAM) and processors (CPU) for the virtual machine, you can get a smooth experience. If you do not give the VM enough resources, it may not be a fast user experience.

So, head to the " **System** " settings of the VM you created and then adjust the memory and processors.

![Click to enlarge the image][3]

It is ideal to provide at least 8 GB of memory to the VM (considering you have at least 16 GB of host memory), and two CPUs at the very least for a decent performance.

![][4]

### Increasing disk size

Unlike tweaking the memory, you cannot find the option to increase disk size the same way.

You will have to utilize **VirtualBox's virtual media manager,** which you can quickly access using **Ctrl + D** from the app.

![][5]

And, then change the disk size as per your requirements from the " **Properties** " option. If you have a dynamically allocated disk, you might have to utilize the GParted ISO.

Fret not, we have a detailed guide to help you [increase VirtualBox disk size][6]. Follow it step-by-step to get it done:

![][7]

### Adjusting display settings

![][8]

When it comes to the VM user experience, the display setting is often ignored but remains an important part.

Occasionally, all you have to do is “ **Enable 3D Acceleration** ” and the VM works fast enough. And, if you do not, it may stutter.

💡

3D Acceleration lets the VM utilize the host's graphics hardware to run applications that use 3D features.

Furthermore, you can tweak the rest of the available options if you have a problem getting a visual to a newly created virtual machine. If you want to simply record the virtual machine, you can enable screen recording as well.

While the VM is running, you can always head to the " **View** " menu to adjust the window size or scale the VM display.

**Suggested Read 📖**

![][7]

### Mounting a disc or changing drive

Sometimes you want to access a disk or an ISO from within the virtual machine.

For instance, mounting a disk image to install some drivers or similar. You can do that through the **Storage** options. You can also choose to create a new virtual hard disk or open an existing one if you created one earlier.

![][9]

### Changing network connections

![][10]

By default, the network adapter is enabled and set to as "[ **NAT**][11]" type. So, the virtual machine shares the host's network without hassle.

You do not have to set up a network connection manually for most distros created as a virtual machine.

However, if you have trouble connecting to the internet inside the VM, you can tweak around the network connections, change the connection type, adapter type, and other options that you see in the screenshot above.

**Suggested Read 📖**

![][7]

### Connecting and disconnecting devices

![][12]

You can always connect any of your devices to the VM or disconnect them as you need, even when it is running.

When the VM is not running, you can go to the USB settings to add/remove devices.

And, when the VM is running, you head to the " **Devices** " menu from the top of the VM window and click/untick on the devices to connect or remove as you require.

### Adding a shared folder

You should always utilize the " **Guest Additions** " feature of VirtualBox to utilize abilities like having a shared folder between host and the VM, sharing the same clipboard, and more.

Simply head to the VM settings, and add a shared folder with your custom path.

You can refer to our [VirtualBox Guest Additions][13] guide to know how to add shared folders to your VM and more:

![][7]

### Wrapping Up

By now, you must have realized that there are so many things that you can do with the free and open-source virtualization program " **VirtualBox** ".

Configure your virtual machine to get the best experience!

_💬 What is the first thing that you do after creating a virtual machine? Is VirtualBox your preferred choice of virtualization program? Share your thoughts in the comments below._

--------------------------------------------------------------------------------

via: https://itsfoss.com/virtualbox-change-vm-config/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/virtualization-software-linux/
[2]: https://itsfoss.com/windows-enable-virtualization/
[3]: https://itsfoss.com/content/images/2023/09/virtualbox-system-ram.png
[4]: https://itsfoss.com/content/images/2023/09/change-cpu-config-virtualbox.png
[5]: https://itsfoss.com/content/images/2023/09/virtualbox-disk-size.png
[6]: https://itsfoss.com/increase-disk-size-virtualbox/
[7]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[8]: https://itsfoss.com/content/images/2023/09/virtualbox-display-settings.png
[9]: https://itsfoss.com/content/images/2023/09/virtualbox-disk-mount.png
[10]: https://itsfoss.com/content/images/2023/09/virtualbox-networks.png
[11]: https://en.wikipedia.org/wiki/Network_address_translation
[12]: https://itsfoss.com/content/images/2023/09/virtualbox-usb-devices.png
[13]: https://itsfoss.com/virtualbox-guest-additions-ubuntu/
