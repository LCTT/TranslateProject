红帽开发者工具集3.1测试版发布了
================================================================================
> **摘要**：想要试试最新的红帽企业版Linux 6/7的开发者工具？测试版已经发布啦。

这是[DevOps][1]也不能完全解决的程序员和系统管理员之间永恒的问题之一。系统管理员想要最稳定的操作系统，而程序员想要最新最棒的开发工具。[红帽公司][2]对这个两难问题的解决方法就是用最新的稳定版[Red Hat Enterprise Linux (RHEL)][3]去测试这些新品牌工具，然后向开发者发布。

![红帽开发者工具集](http://zdnet4.cbsistatic.com/hub/i/2015/03/18/d92b1067-6b36-4ff0-ac9e-608fbe3e8c5d/ae80362df5401a37e3cbcd2598f33370/rhel-dev-tools.png)

*红帽开发者工具集*

红帽刚刚公布了给开发者的最新玩具：[红帽开发者工具集 3.1][4]。现在可以获得这些最热门工具包的测试版了。

这次更新包括：

[GNUCompiler Collection (GCC) 4.9][5]: 最新的GCC上游稳定版本，提供多处改进和bug修复。

[Eclipse 4.4.1][6]: 支持Java 8 以及更新的Eclipse CDT(8.5)版本，Eclipse Linux Tools (3.1), Eclipse Mylyn (3.14), 和 Eclipse Egit/Jgit (3.6.1)

众多额外的更新包： 包括 GDB 7.8.2, elfutils 0.161, memstomp 0.1.5, SystemTap 2.6, Valgrind 3.10.1, Dyninst 8.2.1, 以及 ltrace 0.7.91.

用这些开发工具，你可以给RHEL 6 和 7.x 开发应用程序。这些应用程序可以在RHEL上运行，不管是物理机，虚拟机还是云环境。它们也可以在红帽提供的Platform-as-a-Service (PaaS)服务[OpenShift][7]上运行。

这些新的开发者程序集包括可以运行在[AMD64 和 Intel 64 架构][8]上RHEL 7的包。尽管这些工具都是64位的，你也可以用它们创建或者修改32位的二进制文件。

在运行任何这些程序之前，你应该安装RHEL所有最近的更新。要安装这个测试工具集，你的系统需要订阅“可选渠道”来获取所有红帽开发者工具集需要的工具链包。

另外，如果已经安装了早期版本的工具集，可能会遇到[安装Toolkit 3.1 时的一些问题][9]。尽管这些问题很容易解决，在安装新的工具集之前还是应该大概看一下这些可能出现的问题。

最后，你可能注意到一些最令人激动的工具，例如 Docker，Kubernetes以及其它容器工具并没有提供。因为它们在最新的发行版[RHEL 7.1][10] 和 [Red Hat Enterprise Linux 7 Atomic Host (RHELAH)][11]中。[红帽和Docker已成为合作伙伴][12]，要获取这些支持容器的程序，你需要转换到支持Docker的RHEL版本上来。

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/red-hat-developer-toolset-3-1-beta-arrives/

作者：[Steven J. Vaughan-Nichols][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

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