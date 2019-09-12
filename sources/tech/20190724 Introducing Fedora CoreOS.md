[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Introducing Fedora CoreOS)
[#]: via: (https://fedoramagazine.org/introducing-fedora-coreos/)
[#]: author: (Benjamin Gilbert https://fedoramagazine.org/author/bgilbert/)

Introducing Fedora CoreOS
======

![The Fedora CoreOS logo on a gray background.][1]

The Fedora CoreOS team is excited to [announce the first preview release][2] of Fedora CoreOS, a new Fedora edition built specifically for running containerized workloads securely and at scale. It’s the successor to both [Fedora Atomic Host][3] and [CoreOS Container Linux][4]. Fedora CoreOS combines the provisioning tools, automatic update model, and philosophy of Container Linux with the packaging technology, OCI support, and SELinux security of Atomic Host.

Read on for more details about this exciting new release.

### Why Fedora CoreOS?

Containers allow workloads to be reproducibly deployed to production and automatically scaled to meet demand. The isolation provided by a container means that the host OS can be small. It only needs a Linux kernel, systemd, a container runtime, and a few additional services such as an SSH server.

While containers can be run on a full-sized server OS, an operating system built specifically for containers can provide functionality that a general purpose OS cannot. Since the required software is minimal and uniform, the entire OS can be deployed as a unit with little customization. And, since containers are deployed across multiple nodes for redundancy, the OS can update itself automatically and then reboot without interrupting workloads.

Fedora CoreOS is built to be the secure and reliable host for your compute clusters. It’s designed specifically for running containerized workloads without regular maintenance, automatically updating itself with the latest OS improvements, bug fixes, and security updates. It provisions itself with Ignition, runs containers with Podman and Moby, and updates itself atomically and automatically with rpm-ostree.

### Provisioning immutable infrastructure

Whether you run in the cloud, virtualized, or on bare metal, a Fedora CoreOS machine always begins from the same place: a [generic OS image][5]. Then, during the first boot, Fedora CoreOS uses _Ignition_ to provision the system. Ignition reads an _Ignition config_ from cloud user data or a remote URL, and uses it to create disk partitions and file systems, users, files and systemd units.

To provision a machine:

  1. Write a [Fedora CoreOS Config][6] (FCC), a YAML document that specifies the desired configuration of a machine. FCCs support all Ignition functionality, and also provide additional syntax (“sugar”) that makes it easier to specify typical configuration changes.
  2. Use the [Fedora CoreOS Config Transpiler][7] to [validate your FCC and convert it to an Ignition config][8].
  3. Launch a Fedora CoreOS machine and [pass it the Ignition config][9]. If the machine boots successfully, provisioning has completed without errors.



Fedora CoreOS is designed to be managed as _immutable infrastructure_. After a machine is provisioned, you should not modify _/etc_ or otherwise reconfigure the machine. Instead, modify the FCC and use it to provision a replacement machine.

This is similar to how you’d manage a container: container images are not updated in place, but rebuilt from scratch and redeployed. This approach makes it easy to scale out when load increases. Simply use the same Ignition config to launch additional machines.

### Automatic updates

By default, Fedora CoreOS automatically downloads new OS releases, atomically installs them, and reboots into them. Releases roll out gradually over time. We can even stop a rollout if we discover a problem in a new release. Upgrades between Fedora releases are treated as any other update, and are automatically applied without user intervention.

The Linux ecosystem evolves quickly, and software updates can bring undesired behavior changes. However, for automatic updates to be trustworthy, they cannot break existing machines. To avoid this, Fedora CoreOS takes a two-pronged approach. First, we automatically test each change to the OS. However, automatic testing can’t catch all regressions, so Fedora CoreOS also ships multiple independent _release streams_:

  * The _testing_ stream is a regular snapshot of the current Fedora release, plus updates.
  * After a _testing_ release has been available for two weeks, it is sent to the _stable_ stream. Bugs discovered in _testing_ will be fixed before a release is sent to _stable_.
  * The _next_ stream is a regular snapshot of the upcoming Fedora release, allowing additional time for testing larger changes.



All three streams receive security updates and critical bugfixes, and are intended to be safe for production use. Most machines should run the _stable_ stream, since that receives the most testing. However, users should run a few percent of their nodes on the _next_ and _testing_ streams, and report problems to the [issue tracker][10]. This helps ensure that bugs that only affect certain workloads or certain hardware are fixed before they reach _stable_.

### Telemetry

To help direct our development efforts, Fedora CoreOS will perform some telemetry by default. A service called _[fedora-coreos-pinger][11]_ will periodically collect non-identifying information about the machine, such as the OS version, cloud platform, and instance type, and report it to servers controlled by the Fedora project.

No unique identifiers will be reported or collected, and the data will only be used in aggregate to answer questions about how Fedora CoreOS is being used. We will prominently document that this collection is occurring and how to disable it. We will also tell you how to help the project by reporting additional detail, including information that might identify the machine.

### Current status of Fedora CoreOS

Fedora CoreOS is still under active development, and some planned functionality is not available in the first preview release:

  * Only the _testing_ stream currently exists; the _next_ and _stable_ streams are not yet available.
  * Several cloud and virtualization platforms are not yet available. Only x86_64 is currently supported.
  * Booting a live Fedora CoreOS system via network (PXE) or CD is not yet supported.
  * We are actively discussing plans for closer integration with Kubernetes distributions, including OKD.
  * Fedora CoreOS Config Transpiler will gain more sugar over time.
  * Telemetry is not yet active.
  * Documentation is still under development.



**While Fedora CoreOS is intended for production use, preview releases should _not_ be used in production. Fedora CoreOS may change in incompatible ways during the preview period. There is no guarantee that a preview release will successfully update to a later preview release, or to a stable release.**

### The future

We expect the preview period to continue for about six months. At the end of the preview, we will declare Fedora CoreOS stable and encourage its use in production.

CoreOS Container Linux will be maintained until about six months after Fedora CoreOS is declared stable. We’ll announce the exact timing later this year. During the preview period, we’ll publish tools and documentation to help Container Linux users migrate to Fedora CoreOS.

[Fedora Atomic Host will be maintained][12] until the end of life of Fedora 29, expected in late November. Before then, Fedora Atomic Host users should migrate to Fedora CoreOS.

### Getting involved in Fedora CoreOS

To try out the new release, head over to the [download page][5] to get OS images or cloud image IDs. Then use the [quick start guide][13] to get a machine running quickly. Finally, get involved! You can report bugs and missing features to the [issue tracker][10]. You can also discuss Fedora CoreOS in [Fedora Discourse][14], the [development mailing list][15], or in #fedora-coreos on Freenode.

Welcome to Fedora CoreOS, and let us know what you think!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/introducing-fedora-coreos/

作者：[Benjamin Gilbert][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/bgilbert/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/07/introducing-fedora-coreos-816x345.png
[2]: https://getfedora.org/coreos/
[3]: https://www.projectatomic.io/
[4]: https://coreos.com/os/docs/latest/
[5]: https://getfedora.org/coreos/download/
[6]: https://github.com/coreos/fcct/blob/master/docs/configuration-v1_0.md
[7]: https://github.com/coreos/fcct/releases
[8]: https://docs.fedoraproject.org/en-US/fedora-coreos/getting-started/#_generating_ignition_configs
[9]: https://docs.fedoraproject.org/en-US/fedora-coreos/getting-started/#_launching_fedora_coreos
[10]: https://github.com/coreos/fedora-coreos-tracker/issues
[11]: https://github.com/coreos/fedora-coreos-pinger/
[12]: https://fedoramagazine.org/announcing-fedora-coreos/
[13]: https://docs.fedoraproject.org/en-US/fedora-coreos/getting-started/
[14]: https://discussion.fedoraproject.org/c/server/coreos
[15]: https://lists.fedoraproject.org/archives/list/coreos@lists.fedoraproject.org/
