[#]: collector: (lujun9972)
[#]: translator: (hopefully2333)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What's HTTPS for secure computing?)
[#]: via: (https://opensource.com/article/20/1/confidential-computing)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

What's HTTPS for secure computing?
======
Security by default hasn't arrived yet.
![Secure https browser][1]

Over the past few years, it's become difficult to find a website that is just "http://…" This is because the industry has finally realised that security on the web is "a thing," and also because it has become easy for both servers and clients to set up and use HTTPS connections. A similar shift may be on its way in computing across cloud, edge, Internet of Things, blockchain, artificial intelligence, machine learning, and beyond. We've known for a long time that we should encrypt data at rest (in storage) and in transit (on the network), but encrypting it in use (while processing) has been difficult and expensive. Confidential computing—providing this type of protection for data and algorithms in use using hardware capabilities such as trusted execution environments (TEEs)—protects data on hosted systems or vulnerable environments.

I've written several times about [TEEs][2] and, of course, the [Enarx project][3] of which I'm a co-founder with Nathaniel McCallum (see [_Enarx for everyone (a quest)_][4] and [_Enarx goes multi-platform_][5] for examples). Enarx uses TEEs and provides a platform- and language-independent deployment platform to allow you safely to deploy sensitive applications or components (such as microservices) onto hosts that you don't trust. Enarx is, of course, completely open source (we're using the Apache 2.0 licence, for those with an interest). Being able to run workloads on hosts that you don't trust is the promise of confidential computing, which extends normal practice for sensitive data at rest and in transit to data in use:

  * **Storage:** You encrypt your data at rest because you don't fully trust the underlying storage infrastructure.
  * **Networking:** You encrypt your data in transit because you don't fully trust the underlying network infrastructure.
  * **Compute:** You encrypt your data in use because you don't fully trust the underlying compute infrastructure.



I've got a lot to say about trust, and the word "fully" in the statements above is important (I added it on re-reading what I'd written). In each case, you have to trust the underlying infrastructure to some degree, whether it's to deliver your packets or store your blocks, for instance. In the case of the compute infrastructure, you're going to have to trust the CPU and associated firmware, just because you can't really do computing without trusting them (there are techniques such as homomorphic encryption, which are beginning to offer some opportunities here, but they're limited and the technology still immature).

Questions sometimes come up about whether you should fully trust CPUs, given some of the security problems that have been found with them, and also about whether they are fully secure against physical attacks on the host on which they reside.

The answer to both questions is "no," but this is the best technology we currently have available at scale and at a price point to make it generally deployable. To address the second question, nobody is pretending that this (or any other technology) is fully secure: what we need to do is consider our [threat model][6] and decide whether TEEs (in this case) provide sufficient security for our specific requirements. In terms of the first question, the model that Enarx adopts is to allow decisions to be made at deployment time as to whether you trust a particular set of CPUs. So, for example, if vendor Q's generation R chips are found to contain a vulnerability, it will be easy to say "refuse to deploy my workloads to R-type CPUs from Q, but continue to deploy to S-type, T-type, and U-type chips from Q and any CPUs from vendors P, M, and N."

I think there are three changes in the landscape that are leading to the interest and adoption of confidential computing right now:

  1. **Hardware availability:** It is only over the past six to 12 months that hardware supporting TEEs has started to become widely available, with the key examples in the market at the moment being Intel's SGX and AMD's SEV. We can expect to see other examples of TEE-enabled hardware coming out in the fairly near future.
  2. **Industry readiness:** Just as cloud use is increasingly becoming accepted as a model for application deployment, regulators and legislators are increasing the requirements on organisations to protect the data they manage. Organisations are beginning to clamour for ways to run sensitive applications (or applications that handle sensitive data) on untrusted hosts—or, to be more accurate, on hosts that they cannot fully trust with that sensitive data. This should be no surprise: the chip vendors would not have invested so much money into this technology if they saw no likely market for it. Formation of the Linux Foundation's [Confidential Computing Consortium][7] (CCC) is another example of how the industry is interested in finding common models for the use of confidential computing and encouraging open source projects to employ these technologies.[1][8]
  3. **Open source:** Like blockchain, confidential computing is one of those technologies where it's an absolute no-brainer to use open source. If you are going to run sensitive applications, you need to trust what's doing the running for you. That's not just the CPU and firmware but also the framework that supports the execution of your workload within the TEE. It's all very well saying, "I don't trust the host machine and its software stack, so I'm going to use a TEE," but if you don't have visibility into the TEE software environment, then you're just swapping one type of software opacity for another. Open source support for TEEs allows you or the community—in fact, you _and_ the community—to check and audit what you're running in a way that is impossible for proprietary software. This is why the CCC sits within the Linux Foundation (which is committed to the open development model) and is encouraging TEE-related software projects to join and go open source (if they weren't already).



I'd argue that this triad of hardware availability, industry readiness, and open source has become the driver for technology change over the past 15 to 20 years. Blockchain, AI, cloud computing, webscale computing, big data, and internet commerce are all examples of these three meeting at the same time and leading to extraordinary changes in our industry.

Security by default is a promise that we've been hearing for decades now, and it hasn't arrived yet. Honestly, I'm not sure it ever will. But as new technologies become available, security ubiquity for particular use cases becomes more practical and more expected within the industry. It seems that confidential computing is ready to be the next big change—and you, dear reader, can join the revolution (it's open source, after all).

* * *

  1. Enarx, initiated by Red Hat, is a CCC project.



* * *

_This article was originally published on [Alice, Eve, and Bob][9] and is reprinted with the author's permission._

Get a sneak peek at Daniel Roesler's Texas Linux Fest talk, "If you're not using HTTPS, your...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/confidential-computing

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/secure_https_url_browser.jpg?itok=OaPuqBkG (Secure https browser)
[2]: https://aliceevebob.com/2019/02/26/oh-how-i-love-my-tee-or-do-i/
[3]: https://enarx.io/
[4]: https://aliceevebob.com/2019/08/20/enarx-for-everyone-a-quest/
[5]: https://aliceevebob.com/2019/10/29/enarx-goes-multi-platform/
[6]: https://aliceevebob.com/2018/02/20/there-are-no-absolutes-in-security/
[7]: https://confidentialcomputing.io/
[8]: tmp.VEZpFGxsLv#1
[9]: https://aliceevebob.com/2019/12/03/confidential-computing-the-new-https/
