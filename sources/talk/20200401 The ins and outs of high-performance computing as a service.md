[#]: collector: (lujun9972)
[#]: translator: (messon007)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The ins and outs of high-performance computing as a service)
[#]: via: (https://www.networkworld.com/article/3534725/the-ins-and-outs-of-high-performance-computing-as-a-service.html)
[#]: author: (Josh Fruhlinger https://www.networkworld.com/author/Josh-Fruhlinger/)

The ins and outs of high-performance computing as a service 高性能计算即服务的来龙去脉
======
HPC services can be a way to meet expanding supercomputing needs, but depending on the use case, they’re not necessarily better than on-premises supercomputers.
Dell EMC
HPC服务可以满足不断扩展的超级计算需求，但根据使用情况，它们不一定比本地超级计算机更好。 戴尔EMC
Electronics on missiles and military helicopters need to survive extreme conditions. Before any of that physical hardware can be deployed, defense contractor McCormick Stevenson Corp. simulates the real-world conditions it will endure, relying on finite element analysis software like Ansys, which requires significant computing power.
导弹和军用直升机上的电子设备需要在极端条件下生存。 在部署任何物理硬件之前，国防承包商麦考密克·史蒂文森公司（McCormick Stevenson Corp.）都依赖于像Ansys这样的有限元素分析软件来模拟它会承受的现实条件，该软件需要强大的计算能力。

Then one day a few years ago, it unexpectedly ran up against its computing limits.
几年前的一天，它出乎意料地超出了计算极限。
[10 of the world's fastest supercomputers][1]

"We had some jobs that would have overwhelmed the computers that we had in office," says Mike Krawczyk, principal engineer at McCormick Stevenson. "It did not make economic or schedule sense to buy a machine and install software." Instead, the company contracted with Rescale, which could sell them cycles on a supercomputer-class system for a tiny fraction of what they would've spent on new hardware.
麦考密克·史蒂文森（McCormick Stevenson）的首席工程师迈克·克劳奇奇（Mike Krawczyk）说：“我们从事的某些工作会使我们在办公室使用的计算机不堪重负。” “购买机器并安装软件在经济上或计划上都不合理。”取而代之的是，该公司与Rescale签约，可以在超级计算机级系统上向他们出售自行车的周期，而这只花费了他们在新硬件上花费的一小部分。

McCormick Stevenson had become an early adopter in a market known as supercomputing as a service or high-performance computing (HPC) as a service – two terms that are closely related. HPC is the application of supercomputers to computationally complex problems, while supercomputers are those computers at the cutting edge of processing capacity, according to the National Institute for Computational Sciences.
麦考密克·史蒂文森（McCormick Stevenson）已成为市场上的早期采用者，该市场被称为超级计算即服务或高性能计算（HPC）即服务–这两个紧密相关的术语。根据国家计算科学研究所的说法，HPC是超级计算机在计算复杂问题上的应用，而超级计算机是处理能力最先进的那些计算机。

Whatever it's called, these services are upending the traditional supercomputing market and bringing HPC power to customers who could never afford it before. But it's no panacea, and it's definitely not plug-and-play – at least not yet.
无论以何种方式称呼，这些服务都在颠覆传统的超级计算市场，并将HPC功能带给以前买不起的客户。但这不是万能药，而且绝对不是即插即用的，至少现在还没有。

### HPC services in practice HPC服务实践

From the end user's perspective, HPC as a service resembles the batch-processing model that dates back to the early mainframe era. "We create an Ansys batch file and send that up, and after it runs, we pull down the result files and import them locally here," Krawczyk says.
从最终用户的角度来看，HPC即服务类似于可追溯到大型机早期的批处理模型。 “我们创建一个Ansys批处理文件并将其发送出去，然后运行它，我们将结果文件下拉并在此处本地导入，” Krawczyk说。

Behind the scenes, cloud providers are running the supercomputing infrastructure in their own data centers – though that doesn't necessarily imply the sort of cutting-edge hardware you might be visualizing when you hear "supercomputer." As Dave Turek, Vice President of Technical Computing at IBM OpenPOWER, explains it, HPC services at their core are "a collection of servers that are strung together with an interconnect. You have the ability to invoke this virtual computing infrastructure that allows you to bring a lot of different servers to work together in a parallel construct to solve the problem when you present it."
在幕后，云提供商正在其自己的数据中心中运行超级计算基础结构，尽管这不一定意味着您在听到“超级计算机”时可能会看到的最先进的硬件。正如IBM OpenPOWER技术计算副总裁Dave Turek解释说的那样，HPC服务的核心是“由互连串在一起的服务器的集合。您可以调用此虚拟计算基础结构，使您能够当您提出问题时，许多不同的服务器可以并行构造在一起以解决问题。”
[][2]

Sounds simple in theory. But making it viable in practice required some chipping away at technical problems, according to Theo Lynn, Professor of Digital Business at Dublin City University. What differentiates ordinary computing from HPC is those interconnects – high-speed, low-latency, and expensive – so those needed to be brought to the world of cloud infrastructure. Storage performance and data transport also needed to be brought up to a level at least in the same ballpark as on-prem HPC before HPC services could be viable.
理论上听起来很简单。都柏林城市大学数字业务教授西奥·林恩（Theo Lynn）表示，但要使其在实践中可行，需要解决一些技术问题。普通计算与HPC的区别在于那些互连-高速，低延迟和昂贵-因此需要将这些互连引入云基础架构领域。在HPC服务可行之前，还至少需要将存储性能和数据传输提升到与本地HPC相同的水平。

But Lynn says that some of the innovations that have helped HPC services take off have been more institutional than technological. In particular, "we are now seeing more and more traditional HPC applications adopting cloud-friendly licensing models – a barrier to adoption in the past."
但是林恩说，一些帮助高性能计算服务起飞的创新比技术更具有制度性。特别是，“我们现在看到越来越多的传统HPC应用程序采用云友好型许可模式-过去是采用这种模式的障碍。”

And the economics have also shifted the potential customer base, he says. "Cloud service providers have opened up the market more by targeting low-end HPC buyers who couldn’t afford the capex associated with traditional HPC and opening up the market to new users. As the markets open up, the hyperscale economic model becomes more and more feasible, costs start coming down."
他说，经济也改变了潜在的客户群。 “云服务提供商通过针对那些负担不起与传统HPC相关的资本支出的低端HPC买家，并向新用户开放市场，进一步开放了市场。随着市场的开放，超大规模经济模型变得越来越多，更可行，成本开始下降。”

Avoid on-premises CAPEX** 避免内部资本支出**
**

HPC services are attractive to private-sector customers in the same fields where traditional supercomputing has long held sway. These include sectors that rely heavily on complex mathematical modeling, including defense contractors like McCormick Stevenson, along with oil and gas companies, financial services firms, and biotech companies. Dublin City University's Lynn adds that loosely coupled workloads are a particularly good use case, which meant that many early adopters used it for 3D image rendering and related applications.
在传统超级计算长期占据主导地位的相同领域，HPC服务对私营部门客户具有吸引力。这些行业包括严重依赖复杂数学模型的行业，包括麦考密克·史蒂文森（McCormick Stevenson）等国防承包商，以及石油和天然气公司，金融服务公司和生物技术公司。都柏林城市大学的Lynn补充说，松散耦合的工作负载是一个特别好的用例，这意味着许多早期采用者将其用于3D图像渲染和相关应用程序。

But when does it make sense to consider HPC services over on-premises HPC? For hhpberlin, a German company that simulates smoke propagation in and fire damage to structural components of buildings, the move came as it outgrew its current resources.
但是，何时在本地HPC上考虑HPC服务才有意义？对于德国的hhpberlin公司，该公司模拟烟雾在建筑物中的传播和火灾对建筑物结构部件的破坏，此举是因为它超出了其现有资源。

"For several years, we had run our own small cluster with up to 80 processor cores," says Susanne Kilian, hhpberlin's scientific head of numerical simulation. "With the rise in application complexity, however, this constellation has increasingly proven to be inadequate; the available capacity was not always sufficient to handle projects promptly."
hhpberlin数值模拟的科学负责人Susanne Kilian说：“几年来，我们一直在运行自己的小型集群，该集群具有多达80个处理器内核。” “但是，随着应用程序复杂性的提高，这种架构已经越来越不足够；可用容​​量并不总是足够迅速地处理项目。”

But just spending money on a new cluster wasn't an ideal solution, she says: "In view of the size and administrative environment of our company, the necessity of constant maintenance of this cluster (regular software and hardware upgrades) turned out to be impractical. Plus, the number of required simulation projects is subject to significant fluctuations, such that the utilization of the cluster was not really predictable. Typically, phases with very intensive use alternate with phases with little to no use." By moving to an HPC service model, hhpberlin shed that excess capacity and the need to pay up front for upgrades.
她说：“但是，仅仅花钱买一个新的集群并不是一个理想的解决方案：鉴于我们公司的规模和管理环境，持续维护该集群（定期进行软件和硬件升级）的必要性非常明显。另外，所需的模拟项目的数量会出现很大的波动，因此群集的使用情况并不是真正可预测的。通常，使用率很高的阶段与很少使用或不使用的阶段交替出现。”通过转换为HPC服务模式，hhpberlin消除了过剩的容量，无需支付升级费用。

IBM's Turek explains the calculus that different companies go through while assessing their needs. For a biosciences startup with 30 people, "you need computing, but you really can't afford to have 15% of your staff dedicated to it. It's just like you might also say you don't want to have on-staff legal representation, so you'll get that as a service as well." For a bigger company, though, it comes down to weighing the operational expense of an HPC service against the capacity expense of buying an in-house supercomputer or HPC cluster.
IBM的Turek解释了不同公司在评估其需求时所经历的计算过程。对于拥有30名员工的生物科学初创公司来说，“您需要计算，但您实在负担不起15％的员工专心致志。这就像您可能还说过，您不想拥有在职法律代表，因此您也可以将其作为服务获得。”但是，对于一家较大的公司而言，归结为权衡HPC服务的运营费用与购买内部超级计算机或HPC集群的容量费用。

So far, those are the same sorts of arguments you'd have over adopting any cloud service. But the opex vs. capex dilemma can be weighted towards the former by some of the specifics of the HPC market. Supercomputers aren't commodity hardware like storage or x86 servers; they're very expensive, and technological advances can swiftly render them obsolete. As McCormick Stevenson's Krawczyk puts it, "It's like buying a car: as soon as you drive off the lot it starts to depreciate." And for many companies –especially larger and less nimble ones – the process of buying a supercomputer can get hopelessly bogged down. "You're caught up in planning issues, building issues, construction issues, training issues, and then you have to execute an RFP," says IBM's Turek. "You have to work through the CIO. You have to work with your internal customers to make sure there's continuity of service. It's a very, very complex process and not something that a lot of institutions are really excellent at executing."
到目前为止，这些都是您采用任何云服务时都会遇到的相同类型的争论。但是，可以通过HPC市场的某些细节将运营支出与资本支出的困境加权为前者。超级计算机不是诸如存储或x86服务器之类的商用硬件；它们非常昂贵，技术进步会很快使其过时。正如麦考密克·史蒂文森（McCormick Stevenson）的克拉维奇（Krawczyk）所说，“这就像在买车：开车一走，它就会开始贬值。”对于许多公司，尤其是规模较大，灵活性较差的公司，购买超级计算机的过程可能会陷入无望的泥潭。 IBM的Turek说：“您陷入了计划问题，建筑问题，施工问题，培训问题，然后必须执行RFP。” “您必须通过CIO进行工作。您必须与内部客户合作以确保服务的连续性。这是一个非常非常复杂的过程，并不是很多机构在执行方面都非常出色。”

Once you choose to go down the services route for HPC, you'll find you get many of the advantages you expect from cloud services, particularly the ability to pay only for HPC power when you need it, which results in an efficient use of resources. Chirag Dekate, Senior Director and Analyst at Gartner, says bursty workloads, when you have short-term needs for high-performance computing, are a key use case driving adoption of HPC  services.
选择了HPC的服务路线后，您会发现您将从云服务中获得了许多期望，特别是仅在需要时才需要为HPC功能付费的能力，从而可以有效利用资源。 Gartner高级总监兼分析师Chirag Dekate表示，当您对高性能计算有短期需求时，突发性工作负载是推动HPC服务采用的关键用例。

"In the manufacturing industry, you tend to have a high peak of HPC activity around the product design stage," he says. "But once the product is designed, HPC resources are less utilized during the rest of the product-development cycle." In contrast, he says, "when you have large, long-running jobs, the economics of the cloud wear down."
他说：“在制造业中，在产品设计阶段，HPC活动往往会达到很高的峰值。” “但是，一旦产品设计完成，在其余产品开发周期中，HPC资源的利用率就会降低。” 相比之下，他说：“当您拥有大量长期运行的工作时，云的经济就会逐渐减弱。”

With clever system design, you can integrate those HPC-services bursts of activity with your own in-house conventional computing. Teresa Tung, managing director in Accenture Labs, gives an example: "Accessing HPC via APIs makes it seamless to mix with traditional computing. A traditional AI pipeline might have its training done on a high-end supercomputer at the stage when the model is being developed, but then the resulting trained model that runs predictions over and over would be deployed on other services in the cloud or even devices at the edge."
通过巧妙的系统设计，您可以将这些HPC服务突发事件与您自己的内部常规计算集成在一起。 埃森哲实验室常务董事董德丽举了一个例子：“通过API访问HPC可以无缝地与传统计算混合。在模型构建阶段，传统的AI管道可能会在高端超级计算机上进行培训。 开发出来的软件，但是最终生成的经过反复训练的模型将部署在云中的其他服务上，甚至部署在边缘设备上。”

### It's not for all use cases**

**

Use of HPC services lends itself to batch-processing and loosely-coupled use cases. That ties into a common HPC downside: data transfer issues. High-performance computing by its very nature often involves huge data sets, and sending all that information over the internet to a cloud service provider is no simple thing. "We have clients I talk to in the biotech industry who spend $10 million a month on just the data charges," says IBM's Turek.
HPC服务的使用适合批处理和松散耦合的用例。这与HPC的常见缺点有关：数据传输问题。从本质上讲，高性能计算通常涉及庞大的数据集，而将所有这些信息通过Internet发送到云服务提供商并不是一件容易的事。 IBM的Turek说：“我们与生物技术行业的客户交流，他们每月仅在数据费用上就花费1000万美元。”

And money isn't the only potential problem. Building a workflow that makes use of your data can challenge you to work around the long times required for data transfer. "When we had our own HPC cluster, local access to the simulation results already produced – and thus an interactive interim evaluation — was of course possible at any time," says hhpberlin's Kilian. "We're currently working on being able to access and evaluate the data produced in the cloud even more efficiently and interactively at any desired time of the simulation without the need to download large amounts of simulation data."
金钱并不是唯一的潜在问题。建立一个利用您的数据的工作流程可能会挑战您在数据传输所需的长时间内工作。 hhpberlin的Kilian说：“当我们拥有自己的HPC集群时，当然可以随时本地访问已经产生的仿真结果，从而进行交互式的临时评估。” “我们目前正在努力，能够在任何所需的模拟时间更高效，交互地访问和评估云中生成的数据，而无需下载大量的模拟数据。”

Mike Krawczyk cites another stumbling block: compliance issues. Any service a defense contractor uses needs to be complaint with the International Traffic in Arms Regulations (ITAR), and McCormick Stevenson went with Rescale in part because it was the only vendor they found that checked that box. While more do today, any company looking to use cloud services should be aware of the legal and data-protection issues involved in living on someone else's infrastructure, and the sensitive nature of many of HPC's use cases makes this doubly true for HPC as a service.
Mike Krawczyk提到了另一个绊脚石：合规性问题。国防承包商使用的任何服务都需要向《国际武器交易条例》（ITAR）进行投诉，麦考密克·史蒂文森（McCormick Stevenson）之所以选择Rescale，部分原因是这是他们发现该复选框的唯一供应商。如今，尽管有更多的公司这样做，但任何希望使用云服务的公司都应该意识到生活在其他人的基础架构上所涉及的法律和数据保护问题，而且许多HPC用例的敏感性质使得这对于HPC即服务而言是双重事实。 。

In addition, the IT governance that HPC services require goes beyond regulatory needs. For instance, you'll need to keep track of whether your software licenses permit cloud use ­– especially with specialized software packages written to run on an on-premises HPC cluster. And in general, you need to keep track of how you use HPC services, which can be a tempting resource, especially if you've transitioned from in-house systems where staff was used to having idle HPC capabilities available. For instance, Ron Gilpin, senior director and Azure Platform Services global lead at Avanade, suggests dialing back how many processing cores you use for tasks that aren't time sensitive. "If a job only needs to be completed in an hour instead of ten minutes," he says, "that might use 165 processors instead of 1,000, a savings of thousands of dollars."
此外，HPC服务所需的IT治理超出了监管需求。例如，您需要跟踪您的软件许可证是否允许云使用­ –尤其是针对专门编写在本地HPC群集上运行的软件包。通常，您需要跟踪HPC服务的使用方式，这可能是一个诱人的资源，尤其是当您从习惯于工作人员的内部系统过渡到具有可用的空闲HPC功能时。例如，Avanade全球平台高级主管兼Azure平台服务全球负责人Ron Gilpin建议，回拨您用于非时间敏感任务的处理核心数量。他说：“如果一项工作只需要一个小时而不是十分钟就可以完成，那么它可以使用165个处理器而不是1,000个，从而节省了数千美元。”

### A premium on HPC skills**

**

One of the biggest barriers to HPC adoption has always been the unique in-house skills it requires, and HPC services don't magically make that barrier vanish. "Many CIOs have migrated a lot of their workloads into the cloud and they have seen cost savings and increased agility and efficiency, and believe that they can achieve similar results in HPC ecosystems," says Gartner's Dekate. "And a common misperception is that they can somehow optimize human resource cost by essentially moving away from system admins and hiring new cloud experts who can solve their HPC workloads."
一直以来，采用HPC的最大障碍之一就是其所需的独特内部技能，而HPC服务并不能使这种障碍消失。 Gartner的Dekate表示：“许多CIO将许多工作负载迁移到了云中，他们看到了节省成本，提高敏捷性和效率的信念，并且相信他们可以在HPC生态系统中实现类似的结果。” “一个普遍的误解是，他们可以从本质上远离系统管理员，并聘用可以解决其HPC工作负载的新云专家，从而以某种方式优化人力资源成本。”

"But HPC is not one of the main enterprise environments," he says. "You're dealing with high-end compute nodes interconnected with high-bandwidth, low-latency networking stacks, along with incredibly complicated application and middleware stacks. Even the filesystem layers in many cases are unique to HPC environments. Not having the right skills can be destabilizing."
他说：“但是HPC并不是主要的企业环境之一。” “您正在处理与高带宽，低延迟网络堆栈以及难以置信的复杂应用程序和中间件堆栈互连的高端计算节点。在许多情况下，甚至文件系统层也是HPC环境所独有的。没有适当的技能 可能会破坏稳定。”

But supercomputing skills are in shortening supply, something Dekate refers to as the workforce "greying," in the wake of a generation of developers going to splashy startups rather than academia or the more staid firms where HPC is in use. As a result, vendors of HPC services are doing what they can to bridge the gap. IBM's Turek says that many HPC vets will always want to roll their own exquisitely fine-tuned code and will need specialized debuggers and other tools to help them do that for the cloud. But even HPC newbies can make calls to code libraries built by vendors to exploit supercomputing's parallel processing. And third-party software providers sell turnkey software packages that abstract away much of HPC's complication.
但是超级计算技术却在缩短供应，Dekate将其称为劳动力“灰色”，这是因为一代开发人员将目光投向了新兴的初创公司，而不是学术界或使用HPC的更老套的公司。结果，HPC服务的供应商正在尽其所能弥合差距。 IBM的Turek表示，许多HPC兽医将始终希望推出他们自己精心调整过的代码，并且将需要专门的调试器和其他工具来帮助他们在云中实现这一目标。但是，即使是HPC新手也可以调用供应商构建的代码库，以利用超级计算的并行处理。第三方软件提供商出售的交钥匙软件包可以消除许多HPC复杂性。

Accenture's Tung says the sector needs to lean further into this in order to truly prosper. "HPCaaS has created dramatically impactful new capability, but what needs to happen is making this easy to apply for the data scientist, the enterprise architect, or the software developer," she says. "This includes easy to use APIs, documentation, and sample code. It includes user support to answer questions. It’s not enough to provide an API; that API needs to be fit-for-purpose. For a data scientist this should likely be in Python and easily change out for the frameworks she is already using. The value comes from enabling these users who ultimately will have their jobs improved through new efficiencies and performance, if only they can access the new capabilities." If vendors can pull that off, HPC services might truly bring supercomputing to the masses.
埃森哲的董先生表示，该行业需要进一步倾斜才能真正繁荣。她说：“ ​​HPCaaS已经创建了具有重大影响力的新功能，但是需要做的是使它易于应用于数据科学家，企业架构师或软件开发人员。” “这包括易于使用的API，文档和示例代码。它包含用户回答问题的支持。仅提供API是不够的； API需要适合特定用途。对于数据科学家而言，这可能应该包含在其中。使用Python并轻松地更改她已经在使用的框架。其价值来自使这些用户能够获得新的效率和性能，只要他们能够使用新功能，他们最终将通过新的效率和性能来改善他们的工作。”如果供应商能够做到这一点，那么HPC服务可能真正将超级计算带入大众。

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.
加入[Facebook] [3]和[LinkedIn] [4]上的Network World社区，以评论最重要的主题。
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
