Linux 有问必答：如何改变libvirt VM镜像的默认位置
================================================================================
> **提问**： 我使用libvirt和virt-manager在我的Linux系统上创建虚拟机。我注意到虚拟机镜像位于/var/lib/libvirt/images目录。有没有办法改变虚拟机镜像的默认路径？

**libvirt**和它的GUI前端**virt-manager**可以使用不同的虚拟机管理程序创建和管理VM，例如LVM和Xen。默认上所有的虚拟机镜像通过**libvirt**创建到/var/lib/libvirt/images目录。然而，这有时并不是我们希望的。比如/var/lib/libvirt/images此处的磁盘分区大小有限。或者你想要存储所有的虚拟机镜像到一个特定的用于管理的仓库中。

实际上，你可以非常容易地改变libvirt镜像的默认目录，或者称之为“存储池”。

有两种方法可以改变默认存储池。

### 方法一: Virt-Manager GUI ###

如果你正在使用virt-manager GUI程序，改变默认存储池非常容易。

进入**virt-manager**的菜单GUI “编辑” -> "连接细节"。

![](https://farm4.staticflickr.com/3935/15433062592_0d89a8d132_o.png)

你可以看到如下所是的默认存储池。在窗口的左下角，点击叉形按钮，将会停止默认的存储池。存储池一旦停止后，点击右边的垃圾桶，将会删除存储池。**注意这个动作不会删除池中的镜像。**

现在点击左边的加号增加一个新的存储池。

![](https://farm6.staticflickr.com/5600/15246703330_26884c8258_b.jpg)

输入新的存储池的名字（比如：default），并且选择存储池的类型。本例中，因为我们只是改变存储池目录所以选择“文件系统目录”。

![](https://farm4.staticflickr.com/3928/15433416355_1a2f9f85ab_b.jpg)

输入新的存储池路径（比如，/storage）。

![](https://farm6.staticflickr.com/5599/15433062732_195fa6701b_b.jpg)

这时，新的存储池应该启动了，并且自动在你创建一个新的虚拟机的时候使用。

![](https://farm4.staticflickr.com/3934/15430217721_b14c3a93fa_b.jpg)

### 方法二: Virsh 命令行 ###

另外一个改变默认存储池目录的方法是使用来自**libvirt**包的**virsh** 命令行工具。

首先，运行下面的命令来导出默认存储池的XML定义。

     $ virsh pool-dumpxml default > pool.xml 

用文本编辑器打开XML文件，并且改变<path>节点中的/var/lib/libvirt/images改成新的地址。

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

移除现在的默认池。

    $ virsh pool-destroy default 

----------

    Pool default destroyed

现在创建一个基于更新后的XML文件的新存储池。

    $ virsh pool-create pool.xml 

----------

    Pool default created from pool.xml

这时，默认池已经改变到新的地址了，并且可以使用了。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/change-default-location-libvirt-vm-images.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出