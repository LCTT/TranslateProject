[#]: subject: "Canonical Makes it Easy to Run a Linux VM on Apple M1"
[#]: via: "https://news.itsfoss.com/canonical-multipass-linux-m1/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Canonical Makes it Easy to Run a Linux VM on Apple M1
======

Ever since Apple introduced its M1 chips, numerous efforts have been made to run Linux on it.

Even though that is still in progress, Canonical seems to have made it possible to run Linux (Ubuntu) as virtual machines (VMs) on Apple M1.

### Linux VMs on Apple M1

It is convenient for most developers to spin up a Linux VM instance and continue working on their system without interruptions.

Unfortunately, getting a Linux instance up and running on M1 devices is not a straightforward task.

While you have tools like VMware and VirtualBox to create virtual machines, it does not work on ARM-based Apple M1 silicon.

As of now, VMware is slowly adding support for its products to work on Apple M1. However, that is still in closed beta and not feasible for users.

And, when it comes to VirtualBox, it does not support the ARM platform yet and has no plans for it.

So, your best bet to run virtual machines is using parallels or [UTM][1] (free) on macOS. Hence, pretty limited options that give you cross-platform support.

Moreover, you need to purchase a license to use parallels, which could be expensive.

### Canonical’s Multipass 1.8 is a Free Virtual Machine Program With M1 Support

[Multipass][2] is a free VM software that aims to help you create Linux instances on Apple M1 without any hassle.

Canonical [announced][3] the release of their latest Multipass 1.8 that finally adds support for Apple M1, making it the only viable choice as a cross-platform virtual machine software that helps you run Ubuntu Linux.

In the announcement, Canonical product manager Nathan Hart mentions:

> “Canonical wants to get developers running on Linux faster than any other option on the market, and the Multipass team has helped accomplish that.”

Along with the addition of support, Multipass 1.8 also brings in some useful features that include:

  * Aliases to tie commands on the virtual machine to the host OS. In other words, you can run a software in the VM directly from your host OS seamlessly.
  * Unified cross-platform experience with Windows, Linux, mac OS (Intel/AMD and ARM platform) support.



Multipass should handle the configuration and let you easily create/maintain a virtual machine on Apple M1. So, you wouldn’t need any manual intervention to make Linux work within an M1-powered macOS machine.

You can find out more about it on their official website.

[Multipass][2]

### Wrapping Up

Considering now that you can use Canonical’s Multipass to spin up a Linux instance on Apple M1, would you consider getting an Apple M1 system for your development work?

Or, do you prefer using parallels to run Linux on M1? Let me know your thoughts in the comments below.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/canonical-multipass-linux-m1/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://github.com/utmapp/UTM
[2]: https://multipass.run/
[3]: https://ubuntu.com/blog/canonical-transforms-linux-on-mac
