[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Amazon Braket lets customers try out quantum computing)
[#]: via: (https://www.networkworld.com/article/3570251/amazon-braket-lets-customers-try-out-quantum-computing.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Amazon Braket lets customers try out quantum computing
======
AWS joins IBM, Microsoft, Google and others in growing quantum computing arena
[Glosser.ca / Pete Linforth][1] [(CC BY-SA 3.0)][2]

AWS has announced the availability of a new service that lets customers tap into and experiment with [quantum computing][3] simulators and access quantum hardware from [D-Wave][4], [IonQ][5], and [Rigetti][6].

The managed service, [Amazon Braket][7], offers customers a development environment where they can explore and build quantum algorithms, test them on quantum circuit simulators, and run them on different quantum hardware technologies, AWS said in a [statement][7] about the service. The Braket service includes Jupyter notebooks that come pre-installed with the Amazon Braket SDK and example tutorials.

**Read more: [What is quantum computing? (and why enterprises should care)][3] **

According to AWS, Braket provides access to a fully managed, high-performance, quantum circuit simulator that lets users test and validate circuits with a single line of code. In addition, as a native AWS service, Braket can be managed via the AWS management console. (Related: [Amazon joins the quantum computing crowd with Braket testbed][8])

The service is named after the standard notation in quantum mechanics bra-ket, which was introduced by Paul Dirac in 1939 to describe the state of quantum systems and is also known as the [Dirac notation][9].

"Quantum computing has the potential to solve computational problems that are beyond the reach of classical computers by harnessing the laws of quantum mechanics to process information in new ways," AWS stated. "This approach to computing could transform areas such as chemical engineering, material science, drug discovery, financial portfolio optimization, and machine learning. But defining those problems and programming quantum computers to solve them requires new skills, which are difficult to acquire without easy access to quantum computing hardware."

In a blog about Braket, Jeff Barr, Chief Evangelist for AWS, said there are a few things customers should keep in mind about Braket:

  * Quantum computing is an emerging field. "Although some of you are already experts, it will take some time for the rest of us to understand the concepts and the technology, and to figure out how to put them to use."
  * The [quantum processing units] QPUs accessed through Amazon Braket support two different paradigms. The IonQ and Rigetti QPUs and the simulator support circuit-based quantum computing, and the D-Wave QPU supports quantum annealing. You cannot run a problem designed for one paradigm on a QPU that supports the other one, so you will need to choose the appropriate QPU early.
  * Each task will incur a per-task charge and an additional per-shot charge that is specific to the type of QPU used. Use of the simulator incurs an hourly charge, billed by the second, with a 15 second minimum. For more information, check out [Amazon Braket Pricing][10] 



The Amazon Braket rollout follows similar [quantum service][11] introductions from [IBM][12], [Microsoft][13], [QC Ware, ][14]Google, Honeywell and others in what is becoming a growing market. Researchers at [Tractica][15] for example, forecast that total enterprise quantum computing market revenue will reach $9.1 billion annually by 2030, up from $111.6 million in 2018. "The global market for quantum computing is being driven largely by the desire to increase the capability of modeling and simulating complex data, improve the efficiency or optimization of systems or processes, and solve problems with more precision," Tractica stated.

Gartner has called quantum computing one of the top potential disruptive technologies in the next five years, stating that the parallel execution and exponential scalability of quantum computers means they excel with problems too complex for a traditional approach or where traditional algorithms would take too long to find a solution. Industries such as automotive, financial, insurance, pharmaceuticals, military and research have the most to gain from the advancements in quantum computing. Most organizations should learn about and monitor QC through 2022 and perhaps exploit it from 2023 or 2025, Gartner stated.

Join the Network World communities on [Facebook][16] and [LinkedIn][17] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3570251/amazon-braket-lets-customers-try-out-quantum-computing.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/File:Bloch_Sphere.svg
[2]: https://creativecommons.org/licenses/by-sa/3.0/legalcode
[3]: https://www.networkworld.com/article/3275367/what-s-quantum-computing-and-why-enterprises-need-to-care.html
[4]: https://aws.amazon.com/braket/hardware-providers/dwave/
[5]: https://aws.amazon.com/braket/hardware-providers/ionq/
[6]: https://aws.amazon.com/braket/hardware-providers/rigetti/
[7]: https://aws.amazon.com/braket/
[8]: https://www.networkworld.com/article/3487421/amazon-joins-the-quantum-computing-crowd-with-braket-testbed.html
[9]: https://en.wikipedia.org/wiki/Bra%E2%80%93ket_notation
[10]: https://aws.amazon.com/braket/pricing
[11]: https://www.networkworld.com/article/3489098/10-hot-quantum-computing-startups-to-watch.html
[12]: https://www.ibm.com/blogs/research/category/quantcomp/
[13]: https://www.microsoft.com/en-us/quantum/
[14]: https://qcware.com/
[15]: https://tractica.omdia.com/newsroom/press-releases/the-quantum-computing-market-is-poised-for-strong-growth-with-global-revenue-to-reach-9-1-billion-by-2030/
[16]: https://www.facebook.com/NetworkWorld/
[17]: https://www.linkedin.com/company/network-world
