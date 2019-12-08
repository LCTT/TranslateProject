[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 counterintuitive takeaways from 10 years of DevOpsDays)
[#]: via: (https://opensource.com/article/19/9/counterintuitive-takeaways-devopsdays)
[#]: author: (KrisBuytaert https://opensource.com/users/krisbuytaert)

10 counterintuitive takeaways from 10 years of DevOpsDays
======
DevOps veteran Kris Buytaert, who was there at the founding of
DevOpsDays, shares lessons learned that might surprise you.
![gears and lightbulb to represent innovation][1]

Ten years ago, we started an accidental journey. We brought together some of our good friends in Ghent, Belgium, to discuss our agile, open source, and early cloud experiences. [Patrick Debois][2] coined the event #DevOpsdays after [John Allspaw][3] and [Paul Hammond][4]'s talk from Velocity 2009, "10+ deploys per day: dev and ops cooperation at Flickr" (which is well [worth watching][5]).

![Celebrate 10 years of DevOps Days where it all began: Ghent][6]

Now, 10 years later, the world is different. DevOps is everywhere, right? Or is it really? I have been going to [DevOpsDays][7] events since that founding, and I have learned quite a lot from my experience. Here are 10 takeaways I hope you can learn from as well.

### 1\. There is no such thing as a DevOps engineer.

Plenty of people now have "DevOps engineer" as a job title, and lots of them don't like the title. The title gives the false impression that DevOps is a job that a single "DevOp" can achieve. Most often, a DevOps engineer is a Linux engineer who, if they're lucky, does a little bit of automation. When recruiters start looking for a DevOps engineer, applicants need to ask themselves the right questions, starting with: "What does the company actually need from an applicant?" Are they looking for a build engineer, a senior developer who understands non-functional requirements, a senior operations person who can automate things, or something else entirely? Most often, what they are really looking for is someone who will turn their eyes away from the lack of agile principles in practice.

In an organization with a lot of DevOps engineers, it very often means that no DevOps is happening. A DevOps title is a sign of a new silo, and an applicant could make good money and learn new skills on the job, but they will not be "doing DevOps."

### 2\. There is no such thing as a DevOps team.

In the early days, we often said DevOps is about removing the walls of confusion between different teams, developers, and ops, about breaking down the silos. Yet somewhere along the journey, we saw a new phenomenon: the rise of the DevOps team.

"DevOps team" sounds like a new practice, but the inconsistencies across organizations are clear. In one organization, it's the team in charge of tooling, in another, it literally is the silo between the dev and the ops teams—a silo that creates more confusion, more frustration, and less collaboration. In the best of cases, it occasionally is the cross-functional team with end-to-end responsibility for the service they are building. Those teams typically prefer not to be called a DevOps team.

Calling a team "DevOps," I have found, will likely hinder the outcomes you're aiming for with DevOps.

### 3\. There is no such thing as a DevOps project.

A "project" by nature is finite. It is something you build, deliver, and then move on from. A consistent theme from 10 years of talks is that DevOps is about continual improvement, and continual improvement is never complete. Similarly, the output of these supposed projects are long-term _services_, and a service is something you build, deliver, and keep running.

It's only after we think about how services extend beyond projects that we start to see the things that are easily forgotten: non-functional requirements (NFRs). NFRs include functionality that does not fit neatly into a specific behavior. NFRs define how we judge the operation of a system. They often include all the "-ilities" you hear around DevOps: securability, reliability, usability, maintainability, and scalability. All of which are essential to the business outcome.

There is risk in the lack of empathy needed to think in short-term projects. When you have moved on to another project, you won't be as concerned with NFRs, since you're busy with a new challenge and it's someone else's problem now. However, when you run a service, you do care, and it is in your best interest to reduce the friction to keep things running smoothly.

### 4\. There is no such thing as a DevOps tool.

While many vendors will try to [sell you one][8], even the ultimate one, DevOps is not about tooling. It is about humans and collaboration. Some tools help people collaborate; often they give people with different backgrounds a shared terminology and a shared ecosystem; but equally often, the popular tools work against collaboration.

A tool-focused culture is one that can isolate people more than it helps them collaborate, as people become obsessed with their toolchain and distance themselves from those not using it. While technically, they might be awesome tools and help us in some areas, a bunch of the new, so-called DevOps tools have widened the gap between different groups. For instance, I often hear "it works in my container" is a statement that developers make to define that "their" work is done. Containers alone do not solve the collaboration challenges needed to run applications effectively. We can't let tools become the new silos.

### 5\. There is no such thing as DevOps "certified."

No multiple-choice test can confirm that you, as an individual, collaborate with your colleagues. Organizations that offer certifications may have the most excellent advice on technology and even principles of collaboration, but a certificate cannot show that someone is good at DevOps.

It is unfortunate that management teams require certificates in something we can't be certified in. Be educated in your favorite software, hardware, or cloud. Attend a local university and read the books that will educate you, such as those by [Deming][9], [Forsgren][10], [Humble][11], and [others][12]. But don't expect to become excellent at DevOps from a certification; it's more important to work with your coworkers.

### 6\. There is no such thing as a DevOps pipeline.

"Is the DevOps done yet?" "The DevOps pipeline is running." "The DevOps pipeline is broken." Whenever I hear these statements, I wonder how we got to such a term. Did we just rebrand a delivery pipeline, or is it because some companies are starting DevOps teams that manage the infrastructure for the pipeline? Or is it because the developers call the ops when the pipeline is broken?

While introducing continuous integration and continuous delivery (CI/CD) principles has a huge impact on an organization, the "DevOps pipeline" term is used in a way that I see as blame-inducing. Ops teams are at fault when the dev's pipeline is broken. Dev teams don't worry about failing pipelines as long as they wrote tests.

The concept is also misleading. Pipelines are aligned to a service or application, not to all of DevOps. When we generalize pipelines, we run the risk of encouraging silos between teams, which will leave us far from the goals of DevOps.

What I do recommend is what I've seen in hundreds of organizations across the world: Call the pipeline for Application X the Application X pipeline. This way, we'll know what application has trouble getting through its tests, getting deployed, or getting updated. We will also know the team responsible for Application X, which will be busy trying to fix it, maybe with some help from their ops friends.

### 7\. There is no such thing as standard DevOps.

The toughest news from thousands of DevOps stories across the globe is standardization. Just like we can't certify people, there is also no-one-size-fits-all standard; every organization is on a different step in their journey, a different journey than other organizations. There is no magic recipe in which you implement a number of tools, set up a number of automated flows, and suddenly you are DevOps.

A standard DevOps would mean that you implement a recipe, and suddenly the organization starts to collaborate, drops office politics, improves quality, increases morale, and is on the fast track to higher earnings with fewer outages.

DevOps is better understood as a body of practice similar to [ITIL][13]. Remember the L in ITIL stands for Library, a library with best practices to cherrypick from—not an instruction manual. Lots of the hate against ITIL came from those (failed) implementations that took the library as a detailed instruction manual. Standardized DevOps will bear the same fruits.

### 8\. There is no such thing as DevSecOps.

From the very beginning in 2009, we started DevOpsDays as a place to invite everybody. Sure, the initial battleground was visible with developers and operations people, but everybody was included: database administrators, testers, business, finance, and, yes, also security. Even as early as 2012, we were giving talks at [OWASP][14] meetups, evangelizing what we did. We joked that the "s" in DevOps stood for security, just like the "S" in HTTPS.

DevOps is inherently about security. I have found the greatest success in organizational adoption of continuous delivery comes from security teams. CD is a security requirement: you _need_ to have the ability to deploy whenever you want so that you can deploy and upgrade when you need to for business or security reasons.

On the one hand, it is sad that we have to invent a word to get the security folks included. On the other hand, it's good to have the discussion again. Fundamentally, there is no difference between DevSecOps and DevOps. Security has always been part of the development and operations mindset. I'll call it DevSecOps if that helps, but it's okay to just call it DevOps.

### 9\. There is no such thing as a finished DevOps transition.

Have you ever seen an organization that said, "We'll do the DevOps project in Q4, and by next year we'll be DevOps"—and succeeded? Neither have I.

Software delivery never stops, technology always changes, maintenance will be required, and—ideally—the DevOps mindset stays around. Once you have improved your delivery approach, you will want to keep improving. It won't be because your application is feature-complete or that the ecosystem it lives in has stopped evolving. It will be because the quality of your work improves exponentially, and many experience a similar improvement in their quality of life. DevOps will continue long after someone calls the effort "done."

### 10\. There is such a thing as DevOops.

Unfortunately, many people have not caught onto the importance of collaboration. They, often unintentionally, build silos, hold tools in higher regard than practices, require certification, and believe all the other nine takeaways. And they will struggle to succeed in a way that I like to call DevOops.

To DevOops is to hold the tools and the silos in higher regard than the principles of DevOps that will improve your work. May we all be more DevOpsy and less DevOopsy.

### The main takeaway

Throughout the 10 years of DevOpsDays events, many thousands of people around the world have learned from each other in a collaborative and open environment. Some concepts that I find to be counter to the goals of DevOps and agile are popular. Stay focused on making your services run well at your company, and learn along the way. That won't mean a copy-and-paste effort of tools or dashboards. It will mean focusing on continually improving in every way.

Good luck, and I hope to see you at the 10 year celebration at [DevOpsDays Ghent October 29-30th][15]. We have a great line up of speakers, including: 

  * [Patrick Debois][2] will talk about [Connect all the business pipelines][16]
  * [Bryan Liles][17] on [Sysadmins to DevOps: Where we came from and where we are going][18]
  * [Bridget Kromhout][19] on [distributed DevOps][20]
  * [Ant Stanley][21] on [how serverless design patterns change nothing [for DevOps]][22]
  * [Julie Gundersen][23] on [being an Advocate for DevOps][24]



See you soon, back where it all began.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/counterintuitive-takeaways-devopsdays

作者：[KrisBuytaert][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/krisbuytaert
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_lightbulb_gears_devops_ansible.png?itok=TSbmp3_M (gears and lightbulb to represent innovation)
[2]: https://twitter.com/patrickdebois
[3]: https://twitter.com/allspaw
[4]: https://twitter.com/ph
[5]: https://www.youtube.com/watch?v=LdOe18KhtT4
[6]: https://opensource.com/sites/default/files/uploads/devopsdays-ghent-2019-10year.png (Celebrate 10 years of DevOps Days where it all began: Ghent)
[7]: https://devopsdays.org/
[8]: https://opensource.com/article/19/6/you-cant-buy-devops
[9]: https://mitpress.mit.edu/books/out-crisis
[10]: https://nicolefv.com/book
[11]: https://continuousdelivery.com/about/
[12]: https://itrevolution.com/devops-books/
[13]: https://en.wikipedia.org/wiki/ITIL
[14]: https://www.owasp.org
[15]: https://devopsdays.org/events/2019-ghent/registration
[16]: https://devopsdays.org/events/2019-ghent/program/patrick-debois/
[17]: https://twitter.com/bryanl
[18]: https://devopsdays.org/events/2019-ghent/program/bryan-liles/
[19]: https://twitter.com/bridgetkromhout
[20]: https://devopsdays.org/events/2019-ghent/program/bridget-kromhout/
[21]: https://twitter.com/IamStan
[22]: https://devopsdays.org/events/2019-ghent/program/ant-stanley/
[23]: https://twitter.com/Julie_Gund
[24]: https://devopsdays.org/events/2019-ghent/program/julie-gunderson/
