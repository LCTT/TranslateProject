[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The ins and outs of high-performance computing as a service)
[#]: via: (https://www.networkworld.com/article/3534725/the-ins-and-outs-of-high-performance-computing-as-a-service.html)
[#]: author: (Josh Fruhlinger https://www.networkworld.com/author/Josh-Fruhlinger/)

The ins and outs of high-performance computing as a service
======
HPC services can be a way to meet expanding supercomputing needs, but depending on the use case, they’re not necessarily better than on-premises supercomputers.
Dell EMC

Electronics on missiles and military helicopters need to survive extreme conditions. Before any of that physical hardware can be deployed, defense contractor McCormick Stevenson Corp. simulates the real-world conditions it will endure, relying on finite element analysis software like Ansys, which requires significant computing power.

Then one day a few years ago, it unexpectedly ran up against its computing limits.

[10 of the world's fastest supercomputers][1]

"We had some jobs that would have overwhelmed the computers that we had in office," says Mike Krawczyk, principal engineer at McCormick Stevenson. "It did not make economic or schedule sense to buy a machine and install software." Instead, the company contracted with Rescale, which could sell them cycles on a supercomputer-class system for a tiny fraction of what they would've spent on new hardware.

McCormick Stevenson had become an early adopter in a market known as supercomputing as a service or high-performance computing (HPC) as a service – two terms that are closely related. HPC is the application of supercomputers to computationally complex problems, while supercomputers are those computers at the cutting edge of processing capacity, according to the National Institute for Computational Sciences.

Whatever it's called, these services are upending the traditional supercomputing market and bringing HPC power to customers who could never afford it before. But it's no panacea, and it's definitely not plug-and-play – at least not yet.

### HPC services in practice

From the end user's perspective, HPC as a service resembles the batch-processing model that dates back to the early mainframe era. "We create an Ansys batch file and send that up, and after it runs, we pull down the result files and import them locally here," Krawczyk says.

Behind the scenes, cloud providers are running the supercomputing infrastructure in their own data centers – though that doesn't necessarily imply the sort of cutting-edge hardware you might be visualizing when you hear "supercomputer." As Dave Turek, Vice President of Technical Computing at IBM OpenPOWER, explains it, HPC services at their core are "a collection of servers that are strung together with an interconnect. You have the ability to invoke this virtual computing infrastructure that allows you to bring a lot of different servers to work together in a parallel construct to solve the problem when you present it."

[][2]

Sounds simple in theory. But making it viable in practice required some chipping away at technical problems, according to Theo Lynn, Professor of Digital Business at Dublin City University. What differentiates ordinary computing from HPC is those interconnects – high-speed, low-latency, and expensive – so those needed to be brought to the world of cloud infrastructure. Storage performance and data transport also needed to be brought up to a level at least in the same ballpark as on-prem HPC before HPC services could be viable.

But Lynn says that some of the innovations that have helped HPC services take off have been more institutional than technological. In particular, "we are now seeing more and more traditional HPC applications adopting cloud-friendly licensing models – a barrier to adoption in the past."

And the economics have also shifted the potential customer base, he says. "Cloud service providers have opened up the market more by targeting low-end HPC buyers who couldn’t afford the capex associated with traditional HPC and opening up the market to new users. As the markets open up, the hyperscale economic model becomes more and more feasible, costs start coming down."

Avoid on-premises CAPEX**
**

HPC services are attractive to private-sector customers in the same fields where traditional supercomputing has long held sway. These include sectors that rely heavily on complex mathematical modeling, including defense contractors like McCormick Stevenson, along with oil and gas companies, financial services firms, and biotech companies. Dublin City University's Lynn adds that loosely coupled workloads are a particularly good use case, which meant that many early adopters used it for 3D image rendering and related applications.

But when does it make sense to consider HPC services over on-premises HPC? For hhpberlin, a German company that simulates smoke propagation in and fire damage to structural components of buildings, the move came as it outgrew its current resources.

"For several years, we had run our own small cluster with up to 80 processor cores," says Susanne Kilian, hhpberlin's scientific head of numerical simulation. "With the rise in application complexity, however, this constellation has increasingly proven to be inadequate; the available capacity was not always sufficient to handle projects promptly."

But just spending money on a new cluster wasn't an ideal solution, she says: "In view of the size and administrative environment of our company, the necessity of constant maintenance of this cluster (regular software and hardware upgrades) turned out to be impractical. Plus, the number of required simulation projects is subject to significant fluctuations, such that the utilization of the cluster was not really predictable. Typically, phases with very intensive use alternate with phases with little to no use." By moving to an HPC service model, hhpberlin shed that excess capacity and the need to pay up front for upgrades.

IBM's Turek explains the calculus that different companies go through while assessing their needs. For a biosciences startup with 30 people, "you need computing, but you really can't afford to have 15% of your staff dedicated to it. It's just like you might also say you don't want to have on-staff legal representation, so you'll get that as a service as well." For a bigger company, though, it comes down to weighing the operational expense of an HPC service against the capacity expense of buying an in-house supercomputer or HPC cluster.

So far, those are the same sorts of arguments you'd have over adopting any cloud service. But the opex vs. capex dilemma can be weighted towards the former by some of the specifics of the HPC market. Supercomputers aren't commodity hardware like storage or x86 servers; they're very expensive, and technological advances can swiftly render them obsolete. As McCormick Stevenson's Krawczyk puts it, "It's like buying a car: as soon as you drive off the lot it starts to depreciate." And for many companies –especially larger and less nimble ones – the process of buying a supercomputer can get hopelessly bogged down. "You're caught up in planning issues, building issues, construction issues, training issues, and then you have to execute an RFP," says IBM's Turek. "You have to work through the CIO. You have to work with your internal customers to make sure there's continuity of service. It's a very, very complex process and not something that a lot of institutions are really excellent at executing."

Once you choose to go down the services route for HPC, you'll find you get many of the advantages you expect from cloud services, particularly the ability to pay only for HPC power when you need it, which results in an efficient use of resources. Chirag Dekate, Senior Director and Analyst at Gartner, says bursty workloads, when you have short-term needs for high-performance computing, are a key use case driving adoption of HPC  services.

"In the manufacturing industry, you tend to have a high peak of HPC activity around the product design stage," he says. "But once the product is designed, HPC resources are less utilized during the rest of the product-development cycle." In contrast, he says, "when you have large, long-running jobs, the economics of the cloud wear down."

With clever system design, you can integrate those HPC-services bursts of activity with your own in-house conventional computing. Teresa Tung, managing director in Accenture Labs, gives an example: "Accessing HPC via APIs makes it seamless to mix with traditional computing. A traditional AI pipeline might have its training done on a high-end supercomputer at the stage when the model is being developed, but then the resulting trained model that runs predictions over and over would be deployed on other services in the cloud or even devices at the edge."

### It's not for all use cases**

**

Use of HPC services lends itself to batch-processing and loosely-coupled use cases. That ties into a common HPC downside: data transfer issues. High-performance computing by its very nature often involves huge data sets, and sending all that information over the internet to a cloud service provider is no simple thing. "We have clients I talk to in the biotech industry who spend $10 million a month on just the data charges," says IBM's Turek.

And money isn't the only potential problem. Building a workflow that makes use of your data can challenge you to work around the long times required for data transfer. "When we had our own HPC cluster, local access to the simulation results already produced – and thus an interactive interim evaluation — was of course possible at any time," says hhpberlin's Kilian. "We're currently working on being able to access and evaluate the data produced in the cloud even more efficiently and interactively at any desired time of the simulation without the need to download large amounts of simulation data."

Mike Krawczyk cites another stumbling block: compliance issues. Any service a defense contractor uses needs to be complaint with the International Traffic in Arms Regulations (ITAR), and McCormick Stevenson went with Rescale in part because it was the only vendor they found that checked that box. While more do today, any company looking to use cloud services should be aware of the legal and data-protection issues involved in living on someone else's infrastructure, and the sensitive nature of many of HPC's use cases makes this doubly true for HPC as a service.

In addition, the IT governance that HPC services require goes beyond regulatory needs. For instance, you'll need to keep track of whether your software licenses permit cloud use ­– especially with specialized software packages written to run on an on-premises HPC cluster. And in general, you need to keep track of how you use HPC services, which can be a tempting resource, especially if you've transitioned from in-house systems where staff was used to having idle HPC capabilities available. For instance, Ron Gilpin, senior director and Azure Platform Services global lead at Avanade, suggests dialing back how many processing cores you use for tasks that aren't time sensitive. "If a job only needs to be completed in an hour instead of ten minutes," he says, "that might use 165 processors instead of 1,000, a savings of thousands of dollars."

### A premium on HPC skills**

**

One of the biggest barriers to HPC adoption has always been the unique in-house skills it requires, and HPC services don't magically make that barrier vanish. "Many CIOs have migrated a lot of their workloads into the cloud and they have seen cost savings and increased agility and efficiency, and believe that they can achieve similar results in HPC ecosystems," says Gartner's Dekate. "And a common misperception is that they can somehow optimize human resource cost by essentially moving away from system admins and hiring new cloud experts who can solve their HPC workloads."

"But HPC is not one of the main enterprise environments," he says. "You're dealing with high-end compute nodes interconnected with high-bandwidth, low-latency networking stacks, along with incredibly complicated application and middleware stacks. Even the filesystem layers in many cases are unique to HPC environments. Not having the right skills can be destabilizing."

But supercomputing skills are in shortening supply, something Dekate refers to as the workforce "greying," in the wake of a generation of developers going to splashy startups rather than academia or the more staid firms where HPC is in use. As a result, vendors of HPC services are doing what they can to bridge the gap. IBM's Turek says that many HPC vets will always want to roll their own exquisitely fine-tuned code and will need specialized debuggers and other tools to help them do that for the cloud. But even HPC newbies can make calls to code libraries built by vendors to exploit supercomputing's parallel processing. And third-party software providers sell turnkey software packages that abstract away much of HPC's complication.

Accenture's Tung says the sector needs to lean further into this in order to truly prosper. "HPCaaS has created dramatically impactful new capability, but what needs to happen is making this easy to apply for the data scientist, the enterprise architect, or the software developer," she says. "This includes easy to use APIs, documentation, and sample code. It includes user support to answer questions. It’s not enough to provide an API; that API needs to be fit-for-purpose. For a data scientist this should likely be in Python and easily change out for the frameworks she is already using. The value comes from enabling these users who ultimately will have their jobs improved through new efficiencies and performance, if only they can access the new capabilities." If vendors can pull that off, HPC services might truly bring supercomputing to the masses.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3534725/the-ins-and-outs-of-high-performance-computing-as-a-service.html

作者：[Josh Fruhlinger][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Josh-Fruhlinger/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3236875/embargo-10-of-the-worlds-fastest-supercomputers.html
[2]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
