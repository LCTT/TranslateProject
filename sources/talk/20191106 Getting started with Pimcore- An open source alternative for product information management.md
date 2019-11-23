[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with Pimcore: An open source alternative for product information management)
[#]: via: (https://opensource.com/article/19/11/pimcore-alternative-product-information-management)
[#]: author: (Dietmar Rietsch https://opensource.com/users/erinmcmahon)

Getting started with Pimcore: An open source alternative for product information management
======
PIM software enables sellers to centralize sales, marketing, and
technical product information to engage better with customers.
![Pair programming][1]

Product information management (PIM) software enables sellers to consolidate product data into a centralized repository that acts as a single source of truth, minimizing errors and redundancies in product data. This, in turn, makes it easier to share high-quality, clear, and accurate product information across customer touchpoints, paving the way for rich, consistent, readily accessible content that's optimized for all the channels customers use, including websites, social platforms, marketplaces, apps, IoT devices, conversational interfaces, and even print catalogs and physical stores. Being able to engage with customers on their favorite platform is essential for increasing sales and expanding into new markets. For years, there have been proprietary products that address some of these needs, like Salsify for data management, Adobe Experience Manager, and SAP Commerce Cloud for experience management, but now there's an open source alternative called Pimcore.

[Pimcore PIM][2] is an open source enterprise PIM, dual-[licensed][3] under GPLv3 and Pimcore Enterprise License (PEL) that enables sellers to centralize and harmonize sales, marketing, and technical product information. Pimcore can acquire, manage, and share any digital data and integrate easily into an existing IT system landscape. Its API-driven, service-oriented architecture enables fast and seamless connection to third-party software such as enterprise resource planning (ERP), customer relationship management (CRM), business intelligence (BI), and more.

### Open source vs. proprietary PIM software

There are at least four significant differences between open source and proprietary software that PIM users should consider.

  * **Vendor lock-in:** It is more difficult to customize proprietary software. If you want to develop a new feature or modify an existing one, proprietary software lock-in makes you dependent on the vendor. On the other hand, open source provides unlimited access and flexibility to modify the source code and leverage it to your advantage, as well as the opportunity to freely access contributions made by the community behind it.
  * **Interoperability:** Open source PIM software offers greater interoperability capabilities with APIs for integration with third-party business applications. Since the source code is open and available, users can customize or build connectors to meet their needs, which is not possible with proprietary software.
  * **Community:** Open source solutions are supported by vibrant communities of contributors, implementers, developers, and other enthusiasts working towards enhancing the solution. Proprietary PIM software typically depends on commercial partnerships for implementation assistance and customizations.
  * **Total cost of ownership:** Proprietary software carries a significant license fee for deployment, which includes implementation, customization, and system maintenance. In contrast, open source software development can be done in-house or through an IT vendor. This becomes a huge advantage for enterprises with tight budgets, as it slashes PIM operating costs.



### Pimcore features

Pimcore's platform is divided into two core offerings: data management and experience management. In addition to being open source and free to download and use, its features include the following.

#### Data modeling

Pimcore's web-based data modeling engine has over 40 high-performance data types that can help companies easily manage zillions of products or other master data with thousands of attributes. It also offers multilingual data management, object relations, data classification, digital asset management (DAM), and data modeling supported by data inheritance.

![Pimcore translations inheritance][4]

#### Data management

Pimcore enables efficient enterprise data management that focuses on ease of use; consistency in aggregation, organization, classification, and translation of product information; and sound data governance to enable optimization, flexibility, and scalability.

![PIM batch change][5]

#### Data quality

Data quality management is the basis for analytics and business intelligence (BI). Pimcore supports data quality, completeness, and validation, and includes rich auditing and versioning features to help organizations meet revenue goals, compliance requirements, and productivity objectives. Pimcore also offers a configurable dashboard, custom reports capabilities, filtering, and export functionalities.

![PIM data quality and completeness][6]

#### Workflow management

Pimcore's advanced workflow engine makes it easy to build and modify workflows to improve accuracy and productivity and reduce risks. Drop-downs enable enterprises to chalk out workflow paths to define business processes and editorial workflows with ease, and the customizable management and administration interface makes it easy to integrate workflows into an organization's application infrastructure.

![Pimcore workflow management][7]

#### Data consolidation

Pimcore eliminates data silos by consolidating data in a central place and creating a single master data record or a single point of truth. It does this by gathering data lying in disparate systems spread across geographic locations, departments, applications, hard drives, vendors, suppliers, and more. By consolidating data, enterprises can get improved accuracy, reliability, and efficacy of information, lower cost of compliance, and decreased time-to-market.

#### Synchronization across channels

Pimcore's tools for gathering and managing digital data enable sellers to deliver it across any channel or device to reach individual customers on their preferred platforms. This helps enterprises enrich the user experience, leverage a single point of control to optimize performance, improve data governance, streamline product data lifecycle management, and boost productivity to reduce time-to-market and meet customers' expectations.

### Installing, trying, and using Pimcore

The best way to start exploring Pimcore is with a guided tour or demo; before you begin, make sure that you have the [system requirements][8] in place.

#### Demo Pimcore

Navigate to the [Pimcore demo][9] page and either register for a guided tour or click on one of the products in the "Try By Yourself" column for a self-guided demo. Enter the username **admin** and password **demo** to begin the demo.

![Pimcore demo page][10]

#### Download and install Pimcore

If you want to take a deeper dive, you can [download Pimcore][11]; you can choose the data management or the experience management offering or both. You will need to enter your contact information and then immediately receive installation instructions.

![Pimcore download interface][12]

You can also choose from four installation packages: three are demo packages for beginners, and one is a skeleton for experienced developers. All contain:

  * Complete Pimcore platform
  * Latest open source version
  * Quick-start guide
  * Demo data for getting started



If you are installing Pimcore on a typical [LAMP][13] environment (which is recommended), see the [Pimcore installation guide][14]. If you're using another setup (e.g., Nginx), see the [installation, setup, and upgrade guide][15] for details.

![Pimcore installation documentation][16]

### Contribute to Pimcore

As open source software, users are encouraged to engage with, [contribute][17] to, and fork Pimcore. For tracking bugs and features, as well as for software management, Pimcore relies exclusively on [GitHub][18], where contributions are assessed and carefully curated to uphold Pimcore's quality standards.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/pimcore-alternative-product-information-management

作者：[Dietmar Rietsch][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/erinmcmahon
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard.png?itok=kBeRTFL1 (Pair programming)
[2]: https://pimcore.com/en
[3]: https://github.com/pimcore/pimcore/blob/master/LICENSE.md
[4]: https://opensource.com/sites/default/files/uploads/pimcoretranslationinheritance.png (Pimcore translations inheritance)
[5]: https://opensource.com/sites/default/files/uploads/pimcorebatchchange.png (PIM batch change)
[6]: https://opensource.com/sites/default/files/uploads/pimcoredataquality.png (PIM data quality and completeness)
[7]: https://opensource.com/sites/default/files/pimcore-workflow-management.jpg (Pimcore workflow management)
[8]: https://pimcore.com/docs/5.x/Development_Documentation/Installation_and_Upgrade/System_Requirements.html
[9]: https://pimcore.com/en/try
[10]: https://opensource.com/sites/default/files/uploads/pimcoredemopage.png (Pimcore demo page)
[11]: https://pimcore.com/en/download
[12]: https://opensource.com/sites/default/files/uploads/pimcoredownload.png (Pimcore download interface)
[13]: https://en.wikipedia.org/wiki/LAMP_(software_bundle)
[14]: https://pimcore.com/docs/5.x/Development_Documentation/Getting_Started/Installation.html
[15]: https://pimcore.com/docs/5.x/Development_Documentation/Installation_and_Upgrade/index.html
[16]: https://opensource.com/sites/default/files/uploads/pimcoreinstall.png (Pimcore installation documentation)
[17]: https://github.com/pimcore/pimcore/blob/master/CONTRIBUTING.md
[18]: https://github.com/pimcore/pimcore
