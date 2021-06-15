[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open Usage Commons: Google’s Initiative to Manage Trademark for Open Source Projects Runs into Controversy)
[#]: via: (https://itsfoss.com/open-usage-commons-controversy/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Open Usage Commons: Google’s Initiative to Manage Trademark for Open Source Projects Runs into Controversy
======

Back in July, Google [announced][1] a new organization named Open Usage Commons. The aim of the organization is to help “projects protect their project identity through programs such as trademark management and usage guidelines”.

Google believes that “creating a neutral, independent ownership for these trademarks gives contributors and consumers peace of mind regarding their use of project names in a fair and transparent way”.

### Open Usage Commons and the controversy with IBM

![][2]

Everything seems good in theory, right? But soon after the Google’s announcement of the Open Usage Commons, [IBM made an objection][3].

The problem is that Google included [Istio][4] project under [Open Usage Commons][5]. IBM is one of the founding members of the Istio project and it wants the project to be under open governance with [CNCF][6].

On behalf of It’s FOSS, I had a quick interaction with [Heikki Nousiainen][7], CTO at [Aiven][8] to clear some air on the entire Open Usage Commons episode.

#### What is the Open Usage Commons trying to do?

**Heikki Nousiainen**: The stated purpose of Google’s Open Usage Commons (OUC) is to provide a neutral and independent organization for open source projects to host and manage their trademarks. By applying open source software principles to trademarks, this will provide transparency and consistency. The idea is that this will lead to a more vibrant ecosystem for end users because vendors and developers can confidently build something that relies on projects’ brands. 

Although other foundations, such as the Cloud Native Computing Foundation (CNCF) and [Apache Foundation][9], provide some direction on trademarks, OUC provides more precision and consistency in what constitutes fair use for vendors. This avoids what has generally been left to the individual projects to decide, which has resulted in a confusing patchwork of guidelines.

Additionally, it is likely an attempt by Google to avoid situations similar to what [Amazon Web Services (AWS) has faced with Elasticsearch][10], e.g. where trademarks have appeared to be increasingly used to prevent exactly what Google is attempting to accomplish with this foundation, _**relatively open use of project brand identifiers by competing vendors**_.

#### What are the problems surrounding the Commons?

**Heikki Nousiainen**: The main controversy surrounds the question as to why [Istio][11] was not placed under CNCF governance as IBM was clearly expecting it to be placed under an [Open Governance model][12] once it matured.

However, Open Usage Commons does not touch the governance model at all. Google, of course, has incentive to be able to trust they can utilize the recognized brands and trademarks to help customers recognize the services built on top of these familiar technologies.

#### How will it impact the open source world, both positive and negative impacts?

**Heikki Nousiainen**: It will remain to be seen what the long-term impact will be due to the fact that the only member projects are currently driven by Google. Although controversial, it doesn’t seem like the fears that Google would be able to enact effective control over member projects will materialize.

A more telling question is, “Who will be likely to participate?” One thing is for sure, this will spark a long overdue discussion on how Open Source trademarks should be used when moving from software bundles to services offered in the cloud.

#### Does it sound like some big players will have control over the definition of ‘open source trademarks’? 

**Heikki Nousiainen**: Despite all the controversy over licensing, big players in this space have been and will remain key in securing the resources and support needed for the open source community to thrive.

Although there is some self-interest here, the creation of vehicles such as this do not necessarily constitute an attempt at imposing unjustified control over projects. As a community-driven software, all must work alongside one another to achieve success.

* * *

Personally, I think Google’s long term game plan is to protect its Google Cloud Platform from possible lawsuits over the use of popular source projects’ trademarks and branding.

What do you think of the entire Open Usage Commons episode?

--------------------------------------------------------------------------------

via: https://itsfoss.com/open-usage-commons-controversy/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://opensource.googleblog.com/2020/07/announcing-new-kind-of-open-source.html
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/google-open-usage-commons.png?resize=800%2C450&ssl=1
[3]: https://developer.ibm.com/components/istio/blogs/istio-google-open-usage-commons/
[4]: https://istio.io
[5]: https://openusage.org
[6]: https://www.cncf.io/
[7]: https://www.linkedin.com/in/heikki-nousiainen/
[8]: https://aiven.io
[9]: http://apache.org
[10]: https://news.bloomberglaw.com/ip-law/amazon-sued-for-allegedly-infringing-elasticsearch-trademarks
[11]: https://istio.io/
[12]: https://developer.ibm.com/articles/open-governance-community/
