[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The modern data center and the rise in open-source IP routing suites)
[#]: via: (https://www.networkworld.com/article/3396136/the-modern-data-center-and-the-rise-in-open-source-ip-routing-suites.html)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

The modern data center and the rise in open-source IP routing suites
======
Open source enables passionate people to come together and fabricate work of phenomenal quality. This is in contrast to a single vendor doing everything.
![fdecomite \(CC BY 2.0\)][1]

As the cloud service providers and search engines started with the structuring process of their business, they quickly ran into the problems of managing the networking equipment. Ultimately, after a few rounds of getting the network vendors to understand their problems, these hyperscale network operators revolted.

Primarily, what the operators were looking for was a level of control in managing their network which the network vendors couldn’t offer. The revolution burned the path that introduced open networking, and network disaggregation to the work of networking. Let us first learn about disaggregation followed by open networking.

### Disaggregation

The concept of network disaggregation involves breaking-up of the vertical networking landscape into individual pieces, where each piece can be used in the best way possible. The hardware can be separated from the software, along with open or closed IP routing suites. This enables the network operators to use the best of breed for the hardware, software and the applications.

**[ Now see[7 free network tools you must have][2]. ]**

Networking has always been built as an appliance and not as a platform. The mindset is that the network vendor builds an appliance and as a specialized appliance, they will completely control what you can and cannot do on that box. In plain words, they will not enable anything that is not theirs. As a result, they act as gatekeepers and not gate-enablers.

Network disaggregation empowers the network operators with the ability to lay hands on the features they need when they need them. However, this is impossible in case of non-disaggregated hardware.

### Disaggregation leads to using best-of-breed

In the traditional vertically integrated networking market, you’re forced to live with the software because you like the hardware, or vice-versa. But network disaggregation drives different people to develop things that matter to them. This allows multiple groups of people to connect, with each one focused on doing what he or she does the best. Switching silicon manufacturers can provide the best merchant silicon. Routing suites can be provided by those who are the best at that. And the OS vendors can provide the glue that enables all of these to work well together.

With disaggregation, people are driven to do what they are good at. One company does the hardware, whereas another does the software and other company does the IP routing suites. Hence, today the networking world looks like more of the server world.

### Open source

Within this rise of the modern data center, there is another element that is driving network disaggregation; the notion of open source. Open source is “denoting software for which the original source code is made freely available, it may be redistributed and modified.” It enables passionate people to come together and fabricate work of phenomenal quality. This is in contrast to a single vendor doing everything.

As a matter of fact, the networking world has always been very vendor driven. However, the advent of open source gives the opportunity to like-minded people rather than the vendor controlling the features. This eliminates the element of vendor lock-in, thereby enabling interesting work. Open source allows more than one company to be involved.

### Open source in the data center

The traditional enterprise and data center networks were primarily designed by bridging and Spanning Tree Protocol (STP). However, the modern data center is driven by IP routing and the CLOS topology. As a result, you need a strong IP routing suite.

That was the point where the need for an open-source routing suite surfaced, the suite that can help drive the modern data center. The primary open-source routing suites are [FRRouting (FRR)][3], BIRD, GoBGP and ExaBGP.

Open-source IP routing protocol suites are slowly but steadily gaining acceptance and are used in data centers of various sizes. Why? It is because they allow a community of developers and users to work on finding solutions to common problems. Open-source IP routing protocol suites equip them to develop the specific features that they need. It also helps the network operators to create simple designs that make sense to them, as opposed to having everything controlled by the vendor. They also enable routing suites to run on compute nodes. Kubernetes among others uses this model of running a routing protocol on a compute node.

Today many startups are using FRR. Out of all of the IP routing suites, FRR is preferred in the data center as the primary open-source IP routing protocol suite. Some traditional network vendors have even demonstrated the use of FRR on their networking gear.

There are lots of new features currently being developed for FRR, not just by the developers but also by the network operators.

### Use cases for open-source routing suites

When it comes to use-cases, where do IP routing protocol suites sit? First and foremost, if you want to do any type of routing in the disaggregated network world, you need an IP routing suite.

Some operators are using FRR at the edge of the network as well, thereby receiving full BGP feeds. Many solutions which use Intel’s DPDK for packet forwarding use FRR as the control plane, receiving full BGP feeds. In addition, there are other vendors using FRR as the core IP routing suite for a full leaf and spine data center architecture. You can even get a version of FRR on pfSense which is a free and open source firewall.

We need to keep in mind that reference implementations are important. Open source allows you to test at scale. But vendors don’t allow you to do that. However, with FRR, we have the ability to spin up virtual machines (VMs) or even containers by using software like Vagrant to test your network. Some vendors do offer software versions, but they are not fully feature-compatible.

Also, with open source you do not need to wait. This empowers you with flexibility and speed which drives the modern data center.

### Deep dive on FRRouting (FRR)

FRR is a Linux foundation project. In a technical Linux sense, FRR is a group of daemons that work together, providing a complete routing suite that includes BGP, IS-IS, LDP, OSPF, BFD, PIM, and RIP.

Each one of these daemons communicate with the common routing information base (RIB) daemon called Zebra in order to interface with the OS and to resolve conflicts between the multiple routing protocols providing the same information. Interfacing with the OS is used to receive the link up/down events, to add and delete routes etc.

### FRRouting (FRR) components: Zebra

Zebra is the RIB of the routing systems. It knows everything about the state of the system relevant to routing and is able to pass and disseminate this information to all the interested parties.

The RIB in FRR acts just like a traditional RIB. When a route wins, it goes into the Linux kernel data plane where the forwarding occurs. All of the routing protocols run as separate processes and each of them have their source code in FRR.

For example, when BGP starts up, it needs to know, for instance, what kind of virtual routing and forwarding (VRF) and IP interfaces are available. Zebra collects and passes this information back to the interested daemons. It passes all the relevant information about state of the machine.

Furthermore, you can also register information with Zebra. For example, if a particular route changes, the daemon can be informed. This can also be used for reverse path forwarding (RPF). FRR doesn't need to do a pull when changes happen on the network.

There are a myriad of ways through which you can control Linux and the state. Sometimes you have to use options like the Netlink bus and sometimes you may need to read the state in proc file system of Linux. The goal of Zebra is to gather all this data for the upper level protocols.

### FRR supports remote data planes

FRR also has the ability to manage the remote data planes. So, what does this mean? Typically, the data forwarding plane and the routing protocols run on the same box. Another model, adopted by Openflow and SDN for example, is one in which the data forwarding plane can be on one box while FRR runs on a different box on behalf of the first box and pushes the computed routing state on the first box. In other words, the data plane and the control plane run on different boxes.

If you examine the traditional world, it’s like having one large chassis with different line cards with the ability to install routes in those different line cards. FRR operates with the same model which has one control plane and the capability to offer 3 boxes, if needed. It does this via the forwarding plane manager.

### Forwarding plane manager

Zebra can either install routes directly into the data plane of the box it is running on or use a forwarding plane manager to install routes on a remote box. When it installs a route, the forwarding plane manager abstracts the data which displays the route and the next hops. It then pushes the data to a remote system where the remote machine processes it and programs the ASIC appropriately.

After the data is abstracted, you can use whatever protocol you want in order to push the data to the remote machine. You can even include the data in an email.

### What is holding people back from open source?

Since last 30 years the networking world meant that you need to go to a vendor to solve a problem. But now with open-source routing suites, such as, FRR, there is a major drift in the mindset as to how you approach troubleshooting.

This causes the fear of not being able to use it properly because with open source you are the one who has to fix it. This at first can be scary and daunting. But it doesn’t necessarily have to be. Also, to switch to FRR on a traditional network gear, you need the vendor to enable it, but they may be reluctant as they are on competing platforms which can be another road blocker.

### The future of FRR

If we examine FRR from the use case perspective of the data center, FRR is feature-complete. Anyone building an IP based data center FRR has everything available. The latest 7.0 release of FRR adds Yang/NetConf, BGP Enhancements and OpenFabric.

FRR is not just about providing features, boosting the performance or being the same as or better than the traditional network vendor’s software, it is also about simplifying the process for the end user.

Since the modern data center is focused on automation and ease of use, FRR has made such progress that the vendors have not caught up with. FRR is very automation friendly. For example, FRR takes BGP and makes it automation-friendly without having to change the protocol. It supports BGP unnumbered that is unmatched by any other vendor suite. This is where the vendors are trying to catch up.

Also, while troubleshooting, FRR shows peer’s and host’s names and not just the IP addresses. This allows you to understand without having spent much time. However, vendors show the peer’s IP addresses which can be daunting when you need to troubleshoot.

FRR provides the features that you need to run an efficient network and data center. It makes easier to configure and manage the IP routing suite. Vendors just add keep adding features over features whether they are significant or not. Then you need to travel the certification paths that teach you how to twiddle 20 million nobs. How many of those networks are robust and stable?

FRR is about supporting features that matter and not every imaginable feature. FRR is an open source project that brings like-minded people together, good work that is offered isn’t turned away. As a case in point, FRR has an open source implementation of EIGRP.

The problem surfaces when you see a bunch of things, you think you need them. But in reality, you should try to keep the network as simple as possible. FRR is laser-focused on the ease of use and simplifying the use rather than implementing features that are mostly not needed to drive the modern data center.

For more information and to contribute, why not join the [FRR][4] [mailing list group][4].

**This article is published as part of the IDG Contributor Network.[Want to Join?][5]**

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3396136/the-modern-data-center-and-the-rise-in-open-source-ip-routing-suites.html

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/12/modular_humanoid_polyhedra_connections_structure_building_networking_by_fdecomite_cc_by_2-0_via_flickr_1200x800-100782334-large.jpg
[2]: https://www.networkworld.com/article/2825879/7-free-open-source-network-monitoring-tools.html
[3]: https://frrouting.org/community/7.0-launch.html
[4]: https://frrouting.org/#participate
[5]: /contributor-network/signup.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
