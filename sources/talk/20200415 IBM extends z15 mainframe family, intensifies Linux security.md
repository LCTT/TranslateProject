[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (IBM extends z15 mainframe family, intensifies Linux security)
[#]: via: (https://www.networkworld.com/article/3537678/ibm-extends-z15-mainframe-family-intensifies-linux-security.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

IBM extends z15 mainframe family, intensifies Linux security
======
IBM continued to reshape the mainframe with an eye toward further integrating it within hybrid clouds and further securing Linux-based workloads.
Kali Linux / nevarpp / Getty Images

IBM continued to reshape the [mainframe][1] with an eye toward further integrating it within hybrid clouds and securing [Linux][2]-based workloads.

On the hardware side, IBM rolled out two entry-level, 19” single-frame, air-cooled platforms, the  [z15 Model T02][3] and [LinuxONE III Model LT2][4]. The new machines are extensions of the IBM z15 family that [Big Blue rolled out in September][5] of last year. 

Both can fit in cloud [data-center][6] racks and can be outfitted with a second drawer, should customers need to grow capacity.  Both feature 65 cores using commercial processors running at 4.5GHz and can be configured to support all manner of workloads. 

[[Get regularly scheduled insights by signing up for Network World newsletters.]][7]

IBM said new machines support z/OS Container Extensions that enable access to an ecosystem of open-source and Linux-on-IBM Z applications that may be deployed within the native z/OS environment without requiring a separate Linux server, using Docker container skills and patterns. In addition customers can use the latest open-source tools, popular NoSQL databases, analytics frameworks and application servers, IBM said.

The LinuxONE Model LT2 can run a number of Linux systems including [Red Hat Enterprise Linux][8], SUSE and Ubuntu, alone or side by side with IBM z/VM environments on a single physical server. The IBM LinuxONE server can run Linux workloads independently on a single server.

Both systems support IBM’s prepackaged Cloud Paks, which include a secured Kubernetes container and containerized IBM middleware designed to let customers quickly spin-up enterprise-ready containers, the company said. IBM has standard Cloud Paks for data, application, integration, automation and multicloud management and security. The idea is to help customers develop, deploy, and manage cloud-native applications for the z15 family, IBM stated.

Security and privacy features are key for the z15 and those have been extended with the introduction of IBM Secure Execution for Linux for the all z15 models.  In a [blog post][9] about the security extensions, IBM stated that at its core, a Secure Execution provides a KVM-based virtual machine that is fully isolated and protected from the hypervisor with encryption keys that only the IBM Z hardware and firmware have access to.

[][10]

“In practice, an encrypted Linux image is created using the host public key and a customer-specific key. Since the encryption keys are stored on the IBM Z hardware and firmware, the encrypted image can only be executed in a virtual machine on the host(s) it has been prepared for, and the image can’t be decrypted or tampered with outside of the designated host(s). In addition, your unencrypted virtual machine memory cannot be accessed by the host operating system either,” IBM stated. “Applications are then run inside of that virtual machine, allowing the owner of the application to focus on just disk and network data encryption, both of which can be easily handled in userland.”

In an environment where [customers are running Kubernetes][11] across servers running on x86 and Linux on Z systems, you can deploy the Secure Execution containers specifically for the applications you want to have protected, like sensitive databases and blockchain services. In this model, Kubernetes still manages the orchestration of containers, both on x86 and IBM Z, but it has no access to the data inside the Secure Execution environment container, IBM stated. 

With Secure Execution IBM is trying to mitigate insider threats to enterprise data.

From 2016 to 2019, the average number of incidents involving employee or contractor negligence has increased from 10.5 to 14.5–and the average number of credential theft incidents per company has tripled over the past three years, from 1.0 to 3.2, According to the [Ponemon Institute’s 2020 Cost of an Insider Breach Report][12], IBM stated.  “IBM Secure Execution for Linux helps to mitigate these concerns by enabling clients to isolate large numbers of workloads with granularity and at scale, within a trusted execution environment.”

The z15 family already supports what IBM calls [Data Privacy Passports][13] that promise to let customers control privacy and security by defining how all data is accessed, stored and shared. The idea is to let customers  protect and provision data and revoke access to that data at any time, not only within the z15 environment but across an enterprise's hybrid [multicloud][14] environment, IBM stated. 

The new systems and software are expected to be available by mid-May.  z15 T02 pricing starts at $160,000 but each machine is built to order so prices vary.

Join the Network World communities on [Facebook][15] and [LinkedIn][16] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3537678/ibm-extends-z15-mainframe-family-intensifies-linux-security.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3446140/enterprises-find-a-new-use-for-mainframes-blockchain-and-containerized-apps.html
[2]: https://www.networkworld.com/article/3215226/what-is-linux-uses-featres-products-operating-systems.html
[3]: https://www-01.ibm.com/common/ssi/cgi-bin/ssialias?infotype=AN&subtype=CA&htmlfid=897/ENUS120-006&appname=USN
[4]: https://www-01.ibm.com/common/ssi/cgi-bin/ssialias?infotype=AN&subtype=CA&htmlfid=897/ENUS120-014&appname=USN
[5]: https://www.networkworld.com/article/3438542/ibm-z15-mainframe-amps-up-cloud-security-features.html
[6]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[7]: https://www.networkworld.com/newsletters/signup.html
[8]: https://www.redhat.com/en/blog/enterprise-linux-all-architectures-bringing-red-hat-enterprise-linux-ibm-z15-and-linuxone-iii-single-frame-systems?sc_cid=701f2000000txokAAA&utm_source=bambu&utm_medium=social&utm_campaign=Partner
[9]: https://developer.ibm.com/blogs/inside-the-new-ibm-z15-t02-and-linuxone-iii-lt2/
[10]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[11]: https://www.networkworld.com/article/3536654/ibm-taps-new-leaders-for-hybrid-cloud-battles-ahead.html
[12]: https://www.ibm.com/downloads/cas/LQZ4RONE
[13]: https://developer.ibm.com/blogs/data-privacy-passports-for-developers/
[14]: https://www.networkworld.com/article/3429258/real-world-tools-for-multi-cloud-management.html
[15]: https://www.facebook.com/NetworkWorld/
[16]: https://www.linkedin.com/company/network-world
