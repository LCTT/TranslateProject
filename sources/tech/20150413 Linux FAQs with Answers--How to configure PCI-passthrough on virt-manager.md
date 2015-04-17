Linux FAQs with Answers--How to configure PCI-passthrough on virt-manager
================================================================================
> **Question**: I would like to dedicate a physical network interface card to one of my guest VMs created by KVM. For that, I am trying to enable PCI passthrough of the NIC for the VM. How can I add a PCI device to a guest VM with PCI passthrough on virt-manager? 

Modern hypervisors enable efficient resource sharing among multiple guest operating systems by virtualizing and emulating hardware resources. However, such virtualized resource sharing may not always be desirable, or even should be avoided when VM performance is a great concern, or when a VM requires full DMA control of a hardware device. One technique used in this case is so-called "PCI passthrough," where a guest VM is granted an exclusive access to a PCI device (e.g., network/sound/video card). Essentially, PCI passthrough bypasses the virtualization layer, and directly exposes a PCI device to a VM. No other VM can access the PCI device.

### Requirement for Enabling PCI Passthrough ###

If you want to enable PCI passthrough for an HVM guest (e.g., a fully-virtualized VM created by KVM), your system (both CPU and motherboard) must meet the following requirement. If your VM is paravirtualized (created by Xen), you can skip this step.

In order to enable PCI passthrough for an HVM guest VM, your system must support **VT-d** (for Intel processors) or **AMD-Vi** (for AMD processors). Intel's VT-d ("Intel Virtualization Technology for Directed I/O") is available on most high-end Nehalem processors and its successors (e.g., Westmere, Sandy Bridge, Ivy Bridge). Note that VT-d and VT-x are two independent features. A list of Intel/AMD processors with VT-d/AMD-Vi capability can be found [here][1].

After you verify that your host hardware supports VT-d/AMD-Vi, you then need to do two things on your system. First, make sure that VT-d/AMD-Vi is enabled in system BIOS. Second, enable IOMMU on your kernel during booting. The IOMMU service, which is provided by VT-d,/AMD-Vi, protects host memory access by a guest VM, and is a requirement for PCI passthrough for fully-virtualized guest VMs.

To enable IOMMU on the kernel for Intel processors, pass "**intel_iommu=on**" boot parameter on your Linux. Follow [this tutorial][2] to find out how to add a kernel boot parameter via GRUB.

After configuring the boot parameter, reboot your host.

### Add a PCI Device to a VM on Virt-Manager ###

Now we are ready to enable PCI passthrough. In fact, assigning a PCI device to a guest VM is straightforward on virt-manager.

Open the VM's settings on virt-manager, and click on "Add Hardware" button on the left sidebar.

Choose a PCI device to assign from a PCI device list, and click on "Finish" button.

![](https://farm8.staticflickr.com/7587/17015584385_db49e96372_c.jpg)

Finally, power on the guest. At this point, the host PCI device should be directly visible inside the guest VM.

### Troubleshooting ###

If you see either of the following errors while powering on a guest VM, the error may be because VT-d (or IOMMU) is not enabled on your host.

    Error starting domain: unsupported configuration: host doesn't support passthrough of host PCI devices

----------

    Error starting domain: Unable to read from monitor: Connection reset by peer

Make sure that "**intel_iommu=on**" boot parameter is passed to the kernel during boot as described above.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/pci-passthrough-virt-manager.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://wiki.xenproject.org/wiki/VTdHowTo
[2]:http://xmodulo.com/add-kernel-boot-parameters-via-grub-linux.html