[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Containers vs. VMs, Istio in production, and more industry news)
[#]: via: (https://opensource.com/article/20/3/survey-istio-industry-news)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

Containers vs. VMs, Istio in production, and more industry news
======
A weekly look at open source community and industry trends.
![Person standing in front of a giant computer screen with numbers, data][1]

As part of my role as a senior product marketing manager at an enterprise software company with an open source development model, I publish a regular update about open source community, market, and industry trends for product marketers, managers, and other influencers. Here are five of my and their favorite articles from that update.

## [Tech adoption in the cloud native world: Containers and more][2]

>   * Adoption of containers in production rose to from 73% in 2018 to 84% in 2019. Among this group, those running at least 250 containers rose from 46% in 2018 to 58% in 2019. From 2017 to 2019, the number of respondents with more than 50 machines (physical or virtual) in their fleet rose from 77% in 2017 to 81% in 2019.
>   * Implication: Container adoption appears to have mitigated the growth of VMs that need to be managed. However, be wary of claims that the raw number of machines being managed will decline.
>


**The impact**: It intuitively makes sense that virtual machine growth would slow down as container use grows; there are lots of containers being deployed inside VMs to take advantage of the best features of both, and lots of apps that won't be containerized any time soon (looking at you legacy enterprise monoliths).

## [Everything we learned running Istio in production][3]

> At HelloFresh we organize our teams into squads and tribes. Each tribe has their own Kubernetes namespace. As mentioned above, we enabled sidecar injection namespace by namespace then application by application. Before enabling applications for Istio we held workshops so that squads understood the changes happening to their application. Since we employ the model of “you build it, you own it”, this allows teams to understand traffic flows when troubleshooting. Not only that, it also raised the knowledge bar within the company. We also created Istio related [OKR’s][4] to track our progress and reach our Istio adoption goals.

**The impact**: The parts of technology adoption that aren't technology adoption are ignored at your own peril.

## [Aether: the first open source edge cloud platform][5]

> Aether is bringing together projects that have been under development and operating in their own sandbox, and under that framework ONF is trying to support a diversity of edge services on a converged platform, Sloane explained. ONF’s various projects will remain separate and continue to be consumable separately, but Aether is its attempt to bring multiple capabilities together to simplify private edge cloud operations for enterprises.
>
> "We think we’re creating a new collaborative place where the industry and community can come together to help drive some maybe consolidation and critical mass behind a common platform that can then help common functionality proliferate in these edge clouds," he said.

**The impact**: The problems being solved with technology today are too complex to be solved with a single technology. The business problems being solved on top of that require focus on the truly, value-adding. Taken together, businesses need to find ways to collaborate on their shared needs and compete on what makes them unique in the market. You couldn't find a better way to do that than open source.

## [Women in cloud careers are challenging the narrative][6]

> "As cloud is a relatively new technology, my experience of [being a 'woman in tech'][7] may not be typical, as the cloud industry is extremely diverse," Yordanova says. "In fact, my team has an equal gender split with a real mix of personalities, cultures and strengths from people who grew up with this technology."

**The impact**: One thing I like to think about is the idea of leapfrogging; that you might be able to skip a certain step or stage in a process because the circumstance that caused its existence in the first place no longer applies. The cloud era didn't have as long a period with static stereotypes of who made it and who it was for, so maybe it carries less of the baggage of some previous generations of technology?

## [How StarlingX shines in the starry sky of open source projects in China][8]

> Our team is in China, so one of our missions is to help the Chinese community to develop the software, contribute code, documentation, and more.  Most of the StarlingX project meetings are held late at night in China, so the presence and participation for the Chinese community members are quite challenging. To overcome these obstacles, together with other community members (like friends in 99cloud) in China, we made some initiatives, such as engaging with other Chinese community members at the meet-ups, hands-on workshops ad-hoc tech meetings in Chinese, translating some documents to Chinese, and continuously interacting in WeChat groups (just like a 24/7 on-call services for and by everyone)

**The impact**: As Chinese contributions to open source projects continue to grow this seems like a situation that is likely to reverse, or at least equalize. It doesn't really make sense that "learn English" should be a pre-requisite to participating in the open source development process.

_I hope you enjoyed this list and come back next week for more open source community, market, and industry trends._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/survey-istio-industry-news

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://thenewstack.io/cncf-survey-snapshot-tech-adoption-in-the-cloud-native-world/
[3]: https://engineering.hellofresh.com/everything-we-learned-running-istio-in-production-part-1-51efec69df65
[4]: https://en.wikipedia.org/wiki/OKR
[5]: https://www.sdxcentral.com/articles/news/onf-projects-coalesce-for-enterprise-edge-cloud/2020/03/
[6]: https://www.cloudpro.co.uk/leadership/cloud-essentials/8446/how-women-in-cloud-are-challenging-the-narrative
[7]: https://www.itpro.co.uk/business-strategy/33301/diversity-not-a-company-priority-claim-nearly-half-of-women-in-tech
[8]: https://superuser.openstack.org/articles/starlingx-community-interview-how-starlingx-shines-in-the-starry-sky-of-open-source-projects-in-china/
