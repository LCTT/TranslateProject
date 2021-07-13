[#]: subject: (Open source sustainable cities, AI on Arduino, supply chain security, and more)
[#]: via: (https://opensource.com/article/21/7/open-source-news)
[#]: author: (Lauren Maffeo https://opensource.com/users/lmaffeo)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Open source sustainable cities, AI on Arduino, supply chain security, and more
======
Get the latest news to know in this open source news roundup.
![A map with a route highlighted][1]

Open source made it into a lot of news headlines last month. Read on to learn about some of the major advances.

### Stanford unveils open source sustainable cities software

80% of Americans live in cities, and 70% of the world's population is expected to be urban dwellers by 2050. Thanks to the Stanford National Capital Project, city planners and developers have a new open source tool to help improve urban wellbeing.

[Urban InVEST][2] is new software that helps users visualize where they might create areas to absorb carbon emissions and encourage public use, such as marshlands and parks.

Such investments will [become more crucial][3] as climate change increases and larger swaths of people move to tighter spaces. For example, urban planners could use Urban InVEST to forecast how much money green infrastructure might save cities in the event of a major storm.

The software allows users to upload their own data sets or use open data sets from sources including NASA satellites. Urban InVEST is part of the larger [InVEST suite][4], a set of software to help experts map and model nature's benefits.

### Artificial intelligence comes to Arduino

The [Arduino][5] project and [Fraunhofer IMS][6] have teamed up to release [AIfES][7], a standalone open source artificial intelligence (AI) framework programmed in C.

Users can add AlfES to an Arduino project through Arduino's integrated development environment's library manager. You can also use AlfES to run and train machine learning algorithms on even the smallest microcontrollers (such as the popular 8-bit Arduino Uno).

This allows you to develop edge and Internet of Things (IoT) devices that are cloud-independent and can intelligently process sensors onsite. In addition to its GPLv3 license for open source projects, AlfES provides paid licensing for commercial projects.

### New tool aims to save open source from supply chain attacks

Cyberattacks are increasing in size and scope, and software supply chain attacks (where hackers slip malicious code into legit software) are an especially big risk. A new Linux Foundation project led by Google, Red Hat, and Purdue University aims to prevent them.

[Sigstore][8] is a public-good service that offers code signing to open source developers who might lack the time, expertise, and resources to implement it themselves. Developers can give all their cryptography work to Sigstore, which automatically produces an open source log of all activity.

Santiago Torres-Arias, a supply chain researcher at Purdue University affiliated with the project, [told WIRED][9] that supply chain code signing won't solve every open source security problem, but it does address low-hanging fruit.

At an inaugural key ceremony in June, Torres-Arias and four others become Sigstore's main key holders. If Sigstore gets enough adoption, they hope to rotate keys to other users, which would make it a neutral open source project.

### Google rolls out unified security vulnerability schema for open source software

As calls to improve open source security mount, Google is making moves to deliver. The search giant [unveiled][10] a vulnerability interchange schema to find security risks across open source solutions.

The Google Open Source Security and Go teams built upon Google's work to produce the [Open Source Vulnerabilities (OSV) database][11] and the [OSS-Fuzz][12] data set of security risks. This new schema describes vulnerabilities across any open source ecosystem without requiring ecosystem-dependent logic.

That's crucial because, as Steven J. Vaughan-Nichols [wrote for ZDNet][13], the lack of a standard interchange format has been a big barrier to tracking dependencies across vulnerability databases. Instead, Google's new schema shares vulnerability data across several open source projects.

### GitLab spins out open source data integration platform Meltano

As of June 30, Meltano is officially a standalone business. The open source extract, transfer, and load (ETL) platform is now independent of GitLab.

Meltano queries databases and software-as-a-service applications, transitions the data into a warehouse or storage system, and restructures it. GitLab debuted Meltano in 2018, and it became open source over the course of several iterations.

Several proprietary ETL tools exist, making Meltano's status as an open source alternative noteworthy. It allows users to host the tool on their devices of choice and access it using their own orchestration tools or Meltano's web-based interface.

"Most solutions right now are pay-to-play, which limits how many companies have access to high-quality tooling," Meltano CEO Douwe Maan [told VentureBeat][14]. "Being open source means the long-tail of integrations can be better served by a large community, since vendors typically only support about 150."

In other news:

  * [Why companies should model their culture after open source][15]
  * [Google open sources fully homomorphic encryption transpiler][16]
  * [Enterprise Ethereum matures, looks to open source community for standards][17]
  * [AtomicJar wants to bring open source integration testing to the enterprise][18]



--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/open-source-news

作者：[Lauren Maffeo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lmaffeo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/map_route_location_gps_path.png?itok=RwtS4DsU (A map with a route highlighted)
[2]: https://naturalcapitalproject.stanford.edu/software/urban-invest
[3]: https://scitechdaily.com/stanfords-new-open-source-software-for-designing-sustainable-cities/
[4]: https://naturalcapitalproject.stanford.edu/software/invest
[5]: https://www.arduino.cc/
[6]: https://www.ims.fraunhofer.de/en.html
[7]: https://www.ims.fraunhofer.de/en/Business-Unit/Industry/Industrial-AI/Artificial-Intelligence-for-Embedded-Systems-AIfES.html
[8]: https://sigstore.dev/
[9]: https://www.wired.com/story/sigstore-open-source-supply-chain-code-signing/
[10]: https://docs.google.com/document/d/1sylBGNooKtf220RHQn1I8pZRmqXZQADDQ_TOABrKTpA/edit#heading=h.ss425olznxo
[11]: https://opensource.googleblog.com/2021/02/launching-osv-better-vulnerability.html
[12]: https://github.com/google/oss-fuzz
[13]: https://www.zdnet.com/article/google-rolls-out-a-unified-security-vulnerability-schema-for-open-source-software/
[14]: https://venturebeat.com/2021/06/30/gitlab-spins-out-open-source-data-integration-platform-meltano/
[15]: https://www.forbes.com/sites/forbestechcouncil/2021/06/29/why-companies-should-model-their-culture-after-open-source/?sh=58ed96e61abe
[16]: https://www.infoq.com/news/2021/06/google-fhe-transpiler/
[17]: https://cointelegraph.com/news/enterprise-ethereum-matures-looks-to-open-source-community-for-standards
[18]: https://venturebeat.com/2021/06/28/atomicjar-wants-to-bring-open-source-integration-testing-to-the-enterprise/
