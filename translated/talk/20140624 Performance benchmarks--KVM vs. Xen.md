Performance benchmarks: KVM vs. Xen
KVM和Xen的性能基准测试
================================================================================
After having some interesting discussions last week around KVM and Xen performance improvements over the past years, I decided to do a little research on my own. The last complete set of benchmarks I could find were from the [Phoronix Haswell tests in 2013][1]. There were [some other benchmarks from 2011][2] but those were hotly debated due to the Xen patches headed into kernel 3.0.
在上周，我们讨论了 KVM 和 Xen 的性能上一些令人感兴趣的话题后，我打算自己做一些这方面的研究。我能找到的最新的资料，是来自[2013年 Phoronix Haswell 性能评测][1]上的基准测试。当然，还有[2011年的评测][2]，由于 Xen 已经被收录进 Kernel 3.0，这些曾经都是热门话题。

The 2011 tests had a [good list of benchmarks][3] and I’ve done my best to replicate that list here three years later. I’ve removed two or three of the benchmark tests because they didn’t run well without extra configuration or they took an extremely long time to run.
2011年的测试提供了[许多很好的基准报表][3]，我尽最大努力把它们列出的属性重新测试一遍，但少测了两三个基准测试，原因是它们在未经特定优化的配置后跑出来的数据不是很好，或者它们需要跑很长时间才能得到结果。

### 测试环境 ###

My testing setup consists of two identical SuperMicro servers. Both have a single [Intel Xeon E3-1220][4] (four cores, 3.10GHz), 24GB Kingston DDR3 RAM, and four Western Digital RE-3 160GB drives in a RAID 10 array. BIOS versions are identical.
测试环境由两台一模一样的超微服务器组成，都配备一颗[Intel 至强 E3-1220][4]（4核，3.10GHz），24G 金士顿 DDR3 内存，4块西数 RE-3 160G 磁盘（组成 RAID10 阵列）。另外 BIOS 也是一模一样。

All of the tests were run in Fedora 20 (with SELinux enabled) for the hosts and the virtual machines. Very few services were left running during the tests. Here are the relevant software versions:
所有测试项目（即实体机和虚拟机）都在 Fedora 20 （开 SELinux）上进行，并且测试过程中没有跑很多的不相关的服务。这里列一下相关服务的版本：

- Kernel: 3.14.8
- For KVM: qemu-kvm 1.6.2
- For Xen: xen 4.3.2

All root filesystems are XFS with the default configuration. Virtual machines were created using virt-manager using the default configuration available for KVM and Xen. Virtual disks used raw images and were allotted 8GB RAM with 4 virtual CPU’s. Xen guests used [PVHVM][5].
根文件系统是 XFS，使用默认配置。虚拟机使用 virt-manager 来创建（virt-mamager 也使用默认配置）。虚拟磁盘使用 raw 镜像，容量为 8GB，虚拟4颗 CPU。Xen 虚拟机使用 [PVHVM][5] 建立虚拟磁盘。

### Caveats ###
### 警告 ###

One might argue that Fedora’s parent owner, Red Hat, puts a significant amount of effort into maintaining and improving KVM within their distribution. Red Hat hasn’t made significant contributions to Xen in years and they [made the switch to KVM back in 2009][6]. I’ve left this out of scope for these tests, but it’s still something worth considering.
也许有人会争辩说 Fedora 是红帽公司所有，红帽一直在维护 KVM，而 Xen 则自从[在2009年红帽重新选择 KVM 作为虚拟化产品][6]后，再没得到这个公司的维护。在本测试中这个因素不会对结果产生任何影响，不过可以在心里稍微注意一下。

Also, contention was tightly controlled and minimized. On most virtualized servers, you’re going to have multiple virtual machines fighting for CPU time, disk I/O, and access to the network. These tests didn’t take that type of activity into consideration. One hypervisor might have poor performance at low contention but then perform much better than its competitors when contention for resources is high.
不考虑资源竞争产生的影响。在大多数虚拟服务器上，你可以跑多个虚拟机，而这些虚拟机会争用 CPU 时间片、磁盘 IO、网络带宽等等资源。在本测试中也不考虑这些因素。一台虚拟机抢到资源少，性能就差，而另一台抢得多，性能就好（LCTT：它们的性能总和，就可以大致当作是 KVM 或 Xen 的性能了）。

本测试运行在 Intel 的 CPU 上。如果使用的是 AMD 或 ARM，可能有些数据会不一样。

### Results ###
### 结果 ###

The tests against the bare metal servers served as a baseline for the virtual machine tests. The deviation in performance between the two servers without virtualization was at 0.51% or less.
本测试使用裸机作为虚拟服务测试的基准设备。在不跑虚拟机的情况下，两台裸机的性能偏差不会大于0.51%

KVM’s performance fell within 1.5% of bare metal in almost all tests. Only two tests fell outside that variance. One of those tests was the 7-Zip test where KVM was 2.79% slower than bare metal. Oddly enough, KVM was 4.11% faster than bare metal with the PostMark test (which simulates a really busy mail server). I re-ran the PostMark tests again on both servers and those results fell within 1% of my original test results. I’ll be digging into this a bit more as my knowledge of virtio’s internals isn’t terribly deep.

Xen’s performance varied more from bare metal than KVM. Three tests came within 2.5% of bare metal speeds but the remainder were anywhere from 2-4x slower than KVM. The PostMark test was 14.41% slower in KVM than bare metal and I found that result surprising. I re-ran the test and the results during the second run were within 2% of my original results. KVM’s best performing CPU test, the MAFFT alignment, was Xen’s second worst.

I’ve provided a short summary table here with the final results:

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

If you’d like to see the full data, feel free to review the [spreadsheet on Google Docs][7].

### Conclusion ###

Based on this testing environment, KVM is almost always within 2% of bare metal performance. Xen fell within 2.5% of bare metal performance in three out of ten tests but often had a variance of up to 5-7%. Although KVM performed much better with the PostMark test, there was only one I/O test run in this group of tests and more testing is required before a clear winner in disk I/O could be found.

As for me, I’d like to look deeper into how KVM and Xen handle disk I/O and why their results were so different. I may also run some tests under contention to see if one hypervisor can deal with that stress with better performance.

I’d encourage readers to review the list of benchmark tests available in the [Phoronix test suite][8] and find some that emulate portions of their normal workloads. If your workloads are low CPU and high I/O in nature, look for some of the I/O stress tests in the suite. On the other hand, if you do a lot of audio/video transcoding, try some of the x264 or mp3 tests within the suite.

UPDATE: [Chris Behrens pointed out][9] that I neglected to mention the type of virtual machine I tested with Xen. I used PVHVM for the tests as it’s the fastest performing option for Linux guests on Xen 4.3. Keep in mind that PVH is available in Xen 4.4 but that version of Xen isn’t available in Fedora 20 at this time.

--------------------------------------------------------------------------------

via: http://major.io/2014/06/22/performance-benchmarks-kvm-vs-xen/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

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
