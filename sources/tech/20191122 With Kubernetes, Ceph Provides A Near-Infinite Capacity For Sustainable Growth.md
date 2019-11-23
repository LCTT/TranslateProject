[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (With Kubernetes, Ceph Provides A Near-Infinite Capacity For Sustainable Growth)
[#]: via: (https://www.linux.com/articles/with-kubernetes-ceph-provides-a-near-infinite-capacity-for-sustainable-growth-2/)
[#]: author: (TC CURRIE https://www.linux.com/author/tc_currie/)

With Kubernetes, Ceph Provides A Near-Infinite Capacity For Sustainable Growth
======

[![][1]][2]

Ceph is a modern data storage platform, working across a variety of hardware and technologies used for cataloging, aggregating, and analyzing data.

What sets Ceph apart is that it is a true software-defined, data storage system that delivers massive scalability in a self-healing and self-managing platform, said Pete Brey, Principal Product Marketing Manager at [Red Hat][3].

Kubernetes, an orchestration tool focused on running microservices applications in containers, works hand-in-hand with Ceph as core components of a scalable approach to infrastructure as companies move from client/server architecture to more modern technology, he said.

“Like the network world, we are facing a multifaceted set of challenges in the evolving and accelerating digital world. A deluge of data is rolling into the servers, necessitating a high degree of scalability. At the same time losing data is losing business, so we require excellent resilience of the data, and a great uptime record to boot,” said Boris Renski, co-founder and CMO of [Mirantis][4].

### A quick intro of Ceph

[Ceph][5] started in 2004 as a graduate thesis for Sage Weil at the University of California at Santa Cruz. Weil set out to solve the problem of how to store and scale objects from object-oriented programming at the enterprise level. And the explosion of data in both structured and unstructured forms require different infrastructure and data access methods, and Ceph supports them all.

“Ceph, an open source SDS, was developed for these specific requirements, but its most useful feature is a chameleon-like capability of providing any storage protocol you may need without the need to pre-allocate storage. Block storage, object storage (S3, Swift), file storage with various protocols (NFS, SMB, CephFS) can all share the same Ceph backend and storage capacity. The only capacity metric that matters for scaleout is the total amount of storage used in the cluster,” said Renski.

Linux Torvalds folded Ceph into the Linux kernel in 2010. In 2014, RedHat stepped in to maintain the open source project. A year later, the [Ceph Community Advisory Board ][6]was formed, including members from global IT organizations.

Its most recent version, _Nautilus_ (v14.2.0) was released on March 19, 2019.

Ceph sits on top of physical data storage and stores objects. It simplifies tasks, said Bray, like inserting data into file systems and databases that were not built to address objects. And, it scales.

The Ceph cluster is built on the concept that a static map is used to indicate the appropriate location of storage objects. Every component of the cluster, including the block storage clients and file- and object-gateways has a copy of the cluster map, so a client can directly access the OSD that contains the piece of data needed for the operation. “This eliminates the requirement for gateways, which in scale-out environments are always problematic and can lead to severe bottlenecks,” said Renski.

Behind the simple RestAPI-backed interface, the [Ceph Reliable Autonomic Distributed Object Store ][7](RADOS) is the core of the program providing block storage capabilities including snapshots and replication. And it runs on standard industry components, in containers, and in Kubernetes.

### Significance of Ceph

Ceph’s main advantages are scalability to billions of objects and hundreds of petabytes, the capability to self-manage the system for everyday storage operations like cluster expansion and hardware failure, security through [SELinux][8], and malleability, said Bray. It also comes with a well-established community of contributors and users across the globe.

It can provide a full range of storage services to satisfy the diverse needs of different applications, including“stateless” apps that are often part of application architecture, Brey said. “Ceph gives developers options to match the interface to the application.”

Other advantages of Ceph, said [Jason Van der Schyff][9], COO of [SoftIron][10], include the ability to run on standard x86 hardware, the ability to create multiple copies or erasure coding, which reduces the need for additional data protection methodologies like RAID, and the ability to serve multiple storage protocols from a single storage platform.

The key to its success is the ability to allow companies to move from the traditional file workloads and storage solutions of client/server architecture to modern object workloads at their own pace.

### What problems Kubernetes solves

Ceph is an excellent fit for Kubernetes and Cloud-Native Storage, said Bray, because it was designed from the ground up to support software-defined, scale-out storage. Ceph also supports S3 protocol, which is required for modern Cloud-Native apps.

“Having the optimum amount of compute infrastructure for dynamically changing workloads, during high demand and low, is not only one of the most difficult tasks to achieve, but also to maintain. Kubernetes empowers exactly this behavior, and so much more,” said Charles Ruffino, Director of [Solutions Architecture at SoftIron][11].

Gone are the days of nervously monitoring a monolithic infrastructure used to provide a single service to your users or customers. “With Kubernetes, an administrator is empowered to confidently deliver a large number of resilient services, no longer encumbered by the worry of overloaded infrastructure or system failure,” Ruffino added.

Ceph can also provide persistent and stateful storage and data management services to containerized applications running in [Kubernetes][12].

### How Ceph fits into the picture

Ceph is well-positioned to be a leader in container-based storage, said [David Monschein][13], Systems Engineer at [Linode][14]. “One of the biggest challenges with container-based infrastructure is where to store the data and how to retrieve it. Stateful applications like databases require persistent storage. This data needs to be highly available, survive reboots and transient issues, etc. Ceph is resilient and has well-defined interfaces for storing and retrieving data.”

Ruffino agreed with Monschein and said, “While there are many potential storage solutions capable of handling the storage needs of Kubernetes, Ceph stands out as being the most flexible and comprehensive. Allowing for block, file, and object storage at the same time, Ceph provides a high transfer rate and is capable of scaling up or down very quickly. It is software-defined-storage at its finest. Due to the flexibility, accessibility, programmability, and its natural organic growth and scale capabilities, Ceph is the obvious choice for handling the highly variable needs of Kubernetes.”

### Challenges with Ceph + Kubernetes

Ceph is undergoing containerization, which will make it easier to use with fully cloud-native infrastructure when released in 2020.

Creating object storage services using public cloud infrastructure that is cost-competitive with services of public clouds is challenging. Even so, said Bray, “Ceph provides modalities that are congruent with storage services offered by all the major public clouds, making it an excellent technology to have in a hybrid cloud tool box.”

“Currently there are no real direct and simple integrations between Kubernetes and Ceph, which translates into a much steeper learning curve for administrators without Ceph knowledge, or just getting started,” said Ruffino.

He further added that Ceph is often perceived as “really hard” at the beginning, due to a myriad of options providing near-infinite, workload-specific, customization capabilities; it can be quite overwhelming. However, today’s technology innovators (for example, SoftIron), are rapidly adopting and developing new and intriguing methods for reducing the barrier to entry and aiding enterprises to consume more advanced and robust solutions such as Ceph.

### Advantages with Ceph + Kubernetes

Combining Ceph and Kubernetes takes away the complexity of accessing data storage and lets developers automatically provision data storage. Just issue a command in your software, said Bray, and it provisions data storage for you.

“Kubernetes allows administrators to encourage developers and service delivery professionals to use a continuous delivery model (CI/CD), allowing for constant applications and services improvements. With these improvements comes the need for a dynamically scaling storage solution. Coupled with Ceph, Kubernetes provides a near-infinite capacity for sustainable growth in spite of the demand,” explained Ruffino.

“Once Ceph is containerized (in early 2020), the biggest trend that will emerge is the ability for customers to create their own hyper-converged stacks – using Kubernetes based platforms and Ceph Storage Solutions,” said Larry Morris, Director of Product Management at [SUSE][15].

### Conclusion

The need for scalability, and storage for software development objects, along with unstructured data, lends itself to Ceph, the tool designed to handle the shift from client/server architecture to the modern stack.

“Object storage will soon become the mainstream solution for enterprises to store their massive amounts of data in a scalable and cost-effective way. Ceph is the pioneer and also one of the most important and fast-evolving systems leading this movement,” concluded Bin Fan, VP, Open Source, [Alluxio][16].

_Swapnil Bhartiya contributed to this story._

_The article originally appeared on [TFiR][17]._

--------------------------------------------------------------------------------

via: https://www.linux.com/articles/with-kubernetes-ceph-provides-a-near-infinite-capacity-for-sustainable-growth-2/

作者：[TC CURRIE][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/tc_currie/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2019/11/wine-cellar-1329061_1920-1068x534.jpg (wine-cellar-1329061_1920)
[2]: https://www.linux.com/wp-content/uploads/2019/11/wine-cellar-1329061_1920.jpg
[3]: https://www.redhat.com/en/blog/channel/red-hat-storage
[4]: https://www.mirantis.com/
[5]: https://ceph.io/
[6]: https://www.redhat.com/en/about/press-releases/ceph-community-forms-advisory-board-advance-software-defined-storage-innovation
[7]: https://www.oreilly.com/library/view/learning-ceph-/9781787127913/68e88b41-adc3-411a-828d-6c96ab0c5d7a.xhtml
[8]: https://selinuxproject.org/page/Main_Page
[9]: https://www.youtube.com/watch?v=b835sfk_By8
[10]: https://softiron.com/storage/
[11]: https://www.linkedin.com/in/charlescruffino/
[12]: https://kubernetes.io/
[13]: https://www.linkedin.com/in/monschein/
[14]: https://www.linode.com/2019/10/30/linode-object-storage-is-here/
[15]: https://www.suse.com/products/suse-enterprise-storage/
[16]: https://www.alluxio.io/
[17]: https://www.tfir.io/with-kubernetes-ceph-provides-a-near-infinite-capacity-for-sustainable-growth/
