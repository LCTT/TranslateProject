KVM，Xen与VirtualBox在Intel Haswell上的Linux虚拟化性能比较
==============================================================

现在我们做的是[Intel Haswell][1]的虚拟化基准测试。我们在Intel酷睿i7 4770K的“Haswell”处理器上使用搭载了最新软件组件的Fedora 19，来进行KVM，Xen和VirtualBox的基准测试。

自从上个月推出Haswell以来，我们已经发布了许多和这款全新的英特尔处理器相关的基准测试，但我们直到这篇文章发布前，一直没有涵盖虚拟化方面的性能测试。这里，启用了英特尔硬件虚拟化后，将在一个纯净的Fedora 19 的64位操作系统上，分别安装KVM，Xen和Virtualbox，并进行比较。

目前Fedora 19拥有搭载GCC 4.8.1的Linux 3.9.8版本内核，Mesa 9.2.0开发库和一个EXT4文件系统。所有的虚拟化组件都从Fedora 19的仓库中获取的，包括QEMU 1.4.2，Xen 4.2.2和libvirt/virt-manager组件。Xen和KVM的虚拟化通过virt-manager来建立。VirtualBox 4.2.16则是通过VirtualBox.org获取并安装在Fedora 19中。

![](http://www.phoronix.net/image.php?id=intel_haswell_virtualization&image=intel_haswell_virtualization_med)

这个英特尔酷睿i7 4770K机器拥有16GB的内存和240GB的OCZ Vertex 3 固态硬盘。在测试中，每一个虚拟机能够使用全部八个逻辑核心（四个物理核心加上超线程）、16GB内存中的12GB以及16GB的虚拟磁盘。

在采用英特尔酷睿i7 “Haswell”处理器的Linux 3.9版本内核的Fedora 19上安装的KVM，Xen和VirtualBox的性能也和在没有任何形式的虚拟化或其它抽象层上运行基准测试的“裸机（Bare Metal）”的性能进行了对比。VMWare的产品没有在这篇文章里被测试，因为它们的EULA特性限制了这种公开基准测试（尽管VMware在过去可以让我们正常地做这样的基准测试），并且它们的试用软件只能限制运行在四核CPU上。但以后的另外一篇文章会比较下在其它硬件上XEN/KVM/VMware的性能。

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=9083341&p=2)

全部的Linux虚拟化基准测试采用完全自动化和可重复的方式进行处理，使用开源软件[Phoronix Test Suite][3]并由[OpenBenchmarking.org][4]支持。在使用虚拟磁盘而且Xen/KVM都没有一个可靠的访问主机驱动或GPU的方法以使用3D功能的情况下，这篇文章里的大部分基准测试都是集中在不同Linux虚拟化方法计算性能开销上。

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=16f6601&p=2)

磁盘测试在这里并不是虚拟化测试的一个重点，因为只有一个虚拟磁盘被主机的文件系统使用。然而，当把这三种Linux虚拟化方法与裸机结果进行比较时，运行在Linux 3.9内核上的KVM性能最好，其次是Xen。Oracle的Virtual仅仅跑出了主机上PostMark邮件服务器性能的66%，而KVM跑出了性能的96%，Xen是83%。

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=ee1f01f&p=2)

对于Dolfyn计算流体动力学的工作量，当运行在KVM或Xen上时，和裸机的运行结果相比并没有任何重大的变化。然而，VirtualBox则是明显变慢了。

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=1a54755&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=b3c948c&p=2)

FFTE和HMMer的结果和Dolfyn类似：Xen和KVM用很小的开销获得很好的性能，但Oracle的VirtualBox则慢得多。

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=78137b2&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=0a735b7&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=8d2ce17&p=2)

当John The Ripper这个破解密码的程序在VirtualBox中运行时，则直接崩溃了。

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=6bd26cc&p=2)

运行TTSIOD渲染器时，在Linux 3.9 内核的Fedora 19上运行的Xen虚拟化方法获得了它的第一次性能比拼的胜利。

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=4a440fd&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=79113d7&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=505359a&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=1593a32&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=0f84676&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=3cde78a&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=fc3d96e&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=3e91cb0&p=2)

总之，运行在搭载英特尔酷睿i7 4770K处理器Fedora 19上的Xen和KVM虚拟化技术工作良好。这些虚拟化方法在Haswell处理器上的性能开销是最小的。当Xen和KVM在这款全新的英特尔处理器上运行良好的时候，Oracle的VirtualBox（最新版本，v4.2.16）相对慢得多。虽然VirtualBox的一个优点是支持客户机3D加速，但这会在未来的一篇Phoronix文章中再次进行测试。而把Haswell和前几代的英特尔处理器和AMD处理器比较不同虚拟化方法的性能开销也会在不久之后在Phoronix上进行测试。

--------------------------------------------------------------------------------

via: http://www.phoronix.com/scan.php?page=article&item=intel_haswell_virtualization

译者：[KayGuoWhu](http://github.com/KayGuoWhu) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.phoronix.com/scan.php?page=search&q=Haswell
[2]:http://www.phoronix.com/scan.php?page=news_item&px=MTM5MzU
[3]:http://www.phoronix-test-suite.com/
[4]:http://openbenchmarking.org/

