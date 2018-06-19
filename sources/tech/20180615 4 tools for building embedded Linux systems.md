4 tools for building embedded Linux systems
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/desk_clock_job_work.jpg?itok=Nj4fuhl6)

Linux is being deployed into a much wider array of devices than Linus Torvalds anticipated when he was working on it in his dorm room. The variety of supported chip architectures is astounding and has led to Linux in devices large and small; from [huge IBM mainframes][1] to [tiny devices][2] no bigger than their connection ports and everything in between. It is used in large enterprise data centers, internet infrastructure devices, and personal development systems. It also powers consumer electronics, mobile phones, and many Internet of Things devices.

When building Linux software for desktop and enterprise-class devices, developers typically use a desktop distribution such as [Ubuntu][3] on their build machines to have an environment as close as possible to the one where the software will be deployed. Tools such as [VirtualBox][4] and [Docker][5] allow even better alignment between development, testing, and productions environments.

### What is an embedded system?

Wikipedia defines an [embedded system][6] as: "A computer system with a dedicated function within a larger mechanical or electrical system, often with real-time computing constraints."

I find it simple enough to say that an embedded system is a computer that most people don't think of as a computer. Its primary role is to serve as an appliance of some sort, and it is not considered a general-purpose computing platform.

The development environment in embedded systems programming is usually very different from the testing and production environments. They may use different chip architectures, software stacks, and even operating systems. Development workflows are very different for embedded developers vs. desktop and web developers. Typically, the build output will consist of an entire software image for the target device, including the kernel, device drivers, libraries, and application software (and sometimes the bootloader).

In this article, I will present a survey of four commonly available options for building embedded Linux systems. I will give a flavor for what it's like to work with each and provide enough information to help readers decide which tool to use for their design. I won't teach you how to use any of them; there are plenty of in-depth online learning resources once you have narrowed your choices. No option is right for all use cases, and I hope to present enough details to direct your decision.

### Yocto

The [Yocto][7] project is [defined][8] as "an open source collaboration project that provides templates, tools, and methods to help you create custom Linux-based systems for embedded products regardless of the hardware architecture." It is a collection of recipes, configuration values, and dependencies used to create a custom Linux runtime image tailored to your specific needs.

Full disclosure: most of my work in embedded Linux has focused on the Yocto project, and my knowledge and bias to this system will likely be evident.

Yocto uses [Openembedded][9] as its build system. Technically the two are separate projects; in practice, however, users do not need to understand the distinction, and the project names are frequently used interchangeably.

The output of a Yocto project build consists broadly of three components:

  * **Target run-time binaries:** These include the bootloader, kernel, kernel modules, root filesystem image. and any other auxiliary files needed to deploy Linux to the target platform.
  * **Package feed:** This is the collection of software packages available to be installed on your target. You can select the package format (e.g., deb, rpm, ipk) based on your needs. Some of them may be preinstalled in the target runtime binaries, however, it is possible to build packages for installation into a deployed system.
  * **Target SDK:** These are the collection of libraries and header files representing the software installed on your target. They are used by application developers when building their code to ensure they are linked with the appropriate libraries



#### Advantages

The Yocto project is widely used in the industry and has backing from many influential companies. Additionally, it has a large and vibrant developer [community][10] and [ecosystem][11] contributing to it. The combination of open source enthusiasts and corporate sponsors helps drive the Yocto project.

There are many options for getting support with Yocto. There are books and other training materials if you wish to do-it-yourself. Many engineers with experience in Yocto are available if you want to hire expertise. And many commercial organizations provide turnkey Yocto-based products or services-based implementation and customization for your design.

The Yocto project is easily expanded through [layers][12], which can be published independently to add additional functionality, to target platforms not available in the project releases, or to store customizations unique to your system. Layers can be added to your configuration to add unique features that are not specifically included in the stock releases; for example, the "[meta-browser][13]" layer contains recipes for web browsers, which can be easily built for your system. Because they are independently maintained, layers can be on a different release schedule (tuned to the layers' development velocity) than the standard Yocto releases.

Yocto has arguably the widest device support of any of the options discussed in this article. Due to support from many semiconductor and board manufacturers, it's likely Yocto will support any target platform you choose. The direct Yocto [releases][14] support only a few boards (to allow for proper testing and release cycles), however, a standard working model is to use external board support layers.

Finally, Yocto is extremely flexible and customizable. Customizations for your specific application can be stored in a layer for encapsulation and isolation. Customizations unique to a feature layer are generally stored as part of the layer itself, which allows the same settings to be applied simultaneously to multiple system configurations. Yocto also provides a well-defined layer priority and override capability. This allows you to define the order in which layers are applied and searched for metadata. It also enables you to override settings in layers with higher priority; for instance, many customizations to existing recipes will be added in your private layers, with the order precisely controlled by the priorities.

#### Disadvantages

The biggest disadvantage with the Yocto project is the learning curve. It takes significant time and effort to learn the system and truly understand it. Depending on your needs, this may be too large of an investment in technologies and competence that are not central to your application. In such cases, working with one of the commercial vendors may be a good option.

Development build times and resources are fairly high for Yocto project builds. The number of packages that need to be built, including the toolchain, kernel, and all target runtime components, is significant. Development workstations for Yocto developers tend to be large systems. Using a compact notebook is not recommended. This can be mitigated by using cloud-based build servers available from many providers. Additionally, Yocto has a built-in caching mechanism that allows it to reuse previously built components when it determines that the parameters for building a particular package have not changed.

#### Recommendation

Using the Yocto project for your next embedded Linux design is a strong choice. Of the options presented here, it is the most broadly applicable regardless of your target use case. The broad industry support, active community, and wide platform support make this a good choice for must designers.

### Buildroot

The [Buildroot][15] project is defined as "a simple, efficient, and easy-to-use tool to generate embedded Linux systems through cross-compilation." It shares many of the same objectives as the Yocto project, however it is focused on simplicity and minimalism. In general, Buildroot will disable all optional compile-time settings for all packages (with a few notable exceptions), resulting in the smallest possible system. It will be up to the system designer to enable the settings that are appropriate for a given device.

Buildroot builds all components from source but does not support on-target package management. As such, it is sometimes called a firmware generator since the images are largely fixed at build time. Applications can update the target filesystem, but there is no mechanism to install new packages into a running system.

The Buildroot output consists broadly of three components:

  * The root filesystem image and any other auxiliary files needed to deploy Linux to the target platform
  * The kernel, boot-loader, and kernel modules appropriate for the target hardware
  * The toolchain used to build all the target binaries.



#### Advantages

Buildroot's focus on simplicity means that, in general, it is easier to learn than Yocto. The core build system is written in Make and is short enough to allow a developer to understand the entire system while being expandable enough to meet the needs of embedded Linux developers. The Buildroot core generally only handles common use cases, but it is expandable via scripting.

The Buildroot system uses normal Makefiles and the Kconfig language for its configuration. Kconfig was developed by the Linux kernel community and is widely used in open source projects, making it familiar to many developers.

Due to the design goal of disabling all optional build-time settings, Buildroot will generally produce the smallest possible images using the out-of-the-box configuration. The build times and build host resources will likewise be smaller, in general, than those of the Yocto project.

#### Disadvantages

The focus on simplicity and minimal enabled build options imply that you may need to do significant customization to configure a Buildroot build for your application. Additionally, all configuration options are stored in a single file, which means if you have multiple hardware platforms, you will need to make each of your customization changes for each platform.

Any change to the system configuration file requires a full rebuild of all packages. This is somewhat mitigated by the minimal image sizes and build times compared with Yocto, but it can result in long builds while you are tweaking your configuration.

Intermediate package state caching is not enabled by default and is not as thorough as the Yocto implementation. This means that, while the first build may be shorter than an equivalent Yocto build, subsequent builds may require rebuilding of many components.

#### Recommendation

Using Buildroot for your next embedded Linux design is a good choice for most applications. If your design requires multiple hardware types or other differences, you may want to reconsider due to the complexity of synchronizing multiple configurations, however, for a system consisting of a single setup, Buildroot will likely work well for you.

### OpenWRT/LEDE

The [OpenWRT][16] project was started to develop custom firmware for consumer routers. Many of the low-cost routers available at your local retailer are capable of running a Linux system, but maybe not out of the box. The manufacturers of these routers may not provide frequent updates to address new threats, and even if they do, the mechanisms to install updated images are difficult and error-prone. The OpenWRT project produces updated firmware images for many devices that have been abandoned by their manufacturers and gives these devices a new lease on life.

The OpenWRT project's primary deliverables are binary images for a large number of commercial devices. There are network-accessible package repositories that allow device end users to add new software to their systems. The OpenWRT build system is a general-purpose build system, which allows developers to create custom versions to meet their own requirements and add new packages, but its primary focus is target binaries.

#### Advantages

If you are looking for replacement firmware for a commercial device, OpenWRT should be on your list of options. It is well-maintained and may protect you from issues that the manufacturer's firmware cannot. You can add extra functionality as well, making your devices more useful.

If your embedded design is networking-focused, OpenWRT is a good choice. Networking applications are the primary use case for OpenWRT, and you will likely find many of those software packages available in it.

#### Disadvantages

OpenWRT imposes significant policy decisions on your design (vs. Yocto and Buildroot). If these decisions don't meet your design goals, you may have to do non-trivial modifications.

Allowing package-based updates in a fleet of deployed devices is difficult to manage. This, by definition, results in a different software load than what your QA team tested. Additionally, it is difficult to guarantee atomic installs with most package managers, and an ill-timed power cycle can leave your device in an unpredictable state.

#### Recommendation

OpenWRT is a good choice for hobbyist projects or for reusing commercial hardware. It is also a good choice for networking applications. If you need significant customization from the default setup, you may prefer Buildroot or Yocto.

### Desktop distros

A common approach to designing embedded Linux systems is to start with a desktop distribution, such as [Debian][17] or [Red Hat][18], and remove unneeded components until the installed image fits into the footprint of your target device. This is the approach taken for the popular [Raspbian][19] distribution for the [Raspberry Pi][20] platform.

#### Advantages

The primary advantage of this approach is familiarity. Often, embedded Linux developers are also desktop Linux users and are well-versed in their distro of choice. Using a similar environment on the target may allow developers to get started more quickly. Depending on the chosen distribution, many additional tools can be installed using standard packaging tools such as apt and yum.

It may be possible to attach a display and keyboard to your target device and do all your development directly there. For developers new to the embedded space, this is likely to be a more familiar environment and removes the need to configure and use a tricky cross-development setup.

The number of packages available for most desktop distributions is generally greater than that available for the embedded-specific builders discussed previously. Due to the larger user base and wider variety of use cases, you may be able to find all the runtime packages you need for your application already built and ready for use.

#### Disadvantages

Using the target as your primary development environment is likely to be slow. Running compiler tools is a resource-intensive operation and, depending on how much code you are building, may hinder your performance.

With some exceptions, desktop distributions are not designed to accommodate low-resource systems, and it may be difficult to adequately trim your target images. Similarly, the expected workflow in a desktop environment is not ideal for most embedded designs. Getting a reproducible environment in this fashion is difficult. Manually adding and deleting packages is error-prone. This can be scripted using distribution-specific tools, such as [debootstrap][21] for Debian-based systems. To further improve [reproducibility][21], you can use a configuration management tool, such as [CFEngine][22] (which, full disclosure, is made by my employer, [Mender.io][23]). However, you are still at the mercy of the distribution provider, who will update packages to meet their needs, not yours.

#### Recommendation

Be wary of this approach for a product you plan to take to market. This is a fine model for hobbyist applications; however, for products that need support, this approach is likely going to be trouble. While you may be able to get a faster start, it may cost you time and effort in the long run.

### Other considerations

This discussion has focused on build systems' functionality, but there are usually non-functional requirements that may affect your decision. If you have already selected your system-on-chip (SoC) or board, your choice will likely be dictated by the vendor. If your vendor provides a board support package (BSP) for a given system, using it will normally save quite a bit of time, but please research the BSP's quality to avoid issues later in your development cycle.

If your budget allows, you may want to consider using a commercial vendor for your target OS. There are companies that will provide a validated and supported configuration of many of the options discussed here, and, unless you have expertise in embedded Linux build systems, this is a good choice and will allow you to focus on your core competency.

As an alternative, you may consider commercial training for your development staff. This is likely to be cheaper than a commercial OS provider and will allow you to be more self-sufficient. This is a quick way to get over the learning curve for the basics of the build system you choose.

Finally, you may already have some developers with experience with one or more of the systems. If you have engineers who have a preference, it is certainly worth taking that into consideration as you make your decision.

### Summary

There are many choices available for building embedded Linux systems, each with advantages and disadvantages. It is crucial to prioritize this part of your design, as it is extremely costly to switch systems later in the process. In addition to these options, new systems are being developed all the time. Hopefully, this discussion will provide some context for reviewing new systems (and the ones mentioned here) and help you make a solid decision for your next project.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/embedded-linux-build-tools

作者：[Drew Moseley][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/drewmoseley
[1]:https://en.wikipedia.org/wiki/Linux_on_z_Systems
[2]:http://www.picotux.com/
[3]:https://www.ubuntu.com/
[4]:https://www.virtualbox.org/
[5]:https://www.docker.com/
[6]:https://en.wikipedia.org/wiki/Embedded_system
[7]:https://yoctoproject.org/
[8]:https://www.yoctoproject.org/about/
[9]:https://www.openembedded.org/
[10]:https://www.yoctoproject.org/community/
[11]:https://www.yoctoproject.org/ecosystem/participants/
[12]:https://layers.openembedded.org/layerindex/branch/master/layers/
[13]:https://layers.openembedded.org/layerindex/branch/master/layer/meta-browser/
[14]:https://yoctoproject.org/downloads
[15]:https://buildroot.org/
[16]:https://openwrt.org/
[17]:https://www.debian.org/
[18]:https://www.redhat.com/
[19]:https://www.raspbian.org/
[20]:https://www.raspberrypi.org/
[21]:https://wiki.debian.org/Debootstrap
[22]:https://cfengine.com/
[23]:http://Mender.io
