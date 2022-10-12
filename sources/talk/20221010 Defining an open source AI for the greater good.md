[#]: subject: "Defining an open source AI for the greater good"
[#]: via: "https://opensource.com/article/22/10/defining-open-source-ai"
[#]: author: "Stefano Maffulli https://opensource.com/users/reed"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Defining an open source AI for the greater good
======
Join the conversation by joining the four Deep Dive: AI panel discussions starting on October 11.

Artificial intelligence (AI) has become more prevalent in our daily lives. While AI systems may intend to offer users convenience, there have been numerous examples of automated tools getting it wrong, resulting in serious consequences. What's happening in the AI system that leads to erroneous and harmful conclusions? Probably a dramatic combo of bad AI combined with a lack of human oversight. How do we as a society prevent AI ethics fails?

The open source community has had, for well over 20 years, clear processes for dealing with errors ("bugs") in software. The [Open Source Definition][2] firmly establishes the rights of developers and the rights of users. There are frameworks, licenses, and a legal understanding of what needs to be done. When you find a bug, you know who to blame, you know where to report it, and you know how to fix it. But when it comes to AI, do you have the same understanding of what you need to do in order to fix a bug, error, or bias?

In reality, there are many facets of AI that don't fit neatly into the Open Source Definition.

### Establishing boundaries for AI

What's the boundary between the data that trains an AI system and the software itself? In many ways, AI systems are like black boxes: it isn't really understood what happens inside, and very little insight for how a system has reached a specific conclusion. You can't inspect the networks inside that are responsible for making a judgment call. So how can open source principles apply to these "black boxes" making automated decisions?

For starters, you need to take a step back and understand what goes into an AI's automated decision-making process.

### The AI decision process

The AI process starts with collecting vast amounts of training data-data scraped from the internet, tagged and cataloged, and fed into a model to teach it how to make decisions on its own. However, the process of collecting a set of training data is itself problematic. It's a very expensive and time-consuming endeavor, so large corporations are better positioned to have the resources to build large training sets. Companies like Meta (Facebook) and Alphabet (Google) have been collecting people's data and images for a long, long time. (Think of all the pictures you've uploaded since before Facebook or even MySpace existed. I've lost track of all the pictures I've put online!) Essentially anything on the Internet is fair game for data collection, and today mobile phones are basically real-time sensors feeding data and images to a few mega-corporations and then to Internet-scrapers.

Examining the data going into the system is just scratching the surface. I haven't yet addressed the models and neural networks themselves. What's in an AI model? How do you know when you're chatting with a bot? How do you inspect it? How do you flag an issue? How do we fix it? How do we stop it in case it gets out of control?

It's no wonder that governments around the world are not only excited about AI and the good that AI could do, but also very concerned about the risks. How do we protect each other, and how do we ask for a *fair* AI? How do we establish not just rules and regulations, but also social norms that help us all define and understand acceptable behavior? We're just now beginning to ask these questions, and only just starting to identify all the pieces that need to be examined and considered.

To date, there aren't any guiding principles or guardrails to orient the conversation between stakeholders in the same way that, for instance, the [GNU Manifesto][3] and later the Open Source Definition provides. So far, everyone (corporations, governments, academia, and others) has moved at their own pace, and largely for their own self-interests. That's why the Open Source Initiative (OSI) has stepped forward to initiate a collaborative conversation.

### Open Source Initiative

The Open Source Initiative has launched [Deep Dive: AI][4], a three-part event to uncover the peculiarities of AI systems, to build understanding around where guardrails are needed, and to define Open Source in the context of AI. Here's a sampling of what the OSI has discovered so far.

#### Copyright

AI models may not be covered by copyright. Should they be?

Developers, researchers, and corporations share models publicly, some with an Open Source software license. Is that the right thing to do?

The output of AI may not be covered by copyright. That raises an interesting question: Do we want to apply copyright to this new kind of artifact? After all, copyleft was invented as a hack for copyright. Maybe this is the chance to create an alternative legal framework.

The release of the new Stable Diffusion model raises issues around the output of the models. Stable Diffusion has been trained on lots of images, including those owned by Disney. When you ask it to, for instance, create a picture of Mickey Mouse going to the US Congress, it spits out an image that looks exactly like Mickey Mouse in front of the US Capitol Building. That image may not be covered by copyright, but I bet you that the moment someone sells t-shirts with these pictures on it, Disney will have something to say about it.

No doubt we'll have a test case soon. Until then, delve more into the copyright conundrum in the **Deep Dive: AI** podcast [Copyright, selfie monkeys, the hand of God][5].

#### Regulation

The European Union is leading the way on AI regulation, and its approach is interesting. The AI Act is an interesting read. It's still in draft form, and it could be some time before it is approved, but its legal premise is based on risk. As it stands now, EU legislation would require extensive testing and validation, even on AI concepts that are still in their rudimentary research stages. Learn more about the EU’s legislative approach in the Deep Dive: AI podcast [Solving for AI’s black box problem][6].

#### Datasets

Larger datasets raise questions. Most of the large, publicly available datasets that are being used to train AI models today comprise data taken from the web. These datasets are collected by scraping massive amounts of publicly available data and also data that is available to the public under a wide variety of licenses. The legal conditions for using this raw data are not clear. This means machines are assembling petabytes of images with dubious provenance, not only because of questionable legal rights associated with the uses of these images, code and text, but also because of the often illicit content. Furthermore, we must acknowledge that this internet data has been produced by the wealthier segment of the world's population—the people with access to the internet and smartphones. This inherently skews the data. Find out more about this topic in the Deep Dive: AI podcast [When hackers take on AI: Sci-fi – or the future?][7]

#### Damage control

AI can do real damage. Deep fakes are a good example. A Deep Fake AI tool enables you to impose the face of someone over the body of someone else. They're popular tools in the movie industry, for example. Deep Fake tools are unfortunately used also for nefarious purposes, such as making it appear that someone is in a compromising situation, or to distribute malicious misinformation. Learn more about Deep Fakes in Deep Dive: AI podcast [Building creative restrictions to curb AI abuse][8].

Another example is the *stop button* problem, where a machine trained to win a game can become so aware that it needs to win that it becomes resistant to being stopped. It sounds like science fiction, but it is an identified mathematical problem that research communities are aware of, and have no immediate solution for.

#### Hardware access

Currently, no real Open Source hardware stack for AI exists. Only an elite few have access to the hardware required for serious AI training and research. The volume of data consumed and generated by AI is measured in terabytes and petabytes, which means that special hardware is required to perform speedy computations on data sets of this size. Specifically, without graphic processing units (GPUs), an AI computation could take years instead of hours. Unfortunately, the hardware required to build and run these big AI models is proprietary, expensive, and requires special knowledge to set up. There are a limited number of organizations that have the resources to use and govern the technology.

Individual developers simply don't have the resources to purchase the hardware needed to run these data sets. A few vendors are beginning to release hardware with Open Source code, but the ecosystem is not mature. Learn more about the hardware requirements of AI in the Deep Dive: AI podcast [Why Debian won’t distributed AI models anytime soon][9].

### AI challenges

The [Open Source Initiative][10] protects open source against many threats today, but also anticipates the challenges, such as AI, of tomorrow. AI is a promising field, but it can also deliver disappointing results. Some AI guardrails are needed to protect creators, users, and the world at large.

The Open Source Initiative is actively encouraging dialogue. We need to understand the issues and implications and help communities establish shared principles that ensure AI is good for us all. Join the conversation by joining the four [Deep Dive: AI panel discussions][11] starting on October 11.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/10/defining-open-source-ai

作者：[Stefano Maffulli][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/reed
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/brain_computer_solve_fix_tool.png
[2]: https://opensource.org/osd
[3]: https://www.gnu.org/gnu/manifesto.en.html
[4]: https://deepdive.opensource.org/
[5]: https://deepdive.opensource.org/podcast/copyright-selfie-monkeys-the-hand-of-god/
[6]: https://deepdive.opensource.org/podcast/solving-for-ais-black-box-problem/
[7]: https://deepdive.opensource.org/podcast/when-hackers-take-on-ai-sci-fi-or-the-future/
[8]: https://deepdive.opensource.org/podcast/building-creative-restrictions-to-curb-ai-abuse
[9]: https://deepdive.opensource.org/podcast/why-debian-wont-distribute-ai-models-any-time-soon/
[10]: https://opensource.org
[11]: https://deepdive.opensource.org/
