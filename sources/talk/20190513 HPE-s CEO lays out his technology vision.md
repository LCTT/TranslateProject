[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (HPE’s CEO lays out his technology vision)
[#]: via: (https://www.networkworld.com/article/3394879/hpe-s-ceo-lays-out-his-technology-vision.html)
[#]: author: (Eric Knorr )

HPE’s CEO lays out his technology vision
======
In an exclusive interview, HPE CEO Antonio Neri unpacks his portfolio of technology initiatives, from edge computing to tomorrow’s memory-driven architecture.
![HPE][1]

Like Microsoft's Satya Nadella, HPE CEO Antonio Neri is a technologist with a long history of leading initiatives in his company. Meg Whitman, his former boss at HPE, showed her appreciation of Neri’s acumen by promoting him to HPE Executive Vice President in 2015 – and gave him the green light to acquire [Aruba][2], [SimpliVity][3], [Nimble Storage][4], and [Plexxi][5], all of which added key items to HPE’s portfolio.

Neri succeeded Whitman as CEO just 16 months ago. In a recent interview with Network World, Neri’s engineering background was on full display as he explained HPE’s technology roadmap. First and foremost, he sees a huge opportunity in [edge computing][6], into which HPE is investing $4 billion over four years to further develop edge “connectivity, security, and obviously cloud and analytics.”

**More about edge networking**

  * [How edge networking and IoT will reshape data centers][7]
  * [Edge computing best practices][8]
  * [How edge computing can help secure the IoT][9]



Although his company abandoned its public cloud efforts in 2015, Neri is also bullish on the self-service “cloud experience,” which he asserts HPE is already implementing on-prem today in a software-defined, consumption-driven model. More fundamentally, he believes we are on the brink of a memory-driven computing revolution, where storage and memory become one and, depending on the use case, various compute engines are brought to bear on zettabytes of data.

This interview, conducted by Network World Editor-in-Chief Eric Knorr and edited for length and clarity, digs into Neri’s technology vision. [A companion interview on CIO][10] centers on Neri’s views of innovation, management, and company culture.

**Eric Knorr: ** Your biggest and highest profile investment so far has been in edge computing. My understanding of edge computing is that we’re really talking about mini-data centers, defined by IDC as less than 100 square feet in size. What’s the need for a $4 billion investment in that?

**Antonio Neri:** It’s twofold. We focus first on connectivity. Think about Aruba as a platform company, a cloud-enabled company. Now we offer branch solutions and edge data center solutions that include [wireless][11], LAN, [WAN][12] connectivity and soon [5G][13]. We give you a control plane so that that connectivity experience can be seen consistently the same way. All the policy management, the provisioning and the security aspects of it.

**Knorr:** Is 5G a big focus?

**[[Get certified as an Apple Technical Coordinator with this seven-part online course from PluralSight.][14] ]**

**Neri:** It’s a big focus for us. What customers are telling us is that it’s hard to get 5G inside the building. How you do hand off between 5G and Wi-Fi and give them the same experience? Because the problem is that we have LAN, wireless, and WAN already fully integrated into the control plane, but 5G sits over here. If you are an enterprise, you have to manage these two pipes independently.

With the new spectrum, though, they are kind of comingling anyway. [Customers ask] why don’t you give me [a unified] experience on top of that, with all this policy management and cloud-enablement, so I can provision the right connectivity for the right use case? A sensor can use a lower radio access or [Bluetooth][15] or other type of connectivity because you don’t need persistent connectivity and you don’t have the power to do it.

In some cases, you just put a SIM on it, and you have 5G, but in another one it’s just wireless connectivity. Wi-Fi connectivity is significantly lower cost than 5G. The use cases will dictate what type of connectivity you need, but the reality is they all want one experience. And we can do that because we have a great platform and a great partnership with MSPs, telcos, and providers.

**Knorr:** So it sounds like much of your investment is going into that integration.

**Neri:** The other part is how we provide the ability to provision the right cloud computing at the edge for the right use cases. Think about, for example, a manufacturing floor. We can converge the OT and IT worlds through a converged infrastructure aspect that digitizes the analog process into a digital process. We bring the cloud compute in there, which is fully virtualized and containerized, we integrate Wi-Fi connectivity or LAN connectivity, and we eliminate all these analog processes that are multi-failure touchpoints because you have multiple things that have to come together.

That’s a great example of a cloud at the edge. And maybe that small cloud is connected to a big cloud which could be in the large data center, which the customer owns – or it can be one of the largest public cloud providers.

**Knorr:** It’s difficult to talk about the software-defined data center and private cloud without talking about [VMware][16]. Where do your software-defined solutions leave off and where does VMware begin?

**Neri:** Where we stop is everything below the hypervisor, including the software-defined storage and things like SimpliVity. That has been the advantage we’ve had with [HPE OneView][17], so we can provision and manage the infrastructure-life-cycle and software-defined aspects at the infrastructure level. And let’s not forget security, because we’ve integrated [silicon root of trust][18] into our systems, which is a good advantage for us in the government space.

Then above that we continue to develop capabilities. Customers want choice. That’s why [the partnership with Nutanix][19] was important. We offer an alternative to vSphere and vCloud Foundation with Nutanix Prism and Acropolis.

**Knorr:** VMware has become the default for the private cloud, though.

**Neri:** Obviously, VMware owns 60 percent of the on-prem virtualized environment, but more and more, containers are becoming the way to go in a cloud-native approach. For us, we own the full container stack, because we base our solution on Kubernetes. We deploy that. That’s why the partnership with Nutanix is important. With Nutanix, we offer KVM and the Prism stack and then we’re fully integrated with HPE OneView for the rest of the infrastructure.

**Knorr:** You also offer GKE [Google [Kubernetes][20] Engine] on-prem.

**Neri:** Correct. We’re working with Google on the next version of that.

**Knorr:** How long do you think it will be before you start seeing Kubernetes and containers on bare metal?

**Neri:** It’s an interesting question. Many customers tell us it’s like going back to the future. It’s like we’re paying this tax on the virtualization layer.

**Knorr:** Exactly.

**Neri:** I can go bare metal and containers and be way more efficient. It is a little bit back to the future. But it’s a different future.

**Knorr:** And it makes the promise of [hybrid cloud][21] a little more real. I know HPE has been very bullish on hybrid.

**Neri:** We have been the one to say the world would be hybrid.

**Knorr:** But today, how hybrid is hybrid really? I mean, you have workloads in the public cloud, you have workloads in a [private cloud][22]. Can you really rope it all together into hybrid?

**Neri:** I think you have to have portability eventually.

**Knorr:** Eventually. It’s not really true now, though.

**Neri:** No, not true now. If you look at it from the software brokering perspective that makes hybrid very small. We know this eventually has to be all connected, but it’s not there yet. More and more of these workloads have to go back and forth.

If you ask me what the CIO role of the future will look like, it would be a service provider. I wake up in the morning, have a screen that says – oh, you know what? Today it’s cheaper to run that app here. I just slice it there and then it just moves. Whatever attributes on the data I want to manage and so forth – oh, today I have capacity here and by the way, why are you not using it? Slide it back here. That’s the hybrid world.

Many people, when they started with the cloud, thought, “I’ll just virtualize everything,” but that’s not the cloud. You’re [virtualizing][23], but you have to make it self-service. Obviously, cloud-native applications have developed that are different today. That’s why containers are definitely a much more efficient way, and that’s why I agree that the bare-metal piece of this is coming back.

**Knorr:** Do you worry about public cloud incursions into the [data center][24]?

**Neri:** It’s happening. Of course I’m worried. But what at least gives me comfort is twofold. One is that the customer wants choice. They don’t want to be locked in. Service is important. It’s one thing to say: Here’s the system. The other is: Who’s going to maintain it for me? Who is going to run it for me? And even though you have all the automation tools in the world, somebody has to watch this thing. Our job is to bring the public-cloud experience on prem, so that the customer has that choice.

**Knorr:** Part of that is economics.

**Neri:** When you look at economics it’s no longer just the cost of compute anymore. What we see more and more is the cost of the data bandwidth back and forth. That’s why the first question a customer asks is: Where should I put my data? And that dictates a lot of things, because today the data transfer bill is way higher than the cost of renting a VM.

The other thing is that when you go on the public cloud you can spin up a VM, but the problem is if you don’t shut it off, the bill keeps going. We brought, in the context of [composability][25], the ability to shut it off automatically. That’s why composability is important, because we can run, first of all, multi-workloads in the same infrastructure – whether it’s bare metal, virtualized or containerized. It’s called composable because the software layers of intelligence compose the right solutions from compute, storage, fabric and memory to that workload. When it doesn’t need it, it gives it back.

**Knorr:** Is there any opportunity left at the hardware level to innovate?

**Neri:** That’s why we think about memory-driven computing. Today we have a very CPU-centric approach. This is a limiting factor, and the reality is, if you believe data is the core of the architecture going forward, then the CPU can’t be the core of the architecture anymore.

You have a bunch of inefficiency by moving data back and forth across the system, which also creates energy waste and so forth. What we are doing is basically rearchitecting this for once in 70 years. We take memory and storage and collapse the two into one, so this becomes one central pool, which is nonvolatile and becomes the core. And then we bring the right computing capability to the data.

In an AI use case, you don’t move the data. You bring accelerators or GPUs to the data. For general purpose, you may use an X86, and maybe in video transcoding, you use an ARM-based architecture. The magic is this: You can do this on zettabytes of data and the benefit is there is no waste, very little power to keep it alive, and it’s persistent.

We call this the Generation Z fabric, which is based on a data fabric and silicon photonics. Now we go from copper, which is generating a lot of waste and a lot of heat and energy, to silicon photonics. So we not only scale this to zettabytes, we can do massive amounts of computation by bringing the right compute at the speed that’s needed to the data – and we solve a cost and scale problem too, because copper today costs a significant amount of money, and gold-plated connectors are hundreds of dollars.

We’re going to actually implement this capability in silicon photonics in our current architectures by the end of the year. In Synergy, for example, which is a composable blade system, at the back of the rack you can swap from Ethernet to silicon photonics. It was designed that way. We already prototyped this in a simple 2U chassis with 160 TB of memory and 2000 cores. We were able to process a billion-record database with 55 million combinations of algorithms in less than a minute.

**Knorr:** So you’re not just focusing on the edge, but the core, too.

**Neri:** As you go down from the cloud to the edge, that architecture actually scales to the smallest things. You can do it on a massive scale or you can do it on a small scale. We will deploy these technologies in our systems architectures now. Once the whole ecosystem is developed, because we also need an ISV ecosystem that can code applications in this new world or you’re not taking advantage of it. Also, the current Linux kernel can only handle so much memory, so you have to rewrite the kernel. We are working with two universities to do that.

The hardware will continue to evolve and develop, but there still is a lot of innovation that has to happen. What’s holding us back, honestly, is the software.

**Knorr:** And that’s where a lot of your investment is going?

**Neri:** Correct. Exactly right. Systems software, not application software. It’s the system software that makes this infrastructure solution-oriented, workload-optimized, autonomous and efficient.

Join the Network World communities on [Facebook][26] and [LinkedIn][27] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3394879/hpe-s-ceo-lays-out-his-technology-vision.html

作者：[Eric Knorr][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/antonio-neri_hpe_new-100796112-large.jpg
[2]: https://www.networkworld.com/article/2891130/aruba-networks-is-different-than-hps-failed-wireless-acquisitions.html
[3]: https://www.networkworld.com/article/3158784/hpe-buying-simplivity-for-650-million-to-boost-hyperconvergence.html
[4]: https://www.networkworld.com/article/3177376/hpe-to-pay-1-billion-for-nimble-storage-after-cutting-emc-ties.html
[5]: https://www.networkworld.com/article/3273113/hpe-snaps-up-hyperconverged-network-hcn-vendor-plexxi.html
[6]: https://www.networkworld.com/article/3224893/what-is-edge-computing-and-how-it-s-changing-the-network.html
[7]: https://www.networkworld.com/article/3291790/data-center/how-edge-networking-and-iot-will-reshape-data-centers.html
[8]: https://www.networkworld.com/article/3331978/lan-wan/edge-computing-best-practices.html
[9]: https://www.networkworld.com/article/3331905/internet-of-things/how-edge-computing-can-help-secure-the-iot.html
[10]: https://www.cio.com/article/3394598/hpe-ceo-antonio-neri-rearchitects-for-the-future.html
[11]: https://www.networkworld.com/article/3238664/80211-wi-fi-standards-and-speeds-explained.html
[12]: https://www.networkworld.com/article/3248989/what-is-a-wide-area-network-a-definition-examples-and-where-wans-are-headed.html
[13]: https://www.networkworld.com/article/3203489/what-is-5g-how-is-it-better-than-4g.html
[14]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fapple-certified-technical-trainer-10-11
[15]: https://www.networkworld.com/article/3235124/internet-of-things-definitions-a-handy-guide-to-essential-iot-terms.html
[16]: https://www.networkworld.com/article/3340259/vmware-s-transformation-takes-hold.html
[17]: https://www.networkworld.com/article/2174203/hp-expands-oneview-into-vmware-environs.html
[18]: https://www.networkworld.com/article/3199826/hpe-highlights-innovation-in-software-defined-it-security-at-discover.html
[19]: https://www.networkworld.com/article/3388297/hpe-and-nutanix-partner-for-hyperconverged-private-cloud-systems.html
[20]: https://www.infoworld.com/article/3268073/what-is-kubernetes-container-orchestration-explained.html
[21]: https://www.networkworld.com/article/3268448/what-is-hybrid-cloud-really-and-whats-the-best-strategy.html
[22]: https://www.networkworld.com/article/2159885/cloud-computing-gartner-5-things-a-private-cloud-is-not.html
[23]: https://www.networkworld.com/article/3285906/whats-the-future-of-server-virtualization.html
[24]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[25]: https://www.networkworld.com/article/3266106/what-is-composable-infrastructure.html
[26]: https://www.facebook.com/NetworkWorld/
[27]: https://www.linkedin.com/company/network-world
