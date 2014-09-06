Translating-----------geekpi


Linux FAQs with Answers--How to set a static MAC address on VMware ESXi virtual machine
================================================================================
> **Question**: I want to assign a static MAC address to a virtual machine (VM) on VMware ESXi. However, when I attempt to start a VM with a static MAC address, the VM fails to start and throws an error "00:0c:29:1f:4a:ab is not an allowed static Ethernet address. It conflicts with VMware reserved MACs". How can I set a static MAC address on VMware ESXi VMs? 

When you create a VM on VMware ESXi, each network interface of the VM is assigned a dynamically generated MAC address. If you want to change this default behavior and assign a static MAC address to your VM, here is how to do it.

![](https://farm6.staticflickr.com/5592/14726591627_64c1dc67ce_z.jpg)

As you can see above, VMware's vSphere GUI client already has a menu for setting a static MAC address for a VM. However, this GUI-based method only allows you to choose a static MAC address from **00:50:56:xx:xx:xx**, which is VMware-reserved MAC address range. If you attempt to set any arbitrary MAC address outside this MAC range, you will fail to launch the VM, and get the following error.

![](https://farm6.staticflickr.com/5591/14890165456_a82ded21b9_z.jpg)

Then what if I want to assign any arbitrary MAC address to a VM?

Fortunately, there is a workaround to this limitation. The solution is, instead of using vSphere GUI client, editing .vmx file of your VM directly, after logging in to the ESXi host.

First, turn off the VM to which you want to assign a static MAC address.

[Enable SSH access to your ESXi host][1] if you haven't done it already. Then log in to the ESXi host via SSH.

Move to the directory where your VM's .vmx file is located:

    # cd vmfs/volumes/datastore1/[name-of-vm] 

Open .vmx file with a text editor, and add the following fields. Replace the MAC address field with your own.

    ethernet0.addressType = "static"
    ethernet0.checkMACAddress = "false"
    ethernet0.address = "00:0c:29:1f:4b:ac"

Now you should be able to launch a VM with the static MAC address you defined in .vmx file.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/static-mac-address-vmware-esxi-virtual-machine.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ask.xmodulo.com/enable-ssh-remote-access-vmware-esxi5.html