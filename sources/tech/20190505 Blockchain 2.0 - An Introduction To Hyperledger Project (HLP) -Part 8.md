[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Blockchain 2.0 – An Introduction To Hyperledger Project (HLP) [Part 8])
[#]: via: (https://www.ostechnix.com/blockchain-2-0-an-introduction-to-hyperledger-project-hlp/)
[#]: author: (editor https://www.ostechnix.com/author/editor/)

Blockchain 2.0 – An Introduction To Hyperledger Project (HLP) [Part 8]
======

![Introduction To Hyperledger Project][1]

Once a new technology platform reaches a threshold level of popularity in terms of active development and commercial interests, major global companies and smaller start-ups alike rush to catch a slice of the pie. **Linux** was one such platform back in the day. Once the ubiquity of its applications was realized individuals, firms, and institutions started displaying their interest in it and by 2000 the **Linux foundation** was formed.

The Linux foundation aims to standardize and develop Linux as a platform by sponsoring their development team. The Linux Foundation is a non-profit organization that is supported by software and IT behemoths such as Microsoft, Oracle, Samsung, Cisco, IBM, Intel among others[1]. This is excluding the hundreds of individual developers who offer their services for the betterment of the platform. Over the years the Linux foundation has taken many projects under its roof. The **Hyperledger Project** is their fastest growing one till date.

Such consortium led development have a lot of advantages when it comes to furthering tech into usable useful forms. Developing the standards, libraries and all the back-end protocols for large scale projects are expensive and resource intensive without a shred of income generating from it. Hence, it makes sense for companies to pool in their resources to develop the common “boring” parts by supporting such organizations and later upon completing work on these standard parts to simply plug & play and customize their products afterwards. Apart from the economics of the model, such collaborative efforts also yield standards allowing for easier use and integration into aspiring products and services.

Other major innovations that were once or are currently being developed following the said consortium model include standards for WiFi (The Wi-Fi alliance), Mobile Telephony etc.

### Introduction to Hyperledger Project (HLP)

The Hyperledger project was launched in December 2015 by the Linux foundation as is currently among the fastest growing project they’ve incubated. It’s an umbrella organization for collaborative efforts into developing and advancing tools & standards for [**blockchain**][2] based distributed ledger technologies(DLT). Major industry players supporting the project include **IBM** , **Intel** and **SAP Ariba** among [**others**][3]. The HLP aims to create frameworks for individuals and companies to create shared as well as closed blockchains as required to further their own requirements. The design principles include a strong tilt toward developing a globally deployable, scalable, robust platform with a focus on privacy, and future auditability[2]. It is also important to note that most of the blockchains proposed and the frame.

### Development goals and structure: Making it plug & play

Although enterprise facing platforms exist from the likes of the Ethereum alliance, HLP is by definition business facing and supported by industry behemoths who contribute and further development in the many modules that come under the HLP banner. The HLP incubates projects in development after their induction into the cause and after finishing work on it and correcting the knick-knacks rolls it out for the public. Members of the Hyperledger project contribute their own work such as how IBM contributed their Fabric platform for collaborative development. The codebase is absorbed and developed in house by the group in the project and rolled out for all members equally for their use.

Such processes make the modules in HLP highly flexible plug-in frameworks which will support rapid development and roll-outs in enterprise settings. Furthermore, other comparable platforms are open **permission-less blockchains** or rather **public chains** by default and even though it is possible to adapt them to specific applications, HLP modules support the feature natively.

The differences and use cases of public & private blockchains are covered more [**here**][4] in this comparative primer on the same.

The Hyperledger project’s mission is four-fold according to **Brian Behlendorf** , the executive director of the project.

They are:

  1. To create an enterprise grade DLT framework and standards which anyone can port to suit their specific industrial or personal needs.
  2. To give rise to a robust open source community to aid the ecosystem.
  3. To promote and further participation of industry members of the said ecosystem such as member firms.
  4. To host a neutral unbiased infrastructure for the HLP community to gather and share updates and developments regarding the same.



The original document can be accessed [**here**][5]****.

### Structure of the HLP

The **HLP consists of 12 projects** that are classified as independent modules, each usually structured and working independently to develop their module. These are first studied for their capabilities and viability before being incubated. Proposals for additions can be made by any member of the organization. After the project is incubated active development ensues after which it is rolled out. The interoperability between these modules are given a high priority, hence regular communication between these groups are maintained by the community. Currently 4 of these projects are categorized as active. The active tag implies these are ready for use but not ready for a major release yet. These 4 are arguably the most significant or rather fundamental modules to furthering the blockchain revolution. We’ll look at the individual modules and their functionalities at a later time in detail. However, a brief description of a the Hyperledger Fabric platform, arguably the most popular among them follows.

### Hyperledger Fabric

The **Hyperledger Fabric** [2] is a fully open-source, permissioned (non-public) blockchain-based DLT platform that is designed keeping enterprise uses in mind. The platform provides features and is structured to fit the enterprise environment. It is highly modular allowing its developers to choose from different consensus protocols, **chain code protocols ([smart contracts][6])** , or identity management systems etc., as they go along. **It is a permissioned blockchain based platform** that’s makes use of an identity management system, meaning participants will be aware of each other’s identities which is required in an enterprise setting. Fabric allows for smart contract ( _ **“chaincode”, is the term that the Hyperledger team uses**_ ) development in a variety of mainstream programming languages including **Java** , **Javascript** , **Go** etc. This allows institutions and enterprises to make use of their existing talent in the area without hiring or re-training developers to develop their own smart contracts. Fabric also uses an execute-order-validate system to handle smart contracts for better reliability compared to the standard order-validate system that is used by other platforms providing smart contract functionality. Pluggable performance, identity management systems, DBMS, Consensus platforms etc. are other features of Fabric that keeps it miles ahead of its competition.

### Conclusion

Projects such as the Hyperledger Fabric platforms enable a faster rate of adoption of blockchain technology in mainstream use-cases. The Hyperledger community structure itself supports open governance principles and since all the projects are led as open source platforms, this improves the security and accountability that the teams exhibit in pushing out commitments.

Since major applications of such projects involve working with enterprises to further development of platforms and standards, the Hyperledger project is currently at a great position with respect to comparable projects by others.

**References:**

  * **[1][Samsung takes a seat with Intel and IBM at the Linux Foundation | TheINQUIRER][7]**
  * **[2] E. Androulaki et al., “Hyperledger Fabric: A Distributed Operating System for Permissioned Blockchains,” 2018.**



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/blockchain-2-0-an-introduction-to-hyperledger-project-hlp/

作者：[editor][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/04/Introduction-To-Hyperledger-Project-720x340.png
[2]: https://www.ostechnix.com/blockchain-2-0-an-introduction/
[3]: https://www.hyperledger.org/members
[4]: https://www.ostechnix.com/blockchain-2-0-public-vs-private-blockchain-comparison/
[5]: http://www.hitachi.com/rev/archive/2017/r2017_01/expert/index.html
[6]: https://www.ostechnix.com/blockchain-2-0-explaining-smart-contracts-and-its-types/
[7]: https://www.theinquirer.net/inquirer/news/2182438/samsung-takes-seat-intel-ibm-linux-foundation
