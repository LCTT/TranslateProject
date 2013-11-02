10 Years of Xen: Transforming a Dinosaur Into a Bird 
================================================================================
Xen Hypervisor development started at [Cambridge University][1] as part of the [Xenoserver][2] research project in the late 90’s. The goal of Xenoserver was ambitious:

The Xenoserver project is building a public infrastructure for wide-area distributed computing. We envisage a world in which Xenoserver execution platforms will be scattered across the globe and available for any member of the public to submit code for execution. The sponsor of the code will be billed for all the resources used or reserved during the course of execution. This will serve to encourage load balancing, limit congestion, and hopefully even make the platform self-financing.

Today, this model of computing is called cloud computing. And the Xen Hypervisor was - and indeed is today - instrumental in enabling the biggest cloud in production. Not only are Amazon Web Services and Rackspace Public cloud based on Xen. New large deployments such as [Verizon Public Cloud][3] also chose Xen as basis for their offering.

### Happy 10th Birthday ###

On October 21st, 2003 at the [19th ACM Symposium on Operating Systems Principles][4] the Xen Hypervisor was first revealed as an open source project to the public. Exactly 10 years ago. Time to wish the project a Happy 10th Birthday!

### The Burden of being First : Or what happened to the Dinosaurs? ###

Sometimes being the first open source project in its field can become a burden. Why? Because, community problems can build up unchecked. The simple fact is that lack of competition can cause complacency. This is what happened to the Xen Project. For the first few years of its life the project operated without governance, became insular, didn’t promote itself and failed to engage its users and contributors. When its first open source competitor - KVM - gathered steam, the community was slow to respond and change.

The effect of all this was that it was difficult to join the project and that the project did not play well with the Linux kernel, QEMU and Linux distros. In the end, the Xen community got a bad reputation. Ultimately this resulted in Canonical and RedHat dropping Xen support in favour of KVM. Add to the mix a failure to tell the world, when things did change. The bad reputation lingered and eventually the project was seen as a dinosaur by the open source community and technology press. Destined to be extinct in the near future.

### Evolving fast : The Dinosaur becomes a Bird ###

Not many open source projects recover from mistakes like the ones the Xen community made. The Xen Project managed to do this, through a combination of introducing good governance, active efforts to collaborate with other open source projects, rebooting marketing efforts and actively working with users and contributors to the project. In other words, the project had to
Xen Project flying Panda

Let the Bird fly (or more correctly, give the Xen Project’s Panda wings).
transform itself from a Dinosaur to a Bird. If you want to know how we did this, why not attend my LinuxCon EU session called [Xen Project : Lessons Learned][5]? Other sessions you may want to attend are [Securing your Xen based Cloud][6] and [Xen: Open Source Hypervisor Designed for Clouds][7].

![](http://www.linux.com/images/stories/41373/Xen-flying-Panda.jpg)

*Let the Bird fly (or more correctly, give the Xen Project’s Panda wings).*

### A peek into the Future : New Frontiers in Virtualization ###

If you look at the Xen Project now, you will find that the community is diverse and growing. On many counts, it is bigger and more diverse than it has ever been. 

One of the interesting things that is happening in the Xen Community at the moment is adoption of the Xen Project’s software for non-traditional virtualization use-cases. This is mirroring a rise in activity by embedded companies in the Linux community in general. At the [Xen Project Developer Summit][8] later this week, we will see two Android VMs running on top of Xen on a Nexus 10, we will see first experiments in using Xen for In-Vehicle-Infotainment and automotive applications in general, and we will see how Xen can provide the high performance expected of hardware-based middlebox offerings such as firewalls and NATs. 

Of course, there is also plenty innovation in server virtualization and cloud. Let the Bird fly (or more correctly, give the Xen Project’s Panda wings).

--------------------------------------------------------------------------------

via: http://www.linux.com/news/enterprise/cloud-computing/743330-10-years-of-xen-transforming-a-dinosaur-into-a-bird/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.cl.cam.ac.uk/research/srg/netos/xen/index.html
[2]:http://www.cl.cam.ac.uk/research/srg/netos/xeno/
[3]:http://www.techweekeurope.co.uk/news/verizon-public-cloud-launch-128724
[4]:http://www.cs.rochester.edu/meetings/sosp2003/papers.shtml
[5]:http://linuxconcloudopeneu2013.sched.org/event/68003c370760bcc2da7e3e8b59b6b50f
[6]:http://linuxconcloudopeneu2013.sched.org/event/37ecfe02561cf264a02061d1927da26c
[7]:http://linuxconcloudopeneu2013.sched.org/event/bdca1274d9799646cdf2934dbde94ccd
[8]:http://www.linux.com/news/software/applications/742053-a-great-line-up-of-speakers-at-xen-project-developer-summit