Intel Haswell Linux Virtualization: KVM vs. Xen vs. VirtualBox
==============================================================

The latest chapter to our lengthy [Intel Haswell][1] on [Linux saga][2] is virtualization benchmarks. From Fedora 19 with the very latest software components for Linux virtualization, the performance of KVM, Xen, and VirtualBox were benchmarked from the Intel Core i7 4770K "Haswell" CPU.

Since last month's Haswell launch we have published many benchmarks of the new Intel CPUs but not being covered at Phoronix until today is the Linux virtualization performance for Haswell. With Intel hardware virtualization enabled, KVM, Xen, and VirtualBox were compared from a clean Fedora 19 64-bit installation.

Fedora 19 presently has the Linux 3.9.8 kernel with GCC 4.8.1, Mesa 9.2.0-devel, and an EXT4 file-system. All of the virtualization components were obtained from the Fedora 19 repository, including QEMU 1.4.2, Xen 4.2.2, and the libvirt / virt-manager components. Xen and KVM virtualization were setup through virt-manager. VirtualBox 4.2.16 was obtained from VirtualBox.org and installed on Fedora 19.

![](http://www.phoronix.net/image.php?id=intel_haswell_virtualization&image=intel_haswell_virtualization_med)

The Intel Core i7 4770K system had 16GB of RAM and a 240GB OCZ Vertex 3 SSD. During testing, each VM had access to all eight logical cores (four physical cores + Hyper Threading), access to 12GB of the system's 16GB of RAM, and a 16GB virtual disk.

The KVM, Xen, and VirtualBox performance from Fedora 19 Linux 3.9 with the Intel Core i7 "Haswell" processor were also compared to the "bare metal" results when the benchmarks were running on the host without any form of virtualization or other means of abstraction. VMware's products weren't benchmarked in this article since their EULA restricts public benchmarking (though VMware has been okay with us running such benchmarks in the past) and their trial software being limited to running on four CPU cores, but a separate article will look at the Xen/KVM/VMware performance on other hardware in the future.

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=9083341&p=2)

All of this Linux virtualization benchmarking was handled in a fully automated and reproducible manner using the open-source [Phoronix Test Suite][3] software and hosting by [OpenBenchmarking.org][4]. With using a virtual disk and with Xen/KVM not having a reliable means of shared 3D access to the host's driver/GPU, most of the benchmarks within this article are computational focused to look at the performance overhead for the different Linux virtualization methods.

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=16f6601&p=2)

Disk benchmarking wasn't a main focus of this virtualization testing since only a virtual disk was being used on the host's file-system. However, when comparing these three Linux virtualization methods against the bare metal results, KVM on the Linux 3.9 kernel was performing the best followed by Xen. Oracle's VirtualBox was running just 66% the speed of the host's PostMark mail server performance while KVM was at 96% the performance and Xen at 83% the host's speed.

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=ee1f01f&p=2)

For the Dolfyn Computational Fluid Dynamics workload, there aren’t any major changes in performance against the bare metal results when running on KVM or Xen. However, VirtualBox is noticeably slower.

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=1a54755&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=b3c948c&p=2)


The FFTE and HMMer results were similar to Dolfyn where Xen and KVM were leading to great performance results with very little overhead, but Oracle VM VirtualBox was much slower.

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=78137b2&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=0a735b7&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=8d2ce17&p=2)

John The Ripper was crashing when being run under VirtualBox.

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=6bd26cc&p=2)

Xen virtualization on the Linux 3.9 kernel with Fedora 19 strikes its first performance win when running the TTSIOD renderer.

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=4a440fd&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=79113d7&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=505359a&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=1593a32&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=0f84676&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=3cde78a&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=fc3d96e&p=2)

![](http://openbenchmarking.org/embed.php?i=1307064-SO-VIRTFEDOR07&sha=3e91cb0&p=2)

Overall, Xen and KVM virtualization worked out great on Fedora 19 in conjunction with the Intel Core i7 4770K CPU. The performance overhead of these virtualization methods were minimal on the Haswell processor. While Xen and KVM were running great on the new Intel CPU, Oracle's VirtualBox (the latest release, v4.2.16) was much slower than Xen and KVM. The benefit VirtualBox has though is means of guest 3D acceleration, which will be benchmarked again in a future Phoronix article. Also to be benchmarked soon on Phoronix will be the relative overhead of the different virtualization methods when comparing Haswell to previous generations of Intel processors as well as AMD's competition.

--------------------------------------------------------------------------------

via: http://www.phoronix.com/scan.php?page=article&item=intel_haswell_virtualization

译者：[译者ID](http://blog.csdn.net/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.phoronix.com/scan.php?page=search&q=Haswell
[2]:http://www.phoronix.com/scan.php?page=news_item&px=MTM5MzU
[3]:http://www.phoronix-test-suite.com/
[4]:http://openbenchmarking.org/

