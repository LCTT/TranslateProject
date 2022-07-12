[#]: subject: "7 Reasons Why Ubuntu 22.04 LTS is the Most Secure Release Yet"
[#]: via: "https://news.itsfoss.com/reasons-ubuntu-22-04-secure/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

7 Reasons Why Ubuntu 22.04 LTS is the Most Secure Release Yet
======
Ubuntu 22.04 LTS is one of the best Ubuntu releases so far. What makes it so secure?

![ubuntu 22.04][1]

[Ubuntu 22.04 LTS][2], released back in April, is the most secure Ubuntu release yet.

Between its extended security updates, new hardware support, and a wide range of other improvements, it far outperforms all previous releases in terms of security.

But how does it do that? And, what makes this release different from previous ones? Well, there are a few reasons for that, and Canonical has highlighted all the relevant details in a new blog post.

Here, let me summarise that to help you learn more.

### What Makes Ubuntu 22.04 LTS Secure?

With this release, it seems that the Ubuntu team has put a lot of work into ensuring its long-term security and reliability. Although they did this in an unthinkable number of ways over the years, I shall highlight a few things that include:

* Improved hardware security measure support
* Updated security packages
* Private home directories
* OpenSSL 3
* GCC 11
* nftables as the default firewall backend
* Linux Kernel improvements

#### 1. Improved Hardware Security Measure Support

![][3]

As Intel, AMD, and ARM CPUs/SoCs start coming up with more security measures, it is becoming ever more important that adequate software is there to allow these features to be put to use.

As of now, there are three major hardware security measures Ubuntu 22.04 supports.

Intel’s Software Guard eXtensions (SGX) provides a secure and independent area to do sensitive computation. For example, password processing would ideally take place here, as it ensures that no other applications can access that data.

The next includes AMD’s Secure Encrypted Virtualization (SEV). This technology aims to prevent host operating systems from being able to interfere with running virtual machines.

Although this is not as relevant to desktop users as the other technologies, consider that a lot of data center infrastructure relies on virtual machines for containerizing applications. Overall, such hardware-specific security measures should enhance protection for both desktop and server users.

#### 2. Linux Kernel Security Improvements

With every Ubuntu release, Linux Kernel gets an upgrade with many useful features and support.

But, this time, Canonical introduced optimized kernel versions for different platforms. For OEM-certified desktop devices, [Linux Kernel 5.17][4] has been included.

And, for all desktop and server users, [Linux Kernel 5.15 LTS][5] will be the one active.

Not just limited to this concept, some essential kernel security enhancements mentioned in the [blog post][6] include:

* Support for [core scheduling][7], which allows processes to control which threads will be scheduled across SMT siblings and so can allow them to protect sensitive information from leaking to other untrusted processes on the system.
* Kernel stack randomisation provides a hardening measure to frustrate attackers wishing to perform memory corruption attacks within the kernel.
* The BPF subsystem has also seen a number of security enhancements including restricting its use to only privileged processes by default, as well as including the initial efforts to support signed BPF programs as well
* The inclusion of the new Landlock Linux Security Module provides another mechanism for application sandboxing to go along with the more traditional methods via either AppArmor or SELinux.

Collectively, all these improvements make Ubuntu 22.04 LTS a safer option for developers, users, and system administrators.

#### 3. Updated Security Packages

![][8]

Stepping back from technical security concepts, we get to a concept every Ubuntu user should be already familiar with: packages. With every new Ubuntu release, most packages in the repositories get updated, bringing improved security and new features.

Although not exactly something new to Ubuntu 22.04, this does include a lot of security-specific updates. A couple of examples of this include openSSL 3 and GCC 11.

#### 4. OpenSSL 3

OpenSSL is the backbone of all secure communications.

OpenSSL 3 is particularly interesting as a major upgrade considering many legacy algorithms have been deprecated and disabled by default – including MD2 and DES.

As a result, unless users specifically want to use the less secure algorithms, you will be getting the best security by default.

#### 5. GCC 11

GCC, on the other hand, is the compiler that many developers use to turn their code into programs that can be run on your computer.

It brings numerous improvements, but there is one in particular that significantly improves security. Static analysis, which has been significantly enhanced, allows developers to find software vulnerabilities faster, preventing vulnerable code from ever being released in the first place.

It may not affect users directly, many developers use Ubuntu to develop their applications. Therefore, a lot of the programs you download, even on non-Ubuntu systems, should be more secure than ever.

#### 6. Private Home Directories

![][9]

As a traditionally desktop-focused distribution, Ubuntu has often opted for convenience over security. However, as they push harder and harder for adoption in the cloud, this has had to change.

Previously, anyone with access to the computer could open and view any user’s home directory. However, as you can imagine, this presented a lot of problems for non-desktop users. Hence, the change to private home directories was required.

It may be slightly less convenient for multi-user systems, this can be changed relatively easily. And, for the less technically inclined, they get better security without having to do anything!

#### 7. nftables as the Default Firewall Backend

![][10]

For more than 25 years, firewalls have been a key part of keeping your computer isolated from the wider internet. During this time, Linux distros have generally used two different firewall solutions: iptables and xtables.

However, recently, a different solution has entered the scene: nftables. Offering significant performance and flexibility improvements, it allows network admins to better protect your device.

### Wrapping Up

Undoubtedly, a lot of good upgrades made it to Ubuntu 22.04 LTS. Not just limited to the user experience, but it is also a significant leap in terms of security.

Of course, there’s more to come, but the improvements mentioned above are good achievements!

For more technical details, you can check out [Ubuntu’s official blog post][11].

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/reasons-ubuntu-22-04-secure/

作者：[Jacob Crume][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/07/ubuntu-22-04-is-most-secure-release.jpg
[2]: https://news.itsfoss.com/ubuntu-22-04-release/
[3]: https://news.itsfoss.com/wp-content/uploads/2022/07/hardware-security-illustration-1024x576.jpg
[4]: https://news.itsfoss.com/linux-kernel-5-17-release/
[5]: https://news.itsfoss.com/linux-kernel-5-15-release/
[6]: https://ubuntu.com/blog/whats-new-in-security-for-ubuntu-22-04-lts
[7]: https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/core-scheduling.html
[8]: https://news.itsfoss.com/wp-content/uploads/2021/07/open-source-security-illustration-1024x576.png
[9]: https://news.itsfoss.com/wp-content/uploads/2021/04/private-home-directory-ubuntu-21.png
[10]: https://news.itsfoss.com/wp-content/uploads/2022/07/firewall-illustration-1024x576.jpg
[11]: https://ubuntu.com/blog/whats-new-in-security-for-ubuntu-22-04-lts
