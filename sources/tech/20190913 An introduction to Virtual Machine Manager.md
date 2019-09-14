[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An introduction to Virtual Machine Manager)
[#]: via: (https://opensource.com/article/19/9/introduction-virtual-machine-manager)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdosshttps://opensource.com/users/alanfdosshttps://opensource.com/users/bgamrathttps://opensource.com/users/marcobravo)

An introduction to Virtual Machine Manager
======
Virt-manager provides a full range of options for spinning up virtual
machines on Linux.
![A person programming][1]

In my [series][2] about [GNOME Boxes][3], I explained how Linux users can quickly spin up virtual machines on their desktop without much fuss. Boxes is ideal for creating virtual machines in a pinch when a simple configuration is all you need.

But if you need to configure more detail in your virtual machine, you need a tool that provides a full range of options for disks, network interface cards (NICs), and other hardware. This is where [Virtual Machine Manager][4] (virt-manager) comes in. If you don't see it in your applications menu, you can install it from your package manager or via the command line:

  * On Fedora: **sudo dnf install virt-manager**
  * On Ubuntu: **sudo apt install virt-manager**



Once it's installed, you can launch it from its application menu icon or from the command line by entering **virt-manager**.

![Virtual Machine Manager's main screen][5]

To demonstrate how to create a virtual machine using virt-manager, I'll go through the steps to set one up for Red Hat Enterprise Linux 8.

To start, click **File** then **New Virtual Machine**. Virt-manager's developers have thoughtfully titled each step of the process (e.g., Step 1 of 5) to make it easy. Click **Local install media** and **Forward**.

![Step 1 virtual machine creation][6]

On the next screen, browse to select the ISO file for the operating system you want to install. (My RHEL 8 image is located in my Downloads directory.) Virt-manager automatically detects the operating system.

![Step 2 Choose the ISO File][7]

In Step 3, you can specify the virtual machine's memory and CPU. The defaults are 1,024MB memory and one CPU.

![Step 3 Set CPU and Memory][8]

I want to give RHEL ample room to run—and the hardware I'm using can accommodate it—so I'll increase them (respectively) to 4,096MB and two CPUs.

The next step configures storage for the virtual machine; the default setting is a 10GB disk image. (I'll keep this setting, but you can adjust it for your needs.) You can also choose an existing disk image or create one in a custom location.

![Step 4 Configure VM Storage][9]

Step 5 is the place to name your virtual machine and click Finish. This is equivalent to creating a virtual machine or a Box in GNOME Boxes. While it's technically the last step, you have several options (as you can see in the screenshot below). Since the advantage of virt-manager is the ability to customize a virtual machine, I'll check the box labeled **Customize configuration before install** before I click **Finish**.

Since I chose to customize the configuration, virt-manager opens a screen displaying a bunch of devices and settings. This is the fun part!

Here you have another chance to name the virtual machine. In the list on the left, you can view details on various aspects, such as CPU, memory, disks, controllers, and many other items. For example, I can click on **CPUs** to verify the change I made in Step 3.

![Changing the CPU count][10]

I can also confirm the amount of memory I set.

When installing a VM to run as a server, I usually disable or remove its sound capability. To do so, select **Sound** and click **Remove** or right-click on **Sound** and choose **Remove Hardware**.

You can also add hardware with the **Add Hardware** button at the bottom. This brings up the **Add New Virtual Hardware** screen where you can add additional storage devices, memory, sound, etc. It's like having access to a very well-stocked (if virtual) computer hardware warehouse.

![The Add New Hardware screen][11]

Once you are happy with your VM configuration, click **Begin Installation**, and the system will boot and begin installing your specified operating system from the ISO.

![Begin installing the OS][12]

Once it completes, it reboots, and your new VM is ready for use.

![Red Hat Enterprise Linux 8 running in VMM][13]

Virtual Machine Manager is a powerful tool for desktop Linux users. It is open source and an excellent alternative to proprietary and closed virtualization products.

Learn how Vagrant and Ansible can be used to provision virtual machines for web development.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/introduction-virtual-machine-manager

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdosshttps://opensource.com/users/alanfdosshttps://opensource.com/users/bgamrathttps://opensource.com/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb (A person programming)
[2]: https://opensource.com/sitewide-search?search_api_views_fulltext=GNOME%20Box
[3]: https://wiki.gnome.org/Apps/Boxes
[4]: https://virt-manager.org/
[5]: https://opensource.com/sites/default/files/1-vmm_main_0.png (Virtual Machine Manager's main screen)
[6]: https://opensource.com/sites/default/files/2-vmm_step1_0.png (Step 1 virtual machine creation)
[7]: https://opensource.com/sites/default/files/3-vmm_step2.png (Step 2 Choose the ISO File)
[8]: https://opensource.com/sites/default/files/4-vmm_step3default.png (Step 3 Set CPU and Memory)
[9]: https://opensource.com/sites/default/files/6-vmm_step4.png (Step 4 Configure VM Storage)
[10]: https://opensource.com/sites/default/files/9-vmm_customizecpu.png (Changing the CPU count)
[11]: https://opensource.com/sites/default/files/11-vmm_addnewhardware.png (The Add New Hardware screen)
[12]: https://opensource.com/sites/default/files/12-vmm_rhelbegininstall.png
[13]: https://opensource.com/sites/default/files/13-vmm_rhelinstalled_0.png (Red Hat Enterprise Linux 8 running in VMM)
