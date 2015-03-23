Red Hat Developer Toolset 3.1 beta arrives
================================================================================
> **Summary**:Want the newest developer tools for Red Hat Enterprise Linux 6 or 7? The beta's ready for you now.

It's one of those eternal problems between developers and operators that even [DevOps][1] can't entirely solve. System administrators want the most stable operating system possible, while programmers want the latest and greatest development tools. [Red Hat][2]'s solution for this dilemma has been to take those brand spanking-new tools, test them out on the latest stable [Red Hat Enterprise Linux (RHEL)][3], and then release them to developers.

![Red Hat Developer Toolset](http://zdnet4.cbsistatic.com/hub/i/2015/03/18/d92b1067-6b36-4ff0-ac9e-608fbe3e8c5d/ae80362df5401a37e3cbcd2598f33370/rhel-dev-tools.png)
Red Hat Developer Toolset

So it is that Red Hat has just announced its latest toys for developers, [Red Hat Developer Toolset 3.1][4]. This packaging of the hottest new tools is now available in beta. 

This update includes: 

[GNUCompiler Collection (GCC) 4.9][5]: the latest stable upstream version of GCC, which provides numerous improvements and bug fixes

[Eclipse 4.4.1][6]: with support for Java 8 and updated versions of Eclipse CDT (8.5), Eclipse Linux Tools (3.1), Eclipse Mylyn (3.14), and Eclipse Egit/Jgit (3.6.1)

Numerous additional updated packages: These include GDB 7.8.2, elfutils 0.161, memstomp 0.1.5, SystemTap 2.6, Valgrind 3.10.1, Dyninst 8.2.1, and ltrace 0.7.91.

With these development programs, you'll be able to create applications for RHEL 6 and 7.x. These apps will then run on RHEL regardless of whether you're running it on a physical, virtual or cloud environments. They will also run on Red Hat's [OpenShift][7], its Platform-as-a-Service (PaaS) offering.

This new set of developer programs includes packages for both RHEL 7 and 7 running on [AMD64 and Intel 64 architectures][8]. Although the tools are 64-bit you can use them to create and modify 32-bit binaries. 

Before you try running any of these programs, you should patch RHEL with all the latest updates. To install the beta Toolset, your systems need to be subscribed to the Optional channel to access all the required Red Hat Developer Toolset tool-chain packages. 

In addition, if you've installed earlier Toolkits you may run into some [problems while installing Toolkit 3.1][9]. While these difficulties are easy enough to fix, you should go over these possible hiccups before trying to install the new Toolkit. 

Finally, you may notice that some of the most exciting of the new tools, such as Docker, Kubernetes, and other container tools aren't here. That's because they're in the newly released [RHEL 7.1][10] and [Red Hat Enterprise Linux 7 Atomic Host (RHELAH)][11]. [Red Hat has partnered with Docker][12], but you'll need to move to a Docker-friendly version of RHEL to get at these container-friendly programs.

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/red-hat-developer-toolset-3-1-beta-arrives/

作者：[Steven J. Vaughan-Nichols][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.zdnet.com/meet-the-team/us/sjvn/
[1]:http://blogs.csc.com/2015/02/03/devops-theory-for-beginners/
[2]:http://www.redhat.com/en
[3]:http://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
[4]:http://www.redhat.com/en/about/blog/red-hat-developer-toolset-31-beta-now-available
[5]:https://gcc.gnu.org/gcc-4.9/
[6]:https://projects.eclipse.org/projects/eclipse/releases/4.4.1
[7]:https://www.openshift.com/
[8]:https://access.redhat.com/documentation/en-US/Red_Hat_Developer_Toolset/3-Beta/html/3.1_Release_Notes/System_Requirements.html
[9]:https://access.redhat.com/documentation/en-US/Red_Hat_Developer_Toolset/3-Beta/html/3.1_Release_Notes/DTS3.1_Release.html#Known_Issues
[10]:http://www.zdnet.com/article/red-hat-7-1-is-here-centos-7-1-is-coming-soon/
[11]:http://www.zdnet.com/article/red-hat-buys-into-docker-containers-with-atomic-host/
[12]:http://www.zdnet.com/article/red-hat-partners-with-docker-to-create-linuxdocker-software-stack/