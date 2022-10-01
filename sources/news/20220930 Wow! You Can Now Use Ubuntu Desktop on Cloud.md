[#]: subject: "Wow! You Can Now Use Ubuntu Desktop on Cloud"
[#]: via: "https://news.itsfoss.com/ubuntu-amazon-workspaces/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Wow! You Can Now Use Ubuntu Desktop on Cloud
======
Looking for a managed Ubuntu virtual desktop session on AWS? Now, it is available to try!

![Wow! You Can Now Use Ubuntu Desktop on Cloud][1]

[Amazon WorkSpaces][2] is a fully managed virtual desktop service that caters to enterprises and individuals looking to eliminate the hassle of maintaining, scaling, and managing specific hardware for work.

Unfortunately, they did not have Ubuntu as one of their offerings.

So, they partnered with Canonical to add an option for Ubuntu-based desktops.

### Ubuntu as a Managed Virtual Desktop

![ubuntu amazon workspace][3]

Amazon WorkSpaces previously had Windows and [Amazon Linux][4]-based machines.

It is a fully managed VDI (Virtual Desktop Infrastructure) service that lets enterprises set up a new virtual desktop in a matter of minutes in a very cost and time-effective manner.

Adding Ubuntu as an option should help thousands of developers and enterprises.

[Sébastien][5] (**Principal Developer Advocate @AWS**) gives an excellent example of how useful this can be:

It is one of the most widely-used Linux distros and should appeal to many developers who use Ubuntu as their primary operating system to carry out development projects.

It should help DevOps engineers, academic institutions, remote workers, and more.

Canonical [mentions][6]:

On launch, they are offering Ubuntu 22.04 LTS 'Jammy Jellyfish'.

They have collaborated with [Canonical][9]to optimize the distro for cloud development and included the **AWS CLI and SDK**.

### How to Create Ubuntu Amazon WorkSpace?

![ubuntu amazon workspace][10]

A few simple steps are to be followed to create an Ubuntu-based Amazon WorkSpace instance.

First and foremost, you need to have an existing Amazon VPC server with at least two subnets.

Then, sign in to the [Amazon WorkSpaces console][11], set up an active directory, and add new users with their relevant info.

Now, on the '**Select Bundle**' page, select one of the 'Ubuntu Linux' options according to your use case.

After setup is complete, users will automatically receive an email with all the essential details needed to access the Ubuntu-based Amazon WorkSpace instance.

Additionally, if you are an individual or a small group of developers, you can use the "**Quick Setup**" option in the WorkSpace console to quickly set up an Ubuntu-based virtual desktop.

For more details on the installation steps, you can refer to the [official documentation][12] and [AWS's announcement post][13].

### Pricing and Availability

The Ubuntu-based Amazon WorkSpace bundle starts from **$23 per month or $0.18 per hour**.

Pricing changes according to the region, with the cheapest options being 'US West' and 'US East'.

Ubuntu-based virtual desktops are available across the globe, with servers being made available in the US, Africa, Asia Pacific, Canada, Europe, and South America.

*💬 What do you think of this? Will you use the cloud to access Ubuntu for work from now on?*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/ubuntu-amazon-workspaces/

作者：[Sourav Rudra][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/09/aws-adds-ubuntu-as-virtual-desktop-solution.png
[2]: https://aws.amazon.com/workspaces/
[3]: https://news.itsfoss.com/content/images/2022/09/ubuntu-aws-virtual.png
[4]: https://news.itsfoss.com/amazon-linux-2022-preview/
[5]: https://twitter.com/sebsto
[6]: https://ubuntu.com/blog/ubuntu-desktop-on-amazon-workspaces
[9]: https://canonical.com/
[10]: https://news.itsfoss.com/content/images/2022/09/ubuntu-aws-remote.png
[11]: https://console.aws.amazon.com/workspaces/
[12]: https://docs.aws.amazon.com/workspaces/
[13]: https://aws.amazon.com/blogs/aws/amazon-workspaces-introduces-ubuntu-desktops/
