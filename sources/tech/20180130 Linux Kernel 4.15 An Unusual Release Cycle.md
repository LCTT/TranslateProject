Translating by qhwdw
Linux Kernel 4.15: 'An Unusual Release Cycle'
============================================================


![Linux](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/background-penguin.png?itok=g8NBQs24 "Linux")
Linus Torvalds released version 4.15 of the Linux Kernel on Sunday, a week later than originally scheduled. Learn about key updates in this latest release.[Creative Commons Zero][1]Pixabay

Linus Torvalds [released version 4.15 of the Linux Kernel][7] on Sunday, again, and for a second version in a row, a week later than scheduled. The culprits for the late release were the Meltdown and Spectre bugs, as these two vulnerabilities forced developers to submit major patches well into what should have been the last cycle. Torvalds was not comfortable rushing the release, so he gave it another week.

Unsurprisingly, the first big bunch of patches worth mentioning were those designed to sidestep [Meltdown and Spectre][8]. To avoid Meltdown, a problem that affects Intel chips, [developers have implemented  _Page Table Isolation_  (PTI)][9] for the x86 architecture. If for any reason you want to turn this off, you can use the `pti=off` kernel boot option.

Spectre v2 affects both Intel and AMD chips and, to avoid it, [the kernel now comes with the  _retpoline_  mechanism][10]. Retpoline requires a version of GCC that supports the `-mindirect-branch=thunk-extern` functionality. As with PTI, the Spectre-inhibiting mechanism can be turned of. To do so, use the `spectre_v2=off` option at boot time. Although developers are working to address Spectre v1, at the moment of writing there is still not a solution, so there is no patch for this bug in 4.15.

The solution for Meltdown on ARM has also been pushed to the next development cycle, but there is [a remedy for the bug on PowerPC with the  _RFI flush of L1-D cache_ feature][11] included in this release.

An interesting side affect of all of the above is that new kernels now come with a  _/sys/devices/system/cpu/vulnerabilities/_  virtual directory. This directory shows the vulnerabilities affecting your CPU and the remedies being currently applied.

The issues with buggy chips (and the manufacturers that keep things like this secret) has revived the call for the development of viable open source alternatives. This brings us to the partial support for [RISC-V][12] chips that has now been merged into the mainline kernel. RISC-V is an open instruction set architecture that allows manufacturers to create their own implementation of RISC-V chips, and it has resulted in several open sourced chips. While RISC-V chips are currently used mainly in embedded devices, powering things like smart hard disks or Arduino-like development boards, RISC-V proponents argue that the architecture is also well-suited for use on personal computers and even in multi-node supercomputers.

[The support for RISC-V][13], as mentioned above, is still incomplete, and includes the architecture code but no device drivers. This means that, although a Linux kernel will run on RISC-V, there is no significant way to actually interact with the underlying hardware. That said, RISC-V is not vulnerable to any of the bugs that have dogged other closed architectures, and development for its support is progressing at a brisk pace, as [the RISC-V Foundation has the support of some of the industries biggest heavyweights][14].

### Other stuff that's new in kernel 4.15

Torvalds has often declared he likes things boring. Fortunately for him, he says, apart from the Spectre and Meltdown messes, most of the other things that happened in 4.15 were very much run of the mill, such as incremental improvements for drivers, support for new devices, and so on. However, there were a few more things worth pointing out:

*   [AMD got support for Secure Encrypted Virtualization][3]. This allows the kernel to fence off the memory a virtual machine is using by encrypting it. The encrypted memory can only be decrypted by the virtual machine that is using it. Not even the hypervisor can see inside it. This means that data being worked on by VMs in the cloud, for example, is safe from being spied on by any other process outside the VM.

*   AMD GPUs get a substantial boost thanks to [the inclusion of  _display code_][4] . This gives mainline support to Radeon RX Vega and Raven Ridge cards and also implements HDMI/DP audio for AMD cards.

*   Raspberry Pi aficionados will be glad to know that [the 7'' touchscreen is now natively supported][5], which is guaranteed to lead to hundreds of fun projects.

To find out more, you can check out the write-ups at [Kernel Newbies][15] and [Phoronix][16].

 _Learn more about Linux through the free ["Introduction to Linux" ][6]course from The Linux Foundation and edX._

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/intro-to-linux/2018/1/linux-kernel-415-unusual-release-cycle

作者：[PAUL BROWN ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/background-penguinpng
[3]:https://git.kernel.org/linus/33e63acc119d15c2fac3e3775f32d1ce7a01021b
[4]:https://git.kernel.org/torvalds/c/f6705bf959efac87bca76d40050d342f1d212587
[5]:https://git.kernel.org/linus/2f733d6194bd58b26b705698f96b0f0bd9225369
[6]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[7]:https://lkml.org/lkml/2018/1/28/173
[8]:https://meltdownattack.com/
[9]:https://git.kernel.org/linus/5aa90a84589282b87666f92b6c3c917c8080a9bf
[10]:https://git.kernel.org/linus/76b043848fd22dbf7f8bf3a1452f8c70d557b860
[11]:https://git.kernel.org/linus/aa8a5e0062ac940f7659394f4817c948dc8c0667
[12]:https://riscv.org/
[13]:https://git.kernel.org/torvalds/c/b293fca43be544483b6488d33ad4b3ed55881064
[14]:https://riscv.org/membership/
[15]:https://kernelnewbies.org/Linux_4.15
[16]:https://www.phoronix.com/scan.php?page=search&q=Linux+4.15
