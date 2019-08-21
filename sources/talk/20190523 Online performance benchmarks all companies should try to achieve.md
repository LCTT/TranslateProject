[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Online performance benchmarks all companies should try to achieve)
[#]: via: (https://www.networkworld.com/article/3397322/online-performance-benchmarks-all-companies-should-try-to-achieve.html)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

Online performance benchmarks all companies should try to achieve
======
With digital performance more important than ever, companies must ensure their online performance meets customers’ needs. A new ThousandEyes report can help them determine that.
![Thinkstock][1]

There's no doubt about it: We have entered the experience economy, and digital performance is more important than ever.

Customer experience is the top brand differentiator, topping price and every other factor. And businesses that provide a poor digital experience will find customers will actively seek a competitor. In fact, recent ZK Research found that in 2018, about two-thirds of millennials changed loyalties to a brand because of a bad experience. (Note: I am an employee of ZK Research.)

To help companies determine if their online performance is leading, lacking, or on par with some of the top companies, ThousandEyes this week released its [2019 Digital Experience Performance Benchmark Report][2]. This document provides a comparative analysis of web, infrastructure, and network performance from the top 20 U.S. digital retail, travel, and media websites. Although this is a small sampling of companies, those three industries are the most competitive when it comes to using their digital platforms for competitive advantage. The aggregated data from this report can be used as an industry-agnostic performance benchmark that all companies should strive to meet.

**[ Read also:[IoT providers need to take responsibility for performance][3] ]**

The methodology of the study was for ThousandEyes to use its own platform to provide an independent view of performance. It uses active monitoring and a global network of monitoring agents to measure application and network layer performance for websites, applications, and services. The company collected data from 36 major cities scattered across the U.S. Six of the locations (Ashburn, Chicago, Dallas, Los Angeles, San Jose, and Seattle) also included vantage points connected to six major broadband ISPs (AT&T, CenturyLink, Charter, Comcast, Cox, and Verizon). This acts as a good proxy for what a user would experience.

The test involved page load tests against the websites of the major companies in retail, media, and travel and looked at several factors, including DNS response time, round-trip latency, network time (one-way latency), HTTP response time, and page load. The averages and median times can be seen in the table below. Those can be considered the average benchmarks that all companies should try to attain.

![][4]

### Choice of content delivery network matters by location

ThousandEyes' report also looked at how the various services that companies use impacts web performance. For example, the study measured the performance of the content delivery network (CDN) providers in the 36 markets. It found that in Albuquerque, Akamai and Fastly had the most latency, whereas Edgecast had the least. It also found that in Boston, all of the CDN providers were close. Companies can use this type of data to help them select a CDN. Without it, decision makers are essentially guessing and hoping.

### CDN performance is impacted by ISP

Another useful set of data was cross-referencing CDN performance by ISP, which lead to some fascinating information. With Comcast, Akamai, Cloudfront, Google and Incapula all had high amounts of latency. Only Edgecast and Fastly offered average latency. On the other hand, all of the CDNs worked great with CenturyLink. This tells a buyer, "If my customer base is largely in Comcast’s footprint, I should look at Edgecast or Fastly or my customers will be impacted."

### DNS and latency directly impact page load times

The ThousandEyes study also confirmed some points that many people believe as true but until now had no quantifiable evidence to support it. For example, it's widely accepted that DNS response time and network latency to the CDN edge correlate to web performance; the data in the report now supports that belief. ThousandEyes did some regression analysis and fancy math and found that in general, companies that were in the top quartile of HTTP performance had above-average DNS response time and network performance. There were a few exceptions, but in most cases, this is true.

Based on all the data, the below are the benchmarks for the three infrastructure metrics gathered and is what businesses, even ones outside the three verticals studied, should hope to achieve to support a high-quality digital experience.

  * DNS response time 25 ms
  * Round trip network latency 15 ms
  * HTTP response time 250 ms



### Operations teams need to focus on digital performance

Benchmarking certainly provides value, but the report also offers some recommendations on how operations teams can use the data to improve digital performance. Those include:

  * **Measure site from distributed user vantage points**. There is no single point that will provide a view of digital performance everywhere. Instead, measure from a range of ISPs in different regions and take a multi-layered approach to visibility (application, network and routing).
  * **Use internet performance information as a baseline**. Compare your organization's data to the baselines, and if you’re not meeting it in some markets, focus on improvement there.
  * **Compare performance to industry peers**. In highly competitive industries, it’s important to understand how you rank versus the competition. Don’t be satisfied with hitting the benchmarks if your key competitors exceed them.
  * **Build a strong performance stack.** The data shows that solid DNS and HTTP response times and low latency are correlated to solid page load times. Focus on optimizing those factors and consider them foundational to digital performance.



Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3397322/online-performance-benchmarks-all-companies-should-try-to-achieve.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2017/07/racing_speed_runners_internet-speed-100728363-large.jpg
[2]: https://www.thousandeyes.com/research/digital-experience
[3]: https://www.networkworld.com/article/3340318/iot-providers-need-to-take-responsibility-for-performance.html
[4]: https://images.idgesg.net/images/article/2019/05/thousandeyes-100797290-large.jpg
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
