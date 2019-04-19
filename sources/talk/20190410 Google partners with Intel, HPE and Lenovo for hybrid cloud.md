[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Google partners with Intel, HPE and Lenovo for hybrid cloud)
[#]: via: (https://www.networkworld.com/article/3388062/google-partners-with-intel-hpe-and-lenovo-for-hybrid-cloud.html#tk.rss_all)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Google partners with Intel, HPE and Lenovo for hybrid cloud
======
Google boosted its on-premises and cloud connections with Kubernetes and serverless computing.
![Ilze Lucero \(CC0\)][1]

Still struggling to get its Google Cloud business out of single-digit marketshare, Google this week introduced new partnerships with Lenovo and Intel to help bolster its hybrid cloud offerings, both built on Google’s Kubernetes container technology.

At Google’s Next ’19 show this week, Intel and Google said they will collaborate on Google's Anthos, a new reference design based on the second-Generation Xeon Scalable processor introduced last week and an optimized Kubernetes software stack designed to deliver increased workload portability between public and private cloud environments.

**[ Read also:[What hybrid cloud means in practice][2] | Get regularly scheduled insights: [Sign up for Network World newsletters][3] ]**

As part the Anthos announcement, Hewlett Packard Enterprise (HPE) said it has validated Anthos on its ProLiant servers, while Lenovo has done the same for its ThinkAgile platform. This solution will enable customers to get a consistent Kubernetes experience between Google Cloud and their on-premises HPE or Lenovo servers. No official word from Dell yet, but they can’t be far behind.

Users will be able to manage their Kubernetes clusters and enforce policy consistently across environments – either in the public cloud or on-premises. In addition, Anthos delivers a fully integrated stack of hardened components, including OS and container runtimes that are tested and validated by Google, so customers can upgrade their clusters with confidence and minimize downtime.

### What is Google Anthos?

Google formally introduced [Anthos][4] at this year’s show. Anthos, formerly Cloud Services Platform, is meant to allow users to run their containerized applications without spending time on building, managing, and operating Kubernetes clusters. It runs both on Google Cloud Platform (GCP) with Google Kubernetes Engine (GKE) and in your data center with GKE On-Prem. Anthos will also let you manage workloads running on third-party clouds such as Amazon Web Services (AWS) and Microsoft Azure.

Google also announced the beta release of Anthos Migrate, which auto-migrates virtual machines (VM) from on-premises or other clouds directly into containers in GKE with minimal effort. This allows enterprises to migrate their infrastructure in one streamlined motion, without upfront modifications to the original VMs or applications.

Intel said it will publish the production design as an Intel Select Solution, as well as a developer platform, making it available to anyone who wants it.

### Serverless environments

Google isn’t stopping with Kubernetes containers, it’s also pushing ahead with serverless environments. [Cloud Run][5] is Google’s implementation of serverless computing, which is something of a misnomer. You still run your apps on servers; you just aren’t using a dedicated physical server. It is stateless, so resources are not allocated until you actually run or use the application.

Cloud Run is a fully serverless offering that takes care of all infrastructure management, including the provisioning, configuring, scaling, and managing of servers. It automatically scales up or down within seconds, even down to zero depending on traffic, ensuring you pay only for the resources you actually use. Cloud Run can be used on GKE, offering the option to run side by side with other workloads deployed in the same cluster.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3388062/google-partners-with-intel-hpe-and-lenovo-for-hybrid-cloud.html#tk.rss_all

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/03/cubes_blocks_squares_containers_ilze_lucero_cc0_via_unsplash_1200x800-100752172-large.jpg
[2]: https://www.networkworld.com/article/3249495/what-hybrid-cloud-mean-practice
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://cloud.google.com/blog/topics/hybrid-cloud/new-platform-for-managing-applications-in-todays-multi-cloud-world
[5]: https://cloud.google.com/blog/products/serverless/announcing-cloud-run-the-newest-member-of-our-serverless-compute-stack
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
