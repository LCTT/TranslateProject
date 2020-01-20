[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fedora CoreOS out of preview)
[#]: via: (https://fedoramagazine.org/fedora-coreos-out-of-preview/)
[#]: author: (bgilbert https://fedoramagazine.org/author/bgilbert/)

Fedora CoreOS out of preview
======

![The Fedora CoreOS logo on a gray background.][1]

The Fedora CoreOS team is pleased to announce that Fedora CoreOS is now [available for general use][2].

Fedora CoreOS is a new Fedora Edition built specifically for running containerized workloads securely and at scale. It’s the successor to both [Fedora Atomic Host][3] and [CoreOS Container Linux][4] and is part of our effort to explore new ways of assembling and updating an OS. Fedora CoreOS combines the provisioning tools and automatic update model of Container Linux with the packaging technology, OCI support, and SELinux security of Atomic Host.  For more on the Fedora CoreOS philosophy, goals, and design, see the [announcement of the preview release][5].

Some highlights of the current Fedora CoreOS release:

  * [Automatic updates][6], with staged deployments and phased rollouts
  * Built from Fedora 31, featuring:
    * Linux 5.4
    * systemd 243
    * Ignition 2.1
  * OCI and Docker Container support via Podman 1.7 and Moby 18.09
  * cgroups v1 enabled by default for broader compatibility; cgroups v2 available via configuration



Fedora CoreOS is available on a variety of platforms:

  * Bare metal, QEMU, OpenStack, and VMware
  * Images available in all public AWS regions
  * Downloadable cloud images for Alibaba, AWS, Azure, and GCP
  * Can run live from RAM via ISO and PXE (netboot) images



Fedora CoreOS is under active development.  Planned future enhancements include:

  * Addition of the _next_ release stream for extended testing of upcoming Fedora releases.
  * Support for additional cloud and virtualization platforms, and processor architectures other than _x86_64_.
  * Closer integration with Kubernetes distributions, including [OKD][7].
  * [Aggregate statistics collection][8].
  * Additional [documentation][9].



### Where do I get it?

To try out the new release, head over to the [download page][10] to get OS images or cloud image IDs.  Then use the [quick start guide][11] to get a machine running quickly.

### How do I get involved?

It’s easy!  You can report bugs and missing features to the [issue tracker][12]. You can also discuss Fedora CoreOS in [Fedora Discourse][13], the [development mailing list][14], in _#fedora-coreos_ on Freenode, or at our [weekly IRC meetings][15].

### Are there stability guarantees?

In general, the Fedora Project does not make any guarantees around stability.  While Fedora CoreOS strives for a high level of stability, this can be challenging to achieve in the rapidly evolving Linux and container ecosystems.  We’ve found that the incremental, exploratory, forward-looking development required for Fedora CoreOS — which is also a cornerstone of the Fedora Project as a whole — is difficult to reconcile with the iron-clad stability guarantee that ideally exists when automatically updating systems.

We’ll continue to do our best not to break existing systems over time, and to give users the tools to manage the impact of any regressions.  Nevertheless, automatic updates may produce regressions or breaking changes for some use cases. You should make your own decisions about where and how to run Fedora CoreOS based on your risk tolerance, operational needs, and experience with the OS.  We will continue to announce any major planned or unplanned breakage to the [coreos-status mailing list][16], along with recommended mitigations.

### How do I migrate from CoreOS Container Linux?

Container Linux machines cannot be migrated in place to Fedora CoreOS.  We recommend [writing a new Fedora CoreOS Config][11] to provision Fedora CoreOS machines.  Fedora CoreOS Configs are similar to Container Linux Configs, and must be passed through the Fedora CoreOS Config Transpiler to produce an Ignition config for provisioning a Fedora CoreOS machine.

Whether you’re currently provisioning your Container Linux machines using a Container Linux Config, handwritten Ignition config, or cloud-config, you’ll need to adjust your configs for differences between Container Linux and Fedora CoreOS.  For example, on Fedora CoreOS network configuration is performed with [NetworkManager key files][17] instead of _systemd-networkd_, and time synchronization is performed by _chrony_ rather than _systemd-timesyncd_.  Initial migration documentation will be [available soon][9] and a skeleton list of differences between the two OSes is available in [this issue][18].

CoreOS Container Linux will be maintained for a few more months, and then will be declared end-of-life.  We’ll announce the exact end-of-life date later this month.

### How do I migrate from Fedora Atomic Host?

Fedora Atomic Host has already reached end-of-life, and you should migrate to Fedora CoreOS as soon as possible.  We do not recommend in-place migration of Atomic Host machines to Fedora CoreOS. Instead, we recommend [writing a Fedora CoreOS Config][11] and using it to provision new Fedora CoreOS machines.  As with CoreOS Container Linux, you’ll need to adjust your existing cloud-configs for differences between Fedora Atomic Host and Fedora CoreOS.

Welcome to Fedora CoreOS.  Deploy it, launch your apps, and let us know what you think!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-coreos-out-of-preview/

作者：[bgilbert][a]
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
[5]: https://fedoramagazine.org/introducing-fedora-coreos/
[6]: https://docs.fedoraproject.org/en-US/fedora-coreos/auto-updates/
[7]: https://www.okd.io/
[8]: https://github.com/coreos/fedora-coreos-pinger/
[9]: https://docs.fedoraproject.org/en-US/fedora-coreos/
[10]: https://getfedora.org/coreos/download/
[11]: https://docs.fedoraproject.org/en-US/fedora-coreos/getting-started/
[12]: https://github.com/coreos/fedora-coreos-tracker/issues
[13]: https://discussion.fedoraproject.org/c/server/coreos
[14]: https://lists.fedoraproject.org/archives/list/coreos@lists.fedoraproject.org/
[15]: https://github.com/coreos/fedora-coreos-tracker#meetings
[16]: https://lists.fedoraproject.org/archives/list/coreos-status@lists.fedoraproject.org/
[17]: https://developer.gnome.org/NetworkManager/stable/nm-settings-keyfile.html
[18]: https://github.com/coreos/fedora-coreos-tracker/issues/159
