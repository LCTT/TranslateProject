[#]: subject: "Kubernetes To Soon Support Confidential Computing"
[#]: via: "https://www.opensourceforu.com/2022/09/kubernetes-to-soon-support-confidential-computing/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Kubernetes To Soon Support Confidential Computing
======
*Constellation is the first kubernetes to be always-encrypted (K8S). This refers to a K8S in which all of your workloads and control plane are completely shielded and you can remotely confirm this using cryptographic certificates.*

Using secret computing and confidential VMs, the Constellation Kubernetes engine isolates Kubernetes clusters from the rest of the cloud architecture. As a result, data is always encrypted, both at rest and in memory, and a confidential context is created. Since it adds security and secrecy to data and workflows operating on the public cloud, confidential computing, according to Edgeless Systems, the company that created Constellation, is the future of cloud computing.

Kubernetes nodes run inside private virtual machines using Constellation. According to Edgeless Systems, confidential machines are an evolution of secure enclaves that extend the three principles of confidential computing—runtime encryption, isolation, and remote attestation—across the entire virtual system. The underlying hardware’s particular support for private computing, such as AMD Secure Encrypted Virtualization (AEM), SEV-Secure Nested Paging (SEV-SNP), and Intel Trust Domain Extensions, is used by confidential VMs (TDX). Additionally, ARM revealed its new V9 architecture, known as Realms, last year. This design includes private VM features.

Constellation attempts to offer attestation, or verification via cryptographic certificates, in addition to “always-on” encryption, at the cluster level. Fedora CoreOS, which is built on an immutable file system and is geared for containers, is used by Confidential VMS in Constellation. Constellation also makes use of Sigstore to protect the DevOps chain of trust.

Performance may be a worry while using secret computing. Yes, encryption affects performance, but a joint benchmark by AMD and Microsoft found that this only results in a tiny performance hit of between 2% and 8%. Edgeless Systems claims that Constellation will perform similarly for heavy workloads.

Given that Constellation is CNCF-certified and interoperable with all major clouds, including GCP and Azure, this should guarantee its interoperability with other Kubernetes workloads and tools.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/kubernetes-to-soon-support-confidential-computing/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
