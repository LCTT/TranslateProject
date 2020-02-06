[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Intel drops work on one of its AI-chip lines in favor of an other)
[#]: via: (https://www.networkworld.com/article/3519354/intel-ends-nervana-ai-chip-in-favor-of-habana-labs-product.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Intel drops work on one of its AI-chip lines in favor of an other
======
Intel is focusing its efforts around the newly acquired Habana product line and moving to a single hardware architecture and software stack for data-center AI acceleration, winding down work on its Nervana AI chip.
dny59 / Getty Images

Well, that was short.

Intel is ending work on its Nervana neural network processors (NNP) in favor of an artificial intelligence line it gained in the recent $2 billion acquisition of Habana Labs.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

Intel acquired Nervana in 2016 and issued its first NNP chip [one year later][2]. After the $408 million acquisition by Intel, Nervana co-founder Naveen Rao was placed in charge of the AI platforms group, which is part of Intel's data platforms group. The Nervana chips were meant to compete with Nvidia GPUs in the AI inference training space, and Facebook worked with Intel “in close collaboration, sharing its technical insights,” according to former Intel CEO Brian Krzanich.

For now, Intel has ended development of its Nervana NNP-T training chips and will deliver on current customer commitments for its Nervana NNP-I inference chips; Intel will move forward with Habana Labs' Gaudi and Goya processors in their place.

There are two parts to neural networks: training, where the computer learns a process, such as image recognition; and inference, where the system puts what it was trained to do to work. Training is far more compute-intensive than inference, and it’s where Nvidia has excelled.

Intel said the decision was made after input from customers, and that this decision is part of strategic updates to its [data-center][3] AI acceleration roadmap. "We will leverage our combined AI talent and technology to build leadership AI products," the company said in a statement to me.

“The Habana product line offers the strong, strategic advantage of a unified, highly-programmable architecture for both inference and training. By moving to a single hardware architecture and software stack for data-center AI acceleration, our engineering teams can join forces and focus on delivering more innovation, faster to our customers,” Intel said.

This outcome from the Habana acquisition wasn't entirely unexpected. "We had thought that they might keep one for training and one for inference. However, Habana's execution has been much better and the architecture scales better. And, Intel still gained the IP and expertise of both companies,” said Jim McGregor, president of [Tirias Research][4].

The good news is that whatever developers created for Nervana won’t have to be thrown out. “The frameworks work on either architecture,” McGregor said. "While there will be some loss going from one architecture to another, there is still value in the learning, and I'm sure Intel will work with customers to help them with the migration.”

This is the second AI/machine learning effort Intel has shut down, the first being Xeon Phi. Xeon Phi itself was a bit of a problem child, dating back to Intel’s failed Larrabee experiment to build a GPU based on x86 instructions. Larrabee never made it out of the gate, while Xeon Phi lasted a few generations as a co-processor but was ultimately [axed in August 2018][5].

Intel still has a lot of products targeting various AI: Mobileye, Movidius, Agilex FPGA, and its upcoming Xe architecture. Habana Labs has been shipping its Goya Inference Processor since late 2018, and samples of its Gaudi AI Training Processor were sent to select customers in the second half of 2019.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3519354/intel-ends-nervana-ai-chip-in-favor-of-habana-labs-product.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3234530/intel-introduces-an-ai-oriented-processor.html
[3]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[4]: https://www.tiriasresearch.com/
[5]: https://www.networkworld.com/article/3296004/intel-ends-the-xeon-phi-product-line.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
