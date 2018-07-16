性能基准测试：KVM大战Xen
================================================================================
在上周，我们对 KVM 和 Xen 近几年里在性能上的改进进行了一些有趣的探讨后，我打算自己做一些这方面的小研究。我能找到的最新的资料，是来自[2013年 Phoronix Haswell 性能评测][1]上的基准测试。当然，还有[其它一些2011年的评测][2]，不过由于 Xen 被收录进 Kernel 3.0，它们都已被热烈地讨论过。

2011年的测试提供了[许多很好的基准报表][3]，在三年后的现在，我尽最大努力把它们列出的属性重新测试一遍。但我删减了其中两三个基准测试，原因是它们在未经特定优化的配置后跑出来的数据不是很好，或者它们需要跑很长时间才能得到结果。

### 测试环境 ###

测试环境由两台一模一样的超微服务器组成，分别都配备一颗[Intel 至强 E3-1220][4]（4核，3.10GHz），24G 金士顿 DDR3 内存，4块西数 RE-3 160G 磁盘（组成 RAID10 阵列）。另外 BIOS 也是一模一样。

所有测试项目（即实体机和虚拟机）都在 Fedora 20 （开 SELinux）上进行，并且测试过程中几乎没有运行的不相关的服务。这里列一下相关服务的版本：

- Kernel: 3.14.8
- For KVM: qemu-kvm 1.6.2
- For Xen: xen 4.3.2

根文件系统都是使用默认配置的 XFS。虚拟机使用 virt-manager 来创建（virt-mamager 也使用默认配置）。虚拟磁盘使用 raw 镜像，容量为 8GB，虚拟4颗 CPU。Xen 虚拟机使用 [PVHVM][5] 建立虚拟磁盘。

### 附加说明 ###

也许有人会考虑到 Fedora 是红帽公司所有，红帽一直在维护 KVM，而 Xen 则自从[在2009年红帽重新选择 KVM 作为虚拟化产品][6]后，再没得到这个公司的重要改进。我将这个因素排除在了测试所考虑的范围之外，不过仍然可以在心里稍微注意一下。

并且，资源竞争产生的影响也有被严格控制并最小化。在大多数虚拟服务器上，你可以跑多个虚拟机，而这些虚拟机会争用 CPU 时间片、磁盘 IO、网络带宽等等资源。在本测试中也不考虑这些因素。一台虚拟机抢到资源少，性能就差，而另一台抢得多，性能就好（LCTT译注：它们的性能总和，就可以大致当作是 KVM 或 Xen 的性能了）。

本测试运行在 Intel 的 CPU 上。如果使用的是 AMD 或 ARM，可能有些数据会不一样。

### 结果 ###

本测试使用裸机作为虚拟服务测试的基准设备。在不跑虚拟机的情况下，两台裸机的性能偏差不会大于0.51%

在几乎所有测试中，KVM 的性能相比宿主机而言下降了1.5%以内，只有两项测试例外。第一个是 7-zip 压缩，比宿主机慢了 2.79%。第二个就奇怪了，我们搭了一个邮件服务器，用 PostMark 测试其性能，结果表明 KVM 竟比宿主机快了4.11%。然后我在两台服务器中重新跑了几遍 PostMark 测试，结果性能差异基本不变，浮动都在最初测试结果的1%以内。由于我对 virtio 的内部机制没有很深的理解，我只能在以后再对这个怪现象进行进一步了解。

Xen 的性能相对宿主机而言差异就比较大了。有3项测试性能下降在2.5%以内，剩下的性能下降率都是 KVM 的2～4倍。PostMark 测试的性能比 KVM 慢了14.41%，这结果令我大吃一惊。重新跑了下测试，性能差还是几乎不变，浮动都在最初结果的2%以内。KVM 表现最好的 CPU 测试：MAFFT 对齐测试，是 Xen 表现倒数第二差的。

现在奉上一个简短得总结表：

<table id="tablepress-3" class="tablepress tablepress-id-3 dataTable">
<thead>
<tr class="row-1 odd" role="row"><th class="column-1 sorting" role="columnheader" tabindex="0" aria-controls="tablepress-3" rowspan="1" colspan="1" aria-label="&amp;nbsp;: activate to sort column ascending" style="width: 261px;"><div>&nbsp;</div></th><th class="column-2 sorting" role="columnheader" tabindex="0" aria-controls="tablepress-3" rowspan="1" colspan="1" aria-label="Best Value: activate to sort column ascending" style="width: 124px;"><div>Best Value</div></th><th class="column-3 sorting" role="columnheader" tabindex="0" aria-controls="tablepress-3" rowspan="1" colspan="1" aria-label="Bare Metal: activate to sort column ascending" style="width: 124px;"><div>Bare Metal</div></th><th class="column-4 sorting" role="columnheader" tabindex="0" aria-controls="tablepress-3" rowspan="1" colspan="1" aria-label="KVM: activate to sort column ascending" style="width: 85px;"><div>KVM</div></th><th class="column-5 sorting" role="columnheader" tabindex="0" aria-controls="tablepress-3" rowspan="1" colspan="1" aria-label="Xen: activate to sort column ascending" style="width: 66px;"><div>Xen</div></th></tr>
</thead>

<tbody class="row-hover" role="alert" aria-live="polite" aria-relevant="all"><tr class="row-2 even">
	<td class="column-1 ">C-Ray</td><td class="column-2 ">lower</td><td class="column-3 ">35.35</td><td class="column-4 ">35.66</td><td class="column-5 ">36.13</td>
</tr><tr class="row-3 odd">
	<td class="column-1 ">POV-Ray</td><td class="column-2 ">lower</td><td class="column-3 ">230.02</td><td class="column-4 ">232.44</td><td class="column-5 ">235.89</td>
</tr><tr class="row-4 even">
	<td class="column-1 ">Smallpt</td><td class="column-2 ">lower</td><td class="column-3 ">160</td><td class="column-4 ">162</td><td class="column-5 ">167.5</td>
</tr><tr class="row-5 odd">
	<td class="column-1 ">John the Ripper (Blowfish)</td><td class="column-2 ">higher</td><td class="column-3 ">3026</td><td class="column-4 ">2991.5</td><td class="column-5 ">2856</td>
</tr><tr class="row-6 even">
	<td class="column-1 ">John the Ripper (DES)</td><td class="column-2 ">higher</td><td class="column-3 ">7374833.5</td><td class="column-4 ">7271833.5</td><td class="column-5 ">6911167</td>
</tr><tr class="row-7 odd">
	<td class="column-1 ">John the Ripper (MD5)</td><td class="column-2 ">higher</td><td class="column-3 ">49548</td><td class="column-4 ">48899.5</td><td class="column-5 ">46653.5</td>
</tr><tr class="row-8 even">
	<td class="column-1 ">OpenSSL</td><td class="column-2 ">higher</td><td class="column-3 ">397.68</td><td class="column-4 ">393.95</td><td class="column-5 ">388.25</td>
</tr><tr class="row-9 odd">
	<td class="column-1 ">7-Zip</td><td class="column-2 ">higher</td><td class="column-3 ">12467.5</td><td class="column-4 ">12129.5</td><td class="column-5 ">11879</td>
</tr><tr class="row-10 even">
	<td class="column-1 ">Timed MAFFT Alignment</td><td class="column-2 ">lower</td><td class="column-3 ">7.78</td><td class="column-4 ">7.795</td><td class="column-5 ">8.42</td>
</tr><tr class="row-11 odd">
	<td class="column-1 ">CLOMP</td><td class="column-2 ">higher</td><td class="column-3 ">3.3</td><td class="column-4 ">3.285</td><td class="column-5 ">3.125</td>
</tr><tr class="row-12 even">
	<td class="column-1 ">PostMark</td><td class="column-2 ">higher</td><td class="column-3 ">3667</td><td class="column-4 ">3824</td><td class="column-5 ">3205</td>
</tr></tbody></table>

如果需要完整数据，请查看[Goole Docs 电子表格][7]。

### 结论 ###

基于上面的测试环境，KVM 的性能损耗几乎都在2％以内，Xen 则在十多项测试中有3项损耗在2.5％以内，而其他几项损耗都在5~7%之间。虽然 KVM 在 PostMark 测试中性能表现优异，但这是众多测试中仅有的一项 I/O 测试，如果想证明 KVM 确实在 I/O 处理方面很强悍，就需要更多测试。

对我来说，我想要深入了解一下 KVM 和 Xen 在 I/O 方面的处理，以及它们之间为什么会有这么大的差别。我也许还会跑一些有竞争的测试，来看看虚拟机在有压力的条件下是否真的能比宿主机表现得更出色。

我鼓励读者通过使用[Phoronix 测试套件][8]来进行一些基准测试，你们可以找到一些能模仿你们工作环境的用例。如果你的工作环境是低 CPU 高 I/O，你可以找找套件里面的 I/O 压力测试。另一方面，如果你的工作是音频、视频转码，你可以试试套件里面的 x264 或 mp3 测试。

更新：[Chris Behrens 指出][9]，我忘了提到 Xen 虚拟机类型了。这里补充下，我使用的是 PVHVM 模型（LCTT译注：目前支持的模型包括 PV、HVM 和 PVHVM），因为在 Xen 4.3 中这个选拥有最好的性能。另外需要注意的是在 Xen 4.4 中可以使用 PVH，但是在 Fedora 20 中还没有使用 Xen 4.4。

--------------------------------------------------------------------------------

via: http://major.io/2014/06/22/performance-benchmarks-kvm-vs-xen/

译者：[bazz2](https://github.com/bazz2) 校对：[ReiNoir](https://github.com/reinoir)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.phoronix.com/scan.php?page=article&item=intel_haswell_virtualization&num=1
[2]:http://blog.xen.org/index.php/2011/11/29/baremetal-vs-xen-vs-kvm-redux/
[3]:http://blog.xen.org/wp-content/uploads/2011/11/overview.png
[4]:http://ark.intel.com/products/52269/Intel-Xeon-Processor-E3-1220-8M-Cache-3_10-GHz?q=e3-1220
[5]:http://wiki.xen.org/wiki/Xen_Linux_PV_on_HVM_drivers
[6]:http://www.infoworld.com/d/virtualization/red-hat-releases-first-kvm-support-rhel-54-376
[7]:https://docs.google.com/spreadsheets/d/1kmudbOjCDUgfw76b8qP2GqNqF1ddlTOKyOjc0GmNOIE/edit?usp=sharing
[8]:http://www.phoronix-test-suite.com/
[9]:https://twitter.com/comstud/status/480785742730252288
