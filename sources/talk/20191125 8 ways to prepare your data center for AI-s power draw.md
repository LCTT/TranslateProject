[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (8 ways to prepare your data center for AI’s power draw)
[#]: via: (https://www.networkworld.com/article/3454626/8-ways-to-prepare-your-data-center-for-ai-s-power-draw.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

8 ways to prepare your data center for AI’s power draw
======
Artificial intelligence requires greater processor density, which increases the demand for cooling and raises power requirements.
Thinkstock

As artificial intelligence takes off in enterprise settings, so will data center power usage. AI is many things, but power efficient is not one of them.

For data centers running typical enterprise applications, the average power consumption for a rack is around 7 kW. Yet it’s common for AI applications to use more than 30 kW per rack, according to data center organization [AFCOM][1]. That’s because AI requires much higher processor utilization, and the processors – especially GPUs – are power hungry. Nvidia GPUs, for example, may run several orders of magnitude faster than a CPU, but they also consume twice as much power per chip. Complicating the issue is that many data centers are already power constrained.

**READ MORE:** [Do you really need high performance computing?][2]

Cooling is also an issue: AI-oriented servers require greater processor density, which means more chips crammed into the box, and they all run very hot. Greater density, along with higher utilization, increases the demand for cooling as compared to a typical back-office server. Higher cooling requirements in turn raise power demands. 

[][3]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][3]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

So what can you do if you want to embrace AI for competitive reasons but the power capacity of your existing facility isn’t up to the high-density infrastructure requirements of AI? Here are some options.

### Consider liquid cooling

Fan cooling typically loses viability once a rack exceeds 15 kW. Water, however, has 3,000 times the heat capacity of air, according to [CoolIT Systems][4], a maker of enterprise liquid cooling products. As a result, server cabinet makers have been adding liquid pipes to their cabinets and connecting water piping to their heat sinks instead of fans.

“Liquid cooling is definitely a very good option for higher density loads,” says John Sasser, senior vice president for data center operations at [Sabey][5], a developer and operator of data centers. “That removes the messy airflow issue. Water removes a lot more heat than air does, and you can direct it through pipes. A lot of HPC [high performance computing] is done with liquid cooling.”

Most data centers are set up for air cooling, so liquid cooling will require a capital investment, “but that might be a much more sensible solution for these efforts, especially if a company decides to move in the direction [of AI],” Sasser says.

### Run AI workloads at lower resolutions

Existing data centers might be able to handle AI computational workloads but in a reduced fashion, says Steve Conway, senior research vice president for [Hyperion Research][6]. Many, if not most, workloads can be operated at half or quarter precision rather than 64-bit double precision.

“For some problems, half precision is fine,” Conway says. “Run it at lower resolution, with less data. Or with less science in it.”

Double-precision floating point calculations are primarily needed in scientific research, which is often done at the molecular level. Double precision is not typically used in AI training or inference on deep learning models because it is not needed. Even Nvidia [advocates][7] for use of single- and half-precision calculations in deep neural networks.

### Build an AI containment segment

AI will be a part of your business but not all, and that should be reflected in your data center. “The new facilities that are being built are contemplating allocating some portion of their facilities to higher power usage,” says Doug Hollidge, a partner with [Five 9s Digital][8], which builds and operates data centers. “You’re not going to put all of your facilities to higher density because there are other apps that have lower draw.”

The first thing to do is assess the energy supply to the building, Hollidge says. “If you are going to increase energy use in the building, you’ve got to make sure the power provider can increase the power supply.”

Bring in an engineer to assess which portion of the data center is best equipped for higher density capabilities. Workload requirements will determine the best solution, whether it be hot aisle containment or liquid cooling or some other technology. “It’s hard to give one-size-fits-all solution since all data centers are different,” Hollidge says.

### Spread out your AI systems

An alternative approach – rather than crowding all your AI systems into one spot hotter than Death Valley in August – is to spread them out among the racks.

“Most of the apps are not high density. They run at eight to 10 kilowatts and up to 15 kilowatts. You can handle that with air,” says David McCall, chief innovation officer with [QTS][9], a builder of data centers.

In an optimized heterogeneous environment, a collocation provider might have a rack or two in a cabinet to host an HPC or AI environment, and the rest of the racks in the cabinet are dedicated to hosting less power-hungry applications, such as databases and back-office apps. That won't yield a 5 kW rack, but it gets a rack closer to 12 kW or 15 kW, which is an environment that air cooling can handle, McCall says.

### Control hot air flow in the data center

Standard data center layout is hot aisle/cold aisle, where the cabinets are laid out in alternating rows so that cold air intakes face each other on one front-facing aisle, and hot air exhausts face each other on the alternating back-facing aisle. That works fine, but access can be tricky if an IT worker needs to get behind a cabinet to work on a server.

The other problem is that air is “messy,” as Sasser put it. Power is often easier to model because it flows through conductors, and you can control (and thus plan and model) where power goes. Air goes where it wants and is hard to control.

Sabey customers that want higher density environments use a hot aisle containment pod to control air flow. The company puts doors at the end of the hot aisle and plastic plates over the top, so heat is directed into a ceiling intake pipe and the barriers keep hot air and cold air from mixing.

"In an air-cooled server world, the advice I give is go with a hot aisle containment environment,” Sasser says. "The other advice I would give is make sure the data center is tested for air flow, not just modeled for airflow. Modeling is dependent on a lot of variables, and they easily change."

### Consider a chimney cabinet

Another way to help manage temperatures in data centers is to use a chimney cabinet. Instead of venting the hot air out the back, a chimney cabinet uses good old physics convection to send hot air up into a chimney, which is then connected to an air conditioning vent. [Chatsworth Systems][10] is best known for this style of cabinets.

“The air pathway is more constrained this way,” Sasser says. “Since that air pathway is more constrained, you can get greater density into a cabinet than with a hot aisle pod.”

### Process data where it resides

Moving data around has a very high energy cost: It can take up to 100 times more energy to move data than it takes to process data, Conway says. Any form of data movement requires electricity, and that power drain increases with the volume of data – a significant issue for data-intensive AI applications. “You want to move data as rarely and as little distance as you can,” Conway says.

“The solution is not to have to move the data any more or further than is absolutely necessary. So people are striving to put data closer to where it is processed. One thing cloud services providers and people who use cloud services agree on is it doesn’t make sense to move a massive amount of data to a third-party cloud,” he says.

### Consider leasing data center space

Most of the companies looking to implement AI are corporations that lease data center space from a data center operator, Hollidge says. There are some data center operators that are not capable of handling high density AI computation, but some have transitioned to offering a portion of high density environments for AI.

“You might have to go through a few providers before finding it, but there is more attention being paid to that on the data center operations side,” Hollidge says. And a third-party data center provider gives you more growth options. “Most of the time you are better off entering into a flexible lease that allows you to expand and grow your AI business as opposed to building ground up.”

### Wait for next-generation servers

Supercomputers to date haven’t been very data friendly, Conway says. As supercomputers have gotten bigger, the designs have gotten less data-centric. The result is that more data has to be moved around and shuttled between processors, memory, and storage systems. And as discussed above, it costs more power to move data than to process it.

The first exascale systems will come with more accelerators and more powerful interconnections for moving around data. And many innovations that start in supercomputing, including GPUs and storage-class memory (SCM), eventually work their way down to more mainstream servers.

Future servers also will come with a more heterogeneous chip layout; instead of all x86 CPUs, they will include GPUs, FPGAs, and AI accelerators. And for high speed storage, NVMe-over-Fabric and SCM will become more affordable. Servers are set to change in the coming years, and many of the advances will benefit enterprise AI application environments.

**Learn more about HPC and supercomputers**

  * [HPE to buy Cray, offer HPC as a service][11]
  * [Decommissioning the Titan supercomputer][12]
  * [10 of the world's fastest supercomputers][13]
  * [What’s quantum computing and why should enterprises care?][14]
  * [Who’s developing quantum computers?][15]



Join the Network World communities on [Facebook][16] and [LinkedIn][17] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3454626/8-ways-to-prepare-your-data-center-for-ai-s-power-draw.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.afcom.com/
[2]: https://www.networkworld.com/article/3444399/high-performance-computing-do-you-need-it.html
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: https://www.coolitsystems.com/
[5]: https://sabeydatacenters.com/
[6]: https://hyperionresearch.com/
[7]: https://devblogs.nvidia.com/mixed-precision-training-deep-neural-networks/
[8]: https://five9sdigital.com/
[9]: https://www.qtsdatacenters.com/
[10]: https://www.chatsworth.com/en-us/products/families/teraframe
[11]: https://www.networkworld.com/article/3396220/hpe-to-buy-cray-offer-hpc-as-a-service.html
[12]: https://www.networkworld.com/article/3408176/the-titan-supercomputer-is-being-decommissioned-a-costly-time-consuming-project.html
[13]: https://www.networkworld.com/article/3236875/embargo-10-of-the-worlds-fastest-supercomputers.html#slide1
[14]: https://www.networkworld.com/article/3275367/what-s-quantum-computing-and-why-enterprises-need-to-care.html#nww-fsb
[15]: https://www.networkworld.com/article/3275385/who-s-developing-quantum-computers.html
[16]: https://www.facebook.com/NetworkWorld/
[17]: https://www.linkedin.com/company/network-world
