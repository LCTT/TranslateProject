[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Building the virtualization stack of the future with rust-vmm)
[#]: via: (https://opensource.com/article/19/3/rust-virtual-machine)
[#]: author: (Andreea Florescu )

Building the virtualization stack of the future with rust-vmm
======
rust-vmm facilitates sharing core virtualization components between Rust Virtual Machine Monitors.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_stack_blue_disks.png?itok=3hKDtK20)

More than a year ago we started developing [Firecracker][1], a virtual machine monitor (VMM) that runs on top of KVM (the kernel-based virtual machine). We wanted to create a lightweight VMM that starts virtual machines (VMs) in a fraction of a second, with a low memory footprint, to enable high-density cloud environments.

We started out developing Firecracker by forking the Chrome OS VMM ([CrosVM][2]), but we diverged shortly after because we targeted different customer use cases. CrosVM provides Linux application isolation in ChromeOS, while Firecracker is used for running multi-tenant workloads at scale. Even though we now walk different paths, we still have common virtualization components, such as wrappers over KVM input/output controls (ioctls), a minimal kernel loader, and use of the [Virtio][3] device models.

With this in mind, we started thinking about the best approach for sharing the common code. Having a shared codebase raises the security and quality bar for both projects. Currently, fixing security bugs requires duplicated work in terms of porting the changes from one project to the other and going through different review processes for merging the changes. After open sourcing Firecracker, we've received requests for adding features including GPU support and booting [bzImage][4] files. Some of the requests didn't align with Firecracker's goals, but were otherwise valid use cases that just haven't found the right place for an implementation.

### The rust-vmm project

The [rust-vmm][5] project came to life in December 2018 when Amazon, Google, Intel, and Red Hat employees started talking about the best way of sharing virtualization packages. More contributors have joined this initiative along the way. We are still at the beginning of this journey, with only one component published to [Crates.io][6] (Rust's package registry) and several others (such as Virtio devices, Linux kernel loaders, and KVM ioctls wrappers) being developed. With two VMMs written in Rust under active development and growing interest in building other specialized VMMs, rust-vmm was born as the host for sharing core virtualization components.

The goal of rust-vmm is to enable the community to create custom VMMs that import just the required building blocks for their use case. We decided to organize rust-vmm as a multi-repository project, where each repository corresponds to an independent virtualization component. Each individual building block is published on Crates.io.

### Creating custom VMMs with rust-vmm

The components discussed below are currently under development.

![](https://opensource.com/sites/default/files/uploads/custom_vmm.png)

Each box on the right side of the diagram is a GitHub repository corresponding to one package, which in Rust is called a crate. The functionality of one crate can be further split into modules, for example virtio-devices. Let's have a look at these components and some of their potential use cases.

  * **KVM interface:** Creating our VMM on top of KVM requires an interface that can invoke KVM functionality from Rust. The kvm-bindings crate represents the Rust Foreign Function Interface (FFI) to KVM kernel headers. Because headers only include structures and defines, we also have wrappers over the KVM ioctls (kvm-ioctls) that we use for opening dev/kvm, creating a VM, creating vCPUs, and so on.

  * **Virtio devices and rate limiting:** Virtio has a frontend-backend architecture. Currently in rust-vmm, the frontend is implemented in the virtio-devices crate, and the backend lies in the vhost package. Vhost has support for both user-land and kernel-land drivers, but users can also plug virtio-devices to their custom backend. The virtio-bindings are the bindings for Virtio devices generated using the Virtio Linux headers. All devices in the virtio-devices crate are exported independently as modules using conditional compilation. Some devices, such as block, net, and vsock support rate limiting in terms of I/O per second and bandwidth. This can be achieved by using the functionality provided in the rate-limiter crate.

  * The kernel-loader is responsible for loading the contents of an [ELF][7] kernel image in guest memory.




For example, let's say we want to build a custom VMM that allows users to create and configure a single VM running on top of KVM. As part of the configuration, users will be able to specify the kernel image file, the root file system, the number of vCPUs, and the memory size. Creating and configuring the resources of the VM can be implemented using the kvm-ioctls crate. The kernel image can be loaded in guest memory with kernel-loader, and specifying a root filesystem can be achieved with the virtio-devices block module. The last thing needed for our VMM is writing VMM Glue, the code that takes care of integrating rust-vmm components with the VMM user interface, which allows users to create and manage VMs.

### How you can help

This is the beginning of an exciting journey, and we are looking forward to getting more people interested in VMMs, Rust, and the place where you can find both: [rust-vmm][5].

We currently have [sync meetings][8] every two weeks to discuss the future of the rust-vmm organization. The meetings are open to anyone willing to participate. If you have any questions, please open an issue in the [community repository][9] or send an email to the rust-vmm [mailing list][10] (you can also [subscribe][11]). We also have a [Slack channel][12] and encourage you to join, if you are interested.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/rust-virtual-machine

作者：[Andreea Florescu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://github.com/firecracker-microvm/firecracker
[2]: https://chromium.googlesource.com/chromiumos/platform/crosvm/
[3]: https://www.linux-kvm.org/page/Virtio
[4]: https://en.wikipedia.org/wiki/Vmlinux#bzImage
[5]: https://github.com/rust-vmm
[6]: https://crates.io/
[7]: https://en.wikipedia.org/wiki/Executable_and_Linkable_Format
[8]: http://lists.opendev.org/pipermail/rust-vmm/2019-January/000103.html
[9]: https://github.com/rust-vmm/community
[10]: mailto:rust-vmm@lists.opendev.org
[11]: http://lists.opendev.org/cgi-bin/mailman/listinfo/rust-vmm
[12]: https://join.slack.com/t/rust-vmm/shared_invite/enQtNTI3NDM2NjA5MzMzLTJiZjUxOGEwMTJkZDVkYTcxYjhjMWU3YzVhOGQ0M2Y5NmU5MzExMjg5NGE3NjlmNzNhZDlhMmY4ZjVhYTQ4ZmQ
