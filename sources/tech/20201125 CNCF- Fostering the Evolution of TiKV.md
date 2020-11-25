[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (CNCF: Fostering the Evolution of TiKV)
[#]: via: (https://www.linux.com/news/cncf-fostering-the-evolution-of-tikv/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

CNCF: Fostering the Evolution of TiKV
======

_PingCAP had high hopes that its TiKV project would develop into a building block for the next generation of distributed systems by providing reliable high quality and practical storage foundation. To accomplish that, it decided to contribute TiKV to the Cloud Native Computing Foundation (CNCF) to make it vendor-neutral and widely used across organizations. It seems headed in that direction, especially now that the project recently graduated, further demonstrating its maturity and sustainability. On behalf of the Linux Foundation, Swapnil Bhartiya, founder and host of TFiR, sat down with two members of the TiKV project, Siddon Tang and Calvin Weng, to learn more about the project’s evolution._

Here is a transcript of the discussion:

**Swapnil Bhartiya: What is TiKV project and what problem are you trying to solve?**
**Siddon Tang:** TiKV is an open source, distributed transactional key value database. TiKV is inspired by Google Spanner and HBase, but the design is simpler and more practical. Why did we develop TiKV at PingCAP? We want to build a distributed database with SQL compatibility. We built the SQL and then we wanted to build a distributed key-value storage layer that supported our database. At first, we tried to use HBase, but its performance was not what we expected so we decided to build our own distributed key-value database. That’s how TiKV started.

**Calvin Weng:** It was originally created to complement TiDB, but we soon realized that the TiKV project could be decoupled from TiDB and serve as a unified distributed storage layer that supported distributed transactions, horizontal scalability, and cloud-native architecture.

We also realized that with the amount of data we generate, there could be a demand for such a solution in the cloud-native communities. So, we contributed it to the CNCF to develop it as a building block for the next generation of distributed systems by providing a reliable high quality and practical storage foundation.

**Swapnil Bhartiya: How is CNCF helping the TiKV project and the community?**
**Calvin Weng:** Thanks for the question. I am a liaison between the CNCF and the TiKV project. The CNCF has been immensely helpful in shaping TiKV into what it is today in terms of both the project and the community. There are a few things that I would like to elaborate on and the first is neutrality. CNCF provides a neutral home to projects like ours, so that developers from different organizations are willing to collaborate, contribute and eventually become the leaders in the project. This is very important for the broader community to perceive TiKV as a vendor-neutral and universal project that belongs to the community instead of a single company like PingCAP. People will feel comfortable adopting it or developing their own apps on TiKV.

Another important aspect is exposure, which includes publicity and marketing support that we get from CNCF so that we are known by the broader community. More people and more companies could get involved, which also means more adoption.

Last but not least is diversity in the maintainer and the contributor structure. This is a very important criterion for CNCF graduation.

**Swapnil Bhartiya: Since you mentioned graduation, can you talk about what it means for a project like TiKV to become a graduated project? How does it affect the project and what does it mean for its users?**
**Calvin Weng:** TiKV has a lot of adoptions. There are more than 1,000 deployments in production. It is battle-tested. Moving from incubation to graduation is a very solid and convincing validation of the technology, its open governance, its vision, maturity and sustainability.

From a user’s perspective, graduation means the credibility and reliability of the project. It means that the TiKV project is a mature enough project for cloud-native architecture. It also means that the TiKV community is an active and healthy community. It boosts the confidence of users.

**Swapnil Bhartiya: One last question before we wrap this up: can you talk about the roadmap of the TiKV project?**
**Siddon Tang:** Our focus is on making it faster, easier-to-use, and cost-effective. We just released the 4.0 version and in the next major release of 5.0, we want it to be more cloud-friendly and be able to smoothly run on AWS S3, AWS EBS Cloud Disk or any other cloud storage. We are also working on making TiKV handle different workloads. We are also working on adding support for other database engines so it can support different workloads. The long-term goal is to introduce AI so it can use different engines to certify different workloads.
--------------------------------------------------------------------------------

via: https://www.linux.com/news/cncf-fostering-the-evolution-of-tikv/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
