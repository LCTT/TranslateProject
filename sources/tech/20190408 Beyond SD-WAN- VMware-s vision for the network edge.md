[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Beyond SD-WAN: VMware’s vision for the network edge)
[#]: via: (https://www.networkworld.com/article/3387641/beyond-sd-wan-vmwares-vision-for-the-network-edge.html#tk.rss_all)
[#]: author: (Linda Musthaler https://www.networkworld.com/author/Linda-Musthaler/)

Beyond SD-WAN: VMware’s vision for the network edge
======
Under the ownership of VMware, the VeloCloud Business Unit is greatly expanding its vision of what an SD-WAN should be. VMware calls the strategy “the network edge.”
![istock][1]

VeloCloud is now a Business Unit within VMware since being acquired in December 2017. The two companies have had sufficient time to integrate their operations and fit their technologies together to build a cohesive offering. In January, Neal Weinberg provided [an overview of where VMware is headed with its reinvention][2]. Now let’s look at it from the VeloCloud [SD-WAN][3] perspective.

I recently talked to Sanjay Uppal, vice president and general manager of the VeloCloud Business Unit. He shared with me where VeloCloud is heading, adding that it’s all possible because of the complementary products that VMware brings to VeloCloud’s table.

**[ Read also:[Edge computing is the place to address a host of IoT security concerns][4] ]**

It all starts with this architecture chart that shows the VMware vision for the network edge.

![][5]

The left side of the chart shows that in the branch office, you can put an edge device that can be either a VeloCloud hardware appliance or VeloCloud software running on some third-party hardware. Then the right side of the chart shows where the workloads are — the traditional data center, the public cloud, and SaaS applications. You can put one or more edge devices there and then you have the classic hub-and-spoke model with the VeloCloud SD-WAN on running on top.

In the middle of the diagram are the gateways, which are a differentiator and a unique benefit of VeloCloud.

“If you have applications in the public cloud or SaaS, then you can use our gateways instead of spinning up individual edges at each of the applications,” Uppal said. “Those gateways really perform a multi-tenanted edge function. So, instead of locating an individual edge at every termination point at the cloud, you basically go from an edge in the branch to a gateway in the cloud, and then from that gateway you go to your final destination. We've engineered it so that the gateways are close to where the end applications are — typically within five milliseconds.”

Going back to the architecture diagram, there are two clouds in the middle of the chart. The left-hand cloud is the over-the-top (OTT) service run by VeloCloud. It uses 800 gateways deployed over 30 points of presence (PoPs) around the world. The right-hand cloud is the telco cloud, which deploys gateways as network-based services. VeloCloud has several telco partners that take the same VeloCloud gateways and deploy them in their cloud.

“Between a telco service, a cloud service, and hub and spoke on premise, we essentially have covered all the bases in terms of how enterprises would want to consume software-defined WAN. This flexibility is part of the reason why we've been successful in this market,” Uppal said.

Where is VeloCloud going with this strategy? Again, looking at the architecture chart, the “vision” pieces are labeled 1 through 5. Let’s look at each of those areas.

### Edge compute

Starting with number 1 on the left-hand side of the diagram, there is the expansion from the edge itself going deeper into the branch by crossing over a LAN or a Wi-Fi boundary to get to where the individual users and IoT “things” are. This approach uses the same VeloCloud platform to spin up [compute at the edge][6], which can be either a container or a virtual machine (VM).

“Of course, VMwareis very strong in compute in the data center. Our CEO recently articulated the VMware edge story, which is compute edge and device edge. When you combine it with the network edge, which is VeloCloud, then you have a full edge solution,” Uppal explained. “So, this first piece that you see is our foray into getting deeper into the branch all the way up to the individual users and things and combining compute functions on to the VeloCloud solution. There's been a lot of talk about edge compute and we do know that the pendulum is swinging back, but one of the major challenges is how to manage it all. VMware has strong technology in the data center space that we are bringing to bear out there at the edge.”

### 5G underlay intelligence

The next piece, number 2 on the diagram, is [5G][7]. At the Mobile World Congress, VMware and AT&T announced they are bringing SD-WAN out running on 5G. The idea here is that 5G should give you a low-latency connection and you get on-demand control, so you can tell 5G on the fly that you want this type of connection. Once that is done, the right network slices would be put in place and then you can get a connection according to the specifications that you asked for.

“We as VeloCloud would measure the underlay continuously. It's like a speed test on steroids. We would measure bandwidth, packet loss, jitter and latency continuously with low overhead because we piggyback on real user traffic. And then on the basis of that measurement, we would steer the traffic one way or another,” Uppal said. “For example, your real-time voice is important, so let's pick the best performing network at that instant of time, which might change in the next instant, so that's why we have to make that decision on a per-packet basis.”

Uppal continued, “What 5G allows us to do is to look at that underlay as not just being one underlay, but it could be several different underlays, and it's programmable so you could ask it for a type of underlay. That is actually pretty revolutionary — that we would run an overlay with the intelligence of SD-WAN counting on the underlay intelligence of 5G.

“We are working pretty closely with our partner AT&T in this space. We are talking about the business aspect of 5G being used as a transport mechanism for enterprise data, rather than consumer phones having 5G on them. This is available from AT&T today in a handful of cities. So as 5G becomes more ubiquitous, you'll begin to see it deployed more and more. Then we will do an Ethernet or Wi-Fi handoff to the hotspot, and from then on, we'll jump onto the 5G network for the SD-WAN. Then the next phase of that will be 5G natively on our devices, which is what we are working on today.”

### Gateway federation

The third part of the vision is gateway federation, some of which is available today. The left-hand cloud in the diagram, which is the OTT service, should be able to interoperate gateway to gateway with the cloud on the right-hand side, which is the network-based service. For example, if you have a telco cloud of gateways but those gateways don't reach out into areas where the telco doesn’t have a presence, then you can reuse VeloCloud gateways that are sitting in other locations. A gateway would federate with another gateway, so it would extend the telco’s network beyond the facilities that they own. That's the first step of gateway federation, which is available from VeloCloud today.

Uppal said the next step is a telco-to telco-federation. “There's a lot of interest from folks in the industry on how to get that federation done. We're working with the Metro Ethernet Forum (MEF) on that,” he said.

### SD-WAN as a platform

The next piece of the vision is SD-WAN as a platform. VeloCloud already incorporates security services into its SD-WAN platform in the form of [virtual network functions][8] (VNFs) from Palo Alto, Check Point Software, and other partners. Deploying a service as a VNF eliminates having separate hardware on the network. Now the company is starting to bring more services onto its platform.

“Analytics is the area we are bringing in next,” Uppal said. “We partnered with SevOne and Plixer so that they can take analytics that we are providing, correlate them with other analytics that they have and then come up with inferences on whether things worked correctly or not, or to check for anomalous behavior.”

Two additional areas that VeloCloud is working on are unified communications as a service (UCaaS) and universal customer premises equipment (uCPE).

“We announced that we are working with RingCentral in the UCaaS space, and with ADVA and Telco Systems for uCPE. We have our own uCPE offering today but with a limited number of VNFs, so ADVA and Telco Systems will help us expand those capabilities,” Uppal explained. “With SD-WAN becoming a platform for on-premise deployments, you can virtualize functions and manage them from the same place, whether they're VNF-type of functions or compute-type of functions. This is an important direction that we are moving towards.”

### Hybrid and multi-cloud integration

The final piece of the strategy is hybrid and multi-cloud integration. Since its inception, VeloCloud has had gateways to facilitate access to specific applications running in the cloud. These gateways provide a secure end-to-end connection and an ROI advantage.

Recognizing that workloads have expanded to multi-cloud and hybrid cloud, VeloCloud is broadening this approach utilizing VMware’s relationships with Microsoft, Amazon, and Google and offerings on Azure, Amazon Web Services, and Google Cloud, respectively. From a networking standpoint, you can get the same consistency of access using VeloCloud because you can decide from the gateway whichever direction you want to go. That direction will be chosen — and services added — based on your business policy.

“We think this is the next hurdle in terms of deployment of SD-WAN, and once that is solved, people are going to deploy a lot more for hybrid and multi-cloud,” said Uppal. “We want to be the first ones out of the gate to get that done.”

Uppal further said, “These five areas are where we see our SD-WAN headed, and we call this a network edge because it's beyond just the traditional SD-WAN functions. It includes edge computing, SD-WAN becoming a broader platform, integrating with hybrid multi cloud — these are all aspects of features that go way beyond just the narrower definition of SD-WAN.”

**More about edge networking:**

  * [How edge networking and IoT will reshape data centers][9]
  * [Edge computing best practices][10]
  * [How edge computing can help secure the IoT][11]



Join the Network World communities on [Facebook][12] and [LinkedIn][13] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3387641/beyond-sd-wan-vmwares-vision-for-the-network-edge.html#tk.rss_all

作者：[Linda Musthaler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Linda-Musthaler/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/01/istock-864405678-100747484-large.jpg
[2]: https://www.networkworld.com/article/3340259/vmware-s-transformation-takes-hold.html
[3]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[4]: https://www.networkworld.com/article/3307859/edge-computing-helps-a-lot-of-iot-security-problems-by-getting-it-involved.html
[5]: https://images.idgesg.net/images/article/2019/04/vmware-vision-for-network-edge-100793086-large.jpg
[6]: https://www.networkworld.com/article/3224893/what-is-edge-computing-and-how-it-s-changing-the-network.html
[7]: https://www.networkworld.com/article/3203489/what-is-5g-how-is-it-better-than-4g.html
[8]: https://www.networkworld.com/article/3206709/what-s-the-difference-between-sdn-and-nfv.html
[9]: https://www.networkworld.com/article/3291790/data-center/how-edge-networking-and-iot-will-reshape-data-centers.html
[10]: https://www.networkworld.com/article/3331978/lan-wan/edge-computing-best-practices.html
[11]: https://www.networkworld.com/article/3331905/internet-of-things/how-edge-computing-can-help-secure-the-iot.html
[12]: https://www.facebook.com/NetworkWorld/
[13]: https://www.linkedin.com/company/network-world
