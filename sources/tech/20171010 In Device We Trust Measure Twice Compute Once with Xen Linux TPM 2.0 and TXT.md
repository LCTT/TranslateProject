HankChow Translating

In Device We Trust: Measure Twice, Compute Once with Xen, Linux, TPM 2.0 and TXT
============================================================


![software integration](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/puzzle.jpg?itok=_B0M93-p "software integration")
Xen virtualization enables innovative applications to be economically integrated with measured, interoperable software components on general-purpose hardware.[Creative Commons Zero][1]Pixabay

Is it a small tablet or large phone? Is it a phone or broadcast sensor? Is it a server or virtual desktop cluster? Is x86 emulating ARM, or vice-versa? Is Linux inspiring Windows, or the other way around? Is it microcode or hardware? Is it firmware or software? Is it microkernel or hypervisor? Is it a security or quality update?  _Is anything in my device the same as yesterday? When we observe our evolving devices and their remote services, what can we question and measure?_ 

### General Purpose vs. Special Purpose Ecosystems

The general-purpose computer now lives in a menagerie of special-purpose devices and information appliances. Yet software and hardware components  _within_  devices are increasingly flexible, blurring category boundaries. With hardware virtualization on x86 and ARM platforms, the ecosystems of multiple operating systems can coexist on a single device. Can a modular and extensible multi-vendor architecture compete with the profitability of vertically integrated products from a single vendor?

Operating systems evolved alongside applications for lucrative markets. PC desktops were driven by business productivity and media creation. Web browsers abstracted OS differences, as software revenue shifted to e-commerce, services, and advertising. Mobile devices added sensors, radios and hardware decoders for content and communication. Apple, now the most profitable computer company, vertically integrates software and services with sensors and hardware. Other companies monetize data, increasing demand for memory and storage optimization.

Some markets require security or safety certifications: automotive, aviation, marine, cross domain, industrial control, finance, energy, medical, and embedded devices. As software "eats the world," how can we [modernize][5]vertical markets without the economies of scale seen in enterprise and consumer markets? One answer comes from device architectures based on hardware virtualization, Xen, [disaggregation][6], OpenEmbedded Linux and measured launch. [OpenXT][7] derivatives use this extensible, open-source base to enforce policy for specialized applications on general-purpose hardware, while reusing interoperable components.

[OpenEmbedded][8] Linux supports a range of x86 and ARM devices, while Xen isolates operating systems and [unikernels][9]. Applications and drivers from multiple ecosystems can run concurrently, expanding technical and licensing options. Special-purpose software can be securely composed with general-purpose software in isolated VMs, anchored by a hardware-assisted root of trust defined by customer and OEM policies. This architecture allows specialist software vendors to share platform and hardware support costs, while supporting emerging and legacy software ecosystems that have different rates of change.

### On the Shoulders of Hardware, Firmware and Software Developers

###  ![0eMLJYIX3yDSWwbPA-1nhpPwza2JM2m_zJ7Idh41](https://lh3.googleusercontent.com/0eMLJYIX3yDSWwbPA-1nhpPwza2JM2m_zJ7Idh417_NW8eESi2rbXHjsUnMURaXRxV8vekNB6EVV4dBheddUZDgjmk3VkKUOSDzY0aFnPf6-LFquwNzoUVZAKeTH5iBSDzWjCHQFx8dh7zdgyQ) 

 _System Architecture, from NIST SP800-193 (Draft), Platform Firmware Resiliency_ 

By the time a user-facing software application begins executing on a powered-on hardware device, an array of firmware and software is already running on the platform.  Special-purpose applications’ security and safety assertions are dependent on platform firmware and the developers of a computing device’s “root of trust.”

If we consider the cosmological “[Turtles All The Way Down][2]” question for a computing device, the root of trust is the lowest-level combination of hardware, firmware and software that is initially trusted to perform critical security functions and persist state. Hardware components used in roots of trust include the TCG's Trusted Platform Module ([TPM][10]), ARM’s [TrustZone][11]-enabled Trusted Execution Environment ([TEE][12]), Apple’s [Secure Enclave][13] co-processor ([SEP][14]), and Intel's Management Engine ([ME][15]) in x86 CPUs. [TPM 2.0][16]was approved as an ISO standard in 2015 and is widely available in 2017 devices.

TPMs enable key authentication, integrity measurement and remote attestation. TPM key generation uses a hardware random number generator, with private keys that never leave the chip. TPM integrity measurement functions ensure that sensitive data like private keys are only used by trusted code. When software is provisioned, its cryptographic hash is used to extend a chain of hashes in TPM Platform Configuration Registers (PCRs). When the device boots, sensitive data is only unsealed if measurements of running software can recreate the PCR hash chain that was present at the time of sealing. PCRs record the aggregate result of extending hashes, while the TPM Event Log records the hash chain.  

Measurements are calculated by hardware, firmware and software external to the TPM. There are Static (SRTM) and Dynamic (DRTM) Roots of Trust for Measurement. SRTM begins at device boot when the BIOS boot block measures BIOS before execution. The BIOS then execute, extending configuration and option ROM measurements into static PCRs 0-7\. TPM-aware boot loaders like TrustedGrub can extend a measurement chain from BIOS up to the [Linux kernel][17]. These software identity measurements enable relying parties to make trusted decisions within [specific workflows][18].

DRTM enables "late launch" of a trusted environment from an untrusted one at an arbitrary time, using Intel's Trusted Execution Technology ([TXT][19]) or AMD's Secure Virtual Machine ([SVM][20]). With Intel TXT, the CPU instruction SENTER resets CPUs to a known state, clears dynamic PCRs 17-22 and validates the Intel SINIT ACM binary to measure Intel’s tboot MLE, which can then measure Xen, Linux or other components. In 2008, Carnegie Mellon's [Flicker][21] used late launch to minimize the Trusted Computing Base (TCB) for isolated execution of sensitive code on AMD devices, during the interval between suspend/resume of untrusted Linux.  

If DRTM enables launch of a trusted Xen or Linux environment without reboot, is SRTM still needed? Yes, because [attacks][22] are possible via privileged System Management Mode (SMM) firmware, UEFI Boot/Runtime Services, Intel ME firmware, or Intel Active Management Technology (AMT) firmware. Measurements for these components can be extended into static PCRs, to ensure they have not been modified since provisioning. In 2015, Intel released documentation and reference code for an SMI Transfer Monitor ([STM][23]), which can isolate SMM firmware on VT-capable systems. As of September 2017, an OEM-supported STM is not yet available to improve the security of Intel TXT.

Can customers secure devices while retaining control over firmware?  UEFI Secure Boot requires a signed boot loader, but customers can define root certificates. Intel [Boot Guard][24] provides OEMs with validation of the BIOS boot block.  _Verified Boot_  requires a signed boot block and the OEM's root certificate is fused into the CPU to restrict firmware.  _Measured Boot_  extends the boot block hash into a TPM PCR, where it can be used for measured launch of customer-selected firmware. Sadly, no OEM has yet shipped devices which implement ONLY the Measured Boot option of Boot Guard.

### Measured Launch with Xen on General Purpose Devices

[OpenXT 7.0][25] has entered release candidate status, with support for Kaby Lake devices, TPM 2.0, OE [meta-measured][3], and [forward seal][26] (upgrade with pre-computed PCRs).  

[OpenXT 6.0][27] on a Dell T20 Haswell Xeon microserver, after adding a SATA controller, low-power AMD GPU and dual-port Broadcom NIC, can be configured with measured launch of Windows 7 GPU p/t, FreeNAS 9.3 SATA p/t, pfSense 2.3.4, Debian Wheezy, OpenBSD 6.0, and three NICs, one per passthrough driver VM.

Does this demonstrate a storage device, build server, firewall, middlebox, desktop, or all of the above? With architectures similar to [Qubes][28] and [OpenXT][29] derivatives, we can combine specialized applications with best-of-breed software from multiple ecosystems. A strength of one operating system can address the weakness of another.

### Measurement and Complexity in Software Supply Chains

While ransomware trumpets cryptocurrency demands to shocked users, low-level malware often emulates Sherlock Holmes: the user sees no one. Malware authors modify code behavior in response to “our method of questioning”, simulating heisenbugs. As system architects pile abstractions, [self-similarity][30] appears as hardware, microcode, emulator, firmware, microkernel, hypervisor, operating system, virtual machine, namespace, nesting, runtime, and compiler expand onto neighboring territory. There are no silver bullets to neutralize these threats, but cryptographic measurement of source code and stateless components enables whitelisting and policy enforcement in multi-vendor supply chains.

Even for special-purpose devices, the user experience bar is defined by mass-market computing. Meanwhile, Moore’s Law is ending, ARM remains fragmented, x86 PC volume is flat, new co-processors and APIs multiply, threats mutate and demand for security expertise outpaces the talent pool. In vertical markets which need usable, securable and affordable special-purpose devices, Xen virtualization enables innovative applications to be economically integrated with measured, interoperable software components on general-purpose hardware. OpenXT is an open-source showcase for this scalable ecosystem. Further work is planned on reference architectures for measured disaggregation with Xen and OpenEmbedded Linux.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog//event/elce/2017/10/device-we-trust-measure-twice-compute-once-xen-linux-tpm-20-and-txt

作者：[RICH PERSAUD][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/rpersaud
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://en.wikipedia.org/wiki/Turtles_all_the_way_down
[3]:https://layers.openembedded.org/layerindex/branch/master/layer/meta-measured/
[4]:https://www.linux.com/files/images/puzzlejpg
[5]:http://mailchi.mp/iotpodcast/stacey-on-iot-if-ge-cant-master-industrial-iot-who-can
[6]:https://www.xenproject.org/directory/directory/research/45-breaking-up-is-hard-to-do-security-and-functionality-in-a-commodity-hypervisor.html
[7]:http://openxt.org/
[8]:https://wiki.xenproject.org/wiki/Category:OpenEmbedded
[9]:https://wiki.xenproject.org/wiki/Unikernels
[10]:http://www.cs.unh.edu/~it666/reading_list/Hardware/tpm_fundamentals.pdf
[11]:https://developer.arm.com/technologies/trustzone
[12]:https://www.arm.com/products/processors/technologies/trustzone/tee-smc.php
[13]:http://mista.nu/research/sep-paper.pdf
[14]:https://www.blackhat.com/docs/us-16/materials/us-16-Mandt-Demystifying-The-Secure-Enclave-Processor.pdf
[15]:https://link.springer.com/book/10.1007/978-1-4302-6572-6
[16]:https://fosdem.org/2017/schedule/event/tpm2/attachments/slides/1517/export/events/attachments/tpm2/slides/1517/FOSDEM___TPM2_0_practical_usage.pdf
[17]:https://mjg59.dreamwidth.org/48897.html
[18]:https://docs.microsoft.com/en-us/windows/threat-protection/secure-the-windows-10-boot-process
[19]:https://www.intel.com/content/www/us/en/software-developers/intel-txt-software-development-guide.html
[20]:http://support.amd.com/TechDocs/24593.pdf
[21]:https://www.cs.unc.edu/~reiter/papers/2008/EuroSys.pdf
[22]:http://invisiblethingslab.com/resources/bh09dc/Attacking%20Intel%20TXT%20-%20paper.pdf
[23]:https://firmware.intel.com/content/smi-transfer-monitor-stm
[24]:https://software.intel.com/en-us/blogs/2015/02/20/tricky-world-securing-firmware
[25]:https://openxt.atlassian.net/wiki/spaces/OD/pages/96567309/OpenXT+7.x+Builds
[26]:https://openxt.atlassian.net/wiki/spaces/DC/pages/81035265/Measured+Launch
[27]:https://openxt.atlassian.net/wiki/spaces/OD/pages/96436271/OpenXT+6.x+Builds
[28]:http://qubes-os.org/
[29]:http://openxt.org/
[30]:https://en.m.wikipedia.org/wiki/Self-similarity
