[#]: subject: "The First Commercial Unikernel With POSIX Support"
[#]: via: "https://www.opensourceforu.com/2022/06/the-first-commercial-unikernel-with-posix-support/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

The First Commercial Unikernel With POSIX Support
======
![operating system][1]

Lynx Software Technologies has released a unikernel that it claims is the first to be POSIX compatible for real-time operation and commercially available. LynxElement will be included in the MOSA.ic range of mission-critical embedded applications. To provide more security with third-party or open source software, Lynx prefers a unikernel approach over hypervisors or virtual machines. LynxElement is based on Lynx’s commercially proven LynxOS-178 real-time operating system, which allows for compatibility between the Unikernel and the standalone LynxOS-178 product. This enables designers to move applications between environments and is compliant with the POSIX API and US FACE specifications.

LynxElement initially focused on security on both Intel and Arm multicore processor architectures. Running security components such as virtual private networks is a common use case (VPNs). The unikernel, by utilising a one-way software ‘data diode’ and filter, can enable a customer to replace a Linux virtual machine, saving memory space and drastically reducing the attack surface while ensuring timing requirements and safety certifiability.

Unikernels are best suited for applications that require speed, agility, and a small attack surface in order to increase security and certifiability, such as aircraft systems, autonomous vehicles, and critical infrastructure. These run pre-built applications with their own libraries, reducing the attack surface caused by resource sharing. This also enables the secure use of containerised applications such as Kubernetes or Docker, which are increasingly moving from enterprise to embedded designs, owing to the need to support AI frameworks.

Unikernels are also an excellent choice for mission-critical systems with heterogeneous workloads that require the coexistence of RTOS, Linux, Unikernel, and bare-metal guest operating systems. Existing open source unikernel implementations, according to Lynx, haven’t fared well due to a lack of adequate functionality, a lack of a clear path to safety certification, and immature toolchains for debugging and producing images.

Lynx created the MOSA.ic software framework for developing and integrating complex multi-core safety- or security-critical systems. The framework includes built-in security for the unikernel, allowing for security and safety certification in mission-critical applications and making it enterprise-ready. With the assistance of DESE Research, Lynx created the safety-critical Unikernel solution. LynxElement is being evaluated by existing Lynx customers as well as additional organisations around the world, including naval, air force, and army organisations.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/06/the-first-commercial-unikernel-with-posix-support/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/06/operating-system-1.jpg
