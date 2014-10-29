Linux FAQs with Answers--How to fix “hda-duplex not supported in this QEMU binary”
================================================================================
> **Question**: When I try to install Linux on a new VM in virt-manager, the VM fails to boot with the following error: "unsupported configuration: hda-duplex not supported in this QEMU binary." How can I fix this error?

The cause for this VM error may originate from a qemu bug where a configured default sound card model is not recognized.

![](https://farm4.staticflickr.com/3935/15000012754_b8b147fb16_o.png)

    Unable to complete install: 'unsupported configuration: hda-duplex not supported in this QEMU library'

To solve this problem, do the following.

### Solution One: Virt-Manager ###

On **virt-manager**, open the VM's virtual hardware details menu, go to sound device section, and change the device model from default to ac97.

![](https://farm4.staticflickr.com/3956/15435183020_d97856170c_z.jpg)

Click on "Apply" button to save the change. See if you can start the VM now.

### Solution Two: Virsh ###

If you are using **virsh**, not **virt-manager**, you can edit the VM's XML file accordingly. Look for **sound** section inside <device> section, and change the sound model to **ac97** as follows.

    <devices>
      . . .
      <sound model='ac97'>
        <address type='pci' domain='0x0000' bus='0x00' slot='0x04' function='0x0'/>
      </sound>
      . . .
    </device>

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/hda-duplex-not-supported-in-this-qemu-binary.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出