Linux FAQs with Answers--How to change default location of libvirt VM images
================================================================================
> **Question**: I am using libvirt and virt-manager to create VMs on my Linux system. I noticed that the VM images are stored in /var/lib/libvirt/images directory. Is there a way to change the default location of VM image directory to something else? 

**libvirt** and its GUI front-end **virt-manager** can create and manage VMs using different hypervisors such as KVM and Xen. By default, all the VM images created via **libvirt** go to /var/lib/libvirt/images directory. However, this may not be desirable in some cases. For example, the disk partition where /var/lib/libvirt/images lives may have limited free space. Or you may want to store all VM images in a specific repository for management purposes.

In fact, you can easily change the default location of the libvirt image directory, or what they call a "storage pool."

There are two ways to change the default storage pool.

### Method One: Virt-Manager GUI ###

If you are using virt-manager GUI program, changing the default storage pool is very easy.

Go to "Edit" -> "Connection Details" in **virt-manager** menu GUI.

![](https://farm4.staticflickr.com/3935/15433062592_0d89a8d132_o.png)

You will see the default storage pool as shown below. On the left bottom of the window, click on the cross icon, which will stop the default storage pool. Once the pool is stopped, click on the trash bin icon on the right, which will delete the pool. Note that this action will NOT remove the VM images inside the pool.

Now click on the plus icon on the far left to add a new storage pool.

![](https://farm6.staticflickr.com/5600/15246703330_26884c8258_b.jpg)

Type in the name of a new storage pool (e.g., default), and choose the type of the pool. In this case, choose a "filesystem directory" type since we are simply changing a storage pool directory.

![](https://farm4.staticflickr.com/3928/15433416355_1a2f9f85ab_b.jpg)

Type in the path of a new storage pool (e.g., /storage).

![](https://farm6.staticflickr.com/5599/15433062732_195fa6701b_b.jpg)

At this point, the new storage pool should be started, and automatically used when you create a new VM.

![](https://farm4.staticflickr.com/3934/15430217721_b14c3a93fa_b.jpg)

### Method One: Virsh Command-Line ###

Another method to change the default storage pool directory is to use **virsh** command line utility which comes with **libvirt** package.

First, run the following command to dump XML definition of the default storage pool.

     $ virsh pool-dumpxml default > pool.xml 

Open this XML file with a text editor, and change <path> element from /var/lib/libvirt/images to a new location.

    <pool type='dir'>
      <name>default</name>
      <uuid>0ec0e393-28a2-e975-feec-0c7356f38d08</uuid>
      <capacity unit='bytes'>975762788352</capacity>
      <allocation unit='bytes'>530052247552</allocation>
      <available unit='bytes'>445710540800</available>
      <source>
      </source>
      <target>
        <path>/var/lib/libvirt/images</path>
        <permissions>
          <mode>0711</mode>
          <owner>-1</owner>
          <group>-1</group>
        </permissions>
      </target>
    </pool>

Remove the current default pool.

    $ virsh pool-destroy default 

----------

    Pool default destroyed

Now create a new storage pool based on the updated XML file.

    $ virsh pool-create pool.xml 

----------

    Pool default created from pool.xml

At this point, a default pool has been changed to a new location, and is ready for use.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/change-default-location-libvirt-vm-images.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出