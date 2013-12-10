@hongchuntang translated.

Intel Haswell Linux Virtualization: KVM vs. Xen vs. VirtualBox
==============================================================

最后一章让我们看看linux平台基准测试下的[Intel Haswell]的表现，在集成最新软件的Fedora 19操作系统平台下，使用Intel Core i7 4770K "Haswell" CPU比较KVM, Xen, VirtualBox的性能。

从上月Haswell发布以来，我们发行了此最新款Intel CPUs的许多评测，但直到今天才真正测试Haswell的Linux虚拟化性能,开启Intel硬件虚拟化技术（译者注：VT-x)下，在纯净64bit版Fedora 19下对KVM, Xen,VirtualBox进行比较.


OS系统平台采用Fedora 19拥有Linux 3.9.8内核，GCC 4.8.1,Mesa 9.2.0-devel, 以及EXT4文件系统.所有的虚拟化软件依赖包都从Fedora 19软件仓库EPEL中安装，包括QEMU 1.4.2, Xen 4.2.2,及libvirt / virt-manager组件，Xen及KVM通过virt-manager进行安装好，而VirtualBox 4.2.16从VirtualBox.org进行安装。

![](http://www.phoronix.net/image.php?id=intel_haswell_virtualization&image=intel_haswell_virtualization_med)

配置上，Intel Core i7 4770K的主机拥有16GB内存及240GB的OCZ Vertex 3 SSD硬盘;测试平台的每一个VM都分配8核（4物理内核+HT)以及12GB内存和16G磁盘空间。


同时，拥有Intel Core i7 "Haswell"的Fedora 19 Linux 3.9下的KVM,Xen,VirtualBox测试结果也与未运行任何虚拟化的裸机"bare metal"进行对比.VMware的产品因为它们的EULA公共评测限制版 ，未在此评测中（尽管VMware过去曾与我们合作过），同时它们的试用版本也存在4核CPU限制，但今后将会推出其它硬件架构下的Xen/KVM/VMware的性能比较.

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=9083341&p=2)


所有这些虚拟化评测都使用[OpenBenchmarking.org]认证过的全自动及可复制的开源软件[Phoronix Test Suite]。由于使用虚拟磁盘及Xen/KVM并没有一个可靠的共享3D主机显卡GPU驱动，除于此两项，大多数评测都聚焦于不同Linux下虚拟方法的最大性能表现.


![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=16f6601&p=2)


由于虚拟磁盘运行在主机磁盘文件系统之下，固而磁盘性能评测并不是此次的焦点，然而，将这三种虚拟模式与bare metal裸机模式进行比较，发现Linux 3.8内核下KVM性能最佳，Xen紧随其后。Oracle的VirtualBox仅仅在此主机的PostMark邮件服务器性能测试中得到66%的成绩，KVM得96%,Xen得83%。

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=ee1f01f&p=2)

在Dolfyn浮点计算中，相比bare metal结果来看，KVM及Xen并没有明显变化，而VirtualBox显然相当慢。

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=1a54755&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=b3c948c&p=2)

FFTE及HMMer测试结果类似于Dolfyn，KVM及Xen仅小许落后，但Oracle VM VirtualBox却显得相当慢.

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=78137b2&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=0a735b7&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=8d2ce17&p=2)

运行John The Ripper时，VirtualBox直接crash掉.汉!

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=6bd26cc&p=2)

出人意料的是，在Linux 3.9内核的Fedora 19下，Xen竟然在TTSIOD Renderer测试中获得最佳性能表现。

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=4a440fd&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=79113d7&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=505359a&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=1593a32&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=0f84676&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=3cde78a&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=fc3d96e&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=3e91cb0&p=2)


总的来看，在Intel Core i7 4770k CPU下，Fedora 19下的Xen及KVM虚拟化表现相当不错。在Hasswell处理器下运行在虚拟化性能差异相当小。而相比Xen及KVM,Oracle的VirtualBox(最终版 V4.2.16)却相当落后。但VirtualBox最大的好处却是3D加速，今 后会在Phoronix专栏中推出它的评测。不久将来也会推出Hasswell相比先及Intel以前的处理器及AMD处理器的不同虚拟方式的比较.

--------------------------------------------------------------------------------

via: http://www.phoronix.com/scan.php?page=article&item=intel_haswell_virtualization

译者：[@hongchuntang](http://blog.csdn.net/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.phoronix.com/scan.php?page=search&q=Haswell
[2]:http://www.phoronix.com/scan.php?page=news_item&px=MTM5MzU
[3]:http://www.phoronix-test-suite.com/
[4]:http://openbenchmarking.org/

