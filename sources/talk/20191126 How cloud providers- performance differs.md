[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How cloud providers' performance differs)
[#]: via: (https://www.networkworld.com/article/3455197/how-cloud-providers-performance-differs.html)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

How cloud providers' performance differs
======
The 2019 ThousandEyes Benchmark report shows that not all cloud providers are created equal across all regions
Denis Isakov / Getty Images

Not all public cloud service providers are the same when it comes to network performance.

Each one’s connectivity approach varies, which causes geographical discrepancies in network performance and predictability. As businesses consider moving to the cloud, especially software-defined wide-area networks ([SD-WAN][1]) and [multi-cloud][2], it’s important to understand what each public cloud service provider brings to the table and how they compare.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

In 2018, ThousandEyes first conducted [a benchmark study assessing three major public cloud providers][4]: Amazon Web Services (AWS), Microsoft Azure (Azure), and Google Cloud Platform (GCP). The study gathered data on network performance and connectivity architecture to guide businesses in the planning stage.

[][5]

BrandPost Sponsored by HPE

[HPE Synergy For Dummies][5]

Here’s how IT can provide an anytime, anywhere, any workload infrastructure.

[This year’s study][6] offers a more comprehensive view of the competition, with two more providers added to the list: Alibaba Cloud and IBM Cloud. It compares 2018 and 2019 data to show changes that took place year-over-year and what triggered them.

ThousandEyes periodically collected bi-directional network performance metrics—such as latency, packet loss and jitter—from 98 user vantage points in global [data centers][7] across all five public cloud providers over a four-week period. Additionally, it looked at network performance from leading U.S. broadband internet service providers (ISPs), including AT&amp;T, Verizon, Comcast, CenturyLink, Cox, and Charter.

The network management company then analyzed more than 320 million data points to create the benchmark. Here are the results.

### Inconsistencies among providers

In its initial study, ThousandEyes revealed that some cloud providers rely heavily on the public internet to carry user traffic while others don’t. In this year’s study, the cloud providers generally showed similar performance in bi-directional network latency.

However, ThousandEyes found architectural and connectivity differences have a big impact on how traffic travels between users and certain cloud hosting regions. AWS and Alibaba mostly rely on the internet to transport user traffic. Azure and GCP use their private backbone networks. IBM is different from the rest and takes a hybrid approach.

ThousandEyes tested the theory of whether AWS Global Accelerator out-performs the internet. AWS Global Accelerator launched in November 2018, offering users the option to utilize the AWS private backbone network for a fee instead of the default public internet. Although performance did improve in some regions around the world, there where other instances where the internet was faster and more reliable than AWS Global Accelerator.

Broadband ISPs that businesses use to connect to each cloud also showed inconsistencies, even in the mature U.S. market. After evaluating network performance from the six U.S. ISPs, sub-optimal routing results were recorded, with up to 10 times the expected network latency in some cases.

**Location, location, location**

Cloud providers commonly experience packet loss when crossing through China’s content-filtering firewall, even those from the region like Alibaba. The 2019 study closely examined the performance toll cloud providers pay in China, which has a notoriously challenging geography for online businesses. For those with customers in China, ThousandEyes recommends Hong Kong as a hosting region since Alibaba Cloud traffic experienced the least packet loss there, followed by Azure and IBM.

In other parts of the world, Latin America and Asia showed the highest performance variations for all cloud providers. For example, network latency was six times higher from Rio de Janeiro to GCP’s São Paulo hosting region because of a suboptimal reverse path, compared to other providers. But across North America and Western Europe, all five cloud providers demonstrated comparable, robust network performance.

The study’s results confirm that location is a major factor, therefore, user-to-hosting-region performance data should be considered when selecting a public cloud provider.

**Multi-cloud connectivity**

In 2018, ThousandEyes discovered extensive connectivity between the backbone networks of AWS, GCP, and Azure. An interesting finding in this year’s study shows multi-cloud connectivity was erratic when IBM and Alibaba Cloud were added to the list.

ThousandEyes found IBM and Alibaba Cloud don’t have fully established, direct connectivity with other providers. That’s because they typically use ISPs to connect their clouds to other providers. AWS, Azure, and GCP, on the other hand, peer directly with each other and don’t require third-party ISPs for multi-cloud communication.

With multi-cloud initiatives on the rise, network performance should be included as a metric in evaluating multi-cloud connectivity since it appears to be inconsistent across providers and geographical boundaries.

ThousandEyes’ comprehensive performance benchmark can serve as a guide for businesses deciding which public cloud provider best meets their needs. But to err on the side of caution, businesses selecting public cloud connectivity should consider the unpredictable nature of the internet, how it affects performance, creates risk, and increases operational complexity. Businesses should address those challenges by gathering their own network intelligence on a case-by-case basis. Only then they will benefit fully from what cloud providers have to offer.

Join the Network World communities on [Facebook][8] and [LinkedIn][9] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3455197/how-cloud-providers-performance-differs.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[2]: https://www.networkworld.com/article/3429258/real-world-tools-for-multi-cloud-management.html
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3319776/the-network-matters-for-public-cloud-performance.html
[5]: https://www.networkworld.com/article/3399618/hpe-synergy-for-dummies.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE19718&utm_content=sidebar (HPE Synergy For Dummies)
[6]: https://www.thousandeyes.com/press-releases/second-annual-cloud-performance-benchmark-research
[7]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[8]: https://www.facebook.com/NetworkWorld/
[9]: https://www.linkedin.com/company/network-world
