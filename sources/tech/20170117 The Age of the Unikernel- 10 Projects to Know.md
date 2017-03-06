The Age of the Unikernel: 10 Projects to Know
============================================================

 ![unikernels](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/unikernels_0.jpg?itok=r9sGHEL0 "unikernels") 
A unikernel is essentially a pared-down operating system that can pair with an application into a unikernel application, typically running within a virtual machine. Download the Guide to the Open Cloud to learn more.[Creative Commons Zero][1]Pixabay

When it comes to operating systems, container technologies, and unikernels, the trend toward tiny continues. What is a unikernel? It is essentially a pared-down operating system (the unikernel) that can pair with an application into a unikernel application, typically running within a virtual machine. They are sometimes called library operating systems because they include libraries that enable applications to use hardware and network protocols in combination with a set of policies for access control and isolation of the network layer.

Containers often come to mind when discussion turns to cloud computing and Linux, but unikernels are doing transformative things, too. Neither containers nor unikernels are brand new. There were unikernel-like systems in the 1990s such as Exokernel, but today popular unikernels include MirageOS and OSv. Unikernel applications can be used independently and deployed across heterogeneous environments. They can facilitate specialized and isolated services and have become widely used for developing applications within a microservices architecture.

As an example of how unikernels are attracting attention, consider the fact that Docker purchased[ Cambridge-based Unikernel Systems][3], and has been working with unikernels in numerous scenarios.

Unikernels, like container technologies, strip away non-essentials and thus they have a very positive impact on application stability and availability, as well as security. They are also attracting many of the top, most creative developers on the open source scene.

The Linux Foundation recently[ announced][4] the release of its 2016 report[Guide to the Open Cloud: Current Trends and Open Source Projects.][5] This third annual report provides a comprehensive look at the state of open cloud computing and includes a section on unikernels. You can[ download the report][6] now. It aggregates and analyzes research, illustrating how trends in containers, unikernels, and more are reshaping cloud computing. The report provides descriptions and links to categorized projects central to today’s open cloud environment.

In this series of articles, we are looking at the projects mentioned in the guide, by category, providing extra insights on how the overall category is evolving. Below, you’ll find a list of several important unikernels and the impact that they are having, along with links to their GitHub repositories, all gathered from the Guide to the Open Cloud:

[CLICKOS][7]

ClickOS is NEC’s high-performance, virtualized software middlebox platform for network function virtualization (NFV) built on top of MiniOS/ MirageOS. [ClickOS on GitHub][8]

[CLIVE][9]

Clive is an operating system written in Go and designed to work in distributed and cloud computing environments.

[HALVM][10]

The Haskell Lightweight Virtual Machine (HaLVM) is a port of the Glasgow Haskell Compiler toolsuite that enables developers to write high-level, lightweight virtual machines that can run directly on the Xen hypervisor. [HaLVM on GitHub][11]

[INCLUDEOS][12]

IncludeOS is a unikernel operating system for C++ services running in the cloud. It provides a bootloader, standard libraries and the build- and deployment system on which to run services. Test in VirtualBox or QEMU, and deploy services on OpenStack. [IncludeOS on GitHub][13]

[LING][14]

Ling is an Erlang platform for building super-scalable clouds that runs directly on top of the Xen hypervisor. It runs on only three external libraries — no OpenSSL — and the filesystem is read-only to remove the majority of attack vectors. [Ling on GitHub][15]

[MIRAGEOS][16]

MirageOS is a library operating system incubating under the Xen Project at The Linux Foundation. It uses the OCaml language to construct unikernels for secure, high-performance network applications across a variety of cloud computing and mobile platforms. Code can be developed on a normal OS such as Linux or MacOS X, and then compiled into a fully-standalone, specialised unikernel that runs under the Xen hypervisor.[ MirageOS on GitHub][17]

[OSV][18]

OSv is the open source operating system from Cloudius Systems designed for the cloud. It supports applications written in Java, Ruby (via JRuby), JavaScript (via Rhino and Nashorn), Scala, and others. And it runs on the VMware, VirtualBox, KVM, and Xen hypervisors. [OSv on GitHub][19]

[RUMPRUN][20]

Rumprun is a production-ready unikernel that uses the drivers offered by rump kernels, adds a libc and an application environment on top, and provides a toolchain with which to build existing POSIX-y applications as Rumprun unikernels. It works on KVM and Xen hypervisors and on bare metal and supports applications written in C, C++, Erlang, Go, Java, Javascript (Node.js), Python, Ruby, Rust, and more. [Rumprun on GitHub][21]

[RUNTIME.JS][22]

Runtime.js is an open source library operating system (unikernel) for the cloud that runs JavaScript, can be bundled up with an application and deployed as a lightweight and immutable VM image. It’s built on V8 JavaScript engine and uses event-driven and non- blocking I/O model inspired by Node.js. KVM is the only supported hypervisor. [Runtime.js on GitHub][23]

[UNIK][24]

Unik is EMC’s tool for compiling application sources into unikernels (lightweight bootable disk images) rather than binaries. It allows applications to be deployed securely and with minimal footprint across a variety of cloud providers, embedded devices (IoT), as well as a developer laptop or workstation. It supports multiple unikernel types, processor architectures, hypervisors and orchestration tools including Cloud Foundry, Docker, and Kubernetes. [Unik on GitHub][25]

--------------------------------------------------------------------------------

via: https://www.linux.com/news/open-cloud-report/2016/guide-open-cloud-age-unikernel

作者：[SAM DEAN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/sam-dean
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/unikernelsjpg-0
[3]:http://www.infoworld.com/article/3024410/application-virtualization/docker-kicks-off-unikernel-revolution.html
[4]:https://www.linux.com/blog/linux-foundation-issues-2016-guide-open-source-cloud-projects
[5]:http://ctt.marketwire.com/?release=11G120876-001&id=10172077&type=0&url=http%3A%2F%2Fgo.linuxfoundation.org%2Frd-open-cloud-report-2016-pr
[6]:http://go.linuxfoundation.org/l/6342/2016-10-31/3krbjr
[7]:http://cnp.neclab.eu/clickos/
[8]:https://github.com/cnplab/clickos
[9]:http://lsub.org/ls/clive.html
[10]:https://galois.com/project/halvm/
[11]:https://github.com/GaloisInc/HaLVM
[12]:http://www.includeos.org/
[13]:https://github.com/hioa-cs/IncludeOS
[14]:http://erlangonxen.org/
[15]:https://github.com/cloudozer/ling
[16]:https://mirage.io/
[17]:https://github.com/mirage/mirage
[18]:http://osv.io/
[19]:https://github.com/cloudius-systems/osv
[20]:http://rumpkernel.org/
[21]:https://github.com/rumpkernel/rumprun
[22]:http://runtimejs.org/
[23]:https://github.com/runtimejs/runtime
[24]:http://dojoblog.emc.com/unikernels/unik-build-run-unikernels-easy/
[25]:https://github.com/emc-advanced-dev/unik
