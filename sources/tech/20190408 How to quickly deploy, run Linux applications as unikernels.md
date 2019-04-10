[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to quickly deploy, run Linux applications as unikernels)
[#]: via: (https://www.networkworld.com/article/3387299/how-to-quickly-deploy-run-linux-applications-as-unikernels.html#tk.rss_all)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to quickly deploy, run Linux applications as unikernels
======
Unikernels are a smaller, faster, and more secure option for deploying applications on cloud infrastructure. With NanoVMs OPS, anyone can run a Linux application as a unikernel with no additional coding.
![Marcho Verch \(CC BY 2.0\)][1]

Building and deploying lightweight apps is becoming an easier and more reliable process with the emergence of unikernels. While limited in functionality, unikernals offer many advantages in terms of speed and security.

### What are unikernels?

A unikernel is a very specialized single-address-space machine image that is similar to the kind of cloud applications that have come to dominate so much of the internet, but they are considerably smaller and are single-purpose. They are lightweight, providing only the resources needed. They load very quickly and are considerably more secure -- having a very limited attack surface. Any drivers, I/O routines and support libraries that are required are included in the single executable. The resultant virtual image can then be booted and run without anything else being present. And they will often run 10 to 20 times faster than a container.

**[ Two-Minute Linux Tips:[Learn how to master a host of Linux commands in these 2-minute video tutorials][2] ]**

Would-be attackers cannot drop into a shell and try to gain control because there is no shell. They can't try to grab the system's /etc/passwd or /etc/shadow files because these files don't exist. Creating a unikernel is much like turning your application into its own OS. With a unikernel, the application and the OS become a single entity. You omit what you don't need, thereby removing vulnerabilities and improving performance many times over.

In short, unikernels:

  * Provide improved security (e.g., making shell code exploits impossible)
  * Have much smaller footprints then standard cloud apps
  * Are highly optimized
  * Boot extremely quickly



### Are there any downsides to unikernels?

The only serious downside to unikernels is that you have to build them. For many developers, this has been a giant step. Trimming down applications to just what is needed and then producing a tight, smoothly running application can be complex because of the application's low-level nature. In the past, you pretty much had to have been a systems developer or a low level programmer to generate them.

### How is this changing?

Just recently (March 24, 2019) [NanoVMs][3] announced a tool that loads any Linux application as a unikernel. Using NanoVMs OPS, anyone can run a Linux application as a unikernel with no additional coding. The application will also run faster, more safely and with less cost and overhead.

### What is NanoVMs OPS?

NanoVMs is a unikernel tool for developers. It allows you to run all sorts of enterprise class software yet still have extremely tight control over how it works.

**[[Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][4] ]**

Other benefits associated with OPS include:

  * Developers need no prior experience or knowledge to build unikernels.
  * The tool can be used to build and run unikernels locally on a laptop.
  * No accounts need to be created and only a single download and one command is required to execute OPS.



An intro to NanoVMs is available on [NanoVMs on youtube][5]. You can also check out the company's [LinkedIn page][6] and can read about NanoVMs security [here][7].

Here is some information on how to [get started][8].

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3387299/how-to-quickly-deploy-run-linux-applications-as-unikernels.html#tk.rss_all

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/04/corn-kernels-100792925-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://nanovms.com/
[4]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[5]: https://www.youtube.com/watch?v=VHWDGhuxHPM
[6]: https://www.linkedin.com/company/nanovms/
[7]: https://nanovms.com/security
[8]: https://nanovms.gitbook.io/ops/getting_started
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
