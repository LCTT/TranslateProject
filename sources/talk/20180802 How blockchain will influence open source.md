How blockchain will influence open source
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/block-quilt-chain.png?itok=mECoDbrc)

What [Satoshi Nakamoto][1] started as Bitcoin a decade ago has found a lot of followers and turned into a movement for decentralization. For some, blockchain technology is a religion that will have the same impact on humanity as the Internet has had. For others, it is hype and technology suitable only for Ponzi schemes. While blockchain is still evolving and trying to find its place, one thing is for sure: It is a disruptive technology that will fundamentally transform certain industries. And I'm betting open source will be one of them.

### The open source model

Open source is a collaborative software development and distribution model that allows people with common interests to gather and produce something that no individual can create on their own. It allows the creation of value that is bigger than the sum of its parts. Open source is enabled by distributed collaboration tools (IRC, email, git, wiki, issue trackers, etc.), distributed and protected by an open source licensing model and often governed by software foundations such as the [Apache Software Foundation][2] (ASF), [Cloud Native Computing Foundation][3] (CNCF), etc.

One interesting aspect of the open source model is the lack of financial incentives in its core. Some people believe open source work should remain detached from money and remain a free and voluntary activity driven only by intrinsic motivators (such as "common purpose" and "for the greater good”). Others believe open source work should be rewarded directly or indirectly through extrinsic motivators (such as financial incentive). While the idea of open source projects prospering only through voluntary contributions is romantic, in reality, the majority of open source contributions are done through paid development. Yes, we have a lot of voluntary contributions, but these are on a temporary basis from contributors who come and go, or for exceptionally popular projects while they are at their peak. Creating and sustaining open source projects that are useful for enterprises requires developing, documenting, testing, and bug-fixing for prolonged periods, even when the software is no longer shiny and exciting. It is a boring activity that is best motivated through financial incentives.

### Commercial open source

Software foundations such as ASF survive on donations and other income streams such as sponsorships, conference fees, etc. But those funds are primarily used to run the foundations, to provide legal protection for the projects, and to ensure there are enough servers to run builds, issue trackers, mailing lists, etc.

Similarly, CNCF has member fees and other income streams, which are used to run the foundation and provide resources for the projects. These days, most software is not built on laptops; it is run and tested on hundreds of machines on the cloud, and that requires money. Creating marketing campaigns, brand designs, distributing stickers, etc. takes money, and some foundations can assist with that as well. At its core, foundations implement the right processes to interact with users, developers, and control mechanisms and ensure distribution of available financial resources to open source projects for the common good.

If users of open source projects can donate money and the foundations can distribute it in a fair way, what is missing?

What is missing is a direct, transparent, trusted, decentralized, automated bidirectional link for transfer of value between the open source producers and the open source consumer. Currently, the link is either unidirectional or indirect:

  * **Unidirectional** : A developer (think of a "developer" as any role that is involved in the production, maintenance, and distribution of software) can use their brain juice and devote time to do a contribution and share that value with all open source users. But there is no reverse link.

  * **Indirect** : If there is a bug that affects a specific user/company, the options are:

    * To have in-house developers to fix the bug and do a pull request. That is ideal, but it not always possible to hire in-house developers who are knowledgeable about hundreds of open source projects used daily.

    * To hire a freelancer specializing in that specific open source project and pay for the services. Ideally, the freelancer is also a committer for the open source project and can directly change the project code quickly. Otherwise, the fix might not ever make it to the project.

    * To approach a company providing services around the open source project. Such companies typically employ open source committers to influence and gain credibility in the community and offer products, expertise, and professional services.




The third option has been a successful [model][4] for sustaining many open source projects. Whether they provide services (training, consulting, workshops), support, packaging, open core, or SaaS, there are companies that employ hundreds of staff members who work on open source full time. There is a long [list of companies][5] that have managed to build a successful open source business model over the years, and that list is growing steadily.

The companies that back open source projects play an important role in the ecosystem: They are the catalyst between the open source projects and the users. The ones that add real value do more than just package software nicely; they can identify user needs and technology trends, and they create a full stack and even an ecosystem of open source projects to address these needs. They can take a boring project and support it for years. If there is a missing piece in the stack, they can start an open source project from scratch and build a community around it. They can acquire a closed source software company and open source the projects (here I got a little carried away, but yes, I'm talking about my employer, [Red Hat][6]).

To summarize, with the commercial open source model, projects are officially or unofficially managed and controlled by a very few individuals or companies that monetize them and give back to the ecosystem by ensuring the project is successful. It is a win-win-win for open source developers, managing companies, and end users. The alternative is inactive projects and expensive closed source software.

### Self-sustaining, decentralized open source

For a project to become part of a reputable foundation, it must conform to certain criteria. For example, ASF and CNCF require incubation and graduation processes, respectively, where apart from all the technical and formal requirements, a project must have a healthy number of active committer and users. And that is the essence of forming a sustainable open source project. Having source code on GitHub is not the same thing as having an active open source project. The latter requires committers who write the code and users who use the code, with both groups enforcing each other continuously by exchanging value and forming an ecosystem where everybody benefits. Some project ecosystems might be tiny and short-lived, and some may consist of multiple projects and competing service providers, with very complex interactions lasting for many years. But as long as there is an exchange of value and everybody benefits from it, the project is developed, maintained, and sustained.

If you look at ASF [Attic][7], you will find projects that have reached their end of life. When a project is no longer technologically fit for its purpose, it is usually its natural end. Similarly, in the ASF [Incubator][8], you will find tons of projects that never graduated but were instead retired. Typically, these projects were not able to build a large enough community because they are too specialized or there are better alternatives available.

But there are also cases where projects with high potential and superior technology cannot sustain themselves because they cannot form or maintain a functioning ecosystem for the exchange of value. The open source model and the foundations do not provide a framework and mechanisms for developers to get paid for their work or for users to get their requests heard. There isn’t a common value commitment framework for either party. As a result, some projects can sustain themselves only in the context of commercial open source, where a company acts as an intermediary and value adder between developers and users. That adds another constraint and requires a service provider company to sustain some open source projects. Ideally, users should be able to express their interest in a project and developers should be able to show their commitment to the project in a transparent and measurable way, which forms a community with common interest and intent for the exchange of value.

Imagine there is a model with mechanisms and tools that enable direct interaction between open source users and developers. This includes not only code contributions through pull requests, questions over the mailing lists, GitHub stars, and stickers on laptops, but also other ways that allow users to influence projects' destinies in a richer, more self-controlled and transparent manner.

This model could include incentives for actions such as:

  * Funding open source projects directly rather than through software foundations

  * Influencing the direction of projects through voting (by token holders)

  * Feature requests driven by user needs

  * On-time pull request merges

  * Bounties for bug hunts

  * Better test coverage incentives

  * Up-to-date documentation rewards

  * Long-term support guarantees

  * Timely security fixes

  * Expert assistance, support, and services

  * Budget for evangelism and promotion of the projects

  * Budget for regular boring activities

  * Fast email and chat assistance

  * Full visibility of the overall project findings, etc.




If you haven't guessed, I'm talking about using blockchain and [smart contracts][9] to allow such interactions between users and developers—smart contracts that will give power to the hand of token holders to influence projects.

![blockchain_in_open_source_ecosystem.png][11]

The usage of blockchain in the open source ecosystem

Existing channels in the open source ecosystem provide ways for users to influence projects through financial commitments to service providers or other limited means through the foundations. But the addition of blockchain-based technology to the open source ecosystem could open new channels for interaction between users and developers. I'm not saying this will replace the commercial open source model; most companies working with open source do many things that cannot be replaced by smart contracts. But smart contracts can spark a new way of bootstrapping new open source projects, giving a second life to commodity projects that are a burden to maintain. They can motivate developers to apply boring pull requests, write documentation, get tests to pass, etc., providing a direct value exchange channel between users and open source developers. Blockchain can add new channels to help open source projects grow and become self-sustaining in the long term, even when company backing is not feasible. It can create a new complementary model for self-sustaining open source projects—a win-win.

### Tokenizing open source

There are already a number of initiatives aiming to tokenize open source. Some focus only on an open source model, and some are more generic but apply to open source development as well:

  * [Gitcoin][12] \- grow open source, one of the most promising ones in this area.

  * [Oscoin][13] \- cryptocurrency for open source

  * [Open collective][14] \- a platform for supporting open source projects.

  * [FundYourselfNow][15] \- Kickstarter and ICOs for projects.

  * [Kauri][16] \- support for open source project documentation.

  * [Liberapay][17] \- a recurrent donations platform.

  * [FundRequest][18] \- a decentralized marketplace for open source collaboration.

  * [CanYa][19] \- recently acquired [Bountysource][20], now the world’s largest open source P2P bounty platform.

  * [OpenGift][21] \- a new model for open source monetization.

  * [Hacken][22] \- a white hat token for hackers.

  * [Coinlancer][23] \- a decentralized job market.

  * [CodeFund][24] \- an open source ad platform.

  * [IssueHunt][25] \- a funding platform for open source maintainers and contributors.

  * [District0x 1Hive][26] \- a crowdfunding and curation platform.

  * [District0x Fixit][27] \- github bug bounties.




This list is varied and growing rapidly. Some of these projects will disappear, others will pivot, but a few will emerge as the [SourceForge][28], the ASF, the GitHub of the future. That doesn't necessarily mean they'll replace these platforms, but they'll complement them with token models and create a richer open source ecosystem. Every project can pick its distribution model (license), governing model (foundation), and incentive model (token). In all cases, this will pump fresh blood to the open source world.

### The future is open and decentralized

  * Software is eating the world.

  * Every company is a software company.

  * Open source is where innovation happens.




Given that, it is clear that open source is too big to fail and too important to be controlled by a few or left to its own destiny. Open source is a shared-resource system that has value to all, and more importantly, it must be managed as such. It is only a matter of time until every company on earth will want to have a stake and a say in the open source world. Unfortunately, we don't have the tools and the habits to do it yet. Such tools would allow anybody to show their appreciation or ignorance of software projects. It would create a direct and faster feedback loop between producers and consumers, between developers and users. It will foster innovation—innovation driven by user needs and expressed through token metrics.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/open-source-tokenomics

作者：[Bilgin lbryam][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bibryam
[1]:https://en.wikipedia.org/wiki/Satoshi_Nakamoto
[2]:https://www.apache.org/
[3]:https://www.cncf.io/
[4]:https://medium.com/open-consensus/3-oss-business-model-progressions-dafd5837f2d
[5]:https://docs.google.com/spreadsheets/d/17nKMpi_Dh5slCqzLSFBoWMxNvWiwt2R-t4e_l7LPLhU/edit#gid=0
[6]:http://jobs.redhat.com/
[7]:https://attic.apache.org/
[8]:http://incubator.apache.org/
[9]:https://en.wikipedia.org/wiki/Smart_contract
[10]:/file/404421
[11]:https://opensource.com/sites/default/files/uploads/blockchain_in_open_source_ecosystem.png (blockchain_in_open_source_ecosystem.png)
[12]:https://gitcoin.co/
[13]:http://oscoin.io/
[14]:https://opencollective.com/opensource
[15]:https://www.fundyourselfnow.com/page/about
[16]:https://kauri.io/
[17]:https://liberapay.com/
[18]:https://fundrequest.io/
[19]:https://canya.io/
[20]:https://www.bountysource.com/
[21]:https://opengift.io/pub/
[22]:https://hacken.io/
[23]:https://www.coinlancer.com/home
[24]:https://codefund.io/
[25]:https://issuehunt.io/
[26]:https://blog.district0x.io/district-proposal-spotlight-1hive-283957f57967
[27]:https://github.com/district0x/district-proposals/issues/177
[28]:https://sourceforge.net/
