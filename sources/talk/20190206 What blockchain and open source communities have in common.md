[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What blockchain and open source communities have in common)
[#]: via: (https://opensource.com/article/19/2/blockchain-open-source-communities)
[#]: author: (Gordon Haff https://opensource.com/users/ghaff)

What blockchain and open source communities have in common
======
Blockchain initiatives can look to open source governance for lessons on establishing trust.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/diversity_flowers_chain.jpg?itok=ns01UPOp)

One of the characteristics of blockchains that gets a lot of attention is how they enable distributed trust. The topic of trust is a surprisingly complicated one. In fact, there's now an [entire book][1] devoted to the topic by Kevin Werbach.

But here's what it means in a nutshell. Organizations that wish to work together, but do not fully trust one another, can establish a permissioned blockchain and invite business partners to record their transactions on a shared distributed ledger. Permissioned blockchains can trace assets when transactions are added to the blockchain. A permissioned blockchain implies a degree of trust (again, trust is complicated) among members of a consortium, but no single entity controls the storage and validation of transactions.

The basic model is that a group of financial institutions or participants in a logistics system can jointly set up a permissioned blockchain that will validate and immutably record transactions. There's no dependence on a single entity, whether it's one of the direct participants or a third-party intermediary who set up the blockchain, to safeguard the integrity of the system. The blockchain itself does so through a variety of cryptographic mechanisms.

Here's the rub though. It requires that competitors work together cooperatively—a relationship often called [coopetition][2]. The term dates back to the early 20th century, but it grew into widespread use when former Novell CEO Ray Noorda started using the term to describe the company's business strategy in the 1990s. Novell was then planning to get into the internet portal business, which required it to seek partnerships with some of the search engine providers and other companies it would also be competing against. In 1996, coopetition became the subject of a bestselling [book][3].

Coopetition can be especially difficult when a blockchain network initiative appears to be driven by a dominant company. And it's hard for the dominant company not to exert outsize influence over the initiative, just as a natural consequence of how big it is. For example, the IBM-Maersk joint venture has [struggled to sign up rival shipping companies][4], in part because Maersk is the world's largest carrier by capacity, a position that makes rivals wary.

We see this same dynamic in open source communities. The original creators of a project need to not only let go; they need to put governance structures in place that give competing companies confidence that there's a level playing field.

For example, Sarah Novotny, now head of open source strategy at Google Cloud Platform, [told me in a 2017 interview][5] about the [Kubernetes][6] project that it isn't always easy to give up control, even when people buy into doing what is best for a project.

> Google turned Kubernetes over to the Cloud Native Computing Foundation (CNCF), which sits under the Linux Foundation umbrella. As [CNCF executive director Dan Kohn puts it][7]: "One of the things they realized very early on is that a project with a neutral home is always going to achieve a higher level of collaboration. They really wanted to find a home for it where a number of different companies could participate."
>
> Defaulting to public may not be either natural or comfortable. "Early on, my first six, eight, or 12 weeks at Google, I think half my electrons in email were spent on: 'Why is this discussion not happening on a public mailing list? Is there a reason that this is specific to GKE [Google Container Engine]? No, there's not a reason,'" said Novotny.

To be sure, some grumble that open source foundations have become too common and that many are too dominated by paying corporate members. Simon Phipps, currently the president of the Open Source Initiative, gave a talk at OSCON way back in 2015 titled ["Enough Foundations Already!"][8] in which he argued that "before we start another open source foundation, let's agree that what we need protected is software freedom and not corporate politics."

Nonetheless, while not appropriate for every project, foundations with business, legal, and technical governance are increasingly the model for open source projects that require extensive cooperation among competing companies. A [2017 analysis of GitHub data by the Linux Foundation][9] found a number of different governance models in use by the highest-velocity open source projects. Unsurprisingly, quite a few remained under the control of the company that created or acquired them. However, about a third were under the auspices of a foundation.

Is there a lesson here for blockchain? Quite possibly. Open source projects can be sponsored by a company while still putting systems and governance in place that are welcoming to outside contributors. However, there's a great deal of history to suggest that doing so is hard because it's hard not to exert control and leverage when you can. Furthermore, even if you make a successful case for being truly open to equal participation to outsiders today, it will be hard to allay suspicions that you might not be as welcoming tomorrow.

To the degree that we can equate blockchain consortiums with open source communities, this suggests that business blockchain initiatives should look to open source governance for lessons. Dominant players in the ecosystem need to forgo control, and they need to have conversations with partners and potential partners about what types of structures would make participating easier.

Many blockchain infrastructure software projects are already under foundations such as Hyperledger. But perhaps some specific production deployments of blockchain aimed at specific industries and ecosystems will benefit from formal governance structures as well.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/blockchain-open-source-communities

作者：[Gordon Haff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ghaff
[b]: https://github.com/lujun9972
[1]: https://mitpress.mit.edu/books/blockchain-and-new-architecture-trust
[2]: https://en.wikipedia.org/wiki/Coopetition
[3]: https://en.wikipedia.org/wiki/Co-opetition_(book)
[4]: https://www.theregister.co.uk/2018/10/30/ibm_struggles_to_sign_up_shipping_carriers_to_blockchain_supply_chain_platform_reports/
[5]: https://opensource.com/article/17/4/podcast-kubernetes-sarah-novotny
[6]: https://kubernetes.io/
[7]: http://bitmason.blogspot.com/2017/02/podcast-cloud-native-computing.html
[8]: https://www.oreilly.com/ideas/enough-foundations-already
[9]: https://www.linuxfoundation.org/blog/2017/08/successful-open-source-projects-common/
