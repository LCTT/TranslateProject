[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Continuous Delivery in the Age of Microservices and COVID-19)
[#]: via: (https://www.linux.com/interviews/continuous-delivery-in-the-age-of-microservices-and-covid-19/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

Continuous Delivery in the Age of Microservices and COVID-19
======

_The goal of continuous delivery (CD) is to produce high-quality software rapidly. While the emergence of microservices and cloud-native technology has brought huge benefits in scalability, it has added a layer of complexity to this approach. Security is another big challenge. In this discussion with Tracy Miranda, Executive Director of the Continuous Delivery Foundation, we talked about some of the pain points the organizations face when bolstering their CD practices and how the Foundation is helping to address them._

**Swapnil Bhartiya: How would you define continuous delivery? Also, what about the CI part of it because when we talk about it, we always say CI/CD?**

Tracy Miranda: We define continuous delivery as a software engineering approach in which teams work in short cycles and they ensure that the code is always released at any point in time. Now, traditionally, people tend to speak a lot about continuous integration and continuous delivery (CI/CD). Continuous integration is when developers regularly commit at least once a day to a mainline and keep that main line up to date. But I see continuous delivery as really this umbrella of all the practices you need to keep that software ready to be released at any time. That includes continuous integration, security features, testing and so on. It’s a general set of practices.

**Swapnil Bhartiya: CI/CD is a solved problem and there are many open-source projects around it. What role is the Foundation playing in this space?**

Tracy Miranda: We know a lot about continuous delivery today and we appreciate that it is really important because it makes such a difference to every business today — not just software companies, but also banks and the healthcare industry. However, the adoption of continuous delivery practices is super low. Many people think they’re doing it, but maybe they’re doing some continuous integration and they haven’t quite figured out how to get through automation.

To top it off, what makes things even more complicated is we’ve seen the rise of microservices and cloud-native technology. While these give us huge benefits in terms of scalability and easy to work on separate parts of the application, they have also increased challenges, like a proliferation of environments and teams having to contend with all these different parts that make up an application.

The Continuous Delivery Foundation is there to help support teams and organizations in the adoption of these practices both from the sense of taking advantage of open source projects in the space and democratizing the best practices. We have a very recent working group that’s spun up to help anyone in this space get better at delivering software.

**Swapnil Bhartiya: Security is becoming a serious concern and no longer an after-thought. In most cases, we see that companies were compromised not because of some zero-day, but because they didn’t apply the patch to a known vulnerability. When you have billions of deployments of your applications, it becomes challenging. Talk about the role CD plays in improving security.**

Tracy Miranda: Security is a top concern. I think there are lots of different elements to this. On one hand, we talk a lot about shift-left of security. We need to make sure the security professionals and the folks focused on security are tightly involved with the rest of the team. So, there are no silos. People don’t regard security as someone else’s problem. Security starts with the developers.

As an industry, I think it’s really important that we work together to solve industry-level problems such as applying patches that are already available. It’s more or less an outreach problem. We need to be better at telling people to keep their systems updated. We need to cut through the noise of all the different messaging they’re hearing. I think that’s another example where something like the Continuous Delivery Foundation can make a difference in addressing these broad industry problems.

**Swapnil Bhartiya: You also mentioned microservices as a challenge for companies. What is being done around solving the problem of continuous delivery for microservices?**

Tracy Miranda: That’s a great question. We definitely have the big split of folks who are used to delivering a monolith and they have their existing setup, all geared towards supporting that. Then, there is an increasing number of folks who are trying to take advantage of microservices and all its implications. One of the hot topics that’s emerged for us is configuration management. How we think about this is earlier, the scope of your application was very well defined. With microservices, the definition of an application changes — it’s a set of microservices. How do we talk about which version of each microservice goes into a specific app? If we are continuously pushing code and integrating that, how are those different versions changing relative to each other? How are we testing that all together? So, we’ve definitely think configuration management is a really hot topic and people are looking at tooling in the space. I think we have a couple of interesting projects that might be coming in the pipeline to CDF that will specifically help to drive visibility into this space and give people better tooling to manage all the dependencies around microservices.

**Swapnil Bhartiya: There are so many projects and open-source tools for CD, which may also lead to a problem of interoperability.  How big is it a concern for the Foundation and what are you doing to increase interoperability within these tools?**

Tracy Miranda: Interoperability is one of those problems where if you’re just working in your own organization, sometimes, it’s not really a problem until it’s time to adopt a new tool or add something into your workflow. If we step back and look at the industry as a whole and take a look across the whole landscape, at the moment, it’s hugely fragmented. There’s a lot of tools doing similar things. It’s very difficult for people to move from different CI tools or different pipeline orchestration tools without having to go through a lot of pain to figure out how to do that. Providers have to implement plugins for different systems. It’s a waste of time and it slows down innovation when we could be moving up the stack.

I think where we are today, there’s a greater appreciation from end users who are saying “We want to simplify this. We want to find better ways for tools to interoperate.” At CDF, one of the very first special interest groups we had was an interoperability working group. This is a set of like-minded folks who got together and said, “As an industry, we should be better and we can be better. We need to figure that out.” It’s a really good group of folks that build the projects like Jenkins X, Tekton, and Spinnaker. We’ve also got a lot of end-user members represented like Ericsson and eBay to make sure that as the problems are being solved, they apply to real-world use cases.

It’s an open group and people are welcome to join these conversations. At the moment, there is a discussion on standardizing interfaces or metadata. Why can’t we have a standardized way to express all the metadata around a release or all the metadata around a set of testing results? I am really excited about what this group is doing and look forward to if they can really achieve this very difficult goal and bring some consolidation around the tooling.

**Swapnil Bhartiya: One last question before we wrap this up: how is COVID-19 affecting continuous delivery?**

Tracy Miranda: It has definitely increased. We have seen some surveys that show that the adoption of continuous delivery is increasing. The pandemic has emphasized the need to be more resilient and to adapt quickly. Most organizations are going to evolve to be very distributed. Continuous delivery practices enable all those things. The companies who are already doing these practices have a significant advantage in times like these. I think one of the benefits we have as a Foundation is that open source has always been about collaboration at scale and in a distributed way. So, we’re hoping we can take all those lessons and marry open-source practices to continuous delivery practices and make it easier for everybody to adopt them. It shouldn’t be something elite that only a few companies could do. It should be something that’s possible and achievable for every company and every organization out there.
--------------------------------------------------------------------------------

via: https://www.linux.com/interviews/continuous-delivery-in-the-age-of-microservices-and-covid-19/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
