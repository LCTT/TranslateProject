[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Beyond Moore's Law: Neuromorphic computing?)
[#]: via: (https://www.networkworld.com/article/3514692/beyond-moores-law-neuromorphic-computing.html)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

Beyond Moore's Law: Neuromorphic computing?
======
Some researchers think brain-copying architectures should replace traditional computing. One group explains how that might work.
4x-image / Getty Images

With the conceivable exhaustion of [Moore’s Law][1] – that the number of transistors on a microchip doubles every two years – the search is on for new paths that lead to reliable incremental processing gains over time.

One possibility is that machines inspired by how the brain works could take over, fundamentally shifting computing to a revolutionary new tier, according to an explainer study released this month by Applied Physics Reviews.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][2]

“Today’s state-of-the-art computers process roughly as many instructions per second as an insect brain,” say [the paper’s][3] authors Jack Kendall, of Rain Neuromorphics, and Suhas Kumar, of Hewlett Packard Labs. The two write that processor architecture must now be completely re-thought if Moore’s law is to be perpetuated, and that replicating the “natural processing system of a [human] brain” is the way forward.

[][4]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][4]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

Deep neural networks (DNNs) should be the foundation, the group believes. A DNN is basically dynamic deep learning where layers pull high- and low-level detail features (edges and shapes, for example) from data. Kendall and Kumar explain that a human brain, which DNN copies, can sort through massive datasets and generally identify data  better than a traditional computer, so therefore it should be the starting point.

This kind of thing is being attempted already. Existing artificial intelligence (AI) is a stab at getting computers to learn like a human brain. Much like the brain, AI engines learn from patterns in data. Algorithms are combined with processing power, and rewards are dished out when the machine gets it right.

A brain-inspired neuromorphic computer, however, would take computing a step further, the team believes. Neuromorphic computing mimics neuro-biological architectures in a kind of hybrid digital-analog circuit, in a way like a body does biologically.

The group says that they think there are 10 basics that need to be gotten right to get to this next level:

**Parellelism** – Similar to how a brain works rapidly, numerous mathematical operations must be made to occur simultaneously. It’s an extension of what we see now in graphical processing units (GPUs) where large scale graphics are created using concurrent calculations called matrix multiplications.

**In-memory computing** – It wastes resources to fetch data from remote places, and human brains, indeed, don’t do that; they store information in the same synapses that perform the thought. The introduction of electronic processing semiconductors that combine memory – [Memristors –][5] could help here. (I wrote a few weeks ago about [progress being made combining transistors with storage][6]. That combo could have similar resource advantages.)

**Analog computing** – Numbers are analog, not digital, the authors point out. Most real-world numbers aren’t zeros and ones, so, for efficiency, any new computing architecture needs to accept that concept, adapt and handle the inherent precision problems that result.

**Plasticity** – Real-time tuning needs to take place to account for things changing.

**Probabilistic computing** – The authors suggest computers should get less precise, just like the human brain. Coming up with certain degrees of probability is faster than precise calculation, and it requires less information.

**Scalability** – The depth of the network allows for complexity. By introducing more layers, one gains more scaling.

**Sparsity** – Large-scale networks, including neural computers, can’t connect every node, just as not all neurons are connected to each other in the brain. It’s a redundancy that wastes resources. Hub-and-spoke topology works better and allows for better scaling. The same should happen in the next computers, the researchers say.

**Learning (credit assignment)** – The adjustment of synaptic weights (the strength and amount of influence synapses have) needs attention related to new information presented.

**Causality** – The relationship between cause and effect in a result has to be addressed. Causal interference is a problem, and machine learning generally has had problems with getting this bit right.

**Nonlinearity** – The brain isn’t linear like a computer is. “The brain operates at the edge of chaos to produce the most optimal learning and computation,” the team says. The next computer architecture needs to encompass that brain-like nonlinearity, but also operate within linearity, like today’s electronics.

“Our present hardware is not able to keep up,” Kendall and Kumar say in their paper, which also looks at materials. “The future of computing will not be about cramming more components on a chip but in rethinking processor architecture,” which should be neuromorphic.

**Now see** [10 of the world's fastest supercomputers][7]

Join the Network World communities on [Facebook][8] and [LinkedIn][9] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3514692/beyond-moores-law-neuromorphic-computing.html

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Patrick-Nelson/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3189051/its-time-to-dump-moores-law-to-advance-computing-researcher-says.html
[2]: https://www.networkworld.com/newsletters/signup.html
[3]: https://aip.scitation.org/doi/10.1063/1.5129306
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.networkworld.com/article/2931818/brain-uploads-coming-as-pcs-get-more-powerful.html
[6]: https://www.networkworld.com/article/3510638/researchers-aim-to-build-transistors-that-can-compute-and-store-information-in-one-component.html
[7]: https://www.networkworld.com/article/3236875/embargo-10-of-the-worlds-fastest-supercomputers.html
[8]: https://www.facebook.com/NetworkWorld/
[9]: https://www.linkedin.com/company/network-world
