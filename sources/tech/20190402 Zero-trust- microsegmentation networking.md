[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Zero-trust: microsegmentation networking)
[#]: via: (https://www.networkworld.com/article/3384748/zero-trust-microsegmentation-networking.html#tk.rss_all)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

Zero-trust: microsegmentation networking
======

### Microsegmentation gives administrators the control to set granular policies in order to protect the application environment.

![Aaron Burson \(CC0\)][1]

The transformation to the digital age has introduced significant changes to the cloud and data center environments. This has compelled the organizations to innovate more quickly than ever before. This, however, brings with it both – the advantages and disadvantages.

The network and security need to keep up with this rapid pace of change. If you cannot match with the speed of the [digital age,][2] then ultimately bad actors will become a hazard. Therefore, the organizations must move to a [zero-trust environment][3]: default deny, with least privilege access. In today’s evolving digital world this is the primary key to success.

Ideally, a comprehensive solution must provide protection across all platforms including legacy servers, VMs, services in public clouds, on-premise, off-premise, hosted, managed or self-managed. We are going to stay hybrid for a long time, therefore we need to equip our architecture with [zero-trust][4].

**[ Don’t miss[customer reviews of top remote access tools][5] and see [the most powerful IoT companies][6] . | Get daily insights by [signing up for Network World newsletters][7]. ]**

We need to have the ability to support all of these hybrid environments that can analyze at a process, flow data, and infrastructure level. As a matter of fact, there is never just one element to analyze within a network in order to create an effective security posture.

To adequately secure such an environment requires a solution with key components: such as appropriate visibility, microsegmentation, and breach detection. Let's learn more about one of these primary elements: zero-trust microsegmentation networking.

There are a variety of microsegmentation vendors, all with competing platforms. We have, for example, SDN-based, container-centric, network-based appliance be it physical or virtual, and container-centric to name just a few.

## What is microsegmentation?

Microsegmentation is the ability to put a wrapper around the access control for each component of an application. The traditional days are gone where we can just impose a block on source/destination/port numbers or higher up in the stack with protocols, such as HTTP or HTTPS.

As the communication patterns become more complex, thereby isolating the communication flows between entities, hence following the microsegmentation principles has become a necessity.

## Why is microsegmentation important?

Microsegmentation gives administrators the control to set granular policies in order to protect the application environment. It defines the rules and policies as to how an application can communicate within its tier. The policies are granular (a lot more granular than what we had before), which restrict the communication to hosts that are only allowed to communicate.

Eventually, this reduces the available attack surface and completely locks down the ability for the bad actors to move laterally within the application infrastructure. Why? Because it governs the application’s activity at a granular level, thereby improving the entire security posture. The traditional zone-based networking no longer cuts it in today’s [digital world][8].

## General networking

Let's start with the basics. We all know that with security, you are only as strong as your weakest link. As a result, enterprises have begun to further segment networks into microsegments. Some call them nanosegments.

But first, let’s recap on what we actually started within the initial stage- nothing! We had IP addresses that were used for connectivity but unfortunately, they have no built-in authentication mechanism. Why? Because it wasn't a requirement back then.

Network connectivity based on network routing protocols was primarily used for sharing resources. A printer, 30 years ago, could cost the same as a house, so connectivity and the sharing of resources were important. The authentication of the communication endpoints was not considered significant.

## Broadcast domains

As networks grew in size, virtual LANs (VLANs) were introduced to divide the broadcast domains and improve network performance. A broadcast domain is a logical division of a computer network. All nodes can reach each other by sending a broadcast at the data link layer. When the broadcast domain swells, the network performance takes a hit.

Over time the role of the VLAN grew to be used as a security tool but it was never meant to be in that space. VLANs were used to improve performance, not to isolate the resources. The problem with VLANs is that there is no intra VLAN filtering. They have a very broad level of access and trust. If bad actors gain access to one segment in the zone, they should not be allowed to try and compromise another device within that zone, but with VLANs, this is a strong possibility.

Hence, VLAN offers the bad actor a pretty large attack surface to play with and move across laterally without inspection. Lateral movements are really hard to detect with traditional architectures.

Therefore, enterprises were forced to switch to microsegmentation. Microsegmentation further segments networks within the zone. On the contrary, the whole area of virtualization complicates the segmentation process. A virtualized server may only have a single physical network port but it supports numerous logical networks where services and applications reside across multiple security zones.

Thus, microsegmentation needs to work at both; the physical network layer as well as within the virtualized networking layer. As you are aware, there has been a change in the traffic pattern. The good thing about microsegmentation is that it controls both; the “north & south” and also the “east & west” movement of traffic, further isolating the size of broadcast domains.

## Microsegmentation – a multi-stage process

Implementing microsegmentation is a multi-stage process. There are certain prerequisites that must be followed before the implementation. Firstly, you need to fully understand the communication patterns, map the flows and all the application dependencies.

Once this is done, it's only then you can enable microsegmentation in a platform-agnostic manner across all the environments. Segmenting your network appropriately creates a dark network until the administrator turns on the lights. Authentication is performed first and then access is granted to the communicating entities operating with zero-trust with least privilege access.

Once you are connecting the entities, they need to run through a number of technologies in order to be fully connected. There is not a once-off check with microsegmentation. It’s rather a continuous process to make sure that both entities are doing what they are supposed to do.

This ensures that everyone is doing what they are entitled to do. You want to reduce the unnecessary cross-talk to an absolute minimum and only allow communication that is a complete necessity.

## How do you implement microsegmentation?

Firstly, you need strong visibility not just at the traffic flow level but also at the process and data contextual level. Without granular application visibility, it's impossible to map and fully understand what is normal traffic flow and irregular application communication patterns.

Visibility cannot be mapped out manually, as there could be hundreds of workloads. Therefore, an automatic approach must be taken. Manual mapping is more prone to errors and is inefficient. The visibility also needs to be in real-time. A static snapshot of the application architecture, even if it's down to a process level, will not tell you anything about the behaviors that are sanctioned or unsanctioned.

You also need to make sure that you, not under-segmenting, similar to what we had in the old days. Primarily, microsegmentation must manage communication workflows all the way up to Layer 7 of the Open Systems Interconnection (OSI) layer. Layer 4 microsegmentation only focuses on the Transport layer. If you are only segmenting the network at Layer 4 then you are widening your attack surface, thereby opening the network to be compromised.

Segmenting right up to the application layer means you are locking down the lateral movements, open ports, and protocols. It enables you to restrict access to the source and destination process rather than source and destination port numbers.

## Security issues with hybrid cloud

Since the [network perimeter][9] has been removed, therefore, it has become difficult to bolt the traditional security tools. Traditionally, we could position a static perimeter around the network infrastructure. However, this is not an available option today as we have a mixture of containerized applications, for example, a legacy database server. We have legacy communicating to the containerized land.

Hybrid enables organizations to use different types of cloud architects to include the on-premise and new technologies, such as containers. We are going to have a hybrid cloud in coming times which will change the way we think about networking. Hybrid forces the organizations to rethink about the network architectures.

When you attach the microsegment policies around the workload itself, then the policies will go with the workload. Then it would not matter if the entity moves to the on-premise or to the cloud. If the workload auto scales up and down or horizontally, the policy needs to go with the workload. Even if you go deeper than the workload, into the process level, you can set even more granular controls for microsegmentation.

## Identity

However, this is the point where identity becomes a challenge. If things are scaling and becoming dynamic, you can’t tie policies to the IP addresses. Rather than using IP addresses as the base for microsegmentation, policies are based on the logical (not physical) attributes.

With microsegmentation, the workload identity is based on logical attributes, such as the multi-factor authentication (MFA), transport layer security (TLS) certificate, the application service, or the use of a logical label associated with the workload.

These are what are known as logical attributes. Ultimately the policies map to the IP addresses but these are set by using the logical attributes, not the physical ones. As we progress in this technological era, the IP address is less relevant now. Named data networking is one of the perfect examples.

Other identity methods for microsegmentation are TLS certificates. If the traffic is encrypted with a different TLS certificate or from an invalid source, it automatically gets dropped, even if it comes from the right location. It will get blocked as it does not have the right identity.

You can even extend that further and look inside the actual payload. If an entity is trying to do a hypertext transfer protocol (HTTP) post to a record and if it tries to perform any other operation, it will get blocked.

## Policy enforcement

Practically, all of these policies can be implemented and enforced in different places throughout the network. However, if you enforce in only one place, that point in the network can become compromised and become an entry door to the bad actor. You can, for example, enforce in 10 different network points, even if you subvert in 2 of them the other 8 will still protect you.

Zero-trust microsegmentation ensures that you can enforce in different points throughout the network and also with different mechanics.

**This article is published as part of the IDG Contributor Network.[Want to Join?][10]**

Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3384748/zero-trust-microsegmentation-networking.html#tk.rss_all

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/07/hive-structured_windows_architecture_connections_connectivity_network_lincoln_park_pavilion_chicago_by_aaron_burson_cc0_via_unsplash_1200x800-100765880-large.jpg
[2]: https://youtu.be/AnMQH_noNDo
[3]: https://network-insight.net/2018/10/zero-trust-networking-ztn-want-ghosted/
[4]: https://network-insight.net/2018/09/embrace-zero-trust-networking/
[5]: https://www.networkworld.com/article/3262145/lan-wan/customer-reviews-top-remote-access-tools.html#nww-fsb
[6]: https://www.networkworld.com/article/2287045/internet-of-things/wireless-153629-10-most-powerful-internet-of-things-companies.html#nww-fsb
[7]: https://www.networkworld.com/newsletters/signup.html#nww-fsb
[8]: https://network-insight.net/2017/10/internet-things-iot-dissolving-cloud/
[9]: https://network-insight.net/2018/09/software-defined-perimeter-zero-trust/
[10]: /contributor-network/signup.html
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
