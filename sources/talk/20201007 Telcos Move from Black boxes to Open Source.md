[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Telcos Move from Black boxes to Open Source)
[#]: via: (https://www.linux.com/interviews/telcos-move-from-black-boxes-to-open-source/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

Telcos Move from Black boxes to Open Source
======

*Linux Foundation Networking (LFN) organized its first virtual event last week and we sat down with Arpit Joshipura, the General Manager of Networking, IoT and Edge at the Linux Foundation, to talk about the key points of the event and how LFN is leading the adoption of open source within the telco space. *

**Swapnil Bhartiya: Today, we have with us Arpit Joshipura, General Manager of Networking, IoT and Edge, at the Linux Foundation. Arpit, what were some of the highlights of this event? Some big announcements that you can talk about?**

**Arpit Joshipura:** This was a global event with more than 80 sessions and was attended by attendees from over 75 countries. The sessions were very diverse. A lot of the sessions were end-user driven, operator driven as well as from our vendors and partners. If you take LF Networking and LFH as two umbrellas that are leading the Networking and Edge implementations here, we had a very significant announcement. I would probably group them into 5 main things:

Number one, we released a white paper at the Linux Foundation level where we had a bunch of vertical industries transformed using open source. These are over 100-year-old industries like telecom, automotive, finance, energy, healthcare, etc. So, that’s kind of one big announcement where vertical industries have taken advantage of open source.

The second announcement was easy enough: Google Cloud joins Linux Foundation Networking as a partner. That announcement comes on the basis of the telecom market and the cloud market converging together and building on each other.

The third major announcement was a project under LF Networking. If you remember, two years ago, a project collaboration with GSMA was started. It was called CNTT, which really defined and narrowed the scope of interoperability and compliance. And we have OPNFV under LFN. What we announced at Open Networking and Edge summit is the two projects are going to come together. This would be fantastic to a global community of operators who are simplifying the deployment and interoperability of implementation of NFVI manual VNFs and CNFs.

The next announcement was around a research study that we released on open source code that was created by Linux Foundation Networking, using LFN analytics and COCOMO estimation. We’re talking $7.2 billion worth of IP investment, right? This is the power of shared technology.

And finally, we released a survey on the Edge community asking them, “Why are you contributing to open source?” And the answer was fascinating. It was all-around innovation, speed to deployment, market creation. Yes, cost was important, but not initially.

So those were the 5 big highlights of the show from an LFN and LFH perspective.

**Swapnil Bhartiya: There are two things that I’m interested in. One is the consolidation that you talk about, and the second is survey. The fact is that everybody is using open source. There is no doubt about it. But the problem that is happening is since everybody’s using it, there seems to be some gap between the awareness of how to be a good open source citizen as well. What have you seen in the telco space?**

**Arpit Joshipura:** First of all, 5 years ago, they were all using black box and proprietary technologies. Then, we launched a project called OpenDaylight. And of course, OpenDaylight announced its 13th release today, but that’s kind of on their 6-year anniversary from being proprietary to today in one of the more active projects called ONAP. The telcos are 4 of the Top 10 contributors of source code and open source, right? Who would have imagined that an AT&amp;T, Verizon, Amdocs, DT, Vodafone, and a China mobile and a China telecom, you name it are all actively contributing code? So that’s a paradigm shift in terms of not only consuming it, but also contributing towards it.

**Swapnil Bhartiya: And since you mentioned ONAP, if I’m not wrong, I think AT&amp;T released its own work as E-com. And then the projects within the Foundation were merged to create ONAP. And then you mentioned actually NTD. So, what I want to understand from you is how many projects are there that you see within the Foundation? The problem is that Linux Foundation and all those other foundations are open servers. It’s a very good place for those products to come in. It’s obvious that there will be some projects that will overlap. So what is the situation right now? Where do you see some overlap happening and, at the same time, are there still gaps that you need to fill?**

**Arpit Joshipura:** So that’s a question of the philosophies of a foundation, right? I’ll start off with the most loose situation, which is GitHub. Millions and millions of projects on GitHub. Any PhD student can throw his code on GitHub and say that’s open source and at the end of the day, if there’s no community around it, that project is dead. Okay. That’s the most extreme scenario. Then, there are foundations like CNCF who have a process of accepting projects that could have competing solutions. May the best project win.

From an LF Networking and LFH perspective, the process is a little bit more restrictive: there is a formal project life cycle document and a process available on the Wiki that looks at the complementary nature of the project, that looks at the ecosystem, that looks at how it will enable and foster innovation. Then based on that, the governing board and the neutral governance that we have set up under the Linux Foundation, they would approve it.

Overall, it depends on the philosophy for LFN and LFH. We have 8 projects each in the umbrella, and most of these projects are quite complementary when it comes to solving different use cases in different parts of the network.

**Swapnil Bhartiya: Awesome. Now, I want to talk about 5G a bit. I did not hear any announcements, but can you talk a bit about what is the word going on to help the further deployment of 5G technologies?**

**Arpit Joshipura:** Yeah. I’m happy and sad to say that 5G is old news, right? The reality is all of the infrastructure work on 5G already was released earlier this year. So ONAP Frankfurt release, for example, has a blueprint on 5G slicing, right? All the work has been done, lots of blueprint and Akraino using 5G and mech. So, that work is done. The cities are getting lit up by the carriers. You see announcements from global carriers on 5G deployments. I think there are 2 missing pieces of work remaining for 5G.

One is obviously the O-RAN support, right? The O-RAN software community, which we host at the Linux Foundation also is coming up with a second release. And, all the support for 5G is in there.

The second part of 5G is really the compliance and verification testing. A lot of work is going into CMTT and OPN and feed. Remember that merge project we talked about where 5G is in context of not just OpenStack, but also Kubernetes? So the cloud-native aspects of 5G are all being worked on this year. I think we’ll see a lot more cloud-native 5G deployments next year primarily because projects like ONAP or cloud native integrate with projects like ONAP and Anthos or Azure stack and things like that.

**Swapnil Bhartiya: What are some of the biggest challenges that the telco industry is facing? I mean, technically, no externalization and all those things were there, but foundations have solved the problem. Some rough ideas are still there that you’re trying to resolve for them.**

**Arpit Joshipura:** Yeah. I think the recent pandemic caused a significant change in the telcos’ thinking, right? Fortunately, because they had already started on a virtualization and open-source route, you heard from Android, and you heard from Deutsche Telekom, and you heard from Achronix, all of the operators were able to handle the change in the network traffic, change in the network, traffic direction, SLS workloads, etc., right? All because of the _softwarization_ as we call it on the network.

Given the pandemic, I think the first challenge for them was, can the network hold up? And the answer is, yes. Right? All the work-from-home and all these video recordings, we have to hang out with the web, that was number one.

Number two is it’s good to hold up the network, but did I end up spending millions and millions of dollars for operational expenditures? And the answer to that is no, especially for the telcos who have embraced an open-source ecosystem, right? So people who have deployed projects like SDN or ONAP or automation and orchestration or closed-loop controls, they automatically configure and reconfigure based on workloads and services and traffic, right? And that does not require manual labor, right? Tremendous amounts of costs were saved from an opex perspective, right?

For operators who are still in the old mindset have significantly increased their opex, and what that has caused is a real strain on their budget sheets.

So those were the 2 big things that we felt were challenges, but have been solved. Going forward, now it’s just a quick rollout/build-out of 5G, expanding 5G to Edge, and then partnering with the public cloud providers, at least, here in the US to bring the cloud-native solutions to market.

**Swapnil Bhartiya: Awesome. Now, Arpit, if I’m not wrong, LF Edge is I think, going to celebrate its second anniversary in January. What do you feel the product has achieved so far? What are its accomplishments? And what are some challenges that the project still has to tackle?**

**Arpit Joshipura:** Let me start off with the most important accomplishment as a community and that is terminology. We have a project called State of the Edge and we just issued a white paper, which outlines terminology, terms and definitions of what Edge is because, historically, people use terms like thin edge, thick edge, cloud edge, far edge, near edge and blah, blah, blah. They’re all relative terms. Okay. It’s an edge in relation to who I am.

Instead of that, the paper now defines absolute terms. If I give you a quick example, there are really 2 kinds of edges. There’s a device edge, and then there is a service provider edge. A device edge is really controlled by the operator, by the end user, I should say. Service provider edge is really shared as a service and the last mile typically separates them.

Now, if you double click on each of these categories, then you have several incarnations of an edge. You can have an extremely constrained edge, microcontrollers, etc., mostly manufacturing, IIoT type. You could have a smart device edge like gateways, etc. Or you could have an on-prem silver type device edge. Either way, an end user controls that edge versus the other edge. Whether it’s on the radio-based stations or in a smart central office, the operator controls it. So that’s kind of the first accomplishment, right? Standardizing on terminology.

The second big Edge accomplishment is around 2 projects: Akraino and EdgeX Foundry. These are stage 3 mature projects. They have come out with significant [results]. Akraino, for example, has come out with 20 plus blueprints. These are blueprints that actually can be deployed today, right? Just to refresh, a blueprint is a declarative configuration that has everything from end to end to solve a particular use case. So things like connected classrooms, AR/VR, connected cars, right? Network cloud, smart factories, smart cities, etc. So all these are available today.

EdgeX is the IoT framework for an industrial setup, and that’s kind of the most downloaded. Those 2 projects, along with Fledge, EVE, Baetyl, Home Edge, Open Horizon, security advanced onboarding, NSoT, right? Very, very strong growth over 200% growth in terms of contributions. Huge growth in membership, huge growth in new projects and the community overall. We’re seeing that Edge is really picking up great. Remember, I told you Edge is 4 times the size of the cloud. So, everybody is in it.

**Swapnil Bhartiya: Now, the second part of the question was also some of the challenges that are still there. You talked about accomplishment. What are the problems that you see that you still think that the project has to solve for the industry and the community?**

**Arpit Joshipura:** The fundamental challenge that remains is we’re still working as a community in different markets. I think the vendor ecosystem is trying to figure out who is the customer and who is the provider, right? Think of it this way: a carrier, for example, AT&amp;T, could be a provider to a manufacturing factory, who actually could consume something from a provider, and then ship it to an end user. So, there’s like a value shift, if you may, in the business world, on who gets the cut, if you may. That’s still a challenge. People are trying to figure out, I think people who are going to be quick to define, solve and implement solutions using open technology will probably turn out to be winners.

People who will just do analysis per analysis will be left behind like any other industry. I think that is kind of fundamentally number one. And number two, I think the speed at which we want to solve things. The pandemic has just accelerated the need for Edge and 5G. I think people are just eager to get gaming with low latency, get manufacturing, predictive maintenance with low latency, home surveillance with low latency, connected cars, autonomous driving, all the classroom use cases. They should have been done next year, but because of the pandemic, it just got accelerated.
--------------------------------------------------------------------------------

via: https://www.linux.com/interviews/telcos-move-from-black-boxes-to-open-source/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
