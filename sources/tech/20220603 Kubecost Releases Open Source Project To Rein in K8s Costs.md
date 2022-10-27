[#]: subject: "Kubecost Releases Open Source Project To Rein in K8s Costs"
[#]: via: "https://www.opensourceforu.com/2022/06/kubecost-releases-open-source-project-to-rein-in-k8s-costs/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Kubecost Releases Open Source Project To Rein in K8s Costs
======
![Hybrid-Cloud-Optimization][1]

Kubecost’s tool for monitoring and optimizing spending on Kubernetes clusters has been released as an open source project. OpenCost is now available as open source software, according to Alex Thilen, head of business development at Kubecost, and the company has already submitted it to the Cloud Native Computing Foundation (CNCF) for approval as a sandbox-level project. Adobe, Armory, Amazon Web Services (AWS), D2iQ, Google, Mincurv, New Relic, and SUSE are among the project’s founding members, in addition to Kubecost.

Stackwatch created Kubecost in the beginning. Kubecost later raised $25 million to develop tools and applications on top of what is now OpenCost. Although OpenCost is designed to run within a Kubernetes cluster, no data is sent outside of the cluster without user permission. It can collect data in real-time after only a few minutes of installation.

The primary issue addressed by OpenCost is overprovisioning of Kubernetes infrastructure. Many developers will overprovision infrastructure to ensure maximum application performance. The problem is that much of that infrastructure will go unused; costs will rise steadily as each new Kubernetes cluster is provisioned. According to Kubecost, organisations can cut Kubernetes-related cloud spending by 60–80 percent without sacrificing application performance.

Of course, many enterprise IT departments will have signed contracts with cloud service providers that guarantee discounted pricing if a certain number of workloads are run per month. To reduce overall costs, many IT organisations prefer to continuously monitor pricing offered by multiple cloud service providers. Regardless of approach, interest in cost containment is growing as the percentage of workloads running on cloud platforms grows.

As the percentage of workloads running on Kubernetes clusters grows, it is more likely that those platforms will be managed centrally by an IT operations team. These teams are graded based on how well they optimise cloud infrastructure usage. These teams must also demonstrate to development teams how much Kubernetes infrastructure is consumed by individual applications.

According to Thilen, changing economic conditions mean that there is a lot more emphasis on cost control today than there was just a few months ago. Finance teams, in particular, are asking tougher questions about IT spending than they did at the start of the COVID-19 pandemic, when the primary focus was shifting as many workloads as possible to the cloud.

According to Thilen, the primary issue that organisations face in controlling cloud costs is a lack of visibility, which OpenCost can provide. It’s unclear when Kubernetes cost controls will be ubiquitously included in every management tool, but the existence of OpenCost suggests that it’s now a matter of when rather than if those tools will become much more accessible.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/06/kubecost-releases-open-source-project-to-rein-in-k8s-costs/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/06/Hybrid-Cloud-Optimization-e1654241448205.png
