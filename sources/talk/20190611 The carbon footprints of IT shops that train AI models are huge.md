[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The carbon footprints of IT shops that train AI models are huge)
[#]: via: (https://www.networkworld.com/article/3401919/the-carbon-footprints-of-it-shops-that-train-ai-models-are-huge.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

The carbon footprints of IT shops that train AI models are huge
======
Artificial intelligence (AI) model training can generate five times more carbon dioxide than a car does in a lifetime, researchers at the University of Massachusetts, Amherst find.
![ipopba / Getty Images][1]

A new research paper from the University of Massachusetts, Amherst looked at the carbon dioxide (CO2) generated over the course of training several common large artificial intelligence (AI) models and found that the process can generate nearly five times the amount as an average American car over its lifetime plus the process of making the car itself.

The [paper][2] specifically examined the model training process for natural-language processing (NLP), which is how AI handles natural language interactions. The study found that during the training process, more than 626,000 pounds of carbon dioxide is generated.

This is significant, since AI training is one IT process that has remained firmly on-premises and not moved to the cloud. Very expensive equipment is needed, as is large volumes of data, so the cloud isn’t right work for most AI training, and the report notes this. Plus, IT shops want to keep that kind of IP in house. So, if you are experimenting with AI, that power bill is going to go up.

**[ Read also:[How to plan a software-defined data-center network][3] ]**

While the report used carbon dioxide as a measure, that’s still the product of electricity generation. Training involves the use of the most powerful processors, typically Nvidia GPUs, and they are not known for being low-power draws. And as the paper notes, “model training also incurs a substantial cost to the environment due to the energy required to power this hardware for weeks or months at a time.”

Training is the most processor-intensive portion of AI. It can take days, weeks, or even months to “learn” what the model needs to know. That means power-hungry Nvidia GPUs running at full utilization for the entire time. In this case, how to handle and process natural language questions rather than broken sentences of keywords like your typical Google search.

The report said training one model with a neural architecture generated 626,155 pounds of CO2. By contrast, one passenger flying round trip between New York and San Francisco would generate 1,984 pounds of CO2, an average American would generate 11,023 pounds in one year, and a car would generate 126,000 pounds over the course of its lifetime.

### How the researchers calculated the CO2 amounts

The researchers used four models in the NLP field that have been responsible for the biggest leaps in performance. They are Transformer, ELMo, BERT, and GPT-2. They trained all of the models on a single Nvidia Titan X GPU, with the exception of ELMo which was trained on three Nvidia GTX 1080 Ti GPUs. Each model was trained for a maximum of one day.

**[[Learn Java from beginning concepts to advanced design patterns in this comprehensive 12-part course!][4] ]**

They then used the number of training hours listed in the model’s original papers to calculate the total energy consumed over the complete training process. That number was converted into pounds of carbon dioxide equivalent based on the average energy mix in the U.S.

The big takeaway is that computational costs start out relatively inexpensive, but they mushroom when additional tuning steps were used to increase the model’s final accuracy. A tuning process known as neural architecture search ([NAS][5]) is the worst offender because it does so much processing. NAS is an algorithm that searches for the best neural network architecture. It is seriously advanced AI and requires the most processing time and power.

The researchers suggest it would be beneficial to directly compare different models to perform a cost-benefit (accuracy) analysis.

“To address this, when proposing a model that is meant to be re-trained for downstream use, such as re-training on a new domain or fine-tuning on a new task, authors should report training time and computational resources required, as well as model sensitivity to hyperparameters. This will enable direct comparison across models, allowing subsequent consumers of these models to accurately assess whether the required computational resources,” the authors wrote.

They also say researchers who are cost-constrained should pool resources and avoid the cloud, as cloud compute time is more expensive. In an example, it said a GPU server with eight Nvidia 1080 Ti GPUs and supporting hardware is available for approximately $20,000. To develop the sample models used in their study, that hardware would cost $145,000, plus electricity to run the models, about half the estimated cost to use on-demand cloud GPUs.

“Unlike money spent on cloud compute, however, that invested in centralized resources would continue to pay off as resources are shared across many projects. A government-funded academic compute cloud would provide equitable access to all researchers,” they wrote.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3401919/the-carbon-footprints-of-it-shops-that-train-ai-models-are-huge.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/ai-vendor-relationship-management_artificial-intelligence_hand-on-virtual-screen-100795246-large.jpg
[2]: https://arxiv.org/abs/1906.02243
[3]: https://www.networkworld.com/article/3284352/data-center/how-to-plan-a-software-defined-data-center-network.html
[4]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fjava
[5]: https://www.oreilly.com/ideas/what-is-neural-architecture-search
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
