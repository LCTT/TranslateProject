3 tips for moving your team to a microservices architecture
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/building_architecture_design.jpg?itok=lB_qYv-I)

Microservices are gaining in popularity and providing new ways for tech companies to improve their services for end users. But what impact does the shift to microservices have on team culture and morale? What issues should CTOs, developers, and project managers consider when the best technological choice is a move to microservices?

Below you’ll find key advice and insight from CTOs and project leads as they reflect on their experiences with team culture and microservices.

### You can't build successful microservices without a successful team culture

When I was working with Java developers, there was tension within the camp about who got to work on the newest and meatiest features. Our engineering leadership had decided that we would exclusively use Java to build all new microservices.

There were great reasons for this decision, but as I will explain later, such a restrictive decision come with some repercussions. Communicating the “why” of technical decisions can go a long way toward creating a culture where people feel included and informed.

When you're organizing and managing a team around microservices, it’s always challenging to balance the mood, morale, and overall culture. In most cases, the leadership needs to balance the risk of team members using new technology against the needs of the client and the business itself.

This dilemma, and many others like it, has led CTOs to ask themselves questions such as: How much freedom should I give my team when it comes to adopting new technologies? And perhaps even more importantly, how can I manage the overarching culture within my camp?

### Give every team member a chance to thrive

When the engineering leaders in the example above decided that Java was the best technology to use when building microservices, the decision was best for the company: Java is performant, and many of the senior people on the team were well-versed with it. However, not everyone on the team had experience with Java.

The problem was, our team was split into two camps: the Java guys and the JavaScript guys. As time went by and exciting new projects came up, we’d always reach for Java to get the job done. Before long, some annoyance within the JavaScript camp crept in: “Why do the Java guys always get to work on the exciting new projects while we’re left to do the mundane front-end tasks like implementing third-party analytics tools? We want a big, exciting project to work on too!”

Like most rifts, it started out small, but it grew worse over time.

The lesson I learned from that experience was to take your team’s expertise and favored technologies into account when choosing a de facto tech stack for your microservices and when adjusting your team's level of freedom to pick and choose their tools.

Sure, you need some structure, but if you’re too restrictive—or worse, blind to the desire of team members to innovate with different technologies—you may have a rift of your own to manage.

So evaluate your team closely and come up with a plan that empowers everyone. That way, every section of your team can get involved in major projects, and nobody will feel like they’re being left on the bench.

### Technology choices: stability vs. flexibility

Let’s say you hire a new junior developer who is excited about some brand new, fresh-off-the-press JavaScript framework.

That framework, while sporting some technical breakthroughs, may not have proven itself in production environments, and it probably doesn’t have great support available. CTOs have to make a difficult choice: Okaying that move for the morale of the team, or declining it to protect the company and its bottom line and to keep the project stable as the deadline approaches.

The answer depends on a lot of different factors (which also means there is no single correct answer).

### Technological freedom

“We give our team and ourselves 100% freedom in considering technology choices. We eventually identified two or three technologies not to use in the end, primarily due to not wanting to complicate our deployment story,” said [Benjamin Curtis][1], co-founder of [Honeybadger][2].

“In other words, we considered introducing new languages and new approaches into our tech stack when creating our microservices, and we actually did deploy a production microservice on a different stack at one point. [While we do generally] stick with technologies that we know in order to simplify our ops stack, we periodically revisit that decision to see if potential performance or reliability benefits would be gained by adopting a new technology, but so far we haven't made a change,” Curtis continued.

When I spoke with [Stephen Blum][3], CTO at [PubNub][4], he expressed a similar view, welcoming pretty much any technology that cuts the mustard: “We're totally open with it. We want to continue to push forward with new open source technologies that are available, and we only have a couple of constraints with the team that are very fair: [It] must run in container environment, and it has to be cost-effective.”

### High freedom, high responsibility

[Sumo Logic][5] CTO [Christian Beedgen][6] and chief architect [Stefan Zier][7] expanded on this topic, agreeing that if you’re going to give developers freedom to choose their technology, it must come with a high level of responsibility attached. “It’s really important that [whoever builds] the software takes full ownership for it. In other words, they not only build software, but they also run the software and remain responsible for the whole lifecycle.”

Beedgen and Zier recommend implementing a system that resembles a federal government system, keeping those freedoms in check by heightening responsibility: “[You need] a federal culture, really. You've got to have a system where multiple, independent teams can come together towards the greater goal. That limits the independence of the units to some degree, as they have to agree that there is potentially a federal government of some sort. But within those smaller groups, they can make as many decisions on their own as they like within guidelines established on a higher level.”

Decentralized, federal, or however you frame it, this approach to structuring microservice teams gives each team and each team member the freedom they want, without enabling anyone to pull the project apart.

However, not everyone agrees.

### Restrict technology to simplify things

[Darby Frey][8], co-founder of [Lead Honestly][9], takes a more restrictive approach to technology selection.

“At my last company we had a lot of services and a fairly small team, and one of the main things that made it work, especially for the team size that we had, was that every app was the same. Every backend service was a Ruby app,” he explained.

Frey explained that this helped simplify the lives of his team members: “[Every service has] the same testing framework, the same database backend, the same background job processing tool, et cetera. Everything was the same.

“That meant that when an engineer would jump around between apps, they weren’t having to learn a new pattern or learn a different language each time,” Frey continued, “So we're very aware and very strict about keeping that commonality.”

While Frey is sympathetic to developers wanting to introduce a new language, admitting that he “loves the idea of trying new things,” he feels that the cons still outweigh the pros.

“Having a polyglot architecture can increase the development and maintenance costs. If it's just all the same, you can focus on business value and business features and not have to be super siloed in how your services operate. I don't think everybody loves that decision, but at the end of the day, when they have to fix something on a weekend or in the middle of the night, they appreciate it,” said Frey.

### Centralized or decentralized organization

How your team is structured is also going to impact your microservices engineering culture—for better or worse.

For example, it’s common for software engineers to write the code before shipping it off to the operations team, who in turn deploy it to the servers. But when things break (and things always break!), an internal conflict occurs.

Because operation engineers don’t write the code themselves, they rarely understand problems when they first arise. As a result, they need to get in touch with those who did code it: the software engineers. So right from the get-go, you’ve got a middleman relaying messages between the problem and the team that can fix that problem.

To add an extra layer of complexity, because software engineers aren’t involved with operations, they often can’t fully appreciate how their code affects the overall operation of the platform. They learn of issues only when operations engineers complain about them.

As you can see, this is a relationship that’s destined for constant conflict.

### Navigating conflict

One way to attack this problem is by following the lead of Netflix and Amazon, both of which favor decentralized governance. Software development thought leaders James Lewis and Martin Fowler feel that decentralized governance is the way to go when it comes to microservice team organization, as they explain in a [blog post][10].

“One of the consequences of centralized governance is the tendency to standardize on single technology platforms. Experience shows that this approach is constricting—not every problem is a nail and not every solution a hammer,” the article reads. “Perhaps the apogee of decentralized governance is the ‘build it, run it’ ethos popularized by Amazon. Teams are responsible for all aspects of the software they build, including operating the software 24/7.”

Netflix, Lewis and Fowler write, is another company pushing higher levels of responsibility on development teams. They hypothesize that, because they’ll be responsible and called upon should anything go wrong later down the line, more care will be taken during the development and testing stages to ensure each microservice is in ship shape.

“These ideas are about as far away from the traditional centralized governance model as it is possible to be,” they conclude.

### Who's on weekend pager duty?

When considering a centralized or decentralized culture, think about how it impacts your team members when problems inevitably crop up at inopportune times. A decentralized system implies that each decentralized team takes responsibility for one service or one set of services. But that also creates a problem: Silos.

That’s one reason why Lead Honestly's Frey isn’t a proponent of the concept of decentralized governance.

“The pattern of ‘a single team is responsible for a particular service’ is something you see a lot in microservice architectures. We don't do that, for a couple of reasons. The primary business reason is that we want teams that are responsible not for specific code but for customer-facing features. A team might be responsible for order processing, so that will touch multiple code bases but the end result for the business is that there is one team that owns the whole thing end to end, so there are fewer cracks for things to fall through,” Frey explained.

The other main reason, he continued, is that developers can take more ownership of the overall project: “They can actually think about [the project] holistically.”

Nathan Peck, developer advocate for container services at Amazon Web Services, [explained this problem in more depth][11]. In essence, when you separate the software engineers and the operations engineers, you make life harder for your team whenever an issue arises with the code—which is bad news for end users, too.

But does decentralization need to lead to separation and siloization?

Peck explained that his solution lies in [DevOps][12], a model aimed at tightening the feedback loop by bringing these two teams closer together, strengthening team culture and communication in the process. Peck describes this as the “you build it, you run it” approach.

However, that doesn’t mean teams need to get siloed or distanced away from partaking in certain tasks, as Frey suggests might happen.

“One of the most powerful approaches to decentralized governance is to build a mindset of ‘DevOps,’” Peck wrote. “[With this approach], engineers are involved in all parts of the software pipeline: writing code, building it, deploying the resulting product, and operating and monitoring it in production. The DevOps way contrasts with the older model of separating development teams from operations teams by having development teams ship code ‘over the wall’ to operations teams who were then responsible to run it and maintain it.”

DevOps, as [Armory][13] CTO [Isaac Mosquera][14] explained, is an agile software development framework and culture that’s gaining traction thanks to—well, pretty much everything that Peck said.

Interestingly, Mosquera feels that this approach actually flies in the face of [Conway’s Law][15]:

_" Organizations which design systems ... are constrained to produce designs which are copies of the communication structures of these organizations." — M. Conway_

“Instead of communication driving software design, now software architecture drives communication. Not only do teams operate and organize differently, but it requires a new set of tooling and process to support this type of architecture; i.e., DevOps,” Mosquera explained.

[Chris McFadden][16], VP of engineering at [SparkPost][17], offers an interesting example that might be worth following. At SparkPost, you’ll find decentralized governance—but you won’t find a one-team-per-service culture.

“The team that is developing these microservices started off as one team, but they’re now split up into three teams under the same larger group. Each team has some level of responsibility around certain domains and certain expertise, but the ownership of these services is not restricted to any one of these teams,” McFadden explained.

This approach, McFadden continued, allows any team to work on anything from new features to bug fixes to production issues relating to any of those services. There’s total flexibility and not a silo in sight.

“It allows [the teams to be] a little more flexible both in terms of new product development as well, just because you're not getting too restricted and that's based on our size as a company and as an engineering team. We really need to retain some flexibility,” he said.

However, size might matter here. McFadden admitted that if SparkPost was a lot larger, “then it would make more sense to have a single, larger team own one of those microservices.”

“[It's] better, I think, to have a little bit more broad responsibility for these services and it gives you a little more flexibility. At least that works for us at this time, where we are as an organization,” he said.

### A successful microservices engineering culture is a balancing act

When it comes to technology, freedom—with responsibility—looks to be the most rewarding path. Team members with differing technological preferences will come and go, while new challenges may require you to ditch technologies that have previously served you well. Software development is constantly in flux, so you’ll need to continually balance the needs of your team are new devices, technologies, and clients emerge.

As for structuring your teams, a decentralized yet un-siloed approach that leverages DevOps and instills a “you build it, you run it” mentality seems to be popular, although other schools of thought do exist. As usual, you’re going to have to experiment to see what suits your team best.

Here’s a quick recap on how to ensure your team culture meshes well with a microservices architecture:

  * **Be sustainable, yet flexible** : Balance sustainability without forgetting about flexibility and the need for your team to be innovative when the right opportunity comes along. However, there’s a distinct difference of opinion over how you should achieve that balance.

  * **Give equal opportunities** : Don’t favor one section of your team over another. If you’re going to impose restrictions, make sure it’s not going to fundamentally alienate team members from the get-go. Think about how your product roadmap is shaping up and forecast how it will be built and who’s going to do the work.

  * **Structure your team to be agile, yet responsible** : Decentralized governance and agile development is the flavor of the day for a good reason, but don’t forget to install a sense of responsibility within each team.




--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/microservices-team-challenges

作者：[Jake Lumetta][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jakelumetta
[1]:https://twitter.com/stympy?lang=en
[2]:https://www.honeybadger.io/
[3]:https://twitter.com/stephenlb
[4]:https://www.pubnub.com/
[5]:http://sumologic.com/
[6]:https://twitter.com/raychaser
[7]:https://twitter.com/stefanzier
[8]:https://twitter.com/darbyfrey
[9]:https://leadhonestly.com/
[10]:https://martinfowler.com/articles/microservices.html#ProductsNotProjects
[11]:https://medium.com/@nathankpeck/microservice-principles-decentralized-governance-4cdbde2ff6ca
[12]:https://opensource.com/resources/devops
[13]:http://armory.io/
[14]:https://twitter.com/imosquera
[15]:https://en.wikipedia.org/wiki/Conway%27s_law
[16]:https://twitter.com/cristoirmac
[17]:https://www.sparkpost.com/
