translated by toyijiu
The What, Why and Wow! Behind the CoreOS Container Linux
============================================================


![](https://cdn-images-1.medium.com/max/1600/1*znkOJQnw5_8Ko8VMEpRlpg.png)

#### Latest Linux distro automatically updates kernel software and gives full configuration control across clusters.

The usual debate over server Linux distributions begins with:

 _Do you use a _  [_Red Hat Enterprise Linux (RHEL)_][1]  _-based distribution, such as _  [_CentOS_][2]  _ or _  [_Fedora_][3]  _; a _  [_Debian_][4]  _-based Linux like _  [_Ubuntu_][5]  _; or _  [_SUSE_][6]  _?_ 

But now, [CoreOS Container Linux][7] joins the fracas. [CoreOS, recently offered by Linode on its servers][8], takes an entirely different approach than its more conventional, elder siblings.

So, you may be asking yourself: “Why should I bother, when there are so many other solid Linux distros?” Well, I’ll let Greg Kroah-Hartman, the kernel maintainer for the Linux-stable branch and CoreOS advisor, start the conversation:

> (CoreOS) handles distro updates (based on the ChromeOS code) combined with Docker and potentially checkpoint/restore, (which) means that you might be [able to update the distro under your application without stopping/starting the process/container.][9] I’ve seen it happen in testing, and it’s scary [good].”

And that assessment came when CoreOS was in alpha. Back then, [CoreOS was being developed in — believe it or not — a Silicon Valley garage][10]. While CoreOS is no Apple or HPE, it’s grown considerably in the last four years.

When I checked in on them at 2017’s [CoreOS Fest][11] in San Francisco, CoreOS had support from Google Cloud, IBM, Amazon Web Services, and Microsoft. The project itself now has over a thousand contributors. They think they’re on to something good, and I agree.

Why? Because, CoreOS is a lightweight Linux designed from the get-go for running containers. It started as a [Docker][12] platform, but over time CoreOS has taken its own path to containers. It now supports both its own take on containers, [rkt][13] (pronounced rocket), and Docker.

Unlike most Linux distributions, CoreOS doesn’t have a package manager. Instead it takes a page from Google’s ChromeOS and automates software updates to ensure better security and reliability of machines and containers running on clusters. Both operating system updates and security patches are regularly pushed to CoreOS Container Linux machines without sysadmin intervention.

You control how often patches are pushed using [CoreUpdate, with its web-based interface][14]. This enables you to control when your machines update, and how quickly an update is rolled out across your cluster.

Specifically, CoreOS does this with the the distributed configuration service [etcd][15]. This is an open-source, distributed key value store based on [YAML][16]. Etcd provides shared configuration and service discovery for Container Linux clusters.

This service runs on each machine in a cluster. When one server goes down, say to update, it handles the leader election so that the overall Linux system and containerized applications keep running as each server is updated.

To handle cluster management, [CoreOS used to use fleet][17]. This ties together [systemd][18] and etcd into a distributed init system. While fleet is still around, CoreOS has joined etcd with [Kubernetes][19] container orchestration to form an even more powerful management tool.

CoreOS also enables you to declaratively customize other operating system specifications, such as network configuration, user accounts, and systemd units, with [cloud-config][20].

Put it all together and you have a Linux that’s constantly self-updating to the latest patches while giving you full control over its configuration from individual systems to thousand of container instances. Or, as CoreOS puts it, “You’ll never have to run [Chef ][21]on every machine in order to change a single config value ever again.”

Let’s say you want to expand your DevOps control even further. [CoreOS helps you there, too, by making it easy to deploy Kubernetes][22].

So, what does all this mean? CoreOS is built from the ground-up to make it easy to deploy, manage and run containers. Yes, other Linux distributions, such as the Red Hat family with [Project Atomic][23], also enable you to do this, but for these distributions, it’s an add-on. CoreOS was designed from day one for containers.

If you foresee using containers in your business — and you’d better because [Docker and containers are fast becoming  _The Way_  to develop and run business applications][24] — then you must consider CoreOS Container Linux, no matter whether you’re running on bare-metal, virtual machines, or the cloud.

* * *

 _Please feel free to share below any comments or insights about your experience with or questions about CoreOS. And if you found this blog useful, please consider sharing it through social media._ 

* * *

 _About the blogger: Steven J. Vaughan-Nichols is a veteran IT journalist whose estimable work can be found on a host of channels, including _  [_ZDNet.com_][25]  _, _  [_PC Magazine_][26]  _, _  [_InfoWorld_][27]  _, _  [_ComputerWorld_][28]  _, _  [_Linux Today_][29]  _ and _  [_eWEEK_][30]  _. Steven’s IT expertise comes without parallel — he has even been a Jeopardy! clue. And while his views and cloud situations are solely his and don’t necessarily reflect those of Linode, we are grateful for his contributions. He can be followed on Twitter (_  [_@sjvn_][31]  _)._

--------------------------------------------------------------------------------

via: https://medium.com/linode-cube/the-what-why-and-wow-behind-the-coreos-container-linux-fa7ceae5593c

作者：[Steven J. Vaughan-Nichols ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/linode-cube/the-what-why-and-wow-behind-the-coreos-container-linux-fa7ceae5593c
[1]:https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
[2]:https://www.centos.org/
[3]:https://getfedora.org/
[4]:https://www.debian.org/
[5]:https://www.ubuntu.com/
[6]:https://www.suse.com/
[7]:https://coreos.com/os/docs/latest
[8]:https://www.linode.com/docs/platform/use-coreos-container-linux-on-linode
[9]:https://plus.google.com/+gregkroahhartman/posts/YvWFmPa9kVf
[10]:https://www.wired.com/2013/08/coreos-the-new-linux/
[11]:https://coreos.com/fest/
[12]:https://www.docker.com/
[13]:https://coreos.com/rkt
[14]:https://coreos.com/products/coreupdate/
[15]:https://github.com/coreos/etcd
[16]:http://yaml.org/
[17]:https://github.com/coreos/fleet
[18]:https://www.freedesktop.org/wiki/Software/systemd/
[19]:https://kubernetes.io/
[20]:https://coreos.com/os/docs/latest/cloud-config.html
[21]:https://insights.hpe.com/articles/what-is-chef-a-primer-for-devops-newbies-1704.html
[22]:https://blogs.dxc.technology/2017/06/08/coreos-moves-in-on-cloud-devops-with-kubernetes/
[23]:http://www.projectatomic.io/
[24]:http://www.zdnet.com/article/what-is-docker-and-why-is-it-so-darn-popular/
[25]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[26]:http://www.pcmag.com/author-bio/steven-j.-vaughan-nichols
[27]:http://www.infoworld.com/author/Steven-J.-Vaughan_Nichols/
[28]:http://www.computerworld.com/author/Steven-J.-Vaughan_Nichols/
[29]:http://www.linuxtoday.com/author/Steven+J.+Vaughan-Nichols/
[30]:http://www.eweek.com/cp/bio/Steven-J.-Vaughan-Nichols/
[31]:http://www.twitter.com/sjvn
