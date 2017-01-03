translating---geekpi

What is SRE (Site Reliability Engineering)?
============================================================

Site Reliability Engineer is a job title we are starting to see more and more these days. What does it mean? Where does it come from? Learn from Google's SRE team.

 ![Bridge](https://d3tdunqjn7n0wj.cloudfront.net/360x240/bridge-1031545-1400-389c9609ff7c64083c93db48dc77eeff.jpg) 

This is an excerpt from [Site Reliability Engineering][9], edited by Niall Richard Murphy, Jennifer Petoff, Chris Jones, Betsy Beyer.

Site Reliability Engineering will also be covered at the [O'Reilly Velocity Conference, Nov. 7-10 in Amsterdam][10].

### Introduction

> Hope is not a strategy.
> 
> Traditional SRE saying

It is a truth universally acknowledged that systems do not run themselves. How, then, _should_ a system—particularly a complex computing system that operates at a large scale—be run?


### The Sysadmin Approach to Service Management

The sysadmin model of service management has several advantages. For companies deciding how to run and staff a service, this approach is relatively easy to implement: as a familiar industry paradigm, there are many examples from which to learn and emulate. A relevant talent pool is already widely available. An array of existing tools, software components (off the shelf or otherwise), and integration companies are available to help run those assembled systems, so a novice sysadmin team doesn’t have to reinvent the wheel and design a system from scratch.

Traditional operations teams and their counterparts in product development thus often end up in conflict, most visibly over how quickly software can be released to production. At their core, the development teams want to launch new features and see them adopted by users. At _their_ core, the ops teams want to make sure the service doesn’t break while they are holding the pager. Because most outages are caused by some kind of change—a new configuration, a new feature launch, or a new type of user traffic—the two teams’ goals are fundamentally in tension.

Both groups understand that it is unacceptable to state their interests in the baldest possible terms ("We want to launch anything, any time, without hindrance" versus "We won’t want to ever change anything in the system once it works"). And because their vocabulary and risk assumptions differ, both groups often resort to a familiar form of trench warfare to advance their interests. The ops team attempts to safeguard the running system against the risk of change by introducing launch and change gates. For example, launch reviews may contain an explicit check for _every_ problem that has _ever_ caused an outage in the past—that could be an arbitrarily long list, with not all elements providing equal value. The dev team quickly learns how to respond. They have fewer "launches" and more "flag flips," "incremental updates," or "cherrypicks." They adopt tactics such as sharding the product so that fewer features are subject to the launch review.


### Google’s Approach to Service Management: Site Reliability Engineering

Conflict isn’t an inevitable part of offering a software service. Google has chosen to run our systems with a different approach: our Site Reliability Engineering teams focus on hiring software engineers to run our products and to create systems to accomplish the work that would otherwise be performed, often manually, by sysadmins.

What exactly is Site Reliability Engineering, as it has come to be defined at Google? My explanation is simple: SRE is what happens when you ask a software engineer to design an operations team. When I joined Google in 2003 and was tasked with running a "Production Team" of seven engineers, my entire life up to that point had been software engineering. So I designed and managed the group the way _I_ would want it to work if I worked as an SRE myself. That group has since matured to become Google’s present-day SRE team, which remains true to its origins as envisioned by a lifelong software engineer.

A primary building block of Google’s approach to service management is the composition of each SRE team. As a whole, SRE can be broken down two main categories.

50–60% are Google Software Engineers, or more precisely, people who have been hired via the standard procedure for Google Software Engineers. The other 40–50% are candidates who were very close to the Google Software Engineering qualifications (i.e., 85–99% of the skill set required), and who _in addition_ had a set of technical skills that is useful to SRE but is rare for most software engineers. By far, UNIX system internals and networking (Layer 1 to Layer 3) expertise are the two most common types of alternate technical skills we seek.

Common to all SREs is the belief in and aptitude for developing software systems to solve complex problems. Within SRE, we track the career progress of both groups closely, and have to date found no practical difference in performance between engineers from the two tracks. In fact, the somewhat diverse background of the SRE team frequently results in clever, high-quality systems that are clearly the product of the synthesis of several skill sets.

The result of our approach to hiring for SRE is that we end up with a team of people who (a) will quickly become bored by performing tasks by hand, and (b) have the skill set necessary to write software to replace their previously manual work, even when the solution is complicated. SREs also end up sharing academic and intellectual background with the rest of the development organization. Therefore, SRE is fundamentally doing work that has historically been done by an operations team, but using engineers with software expertise, and banking on the fact that these engineers are inherently both predisposed to, and have the ability to, design and implement automation with software to replace human labor.

By design, it is crucial that SRE teams are focused on engineering. Without constant engineering, operations load increases and teams will need more people just to keep pace with the workload. Eventually, a traditional ops-focused group scales linearly with service size: if the products supported by the service succeed, the operational load will grow with traffic. That means hiring more people to do the same tasks over and over again.

To avoid this fate, the team tasked with managing a service needs to code or it will drown. Therefore, Google places _a 50% cap on the aggregate "ops" work for all SREs_—tickets, on-call, manual tasks, etc. This cap ensures that the SRE team has enough time in their schedule to make the service stable and operable. This cap is an upper bound; over time, left to their own devices, the SRE team should end up with very little operational load and almost entirely engage in development tasks, because the service basically runs and repairs itself: we want systems that are _automatic_, not just _automated_. In practice, scale and new features keep SREs on their toes.

Google’s rule of thumb is that an SRE team must spend the remaining 50% of its time actually doing development. So how do we enforce that threshold? In the first place, we have to measure how SRE time is spent. With that measurement in hand, we ensure that the teams consistently spending less than 50% of their time on development work change their practices. Often this means shifting some of the operations burden back to the development team, or adding staff to the team without assigning that team additional operational responsibilities. Consciously maintaining this balance between ops and development work allows us to ensure that SREs have the bandwidth to engage in creative, autonomous engineering, while still retaining the wisdom gleaned from the operations side of running a service.

We’ve found that Google SRE’s approach to running large-scale systems has many advantages. Because SREs are directly modifying code in their pursuit of making Google’s systems run themselves, SRE teams are characterized by both rapid innovation and a large acceptance of change. Such teams are relatively inexpensive—supporting the same service with an ops-oriented team would require a significantly larger number of people. Instead, the number of SREs needed to run, maintain, and improve a system scales sublinearly with the size of the system. Finally, not only does SRE circumvent the dysfunctionality of the dev/ops split, but this structure also improves our product development teams: easy transfers between product development and SRE teams cross-train the entire group, and improve skills of developers who otherwise may have difficulty learning how to build a million-core distributed system.

Despite these net gains, the SRE model is characterized by its own distinct set of challenges. One continual challenge Google faces is hiring SREs: not only does SRE compete for the same candidates as the product development hiring pipeline, but the fact that we set the hiring bar so high in terms of both coding and system engineering skills means that our hiring pool is necessarily small. As our discipline is relatively new and unique, not much industry information exists on how to build and manage an SRE team (although hopefully this book will make strides in that direction!). And once an SRE team is in place, their potentially unorthodox approaches to service management require strong management support. For example, the decision to stop releases for the remainder of the quarter once an error budget is depleted might not be embraced by a product development team unless mandated by their management.

###### DevOps or SRE?

The term “DevOps” emerged in industry in late 2008 and as of this writing (early 2016) is still in a state of flux. Its core principles—involvement of the IT function in each phase of a system’s design and development, heavy reliance on automation versus human effort, the application of engineering practices and tools to operations tasks—are consistent with many of SRE’s principles and practices. One could view DevOps as a generalization of several core SRE principles to a wider range of organizations, management structures, and personnel. One could equivalently view SRE as a specific implementation of DevOps with some idiosyncratic extensions.

------------------------

作者简介：Benjamin Treynor Sloss coined the term "Site Reliability Engineering" and has been responsible for global operations, networking, and production engineering at Google since 2003\. As of 2016, he manages a team of approximately 4,000 software, hardware, and network engineers across the globe.

--------------------------------------------------------------------------------

via: https://www.oreilly.com/ideas/what-is-sre-site-reliability-engineering

作者：[Benjamin Treynor][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.oreilly.com/people/benjamin-treynor-sloss
[1]:https://shop.oreilly.com/product/0636920053385.do
[2]:https://shop.oreilly.com/product/0636920053385.do
[3]:https://www.oreilly.com/ideas/what-is-sre-site-reliability-engineering
[4]:https://shop.oreilly.com/product/0636920053385.do
[5]:https://shop.oreilly.com/product/0636920053385.do
[6]:https://www.oreilly.com/people/benjamin-treynor-sloss
[7]:https://pixabay.com/
[8]:https://www.oreilly.com/people/benjamin-treynor-sloss
[9]:http://shop.oreilly.com/product/0636920041528.do?intcmp=il-webops-books-videos-update-na_new_site_site_reliability_engineering_text_cta
[10]:http://conferences.oreilly.com/velocity/devops-web-performance-eu?intcmp=il-webops-confreg-update-vleu16_new_site_what_is_sre_text_cta
[11]:https://pixabay.com/
