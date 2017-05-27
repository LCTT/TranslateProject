How Microsoft is becoming a Linux vendor
=====================================


>Microsoft is bridging the gap with Linux by baking it into its own products.

![](http://images.techhive.com/images/article/2017/05/microsoft-100722875-large.jpg)


Linux and open source technologies have become too dominant in data centers, cloud and IoT for Microsoft to ignore them.

On Microsoft’s own cloud, one in three machines run Linux. These are Microsoft customers who are running Linux. Microsoft needs to support the platform they use, or they will go somewhere else. 

Here's how Microsoft's Linux strategy breaks down on its developer platform (Windows 10), on its cloud (Azure) and datacenter (Windows Server).

**Linux in Windows**: IT professionals managing Linux machines on public or private cloud need native UNIX tooling. Linux and macOS are the only two platforms that offer such native capabilities. No wonder all you see is MacBooks or a few Linux desktops at events like DockerCon, OpenStack Summit or CoreOS Fest.

To bridge the gap, Microsoft worked with Canonical to build a Linux subsystem within Windows that offers native Linux tooling. It’s a great compromise, where IT professionals can continue to use Windows 10 desktop while getting to run almost all Linux utilities to manage their Linux machines.

**Linux in Azure**: What good is a cloud that can’t run fully supported Linux machines? Microsoft has been working with Linux vendors that allow customers to run Linux applications and workloads on Azure.

Microsoft not only managed to sign deals with all three major Linux vendors Red Hat, SUSE and Canonical, it also worked with countless other companies to offer support for community-based distros like Debian.

**Linux in Windows Server**: This is the last missing piece of the puzzle. There is a massive ecosystem of Linux containers that are used by customers. There are over 900,000 Docker containers on Docker Hub, which can run only on Linux machines. Microsoft wanted to bring these containers to its own platform.

At DockerCon, Microsoft announced support for Linux containers on Windows Server bringing all those containers to Linux.

Things are about to get more interesting, after the success of Bash on Ubuntu on Windows 10, Microsoft is bringing Ubuntu bash to Windows Server. Yes, you heard it right. Windows Server will now have a Linux subsystem.

Rich Turner, Senior Program Manager at Microsoft told me, “WSL on the server provides admins with a preference for *NIX admin scripting & tools to have a more familiar environment in which to work.”

Microsoft said in an announcement that It will allow IT professionals “to use the same scripts, tools, procedures and container images they have been using for Linux containers on their Windows Server container host. These containers use our Hyper-V isolation technology combined with your choice of Linux kernel to host the workload while the management scripts and tools on the host use WSL.”

With all three bases covered, Microsoft has succeeded in creating an environment where its customers don't have to deal with any Linux vendor.

### What does it mean for Microsoft?

By baking Linux into its own products, Microsoft has become a Linux vendor. They are part of the Linux Foundation, they are one of the many contributors to the Linux kernel, and they now distribute Linux from their own store. 

There is only one minor problem. Microsoft doesn’t own any Linux technologies. They are totally dependent on an external vendor, in this case Canonical, for their entire Linux layer. Too risky a proposition, if Canonical gets acquired by a fierce competitor.

It might make sense for Microsoft to attempt to acquire Canonical and bring the core technologies in house. It makes sense. 

### What does it mean for Linux vendors

On the surface, it’s a clear victory for Microsoft as its customers can live within the Windows world. It will also contain the momentum of Linux in a datacenter. It might also affect Linux on the desktop as now IT professionals looking for *NIX tooling don’t have to run Linux desktop, they can do everything from within Windows.

Is Microsoft's victory a loss for traditional Linux vendors? To some degree, yes. Microsoft has become a direct competitor. But the clear winner here is Linux.

--------------------------------------------------------------------------------

via: http://www.cio.com/article/3197016/linux/how-microsoft-is-becoming-a-linux-vendor.html

作者：[ Swapnil Bhartiya ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.cio.com/author/Swapnil-Bhartiya/
